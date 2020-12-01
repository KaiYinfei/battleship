import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:battleship/gameBoard.dart';

void main() {

  test('There is a ship in this position', () {
    expect(gameBoard[0][0], 'occupied');});

  test('Attack an occupied space', () {
    expect(_attackPosition(0, 0), 'hit');
  });

  test('Attack an empty space', () {
    expect(_attackPosition(3, 0), 'miss');
  });

  test('Attack an already attacked position', () {
    expect(_attackPosition(3, 2), 'Invalid attack');
  });
}

String _attackPosition(int x, int y){
  if(gameBoard[x][y] == ''){
    gameBoard[x][y] = 'miss';
    return 'miss';
  } else if(gameBoard[x][y] == 'miss'){
    return 'Invalid attack';
  } else if(gameBoard[x][y] == 'occupied') {
    gameBoard[x][y] = 'hit';
    return 'hit';
  }
}
