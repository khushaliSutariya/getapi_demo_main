import 'package:json_annotation/json_annotation.dart';


part 'reactiondatamodel.g.dart';

@JsonSerializable()
class ReactionDataModel {
  String reactionEmoji;
  int reactionById;
  String reactionByName;
  String reactionByImage;

  ReactionDataModel({required this.reactionEmoji,
    required this.reactionById,
    required this.reactionByName,
    required this.reactionByImage});

  factory ReactionDataModel.fromJson(Map<String, dynamic> json) => _$ReactionDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReactionDataModelToJson(this);

}

// {
// "page": 2,
// "per_page": 6,
// "total": 12,
// "total_pages": 2,
// "data": [
// {
// "id": 7,
// "email": "michael.lawson@reqres.in",
// "first_name": "Michael",
// "last_name": "Lawson",
// "avatar": "https://reqres.in/img/faces/7-image.jpg"
// }
// ],
// "support": {
// "url": "https://reqres.in/#support-heading",
// "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
// }
// }