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
			<h1>ZONAS</h1>
			<table>
				<tr>
					<th>ZONA</th>
					<th>Ubicación</th>
					<th>Horario</th>
					
				</tr>
				<!-- 
				Selecciona solo las zonas que tengan su apertura antes o igual que las 10:00
				Muestra el nombre, la ubicación y el horaioapertura-horariocierre.
				Aquellas, ubicaciones que contengan la palabra exterior habrá identificarlas en azul
			    -->
			<xsl:for-each select="zonas/zona[number(substring-before(horarioapertura, ':')) &lt;= 10 ]">
				<tr>
					<td><xsl:value-of select="nombre" /></td>
					<xsl:choose>
						<xsl:when test="contains(ubicacion, 'Exterior')">
						<!--no hace falta el uso de <xsl:atribute></xsl:atribute>-->
						<td class="azul"> <xsl:value-of select="ubicacion"/></td>
						</xsl:when>
						<xsl:otherwise>
							<td> <xsl:value-of select="ubicacion"/></td>
						</xsl:otherwise>
					</xsl:choose>
					<td><xsl:value-of select="horarioapertura" /> - <xsl:value-of select="horariocierre" /></td>
				</tr>
			</xsl:for-each>
			
			</table>			
		</main>
		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>
</xsl:stylesheet>