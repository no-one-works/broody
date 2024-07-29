import 'package:freezed_annotation/freezed_annotation.dart';

part 'emotions.freezed.dart';
part 'emotions.g.dart';

@freezed
class Emotions with _$Emotions {
    @Assert("sadHappy >= 0 && sadHappy <= 1")

    static const empty = Emotions();

    const factory Emotions({
        @Default(0.5) double sadHappy,
    }) = _Emotions;

    factory Emotions.fromJson(Map<String, dynamic> json) => _$EmotionsFromJson(json);
}