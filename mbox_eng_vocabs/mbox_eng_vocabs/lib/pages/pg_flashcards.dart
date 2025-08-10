import 'package:flutter/material.dart';
import 'package:mbox_eng_vocabs/controls/ctrl_app_end_drawer.dart';
import 'package:mbox_eng_vocabs/models/m_word.dart';
import 'package:mbox_eng_vocabs/services/svc_words.dart';
import 'package:mbox_eng_vocabs/themes/theme_selector.dart';
import 'package:provider/provider.dart';

class BtnFlashcard extends StatelessWidget {
  const BtnFlashcard({super.key, required this.mword, required this.showlevel});
  final MWord mword;
  final int showlevel; /* 001 / 1 => Flip; 010 / 2 => Usage; 100 / 4 => Pronunciation; 110 / 6 => Pronunciation and Usage */
  @override
  Widget build(BuildContext ctx) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            alignment: Alignment.center,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity, 
                color: Colors.black,   
                padding: const EdgeInsets.symmetric(vertical: 8.0), // Vertical padding
                child: Text(
                  mword.word,
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.white
                  ),
                  textAlign: TextAlign.center, // Center the text within the container
                ),
              ),
              if((showlevel & 1)==1) ...[
                Container(
                  width: double.infinity, 
                  color: Colors.white,   
                  padding: const EdgeInsets.symmetric(vertical: 8.0), // Vertical padding
                  child: Text(
                    mword.pronunciation,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                    textAlign: TextAlign.center, // Center the text within the container
                  ),
              ),
              ],
              if ((showlevel & 7)==7) ...[
                const SizedBox(height: 8.0),
                Text(
                  mword.definition,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 8.0),
                Text(
                  mword.definitionm,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                  textAlign: TextAlign.left,
                ),
              ],
              if((showlevel & 2)==2) ...[
                const SizedBox(height: 8.0),
                Container(
                  width: double.infinity, 
                  color: Colors.white,   
                  padding: const EdgeInsets.symmetric(vertical: 8.0), // Vertical padding
                  child: Text(
                    '${mword.example}\n${mword.examplem}',
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black
                    ),
                    textAlign: TextAlign.left, // Center the text within the container
                  ),
                ),                
              ],              
            ],
          ),
        ),
      ),
    );
  }
}

class BtnAction extends StatefulWidget {
  const BtnAction({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
    required this.isGlowing,
  });

  final String text;
  final Color color;
  final VoidCallback? onPressed;
  final bool isGlowing;

  @override
  State<BtnAction> createState() => _BtnActionState();
}

class _BtnActionState extends State<BtnAction> {
  @override
  Widget build(BuildContext ctx) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          boxShadow: widget.isGlowing
              ? [
                  BoxShadow(
                    color: widget.color.withAlpha(150),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 0),
                  ),
                ]
              : [],
        ),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.color,
          ),
          child: Text(widget.text),
        ),
      ),
    );
  }
}

class TblScoreBoard extends StatefulWidget {
  const TblScoreBoard({
    super.key,
    required this.wrong,
    required this.correct,
    required this.total,
    required this.score,
  });

  final int wrong;
  final int correct;
  final int total;
  final String score;

  @override
  State<TblScoreBoard> createState() => _TblScoreBoardState();
}

class _TblScoreBoardState extends State<TblScoreBoard> {
  @override
  Widget build(BuildContext ctx) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 37.0,
            child: Row(
              children: <Widget>[
                const Expanded(
                  flex: 3,
                  child: Text(
                    'Total:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.grey,
                  thickness: 1.0,
                  width: 20.0,
                ),
                Expanded(
                  flex: 3,
                  child: Text('${widget.total}'),
                ),
              ],
            ),
          ),
          Container(
            height: 37.0,
            color: Colors.red.withAlpha(100),
            child: Row(
              children: <Widget>[
                const Expanded(
                  flex: 3,
                  child: Text(
                    'Wrong:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.grey,
                  thickness: 1.0,
                  width: 20.0,
                ),
                Expanded(
                  flex: 3,
                  child: Text('${widget.wrong}'),
                ),
              ],
            ),
          ),
          Container(
            height: 37.0,
            color: Colors.green.withAlpha(100),
            child : Row(
              children: <Widget>[
                const Expanded(
                  flex: 3,
                  child: Text(
                    'Correct:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const VerticalDivider(
                  color: Colors.grey,
                  thickness: 1.0,
                  width: 20.0,
                ),
                Expanded(
                  flex: 3,
                  child: Text('${widget.correct}'),
                ),
              ],
            ),
          ),
          SizedBox (
            height: 37.0,
            child: Row(
            children: <Widget>[
              const Expanded(
                flex: 3,
                child: Text(
                  'Score:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const VerticalDivider(
                color: Colors.grey,
                thickness: 1.0,
                width: 20.0,
              ),
              Expanded(
                flex: 3,
                child: Text(widget.score),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

// --- End of Reused Widgets ---

class PgFlashcardsWidget extends StatefulWidget {
  final bool shuffleCards; // New parameter to control shuffling

  const PgFlashcardsWidget({super.key, this.shuffleCards = false});

  static String routeName = 'pg_flashcards'; // Adjusted route name
  static String routePath = '/PgFlashcards'; // Adjusted route path

  @override
  State<PgFlashcardsWidget> createState() => _PgFlashcardsWidgetState();
}

class _PgFlashcardsWidgetState extends State<PgFlashcardsWidget> {
  final SvcWords _svcWords = SvcWords();
  bool _isLoading = true;
  int _currentIndex = 0;
  bool _isResultButtonsGlowing = false;
  int _showLevel = 0;
  int _totalCount = 0;
  int _correctCount = 0;
  int _incorrectCount = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<MWord> _words = [];
  String _header = 'English Vocabularies - Browse';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadData() async {
    await _svcWords.loadWords();
    _words = _svcWords.getAllWords();

    // Conditionally shuffle the words based on the shuffleCards parameter
    if (widget.shuffleCards) {
      _words.shuffle();
      setState(() {
        _header = 'English Vocabularies - Random';
      });
    } else {
      _words.sort((a, b) => a.word.compareTo(b.word));
    }

    setState(() {
      _isLoading = false;      
    });
  }

  void _showPronunciation() {
    setState(() {
      _showLevel = _showLevel | 1;
     });
  }

  void _showUsage() {
    setState(() {
      _showLevel = _showLevel | 2;
    });
  }

  void _flipCard() {
    setState(() {
      _showLevel = _showLevel | 7;
      _isResultButtonsGlowing = true;
    });
  }

  void _markCorrect() {
    setState(() {
      _totalCount++;
      _correctCount++;
      _showLevel = 0;
      _isResultButtonsGlowing = false;
      _currentIndex = (_currentIndex + 1) % _words.length;
    });
  }

  void _markIncorrect() {
    setState(() {
      _totalCount++;
      _incorrectCount++;
      _showLevel = 0;
      _isResultButtonsGlowing = false;
      _currentIndex = (_currentIndex + 1) % _words.length;
    });
  }

  String get _averagePercentage =>
      _totalCount == 0 ? '0%' : '${((_correctCount / _totalCount) * 100).toStringAsFixed(0)}%';

  @override
  Widget build(BuildContext ctx) {
    final themeSelector = context.watch<ThemeSelector>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(ctx).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: themeSelector.currentTheme.primaryColorLight,
        appBar: AppBar(
          backgroundColor: themeSelector.currentTheme.primaryColor,
          automaticallyImplyLeading: false,
          title: Text(_header,
            style: themeSelector.currentTheme.textTheme.titleSmall?.copyWith(color: Colors.white),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2,
        ),
        endDrawer: const CtrlAppEndDrawer(),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              if (_isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else if (_words.isNotEmpty)
                ...[
                  const SizedBox(height: 10),
                  BtnFlashcard(
                    mword: _words[_currentIndex],
                    showlevel: _showLevel,
                  ),
                  const SizedBox(height: 10),
                  if (_showLevel != 7)
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: ElevatedButton(
                              onPressed: _showPronunciation,
                              child: const Text('Pronounce'),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: ElevatedButton(
                              onPressed: _showUsage,
                              child: const Text('Usage'),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: ElevatedButton(
                              onPressed: _flipCard,
                              child: const Text('Flip'),
                            ),
                          ),
                        )
                      ],
                    ),
                  if(_showLevel == 7)
                    Row(
                      children: <Widget>[
                        BtnAction(
                          text: 'Correct',
                          color: Theme.of(ctx).colorScheme.secondary,
                          onPressed: _isResultButtonsGlowing ? _markCorrect : null,
                          isGlowing: _isResultButtonsGlowing,
                        ),
                        BtnAction(
                          text: 'Wrong',
                          color: Theme.of(ctx).colorScheme.error,
                          onPressed: _isResultButtonsGlowing ? _markIncorrect : null,
                          isGlowing: _isResultButtonsGlowing,
                        ),
                      ],
                    ),
                  TblScoreBoard(wrong: _incorrectCount, correct: _correctCount, total: _totalCount, score: _averagePercentage)
                ],
            ],
          ),
        ),
      ),
    );
  }
}