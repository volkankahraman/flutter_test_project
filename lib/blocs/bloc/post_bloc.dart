import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_project/models/post.dart';
import 'package:flutter_test_project/services/http_service.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final HttpService _httpService;
  final List<Post> posts = [];
  int page = 0;

  PostBloc(this._httpService) : super(PostLoadingState()) {
    on<PostLoaded>((event, emit) async {
      try {
        page++;
        final _posts = await _httpService.getPosts(page: page);
        posts.addAll(_posts);
        if (_posts.isEmpty) {
          page--;
        } else {
          emit(PostLoadingState());
        }
        emit(PostLoadedState(posts));
      } catch (e) {
        emit(PostErrorState(e.toString()));
      }
    });
    on<PostAdded>((event, emit) async {
      final _post = Post(
        id: 0,
        image: "https://picsum.photos/250?image=",
        title: event.title,
        body: event.body,
        firstName: "Jane",
        lastName: "Doe",
        created: "short time ago",
      );
      try {
        final createdPost = await _httpService.createPost(_post);
        posts.insert(0, createdPost);
        emit(PostAddedState(createdPost));
        emit(PostLoadedState(posts));
      } catch (e) {
        emit(PostErrorState(e.toString()));
      }
    });
    on<PostDeleted>((event, emit) async {
      try {
        await _httpService.deletePost(event.id);
        posts.removeWhere((post) => post.id == event.id);
        emit(PostDeletedState(event.id));
        emit(PostLoadedState(posts));
      } catch (e) {
        emit(PostErrorState(e.toString()));
      }
    });
  }
}
