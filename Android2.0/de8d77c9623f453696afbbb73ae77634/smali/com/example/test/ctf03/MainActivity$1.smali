.class Lcom/example/test/ctf03/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/test/ctf03/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/test/ctf03/MainActivity;


# direct methods
.method constructor <init>(Lcom/example/test/ctf03/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/example/test/ctf03/MainActivity;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/example/test/ctf03/MainActivity$1;->this$0:Lcom/example/test/ctf03/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 24
    iget-object v2, p0, Lcom/example/test/ctf03/MainActivity$1;->this$0:Lcom/example/test/ctf03/MainActivity;

    iget-object v2, v2, Lcom/example/test/ctf03/MainActivity;->pwd:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 25
    .local v1, "str":Ljava/lang/String;
    invoke-static {v1}, Lcom/example/test/ctf03/JNI;->getResult(Ljava/lang/String;)I

    move-result v0

    .line 26
    .local v0, "result":I
    iget-object v2, p0, Lcom/example/test/ctf03/MainActivity$1;->this$0:Lcom/example/test/ctf03/MainActivity;

    invoke-virtual {v2, v0}, Lcom/example/test/ctf03/MainActivity;->Show(I)V

    .line 27
    return-void
.end method
