import 'package:battleship/ship.dart';
import 'gameBoard.dart';

class Player{
  static final List<int> SHIP_LENGTHS = [2, 2, 3, 4, 5];
  static final int NUMBER_OF_SHIPS = 5;

  List<Ship> ships;
  Grid playerGrid;
  Grid opponentGrid;

  Player() {
    if (NUMBER_OF_SHIPS != 5) {
      throw "Error: Number of ships must always be 5!";
    }
    ships = new List<Ship>(NUMBER_OF_SHIPS);
    for (int i = 0; i < NUMBER_OF_SHIPS; i++) {
      Ship temp = new Ship(SHIP_LENGTHS[i]);
      ships[i] = temp;
    }

    playerGrid = new Grid();
    opponentGrid = new Grid();
  }
}