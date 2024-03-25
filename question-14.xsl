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
                    margin-top="1.5cm" margin-bottom="1.5cm"
                    margin-left="3cm" margin-right="3cm">
                    <fo:region-body margin-top="10cm" margin-bottom="2.1cm" />
                </fo:simple-page-master>

                <fo:simple-page-master master-name="page-normale"
                    page-height="29.7cm" page-width="21cm"
                    margin-top="1.5cm" margin-bottom="1.5cm"
                    margin-left="1.5cm" margin-right="1.5cm">
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
                    <xsl:for-each
                        select="gare-arrivee">
                        <xsl:variable name="gareArrivee" select="@nom" />
                        <fo:block font-size="14pt">
                            <xsl:value-of select="$gareDepart" />
                            <xsl:text> -> </xsl:text>
                            <xsl:value-of select="$gareArrivee" />
                        </fo:block>



                        <fo:block
                            break-after="page" font-size="10pt">
                            <fo:table table-layout="fixed"
                                text-align="center"
                                space-before="1em"
                                space-after="1em"
                                border-collapse="separate"
                                border="solid 1pt black"
                                width="100%">

                                <fo:table-column column-width="proportional-column-width(1)" />
                                <fo:table-column column-width="proportional-column-width(1)" />
                                <fo:table-column column-width="proportional-column-width(1)" />
                                <fo:table-column column-width="proportional-column-width(1)" />
                                <fo:table-column column-width="proportional-column-width(1)" />
                                <fo:table-column column-width="proportional-column-width(1)" />
                                <fo:table-column column-width="proportional-column-width(1)" />
                                <fo:table-header>
                                    <fo:table-row background-color="#4472c4">
                                        <fo:table-cell padding="2pt" border="1pt solid black">
                                            <fo:block font-weight="bold">Année</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="2pt" border="1pt solid black">
                                            <fo:block font-weight="bold">Mois</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="2pt" border="1pt solid black">
                                            <fo:block font-weight="bold">Programmés</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="2pt" border="1pt solid black">
                                            <fo:block font-weight="bold">Ayant circulé</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="2pt" border="1pt solid black">
                                            <fo:block font-weight="bold">Annulés</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="2pt" border="1pt solid black">
                                            <fo:block font-weight="bold">En retard</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="2pt" border="1pt solid black">
                                            <fo:block font-weight="bold">Régularité</fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </fo:table-header>

                                <fo:table-body>
                                    <xsl:for-each select="mesure">
                                        <xsl:sort select="@annee" data-type="number"
                                            order="ascending" />
                                        <xsl:sort select="@mois"
                                            data-type="number" order="ascending" />
                                        <xsl:variable
                                            name="backgroundColor">
                                            <xsl:choose>
                                                <xsl:when test="position() mod 2 = 0">#d9e1f2</xsl:when>
                                                <xsl:otherwise>white</xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                      
                                        <fo:table-row
                                            background-color="{$backgroundColor}">
                                            <fo:table-cell padding="2pt" border="1pt solid black">
                                                <fo:block>
                                                    <xsl:value-of select="@annee" />
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding="2pt" border="1pt solid black">
                                                <fo:block>
                                                    <xsl:choose>
                                                        <xsl:when test="@mois=01">Janvier</xsl:when>
                                                        <xsl:when test="@mois=02">Février</xsl:when>
                                                        <xsl:when test="@mois=03">Mars</xsl:when>
                                                        <xsl:when test="@mois=04">Avril</xsl:when>
                                                        <xsl:when test="@mois=05">Mai</xsl:when>
                                                        <xsl:when test="@mois=06">Juin</xsl:when>
                                                        <xsl:when test="@mois=07">Juillet</xsl:when>
                                                        <xsl:when test="@mois=08">Août</xsl:when>
                                                        <xsl:when test="@mois=09">Septembre</xsl:when>
                                                        <xsl:when test="@mois=10">Octobre</xsl:when>
                                                        <xsl:when test="@mois=11">Novembre</xsl:when>
                                                        <xsl:when test="@mois=12">Décembre</xsl:when>
                                                    </xsl:choose>
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding="2pt" border="1pt solid black">
                                                <fo:block>
                                                    <xsl:value-of select="@trains-prevus" />
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding="2pt" border="1pt solid black">
                                                <fo:block>
                                                    <xsl:value-of select="@trains-ok" />
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding="2pt" border="1pt solid black">
                                                <fo:block>
                                                    <xsl:value-of select="@annules" />
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding="2pt" border="1pt solid black">
                                                <fo:block>
                                                    <xsl:value-of select="@retards" />
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell padding="2pt" border="1pt solid black">
                                                <fo:block>
                                                    <xsl:value-of select="@regularite" />
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </xsl:for-each>
                                </fo:table-body>
                            </fo:table>


                            <xsl:for-each select="mesure">
                                <xsl:sort select="@annee" data-type="number" order="ascending" />
                                <xsl:sort
                                    select="@mois" data-type="number" order="ascending" />
                                <xsl:if
                                    test="string-length(normalize-space(@commentaire)) > 0">
                                    <fo:block font-size="7pt">
                                        <fo:inline font-weight="bold">
                                            <xsl:choose>
                                                <xsl:when test="@mois=01">Janvier</xsl:when>
                                                <xsl:when test="@mois=02">Février</xsl:when>
                                                <xsl:when test="@mois=03">Mars</xsl:when>
                                                <xsl:when test="@mois=04">Avril</xsl:when>
                                                <xsl:when test="@mois=05">Mai</xsl:when>
                                                <xsl:when test="@mois=06">Juin</xsl:when>
                                                <xsl:when test="@mois=07">Juillet</xsl:when>
                                                <xsl:when test="@mois=08">Août</xsl:when>
                                                <xsl:when test="@mois=09">Septembre</xsl:when>
                                                <xsl:when test="@mois=10">Octobre</xsl:when>
                                                <xsl:when test="@mois=11">Novembre</xsl:when>
                                                <xsl:when test="@mois=12">Décembre</xsl:when>
                                            </xsl:choose>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="@annee" />
                                        </fo:inline>
                                        <xsl:text> - </xsl:text>
                                        <xsl:value-of select="@commentaire" />
                                    </fo:block>
                                </xsl:if>
                            </xsl:for-each>
                        </fo:block>
                    </xsl:for-each>
                </xsl:for-each>
            </fo:flow>
        </fo:page-sequence>

        <xsl:apply-templates></xsl:apply-templates>

    </xsl:template>

</xsl:stylesheet>