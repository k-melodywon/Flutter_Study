import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FlutterLocalNotification {
  FlutterLocalNotification._(); //생성자

  static FlutterLocalNotificationsPlugin
      flutterLocalNotificationsPlugin = //싱글톤 패턴으로 활용하기 위해 static사용
      FlutterLocalNotificationsPlugin();

  static init() async {
    //초기화
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('mipmap/ic_launcher');
    DarwinInitializationSettings iosInitializationSetting =
        const DarwinInitializationSettings(
      requestAlertPermission: false, //어플 들어 갈 때 알림 설정할건지
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    InitializationSettings initializationSettings = InitializationSettings(
      //안드로이드와 ios통합 과정
      android: androidInitializationSettings,
      iOS: iosInitializationSetting,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static requestNotificationPermission() {
    // 권한 요청
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true);
  }

  static Future<void> showNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel Id', 'channelName',
            channelDescription: 'channel description',
            importance: Importance.max,
            priority: Priority.max,
            showWhen: false); //showWhen 시간을 보여줄 것인가?

    const NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: DarwinNotificationDetails(badgeNumber: 1));
    await flutterLocalNotificationsPlugin.show(
        0, 'test title', 'test body', notificationDetails);
  }
}
