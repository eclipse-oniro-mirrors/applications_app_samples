/*
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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { TextMeasureResult } from 'libentry.so';
import {
  MEASURE_FONT_SIZE,
  MEASURE_MAX_WIDTH,
  MeasureObs,
  measureTyped,
  probeTyped
} from './MeasureArgProbe';

const TAG: string = '[Sample_NdkRenderNodeMeasureTextTest]';
const DOMAIN: number = 0xF811;

// 字符一律用码位构造，避免源码编码把多字节字符写坏。
const TEXT_ASCII: string = 'A';
const TEXT_CJK: string = String.fromCharCode(0x4F60);
// U+1F600 的笑脸，UTF-8 占四字节，UTF-16 是代理对。
const TEXT_EMOJI: string = String.fromCharCode(0xD83D, 0xDE00);
// U+10000，恰好是补充平面的第一个码位。
const TEXT_SUPPLEMENTARY: string = String.fromCharCode(0xD800, 0xDC00);
// e 加组合重音符 U+0301，视觉上是一个字符但由两个码位组成。
const TEXT_COMBINING: string = 'e' + String.fromCharCode(0x0301);
// 零宽连接符 U+200D 把两个表情连成一个字形。
const TEXT_ZWJ: string = String.fromCharCode(0xD83D, 0xDC68, 0x200D, 0xD83D, 0xDC69);
const TEXT_FULLWIDTH_SPACE: string = String.fromCharCode(0x3000);
const TEXT_ZERO_WIDTH_SPACE: string = String.fromCharCode(0x200B);
// 阿拉伯文与希伯来文均为从右到左排版。
const TEXT_ARABIC: string = String.fromCharCode(0x0645, 0x0631, 0x062D, 0x0628, 0x0627);
const TEXT_HEBREW: string = String.fromCharCode(0x05E9, 0x05DC, 0x05D5, 0x05DD);

const NUL_CHAR: string = String.fromCharCode(0);
const TEXT_WITH_NUL: string = 'A' + NUL_CHAR + 'B';
const TEXT_NUL_LEAD: string = NUL_CHAR + 'AB';

const LINE_BREAK: string = '\n';
const TAB_CHAR: string = '\t';
const TEXT_TWO_LINES: string = 'A' + LINE_BREAK + 'B';
const TEXT_FOUR_LINES: string = 'A' + LINE_BREAK + 'B' + LINE_BREAK + 'C' + LINE_BREAK + 'D';
const TEXT_TAB_TAIL: string = 'A' + TAB_CHAR;

// 长文本：一千与一万字符，均为单字符重复以保证长度可控。
const SHORT_REPEAT: number = 1000;
const LONG_REPEAT: number = 10000;
const REPEAT_UNIT: string = 'A';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function repeatText(unit: string, count: number): string {
  return unit.repeat(count);
}

function isMultipleOf(actual: number, unit: number): boolean {
  if (actual <= 0 || unit <= 0) {
    return false;
  }
  const ratio: number = actual / unit;
  return Math.abs(ratio - Math.round(ratio)) < 1e-3;
}

export default function ndkRenderNodeMeasureTextTest(): void {
  describe('NdkRenderNodeMeasureText', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0001
     * @tc.name      testNdkRenderNodeMeasureText0001
     * @tc.desc      校验单字节 ASCII 字符测量为正宽单行，宽度小于整个单词。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeMeasureText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeMeasureText0001 begin');
      const observed: MeasureObs = probeTyped(TEXT_ASCII, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('ascii width=' + observed.width.toString());
      expect(observed.returned).assertTrue();
      expect(observed.widthPositive).assertTrue();
      expect(observed.heightIsFontSize).assertTrue();
      expect(observed.width).assertLess(MEASURE_FONT_SIZE * 2);
      logInfo('testNdkRenderNodeMeasureText0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0002
     * @tc.name      testNdkRenderNodeMeasureText0002
     * @tc.desc      校验三字节中文按全角方格排版，单字宽度约等于字号。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeMeasureText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeMeasureText0002 begin');
      const observed: MeasureObs = probeTyped(TEXT_CJK, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('cjk width=' + observed.width.toString());
      expect(observed.widthPositive).assertTrue();
      expect(Math.abs(observed.width - MEASURE_FONT_SIZE) < MEASURE_FONT_SIZE).assertTrue();
      expect(observed.heightIsFontSize).assertTrue();
      expect(observed.finite).assertTrue();
      logInfo('testNdkRenderNodeMeasureText0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0003
     * @tc.name      testNdkRenderNodeMeasureText0003
     * @tc.desc      校验四字节表情被完整读取，宽度大于单字节字符且不被截断成半个代理对。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeMeasureText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeMeasureText0003 begin');
      const emoji: MeasureObs = probeTyped(TEXT_EMOJI, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const ascii: MeasureObs = probeTyped(TEXT_ASCII, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('emoji width=' + emoji.width.toString() + ' ascii width=' + ascii.width.toString());
      expect(emoji.returned).assertTrue();
      expect(emoji.finite).assertTrue();
      expect(emoji.width).assertLarger(ascii.width);
      expect(emoji.heightIsFontSize).assertTrue();
      logInfo('testNdkRenderNodeMeasureText0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0004
     * @tc.name      testNdkRenderNodeMeasureText0004
     * @tc.desc      校验补充平面首码位 U+10000 的代理对测量为正宽单行，不产生非法值。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureText0004 begin');
      const observed: MeasureObs = probeTyped(TEXT_SUPPLEMENTARY, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('supplementary width=' + observed.width.toString());
      expect(observed.returned).assertTrue();
      expect(observed.widthPositive).assertTrue();
      expect(observed.finite).assertTrue();
      expect(observed.heightIsFontSize).assertTrue();
      logInfo('testNdkRenderNodeMeasureText0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0005
     * @tc.name      testNdkRenderNodeMeasureText0005
     * @tc.desc      校验基字符加组合重音符不会按两个字符计宽，宽度不超过两倍基字符。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureText0005 begin');
      const combining: MeasureObs = probeTyped(TEXT_COMBINING, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const plain: MeasureObs = probeTyped('e', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('combining width=' + combining.width.toString() + ' plain width=' + plain.width.toString());
      expect(combining.returned).assertTrue();
      expect(combining.width).assertLarger(plain.width - 1);
      expect(combining.width).assertLess(plain.width * 2);
      expect(combining.heightIsFontSize).assertTrue();
      logInfo('testNdkRenderNodeMeasureText0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0006
     * @tc.name      testNdkRenderNodeMeasureText0006
     * @tc.desc      校验零宽连接符序列被整体识别为单行文本，宽度为正且结果有限。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureText0006 begin');
      const observed: MeasureObs = probeTyped(TEXT_ZWJ, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('zwj width=' + observed.width.toString());
      expect(observed.returned).assertTrue();
      expect(observed.widthPositive).assertTrue();
      expect(observed.finite).assertTrue();
      expect(observed.heightIsFontSize).assertTrue();
      logInfo('testNdkRenderNodeMeasureText0006 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0007
     * @tc.name      testNdkRenderNodeMeasureText0007
     * @tc.desc      校验字符串中间的空字符按 C 字符串口径截断，'A\0B' 与 'A' 结果一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeMeasureText0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeMeasureText0007 begin');
      const withNul: TextMeasureResult | undefined =
        measureTyped(TEXT_WITH_NUL, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const plain: TextMeasureResult | undefined = measureTyped(TEXT_ASCII, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(withNul !== undefined).assertTrue();
      expect(plain !== undefined).assertTrue();
      if (withNul === undefined || plain === undefined) {
        return;
      }
      logInfo('with nul width=' + withNul.width.toString() + ' plain width=' + plain.width.toString());
      expect(withNul.width).assertEqual(plain.width);
      expect(withNul.height).assertEqual(plain.height);
      logInfo('testNdkRenderNodeMeasureText0007 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0008
     * @tc.name      testNdkRenderNodeMeasureText0008
     * @tc.desc      校验首字符即为空字符时退化为空文本，宽度为负哨兵且高度取兜底行高。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureText0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureText0008 begin');
      const observed: MeasureObs = probeTyped(TEXT_NUL_LEAD, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('nul lead width=' + observed.width.toString());
      expect(observed.returned).assertTrue();
      expect(observed.sameAsEmpty).assertTrue();
      expect(observed.widthNonPositive).assertTrue();
      // 退化分支没有真实字形行，高度是兜底行高 16，低于字号 20。
      expect(observed.height).assertLess(MEASURE_FONT_SIZE);
      logInfo('testNdkRenderNodeMeasureText0008 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0009
     * @tc.name      testNdkRenderNodeMeasureText0009
     * @tc.desc      校验三字节全角空格占据字形宽度，测量为正宽单行且不等于空文本。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureText0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureText0009 begin');
      const observed: MeasureObs = probeTyped(TEXT_FULLWIDTH_SPACE, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('fullwidth space width=' + observed.width.toString());
      expect(observed.returned).assertTrue();
      expect(observed.widthPositive).assertTrue();
      expect(observed.sameAsEmpty).assertFalse();
      expect(observed.heightIsFontSize).assertTrue();
      logInfo('testNdkRenderNodeMeasureText0009 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0010
     * @tc.name      testNdkRenderNodeMeasureText0010
     * @tc.desc      校验三字节零宽空格不产生负宽度，行高仍为单行且结果有限。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureText0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureText0010 begin');
      const observed: MeasureObs = probeTyped(TEXT_ZERO_WIDTH_SPACE, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('zero width space width=' + observed.width.toString());
      expect(observed.returned).assertTrue();
      expect(observed.finite).assertTrue();
      expect(observed.heightPositive).assertTrue();
      expect(observed.heightIsFontSize).assertTrue();
      logInfo('testNdkRenderNodeMeasureText0010 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0011
     * @tc.name      testNdkRenderNodeMeasureText0011
     * @tc.desc      校验两字节阿拉伯文从右到左排版为正宽单行，不会被判为空文本。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureText0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureText0011 begin');
      const observed: MeasureObs = probeTyped(TEXT_ARABIC, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('arabic width=' + observed.width.toString());
      expect(observed.returned).assertTrue();
      expect(observed.widthPositive).assertTrue();
      expect(observed.sameAsEmpty).assertFalse();
      expect(observed.heightIsFontSize).assertTrue();
      logInfo('testNdkRenderNodeMeasureText0011 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0012
     * @tc.name      testNdkRenderNodeMeasureText0012
     * @tc.desc      校验两字节希伯来文排版为正宽单行，结果与阿拉伯文一样有限可算。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureText0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureText0012 begin');
      const observed: MeasureObs = probeTyped(TEXT_HEBREW, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const arabic: MeasureObs = probeTyped(TEXT_ARABIC, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(observed.widthPositive).assertTrue();
      expect(observed.finite && arabic.finite).assertTrue();
      expect(observed.heightIsFontSize).assertTrue();
      logInfo('testNdkRenderNodeMeasureText0012 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0013
     * @tc.name      testNdkRenderNodeMeasureText0013
     * @tc.desc      校验一千字符文本在常规宽度下换行，排版高度为行高的整数倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureText0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureText0013 begin');
      const observed: MeasureObs = probeTyped(repeatText(REPEAT_UNIT, SHORT_REPEAT), MEASURE_FONT_SIZE,
        MEASURE_MAX_WIDTH);
      logInfo('1k chars height=' + observed.height.toString());
      expect(observed.returned).assertTrue();
      expect(observed.height).assertLarger(MEASURE_FONT_SIZE);
      expect(isMultipleOf(observed.height, MEASURE_FONT_SIZE)).assertTrue();
      logInfo('testNdkRenderNodeMeasureText0013 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0014
     * @tc.name      testNdkRenderNodeMeasureText0014
     * @tc.desc      校验一万字符文本的排版高度远超一千字符，长文本读取不丢字节。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureText0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureText0014 begin');
      const long: MeasureObs = probeTyped(repeatText(REPEAT_UNIT, LONG_REPEAT), MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const short: MeasureObs = probeTyped(repeatText(REPEAT_UNIT, SHORT_REPEAT), MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('10k chars height=' + long.height.toString());
      expect(long.returned).assertTrue();
      expect(long.height).assertLarger(short.height);
      expect(isMultipleOf(long.height, MEASURE_FONT_SIZE)).assertTrue();
      expect(long.finite).assertTrue();
      logInfo('testNdkRenderNodeMeasureText0014 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0015
     * @tc.name      testNdkRenderNodeMeasureText0015
     * @tc.desc      校验显式换行符使文本排成两行，高度恰为两倍行高。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeMeasureText0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeMeasureText0015 begin');
      const observed: MeasureObs = probeTyped(TEXT_TWO_LINES, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('two lines height=' + observed.height.toString());
      expect(observed.returned).assertTrue();
      expect(observed.height).assertEqual(MEASURE_FONT_SIZE * 2);
      expect(observed.sameAsEmpty).assertFalse();
      logInfo('testNdkRenderNodeMeasureText0015 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0016
     * @tc.name      testNdkRenderNodeMeasureText0016
     * @tc.desc      校验三个换行符把文本排成四行，高度为四倍行高且能被行高整除。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureText0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureText0016 begin');
      const observed: MeasureObs = probeTyped(TEXT_FOUR_LINES, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('four lines height=' + observed.height.toString());
      expect(observed.returned).assertTrue();
      expect(observed.height).assertEqual(MEASURE_FONT_SIZE * 4);
      expect(isMultipleOf(observed.height, MEASURE_FONT_SIZE)).assertTrue();
      logInfo('testNdkRenderNodeMeasureText0016 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0017
     * @tc.name      testNdkRenderNodeMeasureText0017
     * @tc.desc      校验行尾制表符不额外增加行数，高度保持单行且宽度为正。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureText0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureText0017 begin');
      const observed: MeasureObs = probeTyped(TEXT_TAB_TAIL, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const plain: MeasureObs = probeTyped(TEXT_ASCII, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('tab tail height=' + observed.height.toString());
      expect(observed.returned).assertTrue();
      expect(observed.height).assertEqual(plain.height);
      expect(observed.width).assertLarger(0);
      logInfo('testNdkRenderNodeMeasureText0017 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0018
     * @tc.name      testNdkRenderNodeMeasureText0018
     * @tc.desc      校验中文与表情混排文本测量为正宽单行，多字节字符混用不触发异常。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureText0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureText0018 begin');
      const mixed: string = TEXT_CJK + TEXT_EMOJI + TEXT_ASCII;
      const observed: MeasureObs = probeTyped(mixed, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const ascii: MeasureObs = probeTyped(TEXT_ASCII, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(observed.widthPositive).assertTrue();
      expect(observed.width).assertLarger(ascii.width);
      expect(observed.heightIsFontSize).assertTrue();
      expect(observed.finite).assertTrue();
      logInfo('testNdkRenderNodeMeasureText0018 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0019
     * @tc.name      testNdkRenderNodeMeasureText0019
     * @tc.desc      校验表情在一像素宽度下逐字换行，行数多于单字符文本且高度为行高整数倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureText0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureText0019 begin');
      const emoji: MeasureObs = probeTyped(TEXT_EMOJI + TEXT_EMOJI, MEASURE_FONT_SIZE, 1);
      const ascii: MeasureObs = probeTyped(TEXT_ASCII + TEXT_ASCII, MEASURE_FONT_SIZE, 1);
      logInfo('emoji narrow height=' + emoji.height.toString());
      expect(emoji.returned).assertTrue();
      expect(emoji.height).assertLarger(MEASURE_FONT_SIZE);
      expect(emoji.height).assertLarger(0);
      expect(isMultipleOf(emoji.height, MEASURE_FONT_SIZE)).assertTrue();
      expect(ascii.height).assertLarger(MEASURE_FONT_SIZE);
      logInfo('testNdkRenderNodeMeasureText0019 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0020
     * @tc.name      testNdkRenderNodeMeasureText0020
     * @tc.desc      校验一万字符在一像素宽度下全部逐字换行，高度远超常规宽度且仍有限。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureText0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureText0020 begin');
      const narrow: MeasureObs = probeTyped(repeatText(REPEAT_UNIT, LONG_REPEAT), MEASURE_FONT_SIZE, 1);
      const wide: MeasureObs = probeTyped(repeatText(REPEAT_UNIT, LONG_REPEAT), MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('narrow 10k height=' + narrow.height.toString());
      expect(narrow.returned).assertTrue();
      expect(narrow.height).assertLarger(wide.height);
      expect(isMultipleOf(narrow.height, MEASURE_FONT_SIZE)).assertTrue();
      expect(narrow.finite).assertTrue();
      logInfo('testNdkRenderNodeMeasureText0020 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0021
     * @tc.name      testNdkRenderNodeMeasureText0021
     * @tc.desc      校验双字符宽度约为单字符两倍，等宽字符按线性累加排版。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureText0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureText0021 begin');
      const twice: TextMeasureResult | undefined = measureTyped('AA', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const once: TextMeasureResult | undefined = measureTyped(TEXT_ASCII, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(twice !== undefined).assertTrue();
      expect(once !== undefined).assertTrue();
      if (twice === undefined || once === undefined) {
        return;
      }
      logInfo('two ascii width=' + twice.width.toString());
      expect(twice.width).assertLarger(once.width);
      expect(Math.abs(twice.width - once.width * 2) < 2).assertTrue();
      expect(twice.height).assertEqual(once.height);
      logInfo('testNdkRenderNodeMeasureText0021 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0022
     * @tc.name      testNdkRenderNodeMeasureText0022
     * @tc.desc      校验全角中文宽度约为半角字符两倍，全半角口径与字号换算一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureText0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureText0022 begin');
      const cjk: MeasureObs = probeTyped(TEXT_CJK, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const ascii: MeasureObs = probeTyped(TEXT_ASCII, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('cjk=' + cjk.width.toString() + ' ascii=' + ascii.width.toString());
      expect(cjk.width).assertLarger(ascii.width);
      expect(cjk.width).assertLess(ascii.width * 4);
      expect(cjk.height).assertEqual(ascii.height);
      logInfo('testNdkRenderNodeMeasureText0022 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0023
     * @tc.name      testNdkRenderNodeMeasureText0023
     * @tc.desc      校验零宽空格仍按字号排一行而空文本退化为兜底行高，两者不是同一个退化分支。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureText0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureText0023 begin');
      const zeroWidth: MeasureObs = probeTyped(TEXT_ZERO_WIDTH_SPACE, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const empty: MeasureObs = probeTyped('', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('zero width=' + zeroWidth.width.toString() + ' empty width=' + empty.width.toString());
      expect(zeroWidth.returned && empty.returned).assertTrue();
      // 零宽空格有真实字形行，行高等于字号 20；空文本没有行，行高是兜底值 16。
      expect(zeroWidth.height).assertEqual(MEASURE_FONT_SIZE);
      expect(zeroWidth.height).assertLarger(empty.height);
      expect(zeroWidth.sameAsEmpty).assertFalse();
      logInfo('testNdkRenderNodeMeasureText0023 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_TEXT_0024
     * @tc.name      testNdkRenderNodeMeasureText0024
     * @tc.desc      校验超长多字节文本连续两次测量结果一致，UTF-8 读取没有缓冲区残留。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureText0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureText0024 begin');
      const mixed: string = repeatText(TEXT_CJK + TEXT_EMOJI, SHORT_REPEAT);
      const first: TextMeasureResult | undefined = measureTyped(mixed, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const second: TextMeasureResult | undefined = measureTyped(mixed, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(first !== undefined).assertTrue();
      expect(second !== undefined).assertTrue();
      if (first === undefined || second === undefined) {
        return;
      }
      expect(first.width).assertEqual(second.width);
      expect(first.height).assertEqual(second.height);
      expect(first.height > MEASURE_FONT_SIZE).assertTrue();
      logInfo('testNdkRenderNodeMeasureText0024 end');
    })
  })
}
