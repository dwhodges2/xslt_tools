<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs"
                version="2.0"
                xpath-default-namespace="http://www.w3.org/2005/Atom">
   <xsl:output method="text" indent="no" encoding="UTF-8"/>
   <xsl:param name="file_path">sample-xml/</xsl:param>
   <xsl:variable name="lf">
      <xsl:text>
</xsl:text>
   </xsl:variable>
   <xsl:variable name="delim1">|</xsl:variable>
   <xsl:variable name="heads">FILENAME<xsl:value-of select="$delim1"/>title<xsl:value-of select="$delim1"/>author/name<xsl:value-of select="$delim1"/>published<xsl:value-of select="$delim1"/>id<xsl:value-of select="$delim1"/>updated<xsl:value-of select="$delim1"/>link[@type='application/pdf']/@href<xsl:value-of select="$delim1"/>link[@type='application/epub+zip']/@href<xsl:value-of select="$delim1"/>Number of subjects<xsl:value-of select="$delim1"/>Language<xsl:value-of select="$delim1"/>
   </xsl:variable>

   <xsl:template match="/">
      <xsl:value-of select="$heads"/>
      <xsl:value-of select="$lf"/>
      <xsl:for-each select="collection(concat($file_path, '?select=*.xml;recurse=yes'))">
         <xsl:variable name="mypath" select="tokenize(base-uri(),'/')"/>
         <xsl:variable name="filename">
            <xsl:value-of select="$mypath[last()]"/>
         </xsl:variable>
         <xsl:apply-templates select="feed/entry">
            <xsl:with-param name="filename" select="$filename"/>
         </xsl:apply-templates>
      </xsl:for-each>
   </xsl:template>

   <xsl:template match="feed/entry">
      <xsl:param name="filename"/>
      <xsl:value-of select="$filename"/>
      <xsl:value-of select="$delim1"/>
      <xsl:value-of select="title"/>
      <xsl:value-of select="$delim1"/>
      <xsl:value-of select="author/name"/>
      <xsl:value-of select="$delim1"/>
      <xsl:value-of select="published"/>
      <xsl:value-of select="$delim1"/>
      <xsl:value-of select="id"/>
      <xsl:value-of select="$delim1"/>
      <xsl:value-of select="updated"/>
      <xsl:value-of select="$delim1"/>
      <xsl:value-of select="link[@type='application/pdf']/@href"/>
      <xsl:value-of select="$delim1"/>
      <xsl:value-of select="link[@type='application/epub+zip']/@href"/>
      <xsl:value-of select="$delim1"/>
      <xsl:value-of select="count(category)"/>
      <xsl:value-of select="$delim1"/>
      <xsl:value-of select="*:language"/>
      <xsl:value-of select="$delim1"/>
      <xsl:value-of select="$lf"/>
   </xsl:template>
</xsl:stylesheet>
