double KelvinToCelsium(double kelvin){
  var ceslium = kelvin-273.15;
  return double.parse(ceslium.toStringAsFixed(ceslium.truncateToDouble() == ceslium ? 0 : 2)) ;
}

String FirstSymbolToUpperCase(String lowerCaseString){
  return lowerCaseString.split('').first.toUpperCase()+lowerCaseString.split('').skip(1).join('');
}