enum UserRole { user, admin, guest }

class User {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final bool isActive;
  final UserRole role;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.isActive = true,
    this.role = UserRole.user,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      isActive: json['isActive'] ?? true,
      role: UserRole.values.firstWhere(
        (e) => e.toString().split('.').last == (json['role'] ?? 'user'),
        orElse: () => UserRole.user,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      if (phone != null) 'phone': phone,
      'isActive': isActive,
      'role': role.toString().split('.').last,
    };
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    bool? isActive,
    UserRole? role,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      isActive: isActive ?? this.isActive,
      role: role ?? this.role,
    );
  }

  static bool validateEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return
