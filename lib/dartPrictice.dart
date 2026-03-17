//NO parameter with No return type
/*
void main(){
student();
}
student(){
  print("Niraj kumar");
}
*/

// parameter with No return type
/*
void main(){
  student("Niraj kumar");
}
student(String name){
  print(name);
}
*/

//NO parameter with return type

/*
void main() {
  print(student());
}
student() {
  return "Niraj kumar";
}
*/

//return with parameter
/*
void main(){
print(student(10,0));
 }
 student(int a ,int b){
   int sum = a*b;
   return sum;
 */

/*
void main(){
  String str = "123456789";
  int count = 0;
  for(int a=0; a<str.length; a++){
    // vowel
    // if(str[a]=="a"||str[a]=="e"||str[a]=="i"||str[a]=="o"||str[a]=="u"){
    //   count++;
    // }

    if(int.parse(str[a])%2==0){
      count++;
      print("$a is even");
    }
    else{
      print("$a is odd");
    }
  }
  print(count);
  }
*/

// Revers
/*
import 'dart:io';

void main(){
  String name= "niraj";
  for(int a=name.length-1; a>=0; a--){
    print(name[a]);
  }
  for(int a=0; a<name.length; a++){
    stdout.write(name[name.length-a-1]);
// print(5-a-1);
  }
}
*/

// Anonymous function
/*
import 'dart:io';

void main(){
  List list = ["Apple","Banana","Mango","orange","kiwi",];
  list.forEach((element) {
    stdout.write(" fruit:$element");
  });
}
*/

//class
/*
class School{
  student(){
    print("Nira kumar");
  }
}

void main(){
  var obs =School();
  obs.student(); 
} */

/*void main(){
   String str = "abcdefghijklmnopqrstuvwxyz";
   int count =0;
   for(int a=0; a<str.length; a++){
     if(str[a]=="a"||str[a]=="e"||str[a]=="i"||str[a]=="o"||str[a]=="u"){
       count++;
       print("${str[a]} word is vowel");
     }
   }
   print("$count");
 }*/
/* Increment/ decrement
void main(){
  List list =[8,9,7,5,6,4,1,2,3,];
  for(int a=0; a<list.length; a++){
   for(int b=0; b<list.length; b++){
     if(list[a]>list[b]){
       var inr = list[a];
       list[a]= list[b];
       list[b]= inr;
     }
   }
  }
  print(list);
}*/

/*
Max/Min
 void main(){
   List list =[87,9,21,8];
   var max=list[0];
   for(int a=0; a<list.length;a++){
    if(list[a]<max){
    max = list[a];
    }
   }
   print(max);
 }
 */

/*import 'dart:io';

void main() {
  // dynamic care= a;
  for (int a = 1; a <= 4; a++) {
    for (int b = 4; b >= a; b--) {
      stdout.write(" ");
    }
    for (int c = 1; c <= a; c++) {
      stdout.write(" $a");
    }
    stdout.writeln();
    // care++;
  }
  var num = 3;
  for (int d = 2; d <= 4; d++) {
    for (int e = 1; e <= d; e++) {
      stdout.write(" ");
    }
    for (int f = 4; f >= d; f--) {
      stdout.write(" $num");
    }
    stdout.writeln();
    num--;
  }
}
 */

/*
 duplicate
 void main(){
   List list = [1,2,2,5,5,6,7,8,9,1];
   for(int a=0; a<list.length; a++){
     for(int b=a+1; b<list.length; b++){
       if(list[a]==list[b]){
         print(list[a]);
       }
     }
   }
 }
 */

