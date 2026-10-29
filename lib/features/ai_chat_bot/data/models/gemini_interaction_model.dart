/// One piece of content inside a step, e.g. {"type": "text", "text": "..."}.
class GeminiContentModel {
  GeminiContentModel({this.type, this.text});

  final String? type;
  final String? text;

  factory GeminiContentModel.fromJson(Map<String, dynamic> json) {
    return GeminiContentModel(
      type: json['type'] as String?,
      text: json['text'] as String?,
    );
  }
}

/// One step of the interaction: "thought", "model_output", ...
class GeminiStepModel {
  GeminiStepModel({this.type, this.content = const []});

  final String? type;
  final List<GeminiContentModel> content;

  factory GeminiStepModel.fromJson(Map<String, dynamic> json) {
    final rawContent = json['content'];
    return GeminiStepModel(
      type: json['type'] as String?,
      content: rawContent is List
          ? rawContent
              .whereType<Map<String, dynamic>>()
              .map(GeminiContentModel.fromJson)
              .toList()
          : const [],
    );
  }
}

/// Response of POST /v1beta/interactions. Only parsing logic lives here.
class GeminiInteractionModel {
  GeminiInteractionModel({this.id, this.status, this.model, this.steps = const []});

  final String? id;
  final String? status;
  final String? model;
  final List<GeminiStepModel> steps;

  /// Throws [FormatException] if the body is not a JSON object.
  factory GeminiInteractionModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      throw const FormatException('Unexpected response format');
    }
    final rawSteps = json['steps'];
    return GeminiInteractionModel(
      id: json['id'] as String?,
      status: json['status'] as String?,
      model: json['model'] as String?,
      steps: rawSteps is List
          ? rawSteps
              .whereType<Map<String, dynamic>>()
              .map(GeminiStepModel.fromJson)
              .toList()
          : const [],
    );
  }

  bool get isCompleted => status == 'completed';

  /// Text of the assistant answer only: joins every `text` item of every
  /// `model_output` step in order. `thought` steps are ignored.
  /// Returns an empty string if there is none.
  String get assistantText {
    final buffer = StringBuffer();
    for (final step in steps) {
      if (step.type != 'model_output') continue;
      for (final item in step.content) {
        if (item.type == 'text' && item.text != null) {
          buffer.write(item.text);
        }
      }
    }
    return buffer.toString().trim();
  }
}
