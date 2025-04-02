<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="bg">
            <head>
                <meta charset="UTF-8"/>
                <title>Списък на услугите</title>
                <link rel="stylesheet" href="index.css"/>
            </head>
            <body>
                <div id="wrap">
                    <div id="header">
                        <h1>Списък с услуги</h1>
                    </div>

                    <div id="content">
                        <ul class="service-list">
                            <xsl:for-each select="services/service">
                                <li>
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="concat('cleaning_service_', @id, '.html')"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="name"/>
                                    </a>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>