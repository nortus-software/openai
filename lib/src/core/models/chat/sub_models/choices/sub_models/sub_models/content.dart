// ignore_for_file: public_member_api_docs, sort_constructors_first
/// {@template openai_chat_completion_choice_message_content_item_model}
/// This represents the content item of the [OpenAIChatCompletionChoiceMessageModel] model of the OpenAI API, which is used in the [OpenAIChat] methods.
/// {@endtemplate}
class OpenAIChatCompletionChoiceMessageContentItemModel {
  /// The type of the content item.
  final String type;

  /// The text content of the item.
  final String? text;

  /// The image url object.
  final Map<String, dynamic>? imageUrl;

  final ImageItemModel? image;

  @override
  int get hashCode => type.hashCode ^ text.hashCode ^ imageUrl.hashCode;

  /// {@macro openai_chat_completion_choice_message_content_item_model}
  OpenAIChatCompletionChoiceMessageContentItemModel._({
    required this.type,
    this.text,
    this.imageUrl,
    this.image,
  });

  /// This is used to convert a [Map<String, dynamic>] object to a [OpenAIChatCompletionChoiceMessageContentItemModel] object.
  factory OpenAIChatCompletionChoiceMessageContentItemModel.fromMap(
    Map<String, dynamic> asMap,
  ) {
    return OpenAIChatCompletionChoiceMessageContentItemModel._(
      type: asMap['type'],
      text: asMap['text'],
      imageUrl: asMap['image_url'],
      image: asMap['imageBase64'],
    );
  }

  /// Represents a text content item factory, which is used to create a text [OpenAIChatCompletionChoiceMessageContentItemModel].
  factory OpenAIChatCompletionChoiceMessageContentItemModel.text(String text) {
    return OpenAIChatCompletionChoiceMessageContentItemModel._(
      type: 'text',
      text: text,
    );
  }

  /// Represents a image content item factory, which is used to create a image [OpenAIChatCompletionChoiceMessageContentItemModel].
  factory OpenAIChatCompletionChoiceMessageContentItemModel.imageUrl(
    String imageUrl,
  ) {
    return OpenAIChatCompletionChoiceMessageContentItemModel._(
      type: 'image_url',
      imageUrl: {'url': imageUrl},
    );
  }

  factory OpenAIChatCompletionChoiceMessageContentItemModel.image(
    ImageItemModel image,
  ) {
    return OpenAIChatCompletionChoiceMessageContentItemModel._(
      type: 'image_url',
      image: image,
    );
  }

  /// This method used to convert the [OpenAIChatCompletionChoiceMessageContentItemModel] to a [Map<String, dynamic>] object.
  Map<String, dynamic> toMap() {
    return {
      "type": type,
      if (text != null) "text": text,
      if (imageUrl != null) "image_url": imageUrl,
      if (image != null) "image_url": image!.toMap(),
    };
  }

  @override
  bool operator ==(
    covariant OpenAIChatCompletionChoiceMessageContentItemModel other,
  ) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.text == text &&
        other.imageUrl == imageUrl &&
        other.image == image;
  }

  @override
  String toString() => switch (type) {
        'text' =>
          'OpenAIChatCompletionChoiceMessageContentItemModel(type: $type, text: $text)',
        'imageUrl' =>
          'OpenAIChatCompletionChoiceMessageContentItemModel(type: $type, imageUrl: $imageUrl, image: $image)',
        _ => 'OpenAIChatCompletionChoiceMessageContentItemModel(type: $type)',
      };
}

class ImageItemModel {
  ImageItemModel({required this.url, required this.detail});

  /// The url of the base64Encoded image.
  final String url;

  /// The quality of the image to be percieved by the model.
  final ImageDetail detail;

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'detail': detail.name,
    };
  }
}

enum ImageDetail {
  high,
  low,
}

extension ImageDetailExtension on ImageDetail {
  String get name {
    switch (this) {
      case ImageDetail.high:
        return 'high';
      case ImageDetail.low:
        return 'low';
    }
  }
}
