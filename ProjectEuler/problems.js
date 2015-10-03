function problem1() {
  var base = document.getElementById('prob1').value;
  var sum = 0;
  for (var i=0; i<base; i++) {
    if (i%3==0 || i%5==0) {
      sum += i;
    }
  }
  console.log(sum);
  document.getElementById('result1').innerHTML = sum;
}

function problem2() {
  var base = document.getElementById('prob2').value;
  var sum = 0;
  var first = 1;
  var second = 1;
  var num = 1;
  while (num < base) {
    num = first + second;
    first = second;
    second = num;

    if (num%2==0) {
      sum += num;
    }
  }
  
  document.getElementById('result2').innerHTML = sum;
}

function problem3() {
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
  for (var i=2; i<n; i++) {
    if (n%i==0) {
      return false;
    }
  }
  return true;
}
