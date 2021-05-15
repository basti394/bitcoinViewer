
import 'dart:async';
import 'dart:convert';

import 'package:bitcoin_viewer/dtos/TransaktionDto.dart';
import 'package:bitcoin_viewer/exceptions/BlockNotFoundException.dart';
import 'package:bitcoin_viewer/exceptions/TransactionNotFoundException.dart';
import 'package:bitcoin_viewer/exceptions/UnknownException.dart';
import 'package:http/http.dart' as http;
import 'package:bitcoin_viewer/dtos/BlockDto.dart';

class BlockchainService {

  final Map<String, String> header = {'&cor': 'true'};

  Future<BlockDto> getBlock(String blockHash) async {

    final response = await http.get(
      'https://blockchain.info/rawblock/$blockHash',
      headers: header
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
      'https://blockchain.info/rawtx/$transactionHash',
      headers: header
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
