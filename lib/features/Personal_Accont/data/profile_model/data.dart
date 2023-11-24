class ProfileData {
  int? key;
  String? sharingLink;
  bool? isFollowing;
  dynamic email;
  String? avatar;
  int? followersCount;
  String? fullName;
  String? firstName;
  dynamic lastName;
  String? accountVerifiedAt;
  String? status;
  String? mobile;
  String? fullMobileNumber;
  dynamic deviceId;
  String? countryCode;
  int? rating;

  ProfileData({
    this.key,
    this.sharingLink,
    this.isFollowing,
    this.email,
    this.avatar,
    this.followersCount,
    this.fullName,
    this.firstName,
    this.lastName,
    this.accountVerifiedAt,
    this.status,
    this.mobile,
    this.fullMobileNumber,
    this.deviceId,
    this.countryCode,
    this.rating,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        key: json['key'] as int?,
        sharingLink: json['sharing_link'] as String?,
        isFollowing: json['is_following'] as bool?,
        email: json['email'] as dynamic,
        avatar: json['avatar'] as String?,
        followersCount: json['followers_count'] as int?,
        fullName: json['full_name'] as String?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as dynamic,
        accountVerifiedAt: json['account_verified_at'] as String?,
        status: json['status'] as String?,
        mobile: json['mobile'] as String?,
        fullMobileNumber: json['full_mobile_number'] as String?,
        deviceId: json['device_id'] as dynamic,
        countryCode: json['country_code'] as String?,
        rating: json['rating'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'sharing_link': sharingLink,
        'is_following': isFollowing,
        'email': email,
        'avatar': avatar,
        'followers_count': followersCount,
        'full_name': fullName,
        'first_name': firstName,
        'last_name': lastName,
        'account_verified_at': accountVerifiedAt,
        'status': status,
        'mobile': mobile,
        'full_mobile_number': fullMobileNumber,
        'device_id': deviceId,
        'country_code': countryCode,
        'rating': rating,
      };
}
