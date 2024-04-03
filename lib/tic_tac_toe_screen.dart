import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/BoxColors/box_colors.dart';
import 'package:tic_tac_toe/bloc/tictactoe_bloc.dart';

class TicTacToeScreen extends StatelessWidget {
  const TicTacToeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(child: Text('TIC  TAC  TOE')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(  
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  border: Border.all(
                    color: Constants.pink,
                    width: 10,
                  ),
                  color: Constants.pink),
              child: Container(  
                margin: const EdgeInsets.all(0.8),
                padding: const EdgeInsets.all(0.8),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 239, 229, 217),
                      width: 3),
                  color: Colors.grey[200],
                ),
                child: Table(
                  children: List.generate(
                    5,
                    (i) {
                      return TableRow(
                        children: List.generate(
                          5,
                          (j) {
                            int index = i * 5 + j;
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<TictactoeBloc>(context)
                                    .add(TapBoxEvent(number:  index + 1));
                              },
                              child: Container(  
                                width: 70,
                                height: 70,
                                color: Constants.boxColors[index],
                                child: Center(
                                  child: Container( 
                                    width: 50,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: BlocBuilder<TictactoeBloc,
                                          TictactoeState>(
                                        builder: (context, state) {
                                          if (state
                                                  is TictactoeUpdatedState &&
                                              state.tappedNumbers
                                                  .contains(index + 1)) {
                                            return Text(
                                              '${state.tappedNumbers.indexOf(index + 1) + 1}',
                                              style: const TextStyle(
                                                fontSize: 22,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          }
                              
                                          if (state
                                              is TictactoeInitialState) {
                                            return const Text('');
                                          }
                              
                                          return Container();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
