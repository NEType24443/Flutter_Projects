class Quote {

  String text;
  String author;

  Quote({this.text, this.author});  // Shortcut to assign values
}
//  Quote(String text, String author){
//    this.text = text;
//    this.author = author;
//  }

//Quote({ String text, String author }){  //  =>   Quote quoteOne = Quote( text: 'Ora Ora! Ora! Ora!! Ora!!!', author: 'Dio');
//  this.text = text;
//  this.author = author;
//} //named parameter