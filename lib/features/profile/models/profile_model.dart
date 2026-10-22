class TechnicianProfileModel {
  final String name;
  final String role;
  final String id;
  final String location;
  final bool onDuty;
  final String experience;
  final String phone;
  final String email;
  final String baseLocation;
  final String serviceVehicle;
  final String equipmentKit;

  const TechnicianProfileModel({
    required this.name,
    required this.role,
    required this.id,
    required this.location,
    required this.onDuty,
    required this.experience,
    required this.phone,
    required this.email,
    required this.baseLocation,
    required this.serviceVehicle,
    required this.equipmentKit,
  });
}