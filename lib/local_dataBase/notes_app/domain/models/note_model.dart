import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NotesModel extends Equatable {
  final int? id;
  final String title;
  final String description;
  final ColorEnum color;

  const NotesModel(
      { this.id,required this.title, required this.description, required this.color});

  factory NotesModel.fromDataBase(Map<String, dynamic> dataBase) {
    return NotesModel(
        id: dataBase['id'],
        title: dataBase['title'],
        description: dataBase['description'],
        color: dataBase['color'].toString().map());
  }

  @override
  List<Object?> get props => [title, description, color];
}

enum ColorEnum {
  white,
  black,
  red,
  blue,
  green,
}

extension ConvertFromStringtoEnum on String {
  ColorEnum map() {
    switch (this) {
      case "white":
        return ColorEnum.white;
      case "black":
        return ColorEnum.black;
      case "red":
        return ColorEnum.red;
      case "blue":
        return ColorEnum.blue;
      case "green":
        return ColorEnum.green;
      default:
        return ColorEnum.green;
    }
  }
}

extension SetColor on ColorEnum {
  Color get setColor {
    switch (this) {
      case ColorEnum.white:
        return Colors.black26;
      case ColorEnum.black:
        return Colors.black;

      case ColorEnum.red:
        return Colors.red;

      case ColorEnum.blue:
        return Colors.blue;

      case ColorEnum.green:
        return Colors.green;
    }
  }
}