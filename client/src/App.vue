<template>
	<div id="app">
		<AppHeader></AppHeader>

		<Home></Home>
	</div>
</template>

<script>
	import AppHeader from './components/AppHeader'
	// BaseCard needs to be wrapped in a flex container for best results
	import BaseCard from './components/BaseCard'
	import Home from './views/Home'

	export default {
		name: 'App',
		components: {
			AppHeader,
			BaseCard,
			Home
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
	.cards {
		padding: 15px;
		display: flex;
		flex-flow: row wrap;
		justify-content: space-evenly;
	}
</style>
