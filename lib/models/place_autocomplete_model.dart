class PlaceAutocomplete {
  final String description;
  final String placeid;

  PlaceAutocomplete({required this.description, required this.placeid});

  factory PlaceAutocomplete.fromJson(Map<String, dynamic> json) {
    return PlaceAutocomplete(
        description: json['description'], placeid: json['place_id']);
  }
}
