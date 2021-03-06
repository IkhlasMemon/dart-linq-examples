part of linq_samples;

doConversionOperations() =>
  runSamples("LINQ - Conversion Operators",
    {'linq54': 'ToArray',  //Dart has fixed-size Lists instead
     'linq55': 'ToList',
     'linq56': 'ToDictionary',
     'linq57': 'OfType'});

toMap(List seq, f(x)){
  var map = {};
  seq.forEach((x) => map[f(x)] = x);
  return map;
}

ofType(List seq, type) =>
  seq.where((x) => reflect(x).type.qualifiedName == reflectClass(type).qualifiedName);
  
linq54(){
  var doubles = [ 1.7, 2.3, 1.9, 4.1, 2.9 ]; 
  
  var sortedDoubles = order(doubles).reversed;

  var doublesArray = sortedDoubles.toList(growable:false); 
  
  print("Every other double from highest to lowest:"); 
  for (int d = 0; d < doublesArray.length; d += 2){ 
    print(doublesArray[d]); 
  } 
}
/*
Every other double from highest to lowest:
4.1
2.3
1.7
*/

linq55(){
  var words = [ "cherry", "apple", "blueberry" ]; 
  
  var sortedWords = order(words);
  
  var wordList = sortedWords.toList(); 
  
  print("The sorted word list:"); 
  wordList.forEach(print);
}
/*
The sorted word list:
apple
blueberry
cherry
*/

linq56(){
  var scoreRecords = [{ 'Name': "Alice", 'Score': 50}, 
                      { 'Name': "Bob"  , 'Score': 40}, 
                      { 'Name': "Cathy", 'Score': 45}];
  
  var scoreRecordsDict = toMap(scoreRecords, (sr) => sr['Name']); 
  
  print("Bob's score: ${scoreRecordsDict['Bob']}"); 
}
/*
Bob's score: {Name: Bob, Score: 40}
*/

linq57(){
  var numbers = [ null, 1.0, "two", 3, "four", 5, "six", 7.0 ]; 
  
  var doubles = ofType(numbers, double); 
  
  print("Numbers stored as doubles:"); 
  doubles.forEach(print);
}
/*
Numbers stored as doubles:
1.0
7.0
*/
