import 'package:bitcoin_viewer/dtos/BlockchainDto/BlockDto.dart';
import 'package:bitcoin_viewer/dtos/BlockchainDto/BlockDto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class SearchBlockComponent extends StatelessWidget {

  final BlockDto blockDto;
  final VoidCallback searchPreviousBlock;

  final double widthFactor = 0.9;
  final double labelSize = 19;
  final double dataSize = 16;

  final double dividerDistance = 9;

  SearchBlockComponent({
    @required
    this.blockDto,
    this.searchPreviousBlock
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: dataTable(context)
        ),
      ],
    );
  }

  Widget dataTable(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * widthFactor,
      height: MediaQuery.of(context).size.height * 0.65,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                child:
                Text(
                  'Height',
                  style: TextStyle(
                      fontSize: labelSize,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * (widthFactor / 2),
                  child: Text(
                    blockDto.height.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                    style: TextStyle(
                        fontSize: dataSize
                    ),
                  )
              ),
            ],
          ),
          divider(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.green,
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                child:
                Text(
                  'Hash',
                  style: TextStyle(
                      fontSize: labelSize,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
               GestureDetector(
                  onTap: () => {
                    Fluttertoast.showToast(
                      msg: 'Kopiert',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                    ),
                    Clipboard.setData(ClipboardData(text: blockDto.hash))
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * (widthFactor / 2),
                    child: Text(
                      this.blockDto.hash,
                      style: TextStyle(
                        fontSize: dataSize,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
               )
            ],
          ),
          divider(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.green,
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                child:
                Text(
                  'Vorheriger Block',
                  style: TextStyle(
                      fontSize: labelSize,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              GestureDetector(
                onTap: this.searchPreviousBlock,
                child: Container(
                  width: MediaQuery.of(context).size.width * (widthFactor / 2),
                  // color: Colors.red,
                  child: Text(
                    blockDto.prevBlock,
                    style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 16,
                        decoration: TextDecoration.underline
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )

            ],
          ),
          divider(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.green,
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                child:
                Text(
                  'Volumen',
                  style: TextStyle(
                      fontSize: labelSize,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                // color: Colors.red,
                child: Text(
                  (blockDto.total / 100000000).toString() + ' BTC',
                  style: TextStyle(
                      fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          divider(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.green,
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                child:
                Text(
                  'Gesamte Gebühren',
                  style: TextStyle(
                      fontSize: labelSize,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                // color: Colors.red,
                child: Text(
                  (blockDto.fees / 100000000).toString() + ' BTC',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          divider(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.green,
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                child:
                Text(
                  'Zeitstempel',
                  style: TextStyle(
                      fontSize: labelSize,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                // color: Colors.red,
                child: Text(
                  DateFormat.yMMMd().add_jm().format(DateTime.parse(blockDto.time)),
                  style: TextStyle(
                    fontSize: dataSize,
                  ),
                ),
              ),
            ],
          ),
          divider(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.green,
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                child:
                Text(
                  'Anzahl der Transaktionen',
                  style: TextStyle(
                      fontSize: labelSize,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Fluttertoast.showToast(
                  msg: 'Not implemented yet',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * (widthFactor / 2),
                  // color: Colors.red,
                  child: Text(
                    blockDto.nTx.toString(),
                    style: TextStyle(
                        color: Colors.indigo,
                        fontSize: dataSize,
                        decoration: TextDecoration.underline
                    ),
                  ),
                ),
              )
            ],
          ),
          divider(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.green,
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                child:
                Text(
                  'Nonce',
                  style: TextStyle(
                      fontSize: labelSize,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                // color: Colors.red,
                child: Text(
                  blockDto.nonce.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                  style: TextStyle(
                    fontSize: dataSize,
                  ),
                ),
              ),
            ],
          ),
          divider(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.green,
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                child:
                Text(
                  'Size',
                  style: TextStyle(
                      fontSize: labelSize,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                // color: Colors.red,
                child: Text(
                  blockDto.size.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},') + ' Bytes',
                  style: TextStyle(
                    fontSize: dataSize,
                  ),
                ),
              ),
            ],
          ),
          divider(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.green,
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                child:
                Text(
                  'Bits',
                  style: TextStyle(
                      fontSize: labelSize,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                // color: Colors.red,
                child: Text(
                  blockDto.bits.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'),
                  style: TextStyle(
                    fontSize: dataSize,
                  ),
                ),
              ),
            ],
          ),
          divider(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.green,
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                child:
                Text(
                  'Chain',
                  style: TextStyle(
                      fontSize: labelSize,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                // color: Colors.red,
                child: Text(
                  blockDto.chain,
                  style: TextStyle(
                    fontSize: dataSize,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget divider(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: dividerDistance),
        Divider(
          height: 1,
          thickness: 0.5,
          color: Colors.grey,
        ),
        SizedBox(height: dividerDistance),
      ],
    );
  }
}


