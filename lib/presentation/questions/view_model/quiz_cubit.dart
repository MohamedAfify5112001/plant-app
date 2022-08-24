import 'package:bloc/bloc.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  int questionNumber = 1;

  void increment() {
    questionNumber++;
    emit(IncrementNumberQuestionState());
  }

  void decrement() {
    questionNumber--;
    emit(DecrementNumberQuestionState());
  }
}
