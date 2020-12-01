import 'dart:core';
import 'package:battleship/gameBoard.dart';

class Ship {
  Ship newShip(int x, int y, int length, int height,
      bool rotated, String sClass) {
    if (!rotated) {
      int shipLength = length;
      int shipWidth = height;
    } else {
      int shipLength = height;
      int shipWidth = length;
    }
    int xCoord = x;
    int yCoord = y;
  }


}