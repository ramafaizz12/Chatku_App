import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'groupchat_dart_event.dart';
part 'groupchat_dart_state.dart';

class GroupchatDartBloc extends Bloc<GroupchatDartEvent, GroupchatDartState> {
  GroupchatDartBloc() : super(GroupchatDartInitial()) {
    on<GroupchatDartEvent>((event, emit) {});
  }
}
