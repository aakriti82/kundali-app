static Future<http.Response> getKundalis(String token) async {
  final url = Uri.parse("$_baseUrl/kundali");
  return await http.get(url, headers: {
    "Authorization": "Bearer $token"
  });
}
