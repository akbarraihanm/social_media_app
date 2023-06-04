class URL {
  static const String _baseUrl = "https://dummyapi.io/data/v1";
  static String users(int page) => "$_baseUrl/user?page=$page";
  static String userDetail(String id) => "$_baseUrl/user/$id";
  static String userPost(String id, [int? page = 0]) {
    return "$_baseUrl/user/$id/post?page=$page";
  }
  static String news([int? page = 0]) => "$_baseUrl/post?page=$page";
  static String newsByTag(String tag, [int? page = 0]) {
    return "$_baseUrl/tag/$tag/post";
  }
}
