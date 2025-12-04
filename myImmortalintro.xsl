<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
  xmlns="http://www.w3.org/1999/xhtml"
  version="3.0">
    
    <xsl:variable name="immortalColl" as="document-node()+" 
        select="collection('../myImmortal/?select=*.xml')"/>
    
    <xsl:template match="/">
        <html>
          <head>
              
             
              <title>
                  <xsl:apply-templates select="descendant::title"></xsl:apply-templates>
                  
              </title>
              <link rel="stylesheet" href="style.css"/>
          </head>  
            <body>
                
                <h3> <xsl:apply-templates select="descendant::titlePart"/></h3>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="docTitle">
        <h1><xsl:apply-templates/></h1>
    </xsl:template>
    <xsl:template match="text">
        <section>
            <xsl:apply-templates/>
        </section>
        
    </xsl:template>
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="teiHeader">
        <head>
            <xsl:apply-templates/>
        </head>
        
    </xsl:template>
    
</xsl:stylesheet>