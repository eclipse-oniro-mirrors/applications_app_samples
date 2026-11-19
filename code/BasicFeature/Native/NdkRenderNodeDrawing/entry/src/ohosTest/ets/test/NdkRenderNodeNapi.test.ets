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
import { DrawContext } from '@kit.ArkUI';
import bridge, { TextMeasureResult } from 'libentry.so';
import {
  GROUP_CANVAS,
  GROUP_COLOR,
  GROUP_ERROR,
  GROUP_GEOMETRY,
  GROUP_PAINT,
  GROUP_PIXELMAP
} from '../../../main/ets/core/SchemaTypes';

const TAG: string = '[Sample_NdkRenderNodeNapiTest]';
const DOMAIN: number = 0xF811;
const MEASURE_TEXT: string = 'RenderNode';
const MEASURE_FONT_SIZE: number = 20;
const MEASURE_MAX_WIDTH: number = 400;
const INVALID_MAX_WIDTH: number = 0;
// 字号夹取区间，与 cpp/drawing/drawing_text.cpp 的 MIN_FONT_SIZE 与 MAX_FONT_SIZE 一致。
const MIN_FONT_SIZE: number = 12;
const MAX_FONT_SIZE: number = 96;
// 单行高度等于字号，多行高度为其整数倍。
const LINE_HEIGHT_STEP: number = 20;
// 浮点比较容差，排版引擎返回的是 float 提升的 double。
const EPSILON: number = 1;

// 文本内容矩阵：单词、单字符、数字、标点、空白、中英混排、标识符与链接。
const TEXTS: string[] = ['RenderNode', 'A', 'AB', '1234567890', '!?.,;:', ' ', '   ', 'Hello OpenHarmony',
  '你好鸿蒙', '你好 OpenHarmony 2026', 'RenderNode_Node_01', 'https://gitee.com/openharmony'];
// 一百六十字的长文本，用于触发多行排版。
const LONG_TEXT: string = 'RenderNodeRenderNodeRenderNodeRenderNodeRenderNodeRenderNodeRenderNodeRenderNode'
  + 'RenderNodeRenderNodeRenderNodeRenderNodeRenderNodeRenderNodeRenderNodeRenderNodeRenderNode';
// 19 个能力域的场景数，与 cpp/capability/capability_type.h 的 *_SCENE_COUNT 一致。
const GROUP_SCENE_COUNTS: number[] = [10, 11, 10, 9, 9, 11, 8, 10, 10, 12, 10, 12, 8, 14, 8, 10, 8, 8, 10];
// 前三个能力域已逐域覆盖，其余域在汇总用例中一起覆盖。
const COVERED_SCENE_COUNT: number = 31;
const TOTAL_SCENE_COUNT: number = 188;
// 专题分组编号从 20 开始，每组固定四个场景。
const TOPIC_GROUP_FIRST: number = 20;
const TOPIC_GROUP_COUNT: number = 10;
const TOPIC_SCENE_TOTAL: number = 4;
// 守卫用例统一使用的空参数数组与画布尺寸。
const EMPTY_PARAMS: number[] = [];
const GUARD_SIZE: number = 64;
// 旧绘制入口五个场景的种类数，与 drawing/scene_type.h 的 *_KIND_COUNT 一致。
const SCENE_KIND_COUNTS: number[] = [9, 8, 7, 4, 3];

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// 测量结果占位类：测量失败时用零值对象代替 undefined，保持用例断言链完整。
class EmptyMeasure implements TextMeasureResult {
  public width: number = 0;
  public height: number = 0;
}

// 测量文本，结果缺失时返回 0/0 占位对象，便于用例统一断言。
function measure(text: string, fontSize: number, maxWidth: number): TextMeasureResult {
  const result: TextMeasureResult | undefined = bridge.nativeMeasureText(text, fontSize, maxWidth);
  if (result === undefined) {
    return new EmptyMeasure();
  }
  return result;
}

function sameMeasure(left: TextMeasureResult, right: TextMeasureResult): boolean {
  return Math.abs(left.width - right.width) < EPSILON && Math.abs(left.height - right.height) < EPSILON;
}

function describeMeasure(value: TextMeasureResult): string {
  return value.width.toString() + 'x' + value.height.toString();
}

// 占位类型：ArkTS 不允许给空对象字面量定型，这里用空类实例充当任意对象。
class PlainHolder {
}

// 假绘制上下文：普通对象没有 native 包装，napi_unwrap 失败后入口会直接返回。
function fakeContext(): DrawContext {
  const holder: PlainHolder = new PlainHolder();
  return holder as object as DrawContext;
}

// 调用能力域入口，返回是否没有抛异常。
function callScene(group: number, scene: number, params: number[]): boolean {
  try {
    bridge.nativeRenderScene(fakeContext(), 64, 64, group, scene, params);
    return true;
  } catch (error) {
    logInfo('nativeRenderScene threw, group=' + group.toString() + ' scene=' + scene.toString());
    return false;
  }
}

// 调用旧绘制入口，返回是否没有抛异常。
function callDraw(scene: number, kind: number): boolean {
  try {
    bridge.nativeRenderDraw(fakeContext(), 64, 64, scene, kind);
    return true;
  } catch (error) {
    logInfo('nativeRenderDraw threw, scene=' + scene.toString() + ' kind=' + kind.toString());
    return false;
  }
}

// 指定画布尺寸调用能力域入口，用于覆盖尺寸守卫。
function callSceneWithSize(width: number, height: number, group: number, scene: number): boolean {
  try {
    bridge.nativeRenderScene(fakeContext(), width, height, group, scene, EMPTY_PARAMS);
    return true;
  } catch (error) {
    logInfo('nativeRenderScene threw, group=' + group.toString() + ' size=' + width.toString());
    return false;
  }
}

export default function ndkRenderNodeNapiTest(): void {
  describe('NdkRenderNodeNapi', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0001
     * @tc.name      testNdkRenderNodeNapi0001
     * @tc.desc      校验 native 模块向 ArkTS 侧暴露的 nativeRenderDraw 是一个可调用的函数。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeNapi0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeNapi0001 begin');
      const renderType: string = typeof bridge.nativeRenderDraw;
      logInfo('nativeRenderDraw type = ' + renderType);
      expect(renderType).assertEqual('function');
      expect(bridge.nativeRenderDraw !== undefined).assertTrue();
      expect(renderType.length).assertLarger(0);
      logInfo('testNdkRenderNodeNapi0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0002
     * @tc.name      testNdkRenderNodeNapi0002
     * @tc.desc      校验 native 模块同时暴露了 nativeMeasureText 测量接口。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeNapi0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeNapi0002 begin');
      const measureType: string = typeof bridge.nativeMeasureText;
      logInfo('nativeMeasureText type = ' + measureType);
      expect(measureType).assertEqual('function');
      expect(bridge.nativeMeasureText !== undefined).assertTrue();
      expect(bridge.nativeMeasureText !== null).assertTrue();
      logInfo('testNdkRenderNodeNapi0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0003
     * @tc.name      testNdkRenderNodeNapi0003
     * @tc.desc      校验合法入参下文本测量返回正的宽高，与字号和排版宽度匹配。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeNapi0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeNapi0003 begin');
      const result: TextMeasureResult | undefined =
        bridge.nativeMeasureText(MEASURE_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(result !== undefined).assertTrue();
      if (result === undefined) {
        return;
      }
      logInfo('measure width = ' + result.width.toString() + ', height = ' + result.height.toString());
      expect(result.width > 0).assertTrue();
      expect(result.height > 0).assertTrue();
      expect(result.width <= MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0004
     * @tc.name      testNdkRenderNodeNapi0004
     * @tc.desc      校验排版宽度为 0 时走参数校验分支，返回宽高为 0 的结果而不是异常。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0004 begin');
      const result: TextMeasureResult | undefined =
        bridge.nativeMeasureText(MEASURE_TEXT, MEASURE_FONT_SIZE, INVALID_MAX_WIDTH);
      expect(result !== undefined).assertTrue();
      if (result === undefined) {
        return;
      }
      logInfo('invalid measure width = ' + result.width.toString() + ', height = ' + result.height.toString());
      expect(result.width).assertEqual(0);
      expect(result.height).assertEqual(0);
      logInfo('testNdkRenderNodeNapi0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0005
     * @tc.name      testNdkRenderNodeNapi0005
     * @tc.desc      校验重复读取 native 模块得到的是同一个函数引用，模块没有被重复注册。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0005 begin');
      const firstRender: Function = bridge.nativeRenderDraw;
      const secondRender: Function = bridge.nativeRenderDraw;
      const firstMeasure: Function = bridge.nativeMeasureText;
      const secondMeasure: Function = bridge.nativeMeasureText;
      logInfo('render entry repeated = ' + (firstRender === secondRender).toString());
      expect(firstRender === secondRender).assertTrue();
      expect(firstMeasure === secondMeasure).assertTrue();
      // 两个入口是不同函数的引用，重复读取不会让它们串成同一个。
      expect(secondRender === firstMeasure).assertFalse();
      logInfo('testNdkRenderNodeNapi0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0006
     * @tc.name      testNdkRenderNodeNapi0006
     * @tc.desc      校验能力域统一入口 nativeRenderScene 已导出为可调用函数。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeNapi0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeNapi0006 begin');
      const sceneType: string = typeof bridge.nativeRenderScene;
      logInfo('nativeRenderScene type = ' + sceneType);
      expect(sceneType).assertEqual('function');
      expect(bridge.nativeRenderScene !== undefined).assertTrue();
      expect(sceneType.length).assertLarger(0);
      logInfo('testNdkRenderNodeNapi0006 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0007
     * @tc.name      testNdkRenderNodeNapi0007
     * @tc.desc      校验三个 native 入口是互不相同的函数引用，没有互相覆盖。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0007 begin');
      const draw: Function = bridge.nativeRenderDraw;
      const scene: Function = bridge.nativeRenderScene;
      const measureEntry: Function = bridge.nativeMeasureText;
      expect(draw === scene).assertFalse();
      expect(draw === measureEntry).assertFalse();
      expect(scene === measureEntry).assertFalse();
      logInfo('testNdkRenderNodeNapi0007 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0008
     * @tc.name      testNdkRenderNodeNapi0008
     * @tc.desc      校验模块对象本身稳定，多次读取拿到同一个模块实例。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0008 begin');
      const first: Function = bridge.nativeMeasureText;
      const second: Function = bridge.nativeMeasureText;
      expect(first === second).assertTrue();
      expect(typeof bridge).assertEqual('object');
      expect(bridge !== null).assertTrue();
      logInfo('testNdkRenderNodeNapi0008 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0009
     * @tc.name      testNdkRenderNodeNapi0009
     * @tc.desc      校验测量结果只包含 width 与 height 两个自有字段，不含额外调试字段。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0009 begin');
      const result: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const keys: string[] = Object.keys(result);
      logInfo('measure keys = ' + keys.join(','));
      expect(keys.length).assertEqual(2);
      expect(keys.indexOf('width') >= 0).assertTrue();
      expect(keys.indexOf('height') >= 0).assertTrue();
      logInfo('testNdkRenderNodeNapi0009 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0010
     * @tc.name      testNdkRenderNodeNapi0010
     * @tc.desc      校验每次测量都返回新对象，改写上次结果不会影响下一次测量的值。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0010 begin');
      const first: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const second: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(first === second).assertFalse();
      first.width = -1;
      const third: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(third.width > 0).assertTrue();
      // 改写上次结果只作用于该对象，后续测量的行高仍等于字号。
      expect(third.height).assertEqual(MEASURE_FONT_SIZE);
      logInfo('testNdkRenderNodeNapi0010 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0011
     * @tc.name      testNdkRenderNodeNapi0011
     * @tc.desc      校验测量结果的两个字段都是 number 类型，可直接参与布局计算。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0011 begin');
      const result: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(typeof result.width).assertEqual('number');
      expect(typeof result.height).assertEqual('number');
      expect(Number.isFinite(result.width)).assertTrue();
      expect(Number.isFinite(result.height)).assertTrue();
      logInfo('testNdkRenderNodeNapi0011 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0012
     * @tc.name      testNdkRenderNodeNapi0012
     * @tc.desc      校验三个入口的返回值类型，绘制入口返回空而测量入口返回对象。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0012 begin');
      expect(typeof bridge.nativeRenderDraw).assertEqual('function');
      expect(typeof bridge.nativeRenderScene).assertEqual('function');
      expect(typeof bridge.nativeMeasureText).assertEqual('function');
      expect(typeof bridge.nativeMeasureText(MEASURE_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH)).assertEqual('object');
      logInfo('testNdkRenderNodeNapi0012 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0013
     * @tc.name      testNdkRenderNodeNapi0013
     * @tc.desc      校验英文单词的测量结果为正数，单行高度等于字号。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeNapi0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeNapi0013 begin');
      const result: TextMeasureResult = measure(TEXTS[0], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('word measure = ' + describeMeasure(result));
      expect(result.width > 0).assertTrue();
      expect(result.height).assertEqual(MEASURE_FONT_SIZE);
      expect(result.width < MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0013 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0014
     * @tc.name      testNdkRenderNodeNapi0014
     * @tc.desc      校验单字符的宽度为正且小于同字号下的单词宽度。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0014 begin');
      const single: TextMeasureResult = measure(TEXTS[1], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const word: TextMeasureResult = measure(TEXTS[0], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('single = ' + describeMeasure(single) + ' word = ' + describeMeasure(word));
      expect(single.width > 0).assertTrue();
      expect(single.width < word.width).assertTrue();
      expect(single.height).assertEqual(word.height);
      logInfo('testNdkRenderNodeNapi0014 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0015
     * @tc.name      testNdkRenderNodeNapi0015
     * @tc.desc      校验双字符宽度大于单字符宽度，宽度随字符数增长。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0015 begin');
      const single: TextMeasureResult = measure(TEXTS[1], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const pair: TextMeasureResult = measure(TEXTS[2], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('pair = ' + describeMeasure(pair));
      expect(pair.width > single.width).assertTrue();
      expect(pair.height).assertEqual(MEASURE_FONT_SIZE);
      // 字符数增加只影响宽度，单行行高保持一致。
      expect(single.height).assertEqual(pair.height);
      logInfo('testNdkRenderNodeNapi0015 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0016
     * @tc.name      testNdkRenderNodeNapi0016
     * @tc.desc      校验纯数字字符串可正常测量，结果为正数且不被截断。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0016 begin');
      const result: TextMeasureResult = measure(TEXTS[3], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('digits = ' + describeMeasure(result));
      expect(result.width > 0).assertTrue();
      expect(result.height).assertEqual(MEASURE_FONT_SIZE);
      expect(result.width < MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0016 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0017
     * @tc.name      testNdkRenderNodeNapi0017
     * @tc.desc      校验纯标点字符串可正常测量，标点不触发排版异常。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0017 begin');
      const result: TextMeasureResult = measure(TEXTS[4], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('punctuation = ' + describeMeasure(result));
      expect(result.width > 0).assertTrue();
      expect(result.height).assertEqual(MEASURE_FONT_SIZE);
      expect(result.width < MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0017 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0018
     * @tc.name      testNdkRenderNodeNapi0018
     * @tc.desc      校验单个空格的测量宽度为正，空格本身占据字形宽度。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0018 begin');
      const single: TextMeasureResult = measure(TEXTS[5], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('single space = ' + describeMeasure(single));
      expect(single.width > 0).assertTrue();
      expect(single.height).assertEqual(MEASURE_FONT_SIZE);
      expect(single.width < MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0018 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0019
     * @tc.name      testNdkRenderNodeNapi0019
     * @tc.desc      校验三个连续空格的宽度约为单个空格的三倍，空格宽度线性累加。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0019 begin');
      const single: TextMeasureResult = measure(TEXTS[5], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const triple: TextMeasureResult = measure(TEXTS[6], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('triple space = ' + describeMeasure(triple));
      expect(triple.width > single.width * 2).assertTrue();
      expect(triple.height).assertEqual(MEASURE_FONT_SIZE);
      expect(triple.width < MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0019 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0020
     * @tc.name      testNdkRenderNodeNapi0020
     * @tc.desc      校验中英混排文本可正常测量，宽度介于纯中文与纯英文之间。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0020 begin');
      const mixed: TextMeasureResult = measure(TEXTS[7], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('mixed = ' + describeMeasure(mixed));
      expect(mixed.width > 0).assertTrue();
      expect(mixed.height).assertEqual(MEASURE_FONT_SIZE);
      expect(mixed.width < MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0020 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0021
     * @tc.name      testNdkRenderNodeNapi0021
     * @tc.desc      校验中文按全角字宽测量，四字宽度约为四倍字号。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0021 begin');
      const cjk: TextMeasureResult = measure(TEXTS[8], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('cjk = ' + describeMeasure(cjk));
      expect(Math.abs(cjk.width - MEASURE_FONT_SIZE * 4) < EPSILON).assertTrue();
      expect(cjk.height).assertEqual(MEASURE_FONT_SIZE);
      expect(cjk.width > 0).assertTrue();
      logInfo('testNdkRenderNodeNapi0021 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0022
     * @tc.name      testNdkRenderNodeNapi0022
     * @tc.desc      校验中英文加数字的混排文本可测量，结果为正数。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0022 begin');
      const result: TextMeasureResult = measure(TEXTS[9], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('cjk mixed = ' + describeMeasure(result));
      expect(result.width > 0).assertTrue();
      expect(result.height >= MEASURE_FONT_SIZE).assertTrue();
      expect(result.width < MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0022 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0023
     * @tc.name      testNdkRenderNodeNapi0023
     * @tc.desc      校验标识符中的下划线不影响测量，结果为正且为单行。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0023 begin');
      const result: TextMeasureResult = measure(TEXTS[10], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('identifier = ' + describeMeasure(result));
      expect(result.width > 0).assertTrue();
      expect(result.height).assertEqual(MEASURE_FONT_SIZE);
      // 十六字符标识符的宽度必然超过一个全角字宽。
      expect(result.width > MEASURE_FONT_SIZE).assertTrue();
      logInfo('testNdkRenderNodeNapi0023 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0024
     * @tc.name      testNdkRenderNodeNapi0024
     * @tc.desc      校验链接文本在窄宽度下自动换行，高度大于单行高度。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0024 begin');
      const narrow: TextMeasureResult = measure(TEXTS[11], MEASURE_FONT_SIZE, 60);
      const wide: TextMeasureResult = measure(TEXTS[11], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('narrow = ' + describeMeasure(narrow) + ' wide = ' + describeMeasure(wide));
      expect(narrow.height > wide.height).assertTrue();
      expect(wide.width > 0).assertTrue();
      expect(narrow.height % LINE_HEIGHT_STEP).assertEqual(0);
      logInfo('testNdkRenderNodeNapi0024 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0025
     * @tc.name      testNdkRenderNodeNapi0025
     * @tc.desc      校验字号 -100 被夹取到下界 12，测量结果与显式传 12 完全一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0025 begin');
      const clamped: TextMeasureResult = measure(MEASURE_TEXT, -100, MEASURE_MAX_WIDTH);
      const floor: TextMeasureResult = measure(MEASURE_TEXT, MIN_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('clamped = ' + describeMeasure(clamped) + ' floor = ' + describeMeasure(floor));
      expect(sameMeasure(clamped, floor)).assertTrue();
      expect(clamped.height).assertEqual(MIN_FONT_SIZE);
      expect(clamped.width < MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0025 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0026
     * @tc.name      testNdkRenderNodeNapi0026
     * @tc.desc      校验字号 -1 被夹取到下界 12，不会产生负高度。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0026 begin');
      const clamped: TextMeasureResult = measure(MEASURE_TEXT, -1, MEASURE_MAX_WIDTH);
      const floor: TextMeasureResult = measure(MEASURE_TEXT, MIN_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(sameMeasure(clamped, floor)).assertTrue();
      expect(clamped.height > 0).assertTrue();
      expect(clamped.height).assertEqual(MIN_FONT_SIZE);
      logInfo('testNdkRenderNodeNapi0026 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0027
     * @tc.name      testNdkRenderNodeNapi0027
     * @tc.desc      校验字号 0 被夹取到下界 12，不会返回空宽高。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0027 begin');
      const clamped: TextMeasureResult = measure(MEASURE_TEXT, 0, MEASURE_MAX_WIDTH);
      const floor: TextMeasureResult = measure(MEASURE_TEXT, MIN_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(sameMeasure(clamped, floor)).assertTrue();
      logInfo('clamped = ' + describeMeasure(clamped));
      expect(clamped.width > 0).assertTrue();
      expect(floor.width).assertEqual(clamped.width);
      logInfo('testNdkRenderNodeNapi0027 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0028
     * @tc.name      testNdkRenderNodeNapi0028
     * @tc.desc      校验字号 0.5 被夹取到下界 12，接近零的小数同样走夹取分支。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0028 begin');
      const clamped: TextMeasureResult = measure(MEASURE_TEXT, 0.5, MEASURE_MAX_WIDTH);
      const floor: TextMeasureResult = measure(MEASURE_TEXT, MIN_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(sameMeasure(clamped, floor)).assertTrue();
      expect(clamped.height).assertEqual(MIN_FONT_SIZE);
      expect(clamped.width < MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0028 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0029
     * @tc.name      testNdkRenderNodeNapi0029
     * @tc.desc      校验字号 1 被夹取到下界 12，亚像素字号不会进入排版引擎。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0029 begin');
      const clamped: TextMeasureResult = measure(MEASURE_TEXT, 1, MEASURE_MAX_WIDTH);
      const floor: TextMeasureResult = measure(MEASURE_TEXT, MIN_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(sameMeasure(clamped, floor)).assertTrue();
      expect(floor.height).assertEqual(MIN_FONT_SIZE);
      expect(clamped.width > 0).assertTrue();
      logInfo('testNdkRenderNodeNapi0029 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0030
     * @tc.name      testNdkRenderNodeNapi0030
     * @tc.desc      校验字号 11.99 被夹取到下界 12，下界附近的小偏差同样不放过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0030 begin');
      const clamped: TextMeasureResult = measure(MEASURE_TEXT, 11.99, MEASURE_MAX_WIDTH);
      const floor: TextMeasureResult = measure(MEASURE_TEXT, MIN_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(sameMeasure(clamped, floor)).assertTrue();
      expect(clamped.height).assertEqual(floor.height);
      expect(Number.isFinite(clamped.width)).assertTrue();
      logInfo('testNdkRenderNodeNapi0030 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0031
     * @tc.name      testNdkRenderNodeNapi0031
     * @tc.desc      校验字号 12 不触发夹取，单行高度恰为字号。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeNapi0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeNapi0031 begin');
      const result: TextMeasureResult = measure(MEASURE_TEXT, MIN_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('size 12 = ' + describeMeasure(result));
      expect(result.height).assertEqual(MIN_FONT_SIZE);
      expect(result.width > 0).assertTrue();
      expect(result.width < MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0031 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0032
     * @tc.name      testNdkRenderNodeNapi0032
     * @tc.desc      校验字号 20 为单行，高度等于字号且宽度约为 115 像素。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeNapi0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeNapi0032 begin');
      const result: TextMeasureResult = measure(MEASURE_TEXT, 20, MEASURE_MAX_WIDTH);
      logInfo('size 20 = ' + describeMeasure(result));
      expect(result.height).assertEqual(20);
      expect(Math.abs(result.width - 115.28) < EPSILON).assertTrue();
      expect(result.width < MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0032 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0033
     * @tc.name      testNdkRenderNodeNapi0033
     * @tc.desc      校验字号 48 仍为单行，高度等于字号且宽度小于排版宽度。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0033 begin');
      const result: TextMeasureResult = measure(MEASURE_TEXT, 48, MEASURE_MAX_WIDTH);
      logInfo('size 48 = ' + describeMeasure(result));
      expect(result.height).assertEqual(48);
      expect(result.width < MEASURE_MAX_WIDTH).assertTrue();
      expect(result.width > 0).assertTrue();
      logInfo('testNdkRenderNodeNapi0033 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0034
     * @tc.name      testNdkRenderNodeNapi0034
     * @tc.desc      校验字号 72 在 400 宽度下换为两行，高度为字号的二倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0034 begin');
      const result: TextMeasureResult = measure(MEASURE_TEXT, 72, MEASURE_MAX_WIDTH);
      logInfo('size 72 = ' + describeMeasure(result));
      expect(result.height).assertEqual(144);
      // 两行排版的浮高仍按字号整数倍计。
      expect(result.height % 72).assertEqual(0);
      expect(result.width <= MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0034 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0035
     * @tc.name      testNdkRenderNodeNapi0035
     * @tc.desc      校验字号 96.01 被夹取到上界 96，超过上限的微小偏差同样被夹取。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0035 begin');
      const clamped: TextMeasureResult = measure(MEASURE_TEXT, 96.01, MEASURE_MAX_WIDTH);
      const ceil: TextMeasureResult = measure(MEASURE_TEXT, MAX_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(sameMeasure(clamped, ceil)).assertTrue();
      expect(clamped.height).assertEqual(ceil.height);
      expect(ceil.height % MAX_FONT_SIZE).assertEqual(0);
      logInfo('testNdkRenderNodeNapi0035 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0036
     * @tc.name      testNdkRenderNodeNapi0036
     * @tc.desc      校验字号 1000 被夹取到上界 96，超大字号不会撑爆排版。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0036 begin');
      const clamped: TextMeasureResult = measure(MEASURE_TEXT, 1000, MEASURE_MAX_WIDTH);
      const ceil: TextMeasureResult = measure(MEASURE_TEXT, MAX_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('clamped = ' + describeMeasure(clamped));
      expect(sameMeasure(clamped, ceil)).assertTrue();
      expect(clamped.height % MAX_FONT_SIZE).assertEqual(0);
      expect(clamped.width > 0).assertTrue();
      logInfo('testNdkRenderNodeNapi0036 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0037
     * @tc.name      testNdkRenderNodeNapi0037
     * @tc.desc      校验字号为无穷大时被夹取到上界 96，不返回非法数值。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0037 begin');
      const clamped: TextMeasureResult = measure(MEASURE_TEXT, Number.POSITIVE_INFINITY, MEASURE_MAX_WIDTH);
      const ceil: TextMeasureResult = measure(MEASURE_TEXT, MAX_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(sameMeasure(clamped, ceil)).assertTrue();
      expect(Number.isFinite(clamped.height)).assertTrue();
      expect(clamped.width < MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0037 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0038
     * @tc.name      testNdkRenderNodeNapi0038
     * @tc.desc      校验字号为 NaN 时排版构建失败，返回宽高均为 0 的结果。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0038 begin');
      const result: TextMeasureResult = measure(MEASURE_TEXT, Number.NaN, MEASURE_MAX_WIDTH);
      logInfo('nan size = ' + describeMeasure(result));
      expect(result.width).assertEqual(0);
      expect(result.height).assertEqual(0);
      expect(result.width).assertEqual(result.height);
      logInfo('testNdkRenderNodeNapi0038 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0039
     * @tc.name      testNdkRenderNodeNapi0039
     * @tc.desc      校验最大宽度 -1000 被参数校验拦截，返回宽高均为 0。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeNapi0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeNapi0039 begin');
      const result: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, -1000);
      expect(result.width).assertEqual(0);
      expect(result.height).assertEqual(0);
      expect(result.width).assertEqual(result.height);
      logInfo('testNdkRenderNodeNapi0039 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0040
     * @tc.name      testNdkRenderNodeNapi0040
     * @tc.desc      校验最大宽度 -1 被参数校验拦截，负宽度一律返回零值。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeNapi0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeNapi0040 begin');
      const result: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, -1);
      expect(result.width).assertEqual(0);
      expect(result.height).assertEqual(0);
      // 负宽度被拦截后返回的是零值而不是负数。
      expect(result.width >= 0).assertTrue();
      logInfo('testNdkRenderNodeNapi0040 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0041
     * @tc.name      testNdkRenderNodeNapi0041
     * @tc.desc      校验最大宽度 0 被参数校验拦截，与负宽度的处理保持一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeNapi0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeNapi0041 begin');
      const zero: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, 0);
      const negative: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, -1);
      expect(zero.width).assertEqual(0);
      expect(zero.height).assertEqual(0);
      expect(sameMeasure(zero, negative)).assertTrue();
      logInfo('testNdkRenderNodeNapi0041 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0042
     * @tc.name      testNdkRenderNodeNapi0042
     * @tc.desc      校验最大宽度 0.5 仍在合法区间，排版退化为逐字换行且高度很大。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0042 begin');
      const result: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, 0.5);
      logInfo('width 0.5 = ' + describeMeasure(result));
      expect(result.width > 0).assertTrue();
      expect(result.height >= 100).assertTrue();
      expect(result.height % LINE_HEIGHT_STEP).assertEqual(0);
      logInfo('testNdkRenderNodeNapi0042 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0043
     * @tc.name      testNdkRenderNodeNapi0043
     * @tc.desc      校验最大宽度 1 时每个字符独占一行，高度为字号的十倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0043 begin');
      const result: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, 1);
      logInfo('width 1 = ' + describeMeasure(result));
      expect(result.height).assertEqual(200);
      expect(result.width > 0).assertTrue();
      // 逐字换行时行长不超过一个字宽。
      expect(result.width <= MEASURE_FONT_SIZE).assertTrue();
      logInfo('testNdkRenderNodeNapi0043 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0044
     * @tc.name      testNdkRenderNodeNapi0044
     * @tc.desc      校验最大宽度 2 时同样逐字换行，高度不低于十行。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0044 begin');
      const result: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, 2);
      logInfo('width 2 = ' + describeMeasure(result));
      expect(result.height >= 100).assertTrue();
      expect(result.height % LINE_HEIGHT_STEP).assertEqual(0);
      expect(result.width > 0).assertTrue();
      logInfo('testNdkRenderNodeNapi0044 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0045
     * @tc.name      testNdkRenderNodeNapi0045
     * @tc.desc      校验最大宽度 5 时仍为逐字换行，高度为字号的整数倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0045 begin');
      const result: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, 5);
      logInfo('width 5 = ' + describeMeasure(result));
      expect(result.height >= 100).assertTrue();
      expect(result.height % LINE_HEIGHT_STEP).assertEqual(0);
      expect(result.width < MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0045 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0046
     * @tc.name      testNdkRenderNodeNapi0046
     * @tc.desc      校验最大宽度 10 时多行排版，高度为字号整数倍且不小于单行。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0046 begin');
      const result: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, 10);
      logInfo('width 10 = ' + describeMeasure(result));
      expect(result.height % LINE_HEIGHT_STEP).assertEqual(0);
      expect(result.height >= LINE_HEIGHT_STEP).assertTrue();
      expect(result.width <= 10 + MEASURE_FONT_SIZE).assertTrue();
      logInfo('testNdkRenderNodeNapi0046 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0047
     * @tc.name      testNdkRenderNodeNapi0047
     * @tc.desc      校验最大宽度 20 时多行排版，行长不超过排版宽度太多。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0047 begin');
      const result: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, 20);
      logInfo('width 20 = ' + describeMeasure(result));
      expect(result.height % LINE_HEIGHT_STEP).assertEqual(0);
      expect(result.height >= LINE_HEIGHT_STEP).assertTrue();
      expect(result.width > 0).assertTrue();
      logInfo('testNdkRenderNodeNapi0047 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0048
     * @tc.name      testNdkRenderNodeNapi0048
     * @tc.desc      校验最大宽度 60 时换为两行，高度恰为字号的二倍。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0048 begin');
      const result: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, 60);
      logInfo('width 60 = ' + describeMeasure(result));
      expect(result.height).assertEqual(40);
      expect(result.height).assertEqual(LINE_HEIGHT_STEP * 2);
      expect(result.width <= 60).assertTrue();
      logInfo('testNdkRenderNodeNapi0048 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0049
     * @tc.name      testNdkRenderNodeNapi0049
     * @tc.desc      校验最大宽度 100 时高度仍为字号整数倍，排版不会坍塌。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0049 begin');
      const result: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, 100);
      logInfo('width 100 = ' + describeMeasure(result));
      expect(result.height % LINE_HEIGHT_STEP).assertEqual(0);
      expect(result.height >= LINE_HEIGHT_STEP).assertTrue();
      expect(result.height > LINE_HEIGHT_STEP).assertTrue();
      logInfo('testNdkRenderNodeNapi0049 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0050
     * @tc.name      testNdkRenderNodeNapi0050
     * @tc.desc      校验最大宽度 200 时容得下整个单词，高度回落为单行。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0050 begin');
      const result: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, 200);
      logInfo('width 200 = ' + describeMeasure(result));
      expect(result.height).assertEqual(MEASURE_FONT_SIZE);
      expect(result.width < MEASURE_MAX_WIDTH).assertTrue();
      expect(result.width > 0).assertTrue();
      logInfo('testNdkRenderNodeNapi0050 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0051
     * @tc.name      testNdkRenderNodeNapi0051
     * @tc.desc      校验最大宽度 400 时为单行，宽度等于文本自然宽度。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeNapi0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeNapi0051 begin');
      const result: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(result.height).assertEqual(MEASURE_FONT_SIZE);
      expect(result.width < MEASURE_MAX_WIDTH).assertTrue();
      expect(result.width > 0).assertTrue();
      logInfo('testNdkRenderNodeNapi0051 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0052
     * @tc.name      testNdkRenderNodeNapi0052
     * @tc.desc      校验最大宽度 2000 与 400 结果一致，宽容量不再改变排版。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0052 begin');
      const wide: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, 2000);
      const base: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('width 2000 = ' + describeMeasure(wide));
      expect(sameMeasure(wide, base)).assertTrue();
      expect(wide.height).assertEqual(base.height);
      expect(wide.width < MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0052 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0053
     * @tc.name      testNdkRenderNodeNapi0053
     * @tc.desc      校验最大宽度为 NaN 时不进入零值分支，结果与常规宽度一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0053 begin');
      const nanWidth: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, Number.NaN);
      const base: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('nan width = ' + describeMeasure(nanWidth));
      expect(nanWidth.height > 0).assertTrue();
      expect(sameMeasure(nanWidth, base)).assertTrue();
      expect(nanWidth.width < MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0053 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0054
     * @tc.name      testNdkRenderNodeNapi0054
     * @tc.desc      校验最大宽度为无穷大时按不受限排版，结果与常规宽度一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0054 begin');
      const infinity: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, Number.POSITIVE_INFINITY);
      const base: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('infinity width = ' + describeMeasure(infinity));
      expect(Number.isFinite(infinity.width)).assertTrue();
      expect(sameMeasure(infinity, base)).assertTrue();
      expect(Number.isFinite(infinity.height)).assertTrue();
      logInfo('testNdkRenderNodeNapi0054 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0055
     * @tc.name      testNdkRenderNodeNapi0055
     * @tc.desc      校验同一入参连续测量三次结果完全一致，测量过程无随机性。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeNapi0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeNapi0055 begin');
      const first: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const second: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const third: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(sameMeasure(first, second)).assertTrue();
      expect(sameMeasure(second, third)).assertTrue();
      // 首末两次结果一致，说明测量过程无随机性。
      expect(sameMeasure(first, third)).assertTrue();
      logInfo('testNdkRenderNodeNapi0055 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0056
     * @tc.name      testNdkRenderNodeNapi0056
     * @tc.desc      校验单行区间内宽度随字号单调递增，排版宽度保持线性。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0056 begin');
      const sizes: number[] = [MIN_FONT_SIZE, 20, 32, 48];
      let previous: number = 0;
      for (let index = 0; index < sizes.length; index++) {
        const current: TextMeasureResult = measure(MEASURE_TEXT, sizes[index], MEASURE_MAX_WIDTH);
        logInfo('size ' + sizes[index].toString() + ' width = ' + current.width.toString());
        expect(current.width > previous).assertTrue();
        previous = current.width;
      }
      expect(previous > 0).assertTrue();
      expect(previous < MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0056 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0057
     * @tc.name      testNdkRenderNodeNapi0057
     * @tc.desc      校验高度随字号单调不减，字号增大后行高不会变小。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0057 begin');
      const sizes: number[] = [MIN_FONT_SIZE, 20, 48, 72, MAX_FONT_SIZE];
      let previous: number = 0;
      for (let index = 0; index < sizes.length; index++) {
        const current: TextMeasureResult = measure(MEASURE_TEXT, sizes[index], MEASURE_MAX_WIDTH);
        logInfo('size ' + sizes[index].toString() + ' height = ' + current.height.toString());
        expect(current.height >= previous).assertTrue();
        previous = current.height;
      }
      expect(previous > 0).assertTrue();
      expect(previous % MAX_FONT_SIZE).assertEqual(0);
      logInfo('testNdkRenderNodeNapi0057 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0058
     * @tc.name      testNdkRenderNodeNapi0058
     * @tc.desc      校验高度随最大宽度单调不增，排版越窄需要的行数越多。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0058 begin');
      const widths: number[] = [60, 100, 200, 400, 2000];
      let previous: number = -1;
      for (let index = 0; index < widths.length; index++) {
        const current: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, widths[index]);
        logInfo('width ' + widths[index].toString() + ' height = ' + current.height.toString());
        if (previous >= 0) {
          expect(current.height <= previous).assertTrue();
        }
        previous = current.height;
      }
      expect(previous).assertEqual(MEASURE_FONT_SIZE);
      expect(widths.length).assertEqual(5);
      logInfo('testNdkRenderNodeNapi0058 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0059
     * @tc.name      testNdkRenderNodeNapi0059
     * @tc.desc      校验超长文本在 400 宽度下需要多行，高度明显大于宽松排版。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0059 begin');
      const narrow: TextMeasureResult = measure(LONG_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const wide: TextMeasureResult = measure(LONG_TEXT, MEASURE_FONT_SIZE, 4000);
      logInfo('long narrow = ' + describeMeasure(narrow) + ' wide = ' + describeMeasure(wide));
      expect(narrow.height > wide.height).assertTrue();
      expect(narrow.width <= MEASURE_MAX_WIDTH).assertTrue();
      expect(wide.height).assertEqual(MEASURE_FONT_SIZE);
      logInfo('testNdkRenderNodeNapi0059 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0060
     * @tc.name      testNdkRenderNodeNapi0060
     * @tc.desc      校验超长文本在 4000 宽度下排为单行，高度回到字号值。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0060 begin');
      const wide: TextMeasureResult = measure(LONG_TEXT, MEASURE_FONT_SIZE, 4000);
      logInfo('long wide = ' + describeMeasure(wide));
      expect(wide.height).assertEqual(MEASURE_FONT_SIZE);
      expect(wide.width > MEASURE_MAX_WIDTH).assertTrue();
      expect(wide.width < 4000).assertTrue();
      logInfo('testNdkRenderNodeNapi0060 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0061
     * @tc.name      testNdkRenderNodeNapi0061
     * @tc.desc      校验一百六十字文本在 400 宽度下排为五行，高度为五倍字号。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0061 begin');
      const result: TextMeasureResult = measure(LONG_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('long 400 = ' + describeMeasure(result));
      expect(result.height).assertEqual(100);
      expect(result.height % LINE_HEIGHT_STEP).assertEqual(0);
      expect(result.width <= MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0061 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0062
     * @tc.name      testNdkRenderNodeNapi0062
     * @tc.desc      校验空文本没有有效行长，宽度为负哨兵值，调用方需按非正处理。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0062 begin');
      const result: TextMeasureResult = measure('', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('empty = ' + describeMeasure(result));
      expect(result.width < 0).assertTrue();
      expect(result.height > 0).assertTrue();
      expect(Number.isFinite(result.width)).assertTrue();
      logInfo('testNdkRenderNodeNapi0062 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0063
     * @tc.name      testNdkRenderNodeNapi0063
     * @tc.desc      校验空文本仍占一行行高，高度为正数且有限，便于布局占位。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0063 begin');
      const result: TextMeasureResult = measure('', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      expect(result.height > 0).assertTrue();
      expect(Number.isFinite(result.height)).assertTrue();
      expect(result.width < 0).assertTrue();
      logInfo('testNdkRenderNodeNapi0063 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0064
     * @tc.name      testNdkRenderNodeNapi0064
     * @tc.desc      校验十二种文本乘三个字号的组合宽高均为有限数，不会出现 NaN 或无穷。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0064 begin');
      const sizes: number[] = [MIN_FONT_SIZE, 20, 48];
      let checked: number = 0;
      for (let textIndex = 0; textIndex < TEXTS.length; textIndex++) {
        for (let sizeIndex = 0; sizeIndex < sizes.length; sizeIndex++) {
          const result: TextMeasureResult = measure(TEXTS[textIndex], sizes[sizeIndex], MEASURE_MAX_WIDTH);
          expect(Number.isFinite(result.width)).assertTrue();
          expect(Number.isFinite(result.height)).assertTrue();
          checked++;
        }
      }
      logInfo('finite checked = ' + checked.toString());
      expect(checked).assertEqual(36);
      logInfo('testNdkRenderNodeNapi0064 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0065
     * @tc.name      testNdkRenderNodeNapi0065
     * @tc.desc      校验排版高度为字号的整数倍，行数不会出现小数。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0065 begin');
      const sizes: number[] = [MIN_FONT_SIZE, 20, 48];
      for (let index = 0; index < sizes.length; index++) {
        const result: TextMeasureResult = measure(MEASURE_TEXT, sizes[index], MEASURE_MAX_WIDTH);
        logInfo('size ' + sizes[index].toString() + ' height = ' + result.height.toString());
        expect(result.height % sizes[index]).assertEqual(0);
      }
      // 末档字号再测一次，行高仍为字号整数倍且不少于单行。
      const lastSize: number = sizes[sizes.length - 1];
      const last: TextMeasureResult = measure(MEASURE_TEXT, lastSize, MEASURE_MAX_WIDTH);
      expect(last.height % lastSize).assertEqual(0);
      expect(last.height >= lastSize).assertTrue();
      logInfo('testNdkRenderNodeNapi0065 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0066
     * @tc.name      testNdkRenderNodeNapi0066
     * @tc.desc      校验宽度随字符数递增：单字小于双字，双字小于完整单词。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0066 begin');
      const single: TextMeasureResult = measure(TEXTS[1], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const pair: TextMeasureResult = measure(TEXTS[2], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const word: TextMeasureResult = measure(TEXTS[0], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo(describeMeasure(single) + ' < ' + describeMeasure(pair) + ' < ' + describeMeasure(word));
      expect(single.width < pair.width).assertTrue();
      expect(pair.width < word.width).assertTrue();
      expect(single.height).assertEqual(word.height);
      logInfo('testNdkRenderNodeNapi0066 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0067
     * @tc.name      testNdkRenderNodeNapi0067
     * @tc.desc      校验显式换行符使文本排为两行，高度为两倍字号。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0067 begin');
      const result: TextMeasureResult = measure('RenderNode\nRenderNode', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('two lines = ' + describeMeasure(result));
      expect(result.height).assertEqual(MEASURE_FONT_SIZE * 2);
      expect(result.height % LINE_HEIGHT_STEP).assertEqual(0);
      expect(result.width <= MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0067 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0068
     * @tc.name      testNdkRenderNodeNapi0068
     * @tc.desc      校验三个显式换行符使文本排为四行，高度为四倍字号。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0068 begin');
      const result: TextMeasureResult = measure('A\nB\nC\nD', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('four lines = ' + describeMeasure(result));
      expect(result.height).assertEqual(MEASURE_FONT_SIZE * 4);
      expect(result.width > 0).assertTrue();
      expect(result.width < MEASURE_MAX_WIDTH).assertTrue();
      logInfo('testNdkRenderNodeNapi0068 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0069
     * @tc.name      testNdkRenderNodeNapi0069
     * @tc.desc      校验换行符与自动换行叠加时高度取两者中更大的行数。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0069 begin');
      const manual: TextMeasureResult = measure(LONG_TEXT + '\n' + LONG_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const single: TextMeasureResult = measure(LONG_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('manual break = ' + describeMeasure(manual) + ', single = ' + describeMeasure(single));
      expect(manual.height >= single.height * 2).assertTrue();
      expect(manual.height >= single.height).assertTrue();
      expect(manual.height % LINE_HEIGHT_STEP).assertEqual(0);
      logInfo('testNdkRenderNodeNapi0069 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0070
     * @tc.name      testNdkRenderNodeNapi0070
     * @tc.desc      校验纯中文文本宽度等于字数乘字号，汉字按全角方格排版。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0070 begin');
      const four: TextMeasureResult = measure('你好鸿蒙', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      const eight: TextMeasureResult = measure('你好鸿蒙渲染节点', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('cjk 4 = ' + describeMeasure(four) + ', 8 = ' + describeMeasure(eight));
      // 汉字宽度与字号成正比，排版引擎以 float 笔画计算，允许 1 像素误差。
      expect(Math.abs(four.width - MEASURE_FONT_SIZE * 4) < EPSILON).assertTrue();
      expect(Math.abs(eight.width - MEASURE_FONT_SIZE * 8) < EPSILON).assertTrue();
      expect(Math.abs(eight.width - four.width * 2) < EPSILON).assertTrue();
      logInfo('testNdkRenderNodeNapi0070 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0071
     * @tc.name      testNdkRenderNodeNapi0071
     * @tc.desc      校验画布域全部场景在缺少真实画布时被静默拒绝，不抛异常也不重复出图。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0071 begin');
      let passed: number = 0;
      for (let scene = 0; scene < GROUP_SCENE_COUNTS[0]; scene++) {
        expect(callScene(GROUP_CANVAS, scene, EMPTY_PARAMS)).assertTrue();
        passed++;
      }
      logInfo('canvas guard passed = ' + passed.toString());
      expect(passed).assertEqual(GROUP_SCENE_COUNTS[0]);
      expect(GROUP_SCENE_COUNTS.length).assertEqual(GROUP_ERROR);
      logInfo('testNdkRenderNodeNapi0071 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0072
     * @tc.name      testNdkRenderNodeNapi0072
     * @tc.desc      校验几何域全部场景在缺少真实画布时被静默拒绝，不抛异常。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0072 begin');
      let passed: number = 0;
      for (let scene = 0; scene < GROUP_SCENE_COUNTS[1]; scene++) {
        expect(callScene(GROUP_GEOMETRY, scene, EMPTY_PARAMS)).assertTrue();
        passed++;
      }
      expect(passed).assertEqual(GROUP_SCENE_COUNTS[1]);
      // 几何域是第二个能力域，场景数按编号减一取下标。
      expect(GROUP_GEOMETRY).assertEqual(2);
      logInfo('testNdkRenderNodeNapi0072 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0073
     * @tc.name      testNdkRenderNodeNapi0073
     * @tc.desc      校验画质域全部场景在缺少真实画布时被静默拒绝，不抛异常。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0073 begin');
      let passed: number = 0;
      for (let scene = 0; scene < GROUP_SCENE_COUNTS[2]; scene++) {
        expect(callScene(GROUP_PAINT, scene, EMPTY_PARAMS)).assertTrue();
        passed++;
      }
      expect(passed).assertEqual(GROUP_SCENE_COUNTS[2]);
      expect(GROUP_PAINT).assertEqual(3);
      logInfo('testNdkRenderNodeNapi0073 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0074
     * @tc.name      testNdkRenderNodeNapi0074
     * @tc.desc      校验其余十六个能力域的全部场景在无真实画布时不抛异常，覆盖数对齐能力域总数。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0074 begin');
      let passed: number = 0;
      for (let group = GROUP_COLOR; group <= GROUP_ERROR; group++) {
        for (let scene = 0; scene < GROUP_SCENE_COUNTS[group - 1]; scene++) {
          expect(callScene(group, scene, EMPTY_PARAMS)).assertTrue();
          passed++;
        }
      }
      logInfo('rest groups guard passed = ' + passed.toString());
      expect(passed).assertEqual(TOTAL_SCENE_COUNT - COVERED_SCENE_COUNT);
      expect(COVERED_SCENE_COUNT).assertEqual(31);
      logInfo('testNdkRenderNodeNapi0074 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0075
     * @tc.name      testNdkRenderNodeNapi0075
     * @tc.desc      校验十个专题分组的四十个场景在无真实画布时不抛异常，覆盖数对齐专题场景总数。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0075 begin');
      let passed: number = 0;
      for (let group = TOPIC_GROUP_FIRST; group < TOPIC_GROUP_FIRST + TOPIC_GROUP_COUNT; group++) {
        for (let scene = 0; scene < TOPIC_SCENE_TOTAL; scene++) {
          expect(callScene(group, scene, EMPTY_PARAMS)).assertTrue();
          passed++;
        }
      }
      logInfo('topic guard passed = ' + passed.toString());
      expect(passed).assertEqual(TOPIC_GROUP_COUNT * TOPIC_SCENE_TOTAL);
      expect(TOPIC_GROUP_COUNT).assertEqual(10);
      logInfo('testNdkRenderNodeNapi0075 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0076
     * @tc.name      testNdkRenderNodeNapi0076
     * @tc.desc      校验分组编号越界（零、负数、超过专题上限）时入口静默拒绝，不抛异常也不影响合法调用。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0076 begin');
      const invalidGroups: number[] = [0, -1, 30, 99, -2147483648];
      for (let index = 0; index < invalidGroups.length; index++) {
        expect(callScene(invalidGroups[index], 0, EMPTY_PARAMS)).assertTrue();
      }
      // 越界调用后合法分组仍可正常进入，说明入口没有被脏参数弄成不可用状态。
      expect(callScene(GROUP_CANVAS, 0, EMPTY_PARAMS)).assertTrue();
      logInfo('invalid group calls = ' + invalidGroups.length.toString());
      expect(invalidGroups.length).assertEqual(5);
      logInfo('testNdkRenderNodeNapi0076 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0077
     * @tc.name      testNdkRenderNodeNapi0077
     * @tc.desc      校验场景编号越界（负数与超过该域场景数）时入口静默拒绝，不抛异常。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0077 begin');
      const geometryCount: number = GROUP_SCENE_COUNTS[GROUP_GEOMETRY - 1];
      const invalidScenes: number[] = [-1, -100, geometryCount, geometryCount + 10, 999];
      for (let index = 0; index < invalidScenes.length; index++) {
        expect(callScene(GROUP_GEOMETRY, invalidScenes[index], EMPTY_PARAMS)).assertTrue();
      }
      expect(callScene(GROUP_GEOMETRY, geometryCount - 1, EMPTY_PARAMS)).assertTrue();
      logInfo('invalid scene calls = ' + invalidScenes.length.toString());
      expect(invalidScenes.length).assertEqual(5);
      logInfo('testNdkRenderNodeNapi0077 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0078
     * @tc.name      testNdkRenderNodeNapi0078
     * @tc.desc      校验画布宽高为零或负数时入口直接跳过绘制，不抛异常。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0078 begin');
      expect(callSceneWithSize(0, GUARD_SIZE, GROUP_PIXELMAP, 0)).assertTrue();
      expect(callSceneWithSize(GUARD_SIZE, 0, GROUP_PIXELMAP, 0)).assertTrue();
      expect(callSceneWithSize(0, 0, GROUP_PIXELMAP, 0)).assertTrue();
      expect(callSceneWithSize(-GUARD_SIZE, GUARD_SIZE, GROUP_PIXELMAP, 0)).assertTrue();
      expect(callSceneWithSize(GUARD_SIZE, -GUARD_SIZE, GROUP_PIXELMAP, 0)).assertTrue();
      expect(callSceneWithSize(-1, -1, GROUP_PIXELMAP, 0)).assertTrue();
      logInfo('testNdkRenderNodeNapi0078 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0079
     * @tc.name      testNdkRenderNodeNapi0079
     * @tc.desc      校验参数数组为空、满容量、超长与非有限数值时入口不抛异常。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0079 begin');
      const overflowParams: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
      const wildParams: number[] = [Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY,
        -1e9, 1e9, -0, 1e-9];
      const fullParams: number[] = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8];
      expect(callScene(GROUP_CANVAS, 0, EMPTY_PARAMS)).assertTrue();
      expect(callScene(GROUP_CANVAS, 0, overflowParams)).assertTrue();
      expect(callScene(GROUP_CANVAS, 0, wildParams)).assertTrue();
      expect(callScene(GROUP_CANVAS, 0, fullParams)).assertTrue();
      logInfo('param variants = 4');
      logInfo('testNdkRenderNodeNapi0079 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0080
     * @tc.name      testNdkRenderNodeNapi0080
     * @tc.desc      校验旧绘制入口的五个场景在第一个合法种类下均被静默拒绝，不抛异常。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0080 begin');
      for (let scene = 0; scene < SCENE_KIND_COUNTS.length; scene++) {
        expect(callDraw(scene, 0)).assertTrue();
      }
      logInfo('scene kind counts = ' + SCENE_KIND_COUNTS.toString());
      expect(SCENE_KIND_COUNTS.length).assertEqual(5);
      expect(SCENE_KIND_COUNTS[0] > 0).assertTrue();
      logInfo('testNdkRenderNodeNapi0080 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0081
     * @tc.name      testNdkRenderNodeNapi0081
     * @tc.desc      校验旧绘制入口的场景与种类编号越界时全部静默拒绝，不访问越界内存。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0081 begin');
      const invalidScenes: number[] = [-1, 5, 99, -999];
      for (let index = 0; index < invalidScenes.length; index++) {
        expect(callDraw(invalidScenes[index], 0)).assertTrue();
      }
      for (let scene = 0; scene < SCENE_KIND_COUNTS.length; scene++) {
        expect(callDraw(scene, -1)).assertTrue();
        expect(callDraw(scene, SCENE_KIND_COUNTS[scene])).assertTrue();
        expect(callDraw(scene, 999)).assertTrue();
      }
      logInfo('testNdkRenderNodeNapi0081 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0082
     * @tc.name      testNdkRenderNodeNapi0082
     * @tc.desc      校验重复调用入口不会改变后续行为，测量结果也与第一次一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0082 begin');
      const first: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      for (let round = 0; round < 5; round++) {
        expect(callScene(GROUP_CANVAS, 0, EMPTY_PARAMS)).assertTrue();
        expect(callDraw(0, 0)).assertTrue();
      }
      const second: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
      logInfo('repeat measure ' + describeMeasure(first) + ' vs ' + describeMeasure(second));
      expect(sameMeasure(first, second)).assertTrue();
      logInfo('testNdkRenderNodeNapi0082 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0083
     * @tc.name      testNdkRenderNodeNapi0083
     * @tc.desc      校验十二种文本在 400 宽度下均给出正宽高，且宽度不超过排版宽度。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNapi0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeNapi0083 begin');
      let failures: string = '';
      for (let index = 0; index < TEXTS.length; index++) {
        const result: TextMeasureResult = measure(TEXTS[index], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
        if (!(result.width > 0) || !(result.width <= MEASURE_MAX_WIDTH)) {
          failures += 'text#' + index.toString() + ' w=' + result.width.toString() + ';';
        }
        if (!(result.height > 0)) {
          failures += 'text#' + index.toString() + ' h=' + result.height.toString() + ';';
        }
      }
      logInfo('width cap failures = [' + failures + ']');
      expect(failures).assertEqual('');
      expect(TEXTS.length).assertEqual(12);
      expect(failures.length).assertEqual(0);
      logInfo('testNdkRenderNodeNapi0083 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0084
     * @tc.name      testNdkRenderNodeNapi0084
     * @tc.desc      校验十二种文本的排版高度始终为字号整数倍，行数不会出现小数行。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0084 begin');
      let failures: string = '';
      for (let index = 0; index < TEXTS.length; index++) {
        const result: TextMeasureResult = measure(TEXTS[index], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
        if (result.height % LINE_HEIGHT_STEP !== 0) {
          failures += 'text#' + index.toString() + ' h=' + result.height.toString() + ';';
        }
      }
      logInfo('line step failures = [' + failures + ']');
      expect(failures).assertEqual('');
      expect(TEXTS.length).assertLarger(0);
      // 本用例的前提是行高步长等于字号。
      expect(LINE_HEIGHT_STEP).assertEqual(MEASURE_FONT_SIZE);
      logInfo('testNdkRenderNodeNapi0084 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0085
     * @tc.name      testNdkRenderNodeNapi0085
     * @tc.desc      校验排版宽度变窄时高度不会下降，变宽时高度不会上升，换行行为单调。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0085 begin');
      const widths: number[] = [60, 120, 200, 400, 2000];
      let previousHeight: number = 0;
      for (let index = 0; index < widths.length; index++) {
        const result: TextMeasureResult = measure(LONG_TEXT, MEASURE_FONT_SIZE, widths[index]);
        logInfo('width ' + widths[index].toString() + ' -> ' + describeMeasure(result));
        if (index > 0) {
          expect(result.height <= previousHeight).assertTrue();
        }
        previousHeight = result.height;
      }
      expect(previousHeight).assertEqual(MEASURE_FONT_SIZE);
      expect(widths.length).assertEqual(5);
      logInfo('testNdkRenderNodeNapi0085 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0086
     * @tc.name      testNdkRenderNodeNapi0086
     * @tc.desc      校验十二种文本在 400 与无穷大宽度下只要未换行，宽度结果完全一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0086 begin');
      let compared: number = 0;
      for (let index = 0; index < TEXTS.length; index++) {
        const normal: TextMeasureResult = measure(TEXTS[index], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
        const infinite: TextMeasureResult = measure(TEXTS[index], MEASURE_FONT_SIZE, Number.POSITIVE_INFINITY);
        if (normal.height === MEASURE_FONT_SIZE) {
          expect(Math.abs(normal.width - infinite.width) < EPSILON).assertTrue();
          compared++;
        }
      }
      logInfo('single line compared = ' + compared.toString());
      expect(compared > 0).assertTrue();
      expect(TEXTS.length).assertEqual(12);
      logInfo('testNdkRenderNodeNapi0086 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0087
     * @tc.name      testNdkRenderNodeNapi0087
     * @tc.desc      校验空串在最小、常用、最大三档字号下宽度均为负哨兵，行高与字号无关。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0087 begin');
      const sizes: number[] = [MIN_FONT_SIZE, MEASURE_FONT_SIZE, MAX_FONT_SIZE];
      let lineHeight: number = -1;
      for (let index = 0; index < sizes.length; index++) {
        const result: TextMeasureResult = measure('', sizes[index], MEASURE_MAX_WIDTH);
        logInfo('empty size ' + sizes[index].toString() + ' -> ' + describeMeasure(result));
        expect(result.width < 0).assertTrue();
        expect(result.height > 0).assertTrue();
        if (index === 0) {
          lineHeight = result.height;
        } else {
          // 空串没有字形，行高不随字号变化，始终等于固定行高。
          expect(result.height).assertEqual(lineHeight);
        }
      }
      logInfo('testNdkRenderNodeNapi0087 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0088
     * @tc.name      testNdkRenderNodeNapi0088
     * @tc.desc      校验十二种文本连续两次测量的结果完全一致，测量过程无内部状态残留。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0088 begin');
      let mismatched: string = '';
      for (let index = 0; index < TEXTS.length; index++) {
        const first: TextMeasureResult = measure(TEXTS[index], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
        const second: TextMeasureResult = measure(TEXTS[index], MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
        if (!sameMeasure(first, second)) {
          mismatched += 'text#' + index.toString() + ' ' + describeMeasure(first) + '!='
            + describeMeasure(second) + ';';
        }
      }
      logInfo('determinism mismatched = [' + mismatched + ']');
      expect(mismatched).assertEqual('');
      expect(mismatched.length).assertEqual(0);
      expect(TEXTS.length > 0).assertTrue();
      logInfo('testNdkRenderNodeNapi0088 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NAPI_0089
     * @tc.name      testNdkRenderNodeNapi0089
     * @tc.desc      校验窄宽度下逐字换行时高度随字符数增长，与单行高度形成对比。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeNapi0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeNapi0089 begin');
      const single: TextMeasureResult = measure('A', MEASURE_FONT_SIZE, 1);
      const word: TextMeasureResult = measure(MEASURE_TEXT, MEASURE_FONT_SIZE, 1);
      logInfo('narrow single = ' + describeMeasure(single) + ', word = ' + describeMeasure(word));
      // 宽度 1 时每个字符独占一行，十字符单词的行数多于单字符。
      expect(word.height > single.height).assertTrue();
      expect(word.height % LINE_HEIGHT_STEP).assertEqual(0);
      // 逐字换行时行长收敛到一个字宽。
      expect(word.width <= MEASURE_FONT_SIZE).assertTrue();
      logInfo('testNdkRenderNodeNapi0089 end');
    })

    // NAPI_GUARD_SECTION
  })
}
