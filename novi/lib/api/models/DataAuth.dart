class DataAuth {
  DataAuth({
      this.status, 
      this.name, 
      this.refresh, 
      this.access, 
      this.message, 
      this.urlId,});

  DataAuth.fromJson(dynamic json) {
    status = json['status'];
    name = json['name'];
    refresh = json['refresh'];
    access = json['access'];
    message = json['message'];
    urlId = json['url_id'];
  }
  bool? status;
  String? name;
  String? refresh;
  String? access;
  String? message;
  String? urlId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['name'] = name;
    map['refresh'] = refresh;
    map['access'] = access;
    map['message'] = message;
    map['url_id'] = urlId;
    return map;
  }

}



class DataTokenRefresh {
  DataTokenRefresh({
    this.refresh,
    this.access,});

  DataTokenRefresh.fromJson(dynamic json) {
    refresh = json['refresh'];
    access = json['access'];
  }
  String? refresh;
  String? access;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refresh'] = refresh;
    map['access'] = access;
    return map;
  }

}