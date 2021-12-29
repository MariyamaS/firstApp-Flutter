import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystore/viewModels/store_viewModel.dart';
import 'package:mystore/views/store_view.dart';


class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late final Articles art;
  StoreVM iStoreVM = StoreVM();
  StorePage storeP = const StorePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('welcome')
      ),
      body: FutureBuilder(
        future: iStoreVM.getArticles(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
              itemBuilder: (BuildContext context, int index){
                return Column(
                  children: const [
                    Text('Hi')
                  ],
                );
              });
        },

      )
    );
  }
}
