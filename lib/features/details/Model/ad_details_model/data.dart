import 'admodel.dart';
import 'city.dart';
import 'customer.dart';
import 'department.dart';
import 'parent_category.dart';
import 'region.dart';
import 'sub_category.dart';

class Data {
  int? key;
  String? title;
  String? sharingLink;
  int? factoryYear;
  bool? isFavrotied;
  dynamic deletedAt;
  bool? isFollowing;
  dynamic isVisited;
  dynamic likeType;
  String? status;
  String? statusKey;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;
  List<dynamic>? pics;
  int? isDouble;
  String? gearType;
  String? gearTypeKey;
  String? fuelType;
  String? fuelTypeKey;
  int? isGuaranteed;
  int? likes;
  int? dislikes;
  int? followersCount;
  String? content;
  dynamic carAgency;
  Department? department;
  Region? region;
  City? city;
  String? adType;
  String? adTypeKey;
  ParentCategory? parentCategory;
  SubCategory? subCategory;
  Admodel? admodel;
  String? price;
  dynamic adStatus;
  int? setPrice;
  int? allowComments;
  int? showMobile;
  String? mobileNumber;
  Customer? customer;
  int? views;
  dynamic district;
  String? commission;

  Data({
    this.key,
    this.title,
    this.sharingLink,
    this.factoryYear,
    this.isFavrotied,
    this.deletedAt,
    this.isFollowing,
    this.isVisited,
    this.likeType,
    this.status,
    this.statusKey,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.pics,
    this.isDouble,
    this.gearType,
    this.gearTypeKey,
    this.fuelType,
    this.fuelTypeKey,
    this.isGuaranteed,
    this.likes,
    this.dislikes,
    this.followersCount,
    this.content,
    this.carAgency,
    this.department,
    this.region,
    this.city,
    this.adType,
    this.adTypeKey,
    this.parentCategory,
    this.subCategory,
    this.admodel,
    this.price,
    this.adStatus,
    this.setPrice,
    this.allowComments,
    this.showMobile,
    this.mobileNumber,
    this.customer,
    this.views,
    this.district,
    this.commission,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        key: json['key'] as int?,
        title: json['title'] as String?,
        sharingLink: json['sharing_link'] as String?,
        factoryYear: json['factory_year'] as int?,
        isFavrotied: json['is_favrotied'] as bool?,
        deletedAt: json['deleted_at'] as dynamic,
        isFollowing: json['is_following'] as bool?,
        isVisited: json['is_visited'] as dynamic,
        likeType: json['like_type'] as dynamic,
        status: json['status'] as String?,
        statusKey: json['status_key'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        image: json['image'] as String?,
        pics: json['pics'] as List<dynamic>?,
        isDouble: json['is_double'] as int?,
        gearType: json['gear_type'] as String?,
        gearTypeKey: json['gear_type_key'] as String?,
        fuelType: json['fuel_type'] as String?,
        fuelTypeKey: json['fuel_type_key'] as String?,
        isGuaranteed: json['is_guaranteed'] as int?,
        likes: json['likes'] as int?,
        dislikes: json['dislikes'] as int?,
        followersCount: json['followers_count'] as int?,
        content: json['content'] as String?,
        carAgency: json['car_agency'] as dynamic,
        department: json['department'] == null
            ? null
            : Department.fromJson(json['department'] as Map<String, dynamic>),
        region: json['region'] == null
            ? null
            : Region.fromJson(json['region'] as Map<String, dynamic>),
        city: json['city'] == null
            ? null
            : City.fromJson(json['city'] as Map<String, dynamic>),
        adType: json['ad_type'] as String?,
        adTypeKey: json['ad_type_key'] as String?,
        parentCategory: json['parent_category'] == null
            ? null
            : ParentCategory.fromJson(
                json['parent_category'] as Map<String, dynamic>),
        subCategory: json['sub_category'] == null
            ? null
            : SubCategory.fromJson(
                json['sub_category'] as Map<String, dynamic>),
        admodel: json['admodel'] == null
            ? null
            : Admodel.fromJson(json['admodel'] as Map<String, dynamic>),
        price: json['price'] as String?,
        adStatus: json['ad_status'] as dynamic,
        setPrice: json['set_price'] as int?,
        allowComments: json['allow_comments'] as int?,
        showMobile: json['show_mobile'] as int?,
        mobileNumber: json['mobile_number'] as String?,
        customer: json['customer'] == null
            ? null
            : Customer.fromJson(json['customer'] as Map<String, dynamic>),
        views: json['views'] as int?,
        district: json['district'] as dynamic,
        commission: json['commission'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'title': title,
        'sharing_link': sharingLink,
        'factory_year': factoryYear,
        'is_favrotied': isFavrotied,
        'deleted_at': deletedAt,
        'is_following': isFollowing,
        'is_visited': isVisited,
        'like_type': likeType,
        'status': status,
        'status_key': statusKey,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'image': image,
        'pics': pics,
        'is_double': isDouble,
        'gear_type': gearType,
        'gear_type_key': gearTypeKey,
        'fuel_type': fuelType,
        'fuel_type_key': fuelTypeKey,
        'is_guaranteed': isGuaranteed,
        'likes': likes,
        'dislikes': dislikes,
        'followers_count': followersCount,
        'content': content,
        'car_agency': carAgency,
        'department': department?.toJson(),
        'region': region?.toJson(),
        'city': city?.toJson(),
        'ad_type': adType,
        'ad_type_key': adTypeKey,
        'parent_category': parentCategory?.toJson(),
        'sub_category': subCategory?.toJson(),
        'admodel': admodel?.toJson(),
        'price': price,
        'ad_status': adStatus,
        'set_price': setPrice,
        'allow_comments': allowComments,
        'show_mobile': showMobile,
        'mobile_number': mobileNumber,
        'customer': customer?.toJson(),
        'views': views,
        'district': district,
        'commission': commission,
      };
}
