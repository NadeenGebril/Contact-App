class ContactModel {
  final String userName;
  final String email;
  final String phone;
  final String? photo;
  ContactModel({
    required this.userName,
    required this.phone,
    this.photo,
    required this.email,
  });
}
