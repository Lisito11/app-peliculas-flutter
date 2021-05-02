class Cast{
  List<Actor> _actores = [];

  List<Actor> get actores => _actores;


  Cast.fromJsonList(List<dynamic> jsonList){
    if (jsonList == null) return;

    jsonList.forEach((element) {
      final actor = Actor.fromJson(element);
      _actores.add(actor);
    });

  }

}

class Actor {
  int _gender;
  int _id;
  String _name;
  String _profilePath;
  int _castId;
  String _character;
  int _order;
  String _creditId;

  int get gender => _gender;
  int get id => _id;
  String get name => _name;
  String get profilePath => _profilePath;
  int get castId => _castId;
  String get character => _character;
  int get order => _order;
  String get creditId => _creditId;

  Actor({
      int gender,
      int id, 
      String name,
      String profilePath,
      int castId, 
      String character, 
      String creditId,
      int order}){
    _gender = gender;
    _id = id;
    _name = name;
    _profilePath = profilePath;
    _castId = castId;
    _character = character;
    _creditId = creditId;
    _order = order;
}

  Actor.fromJson(dynamic json) {
    _gender = json["gender"];
    _id = json["id"];
    _name = json["name"];
    _profilePath = json["profile_path"];
    _castId = json["cast_id"];
    _character = json["character"];
    _creditId = json["credit_id"];
    _order = json["order"];
  }

  getFoto(){
    if(profilePath == null) {
      return "https://www.intra-tp.com/wp-content/uploads/2017/02/no-avatar.png";
    } else {
      return "https://image.tmdb.org/t/p/w500/$profilePath";
    }
  }

}