// import 'mysql.dart';

// int _getId(void Function(void Function()) setState, Mysql db, int id) {
//   db.getConnection().then((conn) {
//     String sql = 'select id from `melody-1`.users';
//     conn.query(sql).then((results) {
//       setState(() {
//         for (var row in results) {
//           id = row[0];
//         }
//       });
//     });
//   });
//   return id;
// }

// String _getUsername(void Function(void Function()) setState, Mysql db, String username) {
//   db.getConnection().then((conn) {
//     String sql = 'select username from `melody-1`.users';
//     conn.query(sql).then((results) {
//       setState(() {
//         for (var row in results) {
//           username = row[0];
//         }
//       });
//     });
//   });
//   return username;
// }

// String _getPassword(void Function(void Function()) setState, Mysql db, String password, String username) {
//   db.getConnection().then((conn) {
//     String sql = 'select password from `melody-1`.users';
//           sql += 'where username = \'$username\'';
//     conn.query(sql).then((results) {
//       setState(() {
//         for (var row in results) {
//           password = row[0];
//         }
//       });
//     });
//   });
//   return password;
// }

// void _addUser(Mysql db, String username, String password) {
//   db.getConnection().then((conn) {
//     String sql = 'INSERT INTO `melody-1`.`users` (`username`, `password`) VALUES (\'$username\', \'$password\')';
//     conn.query(sql);
//   });
// }