class TransactionDto {
  String hash;
  int ver;
  int vinSz;
  int voutSz;
  String lockTime;
  int size;
  String relayedBy;
  int blockHeight;
  String txIndex;
  List<Inputs> inputs;
  List<Out> out;

  TransactionDto(
      {this.hash,
        this.ver,
        this.vinSz,
        this.voutSz,
        this.lockTime,
        this.size,
        this.relayedBy,
        this.blockHeight,
        this.txIndex,
        this.inputs,
        this.out});

  TransactionDto.fromJson(Map<String, dynamic> json) {
    hash = json['hash'];
    ver = json['ver'];
    vinSz = json['vin_sz'];
    voutSz = json['vout_sz'];
    lockTime = json['lock_time'];
    size = json['size'];
    relayedBy = json['relayed_by'];
    blockHeight = json['block_height'];
    txIndex = json['tx_index'];
    if (json['inputs'] != null) {
      inputs = new List<Inputs>();
      json['inputs'].forEach((v) {
        inputs.add(new Inputs.fromJson(v));
      });
    }
    if (json['out'] != null) {
      out = new List<Out>();
      json['out'].forEach((v) {
        out.add(new Out.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hash'] = this.hash;
    data['ver'] = this.ver;
    data['vin_sz'] = this.vinSz;
    data['vout_sz'] = this.voutSz;
    data['lock_time'] = this.lockTime;
    data['size'] = this.size;
    data['relayed_by'] = this.relayedBy;
    data['block_height'] = this.blockHeight;
    data['tx_index'] = this.txIndex;
    if (this.inputs != null) {
      data['inputs'] = this.inputs.map((v) => v.toJson()).toList();
    }
    if (this.out != null) {
      data['out'] = this.out.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Inputs {
  PrevOut prevOut;
  String script;

  Inputs({this.prevOut, this.script});

  Inputs.fromJson(Map<String, dynamic> json) {
    prevOut = json['prev_out'] != null
        ? new PrevOut.fromJson(json['prev_out'])
        : null;
    script = json['script'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.prevOut != null) {
      data['prev_out'] = this.prevOut.toJson();
    }
    data['script'] = this.script;
    return data;
  }
}

class PrevOut {
  String hash;
  String value;
  String txIndex;
  String n;

  PrevOut({this.hash, this.value, this.txIndex, this.n});

  PrevOut.fromJson(Map<String, dynamic> json) {
    hash = json['hash'];
    value = json['value'];
    txIndex = json['tx_index'];
    n = json['n'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hash'] = this.hash;
    data['value'] = this.value;
    data['tx_index'] = this.txIndex;
    data['n'] = this.n;
    return data;
  }
}

class Out {
  String value;
  String hash;
  String script;

  Out({this.value, this.hash, this.script});

  Out.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    hash = json['hash'];
    script = json['script'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['hash'] = this.hash;
    data['script'] = this.script;
    return data;
  }
}
