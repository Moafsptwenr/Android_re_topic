.class public Lorg/litepal/LitePal;
.super Ljava/lang/Object;
.source "LitePal.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static deleteDatabase(Ljava/lang/String;)Z
    .locals 6
    .param p0, "dbName"    # Ljava/lang/String;

    .prologue
    .line 99
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 100
    const-string v3, ".db"

    invoke-virtual {p0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 101
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".db"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 103
    :cond_0
    invoke-static {}, Lorg/litepal/LitePalApplication;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 104
    .local v0, "dbFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 105
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v2

    .line 106
    .local v2, "result":Z
    if-eqz v2, :cond_1

    .line 107
    invoke-static {p0}, Lorg/litepal/LitePal;->removeVersionInSharedPreferences(Ljava/lang/String;)V

    .line 108
    invoke-static {}, Lorg/litepal/tablemanager/Connector;->clearLitePalOpenHelperInstance()V

    .line 121
    .end local v0    # "dbFile":Ljava/io/File;
    .end local v2    # "result":Z
    :cond_1
    :goto_0
    return v2

    .line 112
    .restart local v0    # "dbFile":Ljava/io/File;
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lorg/litepal/LitePalApplication;->getContext()Landroid/content/Context;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v4, v5}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/databases/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 113
    .local v1, "path":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    .end local v0    # "dbFile":Ljava/io/File;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 114
    .restart local v0    # "dbFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v2

    .line 115
    .restart local v2    # "result":Z
    if-eqz v2, :cond_1

    .line 116
    invoke-static {p0}, Lorg/litepal/LitePal;->removeVersionInSharedPreferences(Ljava/lang/String;)V

    .line 117
    invoke-static {}, Lorg/litepal/tablemanager/Connector;->clearLitePalOpenHelperInstance()V

    goto :goto_0

    .line 121
    .end local v0    # "dbFile":Ljava/io/File;
    .end local v1    # "path":Ljava/lang/String;
    .end local v2    # "result":Z
    :cond_3
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static getDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    .prologue
    .line 62
    invoke-static {}, Lorg/litepal/tablemanager/Connector;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static initialize(Landroid/content/Context;)V
    .locals 0
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 53
    sput-object p0, Lorg/litepal/LitePalApplication;->sContext:Landroid/content/Context;

    .line 54
    return-void
.end method

.method private static isDefaultDatabase(Ljava/lang/String;)Z
    .locals 4
    .param p0, "dbName"    # Ljava/lang/String;

    .prologue
    .line 144
    invoke-static {}, Lorg/litepal/util/BaseUtility;->isLitePalXMLExists()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 145
    const-string v2, ".db"

    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 146
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".db"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 148
    :cond_0
    invoke-static {}, Lorg/litepal/parser/LitePalParser;->parseLitePalConfiguration()Lorg/litepal/parser/LitePalConfig;

    move-result-object v0

    .line 149
    .local v0, "config":Lorg/litepal/parser/LitePalConfig;
    invoke-virtual {v0}, Lorg/litepal/parser/LitePalConfig;->getDbName()Ljava/lang/String;

    move-result-object v1

    .line 150
    .local v1, "defaultDbName":Ljava/lang/String;
    const-string v2, ".db"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 151
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".db"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 153
    :cond_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    .line 155
    .end local v0    # "config":Lorg/litepal/parser/LitePalConfig;
    .end local v1    # "defaultDbName":Ljava/lang/String;
    :goto_0
    return v2

    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static removeVersionInSharedPreferences(Ljava/lang/String;)V
    .locals 1
    .param p0, "dbName"    # Ljava/lang/String;

    .prologue
    .line 129
    invoke-static {p0}, Lorg/litepal/LitePal;->isDefaultDatabase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 130
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/litepal/util/SharedUtil;->removeVersion(Ljava/lang/String;)V

    .line 134
    :goto_0
    return-void

    .line 132
    :cond_0
    invoke-static {p0}, Lorg/litepal/util/SharedUtil;->removeVersion(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static use(Lorg/litepal/LitePalDB;)V
    .locals 2
    .param p0, "litePalDB"    # Lorg/litepal/LitePalDB;

    .prologue
    .line 71
    invoke-static {}, Lorg/litepal/parser/LitePalAttr;->getInstance()Lorg/litepal/parser/LitePalAttr;

    move-result-object v0

    .line 72
    .local v0, "litePalAttr":Lorg/litepal/parser/LitePalAttr;
    invoke-virtual {p0}, Lorg/litepal/LitePalDB;->getDbName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/litepal/parser/LitePalAttr;->setDbName(Ljava/lang/String;)V

    .line 73
    invoke-virtual {p0}, Lorg/litepal/LitePalDB;->getVersion()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/litepal/parser/LitePalAttr;->setVersion(I)V

    .line 74
    invoke-virtual {p0}, Lorg/litepal/LitePalDB;->isExternalStorage()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "external"

    :goto_0
    invoke-virtual {v0, v1}, Lorg/litepal/parser/LitePalAttr;->setStorage(Ljava/lang/String;)V

    .line 75
    invoke-virtual {p0}, Lorg/litepal/LitePalDB;->getClassNames()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/litepal/parser/LitePalAttr;->setClassNames(Ljava/util/List;)V

    .line 77
    invoke-virtual {p0}, Lorg/litepal/LitePalDB;->getDbName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/litepal/LitePal;->isDefaultDatabase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 78
    invoke-virtual {p0}, Lorg/litepal/LitePalDB;->getDbName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/litepal/parser/LitePalAttr;->setExtraKeyName(Ljava/lang/String;)V

    .line 79
    const-string v1, "lower"

    invoke-virtual {v0, v1}, Lorg/litepal/parser/LitePalAttr;->setCases(Ljava/lang/String;)V

    .line 81
    :cond_0
    invoke-static {}, Lorg/litepal/tablemanager/Connector;->clearLitePalOpenHelperInstance()V

    .line 82
    return-void

    .line 74
    :cond_1
    const-string v1, "internal"

    goto :goto_0
.end method

.method public static useDefault()V
    .locals 0

    .prologue
    .line 88
    invoke-static {}, Lorg/litepal/parser/LitePalAttr;->clearInstance()V

    .line 89
    invoke-static {}, Lorg/litepal/tablemanager/Connector;->clearLitePalOpenHelperInstance()V

    .line 90
    return-void
.end method
