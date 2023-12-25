class SafetySetting {
  final String category;
  final String threshold;

  const SafetySetting({required this.category, required this.threshold});
}

class GenerationConfig {
  final List<String> stopSequences;
  final double temperature;
  final int maxOutputTokens;
  final double topP;
  final int topK;

  const GenerationConfig(
      {required this.stopSequences,
      required this.temperature,
      required this.maxOutputTokens,
      required this.topP,
      required this.topK});
}

class Settings {
  final String apiKey;
  final List<SafetySetting> safetySettings;
  final GenerationConfig generationConfig;

  const Settings(
      {required this.apiKey,
      required this.safetySettings,
      required this.generationConfig});
}
