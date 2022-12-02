.class public abstract Lorg/litepal/LitePalBase;
.super Ljava/lang/Object;
.source "LitePalBase.java"


# static fields
.field private static final GET_ASSOCIATIONS_ACTION:I = 0x1

.field private static final GET_ASSOCIATION_INFO_ACTION:I = 0x2

.field public static final TAG:Ljava/lang/String; = "LitePalBase"


# instance fields
.field private classFieldsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Field;",
            ">;>;"
        }
    .end annotation
.end field

.field private classGenericFieldsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Field;",
            ">;>;"
        }
    .end annotation
.end field

.field private mAssociationInfos:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lorg/litepal/crud/model/AssociationsInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mAssociationModels:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lorg/litepal/tablemanager/model/AssociationsModel;",
            ">;"
        }
    .end annotation
.end field

.field private mGenericModels:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lorg/litepal/tablemanager/model/GenericModel;",
            ">;"
        }
    .end annotation
.end field

.field private typeChangeRules:[Lorg/litepal/tablemanager/typechange/OrmChange;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    const/4 v0, 0x6

    new-array v0, v0, [Lorg/litepal/tablemanager/typechange/OrmChange;

    const/4 v1, 0x0

    new-instance v2, Lorg/litepal/tablemanager/typechange/NumericOrm;

    invoke-direct {v2}, Lorg/litepal/tablemanager/typechange/NumericOrm;-><init>()V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Lorg/litepal/tablemanager/typechange/TextOrm;

    invoke-direct {v2}, Lorg/litepal/tablemanager/typechange/TextOrm;-><init>()V

    aput-object v2, v0, v1

    const/4 v1, 0x2

    new-instance v2, Lorg/litepal/tablemanager/typechange/BooleanOrm;

    invoke-direct {v2}, Lorg/litepal/tablemanager/typechange/BooleanOrm;-><init>()V

    aput-object v2, v0, v1

    const/4 v1, 0x3

    new-instance v2, Lorg/litepal/tablemanager/typechange/DecimalOrm;

    invoke-direct {v2}, Lorg/litepal/tablemanager/typechange/DecimalOrm;-><init>()V

    aput-object v2, v0, v1

    const/4 v1, 0x4

    new-instance v2, Lorg/litepal/tablemanager/typechange/DateOrm;

    invoke-direct {v2}, Lorg/litepal/tablemanager/typechange/DateOrm;-><init>()V

    aput-object v2, v0, v1

    const/4 v1, 0x5

    new-instance v2, Lorg/litepal/tablemanager/typechange/BlobOrm;

    invoke-direct {v2}, Lorg/litepal/tablemanager/typechange/BlobOrm;-><init>()V

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/litepal/LitePalBase;->typeChangeRules:[Lorg/litepal/tablemanager/typechange/OrmChange;

    .line 82
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/litepal/LitePalBase;->classFieldsMap:Ljava/util/Map;

    .line 87
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/litepal/LitePalBase;->classGenericFieldsMap:Ljava/util/Map;

    return-void
.end method

.method private addIntoAssociationInfoCollection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;I)V
    .locals 2
    .param p1, "selfClassName"    # Ljava/lang/String;
    .param p2, "associatedClassName"    # Ljava/lang/String;
    .param p3, "classHoldsForeignKey"    # Ljava/lang/String;
    .param p4, "associateOtherModelFromSelf"    # Ljava/lang/reflect/Field;
    .param p5, "associateSelfFromOtherModel"    # Ljava/lang/reflect/Field;
    .param p6, "associationType"    # I

    .prologue
    .line 639
    new-instance v0, Lorg/litepal/crud/model/AssociationsInfo;

    invoke-direct {v0}, Lorg/litepal/crud/model/AssociationsInfo;-><init>()V

    .line 640
    .local v0, "associationInfo":Lorg/litepal/crud/model/AssociationsInfo;
    invoke-virtual {v0, p1}, Lorg/litepal/crud/model/AssociationsInfo;->setSelfClassName(Ljava/lang/String;)V

    .line 641
    invoke-virtual {v0, p2}, Lorg/litepal/crud/model/AssociationsInfo;->setAssociatedClassName(Ljava/lang/String;)V

    .line 642
    invoke-virtual {v0, p3}, Lorg/litepal/crud/model/AssociationsInfo;->setClassHoldsForeignKey(Ljava/lang/String;)V

    .line 643
    invoke-virtual {v0, p4}, Lorg/litepal/crud/model/AssociationsInfo;->setAssociateOtherModelFromSelf(Ljava/lang/reflect/Field;)V

    .line 644
    invoke-virtual {v0, p5}, Lorg/litepal/crud/model/AssociationsInfo;->setAssociateSelfFromOtherModel(Ljava/lang/reflect/Field;)V

    .line 645
    invoke-virtual {v0, p6}, Lorg/litepal/crud/model/AssociationsInfo;->setAssociationType(I)V

    .line 646
    iget-object v1, p0, Lorg/litepal/LitePalBase;->mAssociationInfos:Ljava/util/Collection;

    invoke-interface {v1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 647
    return-void
.end method

.method private addIntoAssociationModelCollection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 2
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "associatedClassName"    # Ljava/lang/String;
    .param p3, "classHoldsForeignKey"    # Ljava/lang/String;
    .param p4, "associationType"    # I

    .prologue
    .line 609
    new-instance v0, Lorg/litepal/tablemanager/model/AssociationsModel;

    invoke-direct {v0}, Lorg/litepal/tablemanager/model/AssociationsModel;-><init>()V

    .line 610
    .local v0, "associationModel":Lorg/litepal/tablemanager/model/AssociationsModel;
    invoke-static {p1}, Lorg/litepal/util/DBUtility;->getTableNameByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/litepal/tablemanager/model/AssociationsModel;->setTableName(Ljava/lang/String;)V

    .line 611
    invoke-static {p2}, Lorg/litepal/util/DBUtility;->getTableNameByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/litepal/tablemanager/model/AssociationsModel;->setAssociatedTableName(Ljava/lang/String;)V

    .line 612
    invoke-static {p3}, Lorg/litepal/util/DBUtility;->getTableNameByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/litepal/tablemanager/model/AssociationsModel;->setTableHoldsForeignKey(Ljava/lang/String;)V

    .line 613
    invoke-virtual {v0, p4}, Lorg/litepal/tablemanager/model/AssociationsModel;->setAssociationType(I)V

    .line 614
    iget-object v1, p0, Lorg/litepal/LitePalBase;->mAssociationModels:Ljava/util/Collection;

    invoke-interface {v1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 615
    return-void
.end method

.method private analyzeClassFields(Ljava/lang/String;I)V
    .locals 7
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "action"    # I

    .prologue
    .line 381
    :try_start_0
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 382
    .local v0, "dynamicClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v3

    .line 383
    .local v3, "fields":[Ljava/lang/reflect/Field;
    array-length v5, v3

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v2, v3, v4

    .line 384
    .local v2, "field":Ljava/lang/reflect/Field;
    invoke-direct {p0, v2}, Lorg/litepal/LitePalBase;->isPrivateAndNonPrimitive(Ljava/lang/reflect/Field;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 385
    invoke-direct {p0, p1, v2, p2}, Lorg/litepal/LitePalBase;->oneToAnyConditions(Ljava/lang/String;Ljava/lang/reflect/Field;I)V

    .line 386
    invoke-direct {p0, p1, v2, p2}, Lorg/litepal/LitePalBase;->manyToAnyConditions(Ljava/lang/String;Ljava/lang/reflect/Field;I)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 383
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 389
    .end local v0    # "dynamicClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "field":Ljava/lang/reflect/Field;
    .end local v3    # "fields":[Ljava/lang/reflect/Field;
    :catch_0
    move-exception v1

    .line 390
    .local v1, "ex":Ljava/lang/ClassNotFoundException;
    invoke-virtual {v1}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    .line 391
    new-instance v4, Lorg/litepal/exceptions/DatabaseGenerateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "can not find a class named "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/litepal/exceptions/DatabaseGenerateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 393
    .end local v1    # "ex":Ljava/lang/ClassNotFoundException;
    .restart local v0    # "dynamicClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v3    # "fields":[Ljava/lang/reflect/Field;
    :cond_1
    return-void
.end method

.method private convertFieldToColumnModel(Ljava/lang/reflect/Field;)Lorg/litepal/tablemanager/model/ColumnModel;
    .locals 8
    .param p1, "field"    # Ljava/lang/reflect/Field;

    .prologue
    .line 673
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    .line 674
    .local v4, "fieldType":Ljava/lang/String;
    invoke-virtual {p0, v4}, Lorg/litepal/LitePalBase;->getColumnType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 675
    .local v2, "columnType":Ljava/lang/String;
    const/4 v5, 0x1

    .line 676
    .local v5, "nullable":Z
    const/4 v6, 0x0

    .line 677
    .local v6, "unique":Z
    const-string v3, ""

    .line 678
    .local v3, "defaultValue":Ljava/lang/String;
    const-class v7, Lorg/litepal/annotation/Column;

    invoke-virtual {p1, v7}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/litepal/annotation/Column;

    .line 679
    .local v0, "annotation":Lorg/litepal/annotation/Column;
    if-eqz v0, :cond_0

    .line 680
    invoke-interface {v0}, Lorg/litepal/annotation/Column;->nullable()Z

    move-result v5

    .line 681
    invoke-interface {v0}, Lorg/litepal/annotation/Column;->unique()Z

    move-result v6

    .line 682
    invoke-interface {v0}, Lorg/litepal/annotation/Column;->defaultValue()Ljava/lang/String;

    move-result-object v3

    .line 684
    :cond_0
    new-instance v1, Lorg/litepal/tablemanager/model/ColumnModel;

    invoke-direct {v1}, Lorg/litepal/tablemanager/model/ColumnModel;-><init>()V

    .line 685
    .local v1, "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/litepal/util/DBUtility;->convertToValidColumnName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Lorg/litepal/tablemanager/model/ColumnModel;->setColumnName(Ljava/lang/String;)V

    .line 686
    invoke-virtual {v1, v2}, Lorg/litepal/tablemanager/model/ColumnModel;->setColumnType(Ljava/lang/String;)V

    .line 687
    invoke-virtual {v1, v5}, Lorg/litepal/tablemanager/model/ColumnModel;->setIsNullable(Z)V

    .line 688
    invoke-virtual {v1, v6}, Lorg/litepal/tablemanager/model/ColumnModel;->setIsUnique(Z)V

    .line 689
    invoke-virtual {v1, v3}, Lorg/litepal/tablemanager/model/ColumnModel;->setDefaultValue(Ljava/lang/String;)V

    .line 690
    return-object v1
.end method

.method private isPrivateAndNonPrimitive(Ljava/lang/reflect/Field;)Z
    .locals 1
    .param p1, "field"    # Ljava/lang/reflect/Field;

    .prologue
    .line 404
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPrivate(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private manyToAnyConditions(Ljava/lang/String;Ljava/lang/reflect/Field;I)V
    .locals 23
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "field"    # Ljava/lang/reflect/Field;
    .param p3, "action"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 521
    invoke-virtual/range {p2 .. p2}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/litepal/LitePalBase;->isCollection(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 522
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/litepal/LitePalBase;->getGenericTypeName(Ljava/lang/reflect/Field;)Ljava/lang/String;

    move-result-object v4

    .line 525
    .local v4, "genericTypeName":Ljava/lang/String;
    invoke-static {}, Lorg/litepal/parser/LitePalAttr;->getInstance()Lorg/litepal/parser/LitePalAttr;

    move-result-object v2

    invoke-virtual {v2}, Lorg/litepal/parser/LitePalAttr;->getClassNames()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 526
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v19

    .line 527
    .local v19, "reverseDynamicClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v21

    .line 530
    .local v21, "reverseFields":[Ljava/lang/reflect/Field;
    const/16 v18, 0x0

    .line 531
    .local v18, "reverseAssociations":Z
    const/16 v17, 0x0

    .local v17, "i":I
    :goto_0
    move-object/from16 v0, v21

    array-length v2, v0

    move/from16 v0, v17

    if-ge v0, v2, :cond_6

    .line 532
    aget-object v7, v21, v17

    .line 534
    .local v7, "reverseField":Ljava/lang/reflect/Field;
    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v2

    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 535
    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v20

    .line 539
    .local v20, "reverseFieldTypeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 540
    const/4 v2, 0x1

    move/from16 v0, p3

    if-ne v0, v2, :cond_2

    .line 541
    const/4 v2, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4, v4, v2}, Lorg/litepal/LitePalBase;->addIntoAssociationModelCollection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 547
    :cond_0
    :goto_1
    const/16 v18, 0x1

    .line 531
    .end local v20    # "reverseFieldTypeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1
    :goto_2
    add-int/lit8 v17, v17, 0x1

    goto :goto_0

    .line 543
    .restart local v20    # "reverseFieldTypeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    const/4 v2, 0x2

    move/from16 v0, p3

    if-ne v0, v2, :cond_0

    .line 544
    const/4 v8, 0x2

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object v5, v4

    move-object/from16 v6, p2

    invoke-direct/range {v2 .. v8}, Lorg/litepal/LitePalBase;->addIntoAssociationInfoCollection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;I)V

    goto :goto_1

    .line 552
    :cond_3
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/litepal/LitePalBase;->isCollection(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 553
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lorg/litepal/LitePalBase;->getGenericTypeName(Ljava/lang/reflect/Field;)Ljava/lang/String;

    move-result-object v22

    .line 554
    .local v22, "reverseGenericTypeName":Ljava/lang/String;
    move-object/from16 v0, p1

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 555
    const/4 v2, 0x1

    move/from16 v0, p3

    if-ne v0, v2, :cond_5

    .line 556
    const/4 v2, 0x0

    const/4 v3, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4, v2, v3}, Lorg/litepal/LitePalBase;->addIntoAssociationModelCollection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 562
    :cond_4
    :goto_3
    const/16 v18, 0x1

    goto :goto_2

    .line 558
    :cond_5
    const/4 v2, 0x2

    move/from16 v0, p3

    if-ne v0, v2, :cond_4

    .line 559
    const/4 v5, 0x0

    const/4 v8, 0x3

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v6, p2

    invoke-direct/range {v2 .. v8}, Lorg/litepal/LitePalBase;->addIntoAssociationInfoCollection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;I)V

    goto :goto_3

    .line 570
    .end local v7    # "reverseField":Ljava/lang/reflect/Field;
    .end local v20    # "reverseFieldTypeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v22    # "reverseGenericTypeName":Ljava/lang/String;
    :cond_6
    if-nez v18, :cond_7

    .line 571
    const/4 v2, 0x1

    move/from16 v0, p3

    if-ne v0, v2, :cond_8

    .line 572
    const/4 v2, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4, v4, v2}, Lorg/litepal/LitePalBase;->addIntoAssociationModelCollection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 592
    .end local v4    # "genericTypeName":Ljava/lang/String;
    .end local v17    # "i":I
    .end local v18    # "reverseAssociations":Z
    .end local v19    # "reverseDynamicClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v21    # "reverseFields":[Ljava/lang/reflect/Field;
    :cond_7
    :goto_4
    return-void

    .line 574
    .restart local v4    # "genericTypeName":Ljava/lang/String;
    .restart local v17    # "i":I
    .restart local v18    # "reverseAssociations":Z
    .restart local v19    # "reverseDynamicClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v21    # "reverseFields":[Ljava/lang/reflect/Field;
    :cond_8
    const/4 v2, 0x2

    move/from16 v0, p3

    if-ne v0, v2, :cond_7

    .line 575
    const/4 v13, 0x0

    const/4 v14, 0x2

    move-object/from16 v8, p0

    move-object/from16 v9, p1

    move-object v10, v4

    move-object v11, v4

    move-object/from16 v12, p2

    invoke-direct/range {v8 .. v14}, Lorg/litepal/LitePalBase;->addIntoAssociationInfoCollection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;I)V

    goto :goto_4

    .line 579
    .end local v17    # "i":I
    .end local v18    # "reverseAssociations":Z
    .end local v19    # "reverseDynamicClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v21    # "reverseFields":[Ljava/lang/reflect/Field;
    :cond_9
    invoke-static {v4}, Lorg/litepal/util/BaseUtility;->isGenericTypeSupported(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    const/4 v2, 0x1

    move/from16 v0, p3

    if-ne v0, v2, :cond_7

    .line 580
    const-class v2, Lorg/litepal/annotation/Column;

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v15

    check-cast v15, Lorg/litepal/annotation/Column;

    .line 581
    .local v15, "annotation":Lorg/litepal/annotation/Column;
    if-eqz v15, :cond_a

    invoke-interface {v15}, Lorg/litepal/annotation/Column;->ignore()Z

    move-result v2

    if-nez v2, :cond_7

    .line 584
    :cond_a
    new-instance v16, Lorg/litepal/tablemanager/model/GenericModel;

    invoke-direct/range {v16 .. v16}, Lorg/litepal/tablemanager/model/GenericModel;-><init>()V

    .line 585
    .local v16, "genericModel":Lorg/litepal/tablemanager/model/GenericModel;
    invoke-virtual/range {p2 .. p2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lorg/litepal/util/DBUtility;->getGenericTableName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lorg/litepal/tablemanager/model/GenericModel;->setTableName(Ljava/lang/String;)V

    .line 586
    invoke-virtual/range {p2 .. p2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/litepal/util/DBUtility;->convertToValidColumnName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lorg/litepal/tablemanager/model/GenericModel;->setValueColumnName(Ljava/lang/String;)V

    .line 587
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lorg/litepal/LitePalBase;->getColumnType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lorg/litepal/tablemanager/model/GenericModel;->setValueColumnType(Ljava/lang/String;)V

    .line 588
    invoke-static/range {p1 .. p1}, Lorg/litepal/util/DBUtility;->getGenericValueIdColumnName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lorg/litepal/tablemanager/model/GenericModel;->setValueIdColumnName(Ljava/lang/String;)V

    .line 589
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/litepal/LitePalBase;->mGenericModels:Ljava/util/Collection;

    move-object/from16 v0, v16

    invoke-interface {v2, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_4
.end method

.method private oneToAnyConditions(Ljava/lang/String;Ljava/lang/reflect/Field;I)V
    .locals 23
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "field"    # Ljava/lang/reflect/Field;
    .param p3, "action"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 434
    invoke-virtual/range {p2 .. p2}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v16

    .line 437
    .local v16, "fieldTypeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {}, Lorg/litepal/parser/LitePalAttr;->getInstance()Lorg/litepal/parser/LitePalAttr;

    move-result-object v3

    invoke-virtual {v3}, Lorg/litepal/parser/LitePalAttr;->getClassNames()Ljava/util/List;

    move-result-object v3

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 438
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v20

    .line 439
    .local v20, "reverseDynamicClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v22

    .line 442
    .local v22, "reverseFields":[Ljava/lang/reflect/Field;
    const/16 v19, 0x0

    .line 445
    .local v19, "reverseAssociations":Z
    const/16 v18, 0x0

    .local v18, "i":I
    :goto_0
    move-object/from16 v0, v22

    array-length v3, v0

    move/from16 v0, v18

    if-ge v0, v3, :cond_6

    .line 446
    aget-object v8, v22, v18

    .line 447
    .local v8, "reverseField":Ljava/lang/reflect/Field;
    invoke-virtual {v8}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v3

    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v3

    if-nez v3, :cond_1

    .line 448
    invoke-virtual {v8}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v21

    .line 452
    .local v21, "reverseFieldTypeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {v21 .. v21}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 453
    const/4 v3, 0x1

    move/from16 v0, p3

    if-ne v0, v3, :cond_2

    .line 454
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    .line 455
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    .line 454
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v3, v4, v5}, Lorg/litepal/LitePalBase;->addIntoAssociationModelCollection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 460
    :cond_0
    :goto_1
    const/16 v19, 0x1

    .line 445
    .end local v21    # "reverseFieldTypeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1
    :goto_2
    add-int/lit8 v18, v18, 0x1

    goto :goto_0

    .line 456
    .restart local v21    # "reverseFieldTypeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    const/4 v3, 0x2

    move/from16 v0, p3

    if-ne v0, v3, :cond_0

    .line 457
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    .line 458
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    const/4 v9, 0x1

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move-object/from16 v7, p2

    .line 457
    invoke-direct/range {v3 .. v9}, Lorg/litepal/LitePalBase;->addIntoAssociationInfoCollection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;I)V

    goto :goto_1

    .line 465
    :cond_3
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/litepal/LitePalBase;->isCollection(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 466
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lorg/litepal/LitePalBase;->getGenericTypeName(Ljava/lang/reflect/Field;)Ljava/lang/String;

    move-result-object v17

    .line 467
    .local v17, "genericTypeName":Ljava/lang/String;
    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 468
    const/4 v3, 0x1

    move/from16 v0, p3

    if-ne v0, v3, :cond_5

    .line 469
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v3, v2, v4}, Lorg/litepal/LitePalBase;->addIntoAssociationModelCollection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 475
    :cond_4
    :goto_3
    const/16 v19, 0x1

    goto :goto_2

    .line 471
    :cond_5
    const/4 v3, 0x2

    move/from16 v0, p3

    if-ne v0, v3, :cond_4

    .line 472
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    const/4 v9, 0x2

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    invoke-direct/range {v3 .. v9}, Lorg/litepal/LitePalBase;->addIntoAssociationInfoCollection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;I)V

    goto :goto_3

    .line 482
    .end local v8    # "reverseField":Ljava/lang/reflect/Field;
    .end local v17    # "genericTypeName":Ljava/lang/String;
    .end local v21    # "reverseFieldTypeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_6
    if-nez v19, :cond_7

    .line 483
    const/4 v3, 0x1

    move/from16 v0, p3

    if-ne v0, v3, :cond_8

    .line 484
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    .line 485
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    .line 484
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v3, v4, v5}, Lorg/litepal/LitePalBase;->addIntoAssociationModelCollection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 492
    .end local v18    # "i":I
    .end local v19    # "reverseAssociations":Z
    .end local v20    # "reverseDynamicClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v22    # "reverseFields":[Ljava/lang/reflect/Field;
    :cond_7
    :goto_4
    return-void

    .line 486
    .restart local v18    # "i":I
    .restart local v19    # "reverseAssociations":Z
    .restart local v20    # "reverseDynamicClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v22    # "reverseFields":[Ljava/lang/reflect/Field;
    :cond_8
    const/4 v3, 0x2

    move/from16 v0, p3

    if-ne v0, v3, :cond_7

    .line 487
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    .line 488
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    const/4 v14, 0x0

    const/4 v15, 0x1

    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move-object/from16 v13, p2

    .line 487
    invoke-direct/range {v9 .. v15}, Lorg/litepal/LitePalBase;->addIntoAssociationInfoCollection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;I)V

    goto :goto_4
.end method

.method private recursiveSupportedFields(Ljava/lang/Class;Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Field;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 323
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "supportedFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    const-class v6, Lorg/litepal/crud/DataSupport;

    if-eq p1, v6, :cond_0

    const-class v6, Ljava/lang/Object;

    if-ne p1, v6, :cond_1

    .line 344
    :cond_0
    :goto_0
    return-void

    .line 326
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v4

    .line 327
    .local v4, "fields":[Ljava/lang/reflect/Field;
    if-eqz v4, :cond_4

    array-length v6, v4

    if-lez v6, :cond_4

    .line 328
    array-length v7, v4

    const/4 v6, 0x0

    :goto_1
    if-ge v6, v7, :cond_4

    aget-object v1, v4, v6

    .line 329
    .local v1, "field":Ljava/lang/reflect/Field;
    const-class v8, Lorg/litepal/annotation/Column;

    invoke-virtual {v1, v8}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/litepal/annotation/Column;

    .line 330
    .local v0, "annotation":Lorg/litepal/annotation/Column;
    if-eqz v0, :cond_3

    invoke-interface {v0}, Lorg/litepal/annotation/Column;->ignore()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 328
    :cond_2
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 333
    :cond_3
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v5

    .line 334
    .local v5, "modifiers":I
    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v8

    if-nez v8, :cond_2

    .line 335
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v3

    .line 336
    .local v3, "fieldTypeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 337
    .local v2, "fieldType":Ljava/lang/String;
    invoke-static {v2}, Lorg/litepal/util/BaseUtility;->isFieldTypeSupported(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 338
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 343
    .end local v0    # "annotation":Lorg/litepal/annotation/Column;
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v2    # "fieldType":Ljava/lang/String;
    .end local v3    # "fieldTypeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v5    # "modifiers":I
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v6

    invoke-direct {p0, v6, p2}, Lorg/litepal/LitePalBase;->recursiveSupportedFields(Ljava/lang/Class;Ljava/util/List;)V

    goto :goto_0
.end method

.method private recursiveSupportedGenericFields(Ljava/lang/Class;Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Field;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 347
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "supportedGenericFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    const-class v5, Lorg/litepal/crud/DataSupport;

    if-eq p1, v5, :cond_0

    const-class v5, Ljava/lang/Object;

    if-ne p1, v5, :cond_1

    .line 367
    :cond_0
    :goto_0
    return-void

    .line 350
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 351
    .local v2, "fields":[Ljava/lang/reflect/Field;
    if-eqz v2, :cond_4

    array-length v5, v2

    if-lez v5, :cond_4

    .line 352
    array-length v6, v2

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v6, :cond_4

    aget-object v1, v2, v5

    .line 353
    .local v1, "field":Ljava/lang/reflect/Field;
    const-class v7, Lorg/litepal/annotation/Column;

    invoke-virtual {v1, v7}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/litepal/annotation/Column;

    .line 354
    .local v0, "annotation":Lorg/litepal/annotation/Column;
    if-eqz v0, :cond_3

    invoke-interface {v0}, Lorg/litepal/annotation/Column;->ignore()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 352
    :cond_2
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 357
    :cond_3
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v4

    .line 358
    .local v4, "modifiers":I
    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v7

    if-nez v7, :cond_2

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/litepal/LitePalBase;->isCollection(Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 359
    invoke-virtual {p0, v1}, Lorg/litepal/LitePalBase;->getGenericTypeName(Ljava/lang/reflect/Field;)Ljava/lang/String;

    move-result-object v3

    .line 360
    .local v3, "genericTypeName":Ljava/lang/String;
    invoke-static {v3}, Lorg/litepal/util/BaseUtility;->isGenericTypeSupported(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 361
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 366
    .end local v0    # "annotation":Lorg/litepal/annotation/Column;
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v3    # "genericTypeName":Ljava/lang/String;
    .end local v4    # "modifiers":I
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v5

    invoke-direct {p0, v5, p2}, Lorg/litepal/LitePalBase;->recursiveSupportedGenericFields(Ljava/lang/Class;Ljava/util/List;)V

    goto :goto_0
.end method


# virtual methods
.method protected getAssociationInfo(Ljava/lang/String;)Ljava/util/Collection;
    .locals 1
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Lorg/litepal/crud/model/AssociationsInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 170
    iget-object v0, p0, Lorg/litepal/LitePalBase;->mAssociationInfos:Ljava/util/Collection;

    if-nez v0, :cond_0

    .line 171
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/litepal/LitePalBase;->mAssociationInfos:Ljava/util/Collection;

    .line 173
    :cond_0
    iget-object v0, p0, Lorg/litepal/LitePalBase;->mAssociationInfos:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 174
    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Lorg/litepal/LitePalBase;->analyzeClassFields(Ljava/lang/String;I)V

    .line 175
    iget-object v0, p0, Lorg/litepal/LitePalBase;->mAssociationInfos:Ljava/util/Collection;

    return-object v0
.end method

.method protected getAssociations(Ljava/util/List;)Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Collection",
            "<",
            "Lorg/litepal/tablemanager/model/AssociationsModel;",
            ">;"
        }
    .end annotation

    .prologue
    .line 140
    .local p1, "classNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v1, p0, Lorg/litepal/LitePalBase;->mAssociationModels:Ljava/util/Collection;

    if-nez v1, :cond_0

    .line 141
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lorg/litepal/LitePalBase;->mAssociationModels:Ljava/util/Collection;

    .line 143
    :cond_0
    iget-object v1, p0, Lorg/litepal/LitePalBase;->mGenericModels:Ljava/util/Collection;

    if-nez v1, :cond_1

    .line 144
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lorg/litepal/LitePalBase;->mGenericModels:Ljava/util/Collection;

    .line 146
    :cond_1
    iget-object v1, p0, Lorg/litepal/LitePalBase;->mAssociationModels:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->clear()V

    .line 147
    iget-object v1, p0, Lorg/litepal/LitePalBase;->mGenericModels:Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->clear()V

    .line 148
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 149
    .local v0, "className":Ljava/lang/String;
    const/4 v2, 0x1

    invoke-direct {p0, v0, v2}, Lorg/litepal/LitePalBase;->analyzeClassFields(Ljava/lang/String;I)V

    goto :goto_0

    .line 151
    .end local v0    # "className":Ljava/lang/String;
    :cond_2
    iget-object v1, p0, Lorg/litepal/LitePalBase;->mAssociationModels:Ljava/util/Collection;

    return-object v1
.end method

.method protected getColumnType(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "fieldType"    # Ljava/lang/String;

    .prologue
    .line 294
    iget-object v3, p0, Lorg/litepal/LitePalBase;->typeChangeRules:[Lorg/litepal/tablemanager/typechange/OrmChange;

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v4, :cond_1

    aget-object v1, v3, v2

    .line 295
    .local v1, "ormChange":Lorg/litepal/tablemanager/typechange/OrmChange;
    invoke-virtual {v1, p1}, Lorg/litepal/tablemanager/typechange/OrmChange;->object2Relation(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 296
    .local v0, "columnType":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 300
    .end local v0    # "columnType":Ljava/lang/String;
    .end local v1    # "ormChange":Lorg/litepal/tablemanager/typechange/OrmChange;
    :goto_1
    return-object v0

    .line 294
    .restart local v0    # "columnType":Ljava/lang/String;
    .restart local v1    # "ormChange":Lorg/litepal/tablemanager/typechange/OrmChange;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 300
    .end local v0    # "columnType":Ljava/lang/String;
    .end local v1    # "ormChange":Lorg/litepal/tablemanager/typechange/OrmChange;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method protected getForeignKeyColumnName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "associatedTableName"    # Ljava/lang/String;

    .prologue
    .line 283
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_id"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/litepal/util/BaseUtility;->changeCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getGenericModels()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/litepal/tablemanager/model/GenericModel;",
            ">;"
        }
    .end annotation

    .prologue
    .line 159
    iget-object v0, p0, Lorg/litepal/LitePalBase;->mGenericModels:Ljava/util/Collection;

    return-object v0
.end method

.method protected getGenericTypeClass(Ljava/lang/reflect/Field;)Ljava/lang/Class;
    .locals 4
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Field;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 312
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 313
    .local v0, "genericType":Ljava/lang/reflect/Type;
    if-eqz v0, :cond_0

    .line 314
    instance-of v2, v0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v2, :cond_0

    move-object v1, v0

    .line 315
    check-cast v1, Ljava/lang/reflect/ParameterizedType;

    .line 316
    .local v1, "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v2

    const/4 v3, 0x0

    aget-object v2, v2, v3

    check-cast v2, Ljava/lang/Class;

    .line 319
    .end local v1    # "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method protected getGenericTypeName(Ljava/lang/reflect/Field;)Ljava/lang/String;
    .locals 2
    .param p1, "field"    # Ljava/lang/reflect/Field;

    .prologue
    .line 658
    invoke-virtual {p0, p1}, Lorg/litepal/LitePalBase;->getGenericTypeClass(Ljava/lang/reflect/Field;)Ljava/lang/Class;

    move-result-object v0

    .line 659
    .local v0, "genericTypeClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v0, :cond_0

    .line 660
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 662
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected getSupportedFields(Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Field;",
            ">;"
        }
    .end annotation

    .prologue
    .line 189
    iget-object v4, p0, Lorg/litepal/LitePalBase;->classFieldsMap:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 190
    .local v2, "fieldList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    if-nez v2, :cond_0

    .line 191
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 194
    .local v3, "supportedFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    :try_start_0
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 198
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, v0, v3}, Lorg/litepal/LitePalBase;->recursiveSupportedFields(Ljava/lang/Class;Ljava/util/List;)V

    .line 199
    iget-object v4, p0, Lorg/litepal/LitePalBase;->classFieldsMap:Ljava/util/Map;

    invoke-interface {v4, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "supportedFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    :goto_0
    return-object v3

    .line 195
    .restart local v3    # "supportedFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    :catch_0
    move-exception v1

    .line 196
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    new-instance v4, Lorg/litepal/exceptions/DatabaseGenerateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "can not find a class named "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/litepal/exceptions/DatabaseGenerateException;-><init>(Ljava/lang/String;)V

    throw v4

    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    .end local v3    # "supportedFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    :cond_0
    move-object v3, v2

    .line 202
    goto :goto_0
.end method

.method protected getSupportedGenericFields(Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Field;",
            ">;"
        }
    .end annotation

    .prologue
    .line 212
    iget-object v4, p0, Lorg/litepal/LitePalBase;->classGenericFieldsMap:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 213
    .local v2, "genericFieldList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    if-nez v2, :cond_0

    .line 214
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 217
    .local v3, "supportedGenericFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    :try_start_0
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 221
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, v0, v3}, Lorg/litepal/LitePalBase;->recursiveSupportedGenericFields(Ljava/lang/Class;Ljava/util/List;)V

    .line 222
    iget-object v4, p0, Lorg/litepal/LitePalBase;->classGenericFieldsMap:Ljava/util/Map;

    invoke-interface {v4, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "supportedGenericFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    :goto_0
    return-object v3

    .line 218
    .restart local v3    # "supportedGenericFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    :catch_0
    move-exception v1

    .line 219
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    new-instance v4, Lorg/litepal/exceptions/DatabaseGenerateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "can not find a class named "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/litepal/exceptions/DatabaseGenerateException;-><init>(Ljava/lang/String;)V

    throw v4

    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    .end local v3    # "supportedGenericFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    :cond_0
    move-object v3, v2

    .line 225
    goto :goto_0
.end method

.method protected getTableModel(Ljava/lang/String;)Lorg/litepal/tablemanager/model/TableModel;
    .locals 7
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 119
    invoke-static {p1}, Lorg/litepal/util/DBUtility;->getTableNameByClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 120
    .local v4, "tableName":Ljava/lang/String;
    new-instance v3, Lorg/litepal/tablemanager/model/TableModel;

    invoke-direct {v3}, Lorg/litepal/tablemanager/model/TableModel;-><init>()V

    .line 121
    .local v3, "tableModel":Lorg/litepal/tablemanager/model/TableModel;
    invoke-virtual {v3, v4}, Lorg/litepal/tablemanager/model/TableModel;->setTableName(Ljava/lang/String;)V

    .line 122
    invoke-virtual {v3, p1}, Lorg/litepal/tablemanager/model/TableModel;->setClassName(Ljava/lang/String;)V

    .line 123
    invoke-virtual {p0, p1}, Lorg/litepal/LitePalBase;->getSupportedFields(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 124
    .local v2, "supportedFields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Field;

    .line 125
    .local v1, "field":Ljava/lang/reflect/Field;
    invoke-direct {p0, v1}, Lorg/litepal/LitePalBase;->convertFieldToColumnModel(Ljava/lang/reflect/Field;)Lorg/litepal/tablemanager/model/ColumnModel;

    move-result-object v0

    .line 126
    .local v0, "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    invoke-virtual {v3, v0}, Lorg/litepal/tablemanager/model/TableModel;->addColumnModel(Lorg/litepal/tablemanager/model/ColumnModel;)V

    goto :goto_0

    .line 128
    .end local v0    # "columnModel":Lorg/litepal/tablemanager/model/ColumnModel;
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :cond_0
    return-object v3
.end method

.method protected isCollection(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 236
    .local p1, "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0, p1}, Lorg/litepal/LitePalBase;->isList(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lorg/litepal/LitePalBase;->isSet(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isIdColumn(Ljava/lang/String;)Z
    .locals 1
    .param p1, "columnName"    # Ljava/lang/String;

    .prologue
    .line 270
    const-string v0, "_id"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "id"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isList(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 247
    .local p1, "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Ljava/util/List;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method protected isSet(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 258
    .local p1, "fieldType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Ljava/util/Set;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method
