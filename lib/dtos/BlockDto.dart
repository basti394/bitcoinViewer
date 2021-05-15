import 'package:bitcoin_viewer/dtos/TransaktionDto.dart';

class BlockDto {
  String hash;
  int ver;
  String prevBlock;
  String mrklRoot;
  int time;
  int bits;
  int nonce;
  int nTx;
  int size;
  int blockIndex;
  bool mainChain;
  int height;
  int receivedTime;
  String relayedBy;
  List<TransactionDto> tx;

  BlockDto(
      {this.hash,
        this.ver,
        this.prevBlock,
        this.mrklRoot,
        this.time,
        this.bits,
        this.nonce,
        this.nTx,
        this.size,
        this.blockIndex,
        this.mainChain,
        this.height,
        this.receivedTime,
        this.relayedBy,
        this.tx});

  BlockDto.fromJson(Map<String, dynamic> json) {
    hash = json['hash'];
    ver = json['ver'];
    prevBlock = json['prev_block'];
    mrklRoot = json['mrkl_root'];
    time = json['time'];
    bits = json['bits'];
    nonce = json['nonce'];
    nTx = json['n_tx'];
    size = json['size'];
    blockIndex = json['block_index'];
    mainChain = json['main_chain'];
    height = json['height'];
    receivedTime = json['received_time'];
    relayedBy = json['relayed_by'];
    tx = json['tx'].cast<TransactionDto>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hash'] = this.hash;
    data['ver'] = this.ver;
    data['prev_block'] = this.prevBlock;
    data['mrkl_root'] = this.mrklRoot;
    data['time'] = this.time;
    data['bits'] = this.bits;
    data['nonce'] = this.nonce;
    data['n_tx'] = this.nTx;
    data['size'] = this.size;
    data['block_index'] = this.blockIndex;
    data['main_chain'] = this.mainChain;
    data['height'] = this.height;
    data['received_time'] = this.receivedTime;
    data['relayed_by'] = this.relayedBy;
    data['tx'] = this.tx;
    return data;
  }
}
