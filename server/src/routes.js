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

	// testing
	app.get('/test', (req, res) => {
		res.send('up and running')
		console.log(`up and running from get /:
            ${req.query.id}  +  ${req.query.name}
        `)
	})

	app.get('/teams', (req, res) => {

		// selects from db:
		// goals scored, received, points, rank of each team
		// res.send array of objects

	})

	app.post('/teams', (req, res) => {
		
		// inserts into Goals table:
		// matchID, torID, playerID, time
		// data is in req.query
	})

	
	app.get('/matches', (req, res) => {
		
		// selects from Match table:
		// data, field, time, referee, teams of each match
		// res.send array of objects

	})

	app.post('/matches', (req, res) => {

		// inserts into Match table:
		// matchID, torID, date, time, teams, field, referee
		// data is in req.query
	})


	app.post('fields', (req, res) => {

		// inserts into Field table:
		// fieldID, name, status, desc
		// data is in req.query
	})


	app.get('players', (req, res) => {

		// selects from Goals and Player:
		// each player with more than 2 gaals
		// res.send array of objects
	})

	app.post('players', (req, res) => {
		
		// inserts into Cards table:
		// cardID, playerID, cardType, cardDesc
		// data is in req.query
	})

	app.get('player', (req, res) => {

		// selects a player from db:
		// given team and given match
		// data is in req.query
	})


	app.get('/referees', (req, res) => {

		// selects matches from db:
		// by a given referee
		// data is in req.query
	})


}