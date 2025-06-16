//Q1
export function all<T>(promises : Array<Promise<T>>) : Promise<Array<T>> {
  // const promArr = promises.reduce((acc, promise) => {
  //   promise.then(value => {[...acc, value]})
  //   .catch(error => {
  //     throw new Error(`Promise failed with error: ${error}`);
  //   });
  // },[])
  return new Promise<T[]>( (resolve, reject) => {
    resolve([]);
    //TODO
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
  return Math.round(result); // עיגול לתוצאה הקרובה כי מדובר במספר עשרוני
}
