package com.example.kr_app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugins.urllauncher.UrlLauncherPlugin

class MainActivity: FlutterActivity() {
    UrlLauncherPlugin.registerWith(registrarFor("io.flutter.plugins.urllauncher.UrlLauncherPlugin"))
}
