<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
  xmlns="http://www.w3.org/1999/xhtml"
  version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    
    <xsl:variable name="immortalColl" as="document-node()+" 
        select="collection('../myImmortal/?select=*.xml')"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Character List</title>
                <link rel="stylesheet" type="text/css" href="style.css" />
            </head>
            <body>
                <div class="header">
                    <nav>
                        <a href="index.html">Home</a> | <a href="characterList.html">Character List</a> | <a href="myImmortalintro.html">Full Fanfiction</a> | <a href="markupStrat.html">Markup Strategy</a>
                        | <a href="https://github.com/heheka1/myImmortal">Github</a>
                    </nav>
                </div>
            <section>  
                <h1><xsl:apply-templates select="descendant::titleStmt/title"/></h1>
              
                <table>
                    <tr>
                        <th>Name(s)</th>
                        <th>Nickname</th>
                        <th>Note</th>
                    </tr>
                    <xsl:apply-templates select="descendant::person">
                        <xsl:sort select="descendant::person/surname/@type"/>
                    </xsl:apply-templates>
                </table>
            </section>
            </body>  
        </html>
    </xsl:template>
    
 
    <xsl:template match="person">
      <tr id="{@xml:id}">
          
          <td><strong><xsl:value-of select="descendant::forename/@type 
                      || ' ' || descendant::surname/@type"/></strong>
            <xsl:value-of select="', ' || descendant::roleName/@type"/></td> 
         <td> <xsl:if test="descendant::addName">
              <xsl:value-of select=" ' Additional Name (' || descendant::addName/@type || ') '"/>
              <xsl:apply-templates select="descendant::addName"/>
          </xsl:if></td>
         
          
          <td>    <xsl:for-each select="descendant::note">
                  <xsl:if test="current() ! string-length() gt 1">
                  <p><strong><xsl:value-of select="current()/@type || ': '"/></strong>
                  <xsl:apply-templates select="current()"/></p>
                  </xsl:if>
              </xsl:for-each></td>
              
          
      </tr>
        
        
    </xsl:template>
   
       
    
</xsl:stylesheet>