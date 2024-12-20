part of '../cores.dart';

abstract class Assets {
  // Images
  static final images = _Images();
  static final imagesSVG = _ImagesSVG();

  // Icons
  static final icons = _Icons();
  static final iconsSVG = _IconsSVG();
}

// Images ===========================================

class _Images {
  static const basePng = "lib/src/assets/images/png";
  static const baseJpg = "lib/src/assets/images/jpg";
  // PNG Images
  final analytics = "$basePng/analytics.png";
  final blackBackground = "$basePng/black_background.png";
  final defaultold = "$basePng/defaul_told.png";
  final defaultDark = "$basePng/default_dark.png";
  final defaultNormal = "$basePng/default_normal.png";
  final infoSharing = "$basePng/info_sharing.png";
  final news = "$basePng/news.png";
  final progress = "$basePng/progress.png";
  final verification = "$basePng/verification.png";
  final liveVideo = "$basePng/live_video.png";

  // JPG Images
  final business = "$baseJpg/business.jpg";
  final culture = "$baseJpg/culture.jpg";
  final user = "$baseJpg/faisal-ramdan.jpg";
  final family = "$baseJpg/family.jpg";
  final food = "$baseJpg/food.jpg";
  final love = "$baseJpg/love.jpg";
  final music = "$baseJpg/music.jpg";
  final religion = "$baseJpg/religion.jpg";
  final shopping = "$baseJpg/shopping.jpg";
  final travel = "$baseJpg/travel.jpg";
  final welcome = "$baseJpg/welcome.jpeg";
}

class _ImagesSVG {
  static const baseSvg = "lib/src/assets/images/svg";
  final logo = "$baseSvg/logo.svg";
  final authentication = "$baseSvg/authentication.svg";
  final defaultNormal = "$baseSvg/default_normal.svg";
  final mailReduel = "$baseSvg/mail_reduel.svg";
  final mobileLogin = "$baseSvg/mobile_login.svg";
  final myApp = "$baseSvg/my_app.svg";
  final newMessage = "$baseSvg/new_message.svg";
  final onlineLearning = "$baseSvg/online_learning.svg";
  final researching = "$baseSvg/researching.svg";
  final securityOn = "$baseSvg/security_on.svg";
  final studying = "$baseSvg/studying.svg";
  final teaching = "$baseSvg/teaching.svg";
  final twoFactorAuthentication = "$baseSvg/two_factor_authentication.svg";
}

// Icons ============================================

class _Icons {
  static const basePng = "lib/src/assets/icons/png";
  final giftCircle = "$basePng/gift_circle.png";
  final google = "$basePng/google.png";
  final smile = "$basePng/smile.png";
  final phone = "$basePng/phone.png";
}

class _IconsSVG {
  static const baseSvg = "lib/src/assets/icons/svg";
  final bag = "$baseSvg/bag.svg";
  final bookSchool = "$baseSvg/book_school.svg";
  final calendar = "$baseSvg/calendar.svg";
  final conversation = "$baseSvg/conversation.svg";
  final graduate = "$baseSvg/graduate.svg";
  final idea = "$baseSvg/idea.svg";
  final increase = "$baseSvg/increase.svg";
  final level = "$baseSvg/level.svg";
  final menu = "$baseSvg/menu.svg";
  final microphone = "$baseSvg/microphone.svg";
  final more = "$baseSvg/more.svg";
  final pencil = "$baseSvg/pencil.svg";
  final premium = "$baseSvg/premium.svg";
  final travel = "$baseSvg/travel.svg";
}
