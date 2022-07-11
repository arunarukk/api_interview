import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:interview_task1/resource.dart';
import 'package:interview_task1/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiCall().getPost();
    return Scaffold(
      appBar: AppBar(
        title: const Text('API'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: FutureBuilder<List<Data>>(
              future: ApiCall().getPost(),
              builder: (context, data) {
                if (data.data == null) {
                  return const Text('No data');
                }
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final apiValue = data.data![index];
                      String title = apiValue.title!;
                      String description = apiValue.description!;
                      String imgpath = apiValue.imgpath!;

                      // print(data.data!.length);
                      return Card(
                        color: Colors.amber.shade50,
                        child: SizedBox(
                            height: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Title: $title'),
                                  Text('Description: $description'),
                                  Text('Image path: $imgpath'),
                                ],
                              ),
                            )),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 5,
                      );
                    },
                    itemCount: data.data!.length);
              })),
    );
  }
}
