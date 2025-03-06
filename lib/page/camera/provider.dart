import 'package:camera/camera.dart';
import 'package:expiry_mate/bean/result.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
Future<List<CameraDescription>> cameraAvailable(Ref ref) async {
  return await availableCameras();
}

@riverpod
Future<DataResult<CameraController>> fetchCameraController(Ref ref) async {
  var available = await ref.watch(cameraAvailableProvider.future);
  var cameraController = CameraController(available[0], ResolutionPreset.max);
  try {
    await cameraController.initialize();
  } catch (e) {
    if (e is CameraException) {
      switch (e.code) {
        case 'CameraAccessDenied':
          return DataResult.error(msg: "CameraAccessDenied");
        default:
          return DataResult.error(msg: "UnknownError");
      }
    }
  }
  ref.onDispose(
    () {
      debugPrint("移除相机控制器");
      cameraController.dispose();
    },
  );
  return DataResult.success(cameraController);
}
