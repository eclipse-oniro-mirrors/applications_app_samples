/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
export interface keySourceListType {
  title: string,
  content: string,
  upperContent: string;
}

export interface sourceListType {
  content: string;
}

export interface keyNineNumType {
  content: string;
}

export interface keycharacterType {
  title?: string
}

export interface keyNineChinaType {
  title: string | Resource,
  content: string;
}

export enum KeyState {
  LOWER_CASE = 0,
  ONCE_UPPER_CASE = 1,
  UPPER_CASE = 2
}

export enum Menu {
  Key = 'KeyMenu',
  Num = 'NumMenu',
  Sym = 'SymMenu',
  Chn = 'ChineseMenu'
}

export enum MenuType {
  NORMAL = 0,
  NUMBER = 1,
  SPECIAL = 2,
  CHINESE = 3,
}

export enum FuncKey {
  SHIFT = 'shift',
  DELETE = 'del',
  ENTER = 'enter'
}

export enum SymbolKey {
  ZERO = 0,
  ONE = 1,
}

export enum MenuKey {
  NUMBER_KEY = '?123',
  NORMAL_KEY = 'ABC',
  SPECIAL_KEY = '=/\<',
  SWITCH_KEY = 'switch',
  BACK_KEY = 'back',
  NUMBER_KEY_SWICH = 'NEXT'
}

export let keySourceListData: keySourceListType[] = [
  {
    title: '',
    content: 'shift',
    upperContent: ''
  },
  {
    title: '1',
    content: 'q',
    upperContent: 'Q'
  },
  {
    title: '2',
    content: 'w',
    upperContent: 'W'
  },
  {
    title: '3',
    content: 'e',
    upperContent: 'E'
  },
  {
    title: '4',
    content: 'r',
    upperContent: 'R'
  },
  {
    title: '5',
    content: 't',
    upperContent: 'T'
  },
  {
    title: '6',
    content: 'y',
    upperContent: 'Y'
  },
  {
    title: '7',
    content: 'u',
    upperContent: 'U'
  },
  {
    title: '8',
    content: 'i',
    upperContent: 'I'
  },
  {
    title: '9',
    content: 'o',
    upperContent: 'O'
  },
  {
    title: '0',
    content: 'p',
    upperContent: 'P'
  },
  {
    title: '',
    content: 'del',
    upperContent: ''
  },
  {
    title: '',
    content: '?123',
    upperContent: ''
  },
  {
    title: String.fromCharCode(126),
    content: 'a',
    upperContent: 'A'
  },
  {
    title: String.fromCharCode(33),
    content: 's',
    upperContent: 'S'
  },
  {
    title: '@',
    content: 'd',
    upperContent: 'D'
  },
  {
    title: String.fromCharCode(35),
    content: 'f',
    upperContent: 'F'
  },
  {
    title: '%',
    content: 'g',
    upperContent: 'G'
  },
  {
    title: String.fromCharCode(39),
    content: 'h',
    upperContent: 'H'
  },
  {
    title: '&',
    content: 'j',
    upperContent: 'J'
  },
  {
    title: '*',
    content: 'k',
    upperContent: 'K'
  },
  {
    title: '?',
    content: 'l',
    upperContent: 'L'
  },
  {
    title: '',
    content: ',',
    upperContent: ','
  },
  {
    title: '',
    content: 'enter',
    upperContent: ''
  },
  {
    title: '',
    content: 'switch',
    upperContent: ''
  },
  {
    title: String.fromCharCode(72),
    content: 'z',
    upperContent: 'Z'
  },
  {
    title: String.fromCharCode(73),
    content: 'x',
    upperContent: 'X'
  },
  {
    title: String.fromCharCode(175),
    content: 'c',
    upperContent: 'C'
  },
  {
    title: String.fromCharCode(95),
    content: 'v',
    upperContent: 'V'
  },
  {
    title: '',
    content: ' ',
    upperContent: ' '
  },
  {
    title: String.fromCharCode(58),
    content: 'b',
    upperContent: 'B'
  },
  {
    title: String.fromCharCode(59),
    content: 'n',
    upperContent: 'N'
  },
  {
    title: String.fromCharCode(47),
    content: 'm',
    upperContent: 'M'
  },
  {
    title: '',
    content: '.',
    upperContent: '.'
  }
]

export let numberSourceListData: sourceListType[] = [
  {
    content: 'back',
  },
  {
    content: '1'
  },
  {
    content: '2'
  },
  {
    content: '3'
  },
  {
    content: '4'
  },
  {
    content: '5'
  },
  {
    content: '6'
  },
  {
    content: '7'
  },
  {
    content: '8'
  },
  {
    content: '9'
  },
  {
    content: '0'
  },
  {
    content: 'del',
  },
  {
    content: '~'
  },
  {
    content: '_'
  },
  {
    content: '@'
  },
  {
    content: '#'
  },
  {
    content: '$'
  },
  {
    content: '%'
  },
  {
    content: '+'
  },
  {
    content: '-'
  },
  {
    content: '='
  },
  {
    content: '('
  },
  {
    content: ')'
  },
  {
    content: 'enter',
  },
  {
    content: 'NEXT'
  },
  {
    content: '\u2019'
  },
  {
    content: ':'
  },
  {
    content: ';'
  },
  {
    content: '\u005C'
  },
  {
    content: '/'
  },
  {
    content: ' ',
  },
  {
    content: '，',
  },
  {
    content: '.',
  },
  {
    content: '?'
  },
  {
    content: '!'
  }
]

export let numberSourceListDataVice: sourceListType[] = [
  {
    content: 'back',
  },
  {
    content: '1'
  },
  {
    content: '2'
  },
  {
    content: '3'
  },
  {
    content: '4'
  },
  {
    content: '5'
  },
  {
    content: '6'
  },
  {
    content: '7'
  },
  {
    content: '8'
  },
  {
    content: '9'
  },
  {
    content: '0'
  },
  {
    content: 'del',
  },
  {
    content: '€'
  },
  {
    content: '£'
  },
  {
    content: '￥'
  },
  {
    content: '{'
  },
  {
    content: '}'
  },
  {
    content: '['
  },
  {
    content: ']'
  },
  {
    content: '【'
  },
  {
    content: '】'
  },
  {
    content: '“'
  },
  {
    content: '”'
  },
  {
    content: 'enter',
  },
  {
    content: 'NEXT'
  },
  {
    content: '^'
  },
  {
    content: '&'
  },
  {
    content: '*'
  },
  {
    content: '"'
  },
  {
    content: '`'
  },
  {
    content: ' '
  },
  {
    content: '|',
  },
  {
    content: '·',
  },
  {
    content: '<',
  },
  {
    content: '>'
  }
]

export let symbolSourceListData: sourceListType[] = [
  {
    content: '~'
  },
  {
    content: '`'
  },
  {
    content: '|'
  },
  {
    content: '\u2022'
  },
  {
    content: '\u221A'
  },
  {
    content: '\u03A0'
  },
  {
    content: '\u00F7'
  },
  {
    content: '\u00D7'
  },
  {
    content: String.fromCharCode(182)
  },
  {
    content: '\u2206'
  },
  {
    content: String.fromCharCode(163)
  },
  {
    content: '\u20ac'
  },
  {
    content: String.fromCharCode(165)
  },
  {
    content: String.fromCharCode(162)
  },
  {
    content: String.fromCharCode(94)
  },
  {
    content: '\u00B0'
  },
  {
    content: '='
  },
  {
    content: String.fromCharCode(123)
  },
  {
    content: String.fromCharCode(125)
  },
  {
    content: String.fromCharCode(44)
  },
  {
    content: '?123'
  },
  {
    content: String.fromCharCode(92)
  },
  {
    content: String.fromCharCode(169)
  },
  {
    content: String.fromCharCode(174)
  },
  {
    content: '\u2122'
  },
  {
    content: '\u2105'
  },
  {
    content: '['
  },
  {
    content: ']'
  },
  {
    content: 'del'
  },
  {
    content: 'ABC'
  },
  {
    content: '<'
  },
  {
    content: '>'
  },
  {
    content: ' '
  },
  {
    content: '.'
  },
  {
    content: 'enter'
  }
]

export let chineseSourceListData: keySourceListType[] = [
  {
    title: '',
    content: 'shift',
    upperContent: ''
  },
  {
    title: '1',
    content: 'q',
    upperContent: 'Q'
  },
  {
    title: '2',
    content: 'w',
    upperContent: 'W'
  },
  {
    title: '3',
    content: 'e',
    upperContent: 'E'
  },
  {
    title: '4',
    content: 'r',
    upperContent: 'R'
  },
  {
    title: '5',
    content: 't',
    upperContent: 'T'
  },
  {
    title: '6',
    content: 'y',
    upperContent: 'Y'
  },
  {
    title: '7',
    content: 'u',
    upperContent: 'U'
  },
  {
    title: '8',
    content: 'i',
    upperContent: 'I'
  },
  {
    title: '9',
    content: 'o',
    upperContent: 'O'
  },
  {
    title: '0',
    content: 'p',
    upperContent: 'P'
  },
  {
    title: '',
    content: 'del',
    upperContent: ''
  },
  {
    title: '',
    content: '?123',
    upperContent: ''
  },
  {
    title: String.fromCharCode(126),
    content: 'a',
    upperContent: 'A'
  },
  {
    title: String.fromCharCode(33),
    content: 's',
    upperContent: 'S'
  },
  {
    title: '@',
    content: 'd',
    upperContent: 'D'
  },
  {
    title: String.fromCharCode(Number(0x002f)),
    content: 'f',
    upperContent: 'F'
  },
  {
    title: '%',
    content: 'g',
    upperContent: 'G'
  },
  {
    title: String.fromCharCode(Number(0x201c)),
    content: 'h',
    upperContent: 'H'
  },
  {
    title: String.fromCharCode(Number(0x201d)),
    content: 'j',
    upperContent: 'J'
  },
  {
    title: '*',
    content: 'k',
    upperContent: 'K'
  },
  {
    title: '?',
    content: 'l',
    upperContent: 'L'
  },
  {
    title: '',
    content: '，',
    upperContent: '，'
  },
  {
    title: '',
    content: 'enter',
    upperContent: ''
  },
  {
    title: '.',
    content: 'switch',
    upperContent: ''
  },
  {
    title: String.fromCharCode(Number(0xff08)),
    content: 'z',
    upperContent: 'Z'
  },
  {
    title: String.fromCharCode(Number(0xff09)),
    content: 'x',
    upperContent: 'X'
  },
  {
    title: String.fromCharCode(175),
    content: 'c',
    upperContent: 'C'
  },
  {
    title: String.fromCharCode(95),
    content: 'v',
    upperContent: 'V'
  },
  {
    title: ' ',
    content: ' ',
    upperContent: ' '
  },
  {
    title: String.fromCharCode(58),
    content: 'b',
    upperContent: 'B'
  },
  {
    title: String.fromCharCode(59),
    content: 'n',
    upperContent: 'N'
  },
  {
    title: String.fromCharCode(Number(0x3001)),
    content: 'm',
    upperContent: 'M'
  },
  {
    title: '',
    content: '。',
    upperContent: '。'
  }
]

// 九键数字
export let keyNineNumData: keyNineNumType[] = [
  {
    content: '1'
  },
  {
    content: '2'
  },
  {
    content: '3'
  },
  {
    content: '4'
  },
  {
    content: '5'
  },
  {
    content: '6'
  },
  {
    content: '7'
  },
  {
    content: '8'
  },
  {
    content: '9'
  },
  {
    content: '0'
  },
]

// 九键数组符号
export let keycharactersData: keycharacterType[] = [
  {
    title: '@'
  },
  {
    title: '.'
  },
  {
    title: '+'
  },
  {
    title: '-'
  },
]

// 九键拼音
export let keyNineChinaData: keyNineChinaType[] = [
  {
    title: $r('app.string.key_segmentation'),
    content: '1'
  },
  {
    title: 'ABC',
    content: '2'
  },
  {
    title: 'DEF',
    content: '3'
  },
  {
    title: 'GHI',
    content: '4'
  },
  {
    title: 'JKL',
    content: '5'
  },
  {
    title: 'MNO',
    content: '6'
  },
  {
    title: 'PQRS',
    content: '7'
  },
  {
    title: 'TUV',
    content: '8'
  },
  {
    title: 'WXYZ',
    content: '9'
  },
  {
    title: 'Space',
    content: '0'
  }
]

enum Row {
  FIRST = 'rowFirst',
  SECOND = 'rowSecond',
  THIRD = 'rowThird',
  FORTH = 'rowForth'
}

export enum KeyValue {
  KEYCODE_DEL = 2055,
  KEYCODE_FORWARD_DEL = 2071,
  KEYCODE_DPAD_UP = 2012,
  KEYCODE_DPAD_DOWN = 2013,
  KEYCODE_DPAD_LEFT = 2014,
  KEYCODE_DPAD_RIGHT = 2015,
  KEYCODE_ENTER = 2054,
}

export interface InputListRow<T> {
  rowFirst: T[];
  rowSecond: T[];
  rowThird: T[];
  rowForth: T[];
}

export let keyInputList: InputListRow<keySourceListType> = {
  [Row.FIRST]: keySourceListData.slice(0, 12),
  [Row.SECOND]: keySourceListData.slice(12, 24),
  [Row.THIRD]: keySourceListData.slice(24, 35),
  [Row.FORTH]: []
};

export let chineseInputList: InputListRow<keySourceListType> = {
  [Row.FIRST]: chineseSourceListData.slice(0, 12),
  [Row.SECOND]: chineseSourceListData.slice(12, 24),
  [Row.THIRD]: chineseSourceListData.slice(24, 35),
  [Row.FORTH]: []
};

export let numInputList: InputListRow<sourceListType> = {
  [Row.FIRST]: numberSourceListData.slice(0, 12),
  [Row.SECOND]: numberSourceListData.slice(12, 24),
  [Row.THIRD]: numberSourceListData.slice(24, 35),
  [Row.FORTH]: []
};

export let numInputListVice: InputListRow<sourceListType> = {
  [Row.FIRST]: numberSourceListDataVice.slice(0, 12),
  [Row.SECOND]: numberSourceListDataVice.slice(12, 24),
  [Row.THIRD]: numberSourceListDataVice.slice(24, 35),
  [Row.FORTH]: []
};

export let symInputList: InputListRow<sourceListType> = {
  [Row.FIRST]: symbolSourceListData.slice(0, 12),
  [Row.SECOND]: symbolSourceListData.slice(12, 24),
  [Row.THIRD]: symbolSourceListData.slice(24, 35),
  [Row.FORTH]: []
};
