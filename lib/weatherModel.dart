class Weather {
  var cityName;
  var icon;
  var temp;
  var condition;
  var wind;
  var humidity;
  var wind_dir;
  var cloud;
  var pressure;
  var vis_km;
  var last_updated;
  var gust_kph;
  var uv;
  Weather(
      {this.cityName,
      this.icon,
      this.temp,
      this.condition,
      this.wind,
      this.humidity,
      this.wind_dir,
      this.cloud,
      this.pressure,
      this.vis_km,
      this.last_updated,
      this.gust_kph,
      this.uv
      });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['location']['name'],
      icon: json['current']['condition']['icon'],
      temp: json['current']['temp_c'],
      condition: json['current']['condition']['text'],
      wind: json['current']['wind_kph'],
      humidity: json['current']['humidity'],
      wind_dir: json['current']['wind_dir'],
      cloud: json['current']['cloud'],
      pressure: json['current']['pressure_mb'],
      vis_km: json['current']['vis_km'],
      last_updated: json['current']['last_updated'],
      gust_kph: json['current']['gust_kph'],
      uv: json['current']['uv']
    );
  }
}
