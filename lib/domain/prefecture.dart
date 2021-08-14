import 'package:kr_app/domain/area.dart';

enum Prefecture {
  UNSELECTED,
  HOKKAIDO,
  AOMORI,
  IWATE,
  MIYAGI,
  AKITA,
  YAMAGATA,
  FUKUSHIMA,
  IBARAKI,
  TOCHIGI,
  GUNMA,
  SAITAMA,
  CHIBA,
  TOKYO,
  KANAGAWA,
  NIIGATA,
  TOYAMA,
  ISHIKAWA,
  FUKUI,
  YAMANASHI,
  NAGANO,
  GIFU,
  SHIZUOKA,
  AICHI,
  MIE,
  SHIGA,
  KYOTO,
  OSAKA,
  HYOGO,
  NARA,
  WAKAYAMA,
  TOTTORI,
  SHIMANE,
  OKAYAMA,
  HIROSHIMA,
  YAMAGUCHI,
  TOKUSHIMA,
  KAGAWA,
  EHIME,
  KOCHI,
  FUKUOKA,
  SAGA,
  NAGASAKI,
  KUMAMOTO,
  OITA,
  MIYAZAKI,
  KAGOSHIMA,
  OKINAWA,
}

extension PrefectureHelper on Prefecture {
  static const names = {
    Prefecture.UNSELECTED: '未選択',
    Prefecture.HOKKAIDO: '北海道',
    Prefecture.AOMORI: '青森',
    Prefecture.IWATE: '岩手',
    Prefecture.MIYAGI: '宮城',
    Prefecture.AKITA: '秋田',
    Prefecture.YAMAGATA: '山形',
    Prefecture.FUKUSHIMA: '福島',
    Prefecture.IBARAKI: '茨城',
    Prefecture.TOCHIGI: '栃木',
    Prefecture.GUNMA: '群馬',
    Prefecture.SAITAMA: '埼玉',
    Prefecture.CHIBA: '千葉',
    Prefecture.TOKYO: '東京',
    Prefecture.KANAGAWA: '神奈川',
    Prefecture.NIIGATA: '新潟',
    Prefecture.TOYAMA: '富山',
    Prefecture.ISHIKAWA: '石川',
    Prefecture.FUKUI: '福井',
    Prefecture.YAMANASHI: '山梨',
    Prefecture.NAGANO: '長野',
    Prefecture.GIFU: '岐阜',
    Prefecture.SHIZUOKA: '静岡',
    Prefecture.AICHI: '愛知',
    Prefecture.MIE: '三重',
    Prefecture.SHIGA: '滋賀',
    Prefecture.KYOTO: '京都',
    Prefecture.OSAKA: '大阪',
    Prefecture.HYOGO: '兵庫',
    Prefecture.NARA: '奈良',
    Prefecture.WAKAYAMA: '和歌山',
    Prefecture.TOTTORI: '鳥取',
    Prefecture.SHIMANE: '島根',
    Prefecture.OKAYAMA: '岡山',
    Prefecture.HIROSHIMA: '広島',
    Prefecture.YAMAGUCHI: '山口',
    Prefecture.TOKUSHIMA: '徳島',
    Prefecture.KAGAWA: '香川',
    Prefecture.EHIME: '愛媛',
    Prefecture.KOCHI: '高知',
    Prefecture.FUKUOKA: '福岡',
    Prefecture.SAGA: '佐賀',
    Prefecture.NAGASAKI: '長崎',
    Prefecture.KUMAMOTO: '熊本',
    Prefecture.OITA: '大分',
    Prefecture.MIYAZAKI: '宮崎',
    Prefecture.KAGOSHIMA: '鹿児島',
    Prefecture.OKINAWA: '沖縄',
  };

  static const areaGroups = {
    Prefecture.HOKKAIDO: {
      Area.HOKKAIDO_1,
      Area.HOKKAIDO_2,
      Area.HOKKAIDO_3,
      Area.HOKKAIDO_4,
      Area.HOKKAIDO_5,
      Area.HOKKAIDO_6,
      Area.HOKKAIDO_7,
      Area.HOKKAIDO_8,
      Area.HOKKAIDO_9,
      Area.HOKKAIDO_10,
      Area.HOKKAIDO_11,
      Area.HOKKAIDO_12,
      Area.HOKKAIDO_13,
      Area.HOKKAIDO_14,
      Area.HOKKAIDO_15,
      Area.HOKKAIDO_16,
      Area.HOKKAIDO_17,
    },
    Prefecture.AOMORI: {
      Area.AOMORI_1,
      Area.AOMORI_2,
      Area.AOMORI_3,
      Area.AOMORI_4,
      Area.AOMORI_5,
      Area.AOMORI_6,
    },
    Prefecture.IWATE: {
      Area.IWATE_1,
      Area.IWATE_2,
      Area.IWATE_3,
      Area.IWATE_4,
      Area.IWATE_5,
      Area.IWATE_6,
      Area.IWATE_7,
    },
    Prefecture.MIYAGI: {
      Area.MIYAGI_1,
      Area.MIYAGI_2,
      Area.MIYAGI_3,
      Area.MIYAGI_4,
      Area.MIYAGI_5,
      Area.MIYAGI_6,
      Area.MIYAGI_7,
      Area.MIYAGI_8,
    },
    Prefecture.AKITA: {
      Area.AKITA_1,
      Area.AKITA_2,
      Area.AKITA_3,
      Area.AKITA_4,
      Area.AKITA_5,
      Area.AKITA_6,
      Area.AKITA_7,
      Area.AKITA_8,
    },
    Prefecture.YAMAGATA: {
      Area.YAMAGATA_1,
      Area.YAMAGATA_2,
      Area.YAMAGATA_3,
      Area.YAMAGATA_4,
      Area.YAMAGATA_5,
      Area.YAMAGATA_6,
      Area.YAMAGATA_7,
    },
    Prefecture.FUKUSHIMA: {
      Area.FUKUSHIMA_1,
      Area.FUKUSHIMA_2,
      Area.FUKUSHIMA_3,
      Area.FUKUSHIMA_4,
      Area.FUKUSHIMA_5,
      Area.FUKUSHIMA_6,
      Area.FUKUSHIMA_7,
      Area.FUKUSHIMA_8,
      Area.FUKUSHIMA_9,
      Area.FUKUSHIMA_10,
    },
    Prefecture.IBARAKI: {
      Area.IBARAKI_1,
      Area.IBARAKI_2,
      Area.IBARAKI_3,
      Area.IBARAKI_4,
      Area.IBARAKI_5,
      Area.IBARAKI_6,
      Area.IBARAKI_7,
      Area.IBARAKI_8,
      Area.IBARAKI_9,
    },
    Prefecture.TOCHIGI: {
      Area.TOCHIGI_1,
      Area.TOCHIGI_2,
      Area.TOCHIGI_3,
      Area.TOCHIGI_4,
      Area.TOCHIGI_5,
      Area.TOCHIGI_6,
      Area.TOCHIGI_7,
    },
    Prefecture.GUNMA: {
      Area.GUNMA_1,
      Area.GUNMA_2,
      Area.GUNMA_3,
      Area.GUNMA_4,
      Area.GUNMA_5,
      Area.GUNMA_6,
      Area.GUNMA_7,
      Area.GUNMA_8,
      Area.GUNMA_9,
    },
    Prefecture.SAITAMA: {
      Area.SAITAMA_1,
      Area.SAITAMA_2,
      Area.SAITAMA_3,
      Area.SAITAMA_4,
      Area.SAITAMA_5,
      Area.SAITAMA_6,
      Area.SAITAMA_7,
      Area.SAITAMA_8,
      Area.SAITAMA_9,
      Area.SAITAMA_10,
      Area.SAITAMA_11,
      Area.SAITAMA_12,
      Area.SAITAMA_13,
      Area.SAITAMA_14,
      Area.SAITAMA_15,
      Area.SAITAMA_16,
      Area.SAITAMA_17,
      Area.SAITAMA_18,
      Area.SAITAMA_19,
      Area.SAITAMA_20,
      Area.SAITAMA_21,
      Area.SAITAMA_22,
      Area.SAITAMA_23,
    },
    Prefecture.CHIBA: {
      Area.CHIBA_1,
      Area.CHIBA_2,
      Area.CHIBA_3,
      Area.CHIBA_4,
      Area.CHIBA_5,
      Area.CHIBA_6,
      Area.CHIBA_7,
      Area.CHIBA_8,
      Area.CHIBA_9,
      Area.CHIBA_10,
      Area.CHIBA_11,
      Area.CHIBA_12,
      Area.CHIBA_13,
      Area.CHIBA_14,
      Area.CHIBA_15,
      Area.CHIBA_16,
      Area.CHIBA_17,
      Area.CHIBA_19,
      Area.CHIBA_20,
      Area.CHIBA_21,
      Area.CHIBA_22,
      Area.CHIBA_23,
    },
    Prefecture.TOKYO: {
      Area.TOKYO_1,
      Area.TOKYO_2,
      Area.TOKYO_3,
      Area.TOKYO_4,
      Area.TOKYO_5,
      Area.TOKYO_6,
      Area.TOKYO_7,
      Area.TOKYO_8,
      Area.TOKYO_9,
      Area.TOKYO_10,
      Area.TOKYO_11,
      Area.TOKYO_12,
      Area.TOKYO_13,
      Area.TOKYO_14,
      Area.TOKYO_15,
      Area.TOKYO_16,
      Area.TOKYO_17,
      Area.TOKYO_18,
      Area.TOKYO_19,
      Area.TOKYO_20,
      Area.TOKYO_21,
      Area.TOKYO_22,
      Area.TOKYO_23,
      Area.TOKYO_24,
      Area.TOKYO_25,
      Area.TOKYO_26,
      Area.TOKYO_27,
      Area.TOKYO_28,
      Area.TOKYO_29,
      Area.TOKYO_30,
      Area.TOKYO_31,
      Area.TOKYO_32,
      Area.TOKYO_33,
      Area.TOKYO_34,
    },
    Prefecture.KANAGAWA: {
      Area.KANAGAWA_1,
      Area.KANAGAWA_2,
      Area.KANAGAWA_3,
      Area.KANAGAWA_4,
      Area.KANAGAWA_5,
      Area.KANAGAWA_6,
      Area.KANAGAWA_7,
      Area.KANAGAWA_8,
      Area.KANAGAWA_9,
      Area.KANAGAWA_10,
      Area.KANAGAWA_11,
      Area.KANAGAWA_12,
      Area.KANAGAWA_13,
      Area.KANAGAWA_14,
      Area.KANAGAWA_15,
      Area.KANAGAWA_16,
      Area.KANAGAWA_17,
      Area.KANAGAWA_18,
      Area.KANAGAWA_19,
      Area.KANAGAWA_20,
      Area.KANAGAWA_21,
      Area.KANAGAWA_22,
      Area.KANAGAWA_23,
    },
    Prefecture.NIIGATA: {
      Area.NIIGATA_1,
      Area.NIIGATA_2,
      Area.NIIGATA_3,
      Area.NIIGATA_4,
      Area.NIIGATA_5,
      Area.NIIGATA_6,
      Area.NIIGATA_7,
    },
    Prefecture.TOYAMA: {
      Area.TOYAMA_1,
      Area.TOYAMA_2,
      Area.TOYAMA_3,
      Area.TOYAMA_4,
      Area.TOYAMA_5,
      Area.TOYAMA_6,
      Area.TOYAMA_7,
    },
    Prefecture.ISHIKAWA: {
      Area.ISHIKAWA_1,
      Area.ISHIKAWA_2,
      Area.ISHIKAWA_3,
      Area.ISHIKAWA_4,
      Area.ISHIKAWA_5,
      Area.ISHIKAWA_6,
    },
    Prefecture.FUKUI: {
      Area.FUKUI_1,
      Area.FUKUI_2,
      Area.FUKUI_3,
      Area.FUKUI_4,
      Area.FUKUI_5,
      Area.FUKUI_6,
    },
    Prefecture.YAMANASHI: {
      Area.YAMANASHI_1,
      Area.YAMANASHI_2,
      Area.YAMANASHI_3,
      Area.YAMANASHI_4,
      Area.YAMANASHI_5,
      Area.YAMANASHI_6,
      Area.YAMANASHI_7,
    },
    Prefecture.NAGANO: {
      Area.NAGANO_1,
      Area.NAGANO_2,
      Area.NAGANO_3,
      Area.NAGANO_4,
      Area.NAGANO_5,
      Area.NAGANO_6,
      Area.NAGANO_7,
      Area.NAGANO_8,
      Area.NAGANO_9,
    },
    Prefecture.GIFU: {
      Area.GIFU_1,
      Area.GIFU_2,
      Area.GIFU_3,
      Area.GIFU_4,
      Area.GIFU_5,
      Area.GIFU_6,
    },
    Prefecture.SHIZUOKA: {
      Area.SHIZUOKA_1,
      Area.SHIZUOKA_2,
      Area.SHIZUOKA_3,
      Area.SHIZUOKA_4,
      Area.SHIZUOKA_5,
      Area.SHIZUOKA_6,
      Area.SHIZUOKA_7,
      Area.SHIZUOKA_8,
    },
    Prefecture.AICHI: {
      Area.AICHI_1,
      Area.AICHI_2,
      Area.AICHI_3,
      Area.AICHI_4,
      Area.AICHI_5,
      Area.AICHI_6,
      Area.AICHI_7,
      Area.AICHI_8,
      Area.AICHI_9,
      Area.AICHI_10,
      Area.AICHI_11,
      Area.AICHI_12,
      Area.AICHI_13,
      Area.AICHI_14,
      Area.AICHI_15,
      Area.AICHI_16,
      Area.AICHI_17,
    },
    Prefecture.MIE: {
      Area.MIE_1,
      Area.MIE_2,
      Area.MIE_3,
      Area.MIE_4,
      Area.MIE_5,
      Area.MIE_6,
      Area.MIE_7,
      Area.MIE_8,
      Area.MIE_9,
      Area.MIE_10,
      Area.MIE_11,
      Area.MIE_12,
      Area.MIE_13,
      Area.MIE_14,
      Area.MIE_15,
      Area.MIE_16,
      Area.MIE_17,
      Area.MIE_18,
      Area.MIE_19,
      Area.MIE_20,
      Area.MIE_21,
      Area.MIE_22,
      Area.MIE_23,
      Area.MIE_24,
      Area.MIE_25,
      Area.MIE_26,
      Area.MIE_27,
      Area.MIE_28,
      Area.MIE_29,
      Area.MIE_30,
      Area.MIE_31,
    },
    Prefecture.SHIGA: {
      Area.SHIGA_1,
      Area.SHIGA_2,
      Area.SHIGA_3,
      Area.SHIGA_4,
      Area.SHIGA_5,
      Area.SHIGA_6,
      Area.SHIGA_7,
    },
    Prefecture.KYOTO: {
      Area.KYOTO_1,
      Area.KYOTO_2,
      Area.KYOTO_3,
      Area.KYOTO_4,
      Area.KYOTO_5,
      Area.KYOTO_6,
      Area.KYOTO_7,
      Area.KYOTO_8,
      Area.KYOTO_9,
      Area.KYOTO_10,
      Area.KYOTO_11,
      Area.KYOTO_12,
      Area.KYOTO_13,
    },
    Prefecture.OSAKA: {
      Area.OSAKA_1,
      Area.OSAKA_2,
      Area.OSAKA_3,
      Area.OSAKA_4,
      Area.OSAKA_5,
      Area.OSAKA_6,
      Area.OSAKA_7,
      Area.OSAKA_8,
      Area.OSAKA_9,
      Area.OSAKA_10,
      Area.OSAKA_11,
      Area.OSAKA_12,
      Area.OSAKA_13,
      Area.OSAKA_14,
      Area.OSAKA_15,
      Area.OSAKA_16,
      Area.OSAKA_17,
      Area.OSAKA_18,
      Area.OSAKA_19,
      Area.OSAKA_20,
      Area.OSAKA_21,
      Area.OSAKA_22,
      Area.OSAKA_23,
      Area.OSAKA_24,
      Area.OSAKA_25,
      Area.OSAKA_26,
      Area.OSAKA_27,
      Area.OSAKA_28,
      Area.OSAKA_29,
    },
    Prefecture.HYOGO: {
      Area.HYOGO_1,
      Area.HYOGO_2,
      Area.HYOGO_3,
      Area.HYOGO_4,
      Area.HYOGO_5,
      Area.HYOGO_6,
      Area.HYOGO_7,
      Area.HYOGO_8,
      Area.HYOGO_9,
      Area.HYOGO_10,
      Area.HYOGO_11,
      Area.HYOGO_12,
    },
    Prefecture.NARA: {
      Area.NARA_1,
      Area.NARA_2,
      Area.NARA_3,
      Area.NARA_4,
      Area.NARA_5,
      Area.NARA_6,
      Area.NARA_7,
      Area.NARA_8,
    },
    Prefecture.WAKAYAMA: {
      Area.WAKAYAMA_1,
      Area.WAKAYAMA_2,
      Area.WAKAYAMA_3,
      Area.WAKAYAMA_4,
      Area.WAKAYAMA_5,
      Area.WAKAYAMA_6,
      Area.WAKAYAMA_7,
    },
    Prefecture.TOTTORI: {
      Area.TOTTORI_1,
      Area.TOTTORI_2,
      Area.TOTTORI_3,
      Area.TOTTORI_4,
      Area.TOTTORI_5,
    },
    Prefecture.SHIMANE: {
      Area.SHIMANE_1,
      Area.SHIMANE_2,
      Area.SHIMANE_3,
      Area.SHIMANE_4,
      Area.SHIMANE_5,
      Area.SHIMANE_6,
    },
    Prefecture.OKAYAMA: {
      Area.OKAYAMA_1,
      Area.OKAYAMA_2,
      Area.OKAYAMA_3,
      Area.OKAYAMA_4,
      Area.OKAYAMA_5,
      Area.OKAYAMA_6,
      Area.OKAYAMA_7,
    },
    Prefecture.HIROSHIMA: {
      Area.HIROSHIMA_1,
      Area.HIROSHIMA_2,
      Area.HIROSHIMA_3,
      Area.HIROSHIMA_4,
      Area.HIROSHIMA_5,
      Area.HIROSHIMA_6,
      Area.HIROSHIMA_7,
      Area.HIROSHIMA_8,
      Area.HIROSHIMA_9,
      Area.HIROSHIMA_10,
      Area.HIROSHIMA_11,
    },
    Prefecture.YAMAGUCHI: {
      Area.YAMAGUCHI_1,
      Area.YAMAGUCHI_2,
      Area.YAMAGUCHI_3,
      Area.YAMAGUCHI_4,
      Area.YAMAGUCHI_5,
      Area.YAMAGUCHI_6,
      Area.YAMAGUCHI_7,
      Area.YAMAGUCHI_8,
    },
    Prefecture.TOKUSHIMA: {
      Area.TOKUSHIMA_1,
      Area.TOKUSHIMA_2,
      Area.TOKUSHIMA_3,
      Area.TOKUSHIMA_4,
      Area.TOKUSHIMA_5,
      Area.TOKUSHIMA_6,
    },
    Prefecture.KAGAWA: {
      Area.KAGAWA_1,
      Area.KAGAWA_2,
      Area.KAGAWA_3,
      Area.KAGAWA_4,
      Area.KAGAWA_5,
      Area.KAGAWA_6,
    },
    Prefecture.EHIME: {
      Area.EHIME_1,
      Area.EHIME_2,
      Area.EHIME_3,
      Area.EHIME_4,
      Area.EHIME_5,
      Area.EHIME_6,
    },
    Prefecture.KOCHI: {
      Area.KOCHI_1,
      Area.KOCHI_2,
      Area.KOCHI_3,
      Area.KOCHI_4,
      Area.KOCHI_5,
      Area.KOCHI_6,
    },
    Prefecture.FUKUOKA: {
      Area.FUKUOKA_1,
      Area.FUKUOKA_2,
      Area.FUKUOKA_3,
      Area.FUKUOKA_4,
      Area.FUKUOKA_5,
      Area.FUKUOKA_6,
      Area.FUKUOKA_7,
      Area.FUKUOKA_8,
      Area.FUKUOKA_9,
      Area.FUKUOKA_10,
      Area.FUKUOKA_11,
      Area.FUKUOKA_12,
      Area.FUKUOKA_13,
      Area.FUKUOKA_14,
      Area.FUKUOKA_15,
      Area.FUKUOKA_16,
      Area.FUKUOKA_17,
    },
    Prefecture.SAGA: {
      Area.SAGA_1,
      Area.SAGA_2,
      Area.SAGA_3,
      Area.SAGA_4,
      Area.SAGA_5,
      Area.SAGA_6,
    },
    Prefecture.NAGASAKI: {
      Area.NAGASAKI_1,
      Area.NAGASAKI_2,
      Area.NAGASAKI_3,
      Area.NAGASAKI_4,
      Area.NAGASAKI_5,
      Area.NAGASAKI_6,
      Area.NAGASAKI_7,
    },
    Prefecture.KUMAMOTO: {
      Area.KUMAMOTO_1,
      Area.KUMAMOTO_2,
      Area.KUMAMOTO_3,
      Area.KUMAMOTO_4,
      Area.KUMAMOTO_5,
      Area.KUMAMOTO_6,
      Area.KUMAMOTO_7,
    },
    Prefecture.OITA: {
      Area.OITA_1,
      Area.OITA_2,
      Area.OITA_3,
      Area.OITA_4,
      Area.OITA_5,
      Area.OITA_6,
    },
    Prefecture.MIYAZAKI: {
      Area.MIYAZAKI_1,
      Area.MIYAZAKI_2,
      Area.MIYAZAKI_3,
      Area.MIYAZAKI_4,
      Area.MIYAZAKI_5,
      Area.MIYAZAKI_6,
      Area.MIYAZAKI_7,
    },
    Prefecture.KAGOSHIMA: {
      Area.KAGOSHIMA_1,
      Area.KAGOSHIMA_2,
      Area.KAGOSHIMA_3,
      Area.KAGOSHIMA_4,
      Area.KAGOSHIMA_5,
      Area.KAGOSHIMA_6,
    },
    Prefecture.OKINAWA: {
      Area.OKINAWA_1,
      Area.OKINAWA_2,
      Area.OKINAWA_3,
      Area.OKINAWA_4,
      Area.OKINAWA_5,
      Area.OKINAWA_6,
    },
  };

  String get name => names[this] ?? '';

  String get value => toString().split('.').last;

  Set<Area>? get areaGroup => areaGroups[this];

  /// 都道府県にあたる文字列（ローマ字）からenumを生成する
  ///
  /// マッチしない場合は未選択を返す
  ///
  /// [value]: 'HOKKAIDO', 'AOMORI' ...
  static Prefecture from(String value) =>
      Prefecture.values.firstWhere((e) => e.value == value);
}