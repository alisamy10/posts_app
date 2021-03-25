import 'package:posts_app/data/model/post_model.dart';
import 'package:posts_app/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:posts_app/bloc/post_bloc.dart';



class Home extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("posts app"),
      ),
      body: StreamBuilder(
        stream: getIt<PostBloc>().postSubject.stream,
        builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
          print(snapshot.connectionState);
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("waiting");
            return Center(child:CircularProgressIndicator());
          }

          else if (snapshot.connectionState == ConnectionState.active) {
            print("active");
            if (snapshot.hasData) {
              if(snapshot.data.length>0)
                 return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => _buildRowItem(snapshot.data[index]));
              else
                return _noDataFound();
            }

            else if (!snapshot.hasData) {
              return _noDataFound();
            }
          }
          else if (snapshot.connectionState == ConnectionState.none) {
            print("error");
            return _noDataFound();
          }

          else {
            print("error1");
            return _noDataFound();
          }
        },
      ),
    );
  }



  Widget _buildRowItem(PostModel data) {
    return Card(child:Container(padding: EdgeInsets.all(12),child: Text("${data.title} ")));
  }

    Widget _noDataFound() {
      return Container(
          child: Center(
            child: Text("No Data Found"),
          ));
    }
}




