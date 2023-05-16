import 'package:mysql1/mysql1.dart';

// https://www.youtube.com/watch?v=ig6WRq73iEg
class Mysql {
  static String host = 'melodyapp-1.c3wibgkxzweu.us-east-2.rds.amazonaws.com',
                user = 'iteo24',
                password = 'password',
                db = 'melody-1';
  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db
    );
    return await MySqlConnection.connect(settings);
  }
}