import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mystore/viewModels/store_viewModel.dart';
import 'package:mystore/views/storedetails_view.dart';


class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  StoreVM iStoreVM = StoreVM();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yama's Store"),
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder(
        future: iStoreVM.getArticles(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.data == null){
            return const Center(
              child: Text('Loading...'),
            );
          }else{
            return Scrollbar(
              child: ListView.builder(
                itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                  return Card(
                    elevation: 3,
                    color: Colors.white70,
                    margin: const EdgeInsets.all(5),
                      child: ListTile(
                      //style: ,
                          leading: ConstrainedBox(
                              constraints: const BoxConstraints(
                              maxHeight: 130,
                              maxWidth: 130,
                              minHeight: 130,
                              minWidth: 130
                            ),
                            child: Image.network(snapshot.data[index].images_url, fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(snapshot.data[index].title, style: const TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text('Catégorie : ${snapshot.data[index].category_id.toString()}\nPrix : ${snapshot.data[index].price.toString()} €',style:
                            const TextStyle( fontWeight: FontWeight.bold),),
                          isThreeLine: true,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context){
                                  return Scaffold(

                                    appBar: AppBar(title: Text(snapshot.data[index].title),backgroundColor: Colors.blueGrey,),
                                    body: Column(
                                      children: <Widget>[
                                      Container(
                                        height: 300,
                                          width: double.infinity,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: NetworkImage(snapshot.data[index].images_url),
                                            fit: BoxFit.fill

                                          )
                                        ),

                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Expanded(
                                        child: Container(
                                          //alignment: Alignment.topLeft,
                                          padding: const EdgeInsets.all(15),
                                          child: Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Catégorie : ${snapshot.data[index].category_id.toString()}',
                                                style: const TextStyle(
                                                  fontSize: 15
                                                ),),
                                                Text(snapshot.data[index].title, style:
                                                  const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold
                                                  ),),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text('${snapshot.data[index].price.toString()} €', style:
                                                  const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20
                                                  ),),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(snapshot.data[index].creation_date.toString()
                                                    .replaceAll(RegExp('T'), ' à ')
                                                    .substring(0, snapshot.data[index]
                                                    .creation_date.toString().length -3)),
                                                Text((){
                                                  if(snapshot.data[index].is_urgent == "true"){
                                                    return "Urgent";
                                                  }else{
                                                    return "Non urgent";
                                                  }
                                                }(), style: const TextStyle(fontWeight: FontWeight.bold),),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                const Text('Description :', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                                Expanded(
                                                  flex: 1,
                                                  child: SingleChildScrollView(
                                                    child: Scrollbar(
                                                      child: Text(snapshot.data[index].description, style:
                                                      const TextStyle(
                                                          fontSize: 15
                                                      ),),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )

                                          /*Text(
                                            '${snapshot.data[index].category_id.toString()}\n'
                                                '${snapshot.data[index].title}\n'
                                                '${snapshot.data[index].price.toString()}\n'
                                                '${snapshot.data[index].creation_date.toString()}\n'
                                                '${snapshot.data[index].description}'
                                          ),*/
                                        ),
                                      )
                                    ],
                                      )
                                  );
                                }));
                          },


                    ),

                  );
                }),
            );
          }
        },
      ),
    );
  }


}
