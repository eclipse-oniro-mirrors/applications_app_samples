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
  MEASURE_MAX_FONT,
  MEASURE_MAX_WIDTH,
  MEASURE_MIN_FONT,
  MeasureObs,
  measureTyped,
  probeAbsent,
  probeAllInvalid,
  probeTyped,
  probeValue,
  SLOT_FONT,
  SLOT_TEXT,
  SLOT_WIDTH
} from './MeasureArgProbe';

const TAG: string = '[Sample_NdkRenderNodeMeasureArgTest]';
const DOMAIN: number = 0xF811;

class PlainHolder {
}

// 类型错误的实参：数值上与基线等价，但 napi 类型不对，用于确认入口按类型判定而不是按数值判定。
const ARG_TEXT_NUMBER: Object = 12345;
const ARG_TEXT_BOOLEAN: Object = true;
const ARG_TEXT_OBJECT: Object = new PlainHolder();
const ARG_TEXT_ARRAY: Object = [1, 2, 3];
const ARG_FONT_STRING: Object = '20';
const ARG_FONT_BOOLEAN: Object = true;
const ARG_FONT_OBJECT: Object = new PlainHolder();
const ARG_FONT_ARRAY: Object = [20];
const ARG_WIDTH_STRING: Object = '400';
const ARG_WIDTH_BOOLEAN: Object = true;
const ARG_WIDTH_OBJECT: Object = new PlainHolder();
const ARG_WIDTH_ARRAY: Object = [400];

// 字号区间与夹取边界，取自 cpp/drawing/drawing_text.cpp 的 MIN_FONT_SIZE 与 MAX_FONT_SIZE。
const FONT_BELOW_MIN: number = 11.999;
const FONT_ABOVE_MAX: number = 96.001;
const FONT_NEGATIVE_ZERO: number = -0;
const FONT_MAX_VALUE: number = Number.MAX_VALUE;
const FONT_SAFE_INT: number = Number.MAX_SAFE_INTEGER;
const FONT_POSITIVE_INFINITY: number = Number.POSITIVE_INFINITY;
const FONT_NEGATIVE_INFINITY: number = Number.NEGATIVE_INFINITY;
const FONT_NAN: number = Number.NaN;

// 排版宽度边界：最小正数、最小可分辨增量、最大安全值与负向极值。
const WIDTH_TINY: number = Number.MIN_VALUE;
const WIDTH_EPSILON: number = Number.EPSILON;
const WIDTH_MAX_VALUE: number = Number.MAX_VALUE;
const WIDTH_NEG_MAX_VALUE: number = -Number.MAX_VALUE;
const WIDTH_NARROW: number = 1;

const TEXT_EMPTY: string = '';
const TEXT_SINGLE: string = 'A';
const TEXT_CJK: string = String.fromCharCode(0x4F60, 0x597D);
const TEXT_DIGITS: string = '1234567890';

// 超长文本：一万字符，用于触发大量换行。
const LONG_UNIT: string = 'RenderNode';
const LONG_REPEAT: number = 10000;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function buildLongText(): string {
  return LONG_UNIT.repeat(LONG_REPEAT / LONG_UNIT.length);
}

// 行数判定：排版高度是行高的整数倍，用于排除小数行。
function isMultipleOf(actual: number, unit: number): boolean {
  if (actual <= 0 || unit <= 0) {
    return false;
  }
  const ratio: number = actual / unit;
  return Math.abs(ratio - Math.round(ratio)) < 1e-3;
}

export default function ndkRenderNodeMeasureArgTest(): void {
  describe('NdkRenderNodeMeasureArg', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0001
     * @tc.name      testNdkRenderNodeMeasureArg0001
     * @tc.desc      校验基线入参下测量返回对象，宽度为正且行高等于字号，与同参基线完全一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeMeasureArg0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeMeasureArg0001 begin');
      const observed: MeasureObs = probeTyped('RenderNode', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('baseline width=' + observed.width.toString() + ' height=' + observed.height.toString());
      expect(observed.callSafe).assertTrue();
      expect(observed.returned).assertTrue();
      expect(observed.widthPositive).assertTrue();
      expect(observed.heightIsFontSize).assertTrue();
      expect(observed.fieldCount).assertEqual(2);
      expect(observed.sameAsBaseline).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0002
     * @tc.name      testNdkRenderNodeMeasureArg0002
     * @tc.desc      校验空文本宽度为负哨兵且高度取兜底行高（低于字号），返回值形态与正常文本一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeMeasureArg0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeMeasureArg0002 begin');
      const observed: MeasureObs = probeTyped(TEXT_EMPTY, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('empty width=' + observed.width.toString() + ' height=' + observed.height.toString());
      expect(observed.returned).assertTrue();
      expect(observed.widthNonPositive).assertTrue();
      expect(observed.heightPositive).assertTrue();
      // 空文本没有真实字形行，实测高度是兜底行高 16，不等于按字号排一行的高度 20。
      expect(observed.height).assertLess(MEASURE_FONT_SIZE);
      expect(observed.hasWidthField && observed.hasHeightField).assertTrue();
      expect(observed.sameAsBaseline).assertFalse();
      logInfo('testNdkRenderNodeMeasureArg0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0003
     * @tc.name      testNdkRenderNodeMeasureArg0003
     * @tc.desc      校验单字符宽度为正且小于同字号下的单词宽度，行高仍等于字号。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0003 begin');
      const observed: MeasureObs = probeTyped(TEXT_SINGLE, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const word: MeasureObs = probeTyped('RenderNode', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('single width=' + observed.width.toString() + ' word width=' + word.width.toString());
      expect(observed.widthPositive).assertTrue();
      expect(observed.width).assertLess(word.width);
      expect(observed.width).assertLess(MEASURE_MAX_WIDTH);
      expect(observed.heightIsFontSize).assertTrue();
      expect(observed.sameAsEmpty).assertFalse();
      logInfo('testNdkRenderNodeMeasureArg0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0004
     * @tc.name      testNdkRenderNodeMeasureArg0004
     * @tc.desc      校验两字中文按全角排版，宽度约为字号的二倍且行高等于字号。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0004 begin');
      const observed: MeasureObs = probeTyped(TEXT_CJK, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const fullWidth: number = MEASURE_FONT_SIZE * 2;
      logInfo('cjk width=' + observed.width.toString());
      expect(observed.widthPositive).assertTrue();
      expect(Math.abs(observed.width - fullWidth) < MEASURE_FONT_SIZE).assertTrue();
      expect(observed.heightIsFontSize).assertTrue();
      expect(observed.finite).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0005
     * @tc.name      testNdkRenderNodeMeasureArg0005
     * @tc.desc      校验十位数字串宽度大于单字符，数字按等宽字形排版。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0005 begin');
      const digits: MeasureObs = probeTyped(TEXT_DIGITS, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const single: MeasureObs = probeTyped(TEXT_SINGLE, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(digits.widthPositive).assertTrue();
      expect(digits.width).assertLarger(single.width);
      expect(digits.heightIsFontSize).assertTrue();
      expect(isMultipleOf(digits.height, MEASURE_FONT_SIZE)).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0006
     * @tc.name      testNdkRenderNodeMeasureArg0006
     * @tc.desc      校验一像素排版宽度下逐字换行，单行宽度仍超过入参上限而总高度按行累加。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0006 begin');
      const observed: MeasureObs = probeTyped('RenderNode', MEASURE_FONT_SIZE, WIDTH_NARROW);
      logInfo('narrow width=' + observed.width.toString() + ' height=' + observed.height.toString());
      expect(observed.returned).assertTrue();
      // 单个字形就宽于一像素上限，排版无法把行宽压进入参之内，只能逐字换行。
      expect(observed.width).assertLarger(WIDTH_NARROW);
      expect(observed.width).assertLess(MEASURE_FONT_SIZE * 2);
      expect(observed.height > MEASURE_FONT_SIZE).assertTrue();
      expect(isMultipleOf(observed.height, MEASURE_FONT_SIZE)).assertTrue();
      expect(observed.finite).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0006 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0007
     * @tc.name      testNdkRenderNodeMeasureArg0007
     * @tc.desc      校验下界字号 12 下测量不触发夹取，行高恰为 12 像素。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0007 begin');
      const observed: MeasureObs = probeTyped('RenderNode', MEASURE_MIN_FONT, MEASURE_MAX_WIDTH);
      logInfo('min font height=' + observed.height.toString());
      expect(observed.returned).assertTrue();
      expect(Math.abs(observed.height - MEASURE_MIN_FONT) < 1).assertTrue();
      expect(observed.widthPositive).assertTrue();
      expect(observed.heightIsFontSize).assertFalse();
      logInfo('testNdkRenderNodeMeasureArg0007 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0008
     * @tc.name      testNdkRenderNodeMeasureArg0008
     * @tc.desc      校验上界字号 96 下排版高度为字号的整数倍，不会出现小数行。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0008 begin');
      const observed: MeasureObs = probeTyped('RenderNode', MEASURE_MAX_FONT, MEASURE_MAX_WIDTH);
      logInfo('max font height=' + observed.height.toString());
      expect(observed.returned).assertTrue();
      expect(observed.height).assertLarger(MEASURE_MAX_FONT - 1);
      expect(isMultipleOf(observed.height, MEASURE_MAX_FONT)).assertTrue();
      expect(observed.finite).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0008 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0009
     * @tc.name      testNdkRenderNodeMeasureArg0009
     * @tc.desc      校验负零字号被夹取到下界 12，与显式传 12 的排版结果一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0009 begin');
      const observed: MeasureObs = probeValue(SLOT_FONT, FONT_NEGATIVE_ZERO);
      const atMin: MeasureObs = probeTyped('RenderNode', MEASURE_MIN_FONT, MEASURE_MAX_WIDTH);
      logInfo('negative zero height=' + observed.height.toString());
      expect(observed.returned).assertTrue();
      expect(Math.abs(observed.height - atMin.height) < 1).assertTrue();
      expect(observed.valueKind).assertEqual('number');
      expect(observed.widthPositive).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0009 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0010
     * @tc.name      testNdkRenderNodeMeasureArg0010
     * @tc.desc      校验略低于下界的字号 11.999 同样被夹取到 12，边界附近的小偏差不放过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0010 begin');
      const observed: MeasureObs = probeValue(SLOT_FONT, FONT_BELOW_MIN);
      logInfo('below min height=' + observed.height.toString());
      expect(observed.returned).assertTrue();
      expect(Math.abs(observed.height - MEASURE_MIN_FONT) < 1).assertTrue();
      expect(observed.finite).assertTrue();
      expect(observed.fieldCount).assertEqual(2);
      logInfo('testNdkRenderNodeMeasureArg0010 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0011
     * @tc.name      testNdkRenderNodeMeasureArg0011
     * @tc.desc      校验略高于上界的字号 96.001 被夹取到 96，结果与显式传 96 完全一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0011 begin');
      const observed: MeasureObs = probeValue(SLOT_FONT, FONT_ABOVE_MAX);
      const atMax: MeasureObs = probeTyped('RenderNode', MEASURE_MAX_FONT, MEASURE_MAX_WIDTH);
      expect(observed.returned).assertTrue();
      expect(Math.abs(observed.height - atMax.height) < 1).assertTrue();
      expect(isMultipleOf(observed.height, MEASURE_MAX_FONT)).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0011 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0012
     * @tc.name      testNdkRenderNodeMeasureArg0012
     * @tc.desc      校验排版宽度取最小正数时仍进入排版分支，结果为有限正行高而非零值。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureArg0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureArg0012 begin');
      const observed: MeasureObs = probeValue(SLOT_WIDTH, WIDTH_TINY);
      logInfo('tiny width height=' + observed.height.toString());
      expect(observed.returned).assertTrue();
      expect(observed.heightPositive).assertTrue();
      expect(observed.height > MEASURE_FONT_SIZE).assertTrue();
      expect(observed.finite).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0012 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0013
     * @tc.name      testNdkRenderNodeMeasureArg0013
     * @tc.desc      校验负的最小正数宽度被参数校验拦截，返回宽高均为 0 的结果。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0013 begin');
      const observed: MeasureObs = probeValue(SLOT_WIDTH, -WIDTH_TINY);
      expect(observed.returned).assertTrue();
      expect(observed.width).assertEqual(0);
      expect(observed.height).assertEqual(0);
      expect(observed.widthNonPositive).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0013 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0014
     * @tc.name      testNdkRenderNodeMeasureArg0014
     * @tc.desc      校验排版宽度为 0 时走参数校验分支，返回零宽零高而不是负哨兵。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeMeasureArg0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeMeasureArg0014 begin');
      const observed: MeasureObs = probeValue(SLOT_WIDTH, 0);
      expect(observed.returned).assertTrue();
      expect(observed.height).assertEqual(0);
      expect(observed.fieldCount).assertEqual(2);
      expect(observed.sameAsEmpty).assertFalse();
      expect(observed.finite).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0014 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0015
     * @tc.name      testNdkRenderNodeMeasureArg0015
     * @tc.desc      校验排版宽度取最小可分辨增量 2.2e-16 时仍为正数并进入排版分支。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureArg0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureArg0015 begin');
      const observed: MeasureObs = probeValue(SLOT_WIDTH, WIDTH_EPSILON);
      const narrow: MeasureObs = probeTyped('RenderNode', MEASURE_FONT_SIZE, WIDTH_NARROW);
      expect(observed.returned).assertTrue();
      expect(observed.heightPositive).assertTrue();
      expect(observed.height).assertLarger(MEASURE_FONT_SIZE);
      expect(observed.belowNaturalWidth).assertFalse();
      expect(observed.repeatStable).assertTrue();
      expect(narrow.repeatStable).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0015 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0016
     * @tc.name      testNdkRenderNodeMeasureArg0016
     * @tc.desc      校验排版宽度从一像素放宽到四百像素后行数下降，换行对宽度敏感。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0016 begin');
      const narrow: MeasureObs = probeTyped('RenderNode', MEASURE_FONT_SIZE, WIDTH_NARROW);
      const wide: MeasureObs = probeTyped('RenderNode', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(narrow.height).assertLarger(wide.height);
      expect(wide.heightIsFontSize).assertTrue();
      expect(narrow.repeatStable).assertTrue();
      expect(wide.repeatStable).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0016 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0017
     * @tc.name      testNdkRenderNodeMeasureArg0017
     * @tc.desc      校验文本入参为数字时读取字符串失败，测量结果与空文本完全一致（含兜底行高）。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeMeasureArg0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeMeasureArg0017 begin');
      const observed: MeasureObs = probeValue(SLOT_TEXT, ARG_TEXT_NUMBER);
      logInfo('text number kind=' + observed.valueKind + ' width=' + observed.width.toString());
      expect(observed.callSafe).assertTrue();
      expect(observed.valueKind).assertEqual('number');
      expect(observed.returned).assertTrue();
      expect(observed.sameAsEmpty).assertTrue();
      expect(observed.widthNonPositive).assertTrue();
      // 数字入参读字符串失败后与空文本同走兜底分支，高度低于字号。
      expect(observed.height).assertLess(MEASURE_FONT_SIZE);
      logInfo('testNdkRenderNodeMeasureArg0017 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0018
     * @tc.name      testNdkRenderNodeMeasureArg0018
     * @tc.desc      校验文本入参为布尔值时退化为空文本，宽度为负哨兵且不抛异常。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0018 begin');
      const observed: MeasureObs = probeValue(SLOT_TEXT, ARG_TEXT_BOOLEAN);
      expect(observed.callSafe).assertTrue();
      expect(observed.valueKind).assertEqual('boolean');
      expect(observed.sameAsEmpty).assertTrue();
      expect(observed.sameAsBaseline).assertFalse();
      logInfo('testNdkRenderNodeMeasureArg0018 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0019
     * @tc.name      testNdkRenderNodeMeasureArg0019
     * @tc.desc      校验文本入参为普通对象时退化为空文本，返回值仍是两字段对象。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0019 begin');
      const observed: MeasureObs = probeValue(SLOT_TEXT, ARG_TEXT_OBJECT);
      expect(observed.returned).assertTrue();
      expect(observed.valueKind).assertEqual('object');
      expect(observed.sameAsEmpty).assertTrue();
      expect(observed.fieldCount).assertEqual(2);
      logInfo('testNdkRenderNodeMeasureArg0019 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0020
     * @tc.name      testNdkRenderNodeMeasureArg0020
     * @tc.desc      校验文本入参为数组时不按逗号拼接，排版结果与空文本一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureArg0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureArg0020 begin');
      const observed: MeasureObs = probeValue(SLOT_TEXT, ARG_TEXT_ARRAY);
      const asText: MeasureObs = probeTyped('1,2,3', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(observed.sameAsEmpty).assertTrue();
      expect(observed.widthNonPositive).assertTrue();
      expect(observed.width).assertLess(asText.width);
      logInfo('testNdkRenderNodeMeasureArg0020 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0021
     * @tc.name      testNdkRenderNodeMeasureArg0021
     * @tc.desc      校验文本入参为 undefined 时退化为空文本，调用安全且宽度非正。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0021 begin');
      const observed: MeasureObs = probeAbsent(SLOT_TEXT, false);
      expect(observed.callSafe).assertTrue();
      expect(observed.valueKind).assertEqual('undefined');
      expect(observed.sameAsEmpty).assertTrue();
      expect(observed.heightPositive).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0021 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0022
     * @tc.name      testNdkRenderNodeMeasureArg0022
     * @tc.desc      校验文本入参为 null 时与 undefined 表现一致，同样退化为空文本。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0022 begin');
      const observed: MeasureObs = probeAbsent(SLOT_TEXT, true);
      expect(observed.valueKind).assertEqual('null');
      expect(observed.sameAsEmpty).assertTrue();
      expect(observed.widthNonPositive).assertTrue();
      expect(observed.finite).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0022 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0023
     * @tc.name      testNdkRenderNodeMeasureArg0023
     * @tc.desc      校验字号入参为字符串时类型校验失败，入口返回 undefined 而非零值对象。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeMeasureArg0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeMeasureArg0023 begin');
      const observed: MeasureObs = probeValue(SLOT_FONT, ARG_FONT_STRING);
      logInfo('font string returned=' + observed.returned.toString());
      expect(observed.callSafe).assertTrue();
      expect(observed.valueKind).assertEqual('string');
      expect(observed.returned).assertFalse();
      expect(observed.fieldCount).assertEqual(0);
      logInfo('testNdkRenderNodeMeasureArg0023 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0024
     * @tc.name      testNdkRenderNodeMeasureArg0024
     * @tc.desc      校验字号入参为 undefined 时入口返回 undefined，与零宽度返回零值对象区分开。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeMeasureArg0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeMeasureArg0024 begin');
      const observed: MeasureObs = probeAbsent(SLOT_FONT, false);
      const zeroWidth: MeasureObs = probeValue(SLOT_WIDTH, 0);
      expect(observed.returned).assertFalse();
      expect(observed.valueKind).assertEqual('undefined');
      expect(zeroWidth.returned).assertTrue();
      expect(observed.returned === zeroWidth.returned).assertFalse();
      logInfo('testNdkRenderNodeMeasureArg0024 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0025
     * @tc.name      testNdkRenderNodeMeasureArg0025
     * @tc.desc      校验字号入参为 null 时入口返回 undefined，返回值形态与合法调用不同。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0025 begin');
      const observed: MeasureObs = probeAbsent(SLOT_FONT, true);
      const legal: MeasureObs = probeTyped('RenderNode', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(observed.valueKind).assertEqual('null');
      expect(observed.returned).assertFalse();
      expect(legal.returned).assertTrue();
      expect(observed.sameAsBaseline).assertFalse();
      logInfo('testNdkRenderNodeMeasureArg0025 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0026
     * @tc.name      testNdkRenderNodeMeasureArg0026
     * @tc.desc      校验字号入参为布尔值时入口返回 undefined，不把 true 当成 1 号字号。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureArg0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureArg0026 begin');
      const observed: MeasureObs = probeValue(SLOT_FONT, ARG_FONT_BOOLEAN);
      expect(observed.valueKind).assertEqual('boolean');
      expect(observed.returned).assertFalse();
      expect(observed.callSafe).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0026 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0027
     * @tc.name      testNdkRenderNodeMeasureArg0027
     * @tc.desc      校验字号入参为普通对象时入口返回 undefined，不读取对象内的数值字段。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureArg0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureArg0027 begin');
      const observed: MeasureObs = probeValue(SLOT_FONT, ARG_FONT_OBJECT);
      expect(observed.valueKind).assertEqual('object');
      expect(observed.returned).assertFalse();
      expect(observed.width).assertEqual(0);
      logInfo('testNdkRenderNodeMeasureArg0027 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0028
     * @tc.name      testNdkRenderNodeMeasureArg0028
     * @tc.desc      校验字号入参为数组时入口返回 undefined，长度不参与字号推导。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureArg0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureArg0028 begin');
      const observed: MeasureObs = probeValue(SLOT_FONT, ARG_FONT_ARRAY);
      expect(observed.returned).assertFalse();
      expect(observed.height).assertEqual(0);
      expect(observed.callSafe).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0028 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0029
     * @tc.name      testNdkRenderNodeMeasureArg0029
     * @tc.desc      校验排版宽度入参为字符串时入口返回 undefined，不把 '400' 解析成 400。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeMeasureArg0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeMeasureArg0029 begin');
      const observed: MeasureObs = probeValue(SLOT_WIDTH, ARG_WIDTH_STRING);
      const legal: MeasureObs = probeTyped('RenderNode', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(observed.valueKind).assertEqual('string');
      expect(observed.returned).assertFalse();
      expect(legal.returned).assertTrue();
      expect(observed.repeatStable).assertFalse();
      logInfo('testNdkRenderNodeMeasureArg0029 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0030
     * @tc.name      testNdkRenderNodeMeasureArg0030
     * @tc.desc      校验排版宽度入参为布尔值、对象与数组时入口一律返回 undefined。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0030 begin');
      const asBoolean: MeasureObs = probeValue(SLOT_WIDTH, ARG_WIDTH_BOOLEAN);
      const asObject: MeasureObs = probeValue(SLOT_WIDTH, ARG_WIDTH_OBJECT);
      const asArray: MeasureObs = probeValue(SLOT_WIDTH, ARG_WIDTH_ARRAY);
      expect(asBoolean.returned).assertFalse();
      expect(asObject.returned).assertFalse();
      expect(asArray.returned).assertFalse();
      expect(asBoolean.valueKind).assertEqual('boolean');
      logInfo('testNdkRenderNodeMeasureArg0030 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0031
     * @tc.name      testNdkRenderNodeMeasureArg0031
     * @tc.desc      校验字号取最大双精度数时被夹取到上界 96，不产生无穷或 NaN。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0031 begin');
      const observed: MeasureObs = probeValue(SLOT_FONT, FONT_MAX_VALUE);
      logInfo('max double font height=' + observed.height.toString());
      expect(observed.returned).assertTrue();
      expect(observed.finite).assertTrue();
      expect(isMultipleOf(observed.height, MEASURE_MAX_FONT)).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0031 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0032
     * @tc.name      testNdkRenderNodeMeasureArg0032
     * @tc.desc      校验字号取最大安全整数时同样夹取到 96，精度边界不改变夹取结果。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureArg0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureArg0032 begin');
      const observed: MeasureObs = probeValue(SLOT_FONT, FONT_SAFE_INT);
      const atMax: MeasureObs = probeValue(SLOT_FONT, FONT_ABOVE_MAX);
      expect(observed.returned).assertTrue();
      expect(Math.abs(observed.height - atMax.height) < 1).assertTrue();
      expect(observed.callSafe).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0032 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0033
     * @tc.name      testNdkRenderNodeMeasureArg0033
     * @tc.desc      校验字号为正无穷时被夹取到上界，测量结果仍为有限正数。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0033 begin');
      const observed: MeasureObs = probeValue(SLOT_FONT, FONT_POSITIVE_INFINITY);
      expect(observed.returned).assertTrue();
      expect(observed.finite).assertTrue();
      expect(observed.heightPositive).assertTrue();
      expect(observed.widthPositive).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0033 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0034
     * @tc.name      testNdkRenderNodeMeasureArg0034
     * @tc.desc      校验字号为负无穷时被夹取到下界 12，不会产生负行高。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0034 begin');
      const observed: MeasureObs = probeValue(SLOT_FONT, FONT_NEGATIVE_INFINITY);
      expect(observed.returned).assertTrue();
      expect(Math.abs(observed.height - MEASURE_MIN_FONT) < 1).assertTrue();
      expect(observed.heightPositive).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0034 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0035
     * @tc.name      testNdkRenderNodeMeasureArg0035
     * @tc.desc      校验字号为 NaN 时两次夹取比较都不成立，排版失败后退回零宽零高。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureArg0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureArg0035 begin');
      const observed: MeasureObs = probeValue(SLOT_FONT, FONT_NAN);
      logInfo('nan font width=' + observed.width.toString() + ' height=' + observed.height.toString());
      expect(observed.returned).assertTrue();
      expect(observed.finite).assertTrue();
      expect(observed.width).assertEqual(0);
      expect(observed.height).assertEqual(0);
      expect(observed.fieldCount).assertEqual(2);
      logInfo('testNdkRenderNodeMeasureArg0035 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0036
     * @tc.name      testNdkRenderNodeMeasureArg0036
     * @tc.desc      校验排版宽度取最大双精度数时等同不受限排版，结果与常规宽度一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0036 begin');
      const observed: MeasureObs = probeValue(SLOT_WIDTH, WIDTH_MAX_VALUE);
      logInfo('huge width height=' + observed.height.toString());
      expect(observed.returned).assertTrue();
      expect(observed.sameAsBaseline).assertTrue();
      expect(observed.heightIsFontSize).assertTrue();
      expect(observed.belowNaturalWidth).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0036 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0037
     * @tc.name      testNdkRenderNodeMeasureArg0037
     * @tc.desc      校验排版宽度取最大负值时被拦截，与其它非正宽度表现一致返回零值。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0037 begin');
      const observed: MeasureObs = probeValue(SLOT_WIDTH, WIDTH_NEG_MAX_VALUE);
      expect(observed.returned).assertTrue();
      expect(observed.width).assertEqual(0);
      expect(observed.height).assertEqual(0);
      expect(observed.sameAsEmpty).assertFalse();
      logInfo('testNdkRenderNodeMeasureArg0037 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0038
     * @tc.name      testNdkRenderNodeMeasureArg0038
     * @tc.desc      校验一万字符文本在四百像素宽下大量换行，行数为整数且远超单行。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0038 begin');
      const observed: MeasureObs = probeTyped(buildLongText(), MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('long text height=' + observed.height.toString());
      expect(observed.returned).assertTrue();
      expect(observed.height).assertLarger(MEASURE_FONT_SIZE * 10);
      expect(isMultipleOf(observed.height, MEASURE_FONT_SIZE)).assertTrue();
      expect(observed.belowNaturalWidth).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0038 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0039
     * @tc.name      testNdkRenderNodeMeasureArg0039
     * @tc.desc      校验文本类型错而字号与宽度合法时仍返回对象，宽度为负哨兵且高度取兜底行高。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0039 begin');
      const observed: MeasureObs = probeAllInvalid(ARG_TEXT_NUMBER, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(observed.returned).assertTrue();
      expect(observed.sameAsEmpty).assertTrue();
      expect(observed.widthNonPositive).assertTrue();
      // 文本类型错等价于空文本：宽度为负哨兵，高度取兜底行高。
      expect(observed.height).assertLess(MEASURE_FONT_SIZE);
      logInfo('testNdkRenderNodeMeasureArg0039 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0040
     * @tc.name      testNdkRenderNodeMeasureArg0040
     * @tc.desc      校验文本类型错且字号类型错时入口返回 undefined，字号校验优先于排版。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0040 begin');
      const observed: MeasureObs = probeAllInvalid(ARG_TEXT_NUMBER, ARG_FONT_STRING, MEASURE_MAX_WIDTH);
      expect(observed.returned).assertFalse();
      expect(observed.callSafe).assertTrue();
      expect(observed.height).assertEqual(0);
      logInfo('testNdkRenderNodeMeasureArg0040 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0041
     * @tc.name      testNdkRenderNodeMeasureArg0041
     * @tc.desc      校验文本合法而字号与宽度类型都错时入口返回 undefined。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureArg0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureArg0041 begin');
      const observed: MeasureObs = probeAllInvalid('RenderNode', ARG_FONT_STRING, ARG_WIDTH_STRING);
      expect(observed.returned).assertFalse();
      expect(observed.fieldCount).assertEqual(0);
      expect(observed.width).assertEqual(0);
      logInfo('testNdkRenderNodeMeasureArg0041 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0042
     * @tc.name      testNdkRenderNodeMeasureArg0042
     * @tc.desc      校验文本类型错而宽度类型也错时入口返回 undefined，空文本不会进入排版。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureArg0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureArg0042 begin');
      const observed: MeasureObs = probeAllInvalid(ARG_TEXT_NUMBER, MEASURE_FONT_SIZE, ARG_WIDTH_STRING);
      const textOnly: MeasureObs = probeValue(SLOT_TEXT, ARG_TEXT_NUMBER);
      expect(observed.returned).assertFalse();
      expect(observed.callSafe).assertTrue();
      expect(textOnly.returned).assertTrue();
      expect(observed.returned === textOnly.returned).assertFalse();
      logInfo('testNdkRenderNodeMeasureArg0042 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0043
     * @tc.name      testNdkRenderNodeMeasureArg0043
     * @tc.desc      校验三个实参同时类型错时入口返回 undefined，不会退化成零值对象。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureArg0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureArg0043 begin');
      const observed: MeasureObs = probeAllInvalid(ARG_TEXT_NUMBER, ARG_FONT_STRING, ARG_WIDTH_STRING);
      const zeroWidth: MeasureObs = probeValue(SLOT_WIDTH, 0);
      expect(observed.returned).assertFalse();
      expect(zeroWidth.returned).assertTrue();
      expect(observed.width).assertEqual(zeroWidth.width);
      logInfo('testNdkRenderNodeMeasureArg0043 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0044
     * @tc.name      testNdkRenderNodeMeasureArg0044
     * @tc.desc      校验字号类型错而宽度为 0 时仍先报字号错误，返回值不是零值对象。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureArg0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureArg0044 begin');
      const observed: MeasureObs = probeAllInvalid('RenderNode', ARG_FONT_STRING, 0);
      const zeroWidth: MeasureObs = probeAllInvalid('RenderNode', MEASURE_FONT_SIZE, 0);
      expect(observed.returned).assertFalse();
      expect(zeroWidth.returned).assertTrue();
      expect(zeroWidth.height).assertEqual(0);
      expect(observed.callSafe).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0044 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0045
     * @tc.name      testNdkRenderNodeMeasureArg0045
     * @tc.desc      校验同一入参连续两次测量结果一致，探针内建的复核判定同时成立。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0045 begin');
      const first: MeasureObs = probeTyped('RenderNode', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const second: MeasureObs = probeTyped('RenderNode', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(first.repeatStable).assertTrue();
      expect(second.repeatStable).assertTrue();
      expect(first.width).assertEqual(second.width);
      expect(first.height).assertEqual(second.height);
      logInfo('testNdkRenderNodeMeasureArg0045 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0046
     * @tc.name      testNdkRenderNodeMeasureArg0046
     * @tc.desc      校验一次类型错误的字号调用之后，合法测量结果与基线完全一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasureArg0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasureArg0046 begin');
      const failed: MeasureObs = probeValue(SLOT_FONT, ARG_FONT_STRING);
      const after: MeasureObs = probeTyped('RenderNode', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(failed.returned).assertFalse();
      expect(after.returned).assertTrue();
      expect(after.sameAsBaseline).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0046 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0047
     * @tc.name      testNdkRenderNodeMeasureArg0047
     * @tc.desc      校验二十次非法调用之后合法测量仍与基线一致，非法入参不污染模块状态。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureArg0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureArg0047 begin');
      let failures: number = 0;
      for (let index = 0; index < 20; index++) {
        const failed: MeasureObs = probeValue(SLOT_WIDTH, ARG_WIDTH_STRING);
        if (!failed.returned && failed.callSafe) {
          failures += 1;
        }
      }
      const after: MeasureObs = probeTyped('RenderNode', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('illegal calls rejected=' + failures.toString());
      expect(failures).assertEqual(20);
      expect(after.returned).assertTrue();
      expect(after.sameAsBaseline).assertTrue();
      expect(after.heightIsFontSize).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0047 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0048
     * @tc.name      testNdkRenderNodeMeasureArg0048
     * @tc.desc      校验每次合法测量都返回新对象，改写上次结果不影响下一次测量。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureArg0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureArg0048 begin');
      const first: TextMeasureResult | undefined = measureTyped('RenderNode', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const second: TextMeasureResult | undefined = measureTyped('RenderNode', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(first !== undefined).assertTrue();
      expect(second !== undefined).assertTrue();
      if (first === undefined || second === undefined) {
        return;
      }
      expect(first === second).assertFalse();
      first.width = -1;
      const third: TextMeasureResult | undefined = measureTyped('RenderNode', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(third !== undefined).assertTrue();
      if (third === undefined) {
        return;
      }
      expect(third.width > 0).assertTrue();
      expect(third.height).assertEqual(second.height);
      logInfo('testNdkRenderNodeMeasureArg0048 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0049
     * @tc.name      testNdkRenderNodeMeasureArg0049
     * @tc.desc      校验类型错误文本的重复测量同样稳定，退化路径没有随机性。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureArg0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureArg0049 begin');
      const observed: MeasureObs = probeValue(SLOT_TEXT, ARG_TEXT_NUMBER);
      const again: MeasureObs = probeValue(SLOT_TEXT, ARG_TEXT_NUMBER);
      expect(observed.repeatStable).assertTrue();
      expect(observed.width).assertEqual(again.width);
      expect(observed.height).assertEqual(again.height);
      expect(observed.sameAsEmpty).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0049 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_ARG_0050
     * @tc.name      testNdkRenderNodeMeasureArg0050
     * @tc.desc      校验合法与非法调用交替进行后测量结果保持不变，入口无跨调用残留。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasureArg0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasureArg0050 begin');
      const legal: MeasureObs = probeTyped('RenderNode', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const illegal: MeasureObs = probeValue(SLOT_FONT, ARG_FONT_OBJECT);
      const legalAgain: MeasureObs = probeTyped('RenderNode', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(illegal.returned).assertFalse();
      expect(legalAgain.width).assertEqual(legal.width);
      expect(legalAgain.height).assertEqual(legal.height);
      expect(legalAgain.sameAsBaseline).assertTrue();
      logInfo('testNdkRenderNodeMeasureArg0050 end');
    })
  })
}
