<template>
  <main>
    <div class="cards">
      <BaseCard>
        <div class="match">
          
          <div class="match-header">
            <h2>
              <span class="team one"> Team 1 </span>
              <span class="score"> 0 - 0 </span>
              <span class="team two"> Team 2 </span>
            </h2>
          </div>

          <div class="inner left">
            <h3>By Player</h3>
            <p>PlayerX = Y</p>
          </div>

          <div class="inner middle">
            <h3>Field</h3>
            <p>Field XYZ</p>
            <h3>Date</h3>
            <p>01-01-2020</p>
            <h3>Time</h3>
            <p>18:30</p>
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
          type="text"
          placeholder="Scoring Team"
        >
        <input 
          type="text"
          placeholder="Scoring Player"
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
          type="text"
          placeholder="Recieving Player"          
        >        
      </div>
    </BaseModal>

  </main>  
</template>

<script>
  import BaseCard from './BaseCard'
  import BaseModal from './BaseModal'

  export default {
    name: 'BaseMatch',
    components: {
      BaseCard,
      BaseModal
    },

    data() {
      return {
        modal_field: false,
        modal_goal: false,
        modal_card: false
      }
    },

    methods: {
      changeField() {
        console.log(`from field`)
        this.modal_field = false
      },

      addGoal() {
        console.log(`from goal`)
        this.modal_goal = false
      },

      addCard() {
        console.log(`from card`)
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