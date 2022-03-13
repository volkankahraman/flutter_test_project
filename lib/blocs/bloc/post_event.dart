part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PostLoaded extends PostEvent {}

class PostAdded extends PostEvent {
  final String title;
  final String body;

  const PostAdded(this.title, this.body);
}

class PostDeleted extends PostEvent {
  final int id;
  const PostDeleted(this.id);
}
