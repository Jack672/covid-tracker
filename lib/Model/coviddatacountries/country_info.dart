class CountryInfo {
	int? id;
	String? iso2;
	String? iso3;
	int? lat;
	int? long;
	String? flag;

	CountryInfo({
		this.id, 
		this.iso2, 
		this.iso3, 
		this.lat, 
		this.long, 
		this.flag, 
	});

	factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
				id: json['_id'] as int?,
				iso2: json['iso2'] as String?,
				iso3: json['iso3'] as String?,
				lat: json['lat'] as int?,
				long: json['long'] as int?,
				flag: json['flag'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'_id': id,
				'iso2': iso2,
				'iso3': iso3,
				'lat': lat,
				'long': long,
				'flag': flag,
			};
}
