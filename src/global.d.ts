/// <reference types="@sveltejs/kit" />

interface stringStringType {
  [key: string]: string;
}

declare namespace svelte.JSX {
  interface stringStringType {
    [key: string]: string;
  }
}