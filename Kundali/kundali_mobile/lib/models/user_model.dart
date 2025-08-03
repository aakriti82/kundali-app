class User {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final bool isActive;
  final UserRole role;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.isActive = true,
    this.role = UserRole.user,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      isActive:
