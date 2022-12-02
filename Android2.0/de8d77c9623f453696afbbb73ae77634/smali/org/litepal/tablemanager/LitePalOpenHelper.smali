.class Lorg/litepal/tablemanager/LitePalOpenHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "LitePalOpenHelper.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "LitePalHelper"


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "factory"    # Landroid/database/sqlite/SQLiteDatabase$CursorFactory;
    .param p4, "version"    # I

    .prologue
    .line 62
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 63
    return-void
.end method

.method constructor <init>(Ljava/lang/String;I)V
    .locals 2
    .param p1, "dbName"    # Ljava/lang/String;
    .param p2, "version"    # I

    .prologue
    .line 78
    invoke-static {}, Lorg/litepal/LitePalApplication;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1, p2}, Lorg/litepal/tablemanager/LitePalOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 79
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 83
    invoke-static {p1}, Lorg/litepal/tablemanager/Generator;->create(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 84
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 88
    invoke-static {p1}, Lorg/litepal/tablemanager/Generator;->upgrade(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 89
    invoke-static {}, Lorg/litepal/parser/LitePalAttr;->getInstance()Lorg/litepal/parser/LitePalAttr;

    move-result-object v0

    invoke-virtual {v0}, Lorg/litepal/parser/LitePalAttr;->getExtraKeyName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p3}, Lorg/litepal/util/SharedUtil;->updateVersion(Ljava/lang/String;I)V

    .line 90
    return-void
.end method
