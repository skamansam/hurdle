// https://dev.to/johnboy5358/comment/ac43
export const range = (start: number, end: number, length: number = end - start) =>
  Array.from({ length }, (_, i) => start + i)
