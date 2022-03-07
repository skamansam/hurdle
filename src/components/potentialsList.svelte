<script lang="ts">
  import { range } from '../lib/helpers';
  // import { createEventDispatcher } from 'svelte';
  // const dispatch = createEventDispatcher();
  let clazz;
	export { clazz as class };
  export let wordlength; 
  let possibleWords = []
  const loadFile = async () => {
    const response = await fetch(`/by_length/${wordlength}.txt`);
    if(response.ok) {
      possibleWords = (await response.text()).split("\n")
      console.debug(possibleWords);
    }
  }
  loadFile();
</script>

<div class="potentials-list {clazz || ''} w-72">
  <h3 class="underline">Potential Matches</h3>
  <ul class=" overflow-auto overscroll-contains h-96 h-full">
    {#each possibleWords as name, index (name)}
    <li>{name}</li>
    {/each}
  </ul>
</div>