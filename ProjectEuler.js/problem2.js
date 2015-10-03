function problem2() {
  //get the sum of even fibs
  var sum = 0;
  var fib;
  var i = 0;
  while (fib < 4000000) {
    fib = fib(i);
    if (fib%2==0) {
      sum += fib;
    }
    i+=1
  }
  return sum;
}

function fib(n) {
  if (n==1 || n==0) {
    return 1;
  }
  return fib(n-1) + fib(n-2);
}
