import 'package:equatable/equatable.dart';

class Category extends Equatable{

  String? id;
  String? title;
  String? image;
  Category({this.id, this.title, this.image});
  @override
  List<Object?> get props => [id];
}