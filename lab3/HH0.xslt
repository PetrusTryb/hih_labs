<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

	<xsl:template match="/">

		<html>
			<head>
				<meta charset="UTF-8" />
			</head>
			<body>
					<header>
						<h3>Hypertext hypermedia</h3>
					</header>

				<section>
					<xsl:apply-templates select="hypertext/people/person"/>  <!-- wywołanie szablonu pozwalającego na wyświetlenie informacji o imieniu oraz nazwisku osób -->
				</section>
			</body>
		</html>

	</xsl:template>
	<xsl:template match="hypertext/people/person">
			<xsl:value-of select="name"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="surname"/>
			<br/>
	</xsl:template>

	

</xsl:stylesheet>
