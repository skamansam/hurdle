<script lang="ts">

import WordInput from "./wordInput.svelte";
import { range } from '../lib/helpers';
import Keyboard from "./keyboard.svelte";

export let numTries: number = 5;
export let wordLength: number = 5;
let guessedWords: string[] = [""];
let currentGuessIndex: number = 0;
let word: string = 'guess';
let guessedLetters = {};
let error: String = null;
let correctnessMap: string[][] = [];

const calculateCorrectness = (): undefined => {
  let currentWord: String = guessedWords[currentGuessIndex].toLowerCase();
  const guessArray: string[] = currentWord.toLowerCase().split('');
  const wordArray: string[] = word.toLowerCase().split('');
  if (currentWord === word) {
    guessArray.forEach((l)=> guessedLetters[l] = 'c');
    correctnessMap[currentGuessIndex] = guessArray.map(() => 'c');
    return;
  }
  correctnessMap[currentGuessIndex] = guessArray.map((l, index) => {
    if(l === wordArray[index]) return 'c';  // "c"orrect
    if (wordArray.includes(l)) return 'p';  // "p"resent
    return 'm';                               // "m"issing
  });
  console.log(correctnessMap, word, guessArray);
}

const validateWord = (word: string) => {
  if (word.length < wordLength) {
      error = `Your Guess must be ${wordLength} letters.`;
      return false;
    }
    return true;
}

const checkWord = (word: string) => {
  if (!validateWord(word)) return;
  calculateCorrectness();
  currentGuessIndex = currentGuessIndex + 1;
  guessedWords[currentGuessIndex] = '';
}

const deleteLastLetter = (word: string) => {
  if (word.length < 1 ) return;
  guessedWords[currentGuessIndex] = word.slice(0,-1);
  guessedWords = [...guessedWords];
}

const appendLetter = (word: string, key: string) => {
  if (word.length >= wordLength || key.length !== 1 || key > 'Z' || key < 'A' ) return;
  guessedWords[currentGuessIndex] = `${word}${key}`;
  guessedWords = [...guessedWords];

}

const handleKeydown = ({key}) => {
  error = null;
  key = key.toUpperCase();
  let currentWord = guessedWords[currentGuessIndex];
  if (key === 'ENTER') checkWord(currentWord);
  if (key === 'BACKSPACE') deleteLastLetter(currentWord);
  appendLetter(currentWord, key);
}
const handleStateChanged = (index: Number, evt: Event) => {
  console.log("Handling state change for ", index, evt)

}
</script>
<svelte:window on:keydown={handleKeydown}/>
<div class="flex justify-center items-center my-4 flex-col">
  {#if error}
  <div class="mb-5 rounded border w-full text-center p-2 bg-red-400 text-slate-900  border-slate-900">{error}</div>
  {/if}
  <ul>
    {#each range(0, numTries) as index (index)}
      <li class="pb-4 {index}">
        <WordInput wordlength="{wordLength}" word="{guessedWords[index] || ''}" validations={correctnessMap[index]} on:stateChanged="{(evt) =>  handleStateChanged(index, evt)}"></WordInput>
      </li>
    {/each}
  </ul>
  <div class="flex justify-center items-center my-4">
    <Keyboard guessedLetters={correctnessMap}></Keyboard>
  </div></div>

