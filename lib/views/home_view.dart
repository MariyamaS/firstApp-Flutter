import 'package:flutter/material.dart';
import 'package:mystore/viewModels/store_viewModel.dart';
import 'package:mystore/views/store_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yama's"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Colors.grey])
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                width: 250,
                margin:  const EdgeInsets.only(top: 100),
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/home_image.png'),
                            fit: BoxFit.cover,
                            opacity: 0.5),
                        shape: BoxShape.circle
                      ),
                    ),
                    const Center(
                      child: Text("yAMa's", style: TextStyle(
                        color: Colors.white70,
                        fontSize: 50,
                        fontWeight: FontWeight.bold
                        ),
                      )
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text('Click here to access The Store', style: TextStyle(
                fontSize: 20,
                color: Colors.white70
              )),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>const StorePage()));
                  },
                  child: const Text('The Store', style: TextStyle(
                    fontSize: 20,
                    //color: Colors.black87,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  primary: Colors.blueGrey,
                  elevation: 10
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}
