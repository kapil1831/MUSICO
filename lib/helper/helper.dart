import "dart:convert";
import 'dart:math';
//import 'package:convert/convert.dart';
import 'package:dart_des/dart_des.dart';
import 'package:dart_des/des_padding.dart';
import 'package:musico/helper/endpoints.dart';
import 'package:http/http.dart';
import 'package:musico/helper/format.dart';

Future<List<SongData>> search_song(query) async {
  if (query == "") {
    return <SongData>[];
  }
  print("search song");
  String search_song_base_url = search_base_url + query;
  var res = await get(Uri.parse(search_song_base_url));
  if (res.statusCode > 299) {
    return <SongData>[];
  }
  var song_res = jsonDecode(res.body);
  //print(song_res);

  song_res = song_res['songs']!['data'];
  var songs = <SongData>[];
  for (var song in song_res) {
    String id = song['id'];
    SongData? song_data = await get_song(id);
    if (song_data != null) {
      songs.add(song_data);
    }
  }
  return songs;
}

dynamic get_song(String id) async {
  try {
    print("get song");
    String song_data_base_url = song_detail_base_url + id;
    var res = await get(Uri.parse(song_data_base_url));
    if (res.statusCode > 299) {
      print("statuscode > 299");
      return {};
    }

    var song_res = jsonDecode(res.body);
    // print(song_res);
    //  print(song_res["encrypted_media_url"]); //encrypted_media_url
    SongData song_data = format_song_data(song_res[id]);
    //var song_data = song_res[id]["encrypted_media_url"].toString();

    return song_data;
  } catch (e) {
    print(e);

    return null;
  }
}

search_song_details(id) {}

decrypt_url(String url) {
  print(url);
  DES desCipher = DES(
      key: "38346591".codeUnits,
      mode: DESMode.ECB,
      paddingType: DESPaddingType.PKCS5);

  var enc_url = base64Decode(url.trim());

  var dec_url = utf8.decode(desCipher.decrypt(enc_url));
  print("decrypt url");
  dec_url = dec_url.toString().replaceAll("_96.mp4", "_320.mp4");
  //print(dec_url);
  return dec_url;
}
