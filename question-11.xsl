<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:template match="/regularite-tgv">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="page-unique"
                    page-height="29.7cm" page-width="21cm"
                    margin-top="1.5cm" margin-bottom="2cm"
                    margin-left="2.5cm" margin-right="1cm">
                    <fo:region-body />
                </fo:simple-page-master>
            </fo:layout-master-set>

            <xsl:apply-templates></xsl:apply-templates>


        </fo:root>
    </xsl:template>


    <xsl:template match="axe">
        <xsl:variable name="axe" select="@nom" />
        <fo:page-sequence master-reference="page-unique">
            <fo:title>
                <xsl:value-of select="$axe" />
            </fo:title>
            <fo:flow flow-name="xsl-region-body">
                <fo:block>Axe <xsl:value-of
                        select="$axe" /></fo:block>
            </fo:flow>
        </fo:page-sequence>
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>

</xsl:stylesheet>