package com.example.test.ctf03;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

/* loaded from: classes.dex */
public class MainActivity extends AppCompatActivity {
    Button button;
    EditText pwd;
    TextView textView;

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.app.AppCompatActivity, android.support.v4.app.FragmentActivity, android.support.v4.app.BaseFragmentActivityGingerbread, android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        init();
        this.button.setOnClickListener(new View.OnClickListener() { // from class: com.example.test.ctf03.MainActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                String str = MainActivity.this.pwd.getText().toString();
                int result = JNI.getResult(str);
                MainActivity.this.Show(result);
            }
        });
    }

    public void init() {
        this.pwd = (EditText) findViewById(R.id.pwd);
        this.button = (Button) findViewById(R.id.button);
        this.textView = (TextView) findViewById(R.id.result);
    }

    public void Show(int type) {
        switch (type) {
            case 0:
                this.textView.setText("Wrong");
                return;
            case 1:
                this.textView.setText("Great");
                return;
            default:
                return;
        }
    }
}