void main() {

  List<int> nombres = [25, 42, 79, 12];
  print("Liste de départ : $nombres");

  nombres.sort((a, b) => b.compareTo(a));
  print("Liste triée (décroissant) : $nombres");

  var listeDoublee = nombres.map((n) => n * 2).toList();
  print("Chaque élément x 2 : $listeDoublee");

  var nombresPairs = listeDoublee.where((n) => n.isEven).toList();
  print("Nombres pairs finaux : $nombresPairs");
}