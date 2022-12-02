.class public Lcom/example/test/ctf03/MainActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "MainActivity.java"


# instance fields
.field button:Landroid/widget/Button;

.field pwd:Landroid/widget/EditText;

.field textView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public Show(I)V
    .locals 2
    .param p1, "type"    # I

    .prologue
    .line 38
    packed-switch p1, :pswitch_data_0

    .line 48
    :goto_0
    return-void

    .line 40
    :pswitch_0
    iget-object v0, p0, Lcom/example/test/ctf03/MainActivity;->textView:Landroid/widget/TextView;

    const-string v1, "Wrong"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 43
    :pswitch_1
    iget-object v0, p0, Lcom/example/test/ctf03/MainActivity;->textView:Landroid/widget/TextView;

    const-string v1, "Great"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 38
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public init()V
    .locals 1

    .prologue
    .line 32
    const v0, 0x7f0b0056

    invoke-virtual {p0, v0}, Lcom/example/test/ctf03/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/example/test/ctf03/MainActivity;->pwd:Landroid/widget/EditText;

    .line 33
    const v0, 0x7f0b0057

    invoke-virtual {p0, v0}, Lcom/example/test/ctf03/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/example/test/ctf03/MainActivity;->button:Landroid/widget/Button;

    .line 34
    const v0, 0x7f0b0055

    invoke-virtual {p0, v0}, Lcom/example/test/ctf03/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/example/test/ctf03/MainActivity;->textView:Landroid/widget/TextView;

    .line 35
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 16
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 17
    const v0, 0x7f04001a

    invoke-virtual {p0, v0}, Lcom/example/test/ctf03/MainActivity;->setContentView(I)V

    .line 19
    invoke-virtual {p0}, Lcom/example/test/ctf03/MainActivity;->init()V

    .line 21
    iget-object v0, p0, Lcom/example/test/ctf03/MainActivity;->button:Landroid/widget/Button;

    new-instance v1, Lcom/example/test/ctf03/MainActivity$1;

    invoke-direct {v1, p0}, Lcom/example/test/ctf03/MainActivity$1;-><init>(Lcom/example/test/ctf03/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    return-void
.end method
