#!/bin/sh

# This script converts binary files (u-boot.bin) into so called
# bootstrap records that are accepted by Motorola's MC9328MX1/L
# (a.k.a. DragaonBall i.MX) in "Bootstrap Mode"
# 
# The code for the SynchFlash programming routines is taken from
# Bootloader\Bin\SyncFlash\programBoot_b.txt contained in
# Motorolas LINUX_BSP_0_3_8.tar.gz 
# 
# The script could easily extended for AMD flash routines.
#
# 2004-06-23	-	steven.scholz@imc-berlin.de

#################################################################################
# From the posting to the U-Boot-Users mailing list, 23 Jun 2004:
# ===============================================================
# I just hacked a simple script that converts u-boot.bin into a text file 
# containg processor init code, SynchFlash programming code and U-Boot data in 
# form of so called b-records.
# 
# This can be used to programm U-Boot into (Synch)Flash using the Bootstrap 
# Mode of the MC9328MX1/L
# 
# 0AFE1F3410202E2E2E000000002073756363656564/
# 0AFE1F44102E0A0000206661696C656420210A0000/
# 0AFE100000
# ...
# MX1ADS Sync-flash Programming Utility v0.5 2002/08/21
# 
# Source address (stored in 0x0AFE0000): 0x0A000000
# Target address (stored in 0x0AFE0004): 0x0C000000
# Size           (stored in 0x0AFE0008): 0x0001A320
# 
# Press any key to start programming ...
# Erasing ...
# Blank checking ...
# Programming ...
# Verifying flash ... succeed.
# 
# Programming finished.
# 
# So no need for a BDI2000 anymore... ;-)
# 
# This is working on my MX1ADS eval board. Hope this could be useful for 
# someone.
#################################################################################

if [ "$#" -lt 1 -o "$#" -gt 2 ] ; then
    echo "Usage: $0 infile [outfile]" >&2
    echo "       $0 u-boot.bin [u-boot.brec]" >&2
    exit 1
fi

if [ "$#" -ge 1 ] ; then
    INFILE=$1
fi

if [ ! -f $INFILE ] ; then
    echo "Error: file '$INFILE' does not exist." >&2
    exit 1
fi

FILESIZE=`filesize $INFILE`

output_init()
{
echo "\
********************************************
* Initialize I/O Pad Driving Strength      *
********************************************
0021B80CC4000003AB
********************************************
* Initialize SDRAM                         *
********************************************
00221000C492120200   ; pre-charge command
08200000E4   ; special read

00221000C4A2120200   ; auto-refresh command
08000000E4   ; 8 special read
08000000E4   ; 8 special read
08000000E4   ; 8 special read
08000000E4   ; 8 special read
08000000E4   ; 8 special read
08000000E4   ; 8 special read
08000000E4   ; 8 special read
08000000E4   ; 8 special read

00221000C4B2120200   ; set mode register
08111800E4   ; special read

00221000C482124200   ; set normal mode
"
}

output_uboot()
{
echo "\
********************************************
* U-Boot image as bootstrap records        *
*   will be stored in SDRAM at 0x0A000000  *
********************************************
"

cat $INFILE | \
hexdump -v -e "\"0A0%05.5_ax10\" 16/1 \"%02x\"\"\r\n\"" | \
tr [:lower:] [:upper:]
}

output_flashprog()
{
echo "\
********************************************
* Address of arguments to flashProg        *
* ---------------------------------------- *
* Source      : 0x0A000000                 *
* Destination : 0x0C000000                 *"

# get the real size of the U-Boot image
printf "* Size        : 0x%08X                 *\r\n" $FILESIZE
printf "********************************************\r\n"
printf "0AFE0000CC0A0000000C000000%08X\r\n" $FILESIZE

#;0AFE0000CC0A0000000C00000000006000

echo "\
********************************************
* Flash Program                            *
********************************************
0AFE10001008D09FE5AC0000EA00F0A0E1A42DFE0A
0AFE1010100080FE0A0DC0A0E100D82DE904B04CE2
0AFE1020109820A0E318309FE5003093E5033082E0
0AFE103010003093E5013003E2FF3003E20300A0E1
0AFE10401000A81BE9A01DFE0A0DC0A0E100D82DE9
0AFE10501004B04CE204D04DE20030A0E10D304BE5
0AFE1060109820A0E330309FE5003093E5033082E0
0AFE107010003093E5013903E2000053E3F7FFFF0A
0AFE1080104020A0E310309FE5003093E5032082E0
0AFE1090100D305BE5003082E500A81BE9A01DFE0A
0AFE10A0100DC0A0E100D82DE904B04CE20000A0E1
0AFE10B010D7FFFFEB0030A0E1FF3003E2000053E3
0AFE10C010FAFFFF0A10309FE5003093E5003093E5
0AFE10D010FF3003E20300A0E100A81BE9A01DFE0A
0AFE10E0100DC0A0E100D82DE904B04CE204D04DE2
0AFE10F0100030A0E10D304BE50D305BE52332A0E1
0AFE1100100E304BE50E305BE5090053E30300009A
0AFE1110100E305BE5373083E20E304BE5020000EA
0AFE1120100E305BE5303083E20E304BE50E305BE5
0AFE1130100300A0E1C3FFFFEB0D305BE50F3003E2
0AFE1140100E304BE50E305BE5090053E30300009A
0AFE1150100E305BE5373083E20E304BE5020000EA
0AFE1160100E305BE5303083E20E304BE50E305BE5
0AFE1170100300A0E1B3FFFFEB00A81BE90DC0A0E1
0AFE11801000D82DE904B04CE21CD04DE210000BE5
0AFE11901014100BE518200BE588009FE5E50200EB
0AFE11A01010301BE51C300BE514301BE520300BE5
0AFE11B0100030A0E324300BE524201BE518301BE5
0AFE11C010030052E10000003A120000EA1C004BE2
0AFE11D010002090E520104BE2003091E500C093E5
0AFE11E010043083E2003081E5003092E5042082E2
0AFE11F010002080E50C0053E10200000A0030A0E3
0AFE12001028300BE5050000EA24301BE5043083E2
0AFE12101024300BE5E7FFFFEA0130A0E328300BE5
0AFE12201028001BE500A81BE9E81EFE0A0DC0A0E1
0AFE12301000D82DE904B04CE214D04DE210000BE5
0AFE12401014100BE56C009FE5BA0200EB10301BE5
0AFE12501018300BE50030A0E31C300BE51C201BE5
0AFE12601014301BE5030052E10000003A0D0000EA
0AFE12701018304BE2002093E5001092E5042082E2
0AFE128010002083E5010071E30200000A0030A0E3
0AFE12901020300BE5050000EA1C301BE5043083E2
0AFE12A0101C300BE5ECFFFFEA0130A0E320300BE5
0AFE12B01020001BE500A81BE9001FFE0A0DC0A0E1
0AFE12C01000D82DE904B04CE224D04DE20130A0E3
0AFE12D01024300BE5A4229FE58139A0E3023A83E2
0AFE12E010003082E59820A0E390329FE5003093E5
0AFE12F010033082E0003093E5023903E2000053E3
0AFE1300100300001A74229FE58139A0E3033A83E2
0AFE131010003082E568029FE5860200EBAF36A0E3
0AFE1320100E3883E2003093E510300BE554029FE5
0AFE133010800200EB10301BE5233CA0E1FF3003E2
0AFE1340100300A0E165FFFFEB10301BE52338A0E1
0AFE135010FF3003E20300A0E160FFFFEB10301BE5
0AFE1360102334A0E1FF3003E20300A0E15BFFFFEB
0AFE13701010305BE50300A0E158FFFFEB0A00A0E3
0AFE13801030FFFFEB0D00A0E32EFFFFEBAF36A0E3
0AFE1390100E3883E2043083E2003093E514300BE5
0AFE13A010E4019FE5630200EB14301BE5233CA0E1
0AFE13B010FF3003E20300A0E148FFFFEB14301BE5
0AFE13C0102338A0E1FF3003E20300A0E143FFFFEB
0AFE13D01014301BE52334A0E1FF3003E20300A0E1
0AFE13E0103EFFFFEB14305BE50300A0E13BFFFFEB
0AFE13F0100A00A0E313FFFFEB0D00A0E311FFFFEB
0AFE140010AF36A0E30E3883E2083083E2003093E5
0AFE14101018300BE574019FE5460200EB18301BE5
0AFE142010233CA0E1FF3003E20300A0E12BFFFFEB
0AFE14301018301BE52338A0E1FF3003E20300A0E1
0AFE14401026FFFFEB18301BE52334A0E1FF3003E2
0AFE1450100300A0E121FFFFEB18305BE50300A0E1
0AFE1460101EFFFFEB0A00A0E3F6FEFFEB0D00A0E3
0AFE147010F4FEFFEBE6FEFFEB0030A0E1FF3003E2
0AFE148010000053E30000001A020000EA03FFFFEB
0AFE1490102D004BE5F6FFFFEAF4009FE5250200EB
0AFE14A010FEFEFFEB2D004BE5CD0000EBC00000EB
0AFE14B010E0009FE51F0200EB18301BE528300BE5
0AFE14C01014301BE52C300BE52C001BE5100100EB
0AFE14D01028301BE5013643E228300BE52C301BE5
0AFE14E010013683E22C300BE528301BE5000053E3
0AFE14F010F4FFFFCAAE0000EB14001BE518101BE5
0AFE15001049FFFFEB0030A0E1FF3003E2000053E3
0AFE151010E6FFFF0A80009FE5060200EB10001BE5
0AFE15201014101BE518201BE5D00000EB10001BE5
0AFE15301014101BE518201BE50FFFFFEB0030A0E1
0AFE154010FF3003E2000053E30200000A4C009FE5
0AFE155010F80100EB010000EA44009FE5F50100EB
0AFE156010930000EB3C009FE5F20100EB0000A0E3
0AFE157010A4FEFFEB0030A0E30300A0E100A81BE9
0AFE158010A01DFE0AA41DFE0AE01DFE0A0C1EFE0A
0AFE159010381EFE0A641EFE0A181FFE0A281FFE0A
0AFE15A0103C1FFE0A481FFE0AB41EFE0A0DC0A0E1
0AFE15B01000D82DE904B04CE204D04DE210000BE5
0AFE15C01010301BE5013043E210300BE5010073E3
0AFE15D010FAFFFF1A00A81BE90DC0A0E100D82DE9
0AFE15E01004B04CE208D04DE210000BE510301BE5
0AFE15F01014300BE514301BE50300A0E100A81BE9
0AFE1600100DC0A0E100D82DE904B04CE204D04DE2
0AFE1610102228A0E3012A82E2042082E2E134A0E3
0AFE162010023883E2033C83E2003082E50333A0E3
0AFE163010053983E2003093E510300BE500A81BE9
0AFE1640100DC0A0E100D82DE904B04CE204D04DE2
0AFE1650102228A0E3012A82E2042082E29134A0E3
0AFE166010023883E2033C83E2003082E5C136A0E3
0AFE167010003093E510300BE52228A0E3012A82E2
0AFE168010042082E2E134A0E3023883E2033C83E2
0AFE169010003082E50333A0E3073983E20020A0E3
0AFE16A010002083E52228A0E3012A82E2042082E2
0AFE16B0108134A0E3023883E2033C83E2003082E5
0AFE16C0100333A0E3003093E510300BE5CBFFFFEB
0AFE16D01010301BE50300A0E100A81BE90DC0A0E1
0AFE16E01000D82DE904B04CE208D04DE2D3FFFFEB
0AFE16F0100030A0E110300BE510301BE5023503E2
0AFE170010000053E30500000A10301BE5073703E2
0AFE171010000053E30100000A10001BE5ADFFFFEB
0AFE17201010301BE5803003E2000053E30500000A
0AFE17301010301BE51C3003E2000053E30100000A
0AFE17401010001BE5A3FFFFEB10201BE50235A0E3
0AFE175010803083E2030052E10200001A0130A0E3
0AFE17601014300BE5010000EA0030A0E314300BE5
0AFE17701014001BE500A81BE90DC0A0E100D82DE9
0AFE17801004B04CE204D04DE22228A0E3012A82E2
0AFE179010042082E29134A0E3023883E2033C83E2
0AFE17A010003082E5C136A0E3003093E510300BE5
0AFE17B01000A81BE90DC0A0E100D82DE904B04CE2
0AFE17C010ECFFFFEB2228A0E3012A82E2042082E2
0AFE17D0108134A0E3023883E2033C83E2003082E5
0AFE17E01000A81BE90DC0A0E100D82DE904B04CE2
0AFE17F01004D04DE22228A0E3012A82E2042082E2
0AFE1800102238A0E3013A83E2043083E2003093E5
0AFE181010023183E3003082E52228A0E3012A82E2
0AFE1820102238A0E3013A83E2003093E5023183E3
0AFE183010003082E5FA0FA0E35BFFFFEB2228A0E3
0AFE184010012A82E2042082E2B134A0E3023883E2
0AFE185010033C83E2003082E50333A0E3233983E2
0AFE186010033B83E2003093E510300BE500A81BE9
0AFE1870100DC0A0E100D82DE904B04CE21CD04DE2
0AFE18801010000BE514100BE518200BE50030A0E3
0AFE1890101C300BE51C201BE518301BE5030052E1
0AFE18A0100000003A190000EAB2FFFFEB2228A0E3
0AFE18B010012A82E2042082E2F134A0E3023883E2
0AFE18C010033C83E2003082E514201BE51C301BE5
0AFE18D010031082E010201BE51C301BE5033082E0
0AFE18E010003093E5003081E57BFFFFEB0030A0E1
0AFE18F010FF3003E2000053E3FAFFFF0AACFFFFEB
0AFE1900101C301BE5043083E21C300BE5E0FFFFEA
0AFE19101000A81BE90DC0A0E100D82DE904B04CE2
0AFE1920100CD04DE210000BE52228A0E3012A82E2
0AFE193010042082E28134A0E3023883E2033C83E2
0AFE194010003082E510301BE5003093E514300BE5
0AFE1950102228A0E3012A82E2042082E29134A0E3
0AFE196010023883E2033C83E2003082E510301BE5
0AFE197010003093E518300BE52228A0E3012A82E2
0AFE198010042082E2E134A0E3023883E2033C83E2
0AFE199010003082E50229A0E310301BE5032082E0
0AFE19A0100030A0E3003082E52228A0E3012A82E2
0AFE19B010042082E28134A0E3023883E2033C83E2
0AFE19C010003082E510201BE50D3AA0E3D03083E2
0AFE19D010033883E1003082E53FFFFFEB0030A0E1
0AFE19E010FF3003E2000053E3FAFFFF0A70FFFFEB
0AFE19F01000A81BE90DC0A0E100D82DE904B04CE2
0AFE1A00105CFFFFEB2228A0E3012A82E2042082E2
0AFE1A1010E134A0E3023883E2033C83E2003082E5
0AFE1A20100333A0E3033983E20020A0E3002083E5
0AFE1A30102228A0E3012A82E2042082E28134A0E3
0AFE1A4010023883E2033C83E2003082E50323A0E3
0AFE1A5010032982E20339A0E3C03083E2033883E1
0AFE1A6010003082E500A81BE90DC0A0E100D82DE9
0AFE1A701004B04CE23FFFFFEB2228A0E3012A82E2
0AFE1A8010042082E2E134A0E3023883E2033C83E2
0AFE1A9010003082E50333A0E30A3983E20020A0E3
0AFE1AA010002083E52228A0E3012A82E2042082E2
0AFE1AB0108134A0E3023883E2033C83E2003082E5
0AFE1AC0100323A0E30A2982E20339A0E3C03083E2
0AFE1AD010033883E1003082E500A81BE90DC0A0E1
0AFE1AE01000D82DE904B04CE28729A0E3222E82E2
0AFE1AF0108739A0E3223E83E2003093E51E3CC3E3
0AFE1B0010003082E58729A0E38E2F82E28739A0E3
0AFE1B10108E3F83E2003093E51E3CC3E3003082E5
0AFE1B20108139A0E3823D83E20520A0E3002083E5
0AFE1B30108129A0E3822D82E2042082E20139A0E3
0AFE1B4010273083E2003082E58139A0E3823D83E2
0AFE1B50100C3083E20120A0E3002083E58129A0E3
0AFE1B6010822D82E2102082E22A3DA0E3013083E2
0AFE1B7010003082E58139A0E3823D83E2243083E2
0AFE1B80100F20A0E3002083E58139A0E3823D83E2
0AFE1B9010283083E28A20A0E3002083E58139A0E3
0AFE1BA010823D83E22C3083E20820A0E3002083E5
0AFE1BB01000A81BE90DC0A0E100D82DE904B04CE2
0AFE1BC0108139A0E3823D83E2183083E2003093E5
0AFE1BD010013003E2FF3003E20300A0E100A81BE9
0AFE1BE0100DC0A0E100D82DE904B04CE204D04DE2
0AFE1BF0100030A0E10D304BE58139A0E3823D83E2
0AFE1C0010183083E2003093E5013903E2000053E3
0AFE1C1010F8FFFF0A8139A0E3813D83E20D205BE5
0AFE1C2010002083E50D305BE50A0053E30A00001A
0AFE1C30108139A0E3823D83E2183083E2003093E5
0AFE1C4010013903E2000053E3F8FFFF0A8139A0E3
0AFE1C5010813D83E20D20A0E3002083E500A81BE9
0AFE1C60100DC0A0E100D82DE904B04CE20000A0E1
0AFE1C7010CFFFFFEB0030A0E1FF3003E2000053E3
0AFE1C8010FAFFFF0A8139A0E3023A83E2003093E5
0AFE1C9010FF3003E20300A0E100A81BE90DC0A0E1
0AFE1CA01000D82DE904B04CE204D04DE20030A0E1
0AFE1CB0100D304BE50D305BE52332A0E10E304BE5
0AFE1CC0100E305BE5090053E30300009A0E305BE5
0AFE1CD010373083E20E304BE5020000EA0E305BE5
0AFE1CE010303083E20E304BE50E305BE50300A0E1
0AFE1CF010BAFFFFEB0D305BE50F3003E20E304BE5
0AFE1D00100E305BE5090053E30300009A0E305BE5
0AFE1D1010373083E20E304BE5020000EA0E305BE5
0AFE1D2010303083E20E304BE50E305BE50300A0E1
0AFE1D3010AAFFFFEB00A81BE90DC0A0E100D82DE9
0AFE1D401004B04CE204D04DE210000BE510301BE5
0AFE1D50100030D3E5000053E30000001A080000EA
0AFE1D601010104BE2003091E50320A0E10020D2E5
0AFE1D7010013083E2003081E50200A0E197FFFFEB
0AFE1D8008F1FFFFEA00A81BE9
0AFE1DA4100A0D4D58314144532053796E632D666C
0AFE1DB4106173682050726F6772616D6D696E6720
0AFE1DC4105574696C6974792076302E3520323030
0AFE1DD410322F30382F32310A0D000000536F7572
0AFE1DE41063652061646472657373202873746F72
0AFE1DF410656420696E2030783041464530303030
0AFE1E0410293A2030780000005461726765742061
0AFE1E1410646472657373202873746F7265642069
0AFE1E24106E2030783041464530303034293A2030
0AFE1E34107800000053697A652020202020202020
0AFE1E44102020202873746F72656420696E203078
0AFE1E54103041464530303038293A203078000000
0AFE1E6410507265737320616E79206B657920746F
0AFE1E74102073746172742070726F6772616D6D69
0AFE1E84106E67202E2E2E00000A0D45726173696E
0AFE1E94106720666C617368202E2E2E000A0D5072
0AFE1EA4106F6772616D6D696E67202E2E2E000000
0AFE1EB4100A0D50726F6772616D6D696E67206669
0AFE1EC4106E69736865642E0A0D50726573732027
0AFE1ED410612720746F20636F6E74696E7565202E
0AFE1EE4102E2E2E000A0D566572696679696E6720
0AFE1EF410666C617368202E2E2E0000000A0D426C
0AFE1F0410616E6B20636865636B696E67202E2E2E
0AFE1F1410000000000A45726173696E67202E2E2E
0AFE1F2410000000000A50726F6772616D6D696E67
0AFE1F3410202E2E2E000000002073756363656564
0AFE1F44102E0A0000206661696C656420210A0000
0AFE100000
"
}

#########################################################

if [ "$#" -eq 2 ] ; then
    output_init > $2
    output_uboot >> $2
    output_flashprog >> $2
else
    output_init;
    output_uboot;
    output_flashprog;
fi
