part of 'open_page_bloc.dart';

sealed class OpenPageEvent {
  const OpenPageEvent();
}

class OpenPageStarted extends OpenPageEvent {
  const OpenPageStarted();
}
