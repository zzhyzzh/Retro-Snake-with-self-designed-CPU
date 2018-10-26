<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="kintex7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_5(31:0)" />
        <signal name="B(31:0)" />
        <signal name="A(31:0)" />
        <signal name="ALU_operation(2:0)" />
        <signal name="XLXN_12(31:0)" />
        <signal name="XLXN_14(31:0)" />
        <signal name="XLXN_15(31:0)" />
        <signal name="XLXN_16(31:0)" />
        <signal name="S(31:0)" />
        <signal name="N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,Co" />
        <signal name="res(31:0)" />
        <signal name="zero" />
        <signal name="overflow" />
        <signal name="N0" />
        <signal name="ALU_operation(2)" />
        <signal name="XLXN_29(31:0)" />
        <signal name="XLXN_30(31:0)" />
        <signal name="Co" />
        <port polarity="Input" name="B(31:0)" />
        <port polarity="Input" name="A(31:0)" />
        <port polarity="Input" name="ALU_operation(2:0)" />
        <port polarity="Output" name="res(31:0)" />
        <port polarity="Output" name="zero" />
        <port polarity="Output" name="overflow" />
        <blockdef name="SignalExt_32">
            <timestamp>2016-2-25T16:29:0</timestamp>
            <line x2="76" y1="-32" y2="-32" x1="64" />
            <line x2="208" y1="-32" y2="-32" style="linewidth:W" x1="196" />
            <rect width="120" x="76" y="-52" height="40" />
        </blockdef>
        <blockdef name="and32">
            <timestamp>2016-2-25T16:29:0</timestamp>
            <line x2="32" y1="-96" y2="-96" style="linewidth:W" x1="64" />
            <line x2="28" y1="-32" y2="-32" style="linewidth:W" x1="64" />
            <line x2="64" y1="-16" y2="-16" x1="144" />
            <line x2="64" y1="-16" y2="-112" x1="64" />
            <line x2="144" y1="-112" y2="-112" x1="64" />
            <arc ex="144" ey="-112" sx="144" sy="-16" r="48" cx="144" cy="-64" />
            <line x2="224" y1="-64" y2="-64" style="linewidth:W" x1="192" />
        </blockdef>
        <blockdef name="nor32">
            <timestamp>2016-2-25T16:29:0</timestamp>
            <line x2="64" y1="-112" y2="-112" x1="128" />
            <arc ex="64" ey="-112" sx="64" sy="-16" r="56" cx="32" cy="-64" />
            <line x2="64" y1="-16" y2="-16" x1="128" />
            <arc ex="208" ey="-64" sx="128" sy="-16" r="88" cx="132" cy="-104" />
            <arc ex="128" ey="-112" sx="208" sy="-64" r="88" cx="132" cy="-24" />
            <line x2="224" y1="-64" y2="-64" style="linewidth:W" x1="256" />
            <circle style="linewidth:W" r="8" cx="216" cy="-64" />
            <line x2="48" y1="-96" y2="-96" style="linewidth:W" x1="80" />
            <line x2="48" y1="-32" y2="-32" style="linewidth:W" x1="80" />
        </blockdef>
        <blockdef name="or_bit_32">
            <timestamp>2016-2-25T16:29:0</timestamp>
            <rect width="220" x="64" y="-104" height="112" />
            <line x2="32" y1="-48" y2="-48" style="linewidth:W" x1="64" />
            <arc ex="260" ey="-48" sx="180" sy="0" r="88" cx="184" cy="-88" />
            <line x2="116" y1="0" y2="0" x1="180" />
            <line x2="116" y1="-96" y2="-96" x1="180" />
            <arc ex="116" ey="-96" sx="116" sy="0" r="56" cx="84" cy="-48" />
            <arc ex="180" ey="-96" sx="260" sy="-48" r="88" cx="184" cy="-8" />
            <line x2="120" y1="-96" y2="-96" x1="184" />
            <line x2="88" y1="-80" y2="-80" x1="128" />
            <line x2="92" y1="-16" y2="-16" x1="132" />
            <line x2="304" y1="-48" y2="-48" x1="284" />
        </blockdef>
        <blockdef name="srl32">
            <timestamp>2016-2-25T16:29:0</timestamp>
            <rect width="184" x="64" y="-128" height="128" />
            <line x2="32" y1="-96" y2="-96" style="linewidth:W" x1="64" />
            <line x2="32" y1="-32" y2="-32" style="linewidth:W" x1="64" />
            <line x2="288" y1="-64" y2="-64" style="linewidth:W" x1="248" />
        </blockdef>
        <blockdef name="xor32">
            <timestamp>2016-2-25T16:29:0</timestamp>
            <arc ex="80" ey="-112" sx="80" sy="-16" r="56" cx="48" cy="-64" />
            <line x2="80" y1="-112" y2="-112" x1="144" />
            <line x2="80" y1="-16" y2="-16" x1="144" />
            <arc ex="144" ey="-112" sx="224" sy="-64" r="88" cx="148" cy="-24" />
            <arc ex="60" ey="-112" sx="64" sy="-16" r="56" cx="32" cy="-64" />
            <arc ex="224" ey="-64" sx="144" sy="-16" r="88" cx="148" cy="-104" />
            <line x2="80" y1="-96" y2="-96" style="linewidth:W" x1="32" />
            <line x2="80" y1="-32" y2="-32" style="linewidth:W" x1="32" />
            <line x2="228" y1="-64" y2="-64" style="linewidth:W" x1="256" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="MUX8T1_32">
            <timestamp>2016-3-27T16:1:38</timestamp>
            <rect width="68" x="12" y="-264" height="264" />
            <line x2="48" y1="-264" y2="-272" style="linewidth:W" x1="48" />
            <line x2="0" y1="-16" y2="-16" style="linewidth:W" x1="12" />
            <line x2="0" y1="-48" y2="-48" style="linewidth:W" x1="12" />
            <line x2="0" y1="-80" y2="-80" style="linewidth:W" x1="12" />
            <line x2="0" y1="-112" y2="-112" style="linewidth:W" x1="12" />
            <line x2="0" y1="-144" y2="-144" style="linewidth:W" x1="12" />
            <line x2="0" y1="-176" y2="-176" style="linewidth:W" x1="12" />
            <line x2="0" y1="-208" y2="-208" style="linewidth:W" x1="12" />
            <line x2="0" y1="-240" y2="-240" style="linewidth:W" x1="12" />
            <line x2="96" y1="-160" y2="-160" style="linewidth:W" x1="80" />
        </blockdef>
        <blockdef name="ADC32">
            <timestamp>2016-4-4T11:34:30</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="or32">
            <timestamp>2016-4-4T11:36:1</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <block symbolname="and32" name="XLXI_6">
            <blockpin signalname="XLXN_12(31:0)" name="res(31:0)" />
            <blockpin signalname="A(31:0)" name="A(31:0)" />
            <blockpin signalname="B(31:0)" name="B(31:0)" />
        </block>
        <block symbolname="nor32" name="XLXI_7">
            <blockpin signalname="XLXN_15(31:0)" name="res(31:0)" />
            <blockpin signalname="A(31:0)" name="A(31:0)" />
            <blockpin signalname="B(31:0)" name="B(31:0)" />
        </block>
        <block symbolname="or_bit_32" name="XLXI_9">
            <blockpin signalname="zero" name="o" />
            <blockpin signalname="res(31:0)" name="A(31:0)" />
        </block>
        <block symbolname="srl32" name="XLXI_10">
            <blockpin signalname="A(31:0)" name="A(31:0)" />
            <blockpin signalname="B(31:0)" name="B(31:0)" />
            <blockpin signalname="XLXN_16(31:0)" name="res(31:0)" />
        </block>
        <block symbolname="xor32" name="XLXI_11">
            <blockpin signalname="A(31:0)" name="A(31:0)" />
            <blockpin signalname="B(31:0)" name="B(31:0)" />
            <blockpin signalname="XLXN_14(31:0)" name="res(31:0)" />
        </block>
        <block symbolname="xor32" name="XLXI_12">
            <blockpin signalname="XLXN_5(31:0)" name="A(31:0)" />
            <blockpin signalname="B(31:0)" name="B(31:0)" />
            <blockpin signalname="XLXN_30(31:0)" name="res(31:0)" />
        </block>
        <block symbolname="SignalExt_32" name="XLXI_13">
            <blockpin signalname="XLXN_5(31:0)" name="So(31:0)" />
            <blockpin signalname="ALU_operation(2)" name="S" />
        </block>
        <block symbolname="gnd" name="XLXI_15">
            <blockpin signalname="N0" name="G" />
        </block>
        <block symbolname="MUX8T1_32" name="XLXI_16">
            <blockpin signalname="ALU_operation(2:0)" name="s(2:0)" />
            <blockpin signalname="N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,Co" name="I7(31:0)" />
            <blockpin signalname="S(31:0)" name="I6(31:0)" />
            <blockpin signalname="XLXN_16(31:0)" name="I5(31:0)" />
            <blockpin signalname="XLXN_15(31:0)" name="I4(31:0)" />
            <blockpin signalname="XLXN_14(31:0)" name="I3(31:0)" />
            <blockpin signalname="S(31:0)" name="I2(31:0)" />
            <blockpin signalname="XLXN_29(31:0)" name="I1(31:0)" />
            <blockpin signalname="XLXN_12(31:0)" name="I0(31:0)" />
            <blockpin signalname="res(31:0)" name="o(31:0)" />
        </block>
        <block symbolname="ADC32" name="XLXI_18">
            <blockpin signalname="ALU_operation(2)" name="C0" />
            <blockpin signalname="A(31:0)" name="A(31:0)" />
            <blockpin signalname="XLXN_30(31:0)" name="B(31:0)" />
            <blockpin signalname="Co" name="Co" />
            <blockpin signalname="S(31:0)" name="S(31:0)" />
        </block>
        <block symbolname="or32" name="XLXI_19">
            <blockpin signalname="A(31:0)" name="A(31:0)" />
            <blockpin signalname="B(31:0)" name="B(31:0)" />
            <blockpin signalname="XLXN_29(31:0)" name="res(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1472" y="848" name="XLXI_6" orien="R0">
        </instance>
        <instance x="1488" y="1808" name="XLXI_11" orien="R0">
        </instance>
        <instance x="1488" y="2032" name="XLXI_7" orien="R0">
        </instance>
        <instance x="1488" y="2320" name="XLXI_10" orien="R0">
        </instance>
        <instance x="1024" y="1184" name="XLXI_13" orien="R180">
        </instance>
        <instance x="784" y="1536" name="XLXI_12" orien="R0">
        </instance>
        <branch name="XLXN_5(31:0)">
            <wire x2="816" y1="1216" y2="1216" x1="800" />
            <wire x2="800" y1="1216" y2="1440" x1="800" />
            <wire x2="816" y1="1440" y2="1440" x1="800" />
        </branch>
        <branch name="B(31:0)">
            <wire x2="1216" y1="2288" y2="2288" x1="736" />
            <wire x2="1520" y1="2288" y2="2288" x1="1216" />
            <wire x2="816" y1="1504" y2="1504" x1="784" />
            <wire x2="784" y1="1504" y2="2000" x1="784" />
            <wire x2="1216" y1="2000" y2="2000" x1="784" />
            <wire x2="1216" y1="2000" y2="2288" x1="1216" />
            <wire x2="1536" y1="2000" y2="2000" x1="1216" />
            <wire x2="1504" y1="816" y2="816" x1="1216" />
            <wire x2="1216" y1="816" y2="1088" x1="1216" />
            <wire x2="1216" y1="1088" y2="1776" x1="1216" />
            <wire x2="1520" y1="1776" y2="1776" x1="1216" />
            <wire x2="1216" y1="1776" y2="2000" x1="1216" />
            <wire x2="1392" y1="1088" y2="1088" x1="1216" />
        </branch>
        <iomarker fontsize="28" x="736" y="2288" name="B(31:0)" orien="R180" />
        <iomarker fontsize="28" x="624" y="752" name="A(31:0)" orien="R180" />
        <iomarker fontsize="28" x="624" y="640" name="ALU_operation(2:0)" orien="R180" />
        <branch name="ALU_operation(2:0)">
            <wire x2="944" y1="640" y2="640" x1="624" />
            <wire x2="2240" y1="640" y2="640" x1="944" />
            <wire x2="2240" y1="640" y2="848" x1="2240" />
            <wire x2="944" y1="640" y2="944" x1="944" />
            <wire x2="944" y1="944" y2="992" x1="944" />
        </branch>
        <branch name="XLXN_12(31:0)">
            <wire x2="1936" y1="784" y2="784" x1="1696" />
            <wire x2="1936" y1="784" y2="880" x1="1936" />
            <wire x2="2192" y1="880" y2="880" x1="1936" />
        </branch>
        <branch name="XLXN_14(31:0)">
            <wire x2="1968" y1="1744" y2="1744" x1="1744" />
            <wire x2="1968" y1="976" y2="1744" x1="1968" />
            <wire x2="2192" y1="976" y2="976" x1="1968" />
        </branch>
        <branch name="XLXN_15(31:0)">
            <wire x2="2016" y1="1968" y2="1968" x1="1744" />
            <wire x2="2192" y1="1008" y2="1008" x1="2016" />
            <wire x2="2016" y1="1008" y2="1968" x1="2016" />
        </branch>
        <branch name="XLXN_16(31:0)">
            <wire x2="2096" y1="2256" y2="2256" x1="1776" />
            <wire x2="2192" y1="1040" y2="1040" x1="2096" />
            <wire x2="2096" y1="1040" y2="2256" x1="2096" />
        </branch>
        <branch name="S(31:0)">
            <wire x2="1872" y1="1472" y2="1472" x1="1776" />
            <wire x2="2032" y1="1376" y2="1376" x1="1872" />
            <wire x2="1872" y1="1376" y2="1472" x1="1872" />
            <wire x2="2192" y1="944" y2="944" x1="2032" />
            <wire x2="2032" y1="944" y2="1072" x1="2032" />
            <wire x2="2032" y1="1072" y2="1376" x1="2032" />
            <wire x2="2192" y1="1072" y2="1072" x1="2032" />
        </branch>
        <branch name="res(31:0)">
            <wire x2="2336" y1="960" y2="960" x1="2288" />
            <wire x2="2496" y1="960" y2="960" x1="2336" />
            <wire x2="2336" y1="960" y2="1344" x1="2336" />
            <wire x2="2448" y1="1344" y2="1344" x1="2336" />
        </branch>
        <iomarker fontsize="28" x="2496" y="960" name="res(31:0)" orien="R0" />
        <instance x="2416" y="1392" name="XLXI_9" orien="R0">
        </instance>
        <branch name="zero">
            <wire x2="2816" y1="1344" y2="1344" x1="2720" />
        </branch>
        <iomarker fontsize="28" x="2816" y="1344" name="zero" orien="R0" />
        <branch name="overflow">
            <wire x2="2976" y1="1840" y2="1840" x1="2704" />
        </branch>
        <iomarker fontsize="28" x="2976" y="1840" name="overflow" orien="R0" />
        <instance x="2768" y="2624" name="XLXI_15" orien="R0" />
        <branch name="N0">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2896" y="2400" type="branch" />
            <wire x2="2896" y1="2400" y2="2400" x1="2832" />
            <wire x2="2832" y1="2400" y2="2496" x1="2832" />
        </branch>
        <branch name="N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,Co">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2080" y="1104" type="branch" />
            <wire x2="2192" y1="1104" y2="1104" x1="2080" />
        </branch>
        <branch name="ALU_operation(2)">
            <wire x2="1104" y1="1216" y2="1216" x1="960" />
            <wire x2="1104" y1="1216" y2="1344" x1="1104" />
            <wire x2="1392" y1="1344" y2="1344" x1="1104" />
            <wire x2="1104" y1="944" y2="944" x1="1040" />
            <wire x2="1104" y1="944" y2="1216" x1="1104" />
        </branch>
        <bustap x2="1040" y1="944" y2="944" x1="944" />
        <instance x="2192" y="1120" name="XLXI_16" orien="R0">
        </instance>
        <branch name="XLXN_30(31:0)">
            <wire x2="1392" y1="1472" y2="1472" x1="1040" />
        </branch>
        <branch name="A(31:0)">
            <wire x2="1344" y1="752" y2="752" x1="624" />
            <wire x2="1504" y1="752" y2="752" x1="1344" />
            <wire x2="1344" y1="752" y2="1024" x1="1344" />
            <wire x2="1344" y1="1024" y2="1408" x1="1344" />
            <wire x2="1344" y1="1408" y2="1712" x1="1344" />
            <wire x2="1520" y1="1712" y2="1712" x1="1344" />
            <wire x2="1344" y1="1712" y2="1936" x1="1344" />
            <wire x2="1344" y1="1936" y2="2224" x1="1344" />
            <wire x2="1520" y1="2224" y2="2224" x1="1344" />
            <wire x2="1536" y1="1936" y2="1936" x1="1344" />
            <wire x2="1392" y1="1408" y2="1408" x1="1344" />
            <wire x2="1392" y1="1024" y2="1024" x1="1344" />
        </branch>
        <branch name="Co">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1808" y="1344" type="branch" />
            <wire x2="1808" y1="1344" y2="1344" x1="1776" />
        </branch>
        <instance x="1392" y="1504" name="XLXI_18" orien="R0">
        </instance>
        <instance x="1392" y="1120" name="XLXI_19" orien="R0">
        </instance>
        <branch name="XLXN_29(31:0)">
            <wire x2="1872" y1="1024" y2="1024" x1="1776" />
            <wire x2="2192" y1="912" y2="912" x1="1872" />
            <wire x2="1872" y1="912" y2="1024" x1="1872" />
        </branch>
    </sheet>
</drawing>