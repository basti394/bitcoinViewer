
class BlockDto {
  String hash;
  int height;
  String chain;
  int total;
  int fees;
  int size;
  int vsize;
  int ver;
  String time;
  String receivedTime;
  String coinbaseAddr;
  String relayedBy;
  int bits;
  int nonce;
  int nTx;
  String prevBlock;
  String mrklRoot;
  List<String> txids;
  int depth;
  String prevBlockUrl;
  String txUrl;
  String nextTxids;

  BlockDto(
      {this.hash,
        this.height,
        this.chain,
        this.total,
        this.fees,
        this.size,
        this.vsize,
        this.ver,
        this.time,
        this.receivedTime,
        this.coinbaseAddr,
        this.relayedBy,
        this.bits,
        this.nonce,
        this.nTx,
        this.prevBlock,
        this.mrklRoot,
        this.txids,
        this.depth,
        this.prevBlockUrl,
        this.txUrl,
        this.nextTxids});

  BlockDto.fromJson(Map<String, dynamic> json) {
    hash = json['hash'];
    height = json['height'];
    chain = json['chain'];
    total = json['total'];
    fees = json['fees'];
    size = json['size'];
    vsize = json['vsize'];
    ver = json['ver'];
    time = json['time'];
    receivedTime = json['received_time'];
    coinbaseAddr = json['coinbase_addr'];
    relayedBy = json['relayed_by'];
    bits = json['bits'];
    nonce = json['nonce'];
    nTx = json['n_tx'];
    prevBlock = json['prev_block'];
    mrklRoot = json['mrkl_root'];
    txids = json['txids'].cast<String>();
    depth = json['depth'];
    prevBlockUrl = json['prev_block_url'];
    txUrl = json['tx_url'];
    nextTxids = json['next_txids'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hash'] = this.hash;
    data['height'] = this.height;
    data['chain'] = this.chain;
    data['total'] = this.total;
    data['fees'] = this.fees;
    data['size'] = this.size;
    data['vsize'] = this.vsize;
    data['ver'] = this.ver;
    data['time'] = this.time;
    data['received_time'] = this.receivedTime;
    data['coinbase_addr'] = this.coinbaseAddr;
    data['relayed_by'] = this.relayedBy;
    data['bits'] = this.bits;
    data['nonce'] = this.nonce;
    data['n_tx'] = this.nTx;
    data['prev_block'] = this.prevBlock;
    data['mrkl_root'] = this.mrklRoot;
    data['txids'] = this.txids;
    data['depth'] = this.depth;
    data['prev_block_url'] = this.prevBlockUrl;
    data['tx_url'] = this.txUrl;
    data['next_txids'] = this.nextTxids;
    return data;
  }
}
