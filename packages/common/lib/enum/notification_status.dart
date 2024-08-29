part of common;

enum NotificationStatus {
  @JsonValue('UNREAD')
  unRead,
  @JsonValue('READ')
  read,
}
