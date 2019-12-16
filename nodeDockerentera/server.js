var express = require('express');
var app = express();
var request = require("request");
var fs = require("fs");
// Load the AWS SDK
//const aws = require('aws-sdk');
//const s3 = new aws.S3();

//var s3URL = 'http://demoentera.s3-eu-west-1.amazonaws.com/DemoEntera.json';
// app.get('/test', function (req, res) {
// //    fs.readFile( __dirname + "/" + "users.json", 'utf8', function (err, data) {
// //       console.log( data );
// //       res.end( data );
// //    });
//    res.end( "test successful" );
// })

//redis client
var redis = require('redis');
var redisClient = redis.createClient({host : 'redisKV', port : 6379});

redisClient.on('ready',function() {
 console.log("Redis is ready");
});

redisClient.on('error',function() {
 console.log("Error in Redis");
});
//end redis client

app.get('/', (req, res) => {
    return res.send('Received an empty GET');
  });
app.get('/test', (req, res) => {
    return res.send('test success');
  });
app.get('/getKey', (req, res) => {
    var key = req.query.key;
    redisClient.get(key,function(err,reply) {
        if(!err){
            return res.send(reply);
            //return res.status(200);
        }
        return res.send("get failed");
        //return res.status(400);
    });
  });
app.get('/putKey', (req, res) => {
    var key = req.query.key;
    var val = req.query.value;

        redisClient.set(key,val,function(err,reply) {
            if(!err){
                return res.send("put complete : "+ key + " : " + val + "reply : " + reply);
                //return res.status(200);
            }
            return res.send("put failed");
            //return res.status(400);
        });
    });
app.get('/deleteKey', (req, res) => {
    var key = req.query.key;
    redisClient.del(key,function(err,reply) {
        if(!err) {
         if(reply === 1) {
            return res.send("delete succeeded : " + reply);
         } else {
            return res.send("key not found : " + reply);
         }
        }else{
            return res.send("delete failed : "+reply);
        }
       });
  });
var server = app.listen(2727, function () {
   var host = server.address().address
   var port = server.address().port
   console.log("Example app listening at http://%s:%s", host, port)
})