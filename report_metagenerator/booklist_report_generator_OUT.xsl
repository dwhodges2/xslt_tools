<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://ns.editeur.org/onix/3.0/short"
                exclude-result-prefixes="xs"
                version="2.0"
                xpath-default-namespace="http://www.w3.org/2005/Atom">
   <xsl:output method="text" indent="no" encoding="UTF-8"/>
   <xsl:param name="file_path">/Users/dwh2128/git/xslt-generator/sample-xml/</xsl:param>
   <xsl:variable name="lf">
      <xsl:text>
</xsl:text>
   </xsl:variable>
   <xsl:variable name="delim1">|</xsl:variable>
   <xsl:variable name="heads">FILENAME|"title"|"author/name"|"published"|"id"|"updated"|"link[@type="application/pdf"]/@href"|"link[@type="application/epub+zip"]/@href"|"count(category)"|"*:language"|</xsl:variable>

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
      <xsl:value-of select="link[@type=&#34;application/pdf&#34;]/@href"/>
      <xsl:value-of select="$delim1"/>
      <xsl:value-of select="link[@type=&#34;application/epub+zip&#34;]/@href"/>
      <xsl:value-of select="$delim1"/>
      <xsl:value-of select="count(category)"/>
      <xsl:value-of select="$delim1"/>
      <xsl:value-of select="*:language"/>
      <xsl:value-of select="$delim1"/>
      <xsl:value-of select="$lf"/>
   </xsl:template>
</xsl:stylesheet>
