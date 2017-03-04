var db = require('../db');

module.exports = {
  messages: {
    get: function (reqData) {
      const sqlMessage = 'SELECT messages from';

      const callback = function(error, results) {
        if (error) {
          console.log('your request sucks');
          throw error;
        }
        // do the things with results;
      };

      db.connection.query(sqlMessage, callback);
      db.connection.end();
    }, // a function which produces all the messages
    post: function (msgData) {
      console.log("* * * * * * * POST REQUEST IN MODELS")
      let username = msgData.username;
      let message = msgData.text;
      let roomname = msgData.roomname;

      let queryStr = `INSERT INTO messages (Message, UserID, RoomID) VALUES (${message}, select users.id from users where users.username = ${username}, select room.id from rooms where room.name = ${roomname});`;

      db.connection.query(queryStr, (err) => {
        if (err) {
          throw err;
        }
      });
      db.connection.end();
    } 
  },

  users: {
    get: function () {},

    post: function (username) {
      let username = username;
      let queryStr = `INSERT INTO users (username) VALUES (${username});`;
      db.connection.query(queryStr, (err) => {
        if (err) {
          throw err;
        }
      });
      db.connection.end();
    }
  }
};


