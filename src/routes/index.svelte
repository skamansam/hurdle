<script>
import HurdleBoard from '../components/hurdleBoard.svelte';
import PotentialsList from '../components/potentialsList.svelte';
import Tabs from '../components/tabs.svelte';
let tabIndex = 0;
const tabs = ['Play Hurdle!', 'Get Help!'];
const wordlength = 5;
const tries = 5;
</script>
<svelte:head>
  <title>Hurdle</title>
</svelte:head>
<header class="text-center mb-4">
  <h1 class="text-5xl">Hurdle</h1>
  <p class="ml-4 text-gray-500 ">Word-based Mastermind</p>
</header>
<Tabs tabs="{tabs}" on:input="{(e) => tabIndex = e.detail}"></Tabs>
<main class="flex justify-center items-start my-4">
  <HurdleBoard wordLength="{wordlength}" numTries="{tries}"></HurdleBoard>
  {#if tabIndex === 1}
    <PotentialsList wordlength="{wordlength}" class="ml-4 rounded border p-2 w-1/3"></PotentialsList>
  {/if}
</main>
<footer>
</footer>

<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat+Alternates&family=Montserrat:wght@800&display=swap');
* {
  font-family: 'Montserrat Alternates', 'Montserrat', sans-serif;
}
</style>