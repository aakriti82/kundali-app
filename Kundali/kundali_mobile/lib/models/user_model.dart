enum UserRole { user, admin, guest }

/// Represents a user in the system.
class User {
  final String id;
  final String name;
  final String email;
  final String? profileImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final UserRole role;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
    this.createdAt,
    this.updatedAt,
    this.role = UserRole.user,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profileImage: json['profileImage'],
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt']) : null,
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
      if (profileImage != null) 'profileImage': profileImage,
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt!.toIso8601String(),
      'role': role.toString().split('.').last,
    };
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImage,
    DateTime? createdAt,
    DateTime? updatedAt,
    UserRole? role,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      role: role ?? this.role,
    );
  }

  bool get isValid => id.isNotEmpty && name.isNotEmpty && email.isNotEmpty;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          profileImage == other.profileImage &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          role == other.role;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      (profileImage?.hashCode ?? 0) ^
      (createdAt?.hashCode ?? 0) ^
      (updatedAt?.hashCode ?? 0) ^
      role.hashCode;

  @override
  String toString() =>
      'User(id: $id, name: $name, email: $email, profileImage: $profileImage, createdAt: $createdAt, updatedAt: $updatedAt, role: $role)';
}
