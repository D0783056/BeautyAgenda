bool isAllChecked(List<String> c1, List<String> c2, List<String> c3, List<String> c4, List<String> c5, List<String> c6, List<String> c7, List<String> c8) {
  if(c1.length == 0 || c2.length == 0 || c3.length == 0 || c4.length == 0 || c5.length == 0 || c6.length == 0 || c7.length == 0 || c8.length == 0) {
    return false;
  } else {
    return true;
  }
}

int getScore(List<String> c1, List<String> c2, List<String> c3, List<String> c4, List<String> c5, List<String> c6, List<String> c7, List<String> c8) {
  int sum = 0;
  var score = {
    "完全不會": 0,
    "幾乎不會": 1,
    "經常會": 2,
    "偶爾會": 3,
    "會": 4
  };
  sum = score[c1[0]] + score[c2[0]] + score[c3[0]] + score[c4[0]] + score[c5[0]] + score[c6[0]] + score[c7[0]] + score[c8[0]];
  return sum;
}

//TODO 記得要再調整
String bodySituations(int score) {
  if(score >= 0 && score < 12) {
    return "正常";
  } else if(score >= 12 && score <25) {
    return "不太正常";
  } else {
    return "異常";
  }
}