package com.example.platformchannel;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Button;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class AboutActivity extends FlutterActivity {
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_about);
        setTitle("앱정보 보기");

        Context context = AboutActivity.this;
        String version;
        try {
            PackageInfo i = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            version = i.versionName;
        } catch (NameNotFoundException e) {
            version = "Unknown";
        }

        String versionInfo = "버전 : " + version;

        TextView t = (TextView)findViewById(R.id.textVersion);
        t.setText(versionInfo);

        findViewById(R.id.yes_button).setOnClickListener(mClickListener);
        findViewById(R.id.no_button).setOnClickListener(mClickListener);
    }

    public void yesAction() {
        Intent intent = new Intent();
        intent.putExtra("message", "YES");

        if (getParent() == null) {
            setResult(Activity.RESULT_OK, intent);
        } else {
            getParent().setResult(Activity.RESULT_OK, intent);
        }
        finish();
    }

    public void noAction() {
        Intent intent = new Intent();
        intent.putExtra("message", "NO");

        if (getParent() == null) {
            setResult(Activity.RESULT_OK, intent);
        } else {
            getParent().setResult(Activity.RESULT_OK, intent);
        }
        finish();
    }

    Button.OnClickListener mClickListener = new View.OnClickListener() {
        public void onClick(View v) {
            switch (v.getId()) {
                case R.id.yes_button:
                    yesAction();
                    break;
                case R.id.no_button:
                    noAction();
                    break;
            }
        }

        ;
    };
}
