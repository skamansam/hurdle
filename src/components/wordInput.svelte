<script>
  import { range } from '../lib/helpers';
  export let wordlength = 5;
  export let word = "";
  export let validations = [];
</script>

<span class="block">
  {#each range(0, wordlength) as name, index (name)}
    <span class="inline-block border rounded w-12 h-12 ml-1 text-3xl text-center content-center p-1 uppercase">
      {word[index] || ''}
    </span>
  {/each}
</span>

<input class="hidden" maxlength={wordlength}>