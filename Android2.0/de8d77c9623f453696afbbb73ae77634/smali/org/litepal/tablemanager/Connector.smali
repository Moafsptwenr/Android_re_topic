.class public Lorg/litepal/tablemanager/Connector;
.super Ljava/lang/Object;
.source "Connector.java"


# static fields
.field private static mLitePalHelper:Lorg/litepal/tablemanager/LitePalOpenHelper;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static buildConnection()Lorg/litepal/tablemanager/LitePalOpenHelper;
    .locals 5

    .prologue
    .line 98
    invoke-static {}, Lorg/litepal/parser/LitePalAttr;->getInstance()Lorg/litepal/parser/LitePalAttr;

    move-result-object v1

    .line 99
    .local v1, "litePalAttr":Lorg/litepal/parser/LitePalAttr;
    invoke-virtual {v1}, Lorg/litepal/parser/LitePalAttr;->checkSelfValid()V

    .line 100
    sget-object v2, Lorg/litepal/tablemanager/Connector;->mLitePalHelper:Lorg/litepal/tablemanager/LitePalOpenHelper;

    if-nez v2, :cond_1

    .line 101
    invoke-virtual {v1}, Lorg/litepal/parser/LitePalAttr;->getDbName()Ljava/lang/String;

    move-result-object v0

    .line 102
    .local v0, "dbName":Ljava/lang/String;
    const-string v2, "external"

    invoke-virtual {v1}, Lorg/litepal/parser/LitePalAttr;->getStorage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 103
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lorg/litepal/LitePalApplication;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/databases/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 105
    :cond_0
    new-instance v2, Lorg/litepal/tablemanager/LitePalOpenHelper;

    invoke-virtual {v1}, Lorg/litepal/parser/LitePalAttr;->getVersion()I

    move-result v3

    invoke-direct {v2, v0, v3}, Lorg/litepal/tablemanager/LitePalOpenHelper;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lorg/litepal/tablemanager/Connector;->mLitePalHelper:Lorg/litepal/tablemanager/LitePalOpenHelper;

    .line 107
    .end local v0    # "dbName":Ljava/lang/String;
    :cond_1
    sget-object v2, Lorg/litepal/tablemanager/Connector;->mLitePalHelper:Lorg/litepal/tablemanager/LitePalOpenHelper;

    return-object v2
.end method

.method public static clearLitePalOpenHelperInstance()V
    .locals 1

    .prologue
    .line 114
    sget-object v0, Lorg/litepal/tablemanager/Connector;->mLitePalHelper:Lorg/litepal/tablemanager/LitePalOpenHelper;

    if-eqz v0, :cond_0

    .line 115
    sget-object v0, Lorg/litepal/tablemanager/Connector;->mLitePalHelper:Lorg/litepal/tablemanager/LitePalOpenHelper;

    invoke-virtual {v0}, Lorg/litepal/tablemanager/LitePalOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 116
    const/4 v0, 0x0

    sput-object v0, Lorg/litepal/tablemanager/Connector;->mLitePalHelper:Lorg/litepal/tablemanager/LitePalOpenHelper;

    .line 118
    :cond_0
    return-void
.end method

.method public static getDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    .prologue
    .line 81
    invoke-static {}, Lorg/litepal/tablemanager/Connector;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 68
    const-class v2, Lorg/litepal/tablemanager/Connector;

    monitor-enter v2

    :try_start_0
    invoke-static {}, Lorg/litepal/tablemanager/Connector;->buildConnection()Lorg/litepal/tablemanager/LitePalOpenHelper;

    move-result-object v0

    .line 69
    .local v0, "litePalHelper":Lorg/litepal/tablemanager/LitePalOpenHelper;
    invoke-virtual {v0}, Lorg/litepal/tablemanager/LitePalOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    monitor-exit v2

    return-object v1

    .line 68
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 3

    .prologue
    .line 57
    const-class v2, Lorg/litepal/tablemanager/Connector;

    monitor-enter v2

    :try_start_0
    invoke-static {}, Lorg/litepal/tablemanager/Connector;->buildConnection()Lorg/litepal/tablemanager/LitePalOpenHelper;

    move-result-object v0

    .line 58
    .local v0, "litePalHelper":Lorg/litepal/tablemanager/LitePalOpenHelper;
    invoke-virtual {v0}, Lorg/litepal/tablemanager/LitePalOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    monitor-exit v2

    return-object v1

    .line 57
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method
