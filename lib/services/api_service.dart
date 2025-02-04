import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiServiceRegisterSiswa {
  final String baseUrl = 'https://ukk-p2.smktelkom-mlg.sch.id/api/';

  Future<bool> registerStudent({
    required String namaSiswa,
    required String alamat,
    required String telp,
    required String username,
    required String password,
    File? foto,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${baseUrl}register_siswa'),
    );

    // Tambahkan header makerID
    request.headers['makerID'] = '35';

    // Tambahkan data siswa
    request.fields['nama_siswa'] = namaSiswa;
    request.fields['alamat'] = alamat;
    request.fields['telp'] = telp;
    request.fields['username'] = username;
    request.fields['password'] = password;

    // Tambahkan file foto (jika ada)
    if (foto != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'foto',
        foto.path,
      ));
    }

    try {
      // Kirim permintaan
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        print('Response Body: $responseBody');
        return true;
      } else {
        var responseBody = await response.stream.bytesToString();
        print('Error: ${response.statusCode} - $responseBody');
        return false;
      }
    } catch (e) {
      print('Exception occurred: $e');
      return false;
    }
  }
}

class ApiServiceRegisterStand {
  final String baseUrl = 'https://ukk-p2.smktelkom-mlg.sch.id/api/';

  Future<bool> registerStand({
    required String namaStan,
    required String namaPemilik,
    required String telp,
    required String username,
    required String password,
  }) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${baseUrl}register_stan'),
    );

    request.headers['makerID'] = '35';

    request.fields['nama_stan'] = namaStan;
    request.fields['nama_pemilik'] = namaPemilik;
    request.fields['telp'] = telp;
    request.fields['username'] = username;
    request.fields['password'] = password;

    try {
      // Kirim permintaan
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        print('Response Body: $responseBody');
        return true;
      } else {
        var responseBody = await response.stream.bytesToString();
        print('Error: ${response.statusCode} - $responseBody');
        return false;
      }
    } catch (e) {
      print('Exception occurred: $e');
      return false;
    }
  }
}

class ApiServiceLoginSiswa {
  final String baseUrlCantin = 'https://ukk-p2.smktelkom-mlg.sch.id/api/';

  Future<bool> loginSiswa({
    required String username,
    required String password,
  }) async {
    var url = Uri.parse('${baseUrlCantin}login_siswa');
    var headers = {
      'Content-Type': 'application/json',
      'makerID': '35',
    };
    var body = jsonEncode({
      'username': username,
      'password': password,
    });

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print('Login Successful: ${responseData.toString()}');
        return true;
      } else {
        print('Login Failed: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      print('Exception occurred: $e');
      return false;
    }
  }
}

class ApiServiceLoginStand {
  final String baseUrlCantin = 'https://ukk-p2.smktelkom-mlg.sch.id/api/';

  Future<bool> loginStand({
    required String username,
    required String password,
  }) async {
    var url = Uri.parse('${baseUrlCantin}login_stand');
    var headers = {
      'Content-Type': 'application/json',
      'makerID': '35',
    };
    var body = jsonEncode({
      'username': username,
      'password': password,
    });

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print('Login Successful: ${responseData.toString()}');
        return true;
      } else {
        print('Login Failed: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      print('Exception occurred: $e');
      return false;
    }
  }
}
