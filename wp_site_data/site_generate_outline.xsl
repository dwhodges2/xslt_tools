<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:excerpt="http://wordpress.org/export/1.2/excerpt/"
    xmlns:content="http://purl.org/rss/1.0/modules/content/"
    xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:wp="http://wordpress.org/export/1.2/" xmlns:foo="http://libraries.adelphi.edu"
    exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="text" indent="no"/>


    <xsl:variable name="delim1">|</xsl:variable>
    <xsl:variable name="delim2">;</xsl:variable>
    <xsl:variable name="lf">
        <xsl:text>&#xa;</xsl:text>
    </xsl:variable>

    <xsl:variable name="heads">id|url|type|status|updated|L1|L2|L3|L4|L5|L6</xsl:variable>


    <xsl:template match="/">

        <xsl:value-of select="$heads"/>
        <xsl:value-of select="$lf"/>

        <xsl:apply-templates select="rss/channel/item[wp:post_parent = '0']">
            <xsl:sort select="wp:post_id" data-type="number"/>
        </xsl:apply-templates>

    </xsl:template>


    <xsl:template match="item">
        <xsl:param name="depth">0</xsl:param>

        <xsl:variable name="my_id" select="wp:post_id"/>

        <xsl:value-of select="$my_id"/>
        <xsl:value-of select="$delim1"/>

        <!-- Check if it is a redirect link, and if so use the target instead of the internal WP URL.-->
        <xsl:choose>
            <xsl:when test="contains(wp:post_type, 'np-redirect')">
                <xsl:value-of select="content:encoded"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="link"/>
            </xsl:otherwise>
        </xsl:choose>

        <xsl:value-of select="$delim1"/>


        <xsl:value-of select="wp:post_type"/>
        <xsl:value-of select="$delim1"/>

        <xsl:value-of select="wp:status"/>

        <xsl:value-of select="$delim1"/>

        <xsl:value-of select="wp:post_modified"/>

        <!--  Set number of indentations to form outline view      -->
        <xsl:value-of select="foo:indent($depth)"/>


        <xsl:value-of select="title"/>
        <xsl:value-of select="$delim1"/>


        <xsl:value-of select="$lf"/>

        <xsl:apply-templates select="../item[wp:post_parent = $my_id]">
            <xsl:with-param name="depth">
                <xsl:value-of select="$depth + 1"/>
            </xsl:with-param>
        </xsl:apply-templates>

    </xsl:template>


    <xsl:function name="foo:indent">
        <xsl:param name="level"/>

        <xsl:for-each select="0 to $level">
            <xsl:value-of select="$delim1"/>
        </xsl:for-each>

    </xsl:function>

</xsl:stylesheet>
