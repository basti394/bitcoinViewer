
import 'dart:async';
import 'dart:convert';

import 'package:bitcoin_viewer/dtos/BlockchainDto/BlockDto.dart';
import 'package:bitcoin_viewer/dtos/BlockchainDto/TransaktionDto.dart';
import 'package:bitcoin_viewer/exceptions/BlockNotFoundException.dart';
import 'package:bitcoin_viewer/exceptions/TransactionNotFoundException.dart';
import 'package:bitcoin_viewer/exceptions/UnknownException.dart';
import 'package:http/http.dart' as http;
import 'package:bitcoin_viewer/dtos/BlockchainDto/BlockDto.dart';

class BlockchainService {

  Future<BlockDto> getBlock(String blockHash) async {

    final response = await http.get(
      'https://api.blockcypher.com/v1/btc/main/blocks/$blockHash'
    );

    switch (response.statusCode) {
      case 200 :
        final decodedJson = json.decode(response.body);
        return BlockDto.fromJson(decodedJson);
      case 404 :
        throw BlockNotFoundException();
      default :
        print(response.statusCode);
        throw UnknownException();
    }
  }


  Future<TransactionDto> getTransaktion(String transactionHash) async {

    final response = await http.get(
      'https://api.blockcypher.com/v1/btc/main/txs/$transactionHash',
    );

    switch (response.statusCode) {
      case 200 :
        final decodedJson = json.decode(response.body);
        return TransactionDto.fromJson(decodedJson);
      case 404 :
        throw TransactionNotFoundException();
      default :
        throw UnknownException();
    }
  }
}
