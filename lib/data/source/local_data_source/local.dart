import 'package:posts_app/data/model/post_model.dart';

import 'database_helper.dart';

class LocalDataSource {

  DatabaseHelper _databaseHelper;

  LocalDataSource(this._databaseHelper);


  Future<int> insertPost(Map<String, dynamic> row) async {
    return await _databaseHelper.insert(row);
  }

  Future<List<PostModel>> queryAllPosts() async {

    return await _databaseHelper.queryAllRows() ;
  }

  Future<int> queryRowCount() async {
   return await _databaseHelper.queryRowCount();
  }

  Future <void> deleteAll()async{
     await _databaseHelper.deleteAll();
  }


}