import 'package:bloc/bloc.dart';
import 'package:spain_bot_web_app/features/bls_spain/data/bls_spain_repository.dart';

part 'open_page_event.dart';
part 'open_page_state.dart';

class OpenPageBloc extends Bloc<OpenPageEvent, OpenPageState> {
  final BlsSpainRepository blsSpainRepository;
  OpenPageBloc(this.blsSpainRepository) : super(const OpenPageInitial()) {
    on<OpenPageEvent>((event, emit) => switch (event) {
          OpenPageStarted() => _onStarted(emit),
        });
  }

  Future<void> _onStarted(Emitter<OpenPageState> emit) async {
    emit(const OpenPageLoading());
    try {
      await blsSpainRepository.openLink();
      emit(const OpenPageSuccess());
    } catch (e) {
      emit(const OpenPageError());
    }
  }
}
