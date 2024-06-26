<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:template match="/">
      <fo:root>
        <fo:layout-master-set>
          <fo:simple-page-master master-name="page-unique"
          page-height="29.7cm" page-width="21cm"
          margin-top="1.5cm" margin-bottom="2cm"
          margin-left="2.5cm" margin-right="1cm">
            <fo:region-body background-color="#CCCCCC"/>
          </fo:simple-page-master>
        </fo:layout-master-set>

        <fo:page-sequence master-reference="page-unique">
          <fo:flow flow-name="xsl-region-body">
          <fo:block>Hello World !</fo:block>
          </fo:flow>
        </fo:page-sequence>
      </fo:root>
    </xsl:template>
</xsl:stylesheet>