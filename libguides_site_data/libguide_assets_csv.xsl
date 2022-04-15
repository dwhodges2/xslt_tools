<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="text" indent="no"/>

    <xsl:variable name="delim1">|</xsl:variable>
    <xsl:variable name="lf">
        <xsl:text>&#xa;</xsl:text>
    </xsl:variable>

    <xsl:variable name="heads">id|type|name|guide_id|guide_name|page_id|page_name</xsl:variable>

    <xsl:template match="/">
        <xsl:value-of select="$heads"/>
        <xsl:value-of select="$lf"/>
        
        <xsl:apply-templates select="//asset"/>
    </xsl:template>

    <xsl:template match="asset">
        <xsl:value-of select="id"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="type"/>
        <xsl:value-of select="$delim1"/>
        <xsl:apply-templates select="name"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="ancestor::guide/id"/>
        <xsl:value-of select="$delim1"/>
        <xsl:apply-templates select="ancestor::guide/name"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="ancestor::page/id"/>
        <xsl:value-of select="$delim1"/>
        <xsl:apply-templates select="ancestor::page/name"/>
        <xsl:value-of select="$lf"/>
        
    </xsl:template>

    <!-- translate the delimiter character -->
    <xsl:template match="text()">
        <xsl:value-of select="translate(., '|', '¥')"/>
    </xsl:template>
    

</xsl:stylesheet>
