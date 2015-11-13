<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/|@*|node()|comment()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()|comment()"/>
        </xsl:copy>
    </xsl:template>
	
    <xsl:template match="arg" mode="arg">
        <xsl:copy>
			<xsl:attribute name="pos"><xsl:value-of select="position()"/></xsl:attribute>
            <xsl:apply-templates select="@*"/>
        </xsl:copy>
    </xsl:template>

	<xsl:template match="method">
		<xsl:variable name="file" select="concat('../Cv/',./@class, '.xml')"/>
		<xsl:variable name="fn" select="./@fn"/>
		<xsl:variable name="call" select="document($file)/class/call[@fn=$fn]"/>
		
        <xsl:copy>
            <xsl:apply-templates select="@*|node()|comment()"/>
        </xsl:copy>

		<xsl:if test="count($call)=0">
			<xsl:comment>Missing lookup!</xsl:comment>
		</xsl:if>

		<xsl:if test="count($call)!=0">
			<xsl:apply-templates select="$call/arg" mode="arg"/>
			<ret><xsl:attribute name="type"><xsl:value-of select="$call/@ret"/></xsl:attribute></ret>
		</xsl:if>
    </xsl:template>
</xsl:stylesheet>
