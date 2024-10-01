
class Book {
double price = 0;
String? author;
int pages = 0;



Book(this.price, this.author, this.pages);
@override String toString() {
    // TODO: implement toString
    return '$price, $author, $pages';
  }
}



void main() {
  Book designTheory = Book(15, "chel", 200);

  print(designTheory);

}