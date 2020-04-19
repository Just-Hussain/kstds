<template>
  <main>
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">
          
          <div class="modal-header">
            <slot name="header">default header</slot>
          </div>

          <div class="modal-body">
            <slot name="body">default body</slot>
          </div>

          <div class="modal-footer">
            <button 
              class="close-btn"
              @click="$emit('close')"
            >
              Cancel
            </button>

            <button 
              v-if="action"
              @click="$emit(`${action}`)"
            >
              Confirm
            </button>
          </div>

        </div>
      </div>
    </div>
  </main>
</template>

<script>
  export default {
    name: "BaseModal",
    props: ['action']
  }
</script>

<style scoped>
  /* 
    The modal and its styles are modified from Vue.js examples
   */
  * {
    color: black;
    font-size: 1.06em;
  }


  button {
    background: #42b983;
    border: none;
    padding: 10px;
    margin: 15px;
    color: #fff;
    border-radius: 5px;
  }

  .close-btn {
    background: red;
  }

  button:hover {
    transition: all 0.2s ease-in-out;
    transform: scale(1.05);
  }

  .modal-mask {
    position: fixed;
    z-index: 9998;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: table;
    transition: opacity 0.3s ease;
  }

  .modal-wrapper {
    display: table-cell;
    vertical-align: middle;
  }

  .modal-container {
    width: 300px;
    margin: 0px auto;
    padding: 20px 30px;
    background-color: #fff;
    border-radius: 2px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.33);
    transition: all 0.3s ease;
  }

  .modal-header h3 {
    margin-top: 0;
    color: #42b983;
  }

  .modal-body {
    margin: 20px 0;
  }

</style>