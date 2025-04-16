import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class SidebarEvent {}

class ToggleSidebarPin extends SidebarEvent {}
class SetHoverState extends SidebarEvent {       
  final bool isHovered;
  SetHoverState(this.isHovered);
}

// State
class SidebarState {
  final bool isPinned;
  final bool isHovered;

  const SidebarState({
    required this.isPinned,
    required this.isHovered,
  });

  SidebarState copyWith({
    bool? isPinned,
    bool? isHovered,
  }) {
    return SidebarState(
      isPinned: isPinned ?? this.isPinned,
      isHovered: isHovered ?? this.isHovered,
    );
  }
}

// Bloc
class SidebarBloc extends Bloc<SidebarEvent, SidebarState> {
  SidebarBloc() : super(const SidebarState(isPinned: false, isHovered: false)) {
    
    on<ToggleSidebarPin>((event, emit) {
      emit(state.copyWith(isPinned: !state.isPinned));
    });

    on<SetHoverState>((event, emit) {
      emit(state.copyWith(isHovered: event.isHovered));
    });
  }
}
