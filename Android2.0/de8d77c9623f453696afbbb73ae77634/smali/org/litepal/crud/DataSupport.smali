.class public Lorg/litepal/crud/DataSupport;
.super Ljava/lang/Object;
.source "DataSupport.java"


# instance fields
.field private associatedModelsMapForJoinTable:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation
.end field

.field private associatedModelsMapWithFK:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation
.end field

.field private associatedModelsMapWithoutFK:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private baseObjId:J

.field private fieldsToSetToDefault:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private listToClearAssociatedFK:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private listToClearSelfFK:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 1207
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1208
    return-void
.end method

.method public static declared-synchronized average(Ljava/lang/Class;Ljava/lang/String;)D
    .locals 4
    .param p1, "column"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")D"
        }
    .end annotation

    .prologue
    .line 284
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v1, Lorg/litepal/crud/DataSupport;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/litepal/util/DBUtility;->getTableNameByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/litepal/util/BaseUtility;->changeCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lorg/litepal/crud/DataSupport;->average(Ljava/lang/String;Ljava/lang/String;)D
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v2

    monitor-exit v1

    return-wide v2

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized average(Ljava/lang/String;Ljava/lang/String;)D
    .locals 6
    .param p0, "tableName"    # Ljava/lang/String;
    .param p1, "column"    # Ljava/lang/String;

    .prologue
    .line 307
    const-class v2, Lorg/litepal/crud/DataSupport;

    monitor-enter v2

    :try_start_0
    new-instance v0, Lorg/litepal/crud/ClusterQuery;

    invoke-direct {v0}, Lorg/litepal/crud/ClusterQuery;-><init>()V

    .line 308
    .local v0, "cQuery":Lorg/litepal/crud/ClusterQuery;
    invoke-virtual {v0, p0, p1}, Lorg/litepal/crud/ClusterQuery;->average(Ljava/lang/String;Ljava/lang/String;)D
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v4

    monitor-exit v2

    return-wide v4

    .line 307
    .end local v0    # "cQuery":Lorg/litepal/crud/ClusterQuery;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method private clearFKNameList()V
    .locals 1

    .prologue
    .line 1462
    invoke-virtual {p0}, Lorg/litepal/crud/DataSupport;->getListToClearSelfFK()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1463
    invoke-virtual {p0}, Lorg/litepal/crud/DataSupport;->getListToClearAssociatedFK()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1464
    return-void
.end method

.method private clearIdOfModelForJoinTable()V
    .locals 3

    .prologue
    .line 1452
    invoke-virtual {p0}, Lorg/litepal/crud/DataSupport;->getAssociatedModelsMapForJoinTable()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1453
    .local v0, "associatedModelName":Ljava/lang/String;
    iget-object v1, p0, Lorg/litepal/crud/DataSupport;->associatedModelsMapForJoinTable:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    goto :goto_0

    .line 1455
    .end local v0    # "associatedModelName":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lorg/litepal/crud/DataSupport;->associatedModelsMapForJoinTable:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 1456
    return-void
.end method

.method private clearIdOfModelWithFK()V
    .locals 3

    .prologue
    .line 1435
    invoke-virtual {p0}, Lorg/litepal/crud/DataSupport;->getAssociatedModelsMapWithFK()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1436
    .local v0, "associatedModelName":Ljava/lang/String;
    iget-object v1, p0, Lorg/litepal/crud/DataSupport;->associatedModelsMapWithFK:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    goto :goto_0

    .line 1438
    .end local v0    # "associatedModelName":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lorg/litepal/crud/DataSupport;->associatedModelsMapWithFK:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 1439
    return-void
.end method

.method private clearIdOfModelWithoutFK()V
    .locals 1

    .prologue
    .line 1445
    invoke-virtual {p0}, Lorg/litepal/crud/DataSupport;->getAssociatedModelsMapWithoutFK()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 1446
    return-void
.end method

.method public static declared-synchronized count(Ljava/lang/Class;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)I"
        }
    .end annotation

    .prologue
    .line 238
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v1, Lorg/litepal/crud/DataSupport;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/litepal/util/DBUtility;->getTableNameByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/litepal/util/BaseUtility;->changeCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/litepal/crud/DataSupport;->count(Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized count(Ljava/lang/String;)I
    .locals 3
    .param p0, "tableName"    # Ljava/lang/String;

    .prologue
    .line 260
    const-class v2, Lorg/litepal/crud/DataSupport;

    monitor-enter v2

    :try_start_0
    new-instance v0, Lorg/litepal/crud/ClusterQuery;

    invoke-direct {v0}, Lorg/litepal/crud/ClusterQuery;-><init>()V

    .line 261
    .local v0, "cQuery":Lorg/litepal/crud/ClusterQuery;
    invoke-virtual {v0, p0}, Lorg/litepal/crud/ClusterQuery;->count(Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    monitor-exit v2

    return v1

    .line 260
    .end local v0    # "cQuery":Lorg/litepal/crud/ClusterQuery;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized delete(Ljava/lang/Class;J)I
    .locals 5
    .param p1, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;J)I"
        }
    .end annotation

    .prologue
    .line 684
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v4, Lorg/litepal/crud/DataSupport;

    monitor-enter v4

    const/4 v2, 0x0

    .line 685
    .local v2, "rowsAffected":I
    :try_start_0
    invoke-static {}, Lorg/litepal/tablemanager/Connector;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 686
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 688
    :try_start_1
    new-instance v1, Lorg/litepal/crud/DeleteHandler;

    invoke-direct {v1, v0}, Lorg/litepal/crud/DeleteHandler;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 689
    .local v1, "deleteHandler":Lorg/litepal/crud/DeleteHandler;
    invoke-virtual {v1, p0, p1, p2}, Lorg/litepal/crud/DeleteHandler;->onDelete(Ljava/lang/Class;J)I

    move-result v2

    .line 690
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 693
    :try_start_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 691
    monitor-exit v4

    return v2

    .line 693
    .end local v1    # "deleteHandler":Lorg/litepal/crud/DeleteHandler;
    :catchall_0
    move-exception v3

    :try_start_3
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 684
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :catchall_1
    move-exception v3

    monitor-exit v4

    throw v3
.end method

.method public static varargs declared-synchronized deleteAll(Ljava/lang/Class;[Ljava/lang/String;)I
    .locals 3
    .param p1, "conditions"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 722
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v2, Lorg/litepal/crud/DataSupport;

    monitor-enter v2

    :try_start_0
    new-instance v0, Lorg/litepal/crud/DeleteHandler;

    invoke-static {}, Lorg/litepal/tablemanager/Connector;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/litepal/crud/DeleteHandler;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 723
    .local v0, "deleteHandler":Lorg/litepal/crud/DeleteHandler;
    invoke-virtual {v0, p0, p1}, Lorg/litepal/crud/DeleteHandler;->onDeleteAll(Ljava/lang/Class;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    monitor-exit v2

    return v1

    .line 722
    .end local v0    # "deleteHandler":Lorg/litepal/crud/DeleteHandler;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static varargs declared-synchronized deleteAll(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 3
    .param p0, "tableName"    # Ljava/lang/String;
    .param p1, "conditions"    # [Ljava/lang/String;

    .prologue
    .line 754
    const-class v2, Lorg/litepal/crud/DataSupport;

    monitor-enter v2

    :try_start_0
    new-instance v0, Lorg/litepal/crud/DeleteHandler;

    invoke-static {}, Lorg/litepal/tablemanager/Connector;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/litepal/crud/DeleteHandler;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 755
    .local v0, "deleteHandler":Lorg/litepal/crud/DeleteHandler;
    invoke-virtual {v0, p0, p1}, Lorg/litepal/crud/DeleteHandler;->onDeleteAll(Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    monitor-exit v2

    return v1

    .line 754
    .end local v0    # "deleteHandler":Lorg/litepal/crud/DeleteHandler;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized find(Ljava/lang/Class;J)Ljava/lang/Object;
    .locals 3
    .param p1, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;J)TT;"
        }
    .end annotation

    .prologue
    .line 491
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v0, Lorg/litepal/crud/DataSupport;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    invoke-static {p0, p1, p2, v1}, Lorg/litepal/crud/DataSupport;->find(Ljava/lang/Class;JZ)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized find(Ljava/lang/Class;JZ)Ljava/lang/Object;
    .locals 3
    .param p1, "id"    # J
    .param p3, "isEager"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;JZ)TT;"
        }
    .end annotation

    .prologue
    .line 507
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v2, Lorg/litepal/crud/DataSupport;

    monitor-enter v2

    :try_start_0
    new-instance v0, Lorg/litepal/crud/QueryHandler;

    invoke-static {}, Lorg/litepal/tablemanager/Connector;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/litepal/crud/QueryHandler;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 508
    .local v0, "queryHandler":Lorg/litepal/crud/QueryHandler;
    invoke-virtual {v0, p0, p1, p2, p3}, Lorg/litepal/crud/QueryHandler;->onFind(Ljava/lang/Class;JZ)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    monitor-exit v2

    return-object v1

    .line 507
    .end local v0    # "queryHandler":Lorg/litepal/crud/QueryHandler;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static varargs declared-synchronized findAll(Ljava/lang/Class;Z[J)Ljava/util/List;
    .locals 3
    .param p1, "isEager"    # Z
    .param p2, "ids"    # [J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;Z[J)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 628
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v2, Lorg/litepal/crud/DataSupport;

    monitor-enter v2

    :try_start_0
    new-instance v0, Lorg/litepal/crud/QueryHandler;

    invoke-static {}, Lorg/litepal/tablemanager/Connector;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/litepal/crud/QueryHandler;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 629
    .local v0, "queryHandler":Lorg/litepal/crud/QueryHandler;
    invoke-virtual {v0, p0, p1, p2}, Lorg/litepal/crud/QueryHandler;->onFindAll(Ljava/lang/Class;Z[J)Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    monitor-exit v2

    return-object v1

    .line 628
    .end local v0    # "queryHandler":Lorg/litepal/crud/QueryHandler;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static varargs declared-synchronized findAll(Ljava/lang/Class;[J)Ljava/util/List;
    .locals 2
    .param p1, "ids"    # [J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;[J)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 610
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v0, Lorg/litepal/crud/DataSupport;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    invoke-static {p0, v1, p1}, Lorg/litepal/crud/DataSupport;->findAll(Ljava/lang/Class;Z[J)Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static varargs declared-synchronized findBySQL([Ljava/lang/String;)Landroid/database/Cursor;
    .locals 5
    .param p0, "sql"    # [Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    const/4 v4, 0x1

    .line 649
    const-class v2, Lorg/litepal/crud/DataSupport;

    monitor-enter v2

    :try_start_0
    invoke-static {p0}, Lorg/litepal/util/BaseUtility;->checkConditionsCorrect([Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 650
    if-nez p0, :cond_1

    .line 663
    :cond_0
    :goto_0
    monitor-exit v2

    return-object v1

    .line 653
    :cond_1
    :try_start_1
    array-length v3, p0

    if-lez v3, :cond_0

    .line 657
    array-length v1, p0

    if-ne v1, v4, :cond_2

    .line 658
    const/4 v0, 0x0

    .line 663
    .local v0, "selectionArgs":[Ljava/lang/String;
    :goto_1
    invoke-static {}, Lorg/litepal/tablemanager/Connector;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const/4 v3, 0x0

    aget-object v3, p0, v3

    invoke-virtual {v1, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    goto :goto_0

    .line 660
    .end local v0    # "selectionArgs":[Ljava/lang/String;
    :cond_2
    array-length v1, p0

    add-int/lit8 v1, v1, -0x1

    new-array v0, v1, [Ljava/lang/String;

    .line 661
    .restart local v0    # "selectionArgs":[Ljava/lang/String;
    const/4 v1, 0x1

    const/4 v3, 0x0

    array-length v4, p0

    add-int/lit8 v4, v4, -0x1

    invoke-static {p0, v1, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 649
    .end local v0    # "selectionArgs":[Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized findFirst(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 527
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v0, Lorg/litepal/crud/DataSupport;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    invoke-static {p0, v1}, Lorg/litepal/crud/DataSupport;->findFirst(Ljava/lang/Class;Z)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized findFirst(Ljava/lang/Class;Z)Ljava/lang/Object;
    .locals 3
    .param p1, "isEager"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;Z)TT;"
        }
    .end annotation

    .prologue
    .line 541
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v2, Lorg/litepal/crud/DataSupport;

    monitor-enter v2

    :try_start_0
    new-instance v0, Lorg/litepal/crud/QueryHandler;

    invoke-static {}, Lorg/litepal/tablemanager/Connector;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/litepal/crud/QueryHandler;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 542
    .local v0, "queryHandler":Lorg/litepal/crud/QueryHandler;
    invoke-virtual {v0, p0, p1}, Lorg/litepal/crud/QueryHandler;->onFindFirst(Ljava/lang/Class;Z)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    monitor-exit v2

    return-object v1

    .line 541
    .end local v0    # "queryHandler":Lorg/litepal/crud/QueryHandler;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized findLast(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 561
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v0, Lorg/litepal/crud/DataSupport;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    invoke-static {p0, v1}, Lorg/litepal/crud/DataSupport;->findLast(Ljava/lang/Class;Z)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized findLast(Ljava/lang/Class;Z)Ljava/lang/Object;
    .locals 3
    .param p1, "isEager"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;Z)TT;"
        }
    .end annotation

    .prologue
    .line 575
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v2, Lorg/litepal/crud/DataSupport;

    monitor-enter v2

    :try_start_0
    new-instance v0, Lorg/litepal/crud/QueryHandler;

    invoke-static {}, Lorg/litepal/tablemanager/Connector;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/litepal/crud/QueryHandler;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 576
    .local v0, "queryHandler":Lorg/litepal/crud/QueryHandler;
    invoke-virtual {v0, p0, p1}, Lorg/litepal/crud/QueryHandler;->onFindLast(Ljava/lang/Class;Z)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    monitor-exit v2

    return-object v1

    .line 575
    .end local v0    # "queryHandler":Lorg/litepal/crud/QueryHandler;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static varargs isExist(Ljava/lang/Class;[Ljava/lang/String;)Z
    .locals 2
    .param p1, "conditions"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;[",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    .line 918
    if-nez p1, :cond_1

    .line 921
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-static {p1}, Lorg/litepal/crud/DataSupport;->where([Ljava/lang/String;)Lorg/litepal/crud/ClusterQuery;

    move-result-object v1

    invoke-virtual {v1, p0}, Lorg/litepal/crud/ClusterQuery;->count(Ljava/lang/Class;)I

    move-result v1

    if-lez v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static declared-synchronized limit(I)Lorg/litepal/crud/ClusterQuery;
    .locals 3
    .param p0, "value"    # I

    .prologue
    .line 194
    const-class v2, Lorg/litepal/crud/DataSupport;

    monitor-enter v2

    :try_start_0
    new-instance v0, Lorg/litepal/crud/ClusterQuery;

    invoke-direct {v0}, Lorg/litepal/crud/ClusterQuery;-><init>()V

    .line 195
    .local v0, "cQuery":Lorg/litepal/crud/ClusterQuery;
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/litepal/crud/ClusterQuery;->mLimit:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 196
    monitor-exit v2

    return-object v0

    .line 194
    .end local v0    # "cQuery":Lorg/litepal/crud/ClusterQuery;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static markAsDeleted(Ljava/util/Collection;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lorg/litepal/crud/DataSupport;",
            ">(",
            "Ljava/util/Collection",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 902
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/litepal/crud/DataSupport;

    .line 903
    .local v0, "t":Lorg/litepal/crud/DataSupport;, "TT;"
    invoke-virtual {v0}, Lorg/litepal/crud/DataSupport;->clearSavedState()V

    goto :goto_0

    .line 905
    .end local v0    # "t":Lorg/litepal/crud/DataSupport;, "TT;"
    :cond_0
    return-void
.end method

.method public static declared-synchronized max(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2
    .param p1, "columnName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 334
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "columnType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v1, Lorg/litepal/crud/DataSupport;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/litepal/util/DBUtility;->getTableNameByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/litepal/util/BaseUtility;->changeCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lorg/litepal/crud/DataSupport;->max(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized max(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 3
    .param p0, "tableName"    # Ljava/lang/String;
    .param p1, "columnName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 360
    .local p2, "columnType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v2, Lorg/litepal/crud/DataSupport;

    monitor-enter v2

    :try_start_0
    new-instance v0, Lorg/litepal/crud/ClusterQuery;

    invoke-direct {v0}, Lorg/litepal/crud/ClusterQuery;-><init>()V

    .line 361
    .local v0, "cQuery":Lorg/litepal/crud/ClusterQuery;
    invoke-virtual {v0, p0, p1, p2}, Lorg/litepal/crud/ClusterQuery;->max(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    monitor-exit v2

    return-object v1

    .line 360
    .end local v0    # "cQuery":Lorg/litepal/crud/ClusterQuery;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized min(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2
    .param p1, "columnName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 387
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "columnType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v1, Lorg/litepal/crud/DataSupport;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/litepal/util/DBUtility;->getTableNameByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/litepal/util/BaseUtility;->changeCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lorg/litepal/crud/DataSupport;->min(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized min(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 3
    .param p0, "tableName"    # Ljava/lang/String;
    .param p1, "columnName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 413
    .local p2, "columnType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v2, Lorg/litepal/crud/DataSupport;

    monitor-enter v2

    :try_start_0
    new-instance v0, Lorg/litepal/crud/ClusterQuery;

    invoke-direct {v0}, Lorg/litepal/crud/ClusterQuery;-><init>()V

    .line 414
    .local v0, "cQuery":Lorg/litepal/crud/ClusterQuery;
    invoke-virtual {v0, p0, p1, p2}, Lorg/litepal/crud/ClusterQuery;->min(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    monitor-exit v2

    return-object v1

    .line 413
    .end local v0    # "cQuery":Lorg/litepal/crud/ClusterQuery;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized offset(I)Lorg/litepal/crud/ClusterQuery;
    .locals 3
    .param p0, "value"    # I

    .prologue
    .line 214
    const-class v2, Lorg/litepal/crud/DataSupport;

    monitor-enter v2

    :try_start_0
    new-instance v0, Lorg/litepal/crud/ClusterQuery;

    invoke-direct {v0}, Lorg/litepal/crud/ClusterQuery;-><init>()V

    .line 215
    .local v0, "cQuery":Lorg/litepal/crud/ClusterQuery;
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/litepal/crud/ClusterQuery;->mOffset:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 216
    monitor-exit v2

    return-object v0

    .line 214
    .end local v0    # "cQuery":Lorg/litepal/crud/ClusterQuery;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized order(Ljava/lang/String;)Lorg/litepal/crud/ClusterQuery;
    .locals 3
    .param p0, "column"    # Ljava/lang/String;

    .prologue
    .line 174
    const-class v2, Lorg/litepal/crud/DataSupport;

    monitor-enter v2

    :try_start_0
    new-instance v0, Lorg/litepal/crud/ClusterQuery;

    invoke-direct {v0}, Lorg/litepal/crud/ClusterQuery;-><init>()V

    .line 175
    .local v0, "cQuery":Lorg/litepal/crud/ClusterQuery;
    iput-object p0, v0, Lorg/litepal/crud/ClusterQuery;->mOrderBy:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 176
    monitor-exit v2

    return-object v0

    .line 174
    .end local v0    # "cQuery":Lorg/litepal/crud/ClusterQuery;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized saveAll(Ljava/util/Collection;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lorg/litepal/crud/DataSupport;",
            ">(",
            "Ljava/util/Collection",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 881
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    const-class v4, Lorg/litepal/crud/DataSupport;

    monitor-enter v4

    :try_start_0
    invoke-static {}, Lorg/litepal/tablemanager/Connector;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 882
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 884
    :try_start_1
    new-instance v2, Lorg/litepal/crud/SaveHandler;

    invoke-direct {v2, v0}, Lorg/litepal/crud/SaveHandler;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 885
    .local v2, "saveHandler":Lorg/litepal/crud/SaveHandler;
    invoke-virtual {v2, p0}, Lorg/litepal/crud/SaveHandler;->onSaveAll(Ljava/util/Collection;)V

    .line 886
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 890
    :try_start_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 892
    monitor-exit v4

    return-void

    .line 887
    .end local v2    # "saveHandler":Lorg/litepal/crud/SaveHandler;
    :catch_0
    move-exception v1

    .line 888
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    new-instance v3, Lorg/litepal/exceptions/DataSupportException;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5, v1}, Lorg/litepal/exceptions/DataSupportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 890
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    :try_start_4
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 881
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :catchall_1
    move-exception v3

    monitor-exit v4

    throw v3
.end method

.method public static varargs declared-synchronized select([Ljava/lang/String;)Lorg/litepal/crud/ClusterQuery;
    .locals 3
    .param p0, "columns"    # [Ljava/lang/String;

    .prologue
    .line 131
    const-class v2, Lorg/litepal/crud/DataSupport;

    monitor-enter v2

    :try_start_0
    new-instance v0, Lorg/litepal/crud/ClusterQuery;

    invoke-direct {v0}, Lorg/litepal/crud/ClusterQuery;-><init>()V

    .line 132
    .local v0, "cQuery":Lorg/litepal/crud/ClusterQuery;
    iput-object p0, v0, Lorg/litepal/crud/ClusterQuery;->mColumns:[Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 133
    monitor-exit v2

    return-object v0

    .line 131
    .end local v0    # "cQuery":Lorg/litepal/crud/ClusterQuery;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized sum(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2
    .param p1, "columnName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 440
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "columnType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v1, Lorg/litepal/crud/DataSupport;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/litepal/util/DBUtility;->getTableNameByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/litepal/util/BaseUtility;->changeCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lorg/litepal/crud/DataSupport;->sum(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized sum(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 3
    .param p0, "tableName"    # Ljava/lang/String;
    .param p1, "columnName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 466
    .local p2, "columnType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-class v2, Lorg/litepal/crud/DataSupport;

    monitor-enter v2

    :try_start_0
    new-instance v0, Lorg/litepal/crud/ClusterQuery;

    invoke-direct {v0}, Lorg/litepal/crud/ClusterQuery;-><init>()V

    .line 467
    .local v0, "cQuery":Lorg/litepal/crud/ClusterQuery;
    invoke-virtual {v0, p0, p1, p2}, Lorg/litepal/crud/ClusterQuery;->sum(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    monitor-exit v2

    return-object v1

    .line 466
    .end local v0    # "cQuery":Lorg/litepal/crud/ClusterQuery;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static declared-synchronized update(Ljava/lang/Class;Landroid/content/ContentValues;J)I
    .locals 4
    .param p1, "values"    # Landroid/content/ContentValues;
    .param p2, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Landroid/content/ContentValues;",
            "J)I"
        }
    .end annotation

    .prologue
    .line 780
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v2, Lorg/litepal/crud/DataSupport;

    monitor-enter v2

    :try_start_0
    new-instance v0, Lorg/litepal/crud/UpdateHandler;

    invoke-static {}, Lorg/litepal/tablemanager/Connector;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/litepal/crud/UpdateHandler;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 781
    .local v0, "updateHandler":Lorg/litepal/crud/UpdateHandler;
    invoke-virtual {v0, p0, p2, p3, p1}, Lorg/litepal/crud/UpdateHandler;->onUpdate(Ljava/lang/Class;JLandroid/content/ContentValues;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    monitor-exit v2

    return v1

    .line 780
    .end local v0    # "updateHandler":Lorg/litepal/crud/UpdateHandler;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static varargs declared-synchronized updateAll(Ljava/lang/Class;Landroid/content/ContentValues;[Ljava/lang/String;)I
    .locals 2
    .param p1, "values"    # Landroid/content/ContentValues;
    .param p2, "conditions"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Landroid/content/ContentValues;",
            "[",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 815
    .local p0, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v1, Lorg/litepal/crud/DataSupport;

    monitor-enter v1

    .line 816
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 815
    invoke-static {v0}, Lorg/litepal/util/DBUtility;->getTableNameByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/litepal/util/BaseUtility;->changeCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lorg/litepal/crud/DataSupport;->updateAll(Ljava/lang/String;Landroid/content/ContentValues;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit v1

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static varargs declared-synchronized updateAll(Ljava/lang/String;Landroid/content/ContentValues;[Ljava/lang/String;)I
    .locals 3
    .param p0, "tableName"    # Ljava/lang/String;
    .param p1, "values"    # Landroid/content/ContentValues;
    .param p2, "conditions"    # [Ljava/lang/String;

    .prologue
    .line 850
    const-class v2, Lorg/litepal/crud/DataSupport;

    monitor-enter v2

    :try_start_0
    new-instance v0, Lorg/litepal/crud/UpdateHandler;

    invoke-static {}, Lorg/litepal/tablemanager/Connector;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/litepal/crud/UpdateHandler;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 851
    .local v0, "updateHandler":Lorg/litepal/crud/UpdateHandler;
    invoke-virtual {v0, p0, p1, p2}, Lorg/litepal/crud/UpdateHandler;->onUpdateAll(Ljava/lang/String;Landroid/content/ContentValues;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    monitor-exit v2

    return v1

    .line 850
    .end local v0    # "updateHandler":Lorg/litepal/crud/UpdateHandler;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static varargs declared-synchronized where([Ljava/lang/String;)Lorg/litepal/crud/ClusterQuery;
    .locals 3
    .param p0, "conditions"    # [Ljava/lang/String;

    .prologue
    .line 152
    const-class v2, Lorg/litepal/crud/DataSupport;

    monitor-enter v2

    :try_start_0
    new-instance v0, Lorg/litepal/crud/ClusterQuery;

    invoke-direct {v0}, Lorg/litepal/crud/ClusterQuery;-><init>()V

    .line 153
    .local v0, "cQuery":Lorg/litepal/crud/ClusterQuery;
    iput-object p0, v0, Lorg/litepal/crud/ClusterQuery;->mConditions:[Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    monitor-exit v2

    return-object v0

    .line 152
    .end local v0    # "cQuery":Lorg/litepal/crud/ClusterQuery;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method


# virtual methods
.method addAssociatedModelForJoinTable(Ljava/lang/String;J)V
    .locals 2
    .param p1, "associatedModelName"    # Ljava/lang/String;
    .param p2, "associatedId"    # J

    .prologue
    .line 1297
    invoke-virtual {p0}, Lorg/litepal/crud/DataSupport;->getAssociatedModelsMapForJoinTable()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 1299
    .local v0, "associatedIdsM2MSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    if-nez v0, :cond_0

    .line 1300
    new-instance v0, Ljava/util/HashSet;

    .end local v0    # "associatedIdsM2MSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 1301
    .restart local v0    # "associatedIdsM2MSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1302
    iget-object v1, p0, Lorg/litepal/crud/DataSupport;->associatedModelsMapForJoinTable:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1306
    :goto_0
    return-void

    .line 1304
    :cond_0
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method addAssociatedModelWithFK(Ljava/lang/String;J)V
    .locals 2
    .param p1, "associatedTableName"    # Ljava/lang/String;
    .param p2, "associatedId"    # J

    .prologue
    .line 1263
    invoke-virtual {p0}, Lorg/litepal/crud/DataSupport;->getAssociatedModelsMapWithFK()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 1264
    .local v0, "associatedIdsWithFKSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    if-nez v0, :cond_0

    .line 1265
    new-instance v0, Ljava/util/HashSet;

    .end local v0    # "associatedIdsWithFKSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 1266
    .restart local v0    # "associatedIdsWithFKSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1267
    iget-object v1, p0, Lorg/litepal/crud/DataSupport;->associatedModelsMapWithFK:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1271
    :goto_0
    return-void

    .line 1269
    :cond_0
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method addAssociatedModelWithoutFK(Ljava/lang/String;J)V
    .locals 2
    .param p1, "associatedTableName"    # Ljava/lang/String;
    .param p2, "associatedId"    # J

    .prologue
    .line 1352
    invoke-virtual {p0}, Lorg/litepal/crud/DataSupport;->getAssociatedModelsMapWithoutFK()Ljava/util/Map;

    move-result-object v0

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1353
    return-void
.end method

.method addAssociatedTableNameToClearFK(Ljava/lang/String;)V
    .locals 2
    .param p1, "associatedTableName"    # Ljava/lang/String;

    .prologue
    .line 1402
    invoke-virtual {p0}, Lorg/litepal/crud/DataSupport;->getListToClearAssociatedFK()Ljava/util/List;

    move-result-object v0

    .line 1403
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1404
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1406
    :cond_0
    return-void
.end method

.method addEmptyModelForJoinTable(Ljava/lang/String;)V
    .locals 2
    .param p1, "associatedModelName"    # Ljava/lang/String;

    .prologue
    .line 1317
    invoke-virtual {p0}, Lorg/litepal/crud/DataSupport;->getAssociatedModelsMapForJoinTable()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 1319
    .local v0, "associatedIdsM2MSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    if-nez v0, :cond_0

    .line 1320
    new-instance v0, Ljava/util/HashSet;

    .end local v0    # "associatedIdsM2MSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 1321
    .restart local v0    # "associatedIdsM2MSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    iget-object v1, p0, Lorg/litepal/crud/DataSupport;->associatedModelsMapForJoinTable:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1323
    :cond_0
    return-void
.end method

.method addFKNameToClearSelf(Ljava/lang/String;)V
    .locals 2
    .param p1, "foreignKeyName"    # Ljava/lang/String;

    .prologue
    .line 1376
    invoke-virtual {p0}, Lorg/litepal/crud/DataSupport;->getListToClearSelfFK()Ljava/util/List;

    move-result-object v0

    .line 1377
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1378
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1380
    :cond_0
    return-void
.end method

.method public assignBaseObjId(I)V
    .locals 2
    .param p1, "baseObjId"    # I

    .prologue
    .line 1200
    int-to-long v0, p1

    iput-wide v0, p0, Lorg/litepal/crud/DataSupport;->baseObjId:J

    .line 1201
    return-void
.end method

.method clearAssociatedData()V
    .locals 0

    .prologue
    .line 1425
    invoke-direct {p0}, Lorg/litepal/crud/DataSupport;->clearIdOfModelWithFK()V

    .line 1426
    invoke-direct {p0}, Lorg/litepal/crud/DataSupport;->clearIdOfModelWithoutFK()V

    .line 1427
    invoke-direct {p0}, Lorg/litepal/crud/DataSupport;->clearIdOfModelForJoinTable()V

    .line 1428
    invoke-direct {p0}, Lorg/litepal/crud/DataSupport;->clearFKNameList()V

    .line 1429
    return-void
.end method

.method public clearSavedState()V
    .locals 2

    .prologue
    .line 1179
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/litepal/crud/DataSupport;->baseObjId:J

    .line 1180
    return-void
.end method

.method public declared-synchronized delete()I
    .locals 6

    .prologue
    .line 940
    monitor-enter p0

    :try_start_0
    invoke-static {}, Lorg/litepal/tablemanager/Connector;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 941
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 943
    :try_start_1
    new-instance v1, Lorg/litepal/crud/DeleteHandler;

    invoke-direct {v1, v0}, Lorg/litepal/crud/DeleteHandler;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 944
    .local v1, "deleteHandler":Lorg/litepal/crud/DeleteHandler;
    invoke-virtual {v1, p0}, Lorg/litepal/crud/DeleteHandler;->onDelete(Lorg/litepal/crud/DataSupport;)I

    move-result v2

    .line 945
    .local v2, "rowsAffected":I
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lorg/litepal/crud/DataSupport;->baseObjId:J

    .line 946
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 949
    :try_start_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 947
    monitor-exit p0

    return v2

    .line 949
    .end local v1    # "deleteHandler":Lorg/litepal/crud/DeleteHandler;
    .end local v2    # "rowsAffected":I
    :catchall_0
    move-exception v3

    :try_start_3
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 940
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :catchall_1
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method getAssociatedModelsMapForJoinTable()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 1334
    iget-object v0, p0, Lorg/litepal/crud/DataSupport;->associatedModelsMapForJoinTable:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 1335
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/litepal/crud/DataSupport;->associatedModelsMapForJoinTable:Ljava/util/Map;

    .line 1337
    :cond_0
    iget-object v0, p0, Lorg/litepal/crud/DataSupport;->associatedModelsMapForJoinTable:Ljava/util/Map;

    return-object v0
.end method

.method getAssociatedModelsMapWithFK()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 1282
    iget-object v0, p0, Lorg/litepal/crud/DataSupport;->associatedModelsMapWithFK:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 1283
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/litepal/crud/DataSupport;->associatedModelsMapWithFK:Ljava/util/Map;

    .line 1285
    :cond_0
    iget-object v0, p0, Lorg/litepal/crud/DataSupport;->associatedModelsMapWithFK:Ljava/util/Map;

    return-object v0
.end method

.method getAssociatedModelsMapWithoutFK()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1363
    iget-object v0, p0, Lorg/litepal/crud/DataSupport;->associatedModelsMapWithoutFK:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 1364
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/litepal/crud/DataSupport;->associatedModelsMapWithoutFK:Ljava/util/Map;

    .line 1366
    :cond_0
    iget-object v0, p0, Lorg/litepal/crud/DataSupport;->associatedModelsMapWithoutFK:Ljava/util/Map;

    return-object v0
.end method

.method protected getBaseObjId()J
    .locals 2

    .prologue
    .line 1217
    iget-wide v0, p0, Lorg/litepal/crud/DataSupport;->baseObjId:J

    return-wide v0
.end method

.method protected getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1226
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getFieldsToSetToDefault()Ljava/util/List;
    .locals 1
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
    .line 1246
    iget-object v0, p0, Lorg/litepal/crud/DataSupport;->fieldsToSetToDefault:Ljava/util/List;

    if-nez v0, :cond_0

    .line 1247
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/litepal/crud/DataSupport;->fieldsToSetToDefault:Ljava/util/List;

    .line 1249
    :cond_0
    iget-object v0, p0, Lorg/litepal/crud/DataSupport;->fieldsToSetToDefault:Ljava/util/List;

    return-object v0
.end method

.method getListToClearAssociatedFK()Ljava/util/List;
    .locals 1
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
    .line 1415
    iget-object v0, p0, Lorg/litepal/crud/DataSupport;->listToClearAssociatedFK:Ljava/util/List;

    if-nez v0, :cond_0

    .line 1416
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/litepal/crud/DataSupport;->listToClearAssociatedFK:Ljava/util/List;

    .line 1418
    :cond_0
    iget-object v0, p0, Lorg/litepal/crud/DataSupport;->listToClearAssociatedFK:Ljava/util/List;

    return-object v0
.end method

.method getListToClearSelfFK()Ljava/util/List;
    .locals 1
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
    .line 1389
    iget-object v0, p0, Lorg/litepal/crud/DataSupport;->listToClearSelfFK:Ljava/util/List;

    if-nez v0, :cond_0

    .line 1390
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/litepal/crud/DataSupport;->listToClearSelfFK:Ljava/util/List;

    .line 1392
    :cond_0
    iget-object v0, p0, Lorg/litepal/crud/DataSupport;->listToClearSelfFK:Ljava/util/List;

    return-object v0
.end method

.method protected getTableName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1235
    invoke-virtual {p0}, Lorg/litepal/crud/DataSupport;->getClassName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/litepal/util/DBUtility;->getTableNameByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/litepal/util/BaseUtility;->changeCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isSaved()Z
    .locals 4

    .prologue
    .line 1172
    iget-wide v0, p0, Lorg/litepal/crud/DataSupport;->baseObjId:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public declared-synchronized save()Z
    .locals 2

    .prologue
    .line 1051
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/litepal/crud/DataSupport;->saveThrows()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1052
    const/4 v1, 0x1

    .line 1055
    :goto_0
    monitor-exit p0

    return v1

    .line 1053
    :catch_0
    move-exception v0

    .line 1054
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1055
    const/4 v1, 0x0

    goto :goto_0

    .line 1051
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized saveFast()Z
    .locals 4

    .prologue
    .line 1151
    monitor-enter p0

    :try_start_0
    invoke-static {}, Lorg/litepal/tablemanager/Connector;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1152
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1154
    :try_start_1
    new-instance v2, Lorg/litepal/crud/SaveHandler;

    invoke-direct {v2, v0}, Lorg/litepal/crud/SaveHandler;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1155
    .local v2, "saveHandler":Lorg/litepal/crud/SaveHandler;
    invoke-virtual {v2, p0}, Lorg/litepal/crud/SaveHandler;->onSaveFast(Lorg/litepal/crud/DataSupport;)V

    .line 1156
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1157
    const/4 v3, 0x1

    .line 1162
    :try_start_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1160
    .end local v2    # "saveHandler":Lorg/litepal/crud/SaveHandler;
    :goto_0
    monitor-exit p0

    return v3

    .line 1158
    :catch_0
    move-exception v1

    .line 1159
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1160
    const/4 v3, 0x0

    .line 1162
    :try_start_4
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0

    .line 1151
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 1162
    .restart local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :catchall_1
    move-exception v3

    :try_start_5
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
.end method

.method public varargs declared-synchronized saveIfNotExist([Ljava/lang/String;)Z
    .locals 1
    .param p1, "conditions"    # [Ljava/lang/String;

    .prologue
    .line 1122
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p1}, Lorg/litepal/crud/DataSupport;->isExist(Ljava/lang/Class;[Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1123
    invoke-virtual {p0}, Lorg/litepal/crud/DataSupport;->save()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 1125
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 1122
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized saveThrows()V
    .locals 5

    .prologue
    .line 1084
    monitor-enter p0

    :try_start_0
    invoke-static {}, Lorg/litepal/tablemanager/Connector;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1085
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1087
    :try_start_1
    new-instance v2, Lorg/litepal/crud/SaveHandler;

    invoke-direct {v2, v0}, Lorg/litepal/crud/SaveHandler;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1088
    .local v2, "saveHandler":Lorg/litepal/crud/SaveHandler;
    invoke-virtual {v2, p0}, Lorg/litepal/crud/SaveHandler;->onSave(Lorg/litepal/crud/DataSupport;)V

    .line 1089
    invoke-virtual {p0}, Lorg/litepal/crud/DataSupport;->clearAssociatedData()V

    .line 1090
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1094
    :try_start_2
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1096
    monitor-exit p0

    return-void

    .line 1091
    .end local v2    # "saveHandler":Lorg/litepal/crud/SaveHandler;
    :catch_0
    move-exception v1

    .line 1092
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    new-instance v3, Lorg/litepal/exceptions/DataSupportException;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/litepal/exceptions/DataSupportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1094
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    :try_start_4
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 1084
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :catchall_1
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public setToDefault(Ljava/lang/String;)V
    .locals 1
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 1191
    invoke-virtual {p0}, Lorg/litepal/crud/DataSupport;->getFieldsToSetToDefault()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1192
    return-void
.end method

.method public declared-synchronized update(J)I
    .locals 5
    .param p1, "id"    # J

    .prologue
    .line 976
    monitor-enter p0

    :try_start_0
    new-instance v2, Lorg/litepal/crud/UpdateHandler;

    invoke-static {}, Lorg/litepal/tablemanager/Connector;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/litepal/crud/UpdateHandler;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 977
    .local v2, "updateHandler":Lorg/litepal/crud/UpdateHandler;
    invoke-virtual {v2, p0, p1, p2}, Lorg/litepal/crud/UpdateHandler;->onUpdate(Lorg/litepal/crud/DataSupport;J)I

    move-result v1

    .line 978
    .local v1, "rowsAffected":I
    invoke-virtual {p0}, Lorg/litepal/crud/DataSupport;->getFieldsToSetToDefault()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->clear()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 979
    monitor-exit p0

    return v1

    .line 980
    .end local v1    # "rowsAffected":I
    .end local v2    # "updateHandler":Lorg/litepal/crud/UpdateHandler;
    :catch_0
    move-exception v0

    .line 981
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    new-instance v3, Lorg/litepal/exceptions/DataSupportException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/litepal/exceptions/DataSupportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 976
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public varargs declared-synchronized updateAll([Ljava/lang/String;)I
    .locals 5
    .param p1, "conditions"    # [Ljava/lang/String;

    .prologue
    .line 1016
    monitor-enter p0

    :try_start_0
    new-instance v2, Lorg/litepal/crud/UpdateHandler;

    invoke-static {}, Lorg/litepal/tablemanager/Connector;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/litepal/crud/UpdateHandler;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1017
    .local v2, "updateHandler":Lorg/litepal/crud/UpdateHandler;
    invoke-virtual {v2, p0, p1}, Lorg/litepal/crud/UpdateHandler;->onUpdateAll(Lorg/litepal/crud/DataSupport;[Ljava/lang/String;)I

    move-result v1

    .line 1018
    .local v1, "rowsAffected":I
    invoke-virtual {p0}, Lorg/litepal/crud/DataSupport;->getFieldsToSetToDefault()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->clear()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1019
    monitor-exit p0

    return v1

    .line 1020
    .end local v1    # "rowsAffected":I
    .end local v2    # "updateHandler":Lorg/litepal/crud/UpdateHandler;
    :catch_0
    move-exception v0

    .line 1021
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    new-instance v3, Lorg/litepal/exceptions/DataSupportException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/litepal/exceptions/DataSupportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1016
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method
