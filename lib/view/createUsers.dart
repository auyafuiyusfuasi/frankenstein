import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user.dart';

class CreateUsers extends StatefulWidget {
  const CreateUsers({super.key});

  @override
  State<CreateUsers> createState() => _CreateUsersState();
}

class _CreateUsersState extends State<CreateUsers> {
  int uid = 0;
  final TextEditingController username = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController description = TextEditingController();

  List<User> list = [];


  _openDB() async {
    // Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
    WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.
    final database = openDatabase(
      join(await getDatabasesPath(), 'users.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE user(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
    // print('OPENING DATABASE');
    // print(database);
    return database;
  }

  Future<void> insertUser(User user) async {
    final db = await _openDB();

    await db.insert(
      'user',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    //print(user);
  }

  Future<List<User>> users() async {
    final db = await _openDB();
    final List<Map<String, dynamic>> maps = await db.query('user');
    list = List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        username: maps[i]['username'],
        //email: maps[i]['email'],
        password: maps[i]['age'],
      );
    });

    return list;
  }

  getUsers() async {
    return '${await users()}';
  }

  // insert() async {
  //   var ruan = const User(
  //     id: 0,
  //     name: 'Ruan Gonzales',
  //     age: 35,
  //   );
  //   await insertUser(ruan);
  // }

  insertUserController(String username, int age) async {
    var user = User(
      id: uid++,
      username: username,
      //email: email, 
      password: age,
    );
    await insertUser(user);
    getUsers();
  }

  textController() {
    String tempName = username.text;
    //String tempEmail = email.text;
    int tempAge = int.tryParse(age.text) ?? 1;

    insertUserController(tempName, tempAge);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              const SizedBox(
                width: 100, 
                height: 100,
              ),

              Image.network(
                'https://cdn-icons-png.flaticon.com/512/3902/3902021.png',
                height: 75,
                alignment: Alignment.center
              ),

              const SizedBox(
                width: 15, 
                height: 15,
              ),


              /*
              TextField(
                controller: name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'name ',
                    labelStyle: TextStyle(color: Colors.purple, fontSize: 15)),
              ),
              */

              Container(
                width: 300.0,
                margin: const EdgeInsets.all(10.0),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.white
                  ),
                  controller: username,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    //label: Text('teste: '),
                    labelText: 'Username: ',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 18, 230, 245),
                      //rgba(6,185,254,255)
                      //fontSize: 25.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Color.fromARGB(255, 18, 230, 245),
                      ),
                    ),
                  ),
                ),
              ),

              /*
              TextField(
                controller: age,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                  labelStyle: TextStyle(
                    color: Colors.purple, 
                    fontSize: 15)
                  ),
                keyboardType: TextInputType.number
              ),
              */

              Container(
                width: 300.0,
                margin: const EdgeInsets.all(10.0),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.white
                  ),
                  controller: email,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    //label: Text('teste: '),
                    labelText: 'E-mail: ',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 18, 230, 245),
                      //fontSize: 25.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Color.fromARGB(255, 18, 230, 245),
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                width: 300.0,
                margin: const EdgeInsets.all(10.0),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.white
                  ),
                  controller: description,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    //label: Text('teste: '),
                    labelText: 'Description: ',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 18, 230, 245),
                      //fontSize: 25.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Color.fromARGB(255, 18, 230, 245),
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                width: 300.0,
                margin: const EdgeInsets.all(10.0),
                child: TextField(
                  obscureText: true,
                  style: const TextStyle(
                    color: Colors.white
                  ),
                  controller: age,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    //label: Text('teste: '),
                    labelText: 'Password: ',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 18, 230, 245),
                      //fontSize: 25.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Color.fromARGB(255, 18, 230, 245),
                      ),
                    ),
                  ),
                ),
              ),   

              SizedBox(
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Color.fromARGB(255, 113, 0, 189)),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                    ),
                  ),
                  //onPressed: _calculate,
                  onPressed: () => {textController(), setState(() {})},
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      //fontSize: 25.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          //onPressed: () => {textController(), setState(() {})},
          onPressed: () {
            Navigator.pushNamed(context, '/listusers');
          },
          tooltip: 'Increment',
          child: const Icon(Icons.play_arrow),
        ), 
      );
  }
}
