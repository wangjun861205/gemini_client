import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/apis.dart';

class ContentsCubit extends Cubit<List<Content>> {
  ContentsCubit({required List<Content> contents}) : super(contents);

  // void pushPart(Part part) {
  //   if (state.isEmpty) {
  //     emit([
  //       Content(parts: [part], role: "user")
  //     ]);
  //     return;
  //   }
  //   emit([
  //     ...state.sublist(0, state.length - 1),
  //     state.last.copyWith(parts: [...state.last.parts, part])
  //   ]);
  // }

  // void removePart(int i) => emit([
  //       ...state.sublist(0, state.length - 1),
  //       state.last.copyWith(parts: [
  //         ...state.last.parts.sublist(0, i),
  //         ...state.last.parts.sublist(i + 1)
  //       ])
  //     ]);

  // void setParts(List<Part> parts) => emit([
  //       ...state.sublist(0, state.length - 1),
  //       state.last.copyWith(parts: parts)
  //     ]);

  void pushContent(Content content) => emit([...state, content]);
}

class ContentCubit extends Cubit<Content> {
  ContentCubit({required Content content}) : super(content);

  void pushPart(Part part) =>
      emit(state.copyWith(parts: [...state.parts, part]));

  void removePart(int i) => emit(state.copyWith(
      parts: [...state.parts.sublist(0, i), ...state.parts.sublist(i + 1)]));

  void setParts(List<Part> parts) => emit(state.copyWith(parts: parts));
}
