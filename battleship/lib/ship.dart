import 'dart:core';
import 'package:battleship/gameBoard.dart';

class Ship {
  int row;
  int column;
  int length;
  int direction;
  
  static final int UNSET = -1;
  static final int HORIZONTAL = 0;
  static final int VERTICAL = 1;
  
Ship(int length){
  this.length = length;
  this.row = -1;
  this.column = -1;
  this.direction = UNSET;
}

bool placedDown(){
  if (row == -1 || column == -1){
    return false;
  } else {
    return true;
  }
}

bool hasDirection(){
  if (direction == UNSET) {
    return false;
  } else {
    return true;
  }
}

void setLocation(int row, int column) {
  this.row = row; 
  this.column = column;
}

void setDirection(int direction) {
  if (direction == UNSET && direction != HORIZONTAL && direction != VERTICAL){
    throw "Illegal argument";
  }
  this.direction = direction;
}

int getRow(){
  return row;
};

int getColumn(){
  return column;
}

int getLength(){
  return length;
}

int getDirection(){
  return direction;
}

String directionToStr() {
  if (direction == UNSET) {
    return "UNSET";
  } else if (direction == HORIZONTAL) {
    return "HORIZONTAL";
  } else
    return "VERTICAL";
  }
  
  String toString(){
  return "Ship: " + getRow().toString() + ", " + getColumn().toString() + 
      " with length " + getLength().toString() + " and direction " 
      + getDirection().toString();
  }
  
}
