<!-- 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">

<xsl:output method="xml" indent="yes"/>
    <xsl:template match="//ResultSet">
        <xsl:copy-of select="."/>
    </xsl:template>
</xsl:stylesheet>  -->

 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
 xmlns:orderRes="http://com.univar/data/enterprise/business/order/message/1.0">

 <xsl:output method="xml" omit-xml-declaration="yes"/>

  <xsl:template match="orderRes:ResultSet">    
  
        <xsl:copy-of select="*"/>
    </xsl:template> 
   
</xsl:stylesheet>