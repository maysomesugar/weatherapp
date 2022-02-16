double KelvinToCelsium(double? kelvin){
  var ceslium = kelvin != null ? kelvin-273.15 : 0;
  return double.parse(ceslium.toStringAsFixed(ceslium.truncateToDouble() == ceslium ? 0 : 2)) ;
}

String FirstSymbolToUpperCase(String? lowerCaseString){
  String first = lowerCaseString?.split('').first.toUpperCase() ?? 'U';
  String second =   lowerCaseString?.split('').skip(1).join('') ?? 'known';

  return first + second;
}