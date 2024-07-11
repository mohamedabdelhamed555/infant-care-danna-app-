import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallScreen extends StatelessWidget {
  const CallScreen(
      {Key? key,
      required this.callID,
      required this.userID,
      required this.username})
      : super(key: key);
  final String callID;
  final String userID;
  final String username;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 1992067207,
      appSign:
          '91e4d6a008348d3e081e35308dedb108b29de4d49a20d8a4beb609687665884a',
      userID: userID,
      userName: username,
      callID: callID,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
