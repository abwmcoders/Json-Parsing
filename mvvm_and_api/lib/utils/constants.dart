class Constants {


  static const apiKey = "b68e68a90afd4125a8edba60c536822c";
  static const topHeadlines = "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey";

  static String headLinesFor(String country) {
    return "https://newsapi.org/v2/top-headlines?country=$country&apiKey=$apiKey";
  }

  static const Map<String, String> coiuntries = {
    "USA" : "us",
    "India" : "in",
    "Korea" : "kr",
    "China" : "cn"
      };

  }