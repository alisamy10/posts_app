import 'package:posts_app/data/model/post_model.dart';
import 'package:posts_app/data/repo/post_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc_provider.dart';

class PostBloc implements BlocBase {

  PostRepository _postRepository ;
  BehaviorSubject <List<PostModel>> _postBehaviorSubject =BehaviorSubject<List<PostModel>>();



  PostBloc(this._postRepository) {
     getPosts();
  }
  getPosts()async{
    List<PostModel> postModel =await _postRepository.getPosts();

    _postBehaviorSubject.sink.add(postModel);
  }





  BehaviorSubject<List<PostModel>> get postSubject => _postBehaviorSubject;

  @override
  void dispose() {
      _postBehaviorSubject.close();
      print("disposed");
  }



}
