class QuotesDataModel {
  int limit, skip, total;
  List<QuotesModel> quotes;

  QuotesDataModel(
      {required this.limit, required this.skip, required this.quotes, required this.total});

  ///fromjson...
  factory QuotesDataModel.fromjson(Map<String, dynamic>json){
    List<QuotesModel> mQuotes=[];
    for(Map<String,dynamic> eachQotes in json['quotes'] ){
      mQuotes.add(QuotesModel.fromjson(eachQotes));
    }
    return QuotesDataModel(
        limit: json['limit'],
        skip: json['skip'],
        quotes: mQuotes,
        total: json['total']);
  }
}

class QuotesModel {
  String?author, quote;
  int?id;

  QuotesModel({required this.id, required this.author, required this.quote});

  ///fromJSON...
  factory QuotesModel.fromjson(Map<String, dynamic> json){
    return QuotesModel(
        id: json['id'],
        author: json['author'],
        quote: json['quote']);
  }
}