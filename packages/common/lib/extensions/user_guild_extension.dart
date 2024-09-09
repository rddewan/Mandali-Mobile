part of common;

extension UserGuildExtension on UserGuild {
  String get guildName {
    switch (this) {
      case UserGuild.men:
        return "Men's Guild";
      case UserGuild.women:
        return "Women's Guild";
      case UserGuild.youth:
        return "Youth's Guild";
      case UserGuild.childer:
        return "Sunday School";
      default:
        return '';
    }
  }
}
