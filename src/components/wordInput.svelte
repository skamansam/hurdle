<script>
  import { range } from '../lib/helpers';
	import { createEventDispatcher } from 'svelte';

	const dispatch = createEventDispatcher();

  export let wordlength = 5;
  export let word = "";
  export let validations = [];  
  let validationClasses = [];

  function reveal(index) {
    if (index >= validations.length) return;
    const validationValue = validations[index];
    if (validationValue === 'c') 
      validationClasses[index] = 'bg-green-700 correct';
    else if (validationValue === 'p')
      validationClasses[index] = 'bg-yellow-600 present';
    else
      validationClasses[index] = 'bg-gray-600 wrong';
    validationClasses = [...validationClasses];
    
    setTimeout(() => {
      reveal(index + 1);
    }, 2000/wordlength)
  }

  $: if (validations?.length > 0 && validations.length > validationClasses.length){
    reveal(0);
  }
  const changeState = (index) => {
    dispatch('stateChanged', {current: validationClasses?.[index], index, word });
  }
</script>

<span class="block">
  {#each range(0, wordlength) as name, index (name)}
    <span on:click="{() => changeState(index)}" class="{validationClasses?.[index]} letter-block inline-block border border-slate-900 dark:border-slate-200 rounded w-12 h-12 ml-1 text-3xl text-center content-center p-1 uppercase">
      {word[index] || ''}
    </span>
  {/each}
</span>

<input class="hidden" maxlength={wordlength}>

<style>
.letter-block.correct{
	animation: rotateAnimation 0.5s linear 1;
}

/* .letter-block.present{
	animation: shake 0.5s 1;
} */

.letter-block.wrong, .letter-block.present{
  animation: pulse 2s cubic-bezier(0.4, 0, 0.6, 1) 1;
}

@keyframes rotateAnimation {
	from {transform: rotateY(45deg);}
	to {transform: rotateY(225deg);}
}

@keyframes pulse {
  0%, 100% {
    opacity: 1;
  }
  50% {
    opacity: .5;
  }
}
@keyframes shake {
  0% { transform: translate(1px, 1px) rotate(0deg); }
  10% { transform: translate(-1px, -2px) rotate(-1deg); }
  20% { transform: translate(-3px, 0px) rotate(1deg); }
  30% { transform: translate(3px, 2px) rotate(0deg); }
  40% { transform: translate(1px, -1px) rotate(1deg); }
  50% { transform: translate(-1px, 2px) rotate(-1deg); }
  60% { transform: translate(-3px, 1px) rotate(0deg); }
  70% { transform: translate(3px, 1px) rotate(-1deg); }
  80% { transform: translate(-1px, -1px) rotate(1deg); }
  90% { transform: translate(1px, 2px) rotate(0deg); }
  100% { transform: translate(1px, -2px) rotate(-1deg); }
}
</style>