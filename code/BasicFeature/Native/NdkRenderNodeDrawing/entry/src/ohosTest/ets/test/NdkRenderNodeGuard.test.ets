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
import bridge from 'libentry.so';
import { ParamEngine } from '../../../main/ets/core/ParamEngine';
import { GroupSpec, SceneSpec } from '../../../main/ets/core/SchemaTypes';
import { CAPABILITY_GROUPS, TOPIC_GROUPS } from './SceneDefaults';

const TAG: string = '[Sample_NdkRenderNodeGuardTest]';
const DOMAIN: number = 0xF811;
const NORMAL_SIZE: number = 64;
// 参数数组上限为 8，这里给出 12 项以覆盖超长入参被截断的分支。
const OVERFLOW_PARAMS: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
// 非有限与极端数值，覆盖 ParamBag 的面积与下标裁剪分支。
const WILD_PARAMS: number[] = [Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY, -1e9, 1e9, -0, 1e-9];
const EMPTY_PARAMS: number[] = [];
// 六种退化尺寸：零宽、零高、双零、负宽、负高与双负。
const SIZE_ZERO: number = 0;
const SIZE_NEGATIVE: number = -NORMAL_SIZE;
const SIZE_MINUS_ONE: number = -1;
const GUARD_WIDTHS: number[] = [SIZE_ZERO, NORMAL_SIZE, SIZE_ZERO, SIZE_NEGATIVE, NORMAL_SIZE, SIZE_MINUS_ONE];
const GUARD_HEIGHTS: number[] = [NORMAL_SIZE, SIZE_ZERO, SIZE_ZERO, NORMAL_SIZE, SIZE_NEGATIVE, SIZE_MINUS_ONE];
const GUARD_COMBO_COUNT: number = 6;
// 每种专题场景要覆盖的四种入参形态：空、超长、非有限与默认。
const PARAM_FORM_COUNT: number = 4;
// 十九个能力域的索引命名常量，与 CAPABILITY_GROUPS 的声明顺序一一对应。
const DOMAIN_CANVAS: number = 0;
const DOMAIN_GEOMETRY: number = 1;
const DOMAIN_PAINT: number = 2;
const DOMAIN_COLOR: number = 3;
const DOMAIN_COLOR_FILTER: number = 4;
const DOMAIN_SHADER: number = 5;
const DOMAIN_MASK_FILTER: number = 6;
const DOMAIN_IMAGE_FILTER: number = 7;
const DOMAIN_BITMAP: number = 8;
const DOMAIN_PIXELMAP: number = 9;
const DOMAIN_IMAGE_IO: number = 10;
const DOMAIN_FONT: number = 11;
const DOMAIN_TEXTBLOB: number = 12;
const DOMAIN_TYPOGRAPHY: number = 13;
const DOMAIN_SHADOW: number = 14;
const DOMAIN_MATRIX: number = 15;
const DOMAIN_RECORD: number = 16;
const DOMAIN_OFFSCREEN: number = 17;
const DOMAIN_ERROR: number = 18;
// 十个专题的索引命名常量，与 TOPIC_GROUPS 的声明顺序一一对应。
const TOPIC_NODE_TREE: number = 0;
const TOPIC_RENDER_PROP: number = 1;
const TOPIC_BLUR: number = 2;
const TOPIC_LIFECYCLE: number = 3;
const TOPIC_HIT_TEST: number = 4;
const TOPIC_ANIMATION: number = 5;
const TOPIC_MULTI_DEVICE: number = 6;
const TOPIC_PERFORMANCE: number = 7;
const TOPIC_RECORD: number = 8;
const TOPIC_FRAME_TICK: number = 9;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// 占位类型：ArkTS 不允许给空对象字面量定型，这里用空类实例充当任意对象。
class PlainHolder {
}

// 假绘制上下文：普通对象没有 native 包装，napi_unwrap 失败后入口会直接返回。
function fakeContext(): DrawContext {
  const holder: PlainHolder = new PlainHolder();
  return holder as object as DrawContext;
}

// 指定画布尺寸调用能力域入口，返回是否没有抛异常。
function callWithSize(width: number, height: number, group: number, scene: number): boolean {
  try {
    bridge.nativeRenderScene(fakeContext(), width, height, group, scene, EMPTY_PARAMS);
    return true;
  } catch (error) {
    logInfo('nativeRenderScene threw, group=' + group.toString() + ' size='
      + width.toString() + 'x' + height.toString());
    return false;
  }
}

// 指定参数数组调用能力域入口，返回是否没有抛异常。
function callWithParams(group: number, scene: number, params: number[]): boolean {
  try {
    bridge.nativeRenderScene(fakeContext(), NORMAL_SIZE, NORMAL_SIZE, group, scene, params);
    return true;
  } catch (error) {
    logInfo('nativeRenderScene threw, group=' + group.toString() + ' paramLen=' + params.length.toString());
    return false;
  }
}

// 尺寸守卫的观测量：按尺寸组合分项统计被安全接受的调用次数。
class CapabilitySizeObs {
  public groupKey: string = '';
  public groupId: number = 0;
  public sceneCount: number = 0;
  public checked: number = 0;
  public expected: number = 0;
  public zeroWidthOk: boolean = false;
  public zeroHeightOk: boolean = false;
  public doubleZeroOk: boolean = false;
  public negativeOk: boolean = false;
}

// 尺寸守卫矩阵：零宽、零高、双零、负宽、负高与双负共六种退化尺寸。
function guardCapabilitySize(index: number): CapabilitySizeObs {
  const observed: CapabilitySizeObs = new CapabilitySizeObs();
  const group: GroupSpec = CAPABILITY_GROUPS[index];
  observed.groupKey = group.key;
  observed.groupId = group.id;
  observed.sceneCount = group.scenes.length;
  observed.expected = group.scenes.length * GUARD_COMBO_COUNT;
  const perCombo: number[] = [0, 0, 0, 0, 0, 0];
  for (const spec of group.scenes) {
    for (let sizeIndex = 0; sizeIndex < GUARD_COMBO_COUNT; sizeIndex++) {
      if (callWithSize(GUARD_WIDTHS[sizeIndex], GUARD_HEIGHTS[sizeIndex], group.id, spec.id)) {
        observed.checked += 1;
        perCombo[sizeIndex] += 1;
      }
    }
  }
  observed.zeroWidthOk = perCombo[0] === observed.sceneCount;
  observed.zeroHeightOk = perCombo[1] === observed.sceneCount;
  observed.doubleZeroOk = perCombo[2] === observed.sceneCount;
  observed.negativeOk = perCombo[3] === observed.sceneCount && perCombo[4] === observed.sceneCount
    && perCombo[5] === observed.sceneCount;
  logInfo('capability size guard ' + group.key + ' checked=' + observed.checked.toString()
    + '/' + observed.expected.toString());
  return observed;
}

// 参数守卫的观测量：按入参形态分项统计被安全接受的调用次数。
class TopicParamObs {
  public groupKey: string = '';
  public groupId: number = 0;
  public sceneCount: number = 0;
  public checked: number = 0;
  public expected: number = 0;
  public emptyAccepted: boolean = false;
  public overflowAccepted: boolean = false;
  public wildAccepted: boolean = false;
  public defaultsAccepted: boolean = false;
}

// 参数形态守卫：空数组、超长数组与非有限数值三种入参都必须被安全接受。
function guardTopicParams(index: number): TopicParamObs {
  const observed: TopicParamObs = new TopicParamObs();
  const group: GroupSpec = TOPIC_GROUPS[index];
  observed.groupKey = group.key;
  observed.groupId = group.id;
  observed.sceneCount = group.scenes.length;
  observed.expected = group.scenes.length * PARAM_FORM_COUNT;
  const perForm: number[] = [0, 0, 0, 0];
  for (const spec of group.scenes) {
    if (callWithParams(group.id, spec.id, EMPTY_PARAMS)) {
      observed.checked += 1;
      perForm[0] += 1;
    }
    if (callWithParams(group.id, spec.id, OVERFLOW_PARAMS)) {
      observed.checked += 1;
      perForm[1] += 1;
    }
    if (callWithParams(group.id, spec.id, WILD_PARAMS)) {
      observed.checked += 1;
      perForm[2] += 1;
    }
    // 默认参数同样必须可分派，作为三种异常形态的对照基线。
    if (callWithParams(group.id, spec.id, ParamEngine.defaults(spec))) {
      observed.checked += 1;
      perForm[3] += 1;
    }
  }
  observed.emptyAccepted = perForm[0] === observed.sceneCount;
  observed.overflowAccepted = perForm[1] === observed.sceneCount;
  observed.wildAccepted = perForm[2] === observed.sceneCount;
  observed.defaultsAccepted = perForm[3] === observed.sceneCount;
  logInfo('topic param guard ' + group.key + ' checked=' + observed.checked.toString()
    + '/' + observed.expected.toString());
  return observed;
}

export default function ndkRenderNodeGuardTest(): void {
  describe('NdkRenderNodeGuard', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0001
     * @tc.name      testNdkRenderNodeGuard0001
     * @tc.desc      校验画布域全部场景在零宽、零高与负尺寸六种退化画布下均被静默跳过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeGuard0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeGuard0001 begin');
      const observed: CapabilitySizeObs = guardCapabilitySize(DOMAIN_CANVAS);
      // 六种退化尺寸与全部场景的组合都必须被安全跳过，不能抛异常。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * GUARD_COMBO_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.zeroWidthOk).assertTrue();
      expect(observed.zeroHeightOk).assertTrue();
      expect(observed.doubleZeroOk).assertTrue();
      expect(observed.negativeOk).assertTrue();
      logInfo('testNdkRenderNodeGuard0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0002
     * @tc.name      testNdkRenderNodeGuard0002
     * @tc.desc      校验几何域全部场景在零宽、零高与负尺寸六种退化画布下均被静默跳过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeGuard0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeGuard0002 begin');
      const observed: CapabilitySizeObs = guardCapabilitySize(DOMAIN_GEOMETRY);
      // 六种退化尺寸与全部场景的组合都必须被安全跳过，不能抛异常。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * GUARD_COMBO_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.zeroWidthOk).assertTrue();
      expect(observed.zeroHeightOk).assertTrue();
      expect(observed.doubleZeroOk).assertTrue();
      expect(observed.negativeOk).assertTrue();
      logInfo('testNdkRenderNodeGuard0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0003
     * @tc.name      testNdkRenderNodeGuard0003
     * @tc.desc      校验画笔域全部场景在零宽、零高与负尺寸六种退化画布下均被静默跳过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeGuard0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeGuard0003 begin');
      const observed: CapabilitySizeObs = guardCapabilitySize(DOMAIN_PAINT);
      // 六种退化尺寸与全部场景的组合都必须被安全跳过，不能抛异常。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * GUARD_COMBO_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.zeroWidthOk).assertTrue();
      expect(observed.zeroHeightOk).assertTrue();
      expect(observed.doubleZeroOk).assertTrue();
      expect(observed.negativeOk).assertTrue();
      logInfo('testNdkRenderNodeGuard0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0004
     * @tc.name      testNdkRenderNodeGuard0004
     * @tc.desc      校验颜色模型域全部场景在零宽、零高与负尺寸六种退化画布下均被静默跳过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeGuard0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeGuard0004 begin');
      const observed: CapabilitySizeObs = guardCapabilitySize(DOMAIN_COLOR);
      // 六种退化尺寸与全部场景的组合都必须被安全跳过，不能抛异常。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * GUARD_COMBO_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.zeroWidthOk).assertTrue();
      expect(observed.zeroHeightOk).assertTrue();
      expect(observed.doubleZeroOk).assertTrue();
      expect(observed.negativeOk).assertTrue();
      logInfo('testNdkRenderNodeGuard0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0005
     * @tc.name      testNdkRenderNodeGuard0005
     * @tc.desc      校验颜色滤镜域全部场景在零宽、零高与负尺寸六种退化画布下均被静默跳过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeGuard0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeGuard0005 begin');
      const observed: CapabilitySizeObs = guardCapabilitySize(DOMAIN_COLOR_FILTER);
      // 六种退化尺寸与全部场景的组合都必须被安全跳过，不能抛异常。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * GUARD_COMBO_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.zeroWidthOk).assertTrue();
      expect(observed.zeroHeightOk).assertTrue();
      expect(observed.doubleZeroOk).assertTrue();
      expect(observed.negativeOk).assertTrue();
      logInfo('testNdkRenderNodeGuard0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0006
     * @tc.name      testNdkRenderNodeGuard0006
     * @tc.desc      校验着色器域全部场景在零宽、零高与负尺寸六种退化画布下均被静默跳过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeGuard0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeGuard0006 begin');
      const observed: CapabilitySizeObs = guardCapabilitySize(DOMAIN_SHADER);
      // 六种退化尺寸与全部场景的组合都必须被安全跳过，不能抛异常。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * GUARD_COMBO_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.zeroWidthOk).assertTrue();
      expect(observed.zeroHeightOk).assertTrue();
      expect(observed.doubleZeroOk).assertTrue();
      expect(observed.negativeOk).assertTrue();
      logInfo('testNdkRenderNodeGuard0006 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0007
     * @tc.name      testNdkRenderNodeGuard0007
     * @tc.desc      校验遮罩滤镜域全部场景在零宽、零高与负尺寸六种退化画布下均被静默跳过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeGuard0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeGuard0007 begin');
      const observed: CapabilitySizeObs = guardCapabilitySize(DOMAIN_MASK_FILTER);
      // 六种退化尺寸与全部场景的组合都必须被安全跳过，不能抛异常。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * GUARD_COMBO_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.zeroWidthOk).assertTrue();
      expect(observed.zeroHeightOk).assertTrue();
      expect(observed.doubleZeroOk).assertTrue();
      expect(observed.negativeOk).assertTrue();
      logInfo('testNdkRenderNodeGuard0007 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0008
     * @tc.name      testNdkRenderNodeGuard0008
     * @tc.desc      校验图像滤镜域全部场景在零宽、零高与负尺寸六种退化画布下均被静默跳过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeGuard0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeGuard0008 begin');
      const observed: CapabilitySizeObs = guardCapabilitySize(DOMAIN_IMAGE_FILTER);
      // 六种退化尺寸与全部场景的组合都必须被安全跳过，不能抛异常。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * GUARD_COMBO_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.zeroWidthOk).assertTrue();
      expect(observed.zeroHeightOk).assertTrue();
      expect(observed.doubleZeroOk).assertTrue();
      expect(observed.negativeOk).assertTrue();
      logInfo('testNdkRenderNodeGuard0008 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0009
     * @tc.name      testNdkRenderNodeGuard0009
     * @tc.desc      校验位图域全部场景在零宽、零高与负尺寸六种退化画布下均被静默跳过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeGuard0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeGuard0009 begin');
      const observed: CapabilitySizeObs = guardCapabilitySize(DOMAIN_BITMAP);
      // 六种退化尺寸与全部场景的组合都必须被安全跳过，不能抛异常。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * GUARD_COMBO_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.zeroWidthOk).assertTrue();
      expect(observed.zeroHeightOk).assertTrue();
      expect(observed.doubleZeroOk).assertTrue();
      expect(observed.negativeOk).assertTrue();
      logInfo('testNdkRenderNodeGuard0009 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0010
     * @tc.name      testNdkRenderNodeGuard0010
     * @tc.desc      校验像素图域全部场景在零宽、零高与负尺寸六种退化画布下均被静默跳过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeGuard0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeGuard0010 begin');
      const observed: CapabilitySizeObs = guardCapabilitySize(DOMAIN_PIXELMAP);
      // 六种退化尺寸与全部场景的组合都必须被安全跳过，不能抛异常。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * GUARD_COMBO_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.zeroWidthOk).assertTrue();
      expect(observed.zeroHeightOk).assertTrue();
      expect(observed.doubleZeroOk).assertTrue();
      expect(observed.negativeOk).assertTrue();
      logInfo('testNdkRenderNodeGuard0010 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0011
     * @tc.name      testNdkRenderNodeGuard0011
     * @tc.desc      校验图片编解码域全部场景在零宽、零高与负尺寸六种退化画布下均被静默跳过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeGuard0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeGuard0011 begin');
      const observed: CapabilitySizeObs = guardCapabilitySize(DOMAIN_IMAGE_IO);
      // 六种退化尺寸与全部场景的组合都必须被安全跳过，不能抛异常。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * GUARD_COMBO_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.zeroWidthOk).assertTrue();
      expect(observed.zeroHeightOk).assertTrue();
      expect(observed.doubleZeroOk).assertTrue();
      expect(observed.negativeOk).assertTrue();
      logInfo('testNdkRenderNodeGuard0011 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0012
     * @tc.name      testNdkRenderNodeGuard0012
     * @tc.desc      校验字体域全部场景在零宽、零高与负尺寸六种退化画布下均被静默跳过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeGuard0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeGuard0012 begin');
      const observed: CapabilitySizeObs = guardCapabilitySize(DOMAIN_FONT);
      // 六种退化尺寸与全部场景的组合都必须被安全跳过，不能抛异常。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * GUARD_COMBO_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.zeroWidthOk).assertTrue();
      expect(observed.zeroHeightOk).assertTrue();
      expect(observed.doubleZeroOk).assertTrue();
      expect(observed.negativeOk).assertTrue();
      logInfo('testNdkRenderNodeGuard0012 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0013
     * @tc.name      testNdkRenderNodeGuard0013
     * @tc.desc      校验文本块域全部场景在零宽、零高与负尺寸六种退化画布下均被静默跳过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeGuard0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeGuard0013 begin');
      const observed: CapabilitySizeObs = guardCapabilitySize(DOMAIN_TEXTBLOB);
      // 六种退化尺寸与全部场景的组合都必须被安全跳过，不能抛异常。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * GUARD_COMBO_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.zeroWidthOk).assertTrue();
      expect(observed.zeroHeightOk).assertTrue();
      expect(observed.doubleZeroOk).assertTrue();
      expect(observed.negativeOk).assertTrue();
      logInfo('testNdkRenderNodeGuard0013 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0014
     * @tc.name      testNdkRenderNodeGuard0014
     * @tc.desc      校验排版域全部场景在零宽、零高与负尺寸六种退化画布下均被静默跳过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeGuard0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeGuard0014 begin');
      const observed: CapabilitySizeObs = guardCapabilitySize(DOMAIN_TYPOGRAPHY);
      // 六种退化尺寸与全部场景的组合都必须被安全跳过，不能抛异常。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * GUARD_COMBO_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.zeroWidthOk).assertTrue();
      expect(observed.zeroHeightOk).assertTrue();
      expect(observed.doubleZeroOk).assertTrue();
      expect(observed.negativeOk).assertTrue();
      logInfo('testNdkRenderNodeGuard0014 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0015
     * @tc.name      testNdkRenderNodeGuard0015
     * @tc.desc      校验阴影层域全部场景在零宽、零高与负尺寸六种退化画布下均被静默跳过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeGuard0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeGuard0015 begin');
      const observed: CapabilitySizeObs = guardCapabilitySize(DOMAIN_SHADOW);
      // 六种退化尺寸与全部场景的组合都必须被安全跳过，不能抛异常。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * GUARD_COMBO_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.zeroWidthOk).assertTrue();
      expect(observed.zeroHeightOk).assertTrue();
      expect(observed.doubleZeroOk).assertTrue();
      expect(observed.negativeOk).assertTrue();
      logInfo('testNdkRenderNodeGuard0015 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0016
     * @tc.name      testNdkRenderNodeGuard0016
     * @tc.desc      校验矩阵域全部场景在零宽、零高与负尺寸六种退化画布下均被静默跳过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeGuard0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeGuard0016 begin');
      const observed: CapabilitySizeObs = guardCapabilitySize(DOMAIN_MATRIX);
      // 六种退化尺寸与全部场景的组合都必须被安全跳过，不能抛异常。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * GUARD_COMBO_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.zeroWidthOk).assertTrue();
      expect(observed.zeroHeightOk).assertTrue();
      expect(observed.doubleZeroOk).assertTrue();
      expect(observed.negativeOk).assertTrue();
      logInfo('testNdkRenderNodeGuard0016 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0017
     * @tc.name      testNdkRenderNodeGuard0017
     * @tc.desc      校验录制命令域全部场景在零宽、零高与负尺寸六种退化画布下均被静默跳过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeGuard0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeGuard0017 begin');
      const observed: CapabilitySizeObs = guardCapabilitySize(DOMAIN_RECORD);
      // 六种退化尺寸与全部场景的组合都必须被安全跳过，不能抛异常。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * GUARD_COMBO_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.zeroWidthOk).assertTrue();
      expect(observed.zeroHeightOk).assertTrue();
      expect(observed.doubleZeroOk).assertTrue();
      expect(observed.negativeOk).assertTrue();
      logInfo('testNdkRenderNodeGuard0017 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0018
     * @tc.name      testNdkRenderNodeGuard0018
     * @tc.desc      校验离屏表面域全部场景在零宽、零高与负尺寸六种退化画布下均被静默跳过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeGuard0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeGuard0018 begin');
      const observed: CapabilitySizeObs = guardCapabilitySize(DOMAIN_OFFSCREEN);
      // 六种退化尺寸与全部场景的组合都必须被安全跳过，不能抛异常。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * GUARD_COMBO_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.zeroWidthOk).assertTrue();
      expect(observed.zeroHeightOk).assertTrue();
      expect(observed.doubleZeroOk).assertTrue();
      expect(observed.negativeOk).assertTrue();
      logInfo('testNdkRenderNodeGuard0018 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0019
     * @tc.name      testNdkRenderNodeGuard0019
     * @tc.desc      校验错误码域全部场景在零宽、零高与负尺寸六种退化画布下均被静默跳过。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeGuard0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeGuard0019 begin');
      const observed: CapabilitySizeObs = guardCapabilitySize(DOMAIN_ERROR);
      // 六种退化尺寸与全部场景的组合都必须被安全跳过，不能抛异常。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * GUARD_COMBO_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.zeroWidthOk).assertTrue();
      expect(observed.zeroHeightOk).assertTrue();
      expect(observed.doubleZeroOk).assertTrue();
      expect(observed.negativeOk).assertTrue();
      logInfo('testNdkRenderNodeGuard0019 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0020
     * @tc.name      testNdkRenderNodeGuard0020
     * @tc.desc      校验节点树专题在空参数、超长参数、非有限参数与默认参数四种入参下均可分派。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeGuard0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeGuard0020 begin');
      const observed: TopicParamObs = guardTopicParams(TOPIC_NODE_TREE);
      // 四种入参形态在每个场景都要被接受，形态之间互为对照。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * PARAM_FORM_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.emptyAccepted).assertTrue();
      expect(observed.overflowAccepted).assertTrue();
      expect(observed.wildAccepted).assertTrue();
      expect(observed.defaultsAccepted).assertTrue();
      logInfo('testNdkRenderNodeGuard0020 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0021
     * @tc.name      testNdkRenderNodeGuard0021
     * @tc.desc      校验渲染属性专题在空参数、超长参数、非有限参数与默认参数四种入参下均可分派。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeGuard0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeGuard0021 begin');
      const observed: TopicParamObs = guardTopicParams(TOPIC_RENDER_PROP);
      // 四种入参形态在每个场景都要被接受，形态之间互为对照。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * PARAM_FORM_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.emptyAccepted).assertTrue();
      expect(observed.overflowAccepted).assertTrue();
      expect(observed.wildAccepted).assertTrue();
      expect(observed.defaultsAccepted).assertTrue();
      logInfo('testNdkRenderNodeGuard0021 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0022
     * @tc.name      testNdkRenderNodeGuard0022
     * @tc.desc      校验模糊层专题在空参数、超长参数、非有限参数与默认参数四种入参下均可分派。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeGuard0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeGuard0022 begin');
      const observed: TopicParamObs = guardTopicParams(TOPIC_BLUR);
      // 四种入参形态在每个场景都要被接受，形态之间互为对照。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * PARAM_FORM_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.emptyAccepted).assertTrue();
      expect(observed.overflowAccepted).assertTrue();
      expect(observed.wildAccepted).assertTrue();
      expect(observed.defaultsAccepted).assertTrue();
      logInfo('testNdkRenderNodeGuard0022 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0023
     * @tc.name      testNdkRenderNodeGuard0023
     * @tc.desc      校验生命周期专题在空参数、超长参数、非有限参数与默认参数四种入参下均可分派。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeGuard0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeGuard0023 begin');
      const observed: TopicParamObs = guardTopicParams(TOPIC_LIFECYCLE);
      // 四种入参形态在每个场景都要被接受，形态之间互为对照。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * PARAM_FORM_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.emptyAccepted).assertTrue();
      expect(observed.overflowAccepted).assertTrue();
      expect(observed.wildAccepted).assertTrue();
      expect(observed.defaultsAccepted).assertTrue();
      logInfo('testNdkRenderNodeGuard0023 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0024
     * @tc.name      testNdkRenderNodeGuard0024
     * @tc.desc      校验命中测试专题在空参数、超长参数、非有限参数与默认参数四种入参下均可分派。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeGuard0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeGuard0024 begin');
      const observed: TopicParamObs = guardTopicParams(TOPIC_HIT_TEST);
      // 四种入参形态在每个场景都要被接受，形态之间互为对照。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * PARAM_FORM_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.emptyAccepted).assertTrue();
      expect(observed.overflowAccepted).assertTrue();
      expect(observed.wildAccepted).assertTrue();
      expect(observed.defaultsAccepted).assertTrue();
      logInfo('testNdkRenderNodeGuard0024 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0025
     * @tc.name      testNdkRenderNodeGuard0025
     * @tc.desc      校验动画专题在空参数、超长参数、非有限参数与默认参数四种入参下均可分派。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeGuard0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeGuard0025 begin');
      const observed: TopicParamObs = guardTopicParams(TOPIC_ANIMATION);
      // 四种入参形态在每个场景都要被接受，形态之间互为对照。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * PARAM_FORM_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.emptyAccepted).assertTrue();
      expect(observed.overflowAccepted).assertTrue();
      expect(observed.wildAccepted).assertTrue();
      expect(observed.defaultsAccepted).assertTrue();
      logInfo('testNdkRenderNodeGuard0025 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0026
     * @tc.name      testNdkRenderNodeGuard0026
     * @tc.desc      校验多设备专题在空参数、超长参数、非有限参数与默认参数四种入参下均可分派。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeGuard0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeGuard0026 begin');
      const observed: TopicParamObs = guardTopicParams(TOPIC_MULTI_DEVICE);
      // 四种入参形态在每个场景都要被接受，形态之间互为对照。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * PARAM_FORM_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.emptyAccepted).assertTrue();
      expect(observed.overflowAccepted).assertTrue();
      expect(observed.wildAccepted).assertTrue();
      expect(observed.defaultsAccepted).assertTrue();
      logInfo('testNdkRenderNodeGuard0026 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0027
     * @tc.name      testNdkRenderNodeGuard0027
     * @tc.desc      校验性能专题在空参数、超长参数、非有限参数与默认参数四种入参下均可分派。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeGuard0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeGuard0027 begin');
      const observed: TopicParamObs = guardTopicParams(TOPIC_PERFORMANCE);
      // 四种入参形态在每个场景都要被接受，形态之间互为对照。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * PARAM_FORM_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.emptyAccepted).assertTrue();
      expect(observed.overflowAccepted).assertTrue();
      expect(observed.wildAccepted).assertTrue();
      expect(observed.defaultsAccepted).assertTrue();
      logInfo('testNdkRenderNodeGuard0027 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0028
     * @tc.name      testNdkRenderNodeGuard0028
     * @tc.desc      校验录制回放专题在空参数、超长参数、非有限参数与默认参数四种入参下均可分派。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeGuard0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeGuard0028 begin');
      const observed: TopicParamObs = guardTopicParams(TOPIC_RECORD);
      // 四种入参形态在每个场景都要被接受，形态之间互为对照。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * PARAM_FORM_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.emptyAccepted).assertTrue();
      expect(observed.overflowAccepted).assertTrue();
      expect(observed.wildAccepted).assertTrue();
      expect(observed.defaultsAccepted).assertTrue();
      logInfo('testNdkRenderNodeGuard0028 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_GUARD_0029
     * @tc.name      testNdkRenderNodeGuard0029
     * @tc.desc      校验帧回调专题在空参数、超长参数、非有限参数与默认参数四种入参下均可分派。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeGuard0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeGuard0029 begin');
      const observed: TopicParamObs = guardTopicParams(TOPIC_FRAME_TICK);
      // 四种入参形态在每个场景都要被接受，形态之间互为对照。
      expect(observed.groupId).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.expected).assertEqual(observed.sceneCount * PARAM_FORM_COUNT);
      expect(observed.checked).assertEqual(observed.expected);
      expect(observed.emptyAccepted).assertTrue();
      expect(observed.overflowAccepted).assertTrue();
      expect(observed.wildAccepted).assertTrue();
      expect(observed.defaultsAccepted).assertTrue();
      logInfo('testNdkRenderNodeGuard0029 end');
    })
  })
}
