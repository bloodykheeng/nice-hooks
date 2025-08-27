part of nice_hooks;

//! Do not use a package generator to generate this file.
class CustomerModel with ChangeNotifier {
  final String id;
  final String name;
  final String businessName;
  final String businessType;
  final String region;
  final String route;
  final String agent;
  final String phoneNumber;
  final String phoneNumber2;
  final String district;
  final String parish;
  final String village;
  final String desc;
  final String gps;
  final Object date;
  final String registeredBy;
  final String lastUpdatedBy;
  CustomerModel({
    required this.id,
    required this.name,
    required this.businessName,
    required this.businessType,
    required this.region,
    required this.route,
    required this.agent,
    required this.phoneNumber,
    required this.phoneNumber2,
    required this.district,
    required this.parish,
    required this.village,
    required this.desc,
    required this.gps,
    required this.date,
    required this.registeredBy,
    required this.lastUpdatedBy,
  });

  CustomerModel copyWith({
    String? id,
    String? name,
    String? businessName,
    String? businessType,
    String? region,
    String? route,
    String? agent,
    String? phoneNumber,
    String? phoneNumber2,
    String? district,
    String? parish,
    String? village,
    String? desc,
    String? gps,
    Object? date,
    String? registeredBy,
    String? lastUpdatedBy,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      businessName: businessName ?? this.businessName,
      businessType: businessType ?? this.businessType,
      region: region ?? this.region,
      route: route ?? this.route,
      agent: agent ?? this.agent,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      phoneNumber2: phoneNumber2 ?? this.phoneNumber2,
      district: district ?? this.district,
      parish: parish ?? this.parish,
      village: village ?? this.village,
      desc: desc ?? this.desc,
      gps: gps ?? this.gps,
      date: date ?? this.date,
      registeredBy: registeredBy ?? this.registeredBy,
      lastUpdatedBy: lastUpdatedBy ?? this.lastUpdatedBy,
    );
  }

  // toMap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'business_name': businessName,
      'business_type': businessType,
      'region': region,
      'route': route,
      'agent': agent,
      'phone_number': phoneNumber,
      'phone_number_2': phoneNumber2,
      'district': district,
      'parish': parish,
      'village': village,
      'location_description': desc,
      'gps': gps,
      'date': date,
      'registered_by': registeredBy,
      'last_updated_by': lastUpdatedBy,
    };
  }

  factory CustomerModel.fromFirestore(DocumentSnapshot documentSnapshot) {
    var data = documentSnapshot.data() as Map;
    return CustomerModel(
      id: documentSnapshot.id,
      name: data["name"] ?? "Customer Name Missing",
      businessName: data["business_name"] ?? "Business Missing",
      businessType: data["business_type"] ?? "Business Type Missing",
      region: data["region"] ?? "Region Missing",
      route: data["route"] ?? "Route Missing",
      agent: data["agent"] ?? "Agent Missing",
      phoneNumber: data["phone_number"] ?? "Phone Number Missing",
      phoneNumber2: data["phone_number_2"] ?? "0123",
      district: data["district"] ?? "District Missing",
      parish: data["parish"] ?? "Parish Missing",
      village: data["village"] ?? "Village Missing",
      desc: data["location_description"] ?? "Location Description Missing",
      gps: data["gps"] == "" ||
              data["gps"] == null ||
              data["gps"] == "0.313318,32.6150393"
          ? "Missing GPS"
          : data["gps"],
      date: data["date"].toDate(),
      registeredBy: data["registered_by"],
      lastUpdatedBy: data["last_updated_by"] ?? data["registered_by"],
    );
  }
  @override
  String toString() {
    return 'CustomerModel(id: $id, name: $name, businessName: $businessName, businessType: $businessType, region: $region, route: $route, agent: $agent, phoneNumber: $phoneNumber, phoneNumber2: $phoneNumber2, district: $district, parish: $parish, village: $village, desc: $desc, gps: $gps, date: $date, registeredBy: $registeredBy, lastUpdatedBy: $lastUpdatedBy)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomerModel &&
        other.id == id &&
        other.name == name &&
        other.businessName == businessName &&
        other.businessType == businessType &&
        other.region == region &&
        other.route == route &&
        other.agent == agent &&
        other.phoneNumber == phoneNumber &&
        other.phoneNumber2 == phoneNumber2 &&
        other.district == district &&
        other.parish == parish &&
        other.village == village &&
        other.desc == desc &&
        other.gps == gps &&
        other.date == date &&
        other.registeredBy == registeredBy &&
        other.lastUpdatedBy == lastUpdatedBy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        businessName.hashCode ^
        businessType.hashCode ^
        region.hashCode ^
        route.hashCode ^
        agent.hashCode ^
        phoneNumber.hashCode ^
        phoneNumber2.hashCode ^
        district.hashCode ^
        parish.hashCode ^
        village.hashCode ^
        desc.hashCode ^
        gps.hashCode ^
        date.hashCode ^
        registeredBy.hashCode ^
        lastUpdatedBy.hashCode;
  }
}
