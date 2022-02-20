<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="text" indent="no"/>

    <xsl:variable name="delim1">|</xsl:variable>
    <xsl:variable name="lf">
        <xsl:text>&#xa;</xsl:text>
    </xsl:variable>

    <xsl:variable name="heads">id|name|type|creator|status|created|updated|published|pg_count</xsl:variable>

    <xsl:template match="/">
        <xsl:value-of select="$heads"/>
        <xsl:value-of select="$lf"/>
        
        <xsl:apply-templates select="libguides/guides/guide"/>
    </xsl:template>

    <xsl:template match="guide">
        <xsl:value-of select="id"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="name"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="type"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="owner/email"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="status"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="created"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="updated"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="published"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="count(pages/page)"/>
        <xsl:value-of select="$lf"/>
        

    </xsl:template>



</xsl:stylesheet>
