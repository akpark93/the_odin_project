function problem1() {
  var base = document.getElementById('prob1').value;
  var sum = 0;
  for (var i=0; i<1000; i++) {
    if (i%3==0 || i%5==0) {
      sum += i;
    }
  }
  console.log(sum);
  document.getElementById('result1').innerHTML = sum;
}

function problem2() {
  //get the sum of even fibs
  var n = document.getElementById('prob2').value;
  var sum = 0;
  var fib;
  var i = 0;
  while (fib < n) {
    fib = fib(i);
    if (fib%2==0) {
      sum += fib;
    }
    i+=1
  }
  document.getElementById('result2').innerHTML = sum;
}

function fib(n) {
  if (n==1 || n==0) {
    return 1;
  }
  return fib(n-1) + fib(n-2);
}

function largestPrimeFactor() {
  var n = document.getElementById('prob3').value;
  var max = 0;
  for (var i=0; i<(n/2); i++) {
    if (n%i==0 && isPrime(i)) {
      max = i;
    }
  }
  document.getElementById('result3').innerHTML = max;
}

function isPrime(n) {
  for (var i=0; i<n; i++) {
    if (n%i==0) {
      return false;
    }
  }
  return true;
}
