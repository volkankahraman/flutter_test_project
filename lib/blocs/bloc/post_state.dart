part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostLoadingState extends PostState {}

class PostErrorState extends PostState {
  final String error;
  const PostErrorState(this.error);
}

class PostLoadedState extends PostState {
  final List<Post> posts;
  const PostLoadedState(this.posts);

  @override
  List<Object> get props => [posts];
}

class PostAddedState extends PostState {
  final Post post;

  const PostAddedState(this.post);

  @override
  List<Object> get props => [post];
}

class PostDeletedState extends PostState {
  final int id;

  const PostDeletedState(this.id);

  @override
  List<Object> get props => [id];
}
