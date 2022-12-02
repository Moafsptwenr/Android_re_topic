.class public Lorg/litepal/util/BaseUtility;
.super Ljava/lang/Object;
.source "BaseUtility.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    return-void
.end method

.method public static capitalize(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 108
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 111
    :goto_0
    return-object v0

    :cond_0
    if-nez p0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    const-string v0, ""

    goto :goto_0
.end method

.method public static changeCase(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 56
    if-eqz p0, :cond_2

    .line 57
    invoke-static {}, Lorg/litepal/parser/LitePalAttr;->getInstance()Lorg/litepal/parser/LitePalAttr;

    move-result-object v1

    .line 58
    .local v1, "litePalAttr":Lorg/litepal/parser/LitePalAttr;
    invoke-virtual {v1}, Lorg/litepal/parser/LitePalAttr;->getCases()Ljava/lang/String;

    move-result-object v0

    .line 59
    .local v0, "cases":Ljava/lang/String;
    const-string v2, "keep"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 66
    .end local p0    # "string":Ljava/lang/String;
    :goto_0
    return-object p0

    .line 61
    .restart local p0    # "string":Ljava/lang/String;
    :cond_0
    const-string v2, "upper"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 62
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 64
    :cond_1
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 66
    .end local v0    # "cases":Ljava/lang/String;
    .end local v1    # "litePalAttr":Lorg/litepal/parser/LitePalAttr;
    :cond_2
    const/4 p0, 0x0

    goto :goto_0
.end method

.method public static varargs checkConditionsCorrect([Ljava/lang/String;)V
    .locals 5
    .param p0, "conditions"    # [Ljava/lang/String;

    .prologue
    .line 148
    if-eqz p0, :cond_0

    .line 149
    array-length v0, p0

    .line 150
    .local v0, "conditionsSize":I
    if-lez v0, :cond_0

    .line 151
    const/4 v3, 0x0

    aget-object v2, p0, v3

    .line 152
    .local v2, "whereClause":Ljava/lang/String;
    const-string v3, "?"

    invoke-static {v2, v3}, Lorg/litepal/util/BaseUtility;->count(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 153
    .local v1, "placeHolderSize":I
    add-int/lit8 v3, v1, 0x1

    if-eq v0, v3, :cond_0

    .line 154
    new-instance v3, Lorg/litepal/exceptions/DataSupportException;

    const-string v4, "The parameters in conditions are incorrect."

    invoke-direct {v3, v4}, Lorg/litepal/exceptions/DataSupportException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 158
    .end local v0    # "conditionsSize":I
    .end local v1    # "placeHolderSize":I
    .end local v2    # "whereClause":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public static containsIgnoreCases(Ljava/util/Collection;Ljava/lang/String;)Z
    .locals 4
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 84
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    if-nez p0, :cond_1

    .line 85
    const/4 v0, 0x0

    .line 97
    :cond_0
    :goto_0
    return v0

    .line 87
    :cond_1
    if-nez p1, :cond_2

    .line 88
    const/4 v2, 0x0

    invoke-interface {p0, v2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    .line 90
    :cond_2
    const/4 v0, 0x0

    .line 91
    .local v0, "contains":Z
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 92
    .local v1, "element":Ljava/lang/String;
    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 93
    const/4 v0, 0x1

    .line 94
    goto :goto_0
.end method

.method public static count(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "mark"    # Ljava/lang/String;

    .prologue
    .line 124
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 125
    const/4 v0, 0x0

    .line 126
    .local v0, "count":I
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 127
    .local v1, "index":I
    :goto_0
    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 128
    add-int/lit8 v0, v0, 0x1

    .line 129
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 130
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    goto :goto_0

    .line 134
    .end local v0    # "count":I
    .end local v1    # "index":I
    :cond_0
    const/4 v0, 0x0

    :cond_1
    return v0
.end method

.method public static isFieldTypeSupported(Ljava/lang/String;)Z
    .locals 2
    .param p0, "fieldType"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 169
    const-string v1, "boolean"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "java.lang.Boolean"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 196
    :cond_0
    :goto_0
    return v0

    .line 172
    :cond_1
    const-string v1, "float"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "java.lang.Float"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 175
    const-string v1, "double"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "java.lang.Double"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 178
    const-string v1, "int"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "java.lang.Integer"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 181
    const-string v1, "long"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "java.lang.Long"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 184
    const-string v1, "short"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "java.lang.Short"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 187
    const-string v1, "char"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "java.lang.Character"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 190
    const-string v1, "[B"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "[Ljava.lang.Byte;"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 193
    const-string v1, "java.lang.String"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "java.util.Date"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 196
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method public static isGenericTypeSupported(Ljava/lang/String;)Z
    .locals 2
    .param p0, "genericType"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 208
    const-string v1, "java.lang.String"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 225
    :cond_0
    :goto_0
    return v0

    .line 210
    :cond_1
    const-string v1, "java.lang.Integer"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 212
    const-string v1, "java.lang.Float"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 214
    const-string v1, "java.lang.Double"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 216
    const-string v1, "java.lang.Long"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 218
    const-string v1, "java.lang.Short"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 220
    const-string v1, "java.lang.Boolean"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 222
    const-string v1, "java.lang.Character"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 225
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isLitePalXMLExists()Z
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 234
    :try_start_0
    invoke-static {}, Lorg/litepal/LitePalApplication;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 235
    .local v0, "assetManager":Landroid/content/res/AssetManager;
    const-string v4, ""

    invoke-virtual {v0, v4}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 236
    .local v2, "fileNames":[Ljava/lang/String;
    if-eqz v2, :cond_0

    array-length v4, v2

    if-lez v4, :cond_0

    .line 237
    array-length v5, v2

    move v4, v3

    :goto_0
    if-ge v4, v5, :cond_0

    aget-object v1, v2, v4

    .line 238
    .local v1, "fileName":Ljava/lang/String;
    const-string v6, "litepal.xml"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-eqz v6, :cond_1

    .line 239
    const/4 v3, 0x1

    .line 245
    .end local v1    # "fileName":Ljava/lang/String;
    .end local v2    # "fileNames":[Ljava/lang/String;
    :cond_0
    :goto_1
    return v3

    .line 237
    .restart local v1    # "fileName":Ljava/lang/String;
    .restart local v2    # "fileNames":[Ljava/lang/String;
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 243
    .end local v1    # "fileName":Ljava/lang/String;
    .end local v2    # "fileNames":[Ljava/lang/String;
    :catch_0
    move-exception v4

    goto :goto_1
.end method
