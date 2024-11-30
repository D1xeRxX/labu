package com.example.lab_14

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import java.text.SimpleDateFormat
import java.util.*

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example/native_demo_app"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(flutterEngine?.dartExecutor, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getStaticString") {
                val currentDate = SimpleDateFormat("dd.MM.yyyy", Locale.getDefault()).format(Date())
                result.success(currentDate)  // Повертаємо поточну дату
            } else {
                result.notImplemented()
            }
        }
    }
}
