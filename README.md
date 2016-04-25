#RecipeBook
##Opis
Aplikacja naisana w oparciu o MVVM bazujac na modelu reaktywnym. 
Warstwa sieciowa oparta o generator parametrow, generator requestow oraz warstwe abstrakcji w postaci API service.

Persistancy w Aplikacji oparte o baze Realm.
Mapowanie JSON-Model-Realm oparte o ObjectMapper

Celem odchudzenia viewControllera Wyeksrachowalem adapter TableView w postaci generycznej.

Z uwagi na mala ilosc widokow ograniczylem sie do jednego storyboarda, bo w tym konkretnym przypadku nie widzialem sensu rozbijania na wiecej. Oczywiscie widoki sa autolayoutowane.

Kod jest w malym stopniu pokryty unit testami, gdyz zwyczajnie zabraklo mi czasu na zwiekszenie stopnia pokrycia i dodanie testow funkcjonalnych.

Aplikacja dziala na kazdym urzadzeniu w kazdej orientacji.
Do wyszukiwania uzylem UISearchControllera w modelu delegata, bo jeszcze nie jest pokryty w pelni przez RxCocoa.

Pobieranie obrazkow odbywa sie poprzez AlamofireImage wraz z cachowaniem.

Z urozmaicen wizualnych jedynie dynamiczna wysokosc komorki tableView na widoku listy zdazylem zrobic.

W razue ewentualnych pytan chetnie odpowiem.