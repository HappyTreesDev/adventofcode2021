num measurementsLargerThanPrevious(List<int> sonarSweep,
    {int slidingWindow = 1}) {
  var count = 0;

  for (var i = slidingWindow; i < sonarSweep.length; i++) {
    var sumLeft = 0;
    var sumRight = 0;
    for (var j = 0; j < slidingWindow; j++) {
      sumLeft += sonarSweep[i - j - 1];
      sumRight += sonarSweep[i - j];
    }
    if (sumLeft < sumRight) {
      count++;
    }
  }

  return count;
}
