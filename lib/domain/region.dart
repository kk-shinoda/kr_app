import 'package:kr_app/domain/prefecture.dart';

enum Region {
  KANTO,
  KANSAI,
  TOKAI,
  HOKKAIDO_TOHOKU,
  KOSHINETSU_HOKURIKU,
  CHUGOKU,
  SHIKOKU,
  KYUSHU_OKINAWA,
}

extension RegionHelper on Region {
  static const names = {
    Region.KANTO: '関東',
    Region.KANSAI: '関西',
    Region.TOKAI: '東海',
    Region.HOKKAIDO_TOHOKU: '北海道・東北',
    Region.KOSHINETSU_HOKURIKU: '甲信越・北陸',
    Region.CHUGOKU: '中国',
    Region.SHIKOKU: '四国',
    Region.KYUSHU_OKINAWA: '九州・沖縄'
  };

  static const prefGroups = {
    Region.KANTO: {
      Prefecture.IBARAKI,
      Prefecture.TOCHIGI,
      Prefecture.GUNMA,
      Prefecture.SAITAMA,
      Prefecture.CHIBA,
      Prefecture.TOKYO,
      Prefecture.KANAGAWA,
    },
    Region.KANSAI: {
      Prefecture.OSAKA,
      Prefecture.KYOTO,
      Prefecture.HYOGO,
      Prefecture.SHIGA,
      Prefecture.NARA,
      Prefecture.WAKAYAMA,
    },
    Region.TOKAI: {
      Prefecture.AICHI,
      Prefecture.GIFU,
      Prefecture.MIE,
      Prefecture.SHIZUOKA,
    },
    Region.HOKKAIDO_TOHOKU: {
      Prefecture.HOKKAIDO,
      Prefecture.AOMORI,
      Prefecture.IWATE,
      Prefecture.MIYAGI,
      Prefecture.AKITA,
      Prefecture.YAMAGATA,
      Prefecture.FUKUSHIMA,
    },
    Region.KOSHINETSU_HOKURIKU: {
      Prefecture.YAMANASHI,
      Prefecture.NAGANO,
      Prefecture.NIIGATA,
      Prefecture.TOYAMA,
      Prefecture.ISHIKAWA,
      Prefecture.FUKUI,
    },
    Region.CHUGOKU: {
      Prefecture.TOTTORI,
      Prefecture.SHIMANE,
      Prefecture.OKAYAMA,
      Prefecture.HIROSHIMA,
      Prefecture.YAMAGUCHI,
    },
    Region.SHIKOKU: {
      Prefecture.TOKUSHIMA,
      Prefecture.KAGAWA,
      Prefecture.EHIME,
      Prefecture.KOCHI,
    },
    Region.KYUSHU_OKINAWA: {
      Prefecture.FUKUOKA,
      Prefecture.SAGA,
      Prefecture.NAGASAKI,
      Prefecture.KUMAMOTO,
      Prefecture.OITA,
      Prefecture.MIYAZAKI,
      Prefecture.KAGOSHIMA,
      Prefecture.OKINAWA,
    }
  };

  String? get name => names[this];
  String? get value => toString().split('.').last;

  Set<Prefecture>? get prefGroup => prefGroups[this];
}
