<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"

    xmlns:axsl="http://www.w3.org/1999/XSL/TransformAlias"

      version="2.0">
    
    
    <xsl:namespace-alias stylesheet-prefix="axsl" result-prefix="xsl"/>
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:variable name="lf"><xsl:text>&#10;</xsl:text></xsl:variable>
    
    <xsl:variable name="additionalNamespaces">
        <xsl:for-each select="additionalNamespace">
            xmlns:<xsl:value-of select="prefix"/>="<xsl:value-of select="uri"/>"
            
        </xsl:for-each>
    </xsl:variable>
    
    <xsl:template match="data">
        
    <xsl:variable name="delim1"><xsl:value-of select="delim1"/></xsl:variable>
        <!-- TODO: Figure out how to pass namespace as a value into document def. -->
        <axsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
            xmlns:xs="http://www.w3.org/2001/XMLSchema" 
            exclude-result-prefixes="xs" version="2.0"
            xpath-default-namespace="{xpathDefaultNamespace}">

 
        <axsl:output method="text" indent="no" encoding="UTF-8"/>
        
        <axsl:param name="file_path">
            <xsl:value-of select="filePath"/>
        </axsl:param>
            
            <axsl:variable name="lf"><axsl:text><xsl:value-of select="$lf"/></axsl:text></axsl:variable>
            <axsl:variable name="delim1"><xsl:value-of select="$delim1"/></axsl:variable> 
            
         <axsl:variable name="heads">
             <xsl:text>FILENAME</xsl:text>
             <axsl:value-of select="$delim1"/>
            <xsl:for-each select="xpaths/xpath">
                <xsl:choose>
                    <xsl:when test="@title"><xsl:value-of select="@title"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="normalize-space(.)"/></xsl:otherwise>
                </xsl:choose>
                <axsl:value-of select="$delim1"/>
            </xsl:for-each> 
         </axsl:variable>   
            
            <xsl:value-of select="$lf"/>
            <xsl:value-of select="$lf"/>
            <axsl:template match="/">
                
                <axsl:value-of select="$heads"/>
                <axsl:value-of select="$lf"/>
                
                
                <axsl:for-each select="collection(concat($file_path, '?select=*.xml;recurse=yes'))">
                    
                    <axsl:variable name="mypath" select="tokenize(base-uri(),'/')"/>
                    
                    <axsl:variable name="filename">
                        <!--<axsl:value-of select="substring-before( $mypath[last()], '.xml')"/>-->
                        <axsl:value-of select="$mypath[last()]"/>
                    </axsl:variable>
             
                    <axsl:apply-templates select="{itemContext}">
                        <axsl:with-param name="filename" select="$filename"/>
                    </axsl:apply-templates>
                    
                    
                    </axsl:for-each>
                
            
            </axsl:template>
            
            <xsl:value-of select="$lf"/>
            <xsl:value-of select="$lf"/>
            
            <axsl:template match="{itemContext}">
                
                <axsl:param name="filename"/>
                
                
                <axsl:value-of select="$filename"/>
                
                <axsl:value-of select="$delim1"/>
                
                <xsl:for-each select="xpaths/xpath">
                    <axsl:value-of select="{normalize-space(.)}"/>
                    <axsl:value-of select="$delim1"/>
                </xsl:for-each>
                
               <axsl:value-of select="$lf"/>
                
            </axsl:template>
        </axsl:stylesheet>
    </xsl:template>
    
    <xsl:template match="xpath">
        
    </xsl:template>
    
</xsl:stylesheet>