// import 'dart:io';
//
// void main(){
//   var str ="abcd";
//   for(int a=0; a<str.length; a++){
//     for(int b=0; b<=a; b++){
//       print(str[a]);
//     }
//   }
// }


void main() {
  String str = "ABCD";
  String result = "";

  for (int i = 0; i < str.length; i++) {
    result += str[i]; // first letter

    for (int j = 0; j < i; j++) {
      result += str[i].toLowerCase();
    }
    if (i < str.length - 1) {
      result += "-";
    }
  }

  print(result);
}