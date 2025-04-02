<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template name="service_list">
        <h2><xsl:value-of select="/service/name"/></h2>
            
        <p class="post-info">
            <xsl:value-of select="/service/firm_name"/> | 
            <xsl:value-of select="/service/address/city"/>, <xsl:value-of select="/service/address/street"/>
            <span style="float:right;">ID на услугата: <xsl:value-of select="/service/@id"/></span>
        </p>
            
        <div class="info">
            <p>
                <em><xsl:value-of select="/service/description"/></em>
            </p>

            <p>
                <strong>Тип почистване:</strong> 
                <xsl:value-of select="/service/@typeRef"/> 
                (<xsl:value-of select="/service/type_of_cleaning/@machines_usage"/> machines)
            </p>

            <xsl:if test="/service/type_of_cleaning/@machines_usage='yes'">
                <h3>Информация за използваните машини:</h3>
                <xsl:for-each select="/service/type_of_cleaning/machines_description/machine">
                    <div class="machine-details">
                        <h4><xsl:value-of select="machine_name"/></h4>
                        <p>
                            <strong>Модел:</strong> <xsl:value-of select="model"/><br/>
                            <strong>Мощност:</strong> <xsl:value-of select="specifications/power"/><br/>
                            <strong>Капацитет:</strong> <xsl:value-of select="specifications/capacity"/><br/>
                            <strong>Изображение:</strong><br/>
                            <img src="{image}" alt="{machine_name}" width="250px"/>
                        </p>
                    </div>
                </xsl:for-each>
            </xsl:if>

            <p>
                <strong>Цена за единица почиствана площ:</strong><br/>
                Зимен период: <xsl:value-of select="/service/price/season/winter"/> лв. |
                Пролетен период: <xsl:value-of select="/service/price/season/spring"/> лв. |
                Есенен период: <xsl:value-of select="/service/price/season/autumn"/> лв. |
                Летен период: <xsl:value-of select="/service/price/season/summer"/> лв.
            </p>

            <p>
                <strong>Контакти:</strong><br/>
                Телефон: <xsl:value-of select="/service/phone"/><br/>
                Електронна поща: <xsl:value-of select="/service/email"/><br/>
                Уебсайт: 
                <a href="{/service/site}" target="_blank">
                    <xsl:value-of select="/service/site"/>
                </a>
            </p>

            <p style="text-align:right;">
                Дата на сертификация на услугата: 
                <xsl:value-of select="/service/date/day"/>.
                <xsl:value-of select="/service/date/month"/>.
                <xsl:value-of select="/service/date/year"/>
            </p>
        </div>
    </xsl:template>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
            <head>
                <title>Услуга по почистване</title>
                <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
                <link rel="stylesheet" href="cleaning_service_style_CS0002.css" type="text/css"/>
            </head>
            <body>
                <div id="wrap">
                    <div id="header">			
                        <h1 id="logo-text">
                            <a href="#">Услуга по почистване</a>
                        </h1>		
                    </div>
                    <div id="content">
                        <div id="main">
                            <h1>Налична услуга по почистване</h1> 
                            <xsl:call-template name="service_list"/>
                        </div>
                    </div>
                    <div id="footer">
                        <p></p>			
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
