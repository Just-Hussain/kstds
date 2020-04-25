<template>
	<div id="app">
		<AppHeader></AppHeader>

		<router-view></router-view>
	</div>
</template>

<script>
	import AppHeader from './components/AppHeader'
	// BaseCard needs to be wrapped in a flex container for best results
	import BaseCard from './components/BaseCard'
	import Home from './views/Home'
	
	import {api} from './services/Api'

	export default {
		name: 'App',
		components: {
			AppHeader,
			BaseCard,
			Home
		},

		created: function() {
			console.log('up and ready')
			api.get('/test?id=123&name=huss')
			.then((res) => {
				console.log(`got: ${res.data}`)
				
			})
		}
	}

</script>

<style>
	body {
		background: #3a5169;
		color: #fff;
	}

	#app {
		font-family: Avenir, Helvetica, Arial, sans-serif;
		text-align: center;
		
		/* color: #2c3e50; */
		margin: auto;
		max-width: 960px;
	}
	/* .cards {
		padding: 15px;
		display: flex;
		flex-flow: row wrap;
		justify-content: space-evenly;
	} */
</style>
