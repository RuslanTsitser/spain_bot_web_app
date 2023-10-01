part of 'open_page_bloc.dart';

sealed class OpenPageState {
  const OpenPageState();
}

final class OpenPageInitial extends OpenPageState {
  const OpenPageInitial();
}

final class OpenPageLoading extends OpenPageState {
  const OpenPageLoading();
}

final class OpenPageSuccess extends OpenPageState {
  const OpenPageSuccess();
}

final class OpenPageError extends OpenPageState {
  const OpenPageError();
}
