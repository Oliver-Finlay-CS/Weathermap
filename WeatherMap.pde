//variables
JSONObject json_current_Edmonton = loadJSONObject("api.openweathermap.org/data/2.5/weather?id=5946768&APPID=b8b648220a8d21c501a7354ddeb4e429&mode=JSON&units=metric");
JSONObject jsonForecastEdmonton = loadJSONObject("api.openweathermap.org/data/2.5/forecast?id=5946768&APPID=b8b648220a8d21c501a7354ddeb4e429&mode=JSON&units=metric");
//Must test the API Called Data

//api.openweathermap.org/data/2.5/forecast?id=5946768&APPapi.openweathermap.org/data/2.5/forecast?id=5946768&APPID=b8b648220a8d21c501a7354ddeb4e429&mode=JSON&units=metricID=b8b648220a8d21c501a7354ddeb4e429&mode=JSON&units=metric

JSONObject list = jsonForecastEdmonton.getJSONArray ("list");
JSONObject all = list.getJSONObject (0);
int dtForecast = all.getInt ("dt"); //loads integer
JSONObject mainForecast = all.getJSONObject ("main"); //unwraps {}, or array
float tempForecast = mainForecast.getFloat ("temp");
int humidityForecast = mainForecast.getInt ("humidity");

//Using dt-forecast variable in another API
String currentTime = "http://www.convert-unix-time.com/api?timestamp=" + dtForecast + "&timezone=Edmonton";
JSONObject localTimeJSONObject = loadJSONObject (currentTime);
String localDate = localTimeJSONObject.getString ("localDate");
//Notice it is possible to create a method out of these lines of code
//Using string functions and a method, localDate can be shaped to the parts needed

//Unwrap Weather data using validation in Chrome and JSON Lint to make a call readible
JSONObject mainCurrent = jsonCurrentEdmonton.getJSONObject ("main"); //unwraps {}, or array
float tempCurrent = mainCurrent.getFloat ("temp");
int humidityCurrent = mainCurrent.getInt ("humidity");
int dtCurrent = jsonCurrentEdmonton.getInt ("dt"); //parent node, no unwrapping
  //Able to send this to the Unix Time API as above
String name = jsonCurrentEdmonton.getString ("name"); //parent node, no unwrapping
JSONObject sys = jsonCurrentEdmonton.getJSONObject ("sys"); //unwraps {}, or array
int sunrise = sys.getInt ("sunrise"); //Able to send this to the Unix Time API as above
int sunset = sys.getInt ("sunset");//Able to send this to the Unix Time API as above

//Simple println to ensure variables are loaded with correct information
//Caution: might need to concatonate to different lines if screen is too narrow
println ("The ID is for: " + name + " (from Weather Data)");
println ("Local Time from Forecast Data is: " + localDate);
println ("Local Time from Weather Data is: " + dtCurrent + " (must pass this to Unix API for human-readible data)");
println ("The sunrise and sunset Unix time from Weather Data is: " + sunrise + ", " + sunset +  " (must pass this to Unix API for human-readible data)");
println ("Temp from Forecast Data is: " + tempForecast);
println ("Temp from Weather Data is: " + tempCurrent);
println ("Humidity from Forecast Data is: " + humidityForecast);
println ("Humidity from Weather Data is: " + humidityCurrent);
println("End of currently loaded variables from API.");
//A good project would be to compare all these values and comment on the predictive modelling of Open Weather Map

//void setup() {}

//void draw() {}