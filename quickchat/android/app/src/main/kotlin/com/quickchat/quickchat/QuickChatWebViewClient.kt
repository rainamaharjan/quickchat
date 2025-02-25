package com.quickchat.quickchat

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.webkit.ValueCallback
import android.webkit.WebChromeClient
import android.webkit.WebView
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class QuickChatWebViewClient : WebChromeClient() {
    private var fileCallback: ValueCallback<Array<Uri>>? = null
    private val FILE_CHOOSER_REQUEST_CODE = 1

    fun registerActivity(activity: FlutterActivity) {
        activity.registerForActivityResult(
            FlutterActivity.ActivityResultContracts.StartActivityForResult()
        ) { result ->
            if (result.resultCode == Activity.RESULT_OK) {
                val uri = result.data?.data
                fileCallback?.onReceiveValue(arrayOf(uri!!))
            } else {
                fileCallback?.onReceiveValue(null)
            }
            fileCallback = null
        }
    }

    override fun onShowFileChooser(
        webView: WebView,
        filePathCallback: ValueCallback<Array<Uri>>,
        fileChooserParams: FileChooserParams
    ): Boolean {
        fileCallback = filePathCallback
        val intent = fileChooserParams.createIntent()
        (webView.context as Activity).startActivityForResult(intent, FILE_CHOOSER_REQUEST_CODE)
        return true
    }
}
