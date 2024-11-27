-- Create the database
CREATE DATABASE ProgramowanieDotNet;

-- Use the newly created database
USE ProgramowanieDotNet;

-- Create Categories Table
CREATE TABLE Kategorie (
    KategoriaID INT PRIMARY KEY AUTO_INCREMENT,
    Nazwa VARCHAR(255) NOT NULL,
    Opis TEXT
);

-- Insert categories
INSERT INTO Kategorie (Nazwa, Opis) VALUES
('Podstawy C#', 'Tematy związane z podstawami języka C#, takie jak zmienne, typy danych, funkcje.'),
('Zaawansowane C#', 'Zaawansowane tematy takie jak dziedziczenie, delegaty, zdarzenia w C#.'),
('Optymalizacja', 'Tematy związane z optymalizowaniem kodu i zarządzaniem pamięcią.');

-- Create Topics Table
CREATE TABLE Tematy (
    TematID INT PRIMARY KEY AUTO_INCREMENT,
    Nazwa VARCHAR(255) NOT NULL,
    Opis TEXT NOT NULL,
    KategoriaID INT,
    FOREIGN KEY (KategoriaID) REFERENCES Kategorie(KategoriaID)
);

-- Insert topics with category references
INSERT INTO Tematy (Nazwa, Opis, KategoriaID) VALUES
('Wprowadzenie do C#', 'C# to język programowania stworzony przez Microsoft. Jest to język obiektowy używany do tworzenia aplikacji na platformie .NET. C# jest jednym z najpopularniejszych języków programowania wśród programistów, zwłaszcza w ekosystemie Microsoft.', 1),
('Zmienne i Typy Danych', 'W C# zmienne są wykorzystywane do przechowywania danych. Typy danych określają rodzaj przechowywanych informacji. Przykłady typów: int (liczby całkowite), double (liczby zmiennoprzecinkowe), string (łańcuchy znaków), bool (wartości logiczne).', 1),
('Funkcje w C#', 'Funkcje w C# to bloki kodu, które wykonują określone zadania i mogą zwracać wyniki. Funkcje pomagają w organizowaniu kodu i jego wielokrotnym użyciu w różnych miejscach programu.', 1),
('Instrukcje warunkowe', 'Instrukcje warunkowe pozwalają na podejmowanie decyzji w kodzie. Najczęściej używaną instrukcją warunkową jest if, która sprawdza, czy dany warunek jest prawdziwy.', 1),
('Pętle w C#', 'Pętle umożliwiają wielokrotne wykonanie tego samego fragmentu kodu. Istnieje kilka rodzajów pętli, m.in. pętla for, while, oraz do-while.', 2),
('Tablice w C#', 'Tablice w C# to struktury danych, które pozwalają przechowywać kolekcje elementów tego samego typu. Używa się ich do przechowywania wielu danych w jednym obiekcie.', 1),
('Obiekty i Klasy w C#', 'C# jest językiem obiektowym, co oznacza, że korzysta się w nim z klas i obiektów. Klasy definiują właściwości i metody, a obiekty to instancje tych klas.', 2),
('Dziedziczenie w C#', 'Dziedziczenie to mechanizm, który pozwala jednej klasie przejmować właściwości i metody innej klasy. Dzięki dziedziczeniu można tworzyć bardziej złożone hierarchie klas.', 2),
('Delegaty i zdarzenia w C#', 'Delegaty to wskaźniki do funkcji, które mogą być używane do przekazywania metod jako argumenty. Zdarzenia to specjalny rodzaj delegatów, które pozwalają na implementację wzorca projektowego "obserwator".', 2),
('Zarządzanie pamięcią w C#', 'W C# pamięć jest zarządzana automatycznie przez mechanizm zwany Garbage Collectorem (GC). GC odpowiada za zbieranie nieużywanych obiektów i zwalnianie pamięci.', 3);

-- Create Examples Table
CREATE TABLE Przykłady (
    PrzykładID INT PRIMARY KEY AUTO_INCREMENT,
    TematID INT,
    Kod TEXT NOT NULL,
    Opis TEXT NOT NULL,
    FOREIGN KEY (TematID) REFERENCES Tematy(TematID)
);

-- Insert example code related to the topics
INSERT INTO Przykłady (TematID, Kod, Opis) VALUES
(1, 'Console.WriteLine("Witaj, świecie!");', 'Przykład wyświetlenia tekstu na ekranie w C#'),
(2, 'int liczba = 10; string tekst = "Hello World";', 'Deklaracja zmiennych typu int oraz string w C#'),
(3, 'public int Dodaj(int a, int b) { return a + b; }', 'Przykład funkcji, która dodaje dwie liczby'),
(4, 'if (x > 10) { Console.WriteLine("X jest większe niż 10"); }', 'Instrukcja warunkowa if, która sprawdza, czy zmienna x jest większa niż 10'),
(5, 'for (int i = 0; i < 5; i++) { Console.WriteLine(i); }', 'Pętla for, która wypisuje liczby od 0 do 4'),
(6, 'int[] tablica = new int[5] {1, 2, 3, 4, 5};', 'Deklaracja i inicjalizacja tablicy w C# z pięcioma elementami'),
(7, 'public class Osoba { public string Imie; public int Wiek; }', 'Przykład klasy "Osoba" z dwoma polami: Imie i Wiek'),
(8, 'public class Zwierze { public virtual void Dzwiek() { Console.WriteLine("Dźwięk zwierzęcia"); } }', 'Przykład dziedziczenia, gdzie klasa "Zwierze" ma metodę Dzwiek, która jest dziedziczona'),
(9, 'public delegate void MyDelegate(string message);', 'Deklaracja delegata, który przyjmuje jeden argument typu string'),
(10, 'GC.Collect();', 'Ręczne wywołanie Garbage Collectora w C#, co pozwala na zbieranie nieużywanych obiektów');
