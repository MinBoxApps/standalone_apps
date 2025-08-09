class MWord {
  final String id;
  final String word;
  final String pronunciation;
  final String definition;
  final String definitionm;
  final String example;
  final String examplem;  

  MWord({required this.id, required this.word, required this.pronunciation, required this.definition, required this.definitionm, required this.example, required this.examplem});

  factory MWord.fromJson(Map<String, dynamic> json) {
    return MWord(
      id: json['id'],
      word: json['word'],
      pronunciation: json['pronunciation'],
      definition: json['definition'],
      definitionm: json['definitionm'],
      example: json['example'],
      examplem: json['examplem']
    );
  }
}