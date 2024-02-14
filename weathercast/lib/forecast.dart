import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'location.dart';
import 'weather.dart';

Future<Weather> forecast() async {
  const url = 'https://data.tmd.go.th/nwpapi/v1/forecast/location/hourly/at';
  const token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjhmM2NkYTQzNTI4MTUxNWE1NTk4ZDZkMmRiOGFkNWYxMmYzYzJjNTZkOWEyYTVmMDgxNWFhMjJjNDZiOTc4YjQ1ZmExYTNhOGFhMzFkZDUzIn0.eyJhdWQiOiIyIiwianRpIjoiOGYzY2RhNDM1MjgxNTE1YTU1OThkNmQyZGI4YWQ1ZjEyZjNjMmM1NmQ5YTJhNWYwODE1YWEyMmM0NmI5NzhiNDVmYTFhM2E4YWEzMWRkNTMiLCJpYXQiOjE3MDc4ODIyMjEsIm5iZiI6MTcwNzg4MjIyMSwiZXhwIjoxNzM5NTA0NjIxLCJzdWIiOiIzMDExIiwic2NvcGVzIjpbXX0.ocCR-_qiCY0MdMRW7wgeSPpdl0Bjja1iAQka0G6Ov_OLsn3frJe4MsGAOFv3mLjE8XIzLW5GXNTSHiVvhyVO2NDajhZI1VSs2_IgWRfbCY9kSwCdUb4PRh7ZFotePZeaQjEbtg4fJ-3gGHaPHf43CiQR7ue3BmXmUCReY-_DDPdKwUwkCIoBRO0lqgnOPaFRs1sEcyd46zIdmBHKspk9gd5YIBYXjQxLt7mC11sh4L6ZV1RJ6jTxIOtxElsuU_n1esqJKZwYuQ_zxdXcurG47jMSj2K9iM86bKhWoFh99k4bTDnWygjP20mDuO53syQUuLbmlBjVg9zdUWU6zGY-vqb-ZVgeypvgXRvQoLQ11Lgbi5bPrDpecrGUzM_B6goGQ077Vdb4ASWwvByBBfd1vBOFgDL4YGOzmYXnGwtz8Hrc_OwlO946Z21RADU3Xf_waQlV239mz165cquZ4F6rVBYI6CkzwIW-fEz9jmO5i930MLg64vYPU8zXFwsxlpIkD-OZT4JuWxogtoccBpUDC0qU54j3wlp27QVwRUmGMA-jJq82RJ1r6isCN1z-TDAJmkFt2YKS3SPhqWhnUs5ja2UBh2yuC9UtAJzRwUWAYZwq_J10ENP9706qjgD4L7OtI_9QF6KcCUJi3pLtK63F9lbtr-caFDnlGDa6_0wjppQ';
  try {
    Position location = await getCurrentLocation();
    http.Response response = await http.get(
        Uri.parse(
            '$url?lat=${location.latitude}&lon=${location.longitude}&fields=tc,cond'),
        headers: {
          'accept': 'application/json',
          'authorization': 'Bearer $token',
        });
    return Weather(address: response.body, temperature: 0, cond: 0);
  } catch (e) {
    return Future.error(e);
  }
}
