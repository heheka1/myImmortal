<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title> 
                    <xsl:apply-templates select="descendant::titleStmt/title"/>
                </title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
               <h1> <xsl:apply-templates select="descendant::titleStmt/title"/></h1>
                <xsl:apply-templates select="descendant::body"/>
            </body> 
        </html>
    </xsl:template>
    
    <xsl:template match="p"> 
        <p><xsl:apply-templates/></p> 
    </xsl:template>
    
    <xsl:template match="name">
       <span class="name">
           <a href="characterList.html#{@ref}"><xsl:apply-templates/></a>
       </span> 
    </xsl:template>
    
</xsl:stylesheet>