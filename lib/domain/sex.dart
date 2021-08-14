enum Sex {
  UNSELECTED,
  MAN,
  WOMAN,
  OTHER,
}

extension SexHelper on Sex {
  static const names = {
    Sex.UNSELECTED: '未選択',
    Sex.MAN: '男性',
    Sex.WOMAN: '女性',
    Sex.OTHER: 'その他',
  };

  String get name => names[this] ?? '選択なし';
  String get value => toString().split('.').last;
}
