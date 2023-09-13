class ImageResponseModel {
  List<Data>? data;

  ImageResponseModel({this.data});

  ImageResponseModel.fromJson(List<dynamic> json) {
    List<Data> modulesList = [];
    json.forEach((element) {
      modulesList.add(Data.fromJson(element));
    });
    data = modulesList;
  }

  List<Map<String, dynamic>> toJson() {
    final List<Map<String, dynamic>> dataList = [];
    data!.forEach((element) {
      dataList.add(element.toJson());
    });
    return dataList;
    // final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.data != null) {
    //   data['data'] = this.data!.map((v) => v.toJson()).toList();
    // }
    // return data;
  }
}

class Data {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Data({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Data.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}
