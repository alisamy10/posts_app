import 'package:posts_app/data/model/post_model.dart';
import 'package:posts_app/data/source/local_data_source/local.dart';
import 'package:posts_app/data/source/remote_data_source/remote_data.dart';

import '../../internet_connection.dart';


class PostRepository {

  RemoteDataSource _remoteDataSource;
  LocalDataSource _localDataSource;
  InternetConnection _connection;

  PostRepository(this._remoteDataSource, this._localDataSource, this._connection);

  Future<List<PostModel>> getPosts() async {
    List<PostModel> postModel=[];
    await _connection.checkConnectivity().then((internetConnection) async{
      if(internetConnection){
        // you can change this logic depend on the business
        await _localDataSource.queryRowCount().then((rowCount) async{
          if(rowCount ==100){
            print("Offline");
            postModel= await _localDataSource.queryAllPosts();
          }
          else{
            print("online");
            postModel = await _remoteDataSource.getPosts();
            await _localDataSource.deleteAll();
            for (int i = 0; i < postModel.length; i++)
              await _localDataSource.insertPost(postModel[i].toJson());
          }

        });
      }
      else {
        await _localDataSource.queryRowCount().then((rowCount) async{
          if(rowCount >0){
            print("Offline ");
            postModel=await _localDataSource.queryAllPosts();
          }
          else{
            print("No Data Found");
          }


        });

      }
    });




    return postModel;
  }



}
