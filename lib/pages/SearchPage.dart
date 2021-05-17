
import 'package:bitcoin_viewer/components/searcher.dart';
import 'package:bitcoin_viewer/services/BlockchainService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final TextEditingController _controller = new TextEditingController();
  BlockchainService _blockchainService;
  var test;

  @override
  void initState() {
    super.initState();

    this._blockchainService = new BlockchainService();
  }

  void search(String input) {

    print(input.substring(0, 5));

    if (input.substring(0, 5) == "00000") {
      this._blockchainService.getBlock(input).then((value) => {
        setState(() {
          this.test = value;
        }),
      });
      return;
    }

    this._blockchainService.getTransaktion(input).then((value) => {
      setState(() {
        this.test = value;
      }),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        searcher(context),
        SizedBox(height: 20),
        result(context)
      ],
    );
  }

  Widget searcher(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      height: 60.0,
      child: TextField(
        controller: _controller,
        onChanged: (input) => setState(() {}),
        onSubmitted: (input) => this.search(input),
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'OpenSans',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          suffixIcon: _controller.text.length > 0
            ? IconButton(
                icon: Icon(
                  Icons.close
                ),
                color: Colors.black,
                onPressed: () {
                  setState(() {
                    _controller.clear();
                  });
                }
              )
            : null,
          hintText: 'Suche eine Transaktion oder einen Block',
        ),
      ),
    );
  }

  Widget result(BuildContext context) {
    return Container(
      child: test == null
        ? Text('Test')
        : Text('Test2')
    );
  }
}
