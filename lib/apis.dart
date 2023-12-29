import "dart:convert";
import "package:http/http.dart";

class Part {
  final String text;

  const Part({required this.text});
}

class Content {
  final List<Part> parts;
  final String? role;

  const Content({required this.parts, this.role});
}

class GenerateContentRequest {
  final List<Content> contents;

  const GenerateContentRequest({required this.contents});
}

class SafetyRating {
  final String cateogry;
  final String probability;

  const SafetyRating({required this.cateogry, required this.probability});
}

class Candidate {
  final Content content;
  final String finishReason;
  final int index;
  final List<SafetyRating> safetyRatings;

  const Candidate(
      {required this.content,
      required this.finishReason,
      required this.index,
      required this.safetyRatings});
}

class PromptFeedback {
  final List<SafetyRating> safetyRatings;

  const PromptFeedback({required this.safetyRatings});
}

class GenerateContentResponse {
  final List<Candidate> candidates;
  final PromptFeedback promptFeedback;

  const GenerateContentResponse(
      {required this.candidates, required this.promptFeedback});
}

Future<String> generateContentSingleText(
    {required String apiKey, required String text}) async {
  final url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey");
  final resp = await post(url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(GenerateContentRequest(contents: [
        Content(parts: [Part(text: text)])
      ])));
  if (resp.statusCode != 200) {
    throw Exception("Failed to generate content: ${resp.body}");
  }
  GenerateContentResponse data = jsonDecode(resp.body);
  return data.candidates[0].content.parts[0].text;
}
