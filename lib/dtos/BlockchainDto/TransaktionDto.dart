
class TransactionDto {
  String blockHash;
  int blockHeight;
  String hash;
  List<String> addresses;
  int total;
  int fees;
  int size;
  int vsize;
  String preference;
  String relayedBy;
  String confirmed;
  String received;
  int ver;
  int lockTime;
  bool doubleSpend;
  int vinSz;
  int voutSz;
  int confirmations;
  List<Inputs> inputs;
  List<Outputs> outputs;

  TransactionDto(
      {this.blockHash,
        this.blockHeight,
        this.hash,
        this.addresses,
        this.total,
        this.fees,
        this.size,
        this.vsize,
        this.preference,
        this.relayedBy,
        this.confirmed,
        this.received,
        this.ver,
        this.lockTime,
        this.doubleSpend,
        this.vinSz,
        this.voutSz,
        this.confirmations,
        this.inputs,
        this.outputs});

  TransactionDto.fromJson(Map<String, dynamic> json) {
    blockHash = json['block_hash'];
    blockHeight = json['block_height'];
    hash = json['hash'];
    addresses = json['addresses'].cast<String>();
    total = json['total'];
    fees = json['fees'];
    size = json['size'];
    vsize = json['vsize'];
    preference = json['preference'];
    relayedBy = json['relayed_by'];
    confirmed = json['confirmed'];
    received = json['received'];
    ver = json['ver'];
    lockTime = json['lock_time'];
    doubleSpend = json['double_spend'];
    vinSz = json['vin_sz'];
    voutSz = json['vout_sz'];
    confirmations = json['confirmations'];
    if (json['inputs'] != null) {
      inputs = new List<Inputs>();
      json['inputs'].forEach((v) {
        inputs.add(new Inputs.fromJson(v));
      });
    }
    if (json['outputs'] != null) {
      outputs = new List<Outputs>();
      json['outputs'].forEach((v) {
        outputs.add(new Outputs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['block_hash'] = this.blockHash;
    data['block_height'] = this.blockHeight;
    data['hash'] = this.hash;
    data['addresses'] = this.addresses;
    data['total'] = this.total;
    data['fees'] = this.fees;
    data['size'] = this.size;
    data['vsize'] = this.vsize;
    data['preference'] = this.preference;
    data['relayed_by'] = this.relayedBy;
    data['confirmed'] = this.confirmed;
    data['received'] = this.received;
    data['ver'] = this.ver;
    data['lock_time'] = this.lockTime;
    data['double_spend'] = this.doubleSpend;
    data['vin_sz'] = this.vinSz;
    data['vout_sz'] = this.voutSz;
    data['confirmations'] = this.confirmations;
    if (this.inputs != null) {
      data['inputs'] = this.inputs.map((v) => v.toJson()).toList();
    }
    if (this.outputs != null) {
      data['outputs'] = this.outputs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Inputs {
  String prevHash;
  int outputIndex;
  String script;
  int outputValue;
  int sequence;
  List<String> addresses;
  String scriptType;

  Inputs(
      {this.prevHash,
        this.outputIndex,
        this.script,
        this.outputValue,
        this.sequence,
        this.addresses,
        this.scriptType});

  Inputs.fromJson(Map<String, dynamic> json) {
    prevHash = json['prev_hash'];
    outputIndex = json['output_index'];
    script = json['script'];
    outputValue = json['output_value'];
    sequence = json['sequence'];
    addresses = json['addresses'].cast<String>();
    scriptType = json['script_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prev_hash'] = this.prevHash;
    data['output_index'] = this.outputIndex;
    data['script'] = this.script;
    data['output_value'] = this.outputValue;
    data['sequence'] = this.sequence;
    data['addresses'] = this.addresses;
    data['script_type'] = this.scriptType;
    return data;
  }
}

class Outputs {
  int value;
  String script;
  String spentBy;
  List<String> addresses;
  String scriptType;

  Outputs(
      {this.value, this.script, this.spentBy, this.addresses, this.scriptType});

  Outputs.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    script = json['script'];
    spentBy = json['spent_by'];
    addresses = json['addresses'].cast<String>();
    scriptType = json['script_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['script'] = this.script;
    data['spent_by'] = this.spentBy;
    data['addresses'] = this.addresses;
    data['script_type'] = this.scriptType;
    return data;
  }
}
