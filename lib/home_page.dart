import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/weatherData.dart';
import 'package:weather_app/weatherModel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var dayInfo = DateTime.now();
var dateformat = DateFormat('EEEE, d MMM, yyyy').format(dayInfo);

class _HomePageState extends State<HomePage> {
  WeatherData client = WeatherData();
  Weather data = Weather();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      Weather weatherData = await client.getWeatherData("10.75", "106.65");
      setState(() {
        data = weatherData;
      });
    } catch (e) {
      print(e);
    }
  }

  String getUVMessage(double uvIndex) {
    if (uvIndex >= 1 && uvIndex <= 2) {
      return "Rất yếu";
    } else if (uvIndex >= 3 && uvIndex <= 5) {
      return "Bình thường";
    } else if (uvIndex >= 6 && uvIndex <= 7) {
      return "Cao";
    } else if (uvIndex >= 8 && uvIndex <= 10) {
      return "Rất cao";
    } else if (uvIndex >= 11) {
      return "Nguy hiểm";
    } else {
      return "Không có thông tin";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
      future: fetchData(),
      builder: ((context, snapshot) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: size.height * 0.75,
                height: size.height* 0.65,
                width: size.width,
                padding: EdgeInsets.only(top: 40),
                margin: EdgeInsets.only(right: 12, left: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.blue,
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.blue,
                      Color(0xFFD6B4CE),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      '${data?.cityName}',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${dateformat}',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    Image.network(
                      'https:${data?.icon}',
                      width: size.width * 0.4,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      '${data?.condition}',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      '${data?.temp}°C',
                      style: TextStyle(
                        fontSize: 75,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Image.asset(
                              'assets/Gio.png',
                              width: size.width * 0.15,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Tốc độ gió',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '${data?.wind} km/h',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            Image.asset(
                              'assets/DoAm.png',
                              width: size.width * 0.15,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Độ ẩm',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '${data?.humidity} %',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            Image.asset(
                              'assets/wind-direction.png',
                              width: size.width * 0.15,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Hướng gió',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '${data?.wind_dir}',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text('UV',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.5),
                          )),
                      SizedBox(height: 5),
                      Text(getUVMessage(data?.uv),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                      SizedBox(height: 20),
                      Text('Độ che phủ của mây',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.5),
                          )),
                      SizedBox(height: 5),
                      Text('${data?.cloud}%',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                      SizedBox(height: 20),
                      Text('Tầm nhìn xa',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.5),
                          )),
                      SizedBox(height: 5),
                      Text('${data?.vis_km} km',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                      SizedBox(height: 20),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text('Áp suất',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.5),
                          )),
                      SizedBox(height: 5),
                      Text('${data?.pressure} hPa',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                      SizedBox(height: 20),
                      Text('Gió giật',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.5),
                          )),
                      SizedBox(height: 5),
                      Text('${data?.gust_kph} km/h',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                      SizedBox(height: 20),
                      Text('Lần cuối cập nhật',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.5),
                          )),
                      SizedBox(height: 5),
                      Text('${data?.last_updated}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                      SizedBox(height: 20),
                    ],
                  )),
                ],
              )
            ],
          ),
        );
      }),
    ));
  }
}
