import 'package:flutter/material.dart';

//Found a site that helps explaining the GridView class and has a great
//example on how to implement this with icons, tiles, and other such things
//https://medium.com/codechai/flutter-grid-view-from-2d-array-5467e4da5243

List<List<String>> gameBoard = [
  ['occupied','occupied','','','','','',''],
  ['','','','','','','',''],
  ['','','','miss','','','',''],
  ['','occupied','','','','','',''],
  ['','occupied','','','occupied','occupied','',''],
  ['','occupied','','','','occupied','occupied',''],
  ['','occupied','','','','attack','',''],
  ['','','','','','','','']
];

class Grid extends StatefulWidget{
  @override
  GamePage createState () => GamePage();
}


class GamePage extends State<Grid>{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.arrow_circle_down)),
                Tab(icon: Icon(Icons.arrow_circle_up)),
              ]),
              title: Text('Battleship'),
            ),
            body: TabBarView(
                children: [
                  _buildGameBoard(),
                _buildGameBoard()])
          )
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
      onTap: () {
        setState(() {
          _attackPosition(x, y);
        });
      },
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

  String _attackPosition(int x, int y){
    if(gameBoard[x][y] == ''){
      gameBoard[x][y] = 'miss';
      return 'miss';
    } else if(gameBoard[x][y] == 'miss'){
      print('You have already attacked at: ' + 'x: $x ' + 'y: $y');
      return 'Invalid attack';
    } else if(gameBoard[x][y] == 'occupied') {
      gameBoard[x][y] = 'hit';
      return 'hit';
    }
  }

  Widget _checkPosition(int x, int y){
    switch (gameBoard[x][y]) {
      case '':
        return Text('');
        break;

      case 'occupied':
        return Text('');
        break;

      case 'hit':
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
