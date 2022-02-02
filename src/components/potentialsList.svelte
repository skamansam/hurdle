<script>
  import { range } from '../lib/helpers';
  // import { createEventDispatcher } from 'svelte';
  // const dispatch = createEventDispatcher();
  let clazz;
	export { clazz as class };
  export let wordlength;
</script>

<div class="potentials-list {clazz || ''}">
  <h3>Potential Matches</h3>
  <ul>
    {#each range(0, 20) as name, index (name)}
    <li>Item {index}</li>
    {/each}
  </ul>
</div>