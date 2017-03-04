var models = require('../models');

var headers = {
  'access-control-allow-origin': '*',
  'access-control-allow-methods': 'GET, POST, PUT, DELETE, OPTIONS',
  'access-control-allow-headers': 'content-type, accept',
  'access-control-max-age': 10 // Seconds.
};

module.exports = {
  messages: {
    get: function (req, res) {
      let requestDeets = req.detailsofthething;
      models.messages.get(reqDeets);
      res.writeHead();
      res.end();
      // get request data from req.whatever
      // call models with reqData
    }, // a function which handles a get request for all messages
    post: function (req, res) {
      console.log('* * * * * * POST REQUEST YO')
      let msgData;
      req.on('data', (chunk) => {
        msgData = `${chunk}`;
      });
      req.on('end', () => {
        models.messages.post(msgData);
        res.writeHead(201, headers);
        res.end();
      });
    } // a function which handles posting a message to the database
  },

  users: {
    // Ditto as above
    get: function (req, res) {},
    // ADDING FRIENDS
    post: function (req, res) {
      let userData;
      req.on('data', (chunk) => {
        userData = `${chunk}`;
      });
      req.on('end', () => {
        models.users.post(userData);
        res.writeHead(2001, headers);
        res.end();
      });
    }
  }
};


