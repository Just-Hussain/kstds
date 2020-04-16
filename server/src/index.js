// whole code is wrapped in an IIFE to use async/await
(async () => {

	// express is what handles all the HTTP work
	const express = require('express')
	// access from remote hosts
	const cors = require('cors')
	// reads post body and parse it
	const bodyParser = require('body-parser')
	
	// mysql promise wrapper
	const mysql = require('promise-mysql')

	// for orginization, all routes are in a seperate file
	const routes = require('./routes')


	// init express
	let app = express()
	// use cors and bodyparser
	app.options('*', cors())
	app.use(bodyParser.json())


	// to establish mysql connection:
	/*
		let conn = await mysql.createConnection(config)
		config has:
		{
			host: '',
			user: '',
			password: '',
			databse: ''
		}
	*/

	// pass express instance
	// and mysql connection
	routes(app, conn)

	// start the server
	app.listen(8081)

	console.log('up and running');
})()
