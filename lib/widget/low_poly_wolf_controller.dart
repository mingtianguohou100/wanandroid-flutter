import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:nima/nima_actor.dart';

///狼的控制器
class LowPolyWolfController implements FlareControls {
  @override
  ValueNotifier<bool> isActive;

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    // TODO: implement advance
    return null;
  }

  @override
  void initialize(FlutterActorArtboard artboard) {
    // TODO: implement initialize
  }

  @override
  void onCompleted(String name) {
    // TODO: implement onCompleted
  }

  @override
  void play(String name, {double mix = 1.0, double mixSeconds = 0.2}) {
    // TODO: implement play
  }

  @override
  void setViewTransform(Mat2D viewTransform) {
    // TODO: implement setViewTransform
  }
}
