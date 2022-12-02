.class public Lorg/litepal/tablemanager/Upgrader;
.super Lorg/litepal/tablemanager/AssociationUpdater;
.source "Upgrader.java"


# instance fields
.field private hasConstraintChanged:Z

.field protected mTableModel:Lorg/litepal/tablemanager/model/TableModel;

.field protected mTableModelDB:Lorg/litepal/tablemanager/model/TableModel;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Lorg/litepal/tablemanager/AssociationUpdater;-><init>()V

    return-void
.end method

.method private addColumns(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/litepal/tablemanager/model/ColumnModel;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 280
    .local p1, "columnModelList":Ljava/util/List;, "Ljava/util/List<Lorg/litepal/tablemanager/model/ColumnModel;>;"
    const-string v1, "AssociationUpdater"

    const-string v2, "do addColumn"

    invoke-static {v1, v2}, Lorg/litepal/util/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    invoke-direct {p0, p1}, Lorg/litepal/tablemanager/Upgrader;->getAddColumnSQLs(Ljava/util/List;)[Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/litepal/tablemanager/Upgrader;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0, v1, v2}, Lorg/litepal/tablemanager/Upgrader;->execute([Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase;)V

    .line 282
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/litepal/tablemanager/model/ColumnModel;

    .line 283
    .local v0, "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    iget-object v2, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModelDB:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v2, v0}, Lorg/litepal/tablemanager/model/TableModel;->addColumnModel(Lorg/litepal/tablemanager/model/ColumnModel;)V

    goto :goto_0

    .line 285
    .end local v0    # "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    :cond_0
    return-void
.end method

.method private changeColumnsConstraints()V
    .locals 2

    .prologue
    .line 311
    iget-boolean v0, p0, Lorg/litepal/tablemanager/Upgrader;->hasConstraintChanged:Z

    if-eqz v0, :cond_0

    .line 312
    const-string v0, "AssociationUpdater"

    const-string v1, "do changeColumnsConstraints"

    invoke-static {v0, v1}, Lorg/litepal/util/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    invoke-direct {p0}, Lorg/litepal/tablemanager/Upgrader;->getChangeColumnsConstraintsSQL()[Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lorg/litepal/tablemanager/Upgrader;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0, v0, v1}, Lorg/litepal/tablemanager/Upgrader;->execute([Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase;)V

    .line 315
    :cond_0
    return-void
.end method

.method private changeColumnsType(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/litepal/tablemanager/model/ColumnModel;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 295
    .local p1, "columnModelList":Ljava/util/List;, "Ljava/util/List<Lorg/litepal/tablemanager/model/ColumnModel;>;"
    const-string v2, "AssociationUpdater"

    const-string v3, "do changeColumnsType"

    invoke-static {v2, v3}, Lorg/litepal/util/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 297
    .local v1, "columnNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 298
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/litepal/tablemanager/model/ColumnModel;

    .line 299
    .local v0, "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    invoke-virtual {v0}, Lorg/litepal/tablemanager/model/ColumnModel;->getColumnName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 302
    .end local v0    # "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    :cond_0
    invoke-direct {p0, v1}, Lorg/litepal/tablemanager/Upgrader;->removeColumns(Ljava/util/List;)V

    .line 303
    invoke-direct {p0, p1}, Lorg/litepal/tablemanager/Upgrader;->addColumns(Ljava/util/List;)V

    .line 304
    return-void
.end method

.method private findColumnTypesToChange()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/litepal/tablemanager/model/ColumnModel;",
            ">;"
        }
    .end annotation

    .prologue
    .line 175
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 176
    .local v2, "columnsToChangeType":Ljava/util/List;, "Ljava/util/List<Lorg/litepal/tablemanager/model/ColumnModel;>;"
    iget-object v3, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModelDB:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v3}, Lorg/litepal/tablemanager/model/TableModel;->getColumnModels()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/litepal/tablemanager/model/ColumnModel;

    .line 177
    .local v1, "columnModelDB":Lorg/litepal/tablemanager/model/ColumnModel;
    iget-object v4, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v4}, Lorg/litepal/tablemanager/model/TableModel;->getColumnModels()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/litepal/tablemanager/model/ColumnModel;

    .line 178
    .local v0, "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    invoke-virtual {v1}, Lorg/litepal/tablemanager/model/ColumnModel;->getColumnName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Lorg/litepal/tablemanager/model/ColumnModel;->getColumnName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 179
    invoke-virtual {v1}, Lorg/litepal/tablemanager/model/ColumnModel;->getColumnType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Lorg/litepal/tablemanager/model/ColumnModel;->getColumnType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 180
    invoke-virtual {v0}, Lorg/litepal/tablemanager/model/ColumnModel;->getColumnType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "blob"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-virtual {v1}, Lorg/litepal/tablemanager/model/ColumnModel;->getColumnType()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 187
    :cond_2
    :goto_1
    iget-boolean v5, p0, Lorg/litepal/tablemanager/Upgrader;->hasConstraintChanged:Z

    if-nez v5, :cond_1

    .line 189
    const-string v5, "AssociationUpdater"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "default value db is:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Lorg/litepal/tablemanager/model/ColumnModel;->getDefaultValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", default value is:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Lorg/litepal/tablemanager/model/ColumnModel;->getDefaultValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/litepal/util/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    invoke-virtual {v1}, Lorg/litepal/tablemanager/model/ColumnModel;->isNullable()Z

    move-result v5

    invoke-virtual {v0}, Lorg/litepal/tablemanager/model/ColumnModel;->isNullable()Z

    move-result v6

    if-ne v5, v6, :cond_3

    .line 191
    invoke-virtual {v1}, Lorg/litepal/tablemanager/model/ColumnModel;->getDefaultValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Lorg/litepal/tablemanager/model/ColumnModel;->getDefaultValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 192
    invoke-virtual {v1}, Lorg/litepal/tablemanager/model/ColumnModel;->isUnique()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v0}, Lorg/litepal/tablemanager/model/ColumnModel;->isUnique()Z

    move-result v5

    if-nez v5, :cond_1

    .line 193
    :cond_3
    const/4 v5, 0x1

    iput-boolean v5, p0, Lorg/litepal/tablemanager/Upgrader;->hasConstraintChanged:Z

    goto/16 :goto_0

    .line 184
    :cond_4
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 199
    .end local v0    # "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    .end local v1    # "columnModelDB":Lorg/litepal/tablemanager/model/ColumnModel;
    :cond_5
    return-object v2
.end method

.method private findColumnsToAdd()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/litepal/tablemanager/model/ColumnModel;",
            ">;"
        }
    .end annotation

    .prologue
    .line 130
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 131
    .local v2, "columnsToAdd":Ljava/util/List;, "Ljava/util/List<Lorg/litepal/tablemanager/model/ColumnModel;>;"
    iget-object v3, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v3}, Lorg/litepal/tablemanager/model/TableModel;->getColumnModels()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/litepal/tablemanager/model/ColumnModel;

    .line 132
    .local v0, "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    invoke-virtual {v0}, Lorg/litepal/tablemanager/model/ColumnModel;->getColumnName()Ljava/lang/String;

    move-result-object v1

    .line 133
    .local v1, "columnName":Ljava/lang/String;
    iget-object v4, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModelDB:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v4, v1}, Lorg/litepal/tablemanager/model/TableModel;->containsColumn(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 135
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 138
    .end local v0    # "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    .end local v1    # "columnName":Ljava/lang/String;
    :cond_1
    return-object v2
.end method

.method private findColumnsToRemove()Ljava/util/List;
    .locals 8
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
    .line 153
    iget-object v5, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v5}, Lorg/litepal/tablemanager/model/TableModel;->getTableName()Ljava/lang/String;

    move-result-object v4

    .line 154
    .local v4, "tableName":Ljava/lang/String;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 155
    .local v3, "removeColumns":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v5, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModelDB:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v5}, Lorg/litepal/tablemanager/model/TableModel;->getColumnModels()Ljava/util/List;

    move-result-object v1

    .line 156
    .local v1, "columnModelList":Ljava/util/List;, "Ljava/util/List<Lorg/litepal/tablemanager/model/ColumnModel;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/litepal/tablemanager/model/ColumnModel;

    .line 157
    .local v0, "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    invoke-virtual {v0}, Lorg/litepal/tablemanager/model/ColumnModel;->getColumnName()Ljava/lang/String;

    move-result-object v2

    .line 158
    .local v2, "dbColumnName":Ljava/lang/String;
    invoke-direct {p0, v2}, Lorg/litepal/tablemanager/Upgrader;->isNeedToRemove(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 159
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 162
    .end local v0    # "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    .end local v2    # "dbColumnName":Ljava/lang/String;
    :cond_1
    const-string v5, "AssociationUpdater"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "remove columns from "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " >> "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/litepal/util/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    return-object v3
.end method

.method private generateAddColumnSQL(Lorg/litepal/tablemanager/model/ColumnModel;)Ljava/lang/String;
    .locals 1
    .param p1, "columnModel"    # Lorg/litepal/tablemanager/model/ColumnModel;

    .prologue
    .line 238
    iget-object v0, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v0}, Lorg/litepal/tablemanager/model/TableModel;->getTableName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/litepal/tablemanager/Upgrader;->generateAddColumnSQL(Ljava/lang/String;Lorg/litepal/tablemanager/model/ColumnModel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private generateAddForeignKeySQL()Ljava/util/List;
    .locals 6
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
    .line 349
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 350
    .local v0, "addForeignKeySQLs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v4, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {p0, v4}, Lorg/litepal/tablemanager/Upgrader;->getForeignKeyColumns(Lorg/litepal/tablemanager/model/TableModel;)Ljava/util/List;

    move-result-object v3

    .line 351
    .local v3, "foreignKeyColumns":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 352
    .local v2, "foreignKeyColumn":Ljava/lang/String;
    iget-object v5, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v5, v2}, Lorg/litepal/tablemanager/model/TableModel;->containsColumn(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 353
    new-instance v1, Lorg/litepal/tablemanager/model/ColumnModel;

    invoke-direct {v1}, Lorg/litepal/tablemanager/model/ColumnModel;-><init>()V

    .line 354
    .local v1, "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    invoke-virtual {v1, v2}, Lorg/litepal/tablemanager/model/ColumnModel;->setColumnName(Ljava/lang/String;)V

    .line 355
    const-string v5, "integer"

    invoke-virtual {v1, v5}, Lorg/litepal/tablemanager/model/ColumnModel;->setColumnType(Ljava/lang/String;)V

    .line 356
    iget-object v5, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v5}, Lorg/litepal/tablemanager/model/TableModel;->getTableName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, v1}, Lorg/litepal/tablemanager/Upgrader;->generateAddColumnSQL(Ljava/lang/String;Lorg/litepal/tablemanager/model/ColumnModel;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 359
    .end local v1    # "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    .end local v2    # "foreignKeyColumn":Ljava/lang/String;
    :cond_1
    return-object v0
.end method

.method private getAddColumnSQLs(Ljava/util/List;)[Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/litepal/tablemanager/model/ColumnModel;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 250
    .local p1, "columnModelList":Ljava/util/List;, "Ljava/util/List<Lorg/litepal/tablemanager/model/ColumnModel;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 251
    .local v1, "sqls":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/litepal/tablemanager/model/ColumnModel;

    .line 252
    .local v0, "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    invoke-direct {p0, v0}, Lorg/litepal/tablemanager/Upgrader;->generateAddColumnSQL(Lorg/litepal/tablemanager/model/ColumnModel;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 254
    .end local v0    # "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    :cond_0
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    return-object v2
.end method

.method private getChangeColumnsConstraintsSQL()[Ljava/lang/String;
    .locals 9

    .prologue
    .line 323
    iget-object v7, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v7}, Lorg/litepal/tablemanager/model/TableModel;->getTableName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/litepal/tablemanager/Upgrader;->generateAlterToTempTableSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 324
    .local v1, "alterToTempTableSQL":Ljava/lang/String;
    iget-object v7, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {p0, v7}, Lorg/litepal/tablemanager/Upgrader;->generateCreateTableSQL(Lorg/litepal/tablemanager/model/TableModel;)Ljava/lang/String;

    move-result-object v2

    .line 325
    .local v2, "createNewTableSQL":Ljava/lang/String;
    invoke-direct {p0}, Lorg/litepal/tablemanager/Upgrader;->generateAddForeignKeySQL()Ljava/util/List;

    move-result-object v0

    .line 326
    .local v0, "addForeignKeySQLs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v7, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModelDB:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {p0, v7}, Lorg/litepal/tablemanager/Upgrader;->generateDataMigrationSQL(Lorg/litepal/tablemanager/model/TableModel;)Ljava/lang/String;

    move-result-object v3

    .line 327
    .local v3, "dataMigrationSQL":Ljava/lang/String;
    iget-object v7, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v7}, Lorg/litepal/tablemanager/model/TableModel;->getTableName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/litepal/tablemanager/Upgrader;->generateDropTempTableSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 328
    .local v4, "dropTempTableSQL":Ljava/lang/String;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 329
    .local v6, "sqls":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v6, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 330
    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 331
    invoke-interface {v6, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 332
    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 333
    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 334
    const-string v7, "AssociationUpdater"

    const-string v8, "generateChangeConstraintSQL >> "

    invoke-static {v7, v8}, Lorg/litepal/util/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 336
    .local v5, "sql":Ljava/lang/String;
    const-string v8, "AssociationUpdater"

    invoke-static {v8, v5}, Lorg/litepal/util/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 338
    .end local v5    # "sql":Ljava/lang/String;
    :cond_0
    const-string v7, "AssociationUpdater"

    const-string v8, "<< generateChangeConstraintSQL"

    invoke-static {v7, v8}, Lorg/litepal/util/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 339
    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/String;

    invoke-interface {v6, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    return-object v7
.end method

.method private hasNewUniqueOrNotNullColumn()Z
    .locals 7

    .prologue
    const/4 v3, 0x1

    .line 107
    iget-object v4, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v4}, Lorg/litepal/tablemanager/model/TableModel;->getColumnModels()Ljava/util/List;

    move-result-object v2

    .line 108
    .local v2, "columnModelList":Ljava/util/List;, "Ljava/util/List<Lorg/litepal/tablemanager/model/ColumnModel;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/litepal/tablemanager/model/ColumnModel;

    .line 109
    .local v0, "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    iget-object v5, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModelDB:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v0}, Lorg/litepal/tablemanager/model/ColumnModel;->getColumnName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/litepal/tablemanager/model/TableModel;->getColumnModelByName(Ljava/lang/String;)Lorg/litepal/tablemanager/model/ColumnModel;

    move-result-object v1

    .line 110
    .local v1, "columnModelDB":Lorg/litepal/tablemanager/model/ColumnModel;
    invoke-virtual {v0}, Lorg/litepal/tablemanager/model/ColumnModel;->isUnique()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 111
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lorg/litepal/tablemanager/model/ColumnModel;->isUnique()Z

    move-result v5

    if-nez v5, :cond_2

    .line 119
    .end local v0    # "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    .end local v1    # "columnModelDB":Lorg/litepal/tablemanager/model/ColumnModel;
    :cond_1
    :goto_0
    return v3

    .line 115
    .restart local v0    # "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    .restart local v1    # "columnModelDB":Lorg/litepal/tablemanager/model/ColumnModel;
    :cond_2
    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lorg/litepal/tablemanager/model/ColumnModel;->isNullable()Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {v1}, Lorg/litepal/tablemanager/model/ColumnModel;->isNullable()Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 119
    .end local v0    # "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    .end local v1    # "columnModelDB":Lorg/litepal/tablemanager/model/ColumnModel;
    :cond_3
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private isNeedToRemove(Ljava/lang/String;)Z
    .locals 1
    .param p1, "columnName"    # Ljava/lang/String;

    .prologue
    .line 214
    invoke-direct {p0, p1}, Lorg/litepal/tablemanager/Upgrader;->isRemovedFromClass(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lorg/litepal/tablemanager/Upgrader;->isIdColumn(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    .line 215
    invoke-virtual {p0, v0, p1}, Lorg/litepal/tablemanager/Upgrader;->isForeignKeyColumn(Lorg/litepal/tablemanager/model/TableModel;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 214
    :goto_0
    return v0

    .line 215
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isRemovedFromClass(Ljava/lang/String;)Z
    .locals 1
    .param p1, "columnName"    # Ljava/lang/String;

    .prologue
    .line 227
    iget-object v0, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v0, p1}, Lorg/litepal/tablemanager/model/TableModel;->containsColumn(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private removeColumns(Ljava/util/List;)V
    .locals 4
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
    .line 265
    .local p1, "removeColumnNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v1, "AssociationUpdater"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "do removeColumns "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/litepal/util/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    iget-object v1, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v1}, Lorg/litepal/tablemanager/model/TableModel;->getTableName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lorg/litepal/tablemanager/Upgrader;->removeColumns(Ljava/util/Collection;Ljava/lang/String;)V

    .line 267
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 268
    .local v0, "columnName":Ljava/lang/String;
    iget-object v2, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModelDB:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v2, v0}, Lorg/litepal/tablemanager/model/TableModel;->removeColumnModelByName(Ljava/lang/String;)V

    goto :goto_0

    .line 270
    .end local v0    # "columnName":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private upgradeTable()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    .line 79
    invoke-direct {p0}, Lorg/litepal/tablemanager/Upgrader;->hasNewUniqueOrNotNullColumn()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 81
    iget-object v3, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    iget-object v4, p0, Lorg/litepal/tablemanager/Upgrader;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0, v3, v4, v7}, Lorg/litepal/tablemanager/Upgrader;->createOrUpgradeTable(Lorg/litepal/tablemanager/model/TableModel;Landroid/database/sqlite/SQLiteDatabase;Z)V

    .line 83
    iget-object v3, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v3}, Lorg/litepal/tablemanager/model/TableModel;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/litepal/tablemanager/Upgrader;->getAssociationInfo(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v1

    .line 84
    .local v1, "associationsInfo":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/litepal/crud/model/AssociationsInfo;>;"
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/litepal/crud/model/AssociationsInfo;

    .line 85
    .local v2, "info":Lorg/litepal/crud/model/AssociationsInfo;
    invoke-virtual {v2}, Lorg/litepal/crud/model/AssociationsInfo;->getAssociationType()I

    move-result v4

    const/4 v5, 0x2

    if-eq v4, v5, :cond_1

    .line 86
    invoke-virtual {v2}, Lorg/litepal/crud/model/AssociationsInfo;->getAssociationType()I

    move-result v4

    if-ne v4, v7, :cond_0

    .line 87
    :cond_1
    invoke-virtual {v2}, Lorg/litepal/crud/model/AssociationsInfo;->getClassHoldsForeignKey()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v5}, Lorg/litepal/tablemanager/model/TableModel;->getClassName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 88
    invoke-virtual {v2}, Lorg/litepal/crud/model/AssociationsInfo;->getAssociatedClassName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/litepal/util/DBUtility;->getTableNameByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, "associatedTableName":Ljava/lang/String;
    iget-object v4, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v4}, Lorg/litepal/tablemanager/model/TableModel;->getTableName()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v5}, Lorg/litepal/tablemanager/model/TableModel;->getTableName()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lorg/litepal/tablemanager/Upgrader;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0, v4, v0, v5, v6}, Lorg/litepal/tablemanager/Upgrader;->addForeignKeyColumn(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase;)V

    goto :goto_0

    .line 94
    .end local v0    # "associatedTableName":Ljava/lang/String;
    .end local v1    # "associationsInfo":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/litepal/crud/model/AssociationsInfo;>;"
    .end local v2    # "info":Lorg/litepal/crud/model/AssociationsInfo;
    :cond_2
    const/4 v3, 0x0

    iput-boolean v3, p0, Lorg/litepal/tablemanager/Upgrader;->hasConstraintChanged:Z

    .line 95
    invoke-direct {p0}, Lorg/litepal/tablemanager/Upgrader;->findColumnsToRemove()Ljava/util/List;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/litepal/tablemanager/Upgrader;->removeColumns(Ljava/util/List;)V

    .line 96
    invoke-direct {p0}, Lorg/litepal/tablemanager/Upgrader;->findColumnsToAdd()Ljava/util/List;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/litepal/tablemanager/Upgrader;->addColumns(Ljava/util/List;)V

    .line 97
    invoke-direct {p0}, Lorg/litepal/tablemanager/Upgrader;->findColumnTypesToChange()Ljava/util/List;

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/litepal/tablemanager/Upgrader;->changeColumnsType(Ljava/util/List;)V

    .line 98
    invoke-direct {p0}, Lorg/litepal/tablemanager/Upgrader;->changeColumnsConstraints()V

    .line 100
    :cond_3
    return-void
.end method


# virtual methods
.method protected createOrUpgradeTable(Landroid/database/sqlite/SQLiteDatabase;Z)V
    .locals 5
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "force"    # Z

    .prologue
    .line 64
    iput-object p1, p0, Lorg/litepal/tablemanager/Upgrader;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    .line 65
    invoke-virtual {p0}, Lorg/litepal/tablemanager/Upgrader;->getAllTableModels()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/litepal/tablemanager/model/TableModel;

    .line 66
    .local v0, "tableModel":Lorg/litepal/tablemanager/model/TableModel;
    iput-object v0, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    .line 67
    invoke-virtual {v0}, Lorg/litepal/tablemanager/model/TableModel;->getTableName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/litepal/tablemanager/Upgrader;->getTableModelFromDB(Ljava/lang/String;)Lorg/litepal/tablemanager/model/TableModel;

    move-result-object v2

    iput-object v2, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModelDB:Lorg/litepal/tablemanager/model/TableModel;

    .line 68
    const-string v2, "AssociationUpdater"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "createOrUpgradeTable: model is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/litepal/tablemanager/Upgrader;->mTableModel:Lorg/litepal/tablemanager/model/TableModel;

    invoke-virtual {v4}, Lorg/litepal/tablemanager/model/TableModel;->getTableName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/litepal/util/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    invoke-direct {p0}, Lorg/litepal/tablemanager/Upgrader;->upgradeTable()V

    goto :goto_0

    .line 71
    .end local v0    # "tableModel":Lorg/litepal/tablemanager/model/TableModel;
    :cond_0
    return-void
.end method
