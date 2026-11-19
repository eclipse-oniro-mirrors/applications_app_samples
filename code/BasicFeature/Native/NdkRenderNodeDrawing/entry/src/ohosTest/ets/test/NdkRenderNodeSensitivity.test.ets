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
import { image } from '@kit.ImageKit';
import { UIContext } from '@kit.ArkUI';
import {
  GROUP_BITMAP, GROUP_CANVAS, GROUP_COLOR, GROUP_COLOR_FILTER, GROUP_ERROR, GROUP_FONT, GROUP_GEOMETRY,
  GROUP_IMAGE_FILTER, GROUP_IMAGE_IO, GROUP_MASK_FILTER, GROUP_MATRIX, GROUP_PAINT, GROUP_PIXELMAP, GROUP_RECORD,
  GROUP_SHADER, GROUP_SHADOW, GROUP_OFFSCREEN, GROUP_TEXTBLOB, GROUP_TYPOGRAPHY, GroupSpec, ParamSpec
} from '../../../main/ets/core/SchemaTypes';
import { defaultsOf, firstRangeIndex, groupById } from './SceneDefaults';
import { HARNESS } from './PixelHarness';
import {
  changedPixels, digest, readyUiContext, renderScene, renderSceneWithPixelMap, waitReady
} from './PixelProbe';
import { createCheckerPixelMap, MAP_SIDE, releasePixelMap } from './TestPixelMap';

const TAG: string = '[Sample_NdkRenderNodeSensitivityTest]';
const DOMAIN: number = 0xF811;
// 滑杆参数的三档取值：下界、默认值、上界，用例体统一用常量传参，避免裸字符串。
const VALUE_MIN: string = 'min';
const VALUE_DEF: string = 'def';
const VALUE_MAX: string = 'max';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// 第一个滑杆参数的位置：场景下标与参数下标。
interface RangeTarget {
  scene: number;
  index: number;
}

// 同一场景两种参数取值下的画面对比结果。
interface StatePair {
  valueA: number;
  valueB: number;
  changed: number;
  sameDigest: boolean;
}

// 该能力域第一个滑杆参数的位置：从第一个场景起顺序扫描，跳过只有下拉与开关的场景。
function firstRangeTarget(group: GroupSpec): RangeTarget | undefined {
  for (let sceneIndex = 0; sceneIndex < group.scenes.length; sceneIndex++) {
    const index: number = firstRangeIndex(group, sceneIndex);
    if (index >= 0) {
      return { scene: sceneIndex, index: index };
    }
  }
  return undefined;
}

// 三态取值：下界、默认值、上界。
function pickValue(param: ParamSpec, which: string): number {
  if (which === VALUE_MIN) {
    return param.min;
  }
  if (which === VALUE_MAX) {
    return param.max;
  }
  return param.def;
}

// 只改一个参数取值的两幅画面比较：差异像素数与摘要是否相同。
async function compareStates(uiContext: UIContext, group: number, scene: number, index: number,
  valueA: number, valueB: number, pixelMap: image.PixelMap | undefined): Promise<StatePair> {
  const spec: GroupSpec | undefined = groupById(group);
  if (spec === undefined) {
    return { valueA: valueA, valueB: valueB, changed: -1, sameDigest: false };
  }
  const paramsA: number[] = defaultsOf(spec, scene);
  paramsA[index] = valueA;
  const paramsB: number[] = defaultsOf(spec, scene);
  paramsB[index] = valueB;
  let first: Uint8Array = new Uint8Array(0);
  let second: Uint8Array = new Uint8Array(0);
  if (pixelMap === undefined) {
    first = await renderScene(uiContext, group, scene, paramsA);
    second = await renderScene(uiContext, group, scene, paramsB);
  } else {
    first = await renderSceneWithPixelMap(uiContext, group, scene, paramsA, pixelMap);
    second = await renderSceneWithPixelMap(uiContext, group, scene, paramsB, pixelMap);
  }
  return {
    valueA: valueA,
    valueB: valueB,
    changed: changedPixels(first, second),
    sameDigest: digest(first) === digest(second)
  };
}

// 敏感性观测值：前置条件、第一个滑杆参数位置与两种取值下的画面对比结果。
// 本函数只采集事实，断言统一放在用例体内，保证每条用例的期望可见。
class SensitivityObs {
  public ready: boolean = false;
  public blocked: string = '';
  public scene: number = -1;
  public index: number = -1;
  public paramKey: string = '';
  public valueA: number = 0;
  public valueB: number = 0;
  public changed: number = 0;
  public sameDigest: boolean = false;
}

async function runSensitivityCase(group: number, whichA: string, whichB: string,
  label: string): Promise<SensitivityObs> {
  const observed: SensitivityObs = new SensitivityObs();
  observed.ready = await waitReady();
  if (!observed.ready) {
    observed.blocked = 'ui context not ready';
    return observed;
  }
  const uiContext: UIContext = readyUiContext();
  const spec: GroupSpec | undefined = groupById(group);
  if (spec === undefined) {
    observed.blocked = 'unknown group ' + group.toString();
    return observed;
  }
  const target: RangeTarget | undefined = firstRangeTarget(spec);
  if (target === undefined) {
    observed.blocked = 'no range param in group ' + group.toString();
    return observed;
  }
  observed.scene = target.scene;
  observed.index = target.index;
  const param: ParamSpec = spec.scenes[target.scene].params[target.index];
  observed.paramKey = param.key;
  const pixelMap: image.PixelMap | undefined =
    group === GROUP_PIXELMAP ? await createCheckerPixelMap(MAP_SIDE) : undefined;
  const result: StatePair = await compareStates(uiContext, group, target.scene, target.index,
    pickValue(param, whichA), pickValue(param, whichB), pixelMap);
  observed.valueA = result.valueA;
  observed.valueB = result.valueB;
  observed.changed = result.changed;
  observed.sameDigest = result.sameDigest;
  logInfo(label + ' param=' + observed.paramKey + ' A=' + observed.valueA.toString() + ' B=' +
    observed.valueB.toString() + ' changed=' + observed.changed.toString() + ' same=' + observed.sameDigest.toString());
  await releasePixelMap(pixelMap);
  HARNESS.clearScene();
  return observed;
}

export default function ndkRenderNodeSensitivityTest(): void {
  describe('NdkRenderNodeSensitivity', () => {
    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0001
         * @tc.name      testNdkRenderNodeSensitivity0001
         * @tc.desc      校验画布域第一个滑杆参数从下界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_CANVAS, VALUE_MIN, VALUE_DEF, '画布域#下界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0002
         * @tc.name      testNdkRenderNodeSensitivity0002
         * @tc.desc      校验画布域第一个滑杆参数从上界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_CANVAS, VALUE_MAX, VALUE_DEF, '画布域#上界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0003
         * @tc.name      testNdkRenderNodeSensitivity0003
         * @tc.desc      校验画布域第一个滑杆参数从下界切到上界后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSensitivity0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_CANVAS, VALUE_MIN, VALUE_MAX, '画布域#下界vs上界');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0004
         * @tc.name      testNdkRenderNodeSensitivity0004
         * @tc.desc      校验几何域第一个滑杆参数从下界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_GEOMETRY, VALUE_MIN, VALUE_DEF, '几何域#下界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0005
         * @tc.name      testNdkRenderNodeSensitivity0005
         * @tc.desc      校验几何域第一个滑杆参数从上界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_GEOMETRY, VALUE_MAX, VALUE_DEF, '几何域#上界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0006
         * @tc.name      testNdkRenderNodeSensitivity0006
         * @tc.desc      校验几何域第一个滑杆参数从下界切到上界后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSensitivity0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_GEOMETRY, VALUE_MIN, VALUE_MAX, '几何域#下界vs上界');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0007
         * @tc.name      testNdkRenderNodeSensitivity0007
         * @tc.desc      校验画笔域第一个滑杆参数从下界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_PAINT, VALUE_MIN, VALUE_DEF, '画笔域#下界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0008
         * @tc.name      testNdkRenderNodeSensitivity0008
         * @tc.desc      校验画笔域第一个滑杆参数从上界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_PAINT, VALUE_MAX, VALUE_DEF, '画笔域#上界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0009
         * @tc.name      testNdkRenderNodeSensitivity0009
         * @tc.desc      校验画笔域第一个滑杆参数从下界切到上界后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSensitivity0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_PAINT, VALUE_MIN, VALUE_MAX, '画笔域#下界vs上界');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0010
         * @tc.name      testNdkRenderNodeSensitivity0010
         * @tc.desc      校验颜色域第一个滑杆参数从下界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_COLOR, VALUE_MIN, VALUE_DEF, '颜色域#下界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0011
         * @tc.name      testNdkRenderNodeSensitivity0011
         * @tc.desc      校验颜色域第一个滑杆参数从上界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_COLOR, VALUE_MAX, VALUE_DEF, '颜色域#上界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0012
         * @tc.name      testNdkRenderNodeSensitivity0012
         * @tc.desc      校验颜色域第一个滑杆参数从下界切到上界后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSensitivity0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_COLOR, VALUE_MIN, VALUE_MAX, '颜色域#下界vs上界');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0013
         * @tc.name      testNdkRenderNodeSensitivity0013
         * @tc.desc      校验颜色滤波器域第一个滑杆参数从下界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_COLOR_FILTER, VALUE_MIN, VALUE_DEF, 
        '颜色滤波器域#下界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0014
         * @tc.name      testNdkRenderNodeSensitivity0014
         * @tc.desc      校验颜色滤波器域第一个滑杆参数从上界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_COLOR_FILTER, VALUE_MAX, VALUE_DEF, 
        '颜色滤波器域#上界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0015
         * @tc.name      testNdkRenderNodeSensitivity0015
         * @tc.desc      校验颜色滤波器域第一个滑杆参数从下界切到上界后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSensitivity0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_COLOR_FILTER, VALUE_MIN, VALUE_MAX, 
        '颜色滤波器域#下界vs上界');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0016
         * @tc.name      testNdkRenderNodeSensitivity0016
         * @tc.desc      校验着色器域第一个滑杆参数从下界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_SHADER, VALUE_MIN, VALUE_DEF, '着色器域#下界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0017
         * @tc.name      testNdkRenderNodeSensitivity0017
         * @tc.desc      校验着色器域第一个滑杆参数从上界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_SHADER, VALUE_MAX, VALUE_DEF, '着色器域#上界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0018
         * @tc.name      testNdkRenderNodeSensitivity0018
         * @tc.desc      校验着色器域第一个滑杆参数从下界切到上界后画面保持一致：角度 0° 与 360° 在环形扫掠上等价。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSensitivity0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_SHADER, VALUE_MIN, VALUE_MAX, '着色器域#下界vs上界');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      // 角度是环形取值，0° 与 360° 指向同一扫掠方向，两幅画面必须逐像素一致。
      expect(observed.changed).assertEqual(0);
      expect(observed.sameDigest).assertTrue();
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0019
         * @tc.name      testNdkRenderNodeSensitivity0019
         * @tc.desc      校验遮罩滤波器域第一个滑杆参数从下界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_MASK_FILTER, VALUE_MIN, VALUE_DEF, 
        '遮罩滤波器域#下界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0020
         * @tc.name      testNdkRenderNodeSensitivity0020
         * @tc.desc      校验遮罩滤波器域第一个滑杆参数从上界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_MASK_FILTER, VALUE_MAX, VALUE_DEF, 
        '遮罩滤波器域#上界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0021
         * @tc.name      testNdkRenderNodeSensitivity0021
         * @tc.desc      校验遮罩滤波器域第一个滑杆参数从下界切到上界后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSensitivity0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_MASK_FILTER, VALUE_MIN, VALUE_MAX, 
        '遮罩滤波器域#下界vs上界');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0022
         * @tc.name      testNdkRenderNodeSensitivity0022
         * @tc.desc      校验图像滤波器域第一个滑杆参数从下界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_IMAGE_FILTER, VALUE_MIN, VALUE_DEF, 
        '图像滤波器域#下界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0023
         * @tc.name      testNdkRenderNodeSensitivity0023
         * @tc.desc      校验图像滤波器域第一个滑杆参数从上界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_IMAGE_FILTER, VALUE_MAX, VALUE_DEF, 
        '图像滤波器域#上界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0024
         * @tc.name      testNdkRenderNodeSensitivity0024
         * @tc.desc      校验图像滤波器域第一个滑杆参数从下界切到上界后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSensitivity0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_IMAGE_FILTER, VALUE_MIN, VALUE_MAX, 
        '图像滤波器域#下界vs上界');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0025
         * @tc.name      testNdkRenderNodeSensitivity0025
         * @tc.desc      校验位图域第一个滑杆参数从下界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_BITMAP, VALUE_MIN, VALUE_DEF, '位图域#下界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0026
         * @tc.name      testNdkRenderNodeSensitivity0026
         * @tc.desc      校验位图域第一个滑杆参数从上界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_BITMAP, VALUE_MAX, VALUE_DEF, '位图域#上界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0027
         * @tc.name      testNdkRenderNodeSensitivity0027
         * @tc.desc      校验位图域第一个滑杆参数从下界切到上界后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSensitivity0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_BITMAP, VALUE_MIN, VALUE_MAX, '位图域#下界vs上界');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0028
         * @tc.name      testNdkRenderNodeSensitivity0028
         * @tc.desc      校验像素图域第一个滑杆参数从下界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_PIXELMAP, VALUE_MIN, VALUE_DEF, '像素图域#下界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0029
         * @tc.name      testNdkRenderNodeSensitivity0029
         * @tc.desc      校验像素图域第一个滑杆参数从上界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_PIXELMAP, VALUE_MAX, VALUE_DEF, '像素图域#上界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0030
         * @tc.name      testNdkRenderNodeSensitivity0030
         * @tc.desc      校验像素图域第一个滑杆参数从下界切到上界后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSensitivity0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_PIXELMAP, VALUE_MIN, VALUE_MAX, '像素图域#下界vs上界');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0031
         * @tc.name      testNdkRenderNodeSensitivity0031
         * @tc.desc      校验图片编解码域第一个滑杆参数从下界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_IMAGE_IO, VALUE_MIN, VALUE_DEF, '图片编解码域#下界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0032
         * @tc.name      testNdkRenderNodeSensitivity0032
         * @tc.desc      校验图片编解码域第一个滑杆参数从上界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_IMAGE_IO, VALUE_MAX, VALUE_DEF, '图片编解码域#上界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0033
         * @tc.name      testNdkRenderNodeSensitivity0033
         * @tc.desc      校验图片编解码域第一个滑杆参数从下界切到上界后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSensitivity0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_IMAGE_IO, VALUE_MIN, VALUE_MAX, '图片编解码域#下界vs上界');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0034
         * @tc.name      testNdkRenderNodeSensitivity0034
         * @tc.desc      校验字体域第一个滑杆参数从下界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_FONT, VALUE_MIN, VALUE_DEF, '字体域#下界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0035
         * @tc.name      testNdkRenderNodeSensitivity0035
         * @tc.desc      校验字体域第一个滑杆参数从上界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_FONT, VALUE_MAX, VALUE_DEF, '字体域#上界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0036
         * @tc.name      testNdkRenderNodeSensitivity0036
         * @tc.desc      校验字体域第一个滑杆参数从下界切到上界后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSensitivity0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_FONT, VALUE_MIN, VALUE_MAX, '字体域#下界vs上界');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0037
         * @tc.name      testNdkRenderNodeSensitivity0037
         * @tc.desc      校验文本块域第一个滑杆参数从下界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_TEXTBLOB, VALUE_MIN, VALUE_DEF, '文本块域#下界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0038
         * @tc.name      testNdkRenderNodeSensitivity0038
         * @tc.desc      校验文本块域第一个滑杆参数从上界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_TEXTBLOB, VALUE_MAX, VALUE_DEF, '文本块域#上界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0039
         * @tc.name      testNdkRenderNodeSensitivity0039
         * @tc.desc      校验文本块域第一个滑杆参数从下界切到上界后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSensitivity0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_TEXTBLOB, VALUE_MIN, VALUE_MAX, '文本块域#下界vs上界');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0040
         * @tc.name      testNdkRenderNodeSensitivity0040
         * @tc.desc      校验排版域第一个滑杆参数从下界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_TYPOGRAPHY, VALUE_MIN, VALUE_DEF, '排版域#下界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0041
         * @tc.name      testNdkRenderNodeSensitivity0041
         * @tc.desc      校验排版域第一个滑杆参数从上界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_TYPOGRAPHY, VALUE_MAX, VALUE_DEF, '排版域#上界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0042
         * @tc.name      testNdkRenderNodeSensitivity0042
         * @tc.desc      校验排版域第一个滑杆参数从下界切到上界后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSensitivity0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_TYPOGRAPHY, VALUE_MIN, VALUE_MAX, '排版域#下界vs上界');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0043
         * @tc.name      testNdkRenderNodeSensitivity0043
         * @tc.desc      校验阴影域第一个滑杆参数从下界切到默认值后画面发生变化：几何投影由 CanvasDrawShadow 绘制。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_SHADOW, VALUE_MIN, VALUE_DEF, '阴影域#下界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      // 模糊半径参与几何投影，两幅画面必须不同。
      expect(observed.changed).assertLarger(0);
      expect(observed.sameDigest).assertFalse();
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0044
         * @tc.name      testNdkRenderNodeSensitivity0044
         * @tc.desc      校验阴影域第一个滑杆参数从上界切到默认值后画面发生变化：几何投影由 CanvasDrawShadow 绘制。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_SHADOW, VALUE_MAX, VALUE_DEF, '阴影域#上界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      // 模糊半径参与几何投影，两幅画面必须不同。
      expect(observed.changed).assertLarger(0);
      expect(observed.sameDigest).assertFalse();
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0045
         * @tc.name      testNdkRenderNodeSensitivity0045
         * @tc.desc      校验阴影域第一个滑杆参数从下界切到上界后画面发生变化：几何投影由 CanvasDrawShadow 绘制。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSensitivity0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_SHADOW, VALUE_MIN, VALUE_MAX, '阴影域#下界vs上界');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      // 模糊半径参与几何投影，两幅画面必须不同。
      expect(observed.changed).assertLarger(0);
      expect(observed.sameDigest).assertFalse();
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0046
         * @tc.name      testNdkRenderNodeSensitivity0046
         * @tc.desc      校验矩阵域第一个滑杆参数从下界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_MATRIX, VALUE_MIN, VALUE_DEF, '矩阵域#下界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0047
         * @tc.name      testNdkRenderNodeSensitivity0047
         * @tc.desc      校验矩阵域第一个滑杆参数从上界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_MATRIX, VALUE_MAX, VALUE_DEF, '矩阵域#上界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0048
         * @tc.name      testNdkRenderNodeSensitivity0048
         * @tc.desc      校验矩阵域第一个滑杆参数从下界切到上界后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSensitivity0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_MATRIX, VALUE_MIN, VALUE_MAX, '矩阵域#下界vs上界');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0049
         * @tc.name      testNdkRenderNodeSensitivity0049
         * @tc.desc      校验录制指令域第一个滑杆参数从下界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_RECORD, VALUE_MIN, VALUE_DEF, '录制指令域#下界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0050
         * @tc.name      testNdkRenderNodeSensitivity0050
         * @tc.desc      校验录制指令域第一个滑杆参数从上界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_RECORD, VALUE_MAX, VALUE_DEF, '录制指令域#上界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0051
         * @tc.name      testNdkRenderNodeSensitivity0051
         * @tc.desc      校验录制指令域第一个滑杆参数从下界切到上界后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSensitivity0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_RECORD, VALUE_MIN, VALUE_MAX, '录制指令域#下界vs上界');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0052
         * @tc.name      testNdkRenderNodeSensitivity0052
         * @tc.desc      校验离屏绘制域第一个滑杆参数从下界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_OFFSCREEN, VALUE_MIN, VALUE_DEF, '离屏绘制域#下界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0053
         * @tc.name      testNdkRenderNodeSensitivity0053
         * @tc.desc      校验离屏绘制域第一个滑杆参数从上界切到默认值后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_OFFSCREEN, VALUE_MAX, VALUE_DEF, '离屏绘制域#上界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0054
         * @tc.name      testNdkRenderNodeSensitivity0054
         * @tc.desc      校验离屏绘制域第一个滑杆参数从下界切到上界后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSensitivity0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_OFFSCREEN, VALUE_MIN, VALUE_MAX, '离屏绘制域#下界vs上界');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      if (observed.valueA === observed.valueB) {
        expect(observed.sameDigest).assertTrue();
      } else {
        expect(observed.sameDigest).assertFalse();
        expect(observed.changed).assertLarger(0);
      }
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0055
         * @tc.name      testNdkRenderNodeSensitivity0055
         * @tc.desc      校验错误码域第一个滑杆参数从下界切到默认值后画面随之变化：该域 s03 的角度参与状态点旋转绘制。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_ERROR, VALUE_MIN, VALUE_DEF, '错误码域#下界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      // 角度参与状态点的旋转绘制：真机实测 s03 的下界与默认值相差 1164 像素，必须判定为画面变化。
      expect(observed.changed).assertLarger(0);
      expect(observed.sameDigest).assertFalse();
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0056
         * @tc.name      testNdkRenderNodeSensitivity0056
         * @tc.desc      校验错误码域第一个滑杆参数从上界切到默认值后画面随之变化：该域 s03 的角度参与状态点旋转绘制。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSensitivity0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_ERROR, VALUE_MAX, VALUE_DEF, '错误码域#上界vs默认值');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      // 角度参与状态点的旋转绘制：真机实测 s03 的上界与默认值相差 1164 像素，必须判定为画面变化。
      expect(observed.changed).assertLarger(0);
      expect(observed.sameDigest).assertFalse();
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SENSITIVITY_0057
         * @tc.name      testNdkRenderNodeSensitivity0057
         * @tc.desc      校验错误码域第一个滑杆参数从下界切到上界后画面保持一致：该域 s03 的 ±90° 关于画布中心对称。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSensitivity0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SensitivityObs = await runSensitivityCase(GROUP_ERROR, VALUE_MIN, VALUE_MAX, '错误码域#下界vs上界');
      expect(observed.ready).assertTrue();
      expect(observed.blocked).assertEqual('');
      // 取到滑杆参数后才能判定画面差异，位置与键名都必须有效。
      expect(observed.index).assertLarger(-1);
      expect(observed.paramKey.length).assertLarger(0);
      // 差异像素为 0 当且仅当两幅画面摘要一致。
      expect(observed.sameDigest).assertEqual(observed.changed === 0);
      // 状态点绕中心旋转：真机实测 s03 的 -90° 与 90° 相差 180°，渲染结果逐字节一致。
      expect(observed.changed).assertEqual(0);
      expect(observed.sameDigest).assertTrue();
    })

  })
}
