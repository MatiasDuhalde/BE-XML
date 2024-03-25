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

                <xsl:for-each select="gare-depart">
                    <xsl:variable name="gareDepart" select="@nom" />
                    <xsl:for-each select="gare-arrivee">
                        <xsl:variable name="gareArrivee" select="@nom" />
                        <fo:block font-size="14pt">
                            <xsl:value-of select="$gareDepart" />
                            <xsl:text> -> </xsl:text>
                            <xsl:value-of select="$gareArrivee" /> 
                        </fo:block>

                        <xsl:for-each select="mesure">
                            <fo:block font-size="12pt">
                                <fo:table table-layout="fixed"
                                            text-align="center"
                                            space-before="1em"
                                            width="100%">
                                    <fo:table-column column-width="proportional-column-width(1)">
                                    </fo:table-column>
                                    <fo:table-column column-width="proportional-column-width(3)">
                                    </fo:table-column>
                                    <fo:table-header>
                                    <fo:table-row>
                                        <fo:table-cell number-columns-spanned="2"
                                                    border="0.5pt solid #CCCCCC"
                                                    padding="2pt"
                                                    color="#880000">
                                        <fo:block>Introduction à XML</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    </fo:table-header>
                                    <fo:table-footer>
                                    <fo:table-row>
                                        <fo:table-cell number-columns-spanned="2"
                                                    padding="2pt"
                                                    color="#000088"
                                                    font-size="8pt">
                                        <fo:block>Cours "XML, Standards et Applications" © 2004 Daniel Muller</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    </fo:table-footer>
                                    <fo:table-body>
                                    <fo:table-row>
                                        <fo:table-cell number-rows-spanned="3"
                                                    border="0.5pt solid #CCCCCC"
                                                    padding="2pt"
                                                    display-align="center">
                                        <fo:block>Eléments d'histoire</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="0.5pt solid #CCCCCC"
                                                    padding="2pt">
                                        <fo:block>A l'origine était SGML...               </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    <fo:table-row>
                                        <fo:table-cell border="0.5pt solid #CCCCCC"
                                                    padding="2pt">
                                        <fo:block>De SGML à XML</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    <fo:table-row>
                                        <fo:table-cell border="0.5pt solid #CCCCCC"
                                                    padding="2pt">
                                        <fo:block>La solution XML</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    </fo:table-body>
                                    <fo:table-body>
                                    <fo:table-row>
                                        <fo:table-cell number-rows-spanned="10"
                                                    border="0.5pt solid #CCCCCC"
                                                    padding="2pt"
                                                    display-align="center">
                                        <fo:block>XML en 10 points</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="0.5pt solid #CCCCCC"
                                                    padding="2pt">
                                        <fo:block>Une méthode pour structurer des données</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    <fo:table-row>
                                        <fo:table-cell border="0.5pt solid #CCCCCC"
                                                    padding="2pt">
                                        <fo:block>XML ressemble à HTML</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    <fo:table-row>
                                        <fo:table-cell border="0.5pt solid #CCCCCC"
                                                    padding="2pt">
                                        <fo:block>XML : du texte pas forcément lu... par des humains</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    <fo:table-row>
                                        <fo:table-cell border="0.5pt solid #CCCCCC"
                                                    padding="2pt">
                                        <fo:block>XML est verbeux, mais ce n'est pas un problème</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    <fo:table-row>
                                        <fo:table-cell border="0.5pt solid #CCCCCC"
                                                    padding="2pt">
                                        <fo:block>XML est une famille de technologies</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    <fo:table-row>
                                        <fo:table-cell border="0.5pt solid #CCCCCC"
                                                    padding="2pt">
                                        <fo:block>XML est une technologie récente, mais éprouvée</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    <fo:table-row>
                                        <fo:table-cell border="0.5pt solid #CCCCCC"
                                                    padding="2pt">
                                        <fo:block>XML fait passer HTML à XHTML</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    <fo:table-row>
                                        <fo:table-cell border="0.5pt solid #CCCCCC"
                                                    padding="2pt">
                                        <fo:block>XML est modulaire</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    <fo:table-row>
                                        <fo:table-cell border="0.5pt solid #CCCCCC"
                                                    padding="2pt">
                                        <fo:block>XML est le fondement de RDF et du Web Sémantique</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    <fo:table-row>
                                        <fo:table-cell border="0.5pt solid #CCCCCC"
                                                    padding="2pt">
                                        <fo:block>XML est libre de droits, indépendant des plates-formes et correctement supporté</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    </fo:table-body>
                                </fo:table>
                            </fo:block>
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each>
            </fo:flow>
        </fo:page-sequence>

        <xsl:apply-templates></xsl:apply-templates>
        
    </xsl:template>

</xsl:stylesheet>