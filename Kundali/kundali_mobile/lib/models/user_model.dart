/// Represents a user in the system.
class User {
  final String id;
  final String name;
  final String email;
  final String? profileImage; // Optional field for extensibility

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
  });

  /// Creates a [User] from a JSON map.
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profileImage: json['profileImage'],
    );
  }

  /// Converts the [User] instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      if (profileImage != null) 'profileImage': profileImage,
    };
  }

  /// Returns a copy of this user with updated fields.
  User copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImage,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          profileImage == other.profileImage;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ email.hashCode ^ (profileImage?.hashCode ?? 0);

  @override
  String toString() =>
      'User(id: $id, name: $name, email: $email,
