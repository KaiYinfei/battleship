import 'package:flutter/material.dart';

//Found a site that helps explaining the GridView class and has a great
//example on how to implement this with icons, tiles, and other such things
//https://medium.com/codechai/flutter-grid-view-from-2d-array-5467e4da5243

List<List<String>> gameBoard = [
  ['','','','','','','',''],
  ['','','','','','','',''],
  ['','','','miss','','','',''],
  ['','test','','','','','',''],
  ['','','','','','','',''],
  ['','','','','','','',''],
  ['','','','','','attack','',''],
  ['','','','','','','','']
];


class GamePage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Battleship Demo'),
          ),
          body: _buildGameBoard()
      ),
    );
  }

  Widget _buildGameBoard(){
    int gameBoardLength = gameBoard.length;
    return Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0)
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gameBoardLength,
                ),
                itemBuilder: _attack,
                itemCount: gameBoardLength * gameBoardLength,
              ),
            ),
          ),
        ]);
  }


  Widget _attack(BuildContext context, int index){
    int gridStateLength = gameBoard.length;
    int x, y = 0;
    x = (index / gridStateLength).floor();
    y = (index % gridStateLength);
    return GestureDetector(
      onTap: () => _attackPosition(x, y),

      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)
          ),
          child: Center(
            child: _checkPosition(x, y),
          ),
        ),
      ),
    );
  }

  Widget _attackPosition(int x, int y){
    if(gameBoard[x][y] == ''){
      gameBoard[x][y] = 'miss';
    }
    print('Testing: x: $x' + ' y: $y');
    return _checkPosition(x, y);
    //App understands the tap to attack, just need to update board.
    //TODO Update Board when attack
  }

  Widget _checkPosition(int x, int y){
    switch (gameBoard[x][y]) {
      case '':
        return Text('');
        break;

      case 'test':
        return Container(
          color: Colors.redAccent,
        );
        break;

      case 'attack':
        return Icon(
          Icons.brightness_1,
          size: 40.0,
          color: Colors.lightBlueAccent,
        );
        break;

      case 'miss':
        return Icon(
          Icons.clear,
          size: 40.0,
          color: Colors.green,
        );
        break;

      default:
        return Text(gameBoard[x][y].toString());
    }
  }
}