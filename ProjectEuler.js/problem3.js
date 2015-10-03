function largestPrimeFactor(n) {
  var max = 0;
  for (var i=0; i<(n/2); i++) {
    if (n%i==0 && isPrime(i)) {
      max = i;
    }
  }
  return max;
}

function isPrime(n) {
  for (var i=0; i<n; i++) {
    if (n%i==0) {
      return false;
    }
  }
  return true;
}
