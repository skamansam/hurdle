// https://dev.to/johnboy5358/comment/ac43
export const range = (start, end, length = end - start) =>
  Array.from({ length }, (_, i) => start + i)
