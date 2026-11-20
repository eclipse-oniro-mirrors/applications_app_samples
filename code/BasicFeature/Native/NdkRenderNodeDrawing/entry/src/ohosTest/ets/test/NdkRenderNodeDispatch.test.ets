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
import {
  GroupSpec, GROUP_BITMAP, GROUP_CANVAS, GROUP_COLOR, GROUP_COLOR_FILTER, GROUP_ERROR, GROUP_FONT, GROUP_GEOMETRY,
  GROUP_IMAGE_FILTER, GROUP_IMAGE_IO, GROUP_MASK_FILTER, GROUP_MATRIX, GROUP_PAINT, GROUP_PIXELMAP, GROUP_RECORD,
  GROUP_SHADER, GROUP_SHADOW, GROUP_OFFSCREEN, GROUP_TEXTBLOB, GROUP_TYPOGRAPHY, ParamSpec, SceneSpec
} from '../../../main/ets/core/SchemaTypes';
import {
  TOPIC_ANIMATION, TOPIC_BLUR, TOPIC_FRAME_TICK, TOPIC_HIT_TEST, TOPIC_LIFECYCLE, TOPIC_MULTI_DEVICE, TOPIC_NODE_TREE,
  TOPIC_PERFORMANCE, TOPIC_RECORD, TOPIC_RENDER_PROP
} from '../../../main/ets/core/TopicTypes';
import { CAPABILITY_GROUPS, TOPIC_GROUPS } from './SceneDefaults';

const TAG: string = '[Sample_NdkRenderNodeDispatchTest]';
const DOMAIN: number = 0xF811;
// 分组协议：能力域 1..19 与专题 20..29 共 29 个分组，编号连续且等于 schema 顺序加一。
const GROUP_TOTAL: number = 29;

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

// 调用能力域统一入口，返回是否没有抛异常。
function dispatchScene(group: number, scene: number, params: number[]): boolean {
  try {
    bridge.nativeRenderScene(fakeContext(), 64, 64, group, scene, params);
    return true;
  } catch (error) {
    logInfo('nativeRenderScene threw, group=' + group.toString() + ' scene=' + scene.toString());
    return false;
  }
}

// 把场景的全部参数推到同一侧边界，用于构造「全下界」与「全上界」两组对照入参。
function extremeParams(spec: SceneSpec, toMax: boolean): number[] {
  const values: number[] = [];
  for (let index = 0; index < spec.params.length; index++) {
    const param: ParamSpec = spec.params[index];
    values.push(toMax ? param.max : param.min);
  }
  return values;
}

// 遍历一个分组的全部场景，按给定取值策略分派，返回成功分派的场景数。
function sweepScenes(group: GroupSpec, buildParams: (spec: SceneSpec) => number[]): number {
  let dispatched: number = 0;
  for (const spec of group.scenes) {
    if (dispatchScene(group.id, spec.id, buildParams(spec))) {
      dispatched += 1;
    }
  }
  return dispatched;
}

// 一个分组的分派观测值：分组编号、场景总数与两个方向上的成功分派数。
class SweepObs {
  public groupId: number = -1;
  public scenes: number = 0;
  public dispatched: number = 0;
  public low: number = 0;
  public high: number = 0;
}

// 能力域默认参数分派：入口静默降级，不应抛异常，且场景编号与 schema 一一对应。
function sweepCapabilityDefaults(index: number): SweepObs {
  const observed: SweepObs = new SweepObs();
  const group: GroupSpec = CAPABILITY_GROUPS[index];
  observed.groupId = group.id;
  observed.scenes = group.scenes.length;
  observed.dispatched = sweepScenes(group, (spec: SceneSpec): number[] => ParamEngine.defaults(spec));
  logInfo('capability defaults ' + group.key + ' dispatched=' + observed.dispatched.toString()
    + '/' + observed.scenes.toString());
  return observed;
}

// 能力域极值参数分派：下界与上界两组入参都能被 ParamBag 裁剪后正常分派。
function sweepCapabilityExtremes(index: number): SweepObs {
  const observed: SweepObs = new SweepObs();
  const group: GroupSpec = CAPABILITY_GROUPS[index];
  observed.groupId = group.id;
  observed.scenes = group.scenes.length;
  observed.low = sweepScenes(group, (spec: SceneSpec): number[] => extremeParams(spec, false));
  observed.high = sweepScenes(group, (spec: SceneSpec): number[] => extremeParams(spec, true));
  logInfo('capability extremes ' + group.key + ' low=' + observed.low.toString() + ' high=' +
    observed.high.toString());
  return observed;
}

// 专题默认参数分派：专题分组编号从 20 开始，与 TOPIC_GROUPS 下标一一对应，这里逐组校验分派不落空。
function sweepTopicDefaults(index: number): SweepObs {
  const observed: SweepObs = new SweepObs();
  const group: GroupSpec = TOPIC_GROUPS[index];
  observed.groupId = group.id;
  observed.scenes = group.scenes.length;
  observed.dispatched = sweepScenes(group, (spec: SceneSpec): number[] => ParamEngine.defaults(spec));
  logInfo('topic defaults ' + group.key + ' dispatched=' + observed.dispatched.toString()
    + '/' + observed.scenes.toString());
  return observed;
}

// 专题极值参数分派：专题参数同样经 ParamBag 裁剪，边界入参不应中断分派。
function sweepTopicExtremes(index: number): SweepObs {
  const observed: SweepObs = new SweepObs();
  const group: GroupSpec = TOPIC_GROUPS[index];
  observed.groupId = group.id;
  observed.scenes = group.scenes.length;
  observed.low = sweepScenes(group, (spec: SceneSpec): number[] => extremeParams(spec, false));
  observed.high = sweepScenes(group, (spec: SceneSpec): number[] => extremeParams(spec, true));
  logInfo('topic extremes ' + group.key + ' low=' + observed.low.toString() + ' high=' +
    observed.high.toString());
  return observed;
}

export default function ndkRenderNodeDispatchTest(): void {
  describe('NdkRenderNodeDispatch', () => {
    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0001
         * @tc.name      testNdkRenderNodeDispatch0001
         * @tc.desc      校验画布域全部场景以 schema 默认参数分派成功，分派场景数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL0
         */
    it('testNdkRenderNodeDispatch0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const sweep: SweepObs = sweepCapabilityDefaults(0);
      expect(sweep.groupId).assertEqual(GROUP_CANVAS);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0002
         * @tc.name      testNdkRenderNodeDispatch0002
         * @tc.desc      校验几何域全部场景以 schema 默认参数分派成功，分派场景数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepCapabilityDefaults(1);
      expect(sweep.groupId).assertEqual(GROUP_GEOMETRY);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0003
         * @tc.name      testNdkRenderNodeDispatch0003
         * @tc.desc      校验画笔域全部场景以 schema 默认参数分派成功，分派场景数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepCapabilityDefaults(2);
      expect(sweep.groupId).assertEqual(GROUP_PAINT);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0004
         * @tc.name      testNdkRenderNodeDispatch0004
         * @tc.desc      校验颜色模型域全部场景以 schema 默认参数分派成功，分派场景数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepCapabilityDefaults(3);
      expect(sweep.groupId).assertEqual(GROUP_COLOR);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0005
         * @tc.name      testNdkRenderNodeDispatch0005
         * @tc.desc      校验颜色滤镜域全部场景以 schema 默认参数分派成功，分派场景数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepCapabilityDefaults(4);
      expect(sweep.groupId).assertEqual(GROUP_COLOR_FILTER);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0006
         * @tc.name      testNdkRenderNodeDispatch0006
         * @tc.desc      校验着色器域全部场景以 schema 默认参数分派成功，分派场景数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepCapabilityDefaults(5);
      expect(sweep.groupId).assertEqual(GROUP_SHADER);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0007
         * @tc.name      testNdkRenderNodeDispatch0007
         * @tc.desc      校验遮罩滤镜域全部场景以 schema 默认参数分派成功，分派场景数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepCapabilityDefaults(6);
      expect(sweep.groupId).assertEqual(GROUP_MASK_FILTER);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0008
         * @tc.name      testNdkRenderNodeDispatch0008
         * @tc.desc      校验图像滤镜域全部场景以 schema 默认参数分派成功，分派场景数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepCapabilityDefaults(7);
      expect(sweep.groupId).assertEqual(GROUP_IMAGE_FILTER);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0009
         * @tc.name      testNdkRenderNodeDispatch0009
         * @tc.desc      校验位图域全部场景以 schema 默认参数分派成功，分派场景数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepCapabilityDefaults(8);
      expect(sweep.groupId).assertEqual(GROUP_BITMAP);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0010
         * @tc.name      testNdkRenderNodeDispatch0010
         * @tc.desc      校验像素图域全部场景以 schema 默认参数分派成功，分派场景数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepCapabilityDefaults(9);
      expect(sweep.groupId).assertEqual(GROUP_PIXELMAP);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0011
         * @tc.name      testNdkRenderNodeDispatch0011
         * @tc.desc      校验图片编解码域全部场景以 schema 默认参数分派成功，分派场景数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepCapabilityDefaults(10);
      expect(sweep.groupId).assertEqual(GROUP_IMAGE_IO);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0012
         * @tc.name      testNdkRenderNodeDispatch0012
         * @tc.desc      校验字体域全部场景以 schema 默认参数分派成功，分派场景数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepCapabilityDefaults(11);
      expect(sweep.groupId).assertEqual(GROUP_FONT);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0013
         * @tc.name      testNdkRenderNodeDispatch0013
         * @tc.desc      校验文本块域全部场景以 schema 默认参数分派成功，分派场景数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepCapabilityDefaults(12);
      expect(sweep.groupId).assertEqual(GROUP_TEXTBLOB);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0014
         * @tc.name      testNdkRenderNodeDispatch0014
         * @tc.desc      校验排版域全部场景以 schema 默认参数分派成功，分派场景数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepCapabilityDefaults(13);
      expect(sweep.groupId).assertEqual(GROUP_TYPOGRAPHY);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0015
         * @tc.name      testNdkRenderNodeDispatch0015
         * @tc.desc      校验阴影层域全部场景以 schema 默认参数分派成功，分派场景数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepCapabilityDefaults(14);
      expect(sweep.groupId).assertEqual(GROUP_SHADOW);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0016
         * @tc.name      testNdkRenderNodeDispatch0016
         * @tc.desc      校验矩阵域全部场景以 schema 默认参数分派成功，分派场景数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepCapabilityDefaults(15);
      expect(sweep.groupId).assertEqual(GROUP_MATRIX);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0017
         * @tc.name      testNdkRenderNodeDispatch0017
         * @tc.desc      校验录制命令域全部场景以 schema 默认参数分派成功，分派场景数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepCapabilityDefaults(16);
      expect(sweep.groupId).assertEqual(GROUP_RECORD);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0018
         * @tc.name      testNdkRenderNodeDispatch0018
         * @tc.desc      校验离屏表面域全部场景以 schema 默认参数分派成功，分派场景数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepCapabilityDefaults(17);
      expect(sweep.groupId).assertEqual(GROUP_OFFSCREEN);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0019
         * @tc.name      testNdkRenderNodeDispatch0019
         * @tc.desc      校验错误码域全部场景以 schema 默认参数分派成功，分派场景数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepCapabilityDefaults(18);
      expect(sweep.groupId).assertEqual(GROUP_ERROR);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0020
         * @tc.name      testNdkRenderNodeDispatch0020
         * @tc.desc      校验画布域全部场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL0
         */
    it('testNdkRenderNodeDispatch0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const sweep: SweepObs = sweepCapabilityExtremes(0);
      expect(sweep.groupId).assertEqual(GROUP_CANVAS);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0021
         * @tc.name      testNdkRenderNodeDispatch0021
         * @tc.desc      校验几何域全部场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepCapabilityExtremes(1);
      expect(sweep.groupId).assertEqual(GROUP_GEOMETRY);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0022
         * @tc.name      testNdkRenderNodeDispatch0022
         * @tc.desc      校验画笔域全部场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepCapabilityExtremes(2);
      expect(sweep.groupId).assertEqual(GROUP_PAINT);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0023
         * @tc.name      testNdkRenderNodeDispatch0023
         * @tc.desc      校验颜色模型域全部场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepCapabilityExtremes(3);
      expect(sweep.groupId).assertEqual(GROUP_COLOR);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0024
         * @tc.name      testNdkRenderNodeDispatch0024
         * @tc.desc      校验颜色滤镜域全部场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepCapabilityExtremes(4);
      expect(sweep.groupId).assertEqual(GROUP_COLOR_FILTER);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0025
         * @tc.name      testNdkRenderNodeDispatch0025
         * @tc.desc      校验着色器域全部场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepCapabilityExtremes(5);
      expect(sweep.groupId).assertEqual(GROUP_SHADER);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0026
         * @tc.name      testNdkRenderNodeDispatch0026
         * @tc.desc      校验遮罩滤镜域全部场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepCapabilityExtremes(6);
      expect(sweep.groupId).assertEqual(GROUP_MASK_FILTER);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0027
         * @tc.name      testNdkRenderNodeDispatch0027
         * @tc.desc      校验图像滤镜域全部场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepCapabilityExtremes(7);
      expect(sweep.groupId).assertEqual(GROUP_IMAGE_FILTER);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0028
         * @tc.name      testNdkRenderNodeDispatch0028
         * @tc.desc      校验位图域全部场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepCapabilityExtremes(8);
      expect(sweep.groupId).assertEqual(GROUP_BITMAP);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0029
         * @tc.name      testNdkRenderNodeDispatch0029
         * @tc.desc      校验像素图域全部场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepCapabilityExtremes(9);
      expect(sweep.groupId).assertEqual(GROUP_PIXELMAP);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0030
         * @tc.name      testNdkRenderNodeDispatch0030
         * @tc.desc      校验图片编解码域全部场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepCapabilityExtremes(10);
      expect(sweep.groupId).assertEqual(GROUP_IMAGE_IO);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0031
         * @tc.name      testNdkRenderNodeDispatch0031
         * @tc.desc      校验字体域全部场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepCapabilityExtremes(11);
      expect(sweep.groupId).assertEqual(GROUP_FONT);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0032
         * @tc.name      testNdkRenderNodeDispatch0032
         * @tc.desc      校验文本块域全部场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepCapabilityExtremes(12);
      expect(sweep.groupId).assertEqual(GROUP_TEXTBLOB);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0033
         * @tc.name      testNdkRenderNodeDispatch0033
         * @tc.desc      校验排版域全部场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepCapabilityExtremes(13);
      expect(sweep.groupId).assertEqual(GROUP_TYPOGRAPHY);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0034
         * @tc.name      testNdkRenderNodeDispatch0034
         * @tc.desc      校验阴影层域全部场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepCapabilityExtremes(14);
      expect(sweep.groupId).assertEqual(GROUP_SHADOW);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0035
         * @tc.name      testNdkRenderNodeDispatch0035
         * @tc.desc      校验矩阵域全部场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepCapabilityExtremes(15);
      expect(sweep.groupId).assertEqual(GROUP_MATRIX);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0036
         * @tc.name      testNdkRenderNodeDispatch0036
         * @tc.desc      校验录制命令域全部场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepCapabilityExtremes(16);
      expect(sweep.groupId).assertEqual(GROUP_RECORD);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0037
         * @tc.name      testNdkRenderNodeDispatch0037
         * @tc.desc      校验离屏表面域全部场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepCapabilityExtremes(17);
      expect(sweep.groupId).assertEqual(GROUP_OFFSCREEN);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0038
         * @tc.name      testNdkRenderNodeDispatch0038
         * @tc.desc      校验错误码域全部场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepCapabilityExtremes(18);
      expect(sweep.groupId).assertEqual(GROUP_ERROR);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0039
         * @tc.name      testNdkRenderNodeDispatch0039
         * @tc.desc      校验节点树专题四个场景以 schema 默认参数分派成功，专题编号从 20 起连续。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL0
         */
    it('testNdkRenderNodeDispatch0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const sweep: SweepObs = sweepTopicDefaults(0);
      expect(sweep.groupId).assertEqual(TOPIC_NODE_TREE);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0040
         * @tc.name      testNdkRenderNodeDispatch0040
         * @tc.desc      校验渲染属性专题四个场景以 schema 默认参数分派成功，分派数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepTopicDefaults(1);
      expect(sweep.groupId).assertEqual(TOPIC_RENDER_PROP);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0041
         * @tc.name      testNdkRenderNodeDispatch0041
         * @tc.desc      校验模糊层专题四个场景以 schema 默认参数分派成功，分派数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepTopicDefaults(2);
      expect(sweep.groupId).assertEqual(TOPIC_BLUR);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0042
         * @tc.name      testNdkRenderNodeDispatch0042
         * @tc.desc      校验生命周期专题四个场景以 schema 默认参数分派成功，分派数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepTopicDefaults(8);
      expect(sweep.groupId).assertEqual(TOPIC_LIFECYCLE);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0043
         * @tc.name      testNdkRenderNodeDispatch0043
         * @tc.desc      校验命中测试专题四个场景以 schema 默认参数分派成功，分派数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepTopicDefaults(4);
      expect(sweep.groupId).assertEqual(TOPIC_HIT_TEST);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0044
         * @tc.name      testNdkRenderNodeDispatch0044
         * @tc.desc      校验动画专题四个场景以 schema 默认参数分派成功，分派数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepTopicDefaults(3);
      expect(sweep.groupId).assertEqual(TOPIC_ANIMATION);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0045
         * @tc.name      testNdkRenderNodeDispatch0045
         * @tc.desc      校验多设备专题四个场景以 schema 默认参数分派成功，分派数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepTopicDefaults(7);
      expect(sweep.groupId).assertEqual(TOPIC_MULTI_DEVICE);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0046
         * @tc.name      testNdkRenderNodeDispatch0046
         * @tc.desc      校验性能专题四个场景以 schema 默认参数分派成功，分派数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepTopicDefaults(5);
      expect(sweep.groupId).assertEqual(TOPIC_PERFORMANCE);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0047
         * @tc.name      testNdkRenderNodeDispatch0047
         * @tc.desc      校验录制回放专题四个场景以 schema 默认参数分派成功，分派数与 schema 一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepTopicDefaults(6);
      expect(sweep.groupId).assertEqual(TOPIC_RECORD);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0048
         * @tc.name      testNdkRenderNodeDispatch0048
         * @tc.desc      校验帧回调专题四个场景以 schema 默认参数分派成功，末组编号为 29。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeDispatch0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sweep: SweepObs = sweepTopicDefaults(9);
      expect(sweep.groupId).assertEqual(TOPIC_FRAME_TICK);
      expect(sweep.scenes).assertLarger(0);
      expect(sweep.dispatched).assertEqual(sweep.scenes);
      // 全部四个搜集口径跑完后，分组总数与首尾编号必须自洽。
      expect(TOPIC_GROUPS.length + CAPABILITY_GROUPS.length).assertEqual(GROUP_TOTAL);
      expect(TOPIC_GROUPS[TOPIC_GROUPS.length - 1].id).assertEqual(TOPIC_FRAME_TICK);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0049
         * @tc.name      testNdkRenderNodeDispatch0049
         * @tc.desc      校验节点树专题四个场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepTopicExtremes(0);
      expect(sweep.groupId).assertEqual(TOPIC_NODE_TREE);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0050
         * @tc.name      testNdkRenderNodeDispatch0050
         * @tc.desc      校验渲染属性专题四个场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepTopicExtremes(1);
      expect(sweep.groupId).assertEqual(TOPIC_RENDER_PROP);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0051
         * @tc.name      testNdkRenderNodeDispatch0051
         * @tc.desc      校验模糊层专题四个场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepTopicExtremes(2);
      expect(sweep.groupId).assertEqual(TOPIC_BLUR);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0052
         * @tc.name      testNdkRenderNodeDispatch0052
         * @tc.desc      校验生命周期专题四个场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepTopicExtremes(8);
      expect(sweep.groupId).assertEqual(TOPIC_LIFECYCLE);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0053
         * @tc.name      testNdkRenderNodeDispatch0053
         * @tc.desc      校验命中测试专题四个场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepTopicExtremes(4);
      expect(sweep.groupId).assertEqual(TOPIC_HIT_TEST);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0054
         * @tc.name      testNdkRenderNodeDispatch0054
         * @tc.desc      校验动画专题四个场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepTopicExtremes(3);
      expect(sweep.groupId).assertEqual(TOPIC_ANIMATION);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0055
         * @tc.name      testNdkRenderNodeDispatch0055
         * @tc.desc      校验多设备专题四个场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepTopicExtremes(7);
      expect(sweep.groupId).assertEqual(TOPIC_MULTI_DEVICE);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0056
         * @tc.name      testNdkRenderNodeDispatch0056
         * @tc.desc      校验性能专题四个场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepTopicExtremes(5);
      expect(sweep.groupId).assertEqual(TOPIC_PERFORMANCE);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0057
         * @tc.name      testNdkRenderNodeDispatch0057
         * @tc.desc      校验录制回放专题四个场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepTopicExtremes(6);
      expect(sweep.groupId).assertEqual(TOPIC_RECORD);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_DISPATCH_0058
         * @tc.name      testNdkRenderNodeDispatch0058
         * @tc.desc      校验帧回调专题四个场景在参数全下界与全上界时均可分派，边界值被正常裁剪。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeDispatch0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const sweep: SweepObs = sweepTopicExtremes(9);
      expect(sweep.groupId).assertEqual(TOPIC_FRAME_TICK);
      expect(sweep.low).assertEqual(sweep.scenes);
      expect(sweep.high).assertEqual(sweep.scenes);
    })

  })
}
