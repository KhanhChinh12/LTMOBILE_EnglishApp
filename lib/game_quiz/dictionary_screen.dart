import 'package:flutter/material.dart';
import 'package:learning_english/dictionary/api_dictionary.dart';
import 'package:learning_english/dictionary/response_model.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({Key? key}) : super(key: key);

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {

  bool inProgress = false;
  PiyoJrDictionaryModel? responseModel;
  String noDataText = "Start searching in Piyo Jr. dictionary";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                child: AppBar(
                  centerTitle: true,
                  title: Text("Dictionary",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      letterSpacing: 1,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 12),
              _buildSearchWidget(),
              const SizedBox(height: 12),
              if(inProgress)
              const LinearProgressIndicator()
              else if(responseModel != null)
                Expanded(child: _buildResponseWidget())
                else
                _noDataWidget(),
            ],
          ),
        ),
    ));
  }

  _buildResponseWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          responseModel!.word!,
          style: TextStyle(
            color: Colors.limeAccent,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Text(responseModel!.phonetic ?? ""),

        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index){
              return _buildMeaningWidget(
                responseModel!.meanings![index]
              );
            },
            itemCount: responseModel!.meanings!.length,
        ))
      ],
    );
  }

  _buildMeaningWidget(Meanings meanings) {

    String definitionList = "";
    meanings.definitions?.forEach(
      (element) {
        int index = meanings.definitions!.indexOf(element);
        definitionList += "\n${index + 1}.${element.definition}\n";
      },
    );

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meanings.partOfSpeech!,
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 12),
            const Text(
              "Definitions: ",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            Text(definitionList),
            _buildSet("Synonyms", meanings.synonyms),
            _buildSet("Antonyms", meanings.antonyms),
          ],
        ),
      ),
    );
  }

  _buildSet(String title, List<String>? setList) {
    if(setList?.isNotEmpty??false) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title: ",
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 10),
          Text(
            setList!
            .toSet()
            .toString()
            .replaceAll("{", "")
            .replaceAll("}", ""),
          ),

          const SizedBox(height: 10),
        ],
      );
    }else {
      return const SizedBox.shrink();
    }
  }

  _noDataWidget() {
    return SizedBox(
      height: 100,
      child: Center(
        child: Text(
          noDataText, 
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  _buildSearchWidget() {
    return SearchBar(
      hintText: "Search for words here with Piyo Jr",
      onSubmitted: (value) {
        _getMeaningFromApi(value);
      },
    );
  }

  _getMeaningFromApi(String word) async {
    setState(() {
      inProgress = true;
    });

    try{
      responseModel = await API.fetchMeaning(word);
      setState(() {
        
      });
    }catch (e) {
      responseModel = null;
      noDataText = "Couldn't find this meaning";
    }finally {
      setState(() {
        inProgress = false;
      });
    }
  }
}
