class FootballModel {
  final String? title;
  final String? competition;
  final String? matchviewUrl;
  final String? competitionUrl;
  final String? thumbnail;
  final String? date;
  final List<Videos>? videos;

  FootballModel({
    this.title,
    this.competition,
    this.matchviewUrl,
    this.competitionUrl,
    this.thumbnail,
    this.date,
    this.videos,
  });

  FootballModel.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String?,
        competition = json['competition'] as String?,
        matchviewUrl = json['matchviewUrl'] as String?,
        competitionUrl = json['competitionUrl'] as String?,
        thumbnail = json['thumbnail'] as String?,
        date = json['date'] as String?,
        videos = (json['videos'] as List?)
            ?.map((dynamic e) => Videos.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'title': title,
        'competition': competition,
        'matchviewUrl': matchviewUrl,
        'competitionUrl': competitionUrl,
        'thumbnail': thumbnail,
        'date': date,
        'videos': videos?.map((e) => e.toJson()).toList()
      };
}

class Videos {
  final String? id;
  final String? title;
  final String? embed;

  Videos({
    this.id,
    this.title,
    this.embed,
  });

  Videos.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        title = json['title'] as String?,
        embed = json['embed'] as String?;

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'embed': embed};
}
