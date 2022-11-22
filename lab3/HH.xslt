<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

	<xsl:template match="/">

		<html>
			<head>
				<meta charset="UTF-8" />
				<title>Hypertext hypermedia</title>
				<meta name="viewport" content="width=device-width, initial-scale=1.0" />
				<link rel="stylesheet" href="index.css" />
			</head>
			<body>
				<div id="wrapper">
					<header>
						<h1>Hypertext hypermedia</h1>
					</header>

					<!-- menu do poruszania w obrębie strony -->
					<xsl:call-template name="menu"></xsl:call-template>
					<!-- menu for moving within a page -->


					<div id="content">
						<h2 id="scientists">Scientists</h2>
						<xsl:apply-templates select="hypertext/people"></xsl:apply-templates>
						<!-- a place for information about hypertext scientists -->

						<h2 id="systems">Systems</h2>
						<!-- a place for information about hypertext systems -->
						<xsl:apply-templates select="hypertext/systemList"></xsl:apply-templates>

					</div>
					<!-- end content -->
				</div>
				<!-- end wrapper -->
				<footer>
					<xsl:apply-templates select="hypertext/author"/>	<!-- wywołanie szablonu pozwalającego na wyświetlenie informacji o imieniu oraz nazwisku studenta -->
				</footer>
			</body>
		</html>

	</xsl:template>

	<xsl:template match="author">
		Copyright 2022, <xsl:value-of select="surname"/> <xsl:value-of select="name"/>
	</xsl:template>

	<xsl:template name="menu">
		<nav>
			<ul>
				<li>
					<a href="#scientists">Scientists</a>
				</li>
				<li>
					<a href="#systems">Systems</a>
				</li>
			</ul>
		</nav>
	</xsl:template>

	<xsl:template match="system">
		<h3>
			<xsl:value-of select="name"/>
		</h3>
		<p>
			<xsl:value-of select="description"/>
		</p>
		<ul>
			<xsl:apply-templates select="link[position()!=last()]"></xsl:apply-templates>
		</ul>
	</xsl:template>

	<xsl:template match="link">
		<li>
			<xsl:element name="a">
				<xsl:attribute name="href">
					<xsl:value-of select="@source"/>
				</xsl:attribute>
				<xsl:value-of select="."/>
			</xsl:element>
		</li>
	</xsl:template>

	<xsl:template match="person">
		<h3>
			<xsl:value-of select="name"/>
		</h3>
		<p>
			Date of birth: <xsl:value-of select="birth"/>
		</p>
		<xsl:if test="@alive='no'">
			<p>
				Date of death: <xsl:value-of select="death"/>
			</p>
		</xsl:if>
		<xsl:apply-templates select="image"></xsl:apply-templates>
		<p>
			<xsl:value-of select="about"/>
		</p>
		<ul>
			<xsl:apply-templates select="link"></xsl:apply-templates>
		</ul>
		<xsl:for-each select="achievementList/achievement">
			<xsl:sort select="title"/>
			<p>
				<xsl:number value="position()" format="1) "/> 
				<xsl:value-of select="title"/><br/>
				<xsl:value-of select="description"/>
			</p>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="image">
		<xsl:element name="img">
			<xsl:attribute name="class">right</xsl:attribute>
			<xsl:attribute name="src">
				<xsl:value-of select="@source"/>
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="."/>
			</xsl:attribute>
		</xsl:element>
	</xsl:template>

<!--		<nav>
			<ul>
				<li> <a href="#scientists">Scientists</a> </li>
				<li> <a href="#systems">Systems</a> 	</li>
			</ul>
		</nav>	
-->

</xsl:stylesheet>
