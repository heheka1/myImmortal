<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns="http://www.w3.org/1999/xhtml"
  version="3.0">
    
    <xsl:variable name="immortalColl" as="document-node()+" 
        select="collection('../myImmortal/chapters/?select=*.xml')"/>
    
    <xsl:variable name="introFile" as="document-node()" select="doc('../myImmortal/chapters/introChapter1-2.xml')"/>
    <xsl:variable name="characterList" as="document-node()" select="doc('../myImmortal/characterList.xml')"/>
    <xsl:template match="/">
        <html>
          <head>
              
             
              <title>
                  <xsl:apply-templates select="descendant::title"></xsl:apply-templates>
                  
              </title>
              <link rel="stylesheet" href="style.css"/>
              <nav>
                  <a href="index.html">Home</a> | <a href="webCharacter.html">Character List</a> | <a href="myImmortalintro.html">Full Fanfiction</a> | <a href="markupStrat.html">Markup Strategy</a>
                  | <a href="https://github.com/heheka1/myImmortal">Github</a> 
              </nav>
          </head>  
            <body>
                
                <h1>My Immortal, as edited by us!</h1>
                
                <h2>About this edition</h2>
                
          
            <xsl:apply-templates select="$introFile//teiHeader//titleStmt" mode="top">
                   <xsl:sort select="(following::text/front//titlePart[1])/@n"/>
                </xsl:apply-templates>
                
                <!-- ebb: 2025-12-10: At this point, Knox and I realize that we have to control the sort order of 
                    <text> elements, NOT one thing on each file. So we need to plant an attribute on each text element
                    in the source files because there are MULTIPLE <text> elements. 
                    We will do this with a nice identity transformation so we don't go blind!
              -->
                
                <xsl:apply-templates select="$immortalColl//text">
                    <xsl:sort select="child::front//titlePart[@n][1]/@n ! xs:integer(.)" order="ascending"/>
                </xsl:apply-templates>
                
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="titleStmt" mode="top">
        
        <h3><xsl:text>Author: </xsl:text>
        <xsl:apply-templates select="author"/></h3>
        
        <h3>Editing and encoding by</h3>
        <ul>
            <xsl:apply-templates select="editor" mode="top"/>
        </ul>
        <p><xsl:apply-templates select="publicationStmt"/></p>
    </xsl:template>
    
    <xsl:template match="editor" mode="top">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    
    <xsl:template match="teiHeader">
        <h1><xsl:apply-templates select="descendant::titleStmt"/></h1>
    </xsl:template>
    
    <xsl:template match="docTitle">
        <h2><xsl:apply-templates/></h2>
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
    <xsl:template match="name">
        
        <span class="{name()}" 
            title="{$characterList//*[@xml:id = current()/@ref]//forename/@type || ' ' ||
            $characterList//*[@xml:id = current()/@ref]//surname/@type 
            }">
            <!-- ebb: This outputs the name of the element <span class="name"> in this case. -->
        <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="w">
        <span class="w"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="rs">
        <span class="rs"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="note">
        <span class="note"><xsl:apply-templates/></span>
    </xsl:template>
    
        <xsl:template match="said">
            <q>
                <xsl:apply-templates/>
            </q>
        </xsl:template>
   
       
    
</xsl:stylesheet>