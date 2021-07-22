import 'package:flutter/material.dart';
import 'package:movieboss/Controller/MovieSearchControllers.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MovieSearchController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Searching')));
                  Provider.of<MovieSearchController>(context, listen: false)
                      .getMovieResult(context, _searchController.text);
                },
                decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        if (_searchController.text.length <= 4) {
                          print('enter 5 char');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Searching')));
                          FocusScope.of(context).unfocus();
                          Provider.of<MovieSearchController>(context,
                                  listen: false)
                              .getMovieResult(context, _searchController.text);
                        }
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    hintText: 'Search for movies',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    )),
                controller: _searchController,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            provider.movieResults == null
                ? Center(
                    child: Text('Perform a search'),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: ListView.builder(
                        itemCount: provider.movieResults!.d!.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var data = provider.movieResults!.d![index];
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            margin: EdgeInsets.symmetric(
                              vertical: 5.0,
                            ),
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 10.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.0,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 200,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(data
                                                    .i!.imageUrl
                                                    .toString()))),
                                        child: Container(),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(
                                        data.l.toString(),
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(
                                        data.s.toString(),
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15.0,
                                        vertical: 5.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: data.rank! < 1000
                                            ? Colors.blue[700]
                                            : Colors.green,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        '${data.rank.toString()}  IMDB',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      )),
    );
  }
}
