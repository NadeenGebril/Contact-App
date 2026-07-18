abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactLoaded extends ContactState {}

class ContactEmpty extends ContactState {}

class ContactDraftChanged extends ContactState {}

class ContactError extends ContactState {
  final String message;

  ContactError(this.message);
}
