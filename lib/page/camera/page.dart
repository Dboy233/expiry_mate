import 'package:camera/camera.dart';
import 'package:expiry_mate/gen/l10n.dart';
import 'package:expiry_mate/page/camera/provider.dart';
import 'package:expiry_mate/widget/page_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CameraPage extends HookConsumerWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cameraAvailableProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Consumer(
            builder: (context, ref, child) {
              var watch = ref.watch(fetchCameraControllerProvider);
              PageState? state;
              if (watch.hasError) {
                state = PageState.error;
              } else if (watch.isLoading) {
                state = PageState.loading;
              } else if (watch.hasValue) {
                var requireValue = watch.requireValue;
                if (!requireValue.isSuccess) {
                  state = PageState.error;
                }
              }
              return PageStateWidget(
                state: state,
                buildChild: () =>
                    _CameraRegionWidget(watch.requireValue.requiredData),
              );
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: AppBar(
              backgroundColor: Colors.transparent,
              leading: BackButton(
                color: Colors.white54,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Consumer(
                builder: (context, ref, child) {
                  var watch = ref.watch(fetchCameraControllerProvider);
                  if (watch.hasValue && watch.requireValue.isSuccess) {
                    return FloatingActionButton.large(
                      onPressed: () async {
                        try {
                          var srcFile = await watch.requireValue.requiredData
                              .takePicture();
                          if (context.mounted) {
                            Navigator.pop(context, srcFile.path);
                          }
                        } catch (e) {
                          debugPrint("error:拍摄获取图片失败");
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                Language.current.errorFailedToTakeAPhoto,
                              ),
                              showCloseIcon: true,
                            ));
                          }
                        }
                      },
                      child: Icon(Icons.camera_alt),
                    );
                  }
                  return FloatingActionButton.large(
                    onPressed: null,
                    child: Icon(Icons.camera_alt),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<String> _takePicture(CameraController ctl, WidgetRef ref) async {
    var xFile = await ctl.takePicture();
    return xFile.path;
  }
}

class _CameraRegionWidget extends HookConsumerWidget {
  final CameraController cameraController;

  const _CameraRegionWidget(this.cameraController, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: FittedBox(
            fit: BoxFit.cover,
            alignment: Alignment.center,
            child: SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxWidth * (4 / 3),
              child: CameraPreview(cameraController),
            ),
          ),
        );
      },
    );
  }
}
