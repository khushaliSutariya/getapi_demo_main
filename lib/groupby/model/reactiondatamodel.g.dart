// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reactiondatamodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReactionDataModel _$ReactionDataModelFromJson(Map<String, dynamic> json) =>
    ReactionDataModel(
      reactionEmoji: json['reactionEmoji'] as String,
      reactionById: json['reactionById'] as int,
      reactionByName: json['reactionByName'] as String,
      reactionByImage: json['reactionByImage'] as String,
    );

Map<String, dynamic> _$ReactionDataModelToJson(ReactionDataModel instance) =>
    <String, dynamic>{
      'reactionEmoji': instance.reactionEmoji,
      'reactionById': instance.reactionById,
      'reactionByName': instance.reactionByName,
      'reactionByImage': instance.reactionByImage,
    };
