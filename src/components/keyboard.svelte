<script lang="ts">
export let guessedLetters = {};
const keyboard = [
  'qwertyuiop', 'asdfghjkl', 'zxcvbnm'
]
function getKeyColor(key: string) {
  const correctness = guessedLetters?.[key];
  if ( correctness === 'c') return 'bg-green-600';
  if ( correctness === 'p') return 'bg-yellow-600';
  if ( correctness === 'm') return 'bg-red-600';
  return 'bg-gray-400';
}

</script>

<div>
{#each keyboard as row, index (index)}
<div class="row justify-center flex mb-2">
  {#if index === 2}
    <span class="key bg-red-400 rounded inline-block px-4 py-1 pt-0 mr-2 text-lg font-bol">&#9003;</span>
  {/if}
  {#each row.split('') as key (key)}
  <span class="key {getKeyColor(key)} rounded inline-block px-2 py-1 mr-2 font-bold">{key}</span>
  {/each}
  {#if index === 2}
    <span class="key bg-green-600 rounded inline-block py-1 px-4 mr-2 text-lg font-bol">&#8628;</span>
  {/if}
</div>
{/each}
</div>


<style>
</style>