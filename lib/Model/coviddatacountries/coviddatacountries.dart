import 'country_info.dart';

class Coviddatacountries {
	int? updated;
	String? country;
	CountryInfo? countryInfo;
	int? cases;
	int? todayCases;
	int? deaths;
	int? todayDeaths;
	int? recovered;
	int? todayRecovered;
	int? active;
	int? critical;
	int? casesPerOneMillion;
	int? deathsPerOneMillion;
	int? tests;
	int? testsPerOneMillion;
	int? population;
	String? continent;
	int? oneCasePerPeople;
	int? oneDeathPerPeople;
	int? oneTestPerPeople;
	double? activePerOneMillion;
	double? recoveredPerOneMillion;
	int? criticalPerOneMillion;

	Coviddatacountries({
		this.updated, 
		this.country, 
		this.countryInfo, 
		this.cases, 
		this.todayCases, 
		this.deaths, 
		this.todayDeaths, 
		this.recovered, 
		this.todayRecovered, 
		this.active, 
		this.critical, 
		this.casesPerOneMillion, 
		this.deathsPerOneMillion, 
		this.tests, 
		this.testsPerOneMillion, 
		this.population, 
		this.continent, 
		this.oneCasePerPeople, 
		this.oneDeathPerPeople, 
		this.oneTestPerPeople, 
		this.activePerOneMillion, 
		this.recoveredPerOneMillion, 
		this.criticalPerOneMillion, 
	});

	factory Coviddatacountries.fromJson(Map<String, dynamic> json) {
		return Coviddatacountries(
			updated: json['updated'] as int?,
			country: json['country'] as String?,
			countryInfo: json['countryInfo'] == null
						? null
						: CountryInfo.fromJson(json['countryInfo'] as Map<String, dynamic>),
			cases: json['cases'] as int?,
			todayCases: json['todayCases'] as int?,
			deaths: json['deaths'] as int?,
			todayDeaths: json['todayDeaths'] as int?,
			recovered: json['recovered'] as int?,
			todayRecovered: json['todayRecovered'] as int?,
			active: json['active'] as int?,
			critical: json['critical'] as int?,
			casesPerOneMillion: json['casesPerOneMillion'] as int?,
			deathsPerOneMillion: json['deathsPerOneMillion'] as int?,
			tests: json['tests'] as int?,
			testsPerOneMillion: json['testsPerOneMillion'] as int?,
			population: json['population'] as int?,
			continent: json['continent'] as String?,
			oneCasePerPeople: json['oneCasePerPeople'] as int?,
			oneDeathPerPeople: json['oneDeathPerPeople'] as int?,
			oneTestPerPeople: json['oneTestPerPeople'] as int?,
			activePerOneMillion: (json['activePerOneMillion'] as num?)?.toDouble(),
			recoveredPerOneMillion: (json['recoveredPerOneMillion'] as num?)?.toDouble(),
			criticalPerOneMillion: json['criticalPerOneMillion'] as int?,
		);
	}



	Map<String, dynamic> toJson() => {
				'updated': updated,
				'country': country,
				'countryInfo': countryInfo?.toJson(),
				'cases': cases,
				'todayCases': todayCases,
				'deaths': deaths,
				'todayDeaths': todayDeaths,
				'recovered': recovered,
				'todayRecovered': todayRecovered,
				'active': active,
				'critical': critical,
				'casesPerOneMillion': casesPerOneMillion,
				'deathsPerOneMillion': deathsPerOneMillion,
				'tests': tests,
				'testsPerOneMillion': testsPerOneMillion,
				'population': population,
				'continent': continent,
				'oneCasePerPeople': oneCasePerPeople,
				'oneDeathPerPeople': oneDeathPerPeople,
				'oneTestPerPeople': oneTestPerPeople,
				'activePerOneMillion': activePerOneMillion,
				'recoveredPerOneMillion': recoveredPerOneMillion,
				'criticalPerOneMillion': criticalPerOneMillion,
			};
}
