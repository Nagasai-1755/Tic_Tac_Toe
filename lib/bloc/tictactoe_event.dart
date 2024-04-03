part of 'tictactoe_bloc.dart';

@immutable
abstract class TictactoeEvent extends Equatable {
    @override
    List<Object> get props => [];
}

class TapBoxEvent extends TictactoeEvent {
  final int number;

  TapBoxEvent({required this.number});

   @override
   List<Object> get props => [number];
}

