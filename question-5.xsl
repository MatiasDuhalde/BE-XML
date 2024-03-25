<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/regularite-tgv">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="question-5.css" />
            </head>
            <body>
                <h1>
                    Régularité des TGV
                </h1>
                <xsl:for-each
                    select="axe">
                    <div class="axe">
                        <h2> Axe <xsl:value-of select="@nom" />
                        </h2>
                        <div class="gare-depart">
                            <xsl:for-each select="gare-depart">
                                <h3> Gare de départ <xsl:value-of
                                        select="@nom" /></h3>

                                <div class="gare-arrivee">
                                    <xsl:for-each select="gare-arrivee">
                                        <h4>Gare d'arrivée <xsl:value-of
                                                select="@nom" />
                                        </h4>
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>Année</th>
                                                    <th>Mois</th>
                                                    <th>Nombre de trains programmés</th>
                                                    <th>Nombre de trains ayant circulé</th>
                                                    <th>Nombre de trains annulés</th>
                                                    <th>Nombre de trains en retart à l'arrivée</th>
                                                    <th>Régularité</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <xsl:for-each
                                                    select="mesure">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="@annee" />
                                                        </td>
                                                        <td>
                                                            <xsl:value-of select="@mois" />
                                                        </td>
                                                        <td>
                                                            <xsl:value-of
                                                                select="@trains-prevus" />
                                                        </td>
                                                        <td>
                                                            <xsl:value-of select="@trains-ok" />
                                                        </td>
                                                        <td>
                                                            <xsl:value-of select="@annules" />
                                                        </td>
                                                        <td>
                                                            <xsl:value-of select="@retards" />
                                                        </td>
                                                        <td>
                                                            <xsl:value-of select="@regularite" />
                                                        </td>
                                                    </tr>
                                                </xsl:for-each>
                                            </tbody>
                                        </table>

                                    </xsl:for-each>

                                </div>
                            </xsl:for-each>

                        </div>
                    </div>
                </xsl:for-each>
            </body>
        </html>

    </xsl:template>

    <xsl:template match="axe">
        <xsl:variable name="axe" select="@nom" />
        <h2> Axe <xsl:value-of select="$axe" /></h2>
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>


    <xsl:template match="/regularite-tgv/axe/gare-depart">
        <xsl:variable name="gareDepart" select="@nom" />
        <h3> Gare de départ <xsl:value-of
                select="$gareDepart" /></h3>
        <xsl:apply-templates></xsl:apply-templates>

    </xsl:template>

    <xsl:template match="/regularite-tgv/axe/gare-depart/gare-arrivee">
        <xsl:variable name="gareArrivee" select="@nom" />
        <h4> Gare de arrivée <xsl:value-of
                select="$gareArrivee" />
        </h4>
        <table border="2">

            <thead>
                <tr>
                    <th>Année</th>
                    <th>Mois</th>
                    <th>Nombre de trains programmés</th>
                    <th>Nombre de trains ayant circulé</th>
                    <th>Nombre de trains annulés</th>
                    <th>Nombre de trains en retart à l'arrivée</th>
                    <th>Régularité</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each
                    select="mesure">
                    <tr>
                        <td>
                            <xsl:value-of select="@annee" />
                        </td>
                        <td>
                            <xsl:value-of select="@mois" />
                        </td>
                        <td>
                            <xsl:value-of select="@trains-prevus" />
                        </td>
                        <td>
                            <xsl:value-of select="@trains-ok" />
                        </td>
                        <td>
                            <xsl:value-of select="@annules" />
                        </td>
                        <td>
                            <xsl:value-of select="@retards" />
                        </td>
                        <td>
                            <xsl:value-of select="@regularite" />
                        </td>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>

    </xsl:template>


</xsl:stylesheet>