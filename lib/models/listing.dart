import 'dart:convert';

class Listing {
    final String? id;
    final String? listingUrl;
    final String? name;
    final String? summary;
    final String? space;
    final String? description;
    final String? neighborhoodOverview;
    final String? notes;
    final String? transit;
    final String? access;
    final String? interaction;
    final String? houseRules;
    final String? propertyType;
    final String? roomType;
    final String? bedType;
    final String? minimumNights;
    final String? maximumNights;
    final String? cancellationPolicy;
    final CalendarLastScraped? lastScraped;
    final CalendarLastScraped? calendarLastScraped;
    final CalendarLastScraped? firstReview;
    final CalendarLastScraped? lastReview;
    final int? accommodates;
    final int? bedrooms;
    final int? beds;
    final int? numberOfReviews;
    final Bathrooms? bathrooms;
    final List<String>? amenities;
    final Bathrooms? price;
    final Bathrooms? securityDeposit;
    final Bathrooms? cleaningFee;
    final Bathrooms? extraPeople;
    final Bathrooms? guestsIncluded;
    final Images? images;
    final Host? host;
    final Address? address;
    final Availability? availability;
    final ReviewScores? reviewScores;
    final List<Review>? reviews;

    Listing({
        this.id,
        this.listingUrl,
        this.name,
        this.summary,
        this.space,
        this.description,
        this.neighborhoodOverview,
        this.notes,
        this.transit,
        this.access,
        this.interaction,
        this.houseRules,
        this.propertyType,
        this.roomType,
        this.bedType,
        this.minimumNights,
        this.maximumNights,
        this.cancellationPolicy,
        this.lastScraped,
        this.calendarLastScraped,
        this.firstReview,
        this.lastReview,
        this.accommodates,
        this.bedrooms,
        this.beds,
        this.numberOfReviews,
        this.bathrooms,
        this.amenities,
        this.price,
        this.securityDeposit,
        this.cleaningFee,
        this.extraPeople,
        this.guestsIncluded,
        this.images,
        this.host,
        this.address,
        this.availability,
        this.reviewScores,
        this.reviews,
    });

    factory Listing.fromRawJson(String str) => Listing.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Listing.fromJson(Map<String, dynamic> json) => Listing(
        id: json["_id"],
        listingUrl: json["listing_url"],
        name: json["name"],
        summary: json["summary"],
        space: json["space"],
        description: json["description"],
        neighborhoodOverview: json["neighborhood_overview"],
        notes: json["notes"],
        transit: json["transit"],
        access: json["access"],
        interaction: json["interaction"],
        houseRules: json["house_rules"],
        propertyType: json["property_type"],
        roomType: json["room_type"],
        bedType: json["bed_type"],
        minimumNights: json["minimum_nights"],
        maximumNights: json["maximum_nights"],
        cancellationPolicy: json["cancellation_policy"],
        lastScraped: json["last_scraped"] == null ? null : CalendarLastScraped.fromJson(json["last_scraped"]),
        calendarLastScraped: json["calendar_last_scraped"] == null ? null : CalendarLastScraped.fromJson(json["calendar_last_scraped"]),
        firstReview: json["first_review"] == null ? null : CalendarLastScraped.fromJson(json["first_review"]),
        lastReview: json["last_review"] == null ? null : CalendarLastScraped.fromJson(json["last_review"]),
        accommodates: json["accommodates"],
        bedrooms: json["bedrooms"],
        beds: json["beds"],
        numberOfReviews: json["number_of_reviews"],
        bathrooms: json["bathrooms"] == null ? null : Bathrooms.fromJson(json["bathrooms"]),
        amenities: json["amenities"] == null ? [] : List<String>.from(json["amenities"]!.map((x) => x)),
        price: json["price"] == null ? null : Bathrooms.fromJson(json["price"]),
        securityDeposit: json["security_deposit"] == null ? null : Bathrooms.fromJson(json["security_deposit"]),
        cleaningFee: json["cleaning_fee"] == null ? null : Bathrooms.fromJson(json["cleaning_fee"]),
        extraPeople: json["extra_people"] == null ? null : Bathrooms.fromJson(json["extra_people"]),
        guestsIncluded: json["guests_included"] == null ? null : Bathrooms.fromJson(json["guests_included"]),
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        host: json["host"] == null ? null : Host.fromJson(json["host"]),
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        availability: json["availability"] == null ? null : Availability.fromJson(json["availability"]),
        reviewScores: json["review_scores"] == null ? null : ReviewScores.fromJson(json["review_scores"]),
        reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "listing_url": listingUrl,
        "name": name,
        "summary": summary,
        "space": space,
        "description": description,
        "neighborhood_overview": neighborhoodOverview,
        "notes": notes,
        "transit": transit,
        "access": access,
        "interaction": interaction,
        "house_rules": houseRules,
        "property_type": propertyType,
        "room_type": roomType,
        "bed_type": bedType,
        "minimum_nights": minimumNights,
        "maximum_nights": maximumNights,
        "cancellation_policy": cancellationPolicy,
        "last_scraped": lastScraped?.toJson(),
        "calendar_last_scraped": calendarLastScraped?.toJson(),
        "first_review": firstReview?.toJson(),
        "last_review": lastReview?.toJson(),
        "accommodates": accommodates,
        "bedrooms": bedrooms,
        "beds": beds,
        "number_of_reviews": numberOfReviews,
        "bathrooms": bathrooms?.toJson(),
        "amenities": amenities == null ? [] : List<dynamic>.from(amenities!.map((x) => x)),
        "price": price?.toJson(),
        "security_deposit": securityDeposit?.toJson(),
        "cleaning_fee": cleaningFee?.toJson(),
        "extra_people": extraPeople?.toJson(),
        "guests_included": guestsIncluded?.toJson(),
        "images": images?.toJson(),
        "host": host?.toJson(),
        "address": address?.toJson(),
        "availability": availability?.toJson(),
        "review_scores": reviewScores?.toJson(),
        "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toJson())),
    };
}

class Address {
    final String? street;
    final String? suburb;
    final String? governmentArea;
    final String? market;
    final String? country;
    final String? countryCode;
    final Location? location;

    Address({
        this.street,
        this.suburb,
        this.governmentArea,
        this.market,
        this.country,
        this.countryCode,
        this.location,
    });

    factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suburb: json["suburb"],
        governmentArea: json["government_area"],
        market: json["market"],
        country: json["country"],
        countryCode: json["country_code"],
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
    );

    Map<String, dynamic> toJson() => {
        "street": street,
        "suburb": suburb,
        "government_area": governmentArea,
        "market": market,
        "country": country,
        "country_code": countryCode,
        "location": location?.toJson(),
    };
}

class Location {
    final String? type;
    final List<double>? coordinates;
    final bool? isLocationExact;

    Location({
        this.type,
        this.coordinates,
        this.isLocationExact,
    });

    factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"],
        coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
        isLocationExact: json["is_location_exact"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
        "is_location_exact": isLocationExact,
    };
}

class Availability {
    final int? availability30;
    final int? availability60;
    final int? availability90;
    final int? availability365;

    Availability({
        this.availability30,
        this.availability60,
        this.availability90,
        this.availability365,
    });

    factory Availability.fromRawJson(String str) => Availability.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        availability30: json["availability_30"],
        availability60: json["availability_60"],
        availability90: json["availability_90"],
        availability365: json["availability_365"],
    );

    Map<String, dynamic> toJson() => {
        "availability_30": availability30,
        "availability_60": availability60,
        "availability_90": availability90,
        "availability_365": availability365,
    };
}

class Bathrooms {
    final String? numberDecimal;

    Bathrooms({
        this.numberDecimal,
    });

    factory Bathrooms.fromRawJson(String str) => Bathrooms.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Bathrooms.fromJson(Map<String, dynamic> json) => Bathrooms(
        numberDecimal: json["\u0024numberDecimal"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024numberDecimal": numberDecimal,
    };
}

class CalendarLastScraped {
    final DateTime? date;

    CalendarLastScraped({
        this.date,
    });

    factory CalendarLastScraped.fromRawJson(String str) => CalendarLastScraped.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CalendarLastScraped.fromJson(Map<String, dynamic> json) => CalendarLastScraped(
        date: json["\u0024date"] == null ? null : DateTime.parse(json["\u0024date"]),
    );

    Map<String, dynamic> toJson() => {
        "\u0024date": date?.toIso8601String(),
    };
}

class Host {
    final String? hostId;
    final String? hostUrl;
    final String? hostName;
    final String? hostLocation;
    final String? hostAbout;
    final String? hostResponseTime;
    final String? hostThumbnailUrl;
    final String? hostPictureUrl;
    final String? hostNeighbourhood;
    final int? hostResponseRate;
    final bool? hostIsSuperhost;
    final bool? hostHasProfilePic;
    final bool? hostIdentityVerified;
    final int? hostListingsCount;
    final int? hostTotalListingsCount;
    final List<String>? hostVerifications;

    Host({
        this.hostId,
        this.hostUrl,
        this.hostName,
        this.hostLocation,
        this.hostAbout,
        this.hostResponseTime,
        this.hostThumbnailUrl,
        this.hostPictureUrl,
        this.hostNeighbourhood,
        this.hostResponseRate,
        this.hostIsSuperhost,
        this.hostHasProfilePic,
        this.hostIdentityVerified,
        this.hostListingsCount,
        this.hostTotalListingsCount,
        this.hostVerifications,
    });

    factory Host.fromRawJson(String str) => Host.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Host.fromJson(Map<String, dynamic> json) => Host(
        hostId: json["host_id"],
        hostUrl: json["host_url"],
        hostName: json["host_name"],
        hostLocation: json["host_location"],
        hostAbout: json["host_about"],
        hostResponseTime: json["host_response_time"],
        hostThumbnailUrl: json["host_thumbnail_url"],
        hostPictureUrl: json["host_picture_url"],
        hostNeighbourhood: json["host_neighbourhood"],
        hostResponseRate: json["host_response_rate"],
        hostIsSuperhost: json["host_is_superhost"],
        hostHasProfilePic: json["host_has_profile_pic"],
        hostIdentityVerified: json["host_identity_verified"],
        hostListingsCount: json["host_listings_count"],
        hostTotalListingsCount: json["host_total_listings_count"],
        hostVerifications: json["host_verifications"] == null ? [] : List<String>.from(json["host_verifications"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "host_id": hostId,
        "host_url": hostUrl,
        "host_name": hostName,
        "host_location": hostLocation,
        "host_about": hostAbout,
        "host_response_time": hostResponseTime,
        "host_thumbnail_url": hostThumbnailUrl,
        "host_picture_url": hostPictureUrl,
        "host_neighbourhood": hostNeighbourhood,
        "host_response_rate": hostResponseRate,
        "host_is_superhost": hostIsSuperhost,
        "host_has_profile_pic": hostHasProfilePic,
        "host_identity_verified": hostIdentityVerified,
        "host_listings_count": hostListingsCount,
        "host_total_listings_count": hostTotalListingsCount,
        "host_verifications": hostVerifications == null ? [] : List<dynamic>.from(hostVerifications!.map((x) => x)),
    };
}

class Images {
    final String? thumbnailUrl;
    final String? mediumUrl;
    final String? pictureUrl;
    final String? xlPictureUrl;

    Images({
        this.thumbnailUrl,
        this.mediumUrl,
        this.pictureUrl,
        this.xlPictureUrl,
    });

    factory Images.fromRawJson(String str) => Images.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        thumbnailUrl: json["thumbnail_url"],
        mediumUrl: json["medium_url"],
        pictureUrl: json["picture_url"],
        xlPictureUrl: json["xl_picture_url"],
    );

    Map<String, dynamic> toJson() => {
        "thumbnail_url": thumbnailUrl,
        "medium_url": mediumUrl,
        "picture_url": pictureUrl,
        "xl_picture_url": xlPictureUrl,
    };
}

class ReviewScores {
    final int? reviewScoresAccuracy;
    final int? reviewScoresCleanliness;
    final int? reviewScoresCheckin;
    final int? reviewScoresCommunication;
    final int? reviewScoresLocation;
    final int? reviewScoresValue;
    final int? reviewScoresRating;

    ReviewScores({
        this.reviewScoresAccuracy,
        this.reviewScoresCleanliness,
        this.reviewScoresCheckin,
        this.reviewScoresCommunication,
        this.reviewScoresLocation,
        this.reviewScoresValue,
        this.reviewScoresRating,
    });

    factory ReviewScores.fromRawJson(String str) => ReviewScores.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ReviewScores.fromJson(Map<String, dynamic> json) => ReviewScores(
        reviewScoresAccuracy: json["review_scores_accuracy"],
        reviewScoresCleanliness: json["review_scores_cleanliness"],
        reviewScoresCheckin: json["review_scores_checkin"],
        reviewScoresCommunication: json["review_scores_communication"],
        reviewScoresLocation: json["review_scores_location"],
        reviewScoresValue: json["review_scores_value"],
        reviewScoresRating: json["review_scores_rating"],
    );

    Map<String, dynamic> toJson() => {
        "review_scores_accuracy": reviewScoresAccuracy,
        "review_scores_cleanliness": reviewScoresCleanliness,
        "review_scores_checkin": reviewScoresCheckin,
        "review_scores_communication": reviewScoresCommunication,
        "review_scores_location": reviewScoresLocation,
        "review_scores_value": reviewScoresValue,
        "review_scores_rating": reviewScoresRating,
    };
}

class Review {
    final String? id;
    final CalendarLastScraped? date;
    final String? listingId;
    final String? reviewerId;
    final String? reviewerName;
    final String? comments;

    Review({
        this.id,
        this.date,
        this.listingId,
        this.reviewerId,
        this.reviewerName,
        this.comments,
    });

    factory Review.fromRawJson(String str) => Review.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["_id"],
        date: json["date"] == null ? null : CalendarLastScraped.fromJson(json["date"]),
        listingId: json["listing_id"],
        reviewerId: json["reviewer_id"],
        reviewerName: json["reviewer_name"],
        comments: json["comments"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "date": date?.toJson(),
        "listing_id": listingId,
        "reviewer_id": reviewerId,
        "reviewer_name": reviewerName,
        "comments": comments,
    };
}
