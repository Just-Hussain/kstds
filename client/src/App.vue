<template>
	<div id="app">
		<AppHeader></AppHeader>
	</div>
</template>

<script>
	import AppHeader from './components/AppHeader'
	// our main entry point 

	export default {
		name: 'App',
		components: {
			AppHeader
		}
	}

</script>

<style>
	body {
		background: #3a5169;
		color: #b4c7d0;
	}
	#app {
		font-family: Avenir, Helvetica, Arial, sans-serif;
		text-align: center;
		color: #2c3e50;
		margin: auto;
		max-width: 960px;
	}
</style>
