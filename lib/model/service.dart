class Service {
  String name;
  String logo;
  String color;

  Service({required this.name, required this.logo, required this.color});

  @override
  String toString() {
    return 'Service{name: $name, logo: $logo, color: $color}';
  }
}