.class public Lorg/litepal/parser/LitePalParser;
.super Ljava/lang/Object;
.source "LitePalParser.java"


# static fields
.field static final ATTR_CLASS:Ljava/lang/String; = "class"

.field static final ATTR_VALUE:Ljava/lang/String; = "value"

.field static final NODE_CASES:Ljava/lang/String; = "cases"

.field static final NODE_DB_NAME:Ljava/lang/String; = "dbname"

.field static final NODE_LIST:Ljava/lang/String; = "list"

.field static final NODE_MAPPING:Ljava/lang/String; = "mapping"

.field static final NODE_STORAGE:Ljava/lang/String; = "storage"

.field static final NODE_VERSION:Ljava/lang/String; = "version"

.field private static parser:Lorg/litepal/parser/LitePalParser;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getConfigInputStream()Ljava/io/InputStream;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 196
    invoke-static {}, Lorg/litepal/LitePalApplication;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 197
    .local v0, "assetManager":Landroid/content/res/AssetManager;
    const-string v3, ""

    invoke-virtual {v0, v3}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 198
    .local v2, "fileNames":[Ljava/lang/String;
    if-eqz v2, :cond_1

    array-length v3, v2

    if-lez v3, :cond_1

    .line 199
    array-length v4, v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v1, v2, v3

    .line 200
    .local v1, "fileName":Ljava/lang/String;
    const-string v5, "litepal.xml"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 201
    const/4 v3, 0x3

    invoke-virtual {v0, v1, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;

    move-result-object v3

    return-object v3

    .line 199
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 205
    .end local v1    # "fileName":Ljava/lang/String;
    :cond_1
    new-instance v3, Lorg/litepal/exceptions/ParseConfigurationFileException;

    const-string v4, "litepal.xml file is missing. Please ensure it under assets folder."

    invoke-direct {v3, v4}, Lorg/litepal/exceptions/ParseConfigurationFileException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static parseLitePalConfiguration()Lorg/litepal/parser/LitePalConfig;
    .locals 1

    .prologue
    .line 99
    sget-object v0, Lorg/litepal/parser/LitePalParser;->parser:Lorg/litepal/parser/LitePalParser;

    if-nez v0, :cond_0

    .line 100
    new-instance v0, Lorg/litepal/parser/LitePalParser;

    invoke-direct {v0}, Lorg/litepal/parser/LitePalParser;-><init>()V

    sput-object v0, Lorg/litepal/parser/LitePalParser;->parser:Lorg/litepal/parser/LitePalParser;

    .line 102
    :cond_0
    sget-object v0, Lorg/litepal/parser/LitePalParser;->parser:Lorg/litepal/parser/LitePalParser;

    invoke-direct {v0}, Lorg/litepal/parser/LitePalParser;->usePullParse()Lorg/litepal/parser/LitePalConfig;

    move-result-object v0

    return-object v0
.end method

.method private usePullParse()Lorg/litepal/parser/LitePalConfig;
    .locals 13

    .prologue
    .line 146
    :try_start_0
    new-instance v6, Lorg/litepal/parser/LitePalConfig;

    invoke-direct {v6}, Lorg/litepal/parser/LitePalConfig;-><init>()V

    .line 147
    .local v6, "litePalConfig":Lorg/litepal/parser/LitePalConfig;
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v5

    .line 148
    .local v5, "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {v5}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v10

    .line 149
    .local v10, "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    invoke-direct {p0}, Lorg/litepal/parser/LitePalParser;->getConfigInputStream()Ljava/io/InputStream;

    move-result-object v11

    const-string v12, "UTF-8"

    invoke-interface {v10, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 150
    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v4

    .line 151
    .local v4, "eventType":I
    :goto_0
    const/4 v11, 0x1

    if-eq v4, v11, :cond_5

    .line 152
    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    .line 153
    .local v7, "nodeName":Ljava/lang/String;
    packed-switch v4, :pswitch_data_0

    .line 176
    :cond_0
    :goto_1
    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v4

    .line 177
    goto :goto_0

    .line 155
    :pswitch_0
    const-string v11, "dbname"

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 156
    const-string v11, ""

    const-string v12, "value"

    invoke-interface {v10, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 157
    .local v2, "dbName":Ljava/lang/String;
    invoke-virtual {v6, v2}, Lorg/litepal/parser/LitePalConfig;->setDbName(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 179
    .end local v2    # "dbName":Ljava/lang/String;
    .end local v4    # "eventType":I
    .end local v5    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v6    # "litePalConfig":Lorg/litepal/parser/LitePalConfig;
    .end local v7    # "nodeName":Ljava/lang/String;
    .end local v10    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_0
    move-exception v3

    .line 180
    .local v3, "e":Lorg/xmlpull/v1/XmlPullParserException;
    new-instance v11, Lorg/litepal/exceptions/ParseConfigurationFileException;

    const-string v12, "can not parse the litepal.xml, check if it\'s in correct format"

    invoke-direct {v11, v12}, Lorg/litepal/exceptions/ParseConfigurationFileException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 158
    .end local v3    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v4    # "eventType":I
    .restart local v5    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v6    # "litePalConfig":Lorg/litepal/parser/LitePalConfig;
    .restart local v7    # "nodeName":Ljava/lang/String;
    .restart local v10    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_1
    :try_start_1
    const-string v11, "version"

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 159
    const-string v11, ""

    const-string v12, "value"

    invoke-interface {v10, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 160
    .local v9, "version":Ljava/lang/String;
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    invoke-virtual {v6, v11}, Lorg/litepal/parser/LitePalConfig;->setVersion(I)V
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 182
    .end local v4    # "eventType":I
    .end local v5    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v6    # "litePalConfig":Lorg/litepal/parser/LitePalConfig;
    .end local v7    # "nodeName":Ljava/lang/String;
    .end local v9    # "version":Ljava/lang/String;
    .end local v10    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_1
    move-exception v3

    .line 183
    .local v3, "e":Ljava/io/IOException;
    new-instance v11, Lorg/litepal/exceptions/ParseConfigurationFileException;

    const-string v12, "IO exception happened"

    invoke-direct {v11, v12}, Lorg/litepal/exceptions/ParseConfigurationFileException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 161
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v4    # "eventType":I
    .restart local v5    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v6    # "litePalConfig":Lorg/litepal/parser/LitePalConfig;
    .restart local v7    # "nodeName":Ljava/lang/String;
    .restart local v10    # "xmlPullParser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_2
    :try_start_2
    const-string v11, "mapping"

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 162
    const-string v11, ""

    const-string v12, "class"

    invoke-interface {v10, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 163
    .local v1, "className":Ljava/lang/String;
    invoke-virtual {v6, v1}, Lorg/litepal/parser/LitePalConfig;->addClassName(Ljava/lang/String;)V

    goto :goto_1

    .line 164
    .end local v1    # "className":Ljava/lang/String;
    :cond_3
    const-string v11, "cases"

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 165
    const-string v11, ""

    const-string v12, "value"

    invoke-interface {v10, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 166
    .local v0, "cases":Ljava/lang/String;
    invoke-virtual {v6, v0}, Lorg/litepal/parser/LitePalConfig;->setCases(Ljava/lang/String;)V

    goto :goto_1

    .line 167
    .end local v0    # "cases":Ljava/lang/String;
    :cond_4
    const-string v11, "storage"

    invoke-virtual {v11, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 168
    const-string v11, ""

    const-string v12, "value"

    invoke-interface {v10, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 169
    .local v8, "storage":Ljava/lang/String;
    invoke-virtual {v6, v8}, Lorg/litepal/parser/LitePalConfig;->setStorage(Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 178
    .end local v7    # "nodeName":Ljava/lang/String;
    .end local v8    # "storage":Ljava/lang/String;
    :cond_5
    return-object v6

    .line 153
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method private useSAXParser()V
    .locals 6

    .prologue
    .line 117
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v1

    .line 118
    .local v1, "factory":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v1}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v4

    invoke-virtual {v4}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v3

    .line 119
    .local v3, "xmlReader":Lorg/xml/sax/XMLReader;
    new-instance v2, Lorg/litepal/parser/LitePalContentHandler;

    invoke-direct {v2}, Lorg/litepal/parser/LitePalContentHandler;-><init>()V

    .line 120
    .local v2, "handler":Lorg/litepal/parser/LitePalContentHandler;
    invoke-interface {v3, v2}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 121
    new-instance v4, Lorg/xml/sax/InputSource;

    invoke-direct {p0}, Lorg/litepal/parser/LitePalParser;->getConfigInputStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-interface {v3, v4}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    .line 134
    return-void

    .line 122
    .end local v1    # "factory":Ljavax/xml/parsers/SAXParserFactory;
    .end local v2    # "handler":Lorg/litepal/parser/LitePalContentHandler;
    .end local v3    # "xmlReader":Lorg/xml/sax/XMLReader;
    :catch_0
    move-exception v0

    .line 123
    .local v0, "e":Landroid/content/res/Resources$NotFoundException;
    new-instance v4, Lorg/litepal/exceptions/ParseConfigurationFileException;

    const-string v5, "litepal.xml file is missing. Please ensure it under assets folder."

    invoke-direct {v4, v5}, Lorg/litepal/exceptions/ParseConfigurationFileException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 125
    .end local v0    # "e":Landroid/content/res/Resources$NotFoundException;
    :catch_1
    move-exception v0

    .line 126
    .local v0, "e":Lorg/xml/sax/SAXException;
    new-instance v4, Lorg/litepal/exceptions/ParseConfigurationFileException;

    const-string v5, "can not parse the litepal.xml, check if it\'s in correct format"

    invoke-direct {v4, v5}, Lorg/litepal/exceptions/ParseConfigurationFileException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 128
    .end local v0    # "e":Lorg/xml/sax/SAXException;
    :catch_2
    move-exception v0

    .line 129
    .local v0, "e":Ljavax/xml/parsers/ParserConfigurationException;
    new-instance v4, Lorg/litepal/exceptions/ParseConfigurationFileException;

    const-string v5, "parse configuration is failed"

    invoke-direct {v4, v5}, Lorg/litepal/exceptions/ParseConfigurationFileException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 131
    .end local v0    # "e":Ljavax/xml/parsers/ParserConfigurationException;
    :catch_3
    move-exception v0

    .line 132
    .local v0, "e":Ljava/io/IOException;
    new-instance v4, Lorg/litepal/exceptions/ParseConfigurationFileException;

    const-string v5, "IO exception happened"

    invoke-direct {v4, v5}, Lorg/litepal/exceptions/ParseConfigurationFileException;-><init>(Ljava/lang/String;)V

    throw v4
.end method
