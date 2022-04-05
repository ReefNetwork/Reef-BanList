class Ban {
  int id;
  String reason;
  int ipBan;
  int deviceBan;
  String createTime;
  String expireTime;
  String xuid;
  String name;
  String byXuid;
  String byName;

//<editor-fold desc="Data Methods">

  Ban({
    required this.id,
    required this.reason,
    required this.ipBan,
    required this.deviceBan,
    required this.createTime,
    required this.expireTime,
    required this.xuid,
    required this.name,
    required this.byXuid,
    required this.byName,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ban &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          reason == other.reason &&
          ipBan == other.ipBan &&
          deviceBan == other.deviceBan &&
          createTime == other.createTime &&
          expireTime == other.expireTime &&
          xuid == other.xuid &&
          name == other.name &&
          byXuid == other.byXuid &&
          byName == other.byName);

  @override
  int get hashCode =>
      id.hashCode ^
      reason.hashCode ^
      ipBan.hashCode ^
      deviceBan.hashCode ^
      createTime.hashCode ^
      expireTime.hashCode ^
      xuid.hashCode ^
      name.hashCode ^
      byXuid.hashCode ^
      byName.hashCode;

  @override
  String toString() {
    return 'Ban{' +
        ' id: $id,' +
        ' reason: $reason,' +
        ' ipBan: $ipBan,' +
        ' deviceBan: $deviceBan,' +
        ' createTime: $createTime,' +
        ' expireTime: $expireTime,' +
        ' xuid: $xuid,' +
        ' name: $name,' +
        ' byXuid: $byXuid,' +
        ' byName: $byName,' +
        '}';
  }

  Ban copyWith({
    int? id,
    String? reason,
    int? ipBan,
    int? deviceBan,
    String? createTime,
    String? expireTime,
    String? xuid,
    String? name,
    String? byXuid,
    String? byName,
  }) {
    return Ban(
      id: id ?? this.id,
      reason: reason ?? this.reason,
      ipBan: ipBan ?? this.ipBan,
      deviceBan: deviceBan ?? this.deviceBan,
      createTime: createTime ?? this.createTime,
      expireTime: expireTime ?? this.expireTime,
      xuid: xuid ?? this.xuid,
      name: name ?? this.name,
      byXuid: byXuid ?? this.byXuid,
      byName: byName ?? this.byName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'reason': this.reason,
      'ipBan': this.ipBan,
      'deviceBan': this.deviceBan,
      'createTime': this.createTime,
      'expireTime': this.expireTime,
      'xuid': this.xuid,
      'name': this.name,
      'byXuid': this.byXuid,
      'byName': this.byName,
    };
  }

  factory Ban.fromMap(Map<String, dynamic> map) {
    return Ban(
      id: map['id'] as int,
      reason: map['reason'] as String,
      ipBan: map['ipBan'] as int,
      deviceBan: map['deviceBan'] as int,
      createTime: map['createTime'] as String,
      expireTime: map['expireTime'] as String,
      xuid: map['xuid'] as String,
      name: map['name'] as String,
      byXuid: map['byXuid'] as String,
      byName: map['byName'] as String,
    );
  }

//</editor-fold>
}
