var models = require('../models');

var headers = {
  'access-control-allow-origin': '*',
  'access-control-allow-methods': 'GET, POST, PUT, DELETE, OPTIONS',
  'access-control-allow-headers': 'content-type, accept',
  'access-control-max-age': 10 // Seconds.
};


// no returns in node because of asynchronous behavior of functions
module.exports = {
  messages: {
    get: function (req, res) {

      models.messages.get((err, results) => {
        if (err) {
          console.log('there was an error: ', err);
        }
        res.json(results);
      });
      // models.messages.get((err, results) => {
      //   res.writeHead();
      //   res.end(results);
      // });
    }, // a function which handles a get request for all messages
    post: function (req, res) {

      var params = [req.body.message, req.body.username, req.body.roomname];


      console.log('this is a post params', params);

      models.messages.post(params, (err, results) => {
        if (err) {
          throw err;
        }
        res.sendStatus(201);
      })

      // req.on('data', (chunk) => {
      //   // msgData = `${chunk}`;
      // });

      // req.on('end', () => {
      //   models.messages.post(params);
      //   res.writeHead(201, headers);
      //   res.end();
      // });

    } // a function which handles posting a message to the database
  },

  users: {
    // Ditto as above
    get: function (req, res) {
      models.users.get(function(err, results) {
        res.json(results);
      });
    },
    post: function (req, res) {
      var params = [req.body.username];
      models.users.post(params, (err, results) => {
        if (err) {
          console.log('there was an error: ', err);
        }
        res.sendStatus(201);
      });
    }
  }
};


