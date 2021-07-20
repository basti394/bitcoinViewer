import 'package:bitcoin_viewer/dtos/BlockchainDto/TransaktionDto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchTransactionComponent extends StatelessWidget {

  final TransactionDto transactionDto;
  final VoidCallback searchWallet;


  final double widthFactor = 0.9;
  final double labelSize = 19;
  final double dataSize = 16;

  SearchTransactionComponent({
    @required
    this.transactionDto,
    this.searchWallet
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
                  'Hash',
                  style: TextStyle(
                      fontSize: labelSize,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * (widthFactor / 2),
                  child: Text(
                    transactionDto.hash,
                    style: TextStyle(
                        fontSize: dataSize
                    ),
                  )
              ),
            ],
          ),
          SizedBox(height: 7),
          Divider(
            height: 1,
            thickness: 0.5,
            color: Colors.grey,
          ),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                child:
                Text(
                  'Datum',
                  style: TextStyle(
                      fontSize: labelSize,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * (widthFactor / 2),
                  child: Text(
                    DateFormat.yMMMd().add_jm().format(DateTime.parse(transactionDto.confirmed)),
                    style: TextStyle(
                        fontSize: dataSize
                    ),
                  )
              ),
            ],
          ),
          SizedBox(height: 7),
          Divider(
            height: 1,
            thickness: 0.5,
            color: Colors.grey,
          ),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                child:
                Text(
                  'Von',
                  style: TextStyle(
                      fontSize: labelSize,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * (widthFactor / 2),
                child: Column(

                )
              ),
            ],
          ),
          SizedBox(height: 7),
          Divider(
            height: 1,
            thickness: 0.5,
            color: Colors.grey,
          ),
          SizedBox(height: 7),

        ]
      ),
    );
  }
}
