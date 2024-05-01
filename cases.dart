import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Cases extends StatefulWidget {
  const Cases({super.key});

  @override
  State<Cases> createState() => _CasesState();
}

class _CasesState extends State<Cases> {
  getPostApi() async {
    var url = Uri.parse("https://disease.sh/v3/covid-19/countries");
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "COVID 19",
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: FutureBuilder(
          future: getPostApi(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text(
                        snapshot.data[index]['country'],
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Row(
                        children: [
                          Text("TOTAL CASES"),
                          SizedBox(
                            width: 10,
                          ),
                          Text(snapshot.data[index]['cases'].toString()),
                        ],
                      ),
                      trailing: Column(
                        children: [
                          Text(
                            "TOTAL DEATHS",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            snapshot.data[index]['deaths'].toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  }));
            } else {
              return Center(
                child: CircularProgressIndicator()
              );
            }
            ;
          }),
    );
  }
}
