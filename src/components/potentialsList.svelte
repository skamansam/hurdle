<script lang="ts">
  // import { createEventDispatcher } from 'svelte';
  // const dispatch = createEventDispatcher();
  let clazz: string;
	export { clazz as class };
  export let wordlength: number; 
  export let wordMap: string[][];
  let possibleWords = [];
  $: {
    
  }
  const loadFile = async () => {
    const response = await fetch(`/by_length/${wordlength}.txt`);
    if(response.ok) {
      possibleWords = (await response.text()).split("\n")
    }
  }
  loadFile();
</script>

<div class="potentials-list {clazz || ''} col w-72 pb-10" style="height: 32rem;">
  <h3 class="underline">Potential Matches</h3>
  <ul class=" overflow-y-scroll h-full">
    {#each possibleWords as name (name)}
    <li>{name}</li>
    {/each}
  </ul>
</div>