<template>
	<div id="app">
		<AppHeader></AppHeader>

		<div class="cards">
			<BaseCard></BaseCard>
			<BaseCard>HOI</BaseCard>
			<BaseCard>HOI</BaseCard>
			<BaseCard>Lorem ipsum, dolor sit amet consectetur adipisicing elit. 
			Esse saepe eius animi. Accusamus quo voluptate nemo voluptates!</BaseCard>
			<BaseCard>HOI</BaseCard>
			<BaseCard>HOI</BaseCard>
			<BaseCard>HOI</BaseCard>
		</div>
	</div>
</template>

<script>
	import AppHeader from './components/AppHeader'
	// BaseCard needs to be wrapped in a flex container for best results
	import BaseCard from './components/BaseCard'

	export default {
		name: 'App',
		components: {
			AppHeader,
			BaseCard
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
		
		color: #2c3e50;
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
