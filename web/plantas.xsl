<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat" />

<!-- Selecciona todos los nodos que cuelgan del XML del jardin Botanico -->
<xsl:template match='/jardinBotanico'>
<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="zonas.xml">Zonas</a>
			<a href="plantas.xml">Plantas</a>
			<a href="actividades.xml">Actividades</a>
		</header>
		
		<main  id="jardinbotanico">
			<h1>PLANTAS</h1>
			<xsl:variable name="lumin" select="'Alta'" />
			
			<xsl:for-each select="plantas/planta">
				<article class="articulo">
					<!-- 
						Fijaros cómo se incluyen atributos y se concatena texto con valores del XML
						No es necesario usar la función concat(), ni los elementos <xsl:atribute> y <xsl:text>
					-->
					
					<img class="imagen" src="../img/{@foto}" />
					<xsl:if test="./luminosidad = $lumin">
						<img src="../img/{luminosidad}.png" class="alta-icono" />		
					</xsl:if>		
					
					<h2><a href="https://es.wikipedia.org/wiki/{@familia}" target="_blank"><xsl:value-of select="nombreComun" /></a> </h2>
					<h3><xsl:value-of select="luminosidad" /></h3>
					
				</article>
			</xsl:for-each>
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>
</xsl:stylesheet>