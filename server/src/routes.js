// to handle routes, first specify GET or POST
// params:
//  the route
//  callback has REQuest and RESponse
//  -> req holds the data in req.body
//  -> to send to the port use res.send
// set headers using 
//      res.set()
// send status code using
//      res.status(code).send(str)
module.exports = (app, conn) => {
    app.get('/', (req, res) => {
        res.send('up and running')
        console.log('up and running from get /');
    })
}