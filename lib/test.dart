
import 'package:bitcoin_viewer/dtos/BlockDto.dart';
import 'package:bitcoin_viewer/service/blockchain_service.dart';
import 'package:flutter/cupertino.dart';

class Test extends StatefulWidget {
  const Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  
  Future<BlockDto> _block;
  
  @override
  void initState() {
    super.initState();
    this._block = new BlockchainService().getBlock('00000000000000000004da2a1f5e8ff0eae5fca8db318f7d7961ccc5ce17d723');
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _block,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: Text(snapshot.data.nonce),
          );
        }
        if (snapshot.hasError) {
          print(snapshot.error);
          return Container(
            child: Text('FEHLER'),
          );
        }
        return Container(
          child: Text('lädt'),
        );
      },
    );
  }
}
