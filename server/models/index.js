var db = require('../db');

module.exports = {
  messages: {
    get: function (callback) {
      // fetch all messages
      // id, text, roomname, username

      var queryStr = 'select messages.id, messages.text, users.username, rooms.roomname from messages\
                      left outer join users on (messages.userid = users.id)\
                      inner join rooms on (messages.roomid = rooms.id)\
                      order by messages.id desc\
                      ';
      db.query(queryStr, (err, results) => {
        callback(results);
      });

      // const sqlMessage = 'SELECT messages from';
      // const callback = function(error, results) {
      //   if (error) {
      //     console.log('your request sucks');
      //     throw error;
      //   }
      // };

      // db.connection.query(sqlMessage, callback);
      // db.connection.end();

    }, // a function which produces all the messages
    post: function (params, callback) {
      // create a message

      // post requests need a params object so we can use properties to post to db

      // sql allows us to insert variables into the sql query string using ?
      var queryStr = 'insert into messages(text, userid, roomid)\
                      values (?, (select id from users where username = ? limit 1), \
                      (select id from rooms where roomname = ? limit 1))';

      db.query(queryStr, params, (err, results) => {
        callback(results);
      });

      // let username = msgData.username;
      // let message = msgData.text;
      // let roomname = msgData.roomname;

      // let queryStr = `INSERT INTO messages (Message, UserID, RoomID)
      // VALUES (${message}, select users.id from users where users.username = ${username},
      // select room.id from rooms where room.name = ${roomname});`;

    } 
  },

  users: {
    get: function (callback) {
      // fetch all users
      var queryStr = 'select * from users';
      db.query(queryStr, function(err, results) {
        // typical cb accepts err and results object
        // in order to communicate results back with async operations need to callback(results)
        callback(results);
      });
    },

    post: function (params, callback) {
      // create a user
      var username = username;
      var queryStr = 'insert into users(username) values (?)';
      // let queryStr = `INSERT INTO users (username) VALUES (${username})`;
      db.query(queryStr, params, (err, results) => {
        if (err) {
          throw err;
        }
        callback(results);
      });
      // db.end();
    }
  }
};