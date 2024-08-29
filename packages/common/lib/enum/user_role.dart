part of common;

enum UserRole {
  @JsonValue('superAdmin')
  superAdmin,
  @JsonValue('admin')
  admin,
  @JsonValue('user')
  user,
  @JsonValue('member')
  member,
  @JsonValue('secretary')
  secretary,
  @JsonValue('treasurer')
  treasurer,
  @JsonValue('moderator')
  moderator,
  @JsonValue('pastor')
  pastor,
  @JsonValue('elder')
  elder,
  @JsonValue('preacher')
  preacher,
}
