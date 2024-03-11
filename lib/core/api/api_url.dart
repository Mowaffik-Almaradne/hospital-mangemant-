//! api url generator
//! like base url , path , query
class ApiUrl {
  late String _link;
  final String baseUrl = "";

  ApiUrl(this._link);

  getLink() {
    // print('Http request : $_link');

    return Uri.parse(baseUrl + _link);
  }

  ApiUrl getQuery(Map<String, dynamic> query) {
    _link += '?';
    for (int i = 0; i < query.length; i++) {
      String key = query.keys.elementAt(i); // kays
      var value = query.values.elementAt(i); // values

      if (value is List) {
        for (int i = 0; i < value.length; i++) {
          var it = value.elementAt(i); 

          _link += '$key=$it';
          if (i < value.length - 1) {
            _link += '&';
          }
        }
      } else {
        _link += '$key=$value';
      }

      if (i != query.length - 1) _link += '&';
    }
    return this;
  }

  String getListAsQuery(List list) {
    String q = '';

    for (int i = 0; i < list.length; i++) {
      var it = list.elementAt(i);

      if (i < list.length - 1) {
        q += '$it;';
      } else {
        q += it.toString();
      }
    }

    return q;
  }

  //?this method
  //? make the link as a api required path
  //? only the unique path key can replaced
  ApiUrl getPath(Map<String, dynamic> path) {
    path.forEach((key, value) {
      _link = _link.replaceAll(key, value.toString());
    });
    return this;
  }
}
