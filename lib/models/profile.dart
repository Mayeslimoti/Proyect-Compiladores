// models/profile.dart
class Profile {
  final String nombre;
  final String apellido;
  final String email;
  final String telefono;

  Profile({
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.telefono,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      nombre: json['nombre'],
      apellido: json['apellido'],
      email: json['email'],
      telefono: json['telefono'],
    );
  }
}
