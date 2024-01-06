import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/apis.dart';

class History {
  final List<Content> contents;
  final int validCount;

  const History({required this.contents, required this.validCount});

  History copyWith({List<Content>? contents, int? validCount}) => History(
      contents: contents ?? this.contents,
      validCount: validCount ?? this.validCount);
}

class HistoryCubit extends Cubit<History> {
  HistoryCubit({required History history}) : super(history);

  void pushContent(Content content) =>
      emit(state.copyWith(contents: [...state.contents, content]));

  void setValidCount(int validCount) =>
      emit(state.copyWith(validCount: validCount));
}

class ContentCubit extends Cubit<Content> {
  ContentCubit({required Content content}) : super(content);

  void pushPart(Part part) =>
      emit(state.copyWith(parts: [...state.parts, part]));

  void removePart(int i) => emit(state.copyWith(
      parts: [...state.parts.sublist(0, i), ...state.parts.sublist(i + 1)]));

  void setParts(List<Part> parts) => emit(state.copyWith(parts: parts));
}
