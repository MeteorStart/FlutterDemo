package com.meteor.flutterapp;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "battery";

    //申明方法名
    private static final String BLUETOOTH_CHANNEL = "bluetooth";

    private BluetoothManager bluetoothManager = null;     //初始化
    private BluetoothAdapter bluetoothAdapter = null;    //蓝牙适配器

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                (call, result) -> {
                    if (call.method.equals("getBatteryLevel")) {
                        int batteryLevel = getBatteryLevel();

                        if (batteryLevel != -1) {
                            result.success(batteryLevel);
                        } else {
                            result.error("UNAVAILABLE", "Battery level not available.", null);
                        }

                    } else {
                        result.notImplemented();
                    }
                });

        new MethodChannel(getFlutterView(), BLUETOOTH_CHANNEL).setMethodCallHandler(
                (methodCall, result) -> {
                    if (methodCall.method.equals("openBuleTooth")) {    //判断flutter调用那个方法
                        if (supportBuleTooth()) {                        //检测真机是否支持蓝牙
                            openBuleTooth();                            //打开蓝牙
                            result.success("蓝牙已经被开启");
                        } else {
                            result.error("设备不支持蓝牙", null, null);
                        }
                    } else if (methodCall.method.equals("getBuleTooth")) {
                        if (supportBuleTooth()) {
                            if (disabled()) {                                //检测蓝牙的状态
                                result.success("蓝牙已经开启");
                            } else {
                                result.success("蓝牙未开启");
                            }
                        }
                    }
                }
        );

    }

    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }
        return batteryLevel;
    }

    //是否支持蓝牙
    private boolean supportBuleTooth() {

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR2) {
            bluetoothManager = (BluetoothManager) getSystemService(Context.BLUETOOTH_SERVICE);
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR2) {
            bluetoothAdapter = bluetoothManager.getAdapter();
        }
        if (bluetoothAdapter == null) {    //不支持蓝牙
            return false;
        }
        return true;
    }

    //打开蓝牙
    private void openBuleTooth() {
        //判断蓝牙是否开启
        Intent enabler = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
        startActivityForResult(enabler, 1);
    }

    //判断蓝牙是否已经开启
    private boolean disabled() {
        if (bluetoothAdapter.isEnabled()) {
            return true;
        }
        return false;
    }

}
