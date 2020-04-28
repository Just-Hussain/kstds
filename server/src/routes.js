
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

	app.get('/teams', (req, res) => {

		// selects from db:
		// goals scored, received, points, rank of each team
		// res.send array of objects

		// !! dummy data for testing !!

		let dummy = [
			new Team(0, 'Team XXX', [], 0, 0, 0, 0),
			new Team(1, 'Team YYY', [], 0, 0, 0, 0),
			new Team(2, 'Team ZZZ', [], 0, 0, 0, 0)
		]

		console.log(`sedning teams array`)
		res.send(dummy)

	})

	app.post('/teams', (req, res) => {
		// i dont`t know why i named this endpoint <teams>
		// but i`m keeping it :\

		// inserts into Goals table:
		// matchID, torID, playerID, time
		// data is in req.query
		let q = req.query
		console.log(`new goal from: ${q.player}, in ${q.match}, at ${q.time}`);
		res.status(200).send()
		
	})

	
	app.get('/matches', (req, res) => {
		
		// selects from Match table:
		// data, field, time, referee, teams of each match
		// res.send array of objects

		// !! dumy data for testing !!
		let dummy = []
		for (let i = 0; i < 5; i++) {
			
			let players = [
				new Player(i, 'Player X', 0),
				new Player(i+1, 'Player Y', 0)
			]
			dummy.push(
				new Match(
				i, '01-01-2020', '16:30',
				new Team(i, 'Team X', players), 
				new Team(i+1, 'Team Y', players), 
				'Field X', 'Referee X'
			))
		}

		console.log(`sending matches array`)
		res.send(dummy)

	})

	app.post('/matches', (req, res) => {

		console.log(`q id: ${req.query.id}`);
		res.status(200).send()
		
		// inserts into Match table:
		// matchID, torID, date, time, teams, field, referee
		// data is in req.query
	})


	app.put('/fields', (req, res) => {

		// update the field of the given match
		// matchId, field ?
		// data is in req.query

		console.log(`q new field: ${req.query.field} with id: ${req.query.match}`);
		res.status(200).send()

	})


	app.get('/players', (req, res) => {
		// TODO
		// selects from Goals and Player:
		// each player with more than 2 gaals
		// res.send array of objects
	})

	app.post('/players', (req, res) => {
		
		// inserts into Cards table:
		// cardID, playerID, cardType, cardDesc
		// data is in req.query

		console.log(`card: ${req.query.card}, for: ${req.query.player}`);
		res.status(200).send()

	})

	app.get('/player', (req, res) => {

		// selects a player from db:
		// given team and given match
		// data is in req.query
	})


}



class Team {
  constructor(
    id, name, players=[], scored=0, recieved=0, points=0, rank=0
  ) {
    this.id = id
    this.name = name
    this.players = players
    this.scored = scored
    this.recieved = recieved
    this.points = points
    this.rank = rank
  }
}

class Match {
  constructor(
    id, date, time, team1, team2, field, referee, goals, score1=0, score2=0
  ) {
      this.id = id
      this.date = date
      this.time = time
      this.team1 = team1
      this.team2 = team2
      this.field = field
      this.referee = referee
      this.goals = goals
      this.score1 = score1
      this.score2 = score2
    }
}

// stripped version
class Player {
  constructor(
    id, name, goals
    ) {
      this.id = id
      this.name = name
      this.goals = goals
    }
}