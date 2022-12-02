.class Lorg/litepal/crud/UpdateHandler;
.super Lorg/litepal/crud/DataHandler;
.source "UpdateHandler.java"


# direct methods
.method constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/litepal/crud/DataHandler;-><init>()V

    .line 56
    iput-object p1, p0, Lorg/litepal/crud/UpdateHandler;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    .line 57
    return-void
.end method

.method private analyzeAssociations(Lorg/litepal/crud/DataSupport;)V
    .locals 4
    .param p1, "baseObj"    # Lorg/litepal/crud/DataSupport;

    .prologue
    .line 279
    .line 280
    :try_start_0
    invoke-virtual {p1}, Lorg/litepal/crud/DataSupport;->getClassName()Ljava/lang/String;

    move-result-object v2

    .line 279
    invoke-virtual {p0, v2}, Lorg/litepal/crud/UpdateHandler;->getAssociationInfo(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v0

    .line 281
    .local v0, "associationInfos":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/litepal/crud/model/AssociationsInfo;>;"
    invoke-virtual {p0, p1, v0}, Lorg/litepal/crud/UpdateHandler;->analyzeAssociatedModels(Lorg/litepal/crud/DataSupport;Ljava/util/Collection;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 285
    return-void

    .line 282
    .end local v0    # "associationInfos":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/litepal/crud/model/AssociationsInfo;>;"
    :catch_0
    move-exception v1

    .line 283
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Lorg/litepal/exceptions/DataSupportException;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/litepal/exceptions/DataSupportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private convertContentValues(Landroid/content/ContentValues;)V
    .locals 7
    .param p1, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 363
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0xb

    if-lt v5, v6, :cond_c

    .line 364
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 365
    .local v4, "valuesToConvert":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p1}, Landroid/content/ContentValues;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 366
    .local v2, "key":Ljava/lang/String;
    invoke-static {v2}, Lorg/litepal/util/DBUtility;->isFieldNameConflictWithSQLiteKeywords(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 367
    invoke-virtual {p1, v2}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 368
    .local v3, "object":Ljava/lang/Object;
    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 371
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "object":Ljava/lang/Object;
    :cond_1
    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_2
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_c

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 372
    .restart local v2    # "key":Ljava/lang/String;
    invoke-static {v2}, Lorg/litepal/util/DBUtility;->convertToValidColumnName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 373
    .local v1, "convertedKey":Ljava/lang/String;
    invoke-virtual {p1, v2}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 374
    .restart local v3    # "object":Ljava/lang/Object;
    invoke-virtual {p1, v2}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    .line 375
    if-nez v3, :cond_3

    .line 376
    invoke-virtual {p1, v1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    goto :goto_1

    .line 378
    :cond_3
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 379
    .local v0, "className":Ljava/lang/String;
    const-string v6, "java.lang.Byte"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 380
    check-cast v3, Ljava/lang/Byte;

    .end local v3    # "object":Ljava/lang/Object;
    invoke-virtual {p1, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Byte;)V

    goto :goto_1

    .line 381
    .restart local v3    # "object":Ljava/lang/Object;
    :cond_4
    const-string v6, "[B"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 382
    check-cast v3, [B

    .end local v3    # "object":Ljava/lang/Object;
    check-cast v3, [B

    invoke-virtual {p1, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    goto :goto_1

    .line 383
    .restart local v3    # "object":Ljava/lang/Object;
    :cond_5
    const-string v6, "java.lang.Boolean"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 384
    check-cast v3, Ljava/lang/Boolean;

    .end local v3    # "object":Ljava/lang/Object;
    invoke-virtual {p1, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    goto :goto_1

    .line 385
    .restart local v3    # "object":Ljava/lang/Object;
    :cond_6
    const-string v6, "java.lang.String"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 386
    check-cast v3, Ljava/lang/String;

    .end local v3    # "object":Ljava/lang/Object;
    invoke-virtual {p1, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 387
    .restart local v3    # "object":Ljava/lang/Object;
    :cond_7
    const-string v6, "java.lang.Float"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 388
    check-cast v3, Ljava/lang/Float;

    .end local v3    # "object":Ljava/lang/Object;
    invoke-virtual {p1, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Float;)V

    goto :goto_1

    .line 389
    .restart local v3    # "object":Ljava/lang/Object;
    :cond_8
    const-string v6, "java.lang.Long"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 390
    check-cast v3, Ljava/lang/Long;

    .end local v3    # "object":Ljava/lang/Object;
    invoke-virtual {p1, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_1

    .line 391
    .restart local v3    # "object":Ljava/lang/Object;
    :cond_9
    const-string v6, "java.lang.Integer"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a

    .line 392
    check-cast v3, Ljava/lang/Integer;

    .end local v3    # "object":Ljava/lang/Object;
    invoke-virtual {p1, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto/16 :goto_1

    .line 393
    .restart local v3    # "object":Ljava/lang/Object;
    :cond_a
    const-string v6, "java.lang.Short"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_b

    .line 394
    check-cast v3, Ljava/lang/Short;

    .end local v3    # "object":Ljava/lang/Object;
    invoke-virtual {p1, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Short;)V

    goto/16 :goto_1

    .line 395
    .restart local v3    # "object":Ljava/lang/Object;
    :cond_b
    const-string v6, "java.lang.Double"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 396
    check-cast v3, Ljava/lang/Double;

    .end local v3    # "object":Ljava/lang/Object;
    invoke-virtual {p1, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    goto/16 :goto_1

    .line 401
    .end local v0    # "className":Ljava/lang/String;
    .end local v1    # "convertedKey":Ljava/lang/String;
    .end local v2    # "key":Ljava/lang/String;
    .end local v4    # "valuesToConvert":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_c
    return-void
.end method

.method private varargs doUpdateAllAction(Ljava/lang/String;Landroid/content/ContentValues;[Ljava/lang/String;)I
    .locals 3
    .param p1, "tableName"    # Ljava/lang/String;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "conditions"    # [Ljava/lang/String;

    .prologue
    .line 198
    invoke-static {p3}, Lorg/litepal/util/BaseUtility;->checkConditionsCorrect([Ljava/lang/String;)V

    .line 199
    invoke-virtual {p2}, Landroid/content/ContentValues;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 200
    iget-object v0, p0, Lorg/litepal/crud/UpdateHandler;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0, p3}, Lorg/litepal/crud/UpdateHandler;->getWhereClause([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 201
    invoke-virtual {p0, p3}, Lorg/litepal/crud/UpdateHandler;->getWhereArgs([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 200
    invoke-virtual {v0, p1, p2, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 203
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private doUpdateAssociations(Lorg/litepal/crud/DataSupport;JLandroid/content/ContentValues;)I
    .locals 2
    .param p1, "baseObj"    # Lorg/litepal/crud/DataSupport;
    .param p2, "id"    # J
    .param p4, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 262
    const/4 v0, 0x0

    .line 263
    .local v0, "rowsAffected":I
    invoke-direct {p0, p1}, Lorg/litepal/crud/UpdateHandler;->analyzeAssociations(Lorg/litepal/crud/DataSupport;)V

    .line 264
    invoke-direct {p0, p1, p4}, Lorg/litepal/crud/UpdateHandler;->updateSelfTableForeignKey(Lorg/litepal/crud/DataSupport;Landroid/content/ContentValues;)V

    .line 265
    invoke-direct {p0, p1, p2, p3}, Lorg/litepal/crud/UpdateHandler;->updateAssociatedTableForeignKey(Lorg/litepal/crud/DataSupport;J)I

    move-result v1

    add-int/2addr v0, v1

    .line 266
    return v0
.end method

.method private varargs putFieldsToDefaultValue(Lorg/litepal/crud/DataSupport;Landroid/content/ContentValues;[J)V
    .locals 20
    .param p1, "baseObj"    # Lorg/litepal/crud/DataSupport;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "ids"    # [J

    .prologue
    .line 218
    const/4 v6, 0x0

    .line 220
    .local v6, "fieldName":Ljava/lang/String;
    :try_start_0
    invoke-virtual/range {p0 .. p1}, Lorg/litepal/crud/UpdateHandler;->getEmptyModel(Lorg/litepal/crud/DataSupport;)Lorg/litepal/crud/DataSupport;

    move-result-object v3

    .line 221
    .local v3, "emptyModel":Lorg/litepal/crud/DataSupport;
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    .line 222
    .local v4, "emptyModelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {p1 .. p1}, Lorg/litepal/crud/DataSupport;->getFieldsToSetToDefault()Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :cond_0
    :goto_0
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_4

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 223
    .local v9, "name":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lorg/litepal/crud/UpdateHandler;->isIdColumn(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_0

    .line 224
    move-object v6, v9

    .line 225
    invoke-virtual {v4, v6}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    .line 226
    .local v5, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lorg/litepal/crud/UpdateHandler;->isCollection(Ljava/lang/Class;)Z

    move-result v15

    if-eqz v15, :cond_3

    .line 227
    if-eqz p3, :cond_0

    move-object/from16 v0, p3

    array-length v15, v0

    if-lez v15, :cond_0

    .line 228
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lorg/litepal/crud/UpdateHandler;->getGenericTypeName(Ljava/lang/reflect/Field;)Ljava/lang/String;

    move-result-object v7

    .line 229
    .local v7, "genericTypeName":Ljava/lang/String;
    invoke-static {v7}, Lorg/litepal/util/BaseUtility;->isGenericTypeSupported(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_0

    .line 230
    invoke-virtual/range {p1 .. p1}, Lorg/litepal/crud/DataSupport;->getClassName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v15, v0}, Lorg/litepal/util/DBUtility;->getGenericTableName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 231
    .local v13, "tableName":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lorg/litepal/crud/DataSupport;->getClassName()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Lorg/litepal/util/DBUtility;->getGenericValueIdColumnName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 232
    .local v8, "genericValueIdColumnName":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 233
    .local v14, "whereClause":Ljava/lang/StringBuilder;
    const/4 v12, 0x0

    .line 234
    .local v12, "needOr":Z
    move-object/from16 v0, p3

    array-length v0, v0

    move/from16 v17, v0

    const/4 v15, 0x0

    :goto_1
    move/from16 v0, v17

    if-ge v15, v0, :cond_2

    aget-wide v10, p3, v15

    .line 235
    .local v10, "id":J
    if-eqz v12, :cond_1

    .line 236
    const-string v18, " or "

    move-object/from16 v0, v18

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    :cond_1
    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " = "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 239
    const/4 v12, 0x1

    .line 234
    add-int/lit8 v15, v15, 0x1

    goto :goto_1

    .line 241
    .end local v10    # "id":J
    :cond_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/litepal/crud/UpdateHandler;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v15, v13, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto/16 :goto_0

    .line 249
    .end local v3    # "emptyModel":Lorg/litepal/crud/DataSupport;
    .end local v4    # "emptyModelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "field":Ljava/lang/reflect/Field;
    .end local v7    # "genericTypeName":Ljava/lang/String;
    .end local v8    # "genericValueIdColumnName":Ljava/lang/String;
    .end local v9    # "name":Ljava/lang/String;
    .end local v12    # "needOr":Z
    .end local v13    # "tableName":Ljava/lang/String;
    .end local v14    # "whereClause":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v2

    .line 250
    .local v2, "e":Ljava/lang/NoSuchFieldException;
    new-instance v15, Lorg/litepal/exceptions/DataSupportException;

    .line 251
    invoke-virtual/range {p1 .. p1}, Lorg/litepal/crud/DataSupport;->getClassName()Ljava/lang/String;

    move-result-object v16

    .line 250
    move-object/from16 v0, v16

    invoke-static {v0, v6}, Lorg/litepal/exceptions/DataSupportException;->noSuchFieldExceptioin(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v2}, Lorg/litepal/exceptions/DataSupportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v15

    .line 245
    .end local v2    # "e":Ljava/lang/NoSuchFieldException;
    .restart local v3    # "emptyModel":Lorg/litepal/crud/DataSupport;
    .restart local v4    # "emptyModelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v5    # "field":Ljava/lang/reflect/Field;
    .restart local v9    # "name":Ljava/lang/String;
    :cond_3
    :try_start_1
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v3, v5, v1}, Lorg/litepal/crud/UpdateHandler;->putContentValuesForUpdate(Lorg/litepal/crud/DataSupport;Ljava/lang/reflect/Field;Landroid/content/ContentValues;)V
    :try_end_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_0

    .line 252
    .end local v3    # "emptyModel":Lorg/litepal/crud/DataSupport;
    .end local v4    # "emptyModelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "field":Ljava/lang/reflect/Field;
    .end local v9    # "name":Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 253
    .local v2, "e":Ljava/lang/Exception;
    new-instance v15, Lorg/litepal/exceptions/DataSupportException;

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v2}, Lorg/litepal/exceptions/DataSupportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v15

    .line 255
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v3    # "emptyModel":Lorg/litepal/crud/DataSupport;
    .restart local v4    # "emptyModelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_4
    return-void
.end method

.method private updateAssociatedTableForeignKey(Lorg/litepal/crud/DataSupport;J)I
    .locals 8
    .param p1, "baseObj"    # Lorg/litepal/crud/DataSupport;
    .param p2, "id"    # J

    .prologue
    .line 302
    invoke-virtual {p1}, Lorg/litepal/crud/DataSupport;->getAssociatedModelsMapWithFK()Ljava/util/Map;

    move-result-object v0

    .line 303
    .local v0, "associatedModelMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Set<Ljava/lang/Long;>;>;"
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 304
    .local v4, "values":Landroid/content/ContentValues;
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 305
    .local v1, "associatedTable":Ljava/lang/String;
    invoke-virtual {v4}, Landroid/content/ContentValues;->clear()V

    .line 306
    invoke-virtual {p1}, Lorg/litepal/crud/DataSupport;->getTableName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/litepal/crud/UpdateHandler;->getForeignKeyColumnName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 307
    .local v2, "fkName":Ljava/lang/String;
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v4, v2, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 308
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    .line 309
    .local v3, "ids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    if-eqz v3, :cond_0

    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_0

    .line 310
    iget-object v5, p0, Lorg/litepal/crud/UpdateHandler;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0, v3}, Lorg/litepal/crud/UpdateHandler;->getWhereOfIdsWithOr(Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v5, v1, v4, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v5

    .line 313
    .end local v1    # "associatedTable":Ljava/lang/String;
    .end local v2    # "fkName":Ljava/lang/String;
    .end local v3    # "ids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Long;>;"
    :goto_0
    return v5

    :cond_1
    const/4 v5, 0x0

    goto :goto_0
.end method

.method private varargs updateGenericTables(Lorg/litepal/crud/DataSupport;Ljava/util/List;[J)V
    .locals 20
    .param p1, "baseObj"    # Lorg/litepal/crud/DataSupport;
    .param p3, "ids"    # [J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/litepal/crud/DataSupport;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Field;",
            ">;[J)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 332
    .local p2, "supportedGenericFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    if-eqz p3, :cond_2

    move-object/from16 v0, p3

    array-length v12, v0

    if-lez v12, :cond_2

    .line 333
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/reflect/Field;

    .line 334
    .local v3, "field":Ljava/lang/reflect/Field;
    const/4 v12, 0x1

    invoke-virtual {v3, v12}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 335
    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Collection;

    .line 336
    .local v2, "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    if-eqz v2, :cond_0

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_0

    .line 337
    invoke-virtual/range {p1 .. p1}, Lorg/litepal/crud/DataSupport;->getClassName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-static {v12, v14}, Lorg/litepal/util/DBUtility;->getGenericTableName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 338
    .local v10, "tableName":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lorg/litepal/crud/DataSupport;->getClassName()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lorg/litepal/util/DBUtility;->getGenericValueIdColumnName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 339
    .local v4, "genericValueIdColumnName":Ljava/lang/String;
    move-object/from16 v0, p3

    array-length v14, v0

    const/4 v12, 0x0

    :goto_0
    if-ge v12, v14, :cond_0

    aget-wide v6, p3, v12

    .line 340
    .local v6, "id":J
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/litepal/crud/UpdateHandler;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " = ?"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v19

    aput-object v19, v17, v18

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v15, v10, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 341
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_1
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_1

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 342
    .local v5, "object":Ljava/lang/Object;
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 343
    .local v11, "values":Landroid/content/ContentValues;
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v11, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 344
    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v9, v0, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lorg/litepal/util/BaseUtility;->changeCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lorg/litepal/util/DBUtility;->convertToValidColumnName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    aput-object v17, v9, v16

    const/16 v16, 0x1

    aput-object v5, v9, v16

    .line 345
    .local v9, "parameters":[Ljava/lang/Object;
    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v8, v0, [Ljava/lang/Class;

    const/16 v16, 0x0

    const-class v17, Ljava/lang/String;

    aput-object v17, v8, v16

    const/16 v16, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/litepal/crud/UpdateHandler;->getGenericTypeClass(Ljava/lang/reflect/Field;)Ljava/lang/Class;

    move-result-object v17

    aput-object v17, v8, v16

    .line 346
    .local v8, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const-string v16, "put"

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-static {v11, v0, v9, v1, v8}, Lorg/litepal/crud/DynamicExecutor;->send(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/Object;

    .line 347
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/litepal/crud/UpdateHandler;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v0, v10, v1, v11}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_1

    .line 339
    .end local v5    # "object":Ljava/lang/Object;
    .end local v8    # "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v9    # "parameters":[Ljava/lang/Object;
    .end local v11    # "values":Landroid/content/ContentValues;
    :cond_1
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_0

    .line 353
    .end local v2    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    .end local v3    # "field":Ljava/lang/reflect/Field;
    .end local v4    # "genericValueIdColumnName":Ljava/lang/String;
    .end local v6    # "id":J
    .end local v10    # "tableName":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method private updateSelfTableForeignKey(Lorg/litepal/crud/DataSupport;Landroid/content/ContentValues;)V
    .locals 5
    .param p1, "baseObj"    # Lorg/litepal/crud/DataSupport;
    .param p2, "values"    # Landroid/content/ContentValues;

    .prologue
    .line 291
    invoke-virtual {p1}, Lorg/litepal/crud/DataSupport;->getAssociatedModelsMapWithoutFK()Ljava/util/Map;

    move-result-object v0

    .line 292
    .local v0, "associatedModelMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Long;>;"
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 293
    .local v1, "associatedTable":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lorg/litepal/crud/UpdateHandler;->getForeignKeyColumnName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 294
    .local v2, "fkName":Ljava/lang/String;
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {p2, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_0

    .line 296
    .end local v1    # "associatedTable":Ljava/lang/String;
    .end local v2    # "fkName":Ljava/lang/String;
    :cond_0
    return-void
.end method


# virtual methods
.method onUpdate(Ljava/lang/Class;JLandroid/content/ContentValues;)I
    .locals 4
    .param p2, "id"    # J
    .param p4, "values"    # Landroid/content/ContentValues;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;J",
            "Landroid/content/ContentValues;",
            ")I"
        }
    .end annotation

    .prologue
    .line 104
    .local p1, "modelClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p4}, Landroid/content/ContentValues;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 105
    invoke-direct {p0, p4}, Lorg/litepal/crud/UpdateHandler;->convertContentValues(Landroid/content/ContentValues;)V

    .line 106
    iget-object v0, p0, Lorg/litepal/crud/UpdateHandler;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p0, p1}, Lorg/litepal/crud/UpdateHandler;->getTableName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "id = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, p4, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 108
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method onUpdate(Lorg/litepal/crud/DataSupport;J)I
    .locals 8
    .param p1, "baseObj"    # Lorg/litepal/crud/DataSupport;
    .param p2, "id"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v3, 0x0

    .line 77
    invoke-virtual {p1}, Lorg/litepal/crud/DataSupport;->getClassName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/litepal/crud/UpdateHandler;->getSupportedFields(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 78
    .local v0, "supportedFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    invoke-virtual {p1}, Lorg/litepal/crud/DataSupport;->getClassName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/litepal/crud/UpdateHandler;->getSupportedGenericFields(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 79
    .local v1, "supportedGenericFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    new-array v4, v5, [J

    aput-wide p2, v4, v3

    invoke-direct {p0, p1, v1, v4}, Lorg/litepal/crud/UpdateHandler;->updateGenericTables(Lorg/litepal/crud/DataSupport;Ljava/util/List;[J)V

    .line 80
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 81
    .local v2, "values":Landroid/content/ContentValues;
    invoke-virtual {p0, p1, v0, v2}, Lorg/litepal/crud/UpdateHandler;->putFieldsValue(Lorg/litepal/crud/DataSupport;Ljava/util/List;Landroid/content/ContentValues;)V

    .line 82
    new-array v4, v5, [J

    aput-wide p2, v4, v3

    invoke-direct {p0, p1, v2, v4}, Lorg/litepal/crud/UpdateHandler;->putFieldsToDefaultValue(Lorg/litepal/crud/DataSupport;Landroid/content/ContentValues;[J)V

    .line 83
    invoke-virtual {v2}, Landroid/content/ContentValues;->size()I

    move-result v4

    if-lez v4, :cond_0

    .line 84
    iget-object v3, p0, Lorg/litepal/crud/UpdateHandler;->mDatabase:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p1}, Lorg/litepal/crud/DataSupport;->getTableName()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "id = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v3, v4, v2, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    .line 86
    :cond_0
    return v3
.end method

.method varargs onUpdateAll(Ljava/lang/String;Landroid/content/ContentValues;[Ljava/lang/String;)I
    .locals 2
    .param p1, "tableName"    # Ljava/lang/String;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "conditions"    # [Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 174
    invoke-static {p3}, Lorg/litepal/util/BaseUtility;->checkConditionsCorrect([Ljava/lang/String;)V

    .line 175
    if-eqz p3, :cond_0

    array-length v0, p3

    if-lez v0, :cond_0

    .line 176
    aget-object v0, p3, v1

    invoke-static {v0}, Lorg/litepal/util/DBUtility;->convertWhereClauseToColumnName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, p3, v1

    .line 178
    :cond_0
    invoke-direct {p0, p2}, Lorg/litepal/crud/UpdateHandler;->convertContentValues(Landroid/content/ContentValues;)V

    .line 179
    invoke-direct {p0, p1, p2, p3}, Lorg/litepal/crud/UpdateHandler;->doUpdateAllAction(Ljava/lang/String;Landroid/content/ContentValues;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method varargs onUpdateAll(Lorg/litepal/crud/DataSupport;[Ljava/lang/String;)I
    .locals 10
    .param p1, "baseObj"    # Lorg/litepal/crud/DataSupport;
    .param p2, "conditions"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;,
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 133
    invoke-static {p2}, Lorg/litepal/util/BaseUtility;->checkConditionsCorrect([Ljava/lang/String;)V

    .line 134
    if-eqz p2, :cond_0

    array-length v7, p2

    if-lez v7, :cond_0

    .line 135
    aget-object v7, p2, v9

    invoke-static {v7}, Lorg/litepal/util/DBUtility;->convertWhereClauseToColumnName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, p2, v9

    .line 137
    :cond_0
    invoke-virtual {p1}, Lorg/litepal/crud/DataSupport;->getClassName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/litepal/crud/UpdateHandler;->getSupportedFields(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    .line 138
    .local v4, "supportedFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    invoke-virtual {p1}, Lorg/litepal/crud/DataSupport;->getClassName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/litepal/crud/UpdateHandler;->getSupportedGenericFields(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    .line 139
    .local v5, "supportedGenericFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    const/4 v2, 0x0

    .line 140
    .local v2, "ids":[J
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_2

    .line 141
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const-string v8, "id"

    aput-object v8, v7, v9

    invoke-static {v7}, Lorg/litepal/crud/DataSupport;->select([Ljava/lang/String;)Lorg/litepal/crud/ClusterQuery;

    move-result-object v7

    invoke-virtual {v7, p2}, Lorg/litepal/crud/ClusterQuery;->where([Ljava/lang/String;)Lorg/litepal/crud/ClusterQuery;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/litepal/crud/ClusterQuery;->find(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v3

    .line 142
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Lorg/litepal/crud/DataSupport;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v7

    if-lez v7, :cond_2

    .line 143
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v7

    new-array v2, v7, [J

    .line 144
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v7, v2

    if-ge v1, v7, :cond_1

    .line 145
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/litepal/crud/DataSupport;

    .line 146
    .local v0, "dataSupport":Lorg/litepal/crud/DataSupport;
    invoke-virtual {v0}, Lorg/litepal/crud/DataSupport;->getBaseObjId()J

    move-result-wide v8

    aput-wide v8, v2, v1

    .line 144
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 148
    .end local v0    # "dataSupport":Lorg/litepal/crud/DataSupport;
    :cond_1
    invoke-direct {p0, p1, v5, v2}, Lorg/litepal/crud/UpdateHandler;->updateGenericTables(Lorg/litepal/crud/DataSupport;Ljava/util/List;[J)V

    .line 151
    .end local v1    # "i":I
    .end local v3    # "list":Ljava/util/List;, "Ljava/util/List<Lorg/litepal/crud/DataSupport;>;"
    :cond_2
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 152
    .local v6, "values":Landroid/content/ContentValues;
    invoke-virtual {p0, p1, v4, v6}, Lorg/litepal/crud/UpdateHandler;->putFieldsValue(Lorg/litepal/crud/DataSupport;Ljava/util/List;Landroid/content/ContentValues;)V

    .line 153
    invoke-direct {p0, p1, v6, v2}, Lorg/litepal/crud/UpdateHandler;->putFieldsToDefaultValue(Lorg/litepal/crud/DataSupport;Landroid/content/ContentValues;[J)V

    .line 154
    invoke-virtual {p1}, Lorg/litepal/crud/DataSupport;->getTableName()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7, v6, p2}, Lorg/litepal/crud/UpdateHandler;->doUpdateAllAction(Ljava/lang/String;Landroid/content/ContentValues;[Ljava/lang/String;)I

    move-result v7

    return v7
.end method
