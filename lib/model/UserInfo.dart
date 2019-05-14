import 'package:json_annotation/json_annotation.dart';

part 'UserInfo.g.dart';
// 用户信息
@JsonSerializable()
class UserInfo {

  UserInfo(
    this.AreaName,
    this.AreaId,
    this.Autograph,
    this.Birthday,
    this.BranchId,
    this.BrandId,
    this.NickName,
    this.Password,
    this.Phone,
    this.Sex,
    this.UserIcon,
    this.UserId,
    this.UserKey,
    this.UserName,
    this.UseridEncrypt,
  );
  /////////////
  String AreaName;
  String AreaId;
  String Autograph;
  String Birthday;
  String BranchId;
  String BrandId;
  String NickName;
  String Password;
  String Phone;
  String Sex;
  String UserIcon;
  String UserId;
  String UserKey;
  String UserName;
  String UseridEncrypt;

  //反序列化
  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);



}