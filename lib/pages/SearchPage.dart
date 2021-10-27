
import 'package:barcode_widget/barcode_widget.dart';
import 'package:bitcoin_viewer/components/Buttons/QuadraticButton.dart';
import 'package:bitcoin_viewer/components/SearchComponents/SearchTransactionComponent.dart';
import 'package:bitcoin_viewer/dtos/BlockchainDto/BlockDto.dart';
import 'package:bitcoin_viewer/exceptions/BlockNotFoundException.dart';
import 'package:bitcoin_viewer/exceptions/TransactionNotFoundException.dart';
import 'package:bitcoin_viewer/pages/ScannerPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bitcoin_viewer/components/SearchComponents/SearchBlockComponent.dart';
import 'package:bitcoin_viewer/dtos/BlockchainDto/BlockDto.dart';
import 'package:bitcoin_viewer/dtos/BlockchainDto/TransaktionDto.dart';
import 'package:bitcoin_viewer/services/BlockchainService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final TextEditingController _controller = new TextEditingController();
  String input;
  BlockchainService _blockchainService;
  BlockDto blockDto;
  TransactionDto transactionDto;
  final double widthFactor = 0.9;
  final double heightFactor = 0.65;
  var redrawObject;

  @override
  void initState() {
    super.initState();

    this._blockchainService = new BlockchainService();
  }

  void setInput(String newInput) {
    setState(() {
      redrawObject = Object();
      this.input = newInput;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        searchTile(context),
        SizedBox(height: 30),
        result(context),
        input != null ? toolBar(context) : Container()
      ],
    );
  }

  Widget searchTile(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 15.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      height: 60.0,
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _controller,
              onChanged: (input) => setState(() {}),
              onSubmitted: (input) => setInput(input),
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: 'Suche Block oder Transaktion',
              ),
            ),
          ),
          _controller.text.length > 0
              ? IconButton(
              icon: Icon(
                  Icons.close
              ),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _controller.clear();
                  this.blockDto = null;
                });
              }
          )
              : IconButton(
              icon: Icon(
                  Icons.qr_code_scanner
              ),
              color: Colors.white,
              onPressed: () async {

                var status = await Permission.camera.status;

                if (status.isDenied) {
                  Permission.camera.request();
                }

                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Scanner())
                );

                if (result != null) {
                  print('$result');
                  setState(() {
                    this.setInput(result);
                  });
                }
              }
          ),
        ],
      ),
    );
  }

  Widget result(BuildContext context) {
    if (input != null) {
      if (input.substring(0, 5) == "00000") {
        return FutureBuilder(
          key: ValueKey<Object>(redrawObject),
          future: _blockchainService.getBlock(input),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              this.blockDto = snapshot.data;
              return SearchBlockComponent(blockDto: this.blockDto, searchPreviousBlock: () => setInput(this.blockDto.prevBlock));
            }
            if (snapshot.hasError) {
              return Center(
                  child: Text('Es gibt keinen Block mit diesem Hash!')
              );
            }
            return Container(
              height: MediaQuery.of(context).size.height * heightFactor,
              width: MediaQuery.of(context).size.width * widthFactor,
              child: Center(
                child: Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo)),
                ),
              )
            );
          }
        );
      }

      return FutureBuilder(
        future: _blockchainService.getTransaktion(input),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            this.transactionDto = snapshot.data;
            return SearchTransactionComponent(transactionDto: this.transactionDto, searchWallet: () => print('Not implemented yet'));
          }
          if (snapshot.hasError) {
            return Center(
                child: Text('Es gibt keine Transaktion mit diesem Hash!')
            );
          }
          return Container(
              height: MediaQuery.of(context).size.height * heightFactor,
              width: MediaQuery.of(context).size.width * widthFactor,
              child: Center(
                child: Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo)),
                ),
              )
          );
        }
      );
    }
    return Container();
  }

  Widget toolBar(BuildContext context) {
    if (this.transactionDto != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          qrCodeButton(context),
          shareButton(context),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        prevBlockButton(context),
        qrCodeButton(context),
        shareButton(context),
      ],
    );
  }
  
  Widget shareButton(BuildContext context) {
    return QuadraticButton(Icon(Icons.share, color: Colors.white), () => Share.share(this.blockDto == null ? 'https://www.blockchain.com/btc/tx/${this.transactionDto.hash}' : 'https://www.blockchain.com/btc/block/${this.blockDto.hash}'));
  }

  Widget qrCodeButton(BuildContext context) {
    return QuadraticButton(Icon(Icons.qr_code_outlined, color: Colors.white), () => showBottomSheet());
  }

  Future<void> showBottomSheet() {
    return showModalBottomSheet(context: context, builder: (BuildContext context) { return bottomSheet(context); }, enableDrag: true);
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 500,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           Container(
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100))
              ),
            ),
            SizedBox(height: 50),
            Container(
              height: 250,
              width: 250,
              child: BarcodeWidget(
                data: this.blockDto == null ? this.transactionDto.hash : this.blockDto.hash,
                barcode: Barcode.qrCode(),
                color: Colors.black,
              ),
            ),
            SizedBox(height: 50),
            Text('Zum teilen QR-Code scannen', style: TextStyle(color: Colors.white),)
          ],
        )
      ),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
      ),
    );
  }

  Widget prevBlockButton(BuildContext context) {
    return QuadraticButton(Icon(Icons.arrow_back_ios_outlined, color: Colors.white), () => this.setInput(blockDto.prevBlock));
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}



