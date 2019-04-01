<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:outline="http://wkhtmltopdf.org/outline" 
  xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" indent="yes" />
  <xsl:template match="outline:outline">
    <html>
      <head>
        <title>Table of Contents</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <style>
          body {
            padding: 6em;
          }
          a, span {
            font-size: 12px;
          }
          .title {
            font-size: 50px;
            font-family: "Segoe WPC", "Segoe UI", "SFUIText-Light", "HelveticaNeue-Light", sans-serif, "Droid Sans Fallback";
            font-weight: bold;
          }
          div {border-bottom: 0.5px dashed rgb(200,200,200); margin-bottom: 0.2em;}
          span {float: right;}
          li {list-style: none;}
          ul {
            font-size: 20px;
            font-family: "Segoe WPC", "Segoe UI", "SFUIText-Light", "HelveticaNeue-Light", sans-serif, "Droid Sans Fallback";
            margin-bottom: 0.5em;
            padding-left: 0em;
          }
          ul li { font-weight: bold; }
          ul li ul li { font-weight: 300; }
          ul ul {
            font-size: 100%; 
            margin-bottom: 0.5em; 
          }
          
          ul ul {padding-left: 1em;}
          ul ul ul ul { display: none; }
          ul ul ul ul ul { display: none; }
          ul ul ul ul ul ul { display: none; }
          a {text-decoration:none; color: black;}
        </style>
      </head>
      <body>
        <p class="title">Table of Contents</p>
        <ul>
          <xsl:apply-templates select="outline:item/outline:item"/>
        </ul>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="outline:item">
    <li>
      <xsl:if test="@title!=''">
        <div>
          <a>
            <xsl:if test="@link">
              <xsl:attribute name="href">
                <xsl:value-of select="@link"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@backLink">
              <xsl:attribute name="name">
                <xsl:value-of select="@backLink"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="@title" />
          </a>
          <span>
            <xsl:value-of select="@page" />
          </span>
        </div>
      </xsl:if>
      <ul>
        <xsl:comment>added to prevent self-closing tags in QtXmlPatterns</xsl:comment>
        <xsl:apply-templates select="outline:item"/>
      </ul>
    </li>
  </xsl:template>
</xsl:stylesheet>