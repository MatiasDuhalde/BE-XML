<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">


    <xsl:param name="date" />
    <xsl:param name="hour" />
    <xsl:param name="minutes" />
    <xsl:param name="author" />

    <xsl:template match="/regularite-tgv">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="premiere-page"
                    page-height="29.7cm" page-width="21cm"
                    margin-top="1.5cm" margin-bottom="2cm"
                    margin-left="2.5cm" margin-right="1cm">
                    <fo:region-body margin-top="10cm" margin-bottom="2.1cm" />
                </fo:simple-page-master>

                <fo:simple-page-master master-name="page-normale"
                    page-height="29.7cm" page-width="21cm"
                    margin-top="1.5cm" margin-bottom="2cm"
                    margin-left="2.5cm" margin-right="1cm">
                    <fo:region-body />
                    <fo:region-before extent="1.5cm" />
                    <fo:region-after extent="2cm" />
                </fo:simple-page-master>
            </fo:layout-master-set>


            <fo:page-sequence master-reference="premiere-page">
                <fo:title>
                    <xsl:text>
                        Rapport sur la régularité des TGV
                    </xsl:text>
                </fo:title>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="24pt" font-weight="bold" text-align="center">
                        <xsl:text>
                            Rapport sur la régularité des TGV
                        </xsl:text>
                    </fo:block>
                    <fo:block space-before="20pt">
                        <xsl:text>
                            Ce rapport à été formatté par <fo:inline font-weight="bold"><xsl:value-of select="$author" /></fo:inline> 
                        </xsl:text>
                    </fo:block>
                    <fo:block space-before="20pt">
                        <xsl:text>Ce rapport à été généré le </xsl:text>
                        <fo:inline font-weight="bold">
                            <xsl:value-of select="$date" />
                        </fo:inline>
                        <xsl:text>, à </xsl:text>
                        <fo:inline font-weight="bold">
                            <xsl:value-of select="$hour" />
                        </fo:inline>
                        <xsl:text>h </xsl:text>
                        <fo:inline font-weight="bold">
                            <xsl:value-of select="$minutes" />
                        </fo:inline>
                        <xsl:text>min</xsl:text>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>

            <xsl:apply-templates></xsl:apply-templates>

        </fo:root>
    </xsl:template>


    <xsl:template match="axe">
        <xsl:variable name="axe" select="@nom" />
        <fo:page-sequence master-reference="page-normale">
            <fo:title>
                <xsl:text>
                    <xsl:value-of select="$axe" />
                </xsl:text>
            </fo:title>
            <fo:flow flow-name="xsl-region-body">
                <fo:block font-size="18pt">
                    <xsl:text>Axe </xsl:text>
                    <xsl:value-of select="$axe" />
                </fo:block>
            </fo:flow>
        </fo:page-sequence>
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>

</xsl:stylesheet>