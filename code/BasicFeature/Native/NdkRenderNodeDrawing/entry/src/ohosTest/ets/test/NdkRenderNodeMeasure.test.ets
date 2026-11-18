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
import bridge, { TextMeasureResult } from 'libentry.so';

const TAG: string = '[Sample_NdkRenderNodeMeasureTest]';
const DOMAIN: number = 0xF811;
const BASE_TEXT: string = 'RenderNode';
// 十二种文本的命名常量：用例体用它确认被测文本，与 TEXTS 的声明顺序一一对应。
const TEXT_WORD: string = 'RenderNode';
const TEXT_SINGLE: string = 'A';
const TEXT_PAIR: string = 'AB';
const TEXT_DIGITS: string = '1234567890';
const TEXT_PUNCT: string = '!?.,;:';
const TEXT_SPACE: string = ' ';
const TEXT_SPACES: string = '   ';
const TEXT_MIXED: string = 'Hello OpenHarmony';
const TEXT_CJK: string = '你好鸿蒙';
const TEXT_MIX_LATIN: string = '你好 OpenHarmony 2026';
const TEXT_IDENT: string = 'RenderNode_Node_01';
const TEXT_URL: string = 'https://gitee.com/openharmony';
// 十二种文本：单词、单字符、双字符、数字、标点、单空格、三空格、中英混排、纯中文、中英数混排、
// 标识符与链接，覆盖排版引擎的字符类分支。
const TEXTS: string[] = [TEXT_WORD, TEXT_SINGLE, TEXT_PAIR, TEXT_DIGITS, TEXT_PUNCT, TEXT_SPACE,
  TEXT_SPACES, TEXT_MIXED, TEXT_CJK, TEXT_MIX_LATIN, TEXT_IDENT, TEXT_URL];
const TEXT_KIND_COUNT: number = 12;
// 字号阶梯的命名常量，覆盖夹取下界 12 到上界 96。
const SIZE_MIN: number = 12;
const SIZE_SMALL: number = 16;
const SIZE_DEFAULT: number = 20;
const SIZE_MEDIUM: number = 24;
const SIZE_LARGE: number = 32;
const SIZE_TITLE: number = 48;
const SIZE_DISPLAY: number = 72;
const SIZE_MAX: number = 96;
const FONT_SIZES: number[] = [SIZE_MIN, SIZE_SMALL, SIZE_DEFAULT, SIZE_MEDIUM, SIZE_LARGE, SIZE_TITLE,
  SIZE_DISPLAY, SIZE_MAX];
// 排版宽度阶梯的命名常量，从逐字换行的 1 像素到不受限的 4000 像素。
const LIMIT_CHAR: number = 1;
const LIMIT_TWO_CHARS: number = 20;
const LIMIT_WORD: number = 60;
const LIMIT_TWO_WORDS: number = 120;
const LIMIT_COMFORT: number = 200;
const LIMIT_PAGE: number = 400;
const LIMIT_WIDE: number = 800;
const LIMIT_UNBOUNDED: number = 4000;
const LADDER_WIDTHS: number[] = [LIMIT_CHAR, LIMIT_TWO_CHARS, LIMIT_WORD, LIMIT_TWO_WORDS, LIMIT_COMFORT,
  LIMIT_PAGE, LIMIT_WIDE, LIMIT_UNBOUNDED];
const BASE_SIZE: number = SIZE_DEFAULT;
// 基线排版宽度取一页宽，窄宽度用于逐字换行，宽上限用于测量自然宽度。
const BASELINE_LIMIT: number = LIMIT_PAGE;
const NARROW_WIDTH: number = LIMIT_WORD;
const WIDE_LIMIT: number = LIMIT_UNBOUNDED;
// 浮点比较容差，排版引擎返回的是 float 提升的 double。
const EPSILON: number = 1;
// 单行与多行的最小行数，用来区分短文本与长文本的换行行为。
const MIN_SINGLE_LINE: number = 1;
const MIN_WRAPPED_LINES: number = 2;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// 重复字符构造长文本，避免在用例里写一千个字符的字面量。
function repeatText(char: string, count: number): string {
  let text: string = '';
  for (let index = 0; index < count; index++) {
    text += char;
  }
  return text;
}

// 千字符长文本，用于触发大量换行。
const THOUSAND_TEXT: string = repeatText('R', 1000);

// 测量结果占位类：测量失败时用零值对象代替 undefined，保持用例断言链完整。
class EmptyMeasure implements TextMeasureResult {
  public width: number = 0;
  public height: number = 0;
}

// 测文本，结果缺失时返回 0/0 占位对象，便于用例统一断言。
function measure(text: string, fontSize: number, maxWidth: number): TextMeasureResult {
  const result: TextMeasureResult | undefined = bridge.nativeMeasureText(text, fontSize, maxWidth);
  if (result === undefined) {
    return new EmptyMeasure();
  }
  return result;
}

function describeMeasure(value: TextMeasureResult): string {
  return value.width.toString() + 'x' + value.height.toString();
}

// 基线观测量：一次宽排版测量得到的全部可判定位。
class BaselineObs {
  public text: string = '';
  public fontSize: number = 0;
  public limit: number = 0;
  public width: number = 0;
  public height: number = 0;
  public lineCount: number = 0;
  public finiteWidth: boolean = false;
  public finiteHeight: boolean = false;
}

function observeBaseline(text: string): BaselineObs {
  const observed: BaselineObs = new BaselineObs();
  const result: TextMeasureResult = measure(text, BASE_SIZE, BASELINE_LIMIT);
  observed.text = text;
  observed.fontSize = BASE_SIZE;
  observed.limit = BASELINE_LIMIT;
  observed.width = result.width;
  observed.height = result.height;
  observed.lineCount = result.height / BASE_SIZE;
  observed.finiteWidth = Number.isFinite(result.width);
  observed.finiteHeight = Number.isFinite(result.height);
  logInfo('baseline ' + describeMeasure(result));
  return observed;
}

// 窄宽观测量：窄宽与基线两次排版的高度差反映换行次数。
class NarrowObs {
  public text: string = '';
  public narrowLimit: number = 0;
  public narrowWidth: number = 0;
  public narrowHeight: number = 0;
  public narrowLineCount: number = 0;
  public baseWidth: number = 0;
  public baseHeight: number = 0;
  public baseLineCount: number = 0;
}

function observeNarrow(text: string): NarrowObs {
  const observed: NarrowObs = new NarrowObs();
  const narrow: TextMeasureResult = measure(text, BASE_SIZE, NARROW_WIDTH);
  const base: TextMeasureResult = measure(text, BASE_SIZE, BASELINE_LIMIT);
  observed.text = text;
  observed.narrowLimit = NARROW_WIDTH;
  observed.narrowWidth = narrow.width;
  observed.narrowHeight = narrow.height;
  observed.narrowLineCount = narrow.height / BASE_SIZE;
  observed.baseWidth = base.width;
  observed.baseHeight = base.height;
  observed.baseLineCount = base.height / BASE_SIZE;
  logInfo('narrow ' + describeMeasure(narrow) + ' base ' + describeMeasure(base));
  return observed;
}

// 字号观测量：当前字号与前一号字号的宽高，用于判定缩放单调性。
class FontSizeObs {
  public size: number = 0;
  public width: number = 0;
  public height: number = 0;
  public lineCount: number = 0;
  public previousSize: number = 0;
  public previousWidth: number = 0;
  public previousHeight: number = 0;
}

function observeFontSize(size: number): FontSizeObs {
  const observed: FontSizeObs = new FontSizeObs();
  const current: TextMeasureResult = measure(BASE_TEXT, size, WIDE_LIMIT);
  const index: number = FONT_SIZES.indexOf(size);
  observed.size = size;
  observed.width = current.width;
  observed.height = current.height;
  observed.lineCount = current.height / size;
  if (index > 0) {
    const previousSize: number = FONT_SIZES[index - 1];
    const previous: TextMeasureResult = measure(BASE_TEXT, previousSize, WIDE_LIMIT);
    observed.previousSize = previousSize;
    observed.previousWidth = previous.width;
    observed.previousHeight = previous.height;
  }
  logInfo('size ' + size.toString() + ' -> ' + describeMeasure(current));
  return observed;
}

// 宽度阶梯观测量：当前档与前档的行数，用于判定宽度收窄只会增加行数。
class LimitObs {
  public limit: number = 0;
  public width: number = 0;
  public height: number = 0;
  public lineCount: number = 0;
  public naturalWidth: number = 0;
  public naturalHeight: number = 0;
  public naturalLineCount: number = 0;
  public previousLimit: number = 0;
  public previousLineCount: number = 0;
  public previousHeight: number = 0;
}

function observeLimit(limit: number): LimitObs {
  const observed: LimitObs = new LimitObs();
  const current: TextMeasureResult = measure(BASE_TEXT, BASE_SIZE, limit);
  const natural: TextMeasureResult = measure(BASE_TEXT, BASE_SIZE, WIDE_LIMIT);
  const index: number = LADDER_WIDTHS.indexOf(limit);
  observed.limit = limit;
  observed.width = current.width;
  observed.height = current.height;
  observed.lineCount = current.height / BASE_SIZE;
  observed.naturalWidth = natural.width;
  observed.naturalHeight = natural.height;
  observed.naturalLineCount = natural.height / BASE_SIZE;
  if (index > 0) {
    const previousLimit: number = LADDER_WIDTHS[index - 1];
    const previous: TextMeasureResult = measure(BASE_TEXT, BASE_SIZE, previousLimit);
    observed.previousLimit = previousLimit;
    observed.previousLineCount = previous.height / BASE_SIZE;
    observed.previousHeight = previous.height;
  }
  logInfo('limit ' + limit.toString() + ' -> ' + describeMeasure(current));
  return observed;
}

export default function ndkRenderNodeMeasureTest(): void {
  describe('NdkRenderNodeMeasure', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0001
     * @tc.name      testNdkRenderNodeMeasure0001
     * @tc.desc      校验英文单词在常用字号下测量为正宽高、有限值、宽度不超排版宽度且行高为字号整数倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeMeasure0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeMeasure0001 begin');
      const observed: BaselineObs = observeBaseline(TEXT_WORD);
      // 宽排版下被测文本保持单行，行高为字号的整数倍。
      expect(observed.text).assertEqual(TEXT_WORD);
      expect(observed.fontSize).assertEqual(BASE_SIZE);
      expect(observed.width).assertLarger(0);
      expect(observed.height).assertLarger(0);
      expect(observed.finiteWidth && observed.finiteHeight).assertTrue();
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width <= observed.limit).assertTrue();
      logInfo('testNdkRenderNodeMeasure0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0002
     * @tc.name      testNdkRenderNodeMeasure0002
     * @tc.desc      校验单字符测量为正宽高，宽度不超排版宽度且行高为字号整数倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0002 begin');
      const observed: BaselineObs = observeBaseline(TEXT_SINGLE);
      // 宽排版下被测文本保持单行，行高为字号的整数倍。
      expect(observed.text).assertEqual(TEXT_SINGLE);
      expect(observed.fontSize).assertEqual(BASE_SIZE);
      expect(observed.width).assertLarger(0);
      expect(observed.height).assertLarger(0);
      expect(observed.finiteWidth && observed.finiteHeight).assertTrue();
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width <= observed.limit).assertTrue();
      logInfo('testNdkRenderNodeMeasure0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0003
     * @tc.name      testNdkRenderNodeMeasure0003
     * @tc.desc      校验双字符测量为正宽高，宽度不超排版宽度且行高为字号整数倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0003 begin');
      const observed: BaselineObs = observeBaseline(TEXT_PAIR);
      // 宽排版下被测文本保持单行，行高为字号的整数倍。
      expect(observed.text).assertEqual(TEXT_PAIR);
      expect(observed.fontSize).assertEqual(BASE_SIZE);
      expect(observed.width).assertLarger(0);
      expect(observed.height).assertLarger(0);
      expect(observed.finiteWidth && observed.finiteHeight).assertTrue();
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width <= observed.limit).assertTrue();
      logInfo('testNdkRenderNodeMeasure0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0004
     * @tc.name      testNdkRenderNodeMeasure0004
     * @tc.desc      校验十位数字串测量为正宽高，数字等宽且行高为字号整数倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0004 begin');
      const observed: BaselineObs = observeBaseline(TEXT_DIGITS);
      // 宽排版下被测文本保持单行，行高为字号的整数倍。
      expect(observed.text).assertEqual(TEXT_DIGITS);
      expect(observed.fontSize).assertEqual(BASE_SIZE);
      expect(observed.width).assertLarger(0);
      expect(observed.height).assertLarger(0);
      expect(observed.finiteWidth && observed.finiteHeight).assertTrue();
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width <= observed.limit).assertTrue();
      logInfo('testNdkRenderNodeMeasure0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0005
     * @tc.name      testNdkRenderNodeMeasure0005
     * @tc.desc      校验纯标点串测量为正宽高，标点不触发排版异常且行高为字号整数倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0005 begin');
      const observed: BaselineObs = observeBaseline(TEXT_PUNCT);
      // 宽排版下被测文本保持单行，行高为字号的整数倍。
      expect(observed.text).assertEqual(TEXT_PUNCT);
      expect(observed.fontSize).assertEqual(BASE_SIZE);
      expect(observed.width).assertLarger(0);
      expect(observed.height).assertLarger(0);
      expect(observed.finiteWidth && observed.finiteHeight).assertTrue();
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width <= observed.limit).assertTrue();
      logInfo('testNdkRenderNodeMeasure0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0006
     * @tc.name      testNdkRenderNodeMeasure0006
     * @tc.desc      校验单个空格占据字形宽度，测量结果为正宽高且行高为字号整数倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0006 begin');
      const observed: BaselineObs = observeBaseline(TEXT_SPACE);
      // 宽排版下被测文本保持单行，行高为字号的整数倍。
      expect(observed.text).assertEqual(TEXT_SPACE);
      expect(observed.fontSize).assertEqual(BASE_SIZE);
      expect(observed.width).assertLarger(0);
      expect(observed.height).assertLarger(0);
      expect(observed.finiteWidth && observed.finiteHeight).assertTrue();
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width <= observed.limit).assertTrue();
      logInfo('testNdkRenderNodeMeasure0006 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0007
     * @tc.name      testNdkRenderNodeMeasure0007
     * @tc.desc      校验三个连续空格宽度线性累加，测量结果为正宽高且行高为字号整数倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0007 begin');
      const observed: BaselineObs = observeBaseline(TEXT_SPACES);
      // 宽排版下被测文本保持单行，行高为字号的整数倍。
      expect(observed.text).assertEqual(TEXT_SPACES);
      expect(observed.fontSize).assertEqual(BASE_SIZE);
      expect(observed.width).assertLarger(0);
      expect(observed.height).assertLarger(0);
      expect(observed.finiteWidth && observed.finiteHeight).assertTrue();
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width <= observed.limit).assertTrue();
      logInfo('testNdkRenderNodeMeasure0007 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0008
     * @tc.name      testNdkRenderNodeMeasure0008
     * @tc.desc      校验中英混排文本测量为正宽高，混排不会触发字体回退异常。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0008 begin');
      const observed: BaselineObs = observeBaseline(TEXT_MIXED);
      // 宽排版下被测文本保持单行，行高为字号的整数倍。
      expect(observed.text).assertEqual(TEXT_MIXED);
      expect(observed.fontSize).assertEqual(BASE_SIZE);
      expect(observed.width).assertLarger(0);
      expect(observed.height).assertLarger(0);
      expect(observed.finiteWidth && observed.finiteHeight).assertTrue();
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width <= observed.limit).assertTrue();
      logInfo('testNdkRenderNodeMeasure0008 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0009
     * @tc.name      testNdkRenderNodeMeasure0009
     * @tc.desc      校验纯中文四字测量按全角字宽排版，宽度为正且行高为字号整数倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0009 begin');
      const observed: BaselineObs = observeBaseline(TEXT_CJK);
      // 宽排版下被测文本保持单行，行高为字号的整数倍。
      expect(observed.text).assertEqual(TEXT_CJK);
      expect(observed.fontSize).assertEqual(BASE_SIZE);
      expect(observed.width).assertLarger(0);
      expect(observed.height).assertLarger(0);
      expect(observed.finiteWidth && observed.finiteHeight).assertTrue();
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width <= observed.limit).assertTrue();
      logInfo('testNdkRenderNodeMeasure0009 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0010
     * @tc.name      testNdkRenderNodeMeasure0010
     * @tc.desc      校验中英数与空格混排文本测量为正宽高，行高为字号整数倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0010 begin');
      const observed: BaselineObs = observeBaseline(TEXT_MIX_LATIN);
      // 宽排版下被测文本保持单行，行高为字号的整数倍。
      expect(observed.text).assertEqual(TEXT_MIX_LATIN);
      expect(observed.fontSize).assertEqual(BASE_SIZE);
      expect(observed.width).assertLarger(0);
      expect(observed.height).assertLarger(0);
      expect(observed.finiteWidth && observed.finiteHeight).assertTrue();
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width <= observed.limit).assertTrue();
      logInfo('testNdkRenderNodeMeasure0010 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0011
     * @tc.name      testNdkRenderNodeMeasure0011
     * @tc.desc      校验带下划线的标识符测量为正宽高，连接符不触发拆词换行。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasure0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasure0011 begin');
      const observed: BaselineObs = observeBaseline(TEXT_IDENT);
      // 宽排版下被测文本保持单行，行高为字号的整数倍。
      expect(observed.text).assertEqual(TEXT_IDENT);
      expect(observed.fontSize).assertEqual(BASE_SIZE);
      expect(observed.width).assertLarger(0);
      expect(observed.height).assertLarger(0);
      expect(observed.finiteWidth && observed.finiteHeight).assertTrue();
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width <= observed.limit).assertTrue();
      logInfo('testNdkRenderNodeMeasure0011 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0012
     * @tc.name      testNdkRenderNodeMeasure0012
     * @tc.desc      校验链接文本测量为正宽高，斜杠与冒号不影响排版结果。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasure0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasure0012 begin');
      const observed: BaselineObs = observeBaseline(TEXT_URL);
      // 宽排版下被测文本保持单行，行高为字号的整数倍。
      expect(observed.text).assertEqual(TEXT_URL);
      expect(observed.fontSize).assertEqual(BASE_SIZE);
      expect(observed.width).assertLarger(0);
      expect(observed.height).assertLarger(0);
      expect(observed.finiteWidth && observed.finiteHeight).assertTrue();
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width <= observed.limit).assertTrue();
      logInfo('testNdkRenderNodeMeasure0012 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0013
     * @tc.name      testNdkRenderNodeMeasure0013
     * @tc.desc      校验英文单词在 60 像素窄宽下换行，高度不低于宽排版且行高为字号整数倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0013 begin');
      const observed: NarrowObs = observeNarrow(TEXT_WORD);
      // 窄宽只会增加换行，高度不低于基线，宽度不超出基线。
      expect(observed.text).assertEqual(TEXT_WORD);
      expect(observed.narrowLimit).assertEqual(NARROW_WIDTH);
      expect(observed.narrowHeight >= observed.baseHeight).assertTrue();
      expect(observed.narrowHeight % BASE_SIZE).assertEqual(0);
      expect(observed.narrowLineCount >= observed.baseLineCount).assertTrue();
      expect(observed.baseLineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.narrowWidth <= observed.baseWidth + EPSILON).assertTrue();
      logInfo('testNdkRenderNodeMeasure0013 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0014
     * @tc.name      testNdkRenderNodeMeasure0014
     * @tc.desc      校验单字符在 60 像素窄宽下仍为单行，高度与宽排版一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0014 begin');
      const observed: NarrowObs = observeNarrow(TEXT_SINGLE);
      // 窄宽只会增加换行，高度不低于基线，宽度不超出基线。
      expect(observed.text).assertEqual(TEXT_SINGLE);
      expect(observed.narrowLimit).assertEqual(NARROW_WIDTH);
      expect(observed.narrowHeight >= observed.baseHeight).assertTrue();
      expect(observed.narrowHeight % BASE_SIZE).assertEqual(0);
      expect(observed.narrowLineCount >= observed.baseLineCount).assertTrue();
      expect(observed.baseLineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.narrowWidth <= observed.baseWidth + EPSILON).assertTrue();
      logInfo('testNdkRenderNodeMeasure0014 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0015
     * @tc.name      testNdkRenderNodeMeasure0015
     * @tc.desc      校验双字符在 60 像素窄宽下不被拆行，高度不低于宽排版。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasure0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasure0015 begin');
      const observed: NarrowObs = observeNarrow(TEXT_PAIR);
      // 窄宽只会增加换行，高度不低于基线，宽度不超出基线。
      expect(observed.text).assertEqual(TEXT_PAIR);
      expect(observed.narrowLimit).assertEqual(NARROW_WIDTH);
      expect(observed.narrowHeight >= observed.baseHeight).assertTrue();
      expect(observed.narrowHeight % BASE_SIZE).assertEqual(0);
      expect(observed.narrowLineCount >= observed.baseLineCount).assertTrue();
      expect(observed.baseLineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.narrowWidth <= observed.baseWidth + EPSILON).assertTrue();
      logInfo('testNdkRenderNodeMeasure0015 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0016
     * @tc.name      testNdkRenderNodeMeasure0016
     * @tc.desc      校验十位数字串在 60 像素窄宽下换行，高度不低于宽排版。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasure0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasure0016 begin');
      const observed: NarrowObs = observeNarrow(TEXT_DIGITS);
      // 窄宽只会增加换行，高度不低于基线，宽度不超出基线。
      expect(observed.text).assertEqual(TEXT_DIGITS);
      expect(observed.narrowLimit).assertEqual(NARROW_WIDTH);
      expect(observed.narrowHeight >= observed.baseHeight).assertTrue();
      expect(observed.narrowHeight % BASE_SIZE).assertEqual(0);
      expect(observed.narrowLineCount >= observed.baseLineCount).assertTrue();
      expect(observed.baseLineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.narrowWidth <= observed.baseWidth + EPSILON).assertTrue();
      logInfo('testNdkRenderNodeMeasure0016 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0017
     * @tc.name      testNdkRenderNodeMeasure0017
     * @tc.desc      校验纯标点串在 60 像素窄宽下的排版高度不低于宽排版。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasure0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasure0017 begin');
      const observed: NarrowObs = observeNarrow(TEXT_PUNCT);
      // 窄宽只会增加换行，高度不低于基线，宽度不超出基线。
      expect(observed.text).assertEqual(TEXT_PUNCT);
      expect(observed.narrowLimit).assertEqual(NARROW_WIDTH);
      expect(observed.narrowHeight >= observed.baseHeight).assertTrue();
      expect(observed.narrowHeight % BASE_SIZE).assertEqual(0);
      expect(observed.narrowLineCount >= observed.baseLineCount).assertTrue();
      expect(observed.baseLineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.narrowWidth <= observed.baseWidth + EPSILON).assertTrue();
      logInfo('testNdkRenderNodeMeasure0017 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0018
     * @tc.name      testNdkRenderNodeMeasure0018
     * @tc.desc      校验单个空格在 60 像素窄宽下仍占一行，行高与宽排版一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasure0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasure0018 begin');
      const observed: NarrowObs = observeNarrow(TEXT_SPACE);
      // 窄宽只会增加换行，高度不低于基线，宽度不超出基线。
      expect(observed.text).assertEqual(TEXT_SPACE);
      expect(observed.narrowLimit).assertEqual(NARROW_WIDTH);
      expect(observed.narrowHeight >= observed.baseHeight).assertTrue();
      expect(observed.narrowHeight % BASE_SIZE).assertEqual(0);
      expect(observed.narrowLineCount >= observed.baseLineCount).assertTrue();
      expect(observed.baseLineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.narrowWidth <= observed.baseWidth + EPSILON).assertTrue();
      logInfo('testNdkRenderNodeMeasure0018 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0019
     * @tc.name      testNdkRenderNodeMeasure0019
     * @tc.desc      校验三空格在 60 像素窄宽下排版结果与宽排版一致，空格不换行。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasure0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasure0019 begin');
      const observed: NarrowObs = observeNarrow(TEXT_SPACES);
      // 窄宽只会增加换行，高度不低于基线，宽度不超出基线。
      expect(observed.text).assertEqual(TEXT_SPACES);
      expect(observed.narrowLimit).assertEqual(NARROW_WIDTH);
      expect(observed.narrowHeight >= observed.baseHeight).assertTrue();
      expect(observed.narrowHeight % BASE_SIZE).assertEqual(0);
      expect(observed.narrowLineCount >= observed.baseLineCount).assertTrue();
      expect(observed.baseLineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.narrowWidth <= observed.baseWidth + EPSILON).assertTrue();
      logInfo('testNdkRenderNodeMeasure0019 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0020
     * @tc.name      testNdkRenderNodeMeasure0020
     * @tc.desc      校验中英混排在 60 像素窄宽下换行，高度不低于宽排版且行高为字号整数倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0020 begin');
      const observed: NarrowObs = observeNarrow(TEXT_MIXED);
      // 窄宽只会增加换行，高度不低于基线，宽度不超出基线。
      expect(observed.text).assertEqual(TEXT_MIXED);
      expect(observed.narrowLimit).assertEqual(NARROW_WIDTH);
      expect(observed.narrowHeight >= observed.baseHeight).assertTrue();
      expect(observed.narrowHeight % BASE_SIZE).assertEqual(0);
      expect(observed.narrowLineCount >= observed.baseLineCount).assertTrue();
      expect(observed.baseLineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.narrowWidth <= observed.baseWidth + EPSILON).assertTrue();
      logInfo('testNdkRenderNodeMeasure0020 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0021
     * @tc.name      testNdkRenderNodeMeasure0021
     * @tc.desc      校验纯中文四字在 60 像素窄宽下按全角换行，行数不少于两行。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0021 begin');
      const observed: NarrowObs = observeNarrow(TEXT_CJK);
      // 窄宽只会增加换行，高度不低于基线，宽度不超出基线。
      expect(observed.text).assertEqual(TEXT_CJK);
      expect(observed.narrowLimit).assertEqual(NARROW_WIDTH);
      expect(observed.narrowHeight >= observed.baseHeight).assertTrue();
      expect(observed.narrowHeight % BASE_SIZE).assertEqual(0);
      expect(observed.narrowLineCount >= observed.baseLineCount).assertTrue();
      expect(observed.baseLineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.narrowWidth <= observed.baseWidth + EPSILON).assertTrue();
      logInfo('testNdkRenderNodeMeasure0021 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0022
     * @tc.name      testNdkRenderNodeMeasure0022
     * @tc.desc      校验中英数混排在 60 像素窄宽下换行，宽度不超过窄宽上限。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasure0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasure0022 begin');
      const observed: NarrowObs = observeNarrow(TEXT_MIX_LATIN);
      // 窄宽只会增加换行，高度不低于基线，宽度不超出基线。
      expect(observed.text).assertEqual(TEXT_MIX_LATIN);
      expect(observed.narrowLimit).assertEqual(NARROW_WIDTH);
      expect(observed.narrowHeight >= observed.baseHeight).assertTrue();
      expect(observed.narrowHeight % BASE_SIZE).assertEqual(0);
      expect(observed.narrowLineCount >= observed.baseLineCount).assertTrue();
      expect(observed.baseLineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.narrowWidth <= observed.baseWidth + EPSILON).assertTrue();
      logInfo('testNdkRenderNodeMeasure0022 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0023
     * @tc.name      testNdkRenderNodeMeasure0023
     * @tc.desc      校验带下划线标识符在 60 像素窄宽下换行，高度不低于宽排版。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasure0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasure0023 begin');
      const observed: NarrowObs = observeNarrow(TEXT_IDENT);
      // 窄宽只会增加换行，高度不低于基线，宽度不超出基线。
      expect(observed.text).assertEqual(TEXT_IDENT);
      expect(observed.narrowLimit).assertEqual(NARROW_WIDTH);
      expect(observed.narrowHeight >= observed.baseHeight).assertTrue();
      expect(observed.narrowHeight % BASE_SIZE).assertEqual(0);
      expect(observed.narrowLineCount >= observed.baseLineCount).assertTrue();
      expect(observed.baseLineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.narrowWidth <= observed.baseWidth + EPSILON).assertTrue();
      logInfo('testNdkRenderNodeMeasure0023 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0024
     * @tc.name      testNdkRenderNodeMeasure0024
     * @tc.desc      校验链接文本在 60 像素窄宽下换行，高度高于宽排版且行高为字号整数倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasure0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasure0024 begin');
      const observed: NarrowObs = observeNarrow(TEXT_URL);
      // 窄宽只会增加换行，高度不低于基线，宽度不超出基线。
      expect(observed.text).assertEqual(TEXT_URL);
      expect(observed.narrowLimit).assertEqual(NARROW_WIDTH);
      expect(observed.narrowHeight >= observed.baseHeight).assertTrue();
      expect(observed.narrowHeight % BASE_SIZE).assertEqual(0);
      expect(observed.narrowLineCount >= observed.baseLineCount).assertTrue();
      expect(observed.baseLineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.narrowWidth <= observed.baseWidth + EPSILON).assertTrue();
      logInfo('testNdkRenderNodeMeasure0024 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0025
     * @tc.name      testNdkRenderNodeMeasure0025
     * @tc.desc      校验字号 12 为夹取下界，不受限排版下高度恰为 12 像素。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeMeasure0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeMeasure0025 begin');
      const observed: FontSizeObs = observeFontSize(SIZE_MIN);
      expect(observed.size).assertEqual(SIZE_MIN);
      expect(observed.height).assertEqual(SIZE_MIN);
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width).assertLarger(0);
      // 最小字号没有前一档，前档量保持零值。
      expect(observed.previousSize).assertEqual(0);
      expect(observed.previousWidth).assertEqual(0);
      logInfo('testNdkRenderNodeMeasure0025 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0026
     * @tc.name      testNdkRenderNodeMeasure0026
     * @tc.desc      校验字号 16 时高度恰为 16 像素，且宽度大于 12 像素字号下的宽度。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0026 begin');
      const observed: FontSizeObs = observeFontSize(SIZE_SMALL);
      expect(observed.size).assertEqual(SIZE_SMALL);
      expect(observed.height).assertEqual(SIZE_SMALL);
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width).assertLarger(0);
      // 字号放大后宽度必须同步放大。
      expect(observed.size).assertLarger(observed.previousSize);
      expect(observed.width).assertLarger(observed.previousWidth);
      logInfo('testNdkRenderNodeMeasure0026 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0027
     * @tc.name      testNdkRenderNodeMeasure0027
     * @tc.desc      校验字号 20 时高度恰为 20 像素，与页面默认字号一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0027 begin');
      const observed: FontSizeObs = observeFontSize(SIZE_DEFAULT);
      expect(observed.size).assertEqual(SIZE_DEFAULT);
      expect(observed.height).assertEqual(SIZE_DEFAULT);
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width).assertLarger(0);
      // 字号放大后宽度必须同步放大。
      expect(observed.size).assertLarger(observed.previousSize);
      expect(observed.width).assertLarger(observed.previousWidth);
      logInfo('testNdkRenderNodeMeasure0027 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0028
     * @tc.name      testNdkRenderNodeMeasure0028
     * @tc.desc      校验字号 24 时高度恰为 24 像素，宽度继续随字号增长。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0028 begin');
      const observed: FontSizeObs = observeFontSize(SIZE_MEDIUM);
      expect(observed.size).assertEqual(SIZE_MEDIUM);
      expect(observed.height).assertEqual(SIZE_MEDIUM);
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width).assertLarger(0);
      // 字号放大后宽度必须同步放大。
      expect(observed.size).assertLarger(observed.previousSize);
      expect(observed.width).assertLarger(observed.previousWidth);
      logInfo('testNdkRenderNodeMeasure0028 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0029
     * @tc.name      testNdkRenderNodeMeasure0029
     * @tc.desc      校验字号 32 时高度恰为 32 像素，标题级字号排版正常。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0029 begin');
      const observed: FontSizeObs = observeFontSize(SIZE_LARGE);
      expect(observed.size).assertEqual(SIZE_LARGE);
      expect(observed.height).assertEqual(SIZE_LARGE);
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width).assertLarger(0);
      // 字号放大后宽度必须同步放大。
      expect(observed.size).assertLarger(observed.previousSize);
      expect(observed.width).assertLarger(observed.previousWidth);
      logInfo('testNdkRenderNodeMeasure0029 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0030
     * @tc.name      testNdkRenderNodeMeasure0030
     * @tc.desc      校验字号 48 时高度恰为 48 像素，大字号下仍为单行。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0030 begin');
      const observed: FontSizeObs = observeFontSize(SIZE_TITLE);
      expect(observed.size).assertEqual(SIZE_TITLE);
      expect(observed.height).assertEqual(SIZE_TITLE);
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width).assertLarger(0);
      // 字号放大后宽度必须同步放大。
      expect(observed.size).assertLarger(observed.previousSize);
      expect(observed.width).assertLarger(observed.previousWidth);
      logInfo('testNdkRenderNodeMeasure0030 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0031
     * @tc.name      testNdkRenderNodeMeasure0031
     * @tc.desc      校验字号 72 时高度恰为 72 像素，接近上界时行高仍等于字号。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasure0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasure0031 begin');
      const observed: FontSizeObs = observeFontSize(SIZE_DISPLAY);
      expect(observed.size).assertEqual(SIZE_DISPLAY);
      expect(observed.height).assertEqual(SIZE_DISPLAY);
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width).assertLarger(0);
      // 字号放大后宽度必须同步放大。
      expect(observed.size).assertLarger(observed.previousSize);
      expect(observed.width).assertLarger(observed.previousWidth);
      logInfo('testNdkRenderNodeMeasure0031 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0032
     * @tc.name      testNdkRenderNodeMeasure0032
     * @tc.desc      校验字号 96 为夹取上界，不受限排版下高度恰为 96 像素。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasure0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasure0032 begin');
      const observed: FontSizeObs = observeFontSize(SIZE_MAX);
      expect(observed.size).assertEqual(SIZE_MAX);
      expect(observed.height).assertEqual(SIZE_MAX);
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.width).assertLarger(0);
      // 字号放大后宽度必须同步放大。
      expect(observed.size).assertLarger(observed.previousSize);
      expect(observed.width).assertLarger(observed.previousWidth);
      logInfo('testNdkRenderNodeMeasure0032 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0033
     * @tc.name      testNdkRenderNodeMeasure0033
     * @tc.desc      校验排版宽度为 1 像素时逐字换行，宽度不超过自然宽度且行高为字号整数倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeMeasure0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeMeasure0033 begin');
      const observed: LimitObs = observeLimit(LIMIT_CHAR);
      expect(observed.limit).assertEqual(LIMIT_CHAR);
      expect(observed.height % BASE_SIZE).assertEqual(0);
      // 一像素上限下逐字换行，行数远多于单行。
      expect(observed.lineCount).assertLarger(MIN_WRAPPED_LINES);
      expect(observed.width <= observed.naturalWidth + EPSILON).assertTrue();
      expect(observed.previousLimit).assertEqual(0);
      expect(observed.naturalLineCount).assertEqual(MIN_SINGLE_LINE);
      logInfo('testNdkRenderNodeMeasure0033 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0034
     * @tc.name      testNdkRenderNodeMeasure0034
     * @tc.desc      校验排版宽度为 20 像素时行数不高于 1 像素档位，宽度不超过自然宽度。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0034 begin');
      const observed: LimitObs = observeLimit(LIMIT_TWO_CHARS);
      expect(observed.limit).assertEqual(LIMIT_TWO_CHARS);
      expect(observed.height % BASE_SIZE).assertEqual(0);
      // 这一档比前档（1 像素）更宽，行数不应增加，高度也不应超过更窄档位。
      expect(observed.lineCount <= observed.previousLineCount).assertTrue();
      expect(observed.height <= observed.previousHeight).assertTrue();
      expect(observed.width <= observed.naturalWidth + EPSILON).assertTrue();
      expect(observed.previousLimit).assertLarger(0);
      logInfo('testNdkRenderNodeMeasure0034 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0035
     * @tc.name      testNdkRenderNodeMeasure0035
     * @tc.desc      校验排版宽度为 60 像素时行数不高于 20 像素档位，宽度不超过自然宽度。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0035 begin');
      const observed: LimitObs = observeLimit(LIMIT_WORD);
      expect(observed.limit).assertEqual(LIMIT_WORD);
      expect(observed.height % BASE_SIZE).assertEqual(0);
      // 这一档比前档（20 像素）更宽，行数不应增加，高度也不应超过更窄档位。
      expect(observed.lineCount <= observed.previousLineCount).assertTrue();
      expect(observed.height <= observed.previousHeight).assertTrue();
      expect(observed.width <= observed.naturalWidth + EPSILON).assertTrue();
      expect(observed.previousLimit).assertLarger(0);
      logInfo('testNdkRenderNodeMeasure0035 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0036
     * @tc.name      testNdkRenderNodeMeasure0036
     * @tc.desc      校验排版宽度为 120 像素时单词可单行放下，行数回落到单行。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0036 begin');
      const observed: LimitObs = observeLimit(LIMIT_TWO_WORDS);
      expect(observed.limit).assertEqual(LIMIT_TWO_WORDS);
      expect(observed.height % BASE_SIZE).assertEqual(0);
      // 这一档比前档（60 像素）更宽，行数不应增加，高度也不应超过更窄档位。
      expect(observed.lineCount <= observed.previousLineCount).assertTrue();
      expect(observed.height <= observed.previousHeight).assertTrue();
      expect(observed.width <= observed.naturalWidth + EPSILON).assertTrue();
      expect(observed.previousLimit).assertLarger(0);
      logInfo('testNdkRenderNodeMeasure0036 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0037
     * @tc.name      testNdkRenderNodeMeasure0037
     * @tc.desc      校验排版宽度为 200 像素时已能单行排下，行高回到字号值。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0037 begin');
      const observed: LimitObs = observeLimit(LIMIT_COMFORT);
      expect(observed.limit).assertEqual(LIMIT_COMFORT);
      expect(observed.height % BASE_SIZE).assertEqual(0);
      // 收窄不会让行数下降，高度也不会比更宽的档位小。
      expect(observed.lineCount >= observed.previousLineCount).assertTrue();
      expect(observed.height <= observed.previousHeight).assertTrue();
      expect(observed.width <= observed.naturalWidth + EPSILON).assertTrue();
      expect(observed.previousLimit).assertLarger(0);
      logInfo('testNdkRenderNodeMeasure0037 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0038
     * @tc.name      testNdkRenderNodeMeasure0038
     * @tc.desc      校验排版宽度为 400 像素时结果与自然排版一致，宽度不超过排版宽度。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0038 begin');
      const observed: LimitObs = observeLimit(LIMIT_PAGE);
      expect(observed.limit).assertEqual(LIMIT_PAGE);
      expect(observed.height % BASE_SIZE).assertEqual(0);
      // 宽度足够时回到单行，行高与自然排版一致。
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.height).assertEqual(observed.naturalHeight);
      expect(observed.width <= observed.naturalWidth + EPSILON).assertTrue();
      expect(observed.naturalLineCount).assertEqual(MIN_SINGLE_LINE);
      logInfo('testNdkRenderNodeMeasure0038 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0039
     * @tc.name      testNdkRenderNodeMeasure0039
     * @tc.desc      校验排版宽度为 800 像素时不产生额外空白，宽度仍为自然宽度。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasure0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasure0039 begin');
      const observed: LimitObs = observeLimit(LIMIT_WIDE);
      expect(observed.limit).assertEqual(LIMIT_WIDE);
      expect(observed.height % BASE_SIZE).assertEqual(0);
      // 宽度足够时回到单行，行高与自然排版一致。
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.height).assertEqual(observed.naturalHeight);
      expect(observed.width <= observed.naturalWidth + EPSILON).assertTrue();
      expect(observed.naturalLineCount).assertEqual(MIN_SINGLE_LINE);
      logInfo('testNdkRenderNodeMeasure0039 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0040
     * @tc.name      testNdkRenderNodeMeasure0040
     * @tc.desc      校验排版宽度为 4000 像素时结果与 800 一致，超宽上限不再影响排版。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasure0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasure0040 begin');
      const observed: LimitObs = observeLimit(LIMIT_UNBOUNDED);
      expect(observed.limit).assertEqual(LIMIT_UNBOUNDED);
      expect(observed.height % BASE_SIZE).assertEqual(0);
      // 宽度足够时回到单行，行高与自然排版一致。
      expect(observed.lineCount).assertEqual(MIN_SINGLE_LINE);
      expect(observed.height).assertEqual(observed.naturalHeight);
      expect(observed.width <= observed.naturalWidth + EPSILON).assertTrue();
      expect(observed.naturalLineCount).assertEqual(MIN_SINGLE_LINE);
      logInfo('testNdkRenderNodeMeasure0040 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0041
     * @tc.name      testNdkRenderNodeMeasure0041
     * @tc.desc      校验一千字符长文本在 400 像素宽度下大量换行，高度为字号整数倍且远超单行。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0041 begin');
      const result: TextMeasureResult = measure(THOUSAND_TEXT, BASE_SIZE, 400);
      logInfo('thousand chars = ' + describeMeasure(result));
      expect(result.width > 0).assertTrue();
      expect(result.width <= 400).assertTrue();
      expect(result.height > 100).assertTrue();
      expect(result.height % BASE_SIZE).assertEqual(0);
      logInfo('testNdkRenderNodeMeasure0041 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0042
     * @tc.name      testNdkRenderNodeMeasure0042
     * @tc.desc      校验上界字号配极窄宽度时宽高仍为有限正数，不会出现无穷或 NaN。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasure0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasure0042 begin');
      const result: TextMeasureResult = measure(BASE_TEXT, FONT_SIZES[7], 30);
      logInfo('extreme narrow = ' + describeMeasure(result));
      expect(result.width > 0).assertTrue();
      expect(result.height > 0).assertTrue();
      expect(Number.isFinite(result.width)).assertTrue();
      expect(Number.isFinite(result.height)).assertTrue();
      expect(result.height % FONT_SIZES[7]).assertEqual(0);
      logInfo('testNdkRenderNodeMeasure0042 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0043
     * @tc.name      testNdkRenderNodeMeasure0043
     * @tc.desc      校验十二种文本在大字号下的宽度均大于小字号，字号缩放对全部字符类生效。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMeasure0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeMeasure0043 begin');
      let failures: string = '';
      for (let index = 0; index < TEXTS.length; index++) {
        const small: TextMeasureResult = measure(TEXTS[index], FONT_SIZES[0], WIDE_LIMIT);
        const large: TextMeasureResult = measure(TEXTS[index], FONT_SIZES[5], WIDE_LIMIT);
        if (!(large.width > small.width) || !(large.height > small.height)) {
          failures += 'text#' + index.toString() + ' small=' + describeMeasure(small)
            + ' large=' + describeMeasure(large) + ';';
        }
      }
      logInfo('scale failures = [' + failures + ']');
      // 十二种文本都要参与缩放对比，缺一种就会漏掉字符类分支。
      expect(TEXTS.length).assertEqual(TEXT_KIND_COUNT);
      expect(FONT_SIZES[5] > FONT_SIZES[0]).assertTrue();
      expect(failures).assertEqual('');
      logInfo('testNdkRenderNodeMeasure0043 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0044
     * @tc.name      testNdkRenderNodeMeasure0044
     * @tc.desc      校验空串在任何排版宽度下都返回负宽度哨兵，宽度结果与上限无关。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasure0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasure0044 begin');
      const widths: number[] = [1, 60, 400, WIDE_LIMIT];
      for (let index = 0; index < widths.length; index++) {
        const result: TextMeasureResult = measure('', BASE_SIZE, widths[index]);
        logInfo('empty at ' + widths[index].toString() + ' -> ' + describeMeasure(result));
        expect(result.width < 0).assertTrue();
        expect(result.height > 0).assertTrue();
        expect(Number.isFinite(result.width)).assertTrue();
      }
      logInfo('testNdkRenderNodeMeasure0044 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MEASURE_0045
     * @tc.name      testNdkRenderNodeMeasure0045
     * @tc.desc      校验中英混排比同宽下的纯中文占用更多行，窄宽换行对字符类保持敏感。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeMeasure0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeMeasure0045 begin');
      const mixed: TextMeasureResult = measure(TEXTS[9], BASE_SIZE, NARROW_WIDTH);
      const cjk: TextMeasureResult = measure(TEXTS[8], BASE_SIZE, NARROW_WIDTH);
      logInfo('mixed = ' + describeMeasure(mixed) + ' cjk = ' + describeMeasure(cjk));
      expect(mixed.height >= cjk.height).assertTrue();
      expect(mixed.height % BASE_SIZE).assertEqual(0);
      expect(cjk.height % BASE_SIZE).assertEqual(0);
      logInfo('testNdkRenderNodeMeasure0045 end');
    })
  })
}
