import 'package:mysql1/mysql1.dart';
// https://www.youtube.com/watch?v=ig6WRq73iEg

class Mysql {
  // Information to connect to the database
  static String host = 'melodyapp-1.c3wibgkxzweu.us-east-2.rds.amazonaws.com',
      user = 'iteo24',
      password = 'password',
      db = 'melody-1';
  static int port = 3306;

  // Connect to database
  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    return await MySqlConnection.connect(settings);
  }

  String getId(String email) {
    var id;
    getConnection().then((conn) {
      String sql = 'select id from `melody-1`.users';
      sql += ' where id = \'$email\'';
      conn.query(sql).then((results) {
        for (var row in results) {
          id = row[0];
        }
      });
    });
    return id;
  }

  String getEmail(void Function(void Function()) state, String email) {
    getConnection().then((conn) {
      String sql = 'select email from `melody-1`.users';
      sql += ' where email = \'$email\'';
      conn.query(sql).then((results) {
        state(() {
          for (var row in results) {
              email = row['email'];
          }
        });
      });
    });
    return email;
  }
  
  String getPassword(String email) {
    var password;
    getConnection().then((conn) {
      String sql = 'select password from `melody-1`.users';
      sql += ' where email = \'$email\'';
      conn.query(sql).then((results) {
        for (var row in results) {
          if (row[0] != null) {
          password = row[0];
          }
          else {
            password = '';
          }
        }
      });
      conn.close();
    });
    return password;
  }

  String getName(String email) {
    var name;
    getConnection().then((conn) {
      String sql = 'select name from `melody-1`.users';
      sql += ' where email = \'$email\'';
      conn.query(sql).then((results) {
        for (var row in results) {
          name = row[0];
        }
      });
    });
    return name;
  }

  String getPhone(String email) {
    var phone;
    getConnection().then((conn) {
      String sql = 'select phone from `melody-1`.users';
      sql += ' where email = \'$email\'';
      conn.query(sql).then((results) {
        for (var row in results) {
          phone = row[0];
        }
      });
    });
    return phone;
  }

  bool emailExists(String email) {
    var result;
    getConnection().then((conn) {
      String sql = 'select email from `melody-1`.users';
      sql += ' where email = \'$email\'';
      conn.query(sql).then((results) {
        for (var row in results) {
          result = row[0];
        }
      });
    });
    if (result == '' || result == null) {
      return false;
    } else {
      return true;
    }
  }

  bool passMatches(String email, String password) {
    var result = '';
    getConnection().then((conn) {
      String sql = 'select password from `melody-1`.users';
      sql += ' where email = \'$email\'';
      conn.query(sql).then((results) {
        for (var row in results) {
          result = row[0];
        }
      });
    });
    if (result == password) {
      return true;
    } else {
      return false;
    }
  }


  void addUser(String email, String password, String name, String phone) {
    getConnection().then((conn) {
      String sql =
          'insert into `melody-1`.`users` (`email`, `password`, `name`, `phone`)';
      sql += ' VALUES (\'$email\', \'$password\', \'$name\', \'$phone\')';
      conn.query(sql);
    });
  }
}
