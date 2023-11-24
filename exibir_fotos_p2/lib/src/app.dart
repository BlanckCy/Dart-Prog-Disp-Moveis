import 'package:flutter/material.dart';
import 'api.dart';

class App extends StatefulWidget {
  @override
  _ImageScreen createState() => _ImageScreen();
}

class _ImageScreen extends State<App> {
  List<String> imageUrls = [];
  String errorMessage = '';

  Future<void> fetchCatImage() async {
    final List<String?> urls = await Api.fetchCatImages();

    setState(() {
      if (urls.isEmpty) {
        errorMessage = 'Erro ao obter imagens. Clique novamente no botão.';
      } else {
        imageUrls.addAll(urls.where((url) => url != null).cast<String>());
        errorMessage = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exibir Imagens',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Os Mais Belos Gatos'),
          backgroundColor: const Color.fromARGB(255, 2, 84, 109),
          leading: Icon(Icons.pets),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color.fromARGB(255, 190, 210, 244)),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 8.0),
              if (imageUrls.isNotEmpty)
                Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Image.network(
                          imageUrls[index],
                          fit: BoxFit.cover,
                          height: 300,
                        ),
                      );
                    },
                  ),
                ),
              if (errorMessage.isNotEmpty)
                Container(
                  color: Colors.red,
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              SizedBox(height: 8.0),
              Expanded(
                child: Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        errorMessage = '';
                      });
                      fetchCatImage();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 2, 84, 109),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    icon: Icon(Icons.pets),
                    label: Text("Exibir Novas Imagens"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
