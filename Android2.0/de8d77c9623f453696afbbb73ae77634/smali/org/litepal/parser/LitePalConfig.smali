.class public Lorg/litepal/parser/LitePalConfig;
.super Ljava/lang/Object;
.source "LitePalConfig.java"


# instance fields
.field private cases:Ljava/lang/String;

.field private classNames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private dbName:Ljava/lang/String;

.field private storage:Ljava/lang/String;

.field private version:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addClassName(Ljava/lang/String;)V
    .locals 1
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 101
    invoke-virtual {p0}, Lorg/litepal/parser/LitePalConfig;->getClassNames()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    return-void
.end method

.method public getCases()Ljava/lang/String;
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lorg/litepal/parser/LitePalConfig;->cases:Ljava/lang/String;

    return-object v0
.end method

.method public getClassNames()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 85
    iget-object v0, p0, Lorg/litepal/parser/LitePalConfig;->classNames:Ljava/util/List;

    if-nez v0, :cond_1

    .line 86
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/litepal/parser/LitePalConfig;->classNames:Ljava/util/List;

    .line 87
    iget-object v0, p0, Lorg/litepal/parser/LitePalConfig;->classNames:Ljava/util/List;

    const-string v1, "org.litepal.model.Table_Schema"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/litepal/parser/LitePalConfig;->classNames:Ljava/util/List;

    return-object v0

    .line 88
    :cond_1
    iget-object v0, p0, Lorg/litepal/parser/LitePalConfig;->classNames:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    iget-object v0, p0, Lorg/litepal/parser/LitePalConfig;->classNames:Ljava/util/List;

    const-string v1, "org.litepal.model.Table_Schema"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getDbName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lorg/litepal/parser/LitePalConfig;->dbName:Ljava/lang/String;

    return-object v0
.end method

.method public getStorage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lorg/litepal/parser/LitePalConfig;->storage:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()I
    .locals 1

    .prologue
    .line 56
    iget v0, p0, Lorg/litepal/parser/LitePalConfig;->version:I

    return v0
.end method

.method public setCases(Ljava/lang/String;)V
    .locals 0
    .param p1, "cases"    # Ljava/lang/String;

    .prologue
    .line 113
    iput-object p1, p0, Lorg/litepal/parser/LitePalConfig;->cases:Ljava/lang/String;

    .line 114
    return-void
.end method

.method public setClassNames(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 105
    .local p1, "classNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iput-object p1, p0, Lorg/litepal/parser/LitePalConfig;->classNames:Ljava/util/List;

    .line 106
    return-void
.end method

.method public setDbName(Ljava/lang/String;)V
    .locals 0
    .param p1, "dbName"    # Ljava/lang/String;

    .prologue
    .line 68
    iput-object p1, p0, Lorg/litepal/parser/LitePalConfig;->dbName:Ljava/lang/String;

    .line 69
    return-void
.end method

.method public setStorage(Ljava/lang/String;)V
    .locals 0
    .param p1, "storage"    # Ljava/lang/String;

    .prologue
    .line 76
    iput-object p1, p0, Lorg/litepal/parser/LitePalConfig;->storage:Ljava/lang/String;

    .line 77
    return-void
.end method

.method public setVersion(I)V
    .locals 0
    .param p1, "version"    # I

    .prologue
    .line 60
    iput p1, p0, Lorg/litepal/parser/LitePalConfig;->version:I

    .line 61
    return-void
.end method
