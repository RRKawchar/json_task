class GameModel {
  bool? success;
  String? message;
  List<Data>? data;

  GameModel({this.success, this.message, this.data});

  GameModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? plannerId;
  String? plannerName;
  String? title;
  double? price;
  String? description;
  int? duration;
  List<String>? countries;
  List<String>? cities;
  List<String>? travellersTypes;
  List<String>? foodPreferences;
  List<String>? photos;
  bool? includesActivities;
  List<String>? tags;
  List<String>? bestTimeToVisit;
  List<String>? tripTypes;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<Days>? days;

  Data(
      {this.sId,
        this.plannerId,
        this.plannerName,
        this.title,
        this.price,
        this.description,
        this.duration,
        this.countries,
        this.cities,
        this.travellersTypes,
        this.foodPreferences,
        this.photos,
        this.includesActivities,
        this.tags,
        this.bestTimeToVisit,
        this.tripTypes,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.days});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    plannerId = json['plannerId'];
    plannerName = json['plannerName'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    duration = json['duration'];
    countries = json['countries'].cast<String>();
    cities = json['cities'].cast<String>();
    travellersTypes = json['travellersTypes'].cast<String>();
    foodPreferences = json['foodPreferences'].cast<String>();
    photos = json['photos'].cast<String>();
    includesActivities = json['includesActivities'];
    tags = json['tags'].cast<String>();
    bestTimeToVisit = json['bestTimeToVisit'].cast<String>();
    tripTypes = json['tripTypes'].cast<String>();
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['days'] != null) {
      days = <Days>[];
      json['days'].forEach((v) {
        days!.add(new Days.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['plannerId'] = this.plannerId;
    data['plannerName'] = this.plannerName;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['countries'] = this.countries;
    data['cities'] = this.cities;
    data['travellersTypes'] = this.travellersTypes;
    data['foodPreferences'] = this.foodPreferences;
    data['photos'] = this.photos;
    data['includesActivities'] = this.includesActivities;
    data['tags'] = this.tags;
    data['bestTimeToVisit'] = this.bestTimeToVisit;
    data['tripTypes'] = this.tripTypes;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.days != null) {
      data['days'] = this.days!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Days {
  int? number;
  List<Events>? events;

  Days({this.number, this.events});

  Days.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  String? sId;
  String? title;
  String? description;
  int? startTime;
  int? endTime;
  Location? location;
  int? costFor1;
  int? costFor2;
  int? costFor4;
  List<String>? photos;
  List<dynamic>? videos;
  String? donts;
  String? mustDos;
  List<WebLinks>? webLinks;
  String? eventType;
  String? preferredTransport;
  String? alternativeTransport;
  bool? needsPreBooking;
  String? preBookingInfo;
  Location? fromLocation;
  Location? toLocation;

  Events(
      {this.sId,
        this.title,
        this.description,
        this.startTime,
        this.endTime,
        this.location,
        this.costFor1,
        this.costFor2,
        this.costFor4,
        this.photos,
        this.videos,
        this.donts,
        this.mustDos,
        this.webLinks,
        this.eventType,
        this.preferredTransport,
        this.alternativeTransport,
        this.needsPreBooking,
        this.preBookingInfo,
        this.fromLocation,
        this.toLocation});

  Events.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    costFor1 = json['costFor1'];
    costFor2 = json['costFor2'];
    costFor4 = json['costFor4'];
    photos = json['photos'].cast<String>();
    if (json['videos'] != null) {
      videos = <String>[];
      json['videos'].forEach((v) {
        videos!.add(v);
      });
    }
    donts = json['donts'];
    mustDos = json['mustDos'];
    if (json['webLinks'] != null) {
      webLinks = <WebLinks>[];
      json['webLinks'].forEach((v) {
        webLinks!.add(new WebLinks.fromJson(v));
      });
    }
    eventType = json['eventType'];
    preferredTransport = json['preferredTransport'];
    alternativeTransport = json['alternativeTransport'];
    needsPreBooking = json['needsPreBooking'];
    preBookingInfo = json['preBookingInfo'];
    fromLocation = json['fromLocation'] != null
        ? new Location.fromJson(json['fromLocation'])
        : null;
    toLocation = json['toLocation'] != null
        ? new Location.fromJson(json['toLocation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['costFor1'] = this.costFor1;
    data['costFor2'] = this.costFor2;
    data['costFor4'] = this.costFor4;
    data['photos'] = this.photos;
    if (this.videos != null) {
      data['videos'] = this.videos!.map((v) => v.toJson()).toList();
    }
    data['donts'] = this.donts;
    data['mustDos'] = this.mustDos;
    if (this.webLinks != null) {
      data['webLinks'] = this.webLinks!.map((v) => v.toJson()).toList();
    }
    data['eventType'] = this.eventType;
    data['preferredTransport'] = this.preferredTransport;
    data['alternativeTransport'] = this.alternativeTransport;
    data['needsPreBooking'] = this.needsPreBooking;
    data['preBookingInfo'] = this.preBookingInfo;
    if (this.fromLocation != null) {
      data['fromLocation'] = this.fromLocation!.toJson();
    }
    if (this.toLocation != null) {
      data['toLocation'] = this.toLocation!.toJson();
    }
    return data;
  }
}

class Location {
  String? description;
  List<MatchedSubstrings>? matchedSubstrings;
  String? placeId;
  String? reference;
  StructuredFormatting? structuredFormatting;
  List<Terms>? terms;
  List<String>? types;

  Location(
      {this.description,
        this.matchedSubstrings,
        this.placeId,
        this.reference,
        this.structuredFormatting,
        this.terms,
        this.types});

  Location.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    if (json['matched_substrings'] != null) {
      matchedSubstrings = <MatchedSubstrings>[];
      json['matched_substrings'].forEach((v) {
        matchedSubstrings!.add(new MatchedSubstrings.fromJson(v));
      });
    }
    placeId = json['place_id'];
    reference = json['reference'];
    structuredFormatting = json['structured_formatting'] != null
        ? new StructuredFormatting.fromJson(json['structured_formatting'])
        : null;
    if (json['terms'] != null) {
      terms = <Terms>[];
      json['terms'].forEach((v) {
        terms!.add(new Terms.fromJson(v));
      });
    }
    types = json['types'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    if (this.matchedSubstrings != null) {
      data['matched_substrings'] =
          this.matchedSubstrings!.map((v) => v.toJson()).toList();
    }
    data['place_id'] = this.placeId;
    data['reference'] = this.reference;
    if (this.structuredFormatting != null) {
      data['structured_formatting'] = this.structuredFormatting!.toJson();
    }
    if (this.terms != null) {
      data['terms'] = this.terms!.map((v) => v.toJson()).toList();
    }
    data['types'] = this.types;
    return data;
  }
}

class MatchedSubstrings {
  int? length;
  int? offset;

  MatchedSubstrings({this.length, this.offset});

  MatchedSubstrings.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['length'] = this.length;
    data['offset'] = this.offset;
    return data;
  }
}

class StructuredFormatting {
  String? mainText;
  List<MatchedSubstring>? mainTextMatchedSubstrings;
  String? secondaryText;

  StructuredFormatting(
      {this.mainText, this.mainTextMatchedSubstrings, this.secondaryText});

  StructuredFormatting.fromJson(Map<String, dynamic> json) {
    mainText = json['main_text'];
    if (json['main_text_matched_substrings'] != null) {
      mainTextMatchedSubstrings = <MatchedSubstring>[];
      json['main_text_matched_substrings'].forEach((v) {
        mainTextMatchedSubstrings!
            .add(MatchedSubstring.fromJson(v));
      });
    }
    secondaryText = json['secondary_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['main_text'] = this.mainText;
    if (this.mainTextMatchedSubstrings != null) {
      data['main_text_matched_substrings'] =
          this.mainTextMatchedSubstrings!.map((v) => v.toJson()).toList();
    }
    data['secondary_text'] = this.secondaryText;
    return data;
  }
}

class MatchedSubstring {
  MatchedSubstring({
    this.length,
    this.offset,
  });

  int? length;
  int? offset;

  factory MatchedSubstring.fromJson(Map<String, dynamic> json) => MatchedSubstring(
    length: json["length"],
    offset: json["offset"],
  );

  Map<String, dynamic> toJson() => {
    "length": length,
    "offset": offset,
  };
}

class Terms {
  int? offset;
  String? value;

  Terms({this.offset, this.value});

  Terms.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['value'] = this.value;
    return data;
  }
}

class WebLinks {
  String? title;
  String? url;

  WebLinks({this.title, this.url});

  WebLinks.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}
