import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:learning_english/utils/wordle_color.dart';
import 'package:learning_english/wordle/data_wordle/word_list.dart';
import 'package:learning_english/wordle/models_wordle/letter_model.dart';
import 'package:learning_english/wordle/models_wordle/word_model.dart';
import 'package:learning_english/wordle/widgets_wordle/board_wordle.dart';
import 'package:learning_english/wordle/widgets_wordle/keyboard_wordle.dart';

enum GameStatus {playing, submitting, lost, won}

class WordleScreen extends StatefulWidget {
  const WordleScreen({Key? key}) : super(key: key);

  @override
  State<WordleScreen> createState() => _WordleScreenState();
}

class _WordleScreenState extends State<WordleScreen> {

  GameStatus _gameStatus = GameStatus.playing;

  final List<Word> _board = List.generate(
    6, 
    (_) => Word(letters: List.generate(5, (_) => Letter.empty())),
  );


  final List<List<GlobalKey<FlipCardState>>> _flipCardKeys = List.generate(
    6, 
    (_) => List.generate(5, (_) => GlobalKey<FlipCardState>()),
  );

  int _currentWordIndex = 0;

  Word? get _currentWord =>
    _currentWordIndex < _board.length ? _board[_currentWordIndex] : null;

  Word _solution = Word.fromString(
    fiveLetterWords[Random().nextInt(fiveLetterWords.length)].toUpperCase(),
  );

  final Set<Letter> _keyboardLetters = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Wordle Game",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),

      backgroundColor: const Color.fromARGB(255, 133, 99, 87),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BoardWordle(board: _board, flipCardKeys: _flipCardKeys),
          const SizedBox(height: 80),
          Keyboard(
            onKeyTapped: _onKeyTapped, 
            onDeleteTapped: _onDeleteTapped, 
            onEnterTapped: _onEnterTapped,
            letters: _keyboardLetters,
          ),
        ],
      ),
    );
  }

  void _onKeyTapped(String val){
    if(_gameStatus == GameStatus.playing) {
      setState(() => _currentWord?.addLetter(val));
    }
  }

  void _onDeleteTapped() {
    if(_gameStatus == GameStatus.playing) {
      setState(() => _currentWord?.removeLetter());
    }
  }

  Future<void> _onEnterTapped() async {
    if(_gameStatus == GameStatus.playing &&
        _currentWord != null &&
        !_currentWord!.letters.contains(Letter.empty())){
          _gameStatus = GameStatus.submitting;

          for(var i = 0; i < _currentWord!.letters.length; i++){
            final currentWordLetter = _currentWord!.letters[i];
            final currentSolutionLetter = _solution.letters[i];

            setState(() {
              if(currentWordLetter == currentSolutionLetter) {
                _currentWord!.letters[i] = 
                  currentWordLetter.copyWith(status: LetterStatus.correct);
              }else if(_solution.letters.contains(currentWordLetter)){
                _currentWord!.letters[i] = 
                  currentWordLetter.copyWith(status: LetterStatus.inWord);
              }else {
                _currentWord!.letters[i] = 
                  currentWordLetter.copyWith(status: LetterStatus.notInWord);
              }
            });

            final letter = _keyboardLetters.firstWhere(
              (e) => e.val == currentWordLetter.val,
              orElse: () => Letter.empty(),
            );
            if(letter.status != LetterStatus.correct) {
              _keyboardLetters.removeWhere((e) => e.val == currentWordLetter.val);
              _keyboardLetters.add(_currentWord!.letters[i]);
            }

            await Future.delayed(
              const Duration(milliseconds: 150),
              () => _flipCardKeys[_currentWordIndex] [i].currentState?.toggleCard(),
            );
          }

          _checkIfWinOrLoss();
        }
  }
  
  void _checkIfWinOrLoss() {
    if(_currentWord!.wordString == _solution.wordString) {
      _gameStatus = GameStatus.won;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.none,
          duration: const Duration(days: 1),
          backgroundColor: correctColor,
          content: const Text(
            'You won!',
            style: TextStyle(color: Colors.white),
          ),
          action: SnackBarAction(
            onPressed: _restart,
            textColor: Colors.white,
            label: 'New Game',
          ),
        ),
      );
    }else if(_currentWordIndex + 1 >= _board.length) {
      _gameStatus = GameStatus.lost;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          dismissDirection: DismissDirection.none,
          duration: const Duration(days: 1),
          backgroundColor: Colors.redAccent[200],
          content: Text(
            'You lost! Solution: ${_solution.wordString}',
            style: const TextStyle(color: Colors.white),
          ),
          action: SnackBarAction(
            onPressed: _restart,
            textColor: Colors.white,
            label: 'New Game',
          ),
        ),
      );
    }else {
      _gameStatus = GameStatus.playing;
    }
    _currentWordIndex += 1;
  }

  void _restart() {
    setState(() {
      _gameStatus = GameStatus.playing;
      _currentWordIndex = 0;
      _board
        ..clear()
        ..addAll(
          List.generate(
            6, 
            (_) => Word(
              letters: List.generate(5, (_) => Letter.empty())),
          ),
        );
      _solution = Word.fromString(
        fiveLetterWords[Random().nextInt(fiveLetterWords.length)].toUpperCase(),
      );

      _flipCardKeys
        ..clear()
        ..addAll(
          List.generate(
            6, 
            (_) => List.generate(5, (_) => GlobalKey<FlipCardState>()),
          ),
        );

      _keyboardLetters.clear();
    });
  }
}