<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/|@*|node()|comment()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()|comment()"/>
        </xsl:copy>
    </xsl:template>
	
    <xsl:template match="@pos[not(../../@static='true')]">
		<xsl:variable name="pos" select="."/>
		<xsl:attribute name="pos"><xsl:value-of select="($pos)-1"/></xsl:attribute>
    </xsl:template>
</xsl:stylesheet>
