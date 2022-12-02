package com.example.test.ctf03;

/* loaded from: classes.dex */
public class JNI {
    public static native int getResult(String str);

    static {
        System.loadLibrary("Native");
    }
}