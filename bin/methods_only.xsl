<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" indent="no" encoding="UTF-8"/>

    <xsl:template match="/|@*|node()|comment()">
       <xsl:apply-templates select="@*|node()|comment()"/>
    </xsl:template>
	
    <xsl:template match="api">
        <xsl:value-of select="@method"/><xsl:text>&#10;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
