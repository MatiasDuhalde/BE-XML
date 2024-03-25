<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/regularite-tgv">
        <html>
            <body>
                <h1>
                    Régularité des TGV
                </h1>
                <xsl:apply-templates></xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="axe">
        <xsl:variable name="axe" select="@nom" />
        <h2> Axe <xsl:value-of select="$axe" /></h2>
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>


    <xsl:template match="/regularite-tgv/axe/gare-depart">
        <xsl:variable name="gare-depart" select="@nom" />
        <h3> Gare de départ <xsl:value-of
                select="$gare-depart" /></h3>

    </xsl:template>

    <xsl:template match="/regularite-tgv/axe/gare-depart/gare-arrive">

        <!-- <table border="2">
        <thead>
            <tr>
                <th>Année</th>
                <th>Mois</th>
                <th>Axe</th>
                <th>Départ</th>
                <th>Arrivée</th>
                <th>Nombre de trains programmés</th>
                <th>Nombre de trains ayant circulé</th>
                <th>Nombre de trains annulés</th>
                <th>Nombre de trains en retart à l'arrivée</th>
                <th>Régularité</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
        <xsl:for-each select="gare-arrivee">
            <xsl:variable name="gareDepart" select="@nom" />
            <xsl:for-each select="gare-arrivee">
                <xsl:variable name="gareArrivee" select="@nom" />
                <xsl:for-each select="mesure">
                    <tr>
                        <td>
                            <xsl:value-of select="@annee" />
                        </td>
                        <td>
                            <xsl:value-of select="@mois" />
                        </td>
                        <td>
                            <xsl:value-of select="$axe" />
                        </td>
                        <td>
                            <xsl:value-of select="$gareDepart" />
                        </td>
                        <td>
                            <xsl:value-of select="$gareArrivee" />
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
            </xsl:for-each>
        </xsl:for-each> -->
    </xsl:template>


</xsl:stylesheet>