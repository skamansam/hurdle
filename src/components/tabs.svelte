<script>
  import { createEventDispatcher } from 'svelte';

  export let value = 0;
  export let tabs = [];
  function changeTab(index) {
    value = index;
    dispatch('input', index)
  }
  const dispatch = createEventDispatcher();
</script>

<nav class="text-center">
  <ul class="flex justify-center items-center my-4">
    {#each tabs as name, index (name)}
      <li class="cursor-pointer py-2 px-4 text-gray-500 border-b-4 transition-colors duration-700 {value=== index && 'text-green-500 border-green-500'}" on:click={() => changeTab(index)}>{name}</li>    
    {/each}
</nav>
