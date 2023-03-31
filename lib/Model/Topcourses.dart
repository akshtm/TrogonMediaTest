// To parse this JSON data, do
//
//     final topcourses = topcoursesFromJson(jsonString);

import 'dart:convert';

List<Topcourses> topcoursesFromJson(String str) =>
    List<Topcourses>.from(json.decode(str).map((x) => Topcourses.fromJson(x)));

String topcoursesToJson(List<Topcourses> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Topcourses {
  Topcourses({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.outcomes,
    required this.language,
    required this.categoryId,
    required this.subCategoryId,
    required this.section,
    required this.requirements,
    required this.price,
    this.discountFlag,
    required this.discountedPrice,
    required this.level,
    required this.userId,
    required this.thumbnail,
    required this.videoUrl,
    required this.dateAdded,
    required this.lastModified,
    this.visibility,
    required this.isTopCourse,
    required this.isAdmin,
    required this.status,
    required this.courseOverviewProvider,
    required this.metaKeywords,
    required this.metaDescription,
    this.isFreeCourse,
    required this.topcourseExternal,
    required this.externalLink,
    required this.rating,
    required this.numberOfRatings,
    required this.instructorName,
    required this.totalEnrollment,
    required this.shareableLink,
    required this.fullPrice,
    required this.videoCount,
  });

  String id;
  String title;
  String shortDescription;
  String description;
  List<String> outcomes;
  Language language;
  String categoryId;
  String subCategoryId;
  String section;
  List<dynamic> requirements;
  String price;
  String? discountFlag;
  String discountedPrice;
  Level level;
  String userId;
  String thumbnail;
  String videoUrl;
  String dateAdded;
  String lastModified;
  dynamic visibility;
  String isTopCourse;
  String isAdmin;
  Status status;
  CourseOverviewProvider courseOverviewProvider;
  String metaKeywords;
  String metaDescription;
  dynamic isFreeCourse;
  String topcourseExternal;
  String externalLink;
  int rating;
  int numberOfRatings;
  InstructorName instructorName;
  int totalEnrollment;
  String shareableLink;
  String fullPrice;
  String videoCount;

  factory Topcourses.fromJson(Map<String, dynamic> json) => Topcourses(
        id: json["id"],
        title: json["title"],
        shortDescription: json["short_description"],
        description: json["description"],
        outcomes: List<String>.from(json["outcomes"].map((x) => x)),
        language: languageValues.map[json["language"]]!,
        categoryId: json["category_id"],
        subCategoryId: json["sub_category_id"],
        section: json["section"],
        requirements: List<dynamic>.from(json["requirements"].map((x) => x)),
        price: json["price"],
        discountFlag: json["discount_flag"],
        discountedPrice: json["discounted_price"],
        level: levelValues.map[json["level"]]!,
        userId: json["user_id"],
        thumbnail: json["thumbnail"],
        videoUrl: json["video_url"],
        dateAdded: json["date_added"],
        lastModified: json["last_modified"],
        visibility: json["visibility"],
        isTopCourse: json["is_top_course"],
        isAdmin: json["is_admin"],
        status: statusValues.map[json["status"]]!,
        courseOverviewProvider:
            courseOverviewProviderValues.map[json["course_overview_provider"]]!,
        metaKeywords: json["meta_keywords"],
        metaDescription: json["meta_description"],
        isFreeCourse: json["is_free_course"],
        topcourseExternal: json["external"],
        externalLink: json["external_link"],
        rating: json["rating"],
        numberOfRatings: json["number_of_ratings"],
        instructorName: instructorNameValues.map[json["instructor_name"]]!,
        totalEnrollment: json["total_enrollment"],
        shareableLink: json["shareable_link"],
        fullPrice: json["full_price"],
        videoCount: json["video_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "short_description": shortDescription,
        "description": description,
        "outcomes": List<dynamic>.from(outcomes.map((x) => x)),
        "language": languageValues.reverse[language],
        "category_id": categoryId,
        "sub_category_id": subCategoryId,
        "section": section,
        "requirements": List<dynamic>.from(requirements.map((x) => x)),
        "price": price,
        "discount_flag": discountFlag,
        "discounted_price": discountedPrice,
        "level": levelValues.reverse[level],
        "user_id": userId,
        "thumbnail": thumbnail,
        "video_url": videoUrl,
        "date_added": dateAdded,
        "last_modified": lastModified,
        "visibility": visibility,
        "is_top_course": isTopCourse,
        "is_admin": isAdmin,
        "status": statusValues.reverse[status],
        "course_overview_provider":
            courseOverviewProviderValues.reverse[courseOverviewProvider],
        "meta_keywords": metaKeywords,
        "meta_description": metaDescription,
        "is_free_course": isFreeCourse,
        "external": topcourseExternal,
        "external_link": externalLink,
        "rating": rating,
        "number_of_ratings": numberOfRatings,
        "instructor_name": instructorNameValues.reverse[instructorName],
        "total_enrollment": totalEnrollment,
        "shareable_link": shareableLink,
        "full_price": fullPrice,
        "video_count": videoCount,
      };
}

enum CourseOverviewProvider { YOUTUBE, VIMEO, EMPTY }

final courseOverviewProviderValues = EnumValues({
  "": CourseOverviewProvider.EMPTY,
  "vimeo": CourseOverviewProvider.VIMEO,
  "youtube": CourseOverviewProvider.YOUTUBE
});

enum InstructorName { EMPTY }

final instructorNameValues = EnumValues({" ": InstructorName.EMPTY});

enum Language { ENGLISH }

final languageValues = EnumValues({"english": Language.ENGLISH});

enum Level { BEGINNER, ADVANCED }

final levelValues =
    EnumValues({"advanced": Level.ADVANCED, "beginner": Level.BEGINNER});

enum Status { ACTIVE }

final statusValues = EnumValues({"active": Status.ACTIVE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
