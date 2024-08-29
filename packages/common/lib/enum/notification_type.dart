part of common;

enum NotificationtType {
  @JsonValue('ORDER_STATUS_CHANGED')
  orderStatusChanged,
  @JsonValue('PROFILE_CHANGED')
  profileChanged,
}
