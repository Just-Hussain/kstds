<template>
  <main>
    <div class="cards">
      <BaseCard>
        <div class="match">
          
          <div class="match-header">
            <h2>
              <span class="team one"> {{match.team1}} </span>
              <span class="score"> 
                {{match.score1}} - {{match.score2}} 
              </span>
              <span class="team two"> {{match.team2}} </span>
            </h2>
          </div>

          <div class="inner left">
            <h3>By Player</h3>
            <p>PlayerX = Y</p>
          </div>

          <div class="inner middle">
            <h3>Field</h3>
            <p>{{match.field}}</p>
            <h3>Date</h3>
            <p>{{match.date}}</p>
            <h3>Time</h3>
            <p>{{match.time}}</p>
            <h3>Referee</h3>
            <p>{{match.referee}}</p>
          </div>

          <div class="inner right">
            <h3>By Player</h3>
            <p>PlayerX = Y</p>
          </div>
  
        </div> 
      </BaseCard>
    </div>

    <div>
      <button @click="modal_field = true">Change Field</button>
      <button @click="modal_goal = true">Add Goal</button>
      <button @click="modal_card = true">Add Card</button>
    </div>

    <BaseModal 
      v-if="modal_field"
      action="change-field"
      @close="modal_field = false"
      @change-field="changeField"
    >
      <h3 slot="header">Change Field</h3>
      <div slot="body">
        <input 
          v-model="new_field"
          type="text"
          placeholder="New Field Name"
        >
      </div>
    </BaseModal>

    <BaseModal 
      v-if="modal_goal"
      action="add-goal"
      @close="modal_goal = false"
      @add-goal="addGoal"
    >
      <h3 slot="header">Add Goal</h3>
      <div slot="body">
        <input 
          v-model="scoring_team"
          type="text"
          placeholder="Scoring Team..."
        >
        <input 
          v-model="scoring_player"
          type="text"
          placeholder="Scoring Player..."
        >
        <input 
          v-model="scoring_time"
          type="text"
          placeholder="Time..."
        >
      </div>
    </BaseModal>

    <BaseModal 
      v-if="modal_card"
      action="add-card"
      @close="modal_card = false"
      @add-card="addCard"
    >
      <h3 slot="header">Add Card</h3>
      <div slot="body">
        <input 
          v-model="card_player"
          type="text"
          placeholder="Recieving Player..."          
        >        
        <input 
          v-model="card_type"
          type="text"
          placeholder="Card Type..."
        >
      </div>
    </BaseModal>

  </main>  
</template>

<script>
  import BaseCard from './BaseCard'
  import BaseModal from './BaseModal'
  import {api} from './../services/Api'

  export default {
    name: 'BaseMatch',
    components: {
      BaseCard,
      BaseModal
    },

    props: ['match'],
    data() {
      return {
        modal_field: false,
        modal_goal: false,
        modal_card: false,
        new_field: '',
        scoring_player: '',
        scoring_team: '',
        scoring_time: '',
        card_player: '',
        card_type: ''

      }
    },

    methods: {
      changeField() {
        console.log(`from field`)

        api.put(`/fields?match=${this.match.id}&field=${this.new_field}`)
        this.match.field = this.new_field

        this.modal_field = false
      },

      addGoal() {
        console.log(`from goal`)
        
        this.scoring_team.toLowerCase() == this.match.team1.toLowerCase() ?
          this.match.score1++ : this.match.score2++
        

        api.post(`/teams?match=${this.match.id}&player=${this.scoring_player}&time=${this.scoring_time}`)
        
        
        this.modal_goal = false
      },

      addCard() {
        console.log(`from card`)
        
        api.post(`/players?player=${this.card_player}&card=${this.card_type}`)

        this.modal_card = false
      }
    }
  }

</script>

<style scoped>
  
  .match {
    max-width: 660px;
    margin: auto;
  }
  
  .inner {
    display: inline-block;
  }

  .one, .left {
    float: left;
  }

  .two, .right {
    float: right;
  }

  .inner {
    display: inline-block;
  }
  
  .left {
    margin-right: 60px;
  }

  .middle {
    padding-left: 70px;
    padding-right: 70px;
    border-left: 1px solid black;
    border-right: 1px solid black;
  }

  .right {
    margin-left: 60px;
  }

	.cards {
    max-width: fit-content;
    margin: auto;
	}


  button {
    font-size: 1.4em;
    background: #42b983;
    border: none;
    border-radius: 5px;
    padding: 10px;
    margin: 15px;
    color: #fff;
  }

  button:hover {
    transition: all 0.2s ease-in-out;
    transform: scale(1.05);
  }
  
  input {
    margin: 10px;
  }

  @media only screen and (max-width: 805px) {
    .inner {
      display: block;
      border-bottom: 1px solid black;
    }
    
    .left, .right {
      float: none;
      margin: 0px;
    }

    .middle {
      padding: 0px;
      margin-left: 140px;
      margin-right: 140px;
      border-left: none;
      border-right: none;
    }

  }
</style>