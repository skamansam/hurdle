<script>
import WordInput from "./wordInput.svelte";
import { range } from '../lib/helpers';
export let numTries = 5;
export let wordlength = 5;
let guesses = ["helps"];
let currentGuessIndex = 0;

// TODO: there should be a single input field that holds focus. on text change, it should update the view. on return, it should calculate the answers.
</script>

<div class="flex justify-center items-center my-4">
  <ul>
    {#each range(0, numTries) as name, index (name)}
      <li class="pb-4">
        <WordInput wordlength="{wordlength}" word="{guesses[index]}"></WordInput>
      </li>
    {/each}
    <input bind:value="{guesses[currentGuessIndex]}">
  </ul>
</div>