<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" indent="no" encoding="UTF-8"/>

    <xsl:template match="/|@*|node()|comment()">
       <xsl:apply-templates select="@*|node()|comment()"/>
    </xsl:template>
	
    <xsl:template match="api">
		<xsl:choose>
			<xsl:when test="@static='true'">
				<xsl:value-of select="'.'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="':'"/>
			</xsl:otherwise>
		</xsl:choose>
		
        <xsl:value-of select="concat(@method,',&quot;',./ret/@type,'&quot;')"/>
		
		<xsl:for-each select="./arg">
			<xsl:sort select="@pos"/>
			<xsl:choose>
				<xsl:when test="@default">
					<xsl:value-of select="concat(',[',@type,':',@name,':',@default,']')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat(',',@type,':',@name)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
