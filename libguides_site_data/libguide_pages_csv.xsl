<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    
    <xsl:output method="text" indent="no"/>
    
    <xsl:variable name="delim1">|</xsl:variable>
    <xsl:variable name="delim2">;</xsl:variable>
    <xsl:variable name="lf">
        <xsl:text>&#xa;</xsl:text>
    </xsl:variable>
    
    <xsl:variable name="heads">id|name|guide_id|url|source_page_id|parent_page_id|position|hidden|created|updated|modified|editors|box_count</xsl:variable>
    
    <xsl:template match="/">
        <xsl:value-of select="$heads"/>
        <xsl:value-of select="$lf"/>
        
        <xsl:apply-templates select="libguides/guides/guide/pages/page[parent_page_id = '0']" mode="top"/>
    </xsl:template>
    
    <xsl:template match="page" mode="top">
        <xsl:variable name="my_id" select="id"/>
        <xsl:value-of select="id"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="name"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="ancestor::guide/id"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="url"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="source_page_id"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="parent_page_id"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="position"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="hidden"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="created"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="updated"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="modified"/>
        <xsl:value-of select="$delim1"/>
        <xsl:for-each select="distinct-values(descendant::owner/email)">
            <xsl:value-of select="."/>
            <xsl:text>; </xsl:text>
        </xsl:for-each>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="count(boxes/box)"/>
        <xsl:value-of select="$lf"/>
        
        <xsl:apply-templates select="../page[parent_page_id = $my_id]" mode="subpage"/>
        
        
    </xsl:template>
    
    <xsl:template match="page" mode="subpage">
        <xsl:value-of select="id"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="name"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="ancestor::guide/id"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="url"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="source_page_id"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="parent_page_id"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="position"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="hidden"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="created"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="updated"/>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="modified"/>
        <xsl:value-of select="$delim1"/>
        <xsl:for-each select="distinct-values(descendant::owner/email)">
            <xsl:value-of select="."/>
            <xsl:text>; </xsl:text>
        </xsl:for-each>
        <xsl:value-of select="$delim1"/>
        <xsl:value-of select="count(boxes/box)"/>
        <xsl:value-of select="$lf"/>
    </xsl:template>
    
    
</xsl:stylesheet>
