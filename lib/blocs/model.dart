import 'package:flutter_bloc/flutter_bloc.dart';

class ModelCubit extends Cubit<String> {
  ModelCubit() : super("gemini-pro");

  void switchToGeminiPro() => emit("gemini-pro");

  void switchToGeminiProVision() => emit("gemini-pro-vision");
}
