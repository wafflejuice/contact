import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var app = MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            actions: [
              Icon(Icons.star),
              Icon(Icons.star),
            ],
            leading: Icon(Icons.star),
            title: Text('instagram'),
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image(image: AssetImage('assets/doge.png'), width: 120),
                    SizedBox(width: 6),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('캐논 DSLR 100D (단렌즈, 충전기 16기가SD 포함)',
                              style: TextStyle(fontSize: 16)),
                          Text('성동구 행당동·끌올 10분 전',
                              style: TextStyle(fontSize: 12)),
                          Text('210,000원',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Icon(Icons.favorite), Text('4')],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );

    return app;
  }
}
