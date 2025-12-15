<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat" />

<!-- Selecciona todos los nodos que cuelgan del XML del jardin Botánico -->
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
		
		<main>
			
			<xsl:variable name="mes" select="'11'" />
			<h1>Actividades del mes  <xsl:value-of select="$mes" /></h1>
			<!-- 
				Selecciona solo los eventos de noviembre guardados en la variable "mes"
				Ordenados de manera descendente, primero los de diciembre, al final los de enero.
				Lo hacemos con una plantilla en vez de usar un for-each
			 -->
			<xsl:apply-templates select="actividades/actividad[substring(fechaHora,6,2) = $mes]">
				<xsl:sort order="descending" select="fechaHora"/>
			</xsl:apply-templates>
			
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>

<!-- 
	Plantilla que se aplica a cada uno de las actividades
	Muestra el título de la actiividad y el total de responsables
	Además muestra la fecha y hora de la actividad y el lugar
	Para los responsables usa otra plantilla.
-->	

<xsl:template match="actividad">
	<article class="actividades">
		<h4> <xsl:value-of select="titulo" /> -  <xsl:value-of select="count(responsables/responsable)" /> Responsables</h4>
		<h2>Fecha: <xsl:value-of select="substring(fechaHora,1,10)" /> </h2>
		<h2> Hora: <xsl:value-of select="substring(fechaHora,12,5)"></xsl:value-of></h2>
		<h2> Lugar: <xsl:value-of select="@sala"></xsl:value-of></h2>
		<ul>
			<xsl:apply-templates select="responsables/responsable"/>
			
		</ul>
	</article>		

</xsl:template>

<!-- 
	Plantilla que se aplica a cada uno de los responsables
	Muestra el nombre y el email del responsable
-->	
<xsl:template match="responsable" >
	<li>
		<xsl:value-of select="nomresponsable" /> - <xsl:value-of select="email" />
	</li>	
</xsl:template>
</xsl:stylesheet>