String cutText(String txt) {
  if (txt.length > 11) {
    return txt.replaceRange(11, txt.length, ' ...');
  } else {
    return txt;
  }
}

String cutText2(String txt) {
  if (txt.length > 25) {
    return txt.replaceRange(25, txt.length, ' ...');
  } else {
    return txt;
  }
}

String cutText3(String txt) {
  if (txt.length > 20) {
    return txt.replaceRange(20, txt.length, ' ...');
  } else {
    return txt;
  }
}

String cutText4(String txt) {
  if (txt.length > 17) {
    return txt.replaceRange(17, txt.length, ' ...');
  } else {
    return txt;
  }
}
