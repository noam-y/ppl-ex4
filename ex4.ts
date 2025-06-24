import { resolve } from "path";

//Q1
export function all<T>(promises : Array<Promise<T>>) : Promise<Array<T>> {
  return new Promise<T[]>((resolve, reject) => {
  let resolvedCount = 0;
  let results: T[] = new Array(promises.length);
  for (let i = 0; i < promises.length; i++) {
    promises[i].then(value => {
      results[i] = value;
      resolvedCount++;
      if (resolvedCount === promises.length) {
        // each time we finish resolving, we check if we can finish
        resolve(results);
      }
    }).catch(reject);
  }
  });
}

  
// Q2
export function* Fib1() {
	yield 1;
  yield 1;
  let pair:[number, number] = [1, 1];
  while (true){
    pair = getNextCouple(pair);
    yield pair[1];
  }
}

function getNextCouple(couple: [number, number]): [number, number] {
  return [couple[1], couple[0] + couple[1]];
}


export function* Fib2() {
	let n = 1;
  while (true) {
    yield fibBinet(n);
    n = n + 1;
  }
}


export function fibBinet(n: number): number {
  const sqrt5 = Math.sqrt(5);
  const phi = (1 + sqrt5) / 2;
  const psi = (1 - sqrt5) / 2;

  const result = (Math.pow(phi, n) - Math.pow(psi, n)) / sqrt5;
  return Math.round(result); 
}
