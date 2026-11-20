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
import { PARAM_RANGE, PARAM_SELECT, PARAM_TOGGLE, ParamSpec, rangeParam, SceneSpec, scene,
  selectParam, toggleParam } from '../../../main/ets/core/SchemaTypes';
import { ParamEngine } from '../../../main/ets/core/ParamEngine';
import { CANVAS_GROUP } from '../../../main/ets/schema/CapabilityCanvas';

const TAG: string = '[Sample_NdkRenderNodeParamTest]';
const DOMAIN: number = 0xF811;
// 浮点比较容差，参数引擎的刻度换算涉及乘除。
const EPSILON: number = 1e-6;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function near(actual: number, expected: number): boolean {
  return Math.abs(actual - expected) < EPSILON;
}

// 三参数场景，键名与默认值互不相同，便于校验顺序。
function twoParamScene(): SceneSpec {
  return scene(0, 'Two', 'two params', [
    rangeParam('first', 'vp', 10, 0, 100, 10),
    rangeParam('second', 'vp', 20, 0, 100, 10)
  ]);
}

export default function ndkRenderNodeParamTest(): void {
  describe('NdkRenderNodeParam', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0001
     * @tc.name      testNdkRenderNodeParam0001
     * @tc.desc      校验无参数场景取默认值得到空数组，不会凭空补出元素。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0001 begin');
      const empty: SceneSpec = scene(0, 'Empty', 'no param', []);
      const values: number[] = ParamEngine.defaults(empty);
      expect(values.length).assertEqual(0);
      expect(ParamEngine.summary(empty, values)).assertEqual('');
      // 场景本身也没有声明参数，默认值数组为空不是被裁剪的结果。
      expect(empty.params.length).assertEqual(0);
      logInfo('testNdkRenderNodeParam0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0002
     * @tc.name      testNdkRenderNodeParam0002
     * @tc.desc      校验默认值按参数声明顺序排列，顺序即 native 侧读取下标。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeParam0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeParam0002 begin');
      const values: number[] = ParamEngine.defaults(twoParamScene());
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(10);
      expect(values[1]).assertEqual(20);
      logInfo('testNdkRenderNodeParam0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0003
     * @tc.name      testNdkRenderNodeParam0003
     * @tc.desc      校验默认值是新建数组，改写结果不会污染场景声明中的字段。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0003 begin');
      const spec: SceneSpec = twoParamScene();
      const values: number[] = ParamEngine.defaults(spec);
      values[0] = 99;
      expect(spec.params[0].def).assertEqual(10);
      const again: number[] = ParamEngine.defaults(spec);
      expect(again[0]).assertEqual(10);
      expect(again[1]).assertEqual(20);
      logInfo('testNdkRenderNodeParam0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0004
     * @tc.name      testNdkRenderNodeParam0004
     * @tc.desc      校验多次取默认值互相独立，返回的数组不是同一个引用。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeParam0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeParam0004 begin');
      const spec: SceneSpec = twoParamScene();
      const first: number[] = ParamEngine.defaults(spec);
      const second: number[] = ParamEngine.defaults(spec);
      first[0] = 1;
      expect(second[0]).assertEqual(10);
      expect(second.length).assertEqual(2);
      expect(second[1]).assertEqual(20);
      logInfo('testNdkRenderNodeParam0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0005
     * @tc.name      testNdkRenderNodeParam0005
     * @tc.desc      校验 NaN 输入回退为默认值，避免非法数值传给 native。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeParam0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeParam0005 begin');
      const spec: ParamSpec = rangeParam('alpha', '%', 55, 0, 100, 5);
      const result: number = ParamEngine.clamp(spec, Number.NaN);
      logInfo('clamp(NaN) = ' + result.toString());
      expect(result).assertEqual(55);
      expect(spec.def).assertEqual(55);
      expect(ParamEngine.clamp(spec, Number.POSITIVE_INFINITY)).assertEqual(100);
      logInfo('testNdkRenderNodeParam0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0006
     * @tc.name      testNdkRenderNodeParam0006
     * @tc.desc      校验低于下界的输入被夹到最近的可达刻度。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeParam0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeParam0006 begin');
      const spec: ParamSpec = rangeParam('spacing', 'vp', 24, 8, 64, 4);
      expect(ParamEngine.clamp(spec, -1000)).assertEqual(8);
      expect(ParamEngine.clamp(spec, 0)).assertEqual(8);
      expect(ParamEngine.clamp(spec, 7.9)).assertEqual(8);
      logInfo('testNdkRenderNodeParam0006 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0007
     * @tc.name      testNdkRenderNodeParam0007
     * @tc.desc      校验高于上界的输入被夹到最近的可达刻度。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeParam0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeParam0007 begin');
      const spec: ParamSpec = rangeParam('spacing', 'vp', 24, 8, 64, 4);
      expect(ParamEngine.clamp(spec, 1000)).assertEqual(64);
      expect(ParamEngine.clamp(spec, 64.1)).assertEqual(64);
      expect(ParamEngine.clamp(spec, 65)).assertEqual(64);
      logInfo('testNdkRenderNodeParam0007 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0008
     * @tc.name      testNdkRenderNodeParam0008
     * @tc.desc      校验刻度区间内偏上的输入向上对齐，23 对齐到 24。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0008 begin');
      const spec: ParamSpec = rangeParam('spacing', 'vp', 24, 8, 64, 4);
      expect(ParamEngine.clamp(spec, 23)).assertEqual(24);
      expect(ParamEngine.clamp(spec, 22.1)).assertEqual(24);
      // 对齐到 24 而不是 20，取决于 4 的刻度步长。
      expect(spec.step).assertEqual(4);
      logInfo('testNdkRenderNodeParam0008 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0009
     * @tc.name      testNdkRenderNodeParam0009
     * @tc.desc      校验刻度区间内偏下的输入向下对齐，21 对齐到 20。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0009 begin');
      const spec: ParamSpec = rangeParam('spacing', 'vp', 24, 8, 64, 4);
      expect(ParamEngine.clamp(spec, 21)).assertEqual(20);
      expect(ParamEngine.clamp(spec, 11)).assertEqual(12);
      // 下界 8 之上的刻度依次为 12、16、20，取最近的一档。
      expect(spec.min).assertEqual(8);
      logInfo('testNdkRenderNodeParam0009 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0010
     * @tc.name      testNdkRenderNodeParam0010
     * @tc.desc      校验正好落在刻度上的输入保持原值不变。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0010 begin');
      const spec: ParamSpec = rangeParam('spacing', 'vp', 24, 8, 64, 4);
      expect(ParamEngine.clamp(spec, 8)).assertEqual(8);
      expect(ParamEngine.clamp(spec, 32)).assertEqual(32);
      expect(ParamEngine.clamp(spec, 64)).assertEqual(64);
      logInfo('testNdkRenderNodeParam0010 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0011
     * @tc.name      testNdkRenderNodeParam0011
     * @tc.desc      校验步长为 0 的滑杆只做上下界裁剪，不对齐刻度。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0011 begin');
      const spec: ParamSpec = rangeParam('free', '', 5, 0, 10, 0);
      expect(near(ParamEngine.clamp(spec, 3.7), 3.7)).assertTrue();
      expect(ParamEngine.clamp(spec, -2)).assertEqual(0);
      expect(ParamEngine.clamp(spec, 12)).assertEqual(10);
      logInfo('testNdkRenderNodeParam0011 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0012
     * @tc.name      testNdkRenderNodeParam0012
     * @tc.desc      校验小数步长同样能对齐刻度，3.3 对齐到 3.5。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0012 begin');
      const spec: ParamSpec = rangeParam('ratio', '', 1, 0, 10, 0.5);
      const aligned: number = ParamEngine.clamp(spec, 3.3);
      logInfo('clamp(3.3) = ' + aligned.toString());
      expect(near(aligned, 3.5)).assertTrue();
      expect(near(ParamEngine.clamp(spec, 2.9), 3)).assertTrue();
      expect(ParamEngine.clamp(spec, 0.2)).assertEqual(0);
      logInfo('testNdkRenderNodeParam0012 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0013
     * @tc.name      testNdkRenderNodeParam0013
     * @tc.desc      校验开关参数以 0.5 为阈值归一化为 0 或 1。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeParam0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeParam0013 begin');
      const spec: ParamSpec = toggleParam('fill', true);
      expect(spec.kind).assertEqual(PARAM_TOGGLE);
      expect(ParamEngine.clamp(spec, 0.5)).assertEqual(0);
      expect(ParamEngine.clamp(spec, 0.51)).assertEqual(1);
      expect(ParamEngine.clamp(spec, 1)).assertEqual(1);
      expect(ParamEngine.clamp(spec, 0)).assertEqual(0);
      logInfo('testNdkRenderNodeParam0013 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0014
     * @tc.name      testNdkRenderNodeParam0014
     * @tc.desc      校验开关参数对负数与超大值同样只输出 0 或 1，不会越界。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0014 begin');
      const spec: ParamSpec = toggleParam('fill', false);
      expect(ParamEngine.clamp(spec, -5)).assertEqual(0);
      expect(ParamEngine.clamp(spec, 999)).assertEqual(1);
      expect(spec.def).assertEqual(0);
      expect(spec.max).assertEqual(1);
      logInfo('testNdkRenderNodeParam0014 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0015
     * @tc.name      testNdkRenderNodeParam0015
     * @tc.desc      校验下拉参数的小数输入四舍五入到整数下标。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeParam0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeParam0015 begin');
      const spec: ParamSpec = selectParam('palette', 1, ['blue', 'amber', 'green', 'red']);
      expect(spec.kind).assertEqual(PARAM_SELECT);
      expect(ParamEngine.clamp(spec, 1.4)).assertEqual(1);
      expect(ParamEngine.clamp(spec, 1.6)).assertEqual(2);
      expect(ParamEngine.clamp(spec, 2.5)).assertEqual(3);
      logInfo('testNdkRenderNodeParam0015 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0016
     * @tc.name      testNdkRenderNodeParam0016
     * @tc.desc      校验下拉参数越界输入被裁剪到首尾合法下标。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0016 begin');
      const spec: ParamSpec = selectParam('palette', 1, ['blue', 'amber', 'green']);
      expect(spec.min).assertEqual(0);
      expect(spec.max).assertEqual(2);
      expect(ParamEngine.clamp(spec, -9)).assertEqual(0);
      expect(ParamEngine.clamp(spec, 99)).assertEqual(2);
      logInfo('testNdkRenderNodeParam0016 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0017
     * @tc.name      testNdkRenderNodeParam0017
     * @tc.desc      校验外部数组比声明长时被截断，多出的值不会进入 native。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeParam0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeParam0017 begin');
      const result: number[] = ParamEngine.normalize(twoParamScene(), [30, 40, 50, 60]);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(30);
      expect(result[1]).assertEqual(40);
      logInfo('testNdkRenderNodeParam0017 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0018
     * @tc.name      testNdkRenderNodeParam0018
     * @tc.desc      校验外部数组比声明短时用默认值补齐，长度始终与声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeParam0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeParam0018 begin');
      const result: number[] = ParamEngine.normalize(twoParamScene(), [30]);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(30);
      expect(result[1]).assertEqual(20);
      logInfo('testNdkRenderNodeParam0018 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0019
     * @tc.name      testNdkRenderNodeParam0019
     * @tc.desc      校验空数组输入等价于全默认值，不会产生 undefined 元素。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0019 begin');
      const result: number[] = ParamEngine.normalize(twoParamScene(), []);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      logInfo('testNdkRenderNodeParam0019 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0020
     * @tc.name      testNdkRenderNodeParam0020
     * @tc.desc      校验归一化不修改入参数组，调用方持有的引用保持不变。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0020 begin');
      const source: number[] = [500, -100];
      ParamEngine.normalize(twoParamScene(), source);
      expect(source[0]).assertEqual(500);
      expect(source[1]).assertEqual(-100);
      expect(source.length).assertEqual(2);
      logInfo('testNdkRenderNodeParam0020 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0021
     * @tc.name      testNdkRenderNodeParam0021
     * @tc.desc      校验归一化对每一项都执行裁剪与刻度对齐。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0021 begin');
      const result: number[] = ParamEngine.normalize(twoParamScene(), [23, 999]);
      logInfo('normalize = ' + result.join(','));
      expect(result[0]).assertEqual(20);
      expect(result[1]).assertEqual(100);
      expect(result.length).assertEqual(2);
      logInfo('testNdkRenderNodeParam0021 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0022
     * @tc.name      testNdkRenderNodeParam0022
     * @tc.desc      校验归一化遇到 NaN 项时回退该参数的默认值。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0022 begin');
      const result: number[] = ParamEngine.normalize(twoParamScene(), [Number.NaN, 40]);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(40);
      // NaN 回退为默认值后结果仍是有限数。
      expect(Number.isFinite(result[0])).assertTrue();
      logInfo('testNdkRenderNodeParam0022 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0023
     * @tc.name      testNdkRenderNodeParam0023
     * @tc.desc      校验画布能力域每个场景归一化后长度都与参数声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0023 begin');
      for (let index = 0; index < CANVAS_GROUP.scenes.length; index++) {
        const spec: SceneSpec = CANVAS_GROUP.scenes[index];
        const result: number[] = ParamEngine.normalize(spec, []);
        expect(result.length).assertEqual(spec.params.length);
      }
      expect(CANVAS_GROUP.scenes.length > 0).assertTrue();
      // 第一个场景的默认值数量同样对齐声明，循环里的规律不是巧合。
      expect(ParamEngine.defaults(CANVAS_GROUP.scenes[0]).length).assertEqual(CANVAS_GROUP.scenes[0].params.length);
      logInfo('testNdkRenderNodeParam0023 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0024
     * @tc.name      testNdkRenderNodeParam0024
     * @tc.desc      校验带单位的整数滑杆展示为整数并拼接单位。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeParam0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeParam0024 begin');
      const text: string = ParamEngine.describe(rangeParam('spacing', 'vp', 24, 8, 64, 4), 24);
      logInfo('describe = ' + text);
      expect(text).assertEqual('24 vp');
      expect(text.indexOf('vp') >= 0).assertTrue();
      expect(text.length).assertLarger(0);
      logInfo('testNdkRenderNodeParam0024 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0025
     * @tc.name      testNdkRenderNodeParam0025
     * @tc.desc      校验无单位参数只输出数字，不追加多余空格。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0025 begin');
      const text: string = ParamEngine.describe(rangeParam('layers', '', 3, 1, 6, 1), 3);
      expect(text).assertEqual('3');
      expect(text.indexOf('vp')).assertEqual(-1);
      expect(text.length).assertLarger(0);
      logInfo('testNdkRenderNodeParam0025 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0026
     * @tc.name      testNdkRenderNodeParam0026
     * @tc.desc      校验步长小于 1 时展示保留一位小数。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0026 begin');
      const text: string = ParamEngine.describe(rangeParam('ratio', '', 1, 0, 10, 0.5), 3.5);
      logInfo('describe = ' + text);
      expect(text).assertEqual('3.5');
      // 小数刻度描述保留小数点，不带单位。
      expect(text.indexOf('.') >= 0).assertTrue();
      expect(text.length).assertLarger(0);
      logInfo('testNdkRenderNodeParam0026 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0027
     * @tc.name      testNdkRenderNodeParam0027
     * @tc.desc      校验开关参数展示为 on/off，与阈值判定保持一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0027 begin');
      const spec: ParamSpec = toggleParam('fill', true);
      expect(ParamEngine.describe(spec, 1)).assertEqual('on');
      expect(ParamEngine.describe(spec, 0)).assertEqual('off');
      expect(spec.def).assertEqual(1);
      expect(spec.options.length).assertEqual(0);
      logInfo('testNdkRenderNodeParam0027 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0028
     * @tc.name      testNdkRenderNodeParam0028
     * @tc.desc      校验下拉参数展示当前下标对应的选项文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeParam0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeParam0028 begin');
      const spec: ParamSpec = selectParam('palette', 1, ['blue', 'amber', 'green']);
      expect(ParamEngine.describe(spec, 0)).assertEqual('blue');
      expect(ParamEngine.describe(spec, 1)).assertEqual('amber');
      expect(ParamEngine.describe(spec, 2)).assertEqual('green');
      logInfo('testNdkRenderNodeParam0028 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0029
     * @tc.name      testNdkRenderNodeParam0029
     * @tc.desc      校验下拉参数下标越界时展示占位符，不抛出异常。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0029 begin');
      const spec: ParamSpec = selectParam('palette', 0, ['blue']);
      expect(ParamEngine.describe(spec, 5)).assertEqual('-');
      expect(ParamEngine.describe(spec, -1)).assertEqual('-');
      expect(ParamEngine.describe(spec, 0)).assertEqual('blue');
      expect(spec.options.length).assertEqual(1);
      logInfo('testNdkRenderNodeParam0029 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0030
     * @tc.name      testNdkRenderNodeParam0030
     * @tc.desc      校验按下标改值只影响目标项，其余项保持原值。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeParam0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeParam0030 begin');
      const spec: SceneSpec = twoParamScene();
      const next: number[] = ParamEngine.withValue(spec, [10, 20], 1, 70);
      expect(next[0]).assertEqual(10);
      expect(next[1]).assertEqual(70);
      expect(next.length).assertEqual(2);
      logInfo('testNdkRenderNodeParam0030 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0031
     * @tc.name      testNdkRenderNodeParam0031
     * @tc.desc      校验下标越界时只做归一化，不写入任何位置。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0031 begin');
      const spec: SceneSpec = twoParamScene();
      const next: number[] = ParamEngine.withValue(spec, [10, 20], 5, 70);
      expect(next.length).assertEqual(2);
      expect(next[0]).assertEqual(10);
      expect(next[1]).assertEqual(20);
      logInfo('testNdkRenderNodeParam0031 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0032
     * @tc.name      testNdkRenderNodeParam0032
     * @tc.desc      校验负下标被忽略，返回结果与归一化结果一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeParam0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeParam0032 begin');
      const spec: SceneSpec = twoParamScene();
      const next: number[] = ParamEngine.withValue(spec, [], -1, 70);
      expect(next.length).assertEqual(2);
      expect(next[0]).assertEqual(10);
      expect(next[1]).assertEqual(20);
      logInfo('testNdkRenderNodeParam0032 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0033
     * @tc.name      testNdkRenderNodeParam0033
     * @tc.desc      校验改值返回新数组，调用方持有的旧数组不被改写。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0033 begin');
      const current: number[] = [10, 20];
      ParamEngine.withValue(twoParamScene(), current, 0, 50);
      expect(current[0]).assertEqual(10);
      expect(current.length).assertEqual(2);
      expect(current[1]).assertEqual(20);
      logInfo('testNdkRenderNodeParam0033 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0034
     * @tc.name      testNdkRenderNodeParam0034
     * @tc.desc      校验改值同样执行裁剪，越界数值不会写入结果数组。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0034 begin');
      const spec: SceneSpec = twoParamScene();
      expect(ParamEngine.withValue(spec, [10, 20], 0, -50)[0]).assertEqual(0);
      expect(ParamEngine.withValue(spec, [10, 20], 0, 500)[0]).assertEqual(100);
      expect(ParamEngine.withValue(spec, [10, 20], 1, 500)[1]).assertEqual(100);
      logInfo('testNdkRenderNodeParam0034 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0035
     * @tc.name      testNdkRenderNodeParam0035
     * @tc.desc      校验单参数摘要格式为「键=展示值」，不含多余分隔符。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0035 begin');
      const spec: SceneSpec = scene(0, 'One', 'one param', [rangeParam('spacing', 'vp', 24, 8, 64, 4)]);
      const text: string = ParamEngine.summary(spec, [24]);
      logInfo('summary = ' + text);
      expect(text).assertEqual('spacing=24 vp');
      expect(text.length).assertLarger(0);
      expect(text.indexOf('=') >= 0).assertTrue();
      logInfo('testNdkRenderNodeParam0035 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0036
     * @tc.name      testNdkRenderNodeParam0036
     * @tc.desc      校验多参数摘要按声明顺序用逗号加空格连接。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0036 begin');
      const text: string = ParamEngine.summary(twoParamScene(), [10, 20]);
      logInfo('summary = ' + text);
      expect(text).assertEqual('first=10 vp, second=20 vp');
      expect(text.length).assertLarger(0);
      expect(text.indexOf(',') >= 0).assertTrue();
      logInfo('testNdkRenderNodeParam0036 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0037
     * @tc.name      testNdkRenderNodeParam0037
     * @tc.desc      校验摘要遇到缺失值时用默认值展示，而不是空字符串。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0037 begin');
      const text: string = ParamEngine.summary(twoParamScene(), [10]);
      expect(text).assertEqual('first=10 vp, second=20 vp');
      expect(text.length).assertLarger(0);
      // 缺省入参按默认值补齐，第二段仍是 20。
      expect(text.indexOf('second=20') >= 0).assertTrue();
      logInfo('testNdkRenderNodeParam0037 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0038
     * @tc.name      testNdkRenderNodeParam0038
     * @tc.desc      校验摘要中下拉参数展示选项文案而非下标。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0038 begin');
      const spec: SceneSpec = scene(0, 'Clear', 'clear', [selectParam('palette', 1, ['blue', 'amber'])]);
      expect(ParamEngine.summary(spec, [0])).assertEqual('palette=blue');
      expect(ParamEngine.summary(spec, [1])).assertEqual('palette=amber');
      expect(ParamEngine.summary(spec, [1])).assertEqual('palette=amber');
      logInfo('testNdkRenderNodeParam0038 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0039
     * @tc.name      testNdkRenderNodeParam0039
     * @tc.desc      校验摘要中开关参数展示 on/off，便于页面状态栏读状态。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0039 begin');
      const spec: SceneSpec = scene(0, 'Toggle', 'toggle', [toggleParam('enabled', true)]);
      expect(ParamEngine.summary(spec, [1])).assertEqual('enabled=on');
      expect(ParamEngine.summary(spec, [0])).assertEqual('enabled=off');
      expect(ParamEngine.summary(spec, [0])).assertEqual('enabled=off');
      logInfo('testNdkRenderNodeParam0039 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0040
     * @tc.name      testNdkRenderNodeParam0040
     * @tc.desc      校验 ParamSpec 构造函数按位置写入全部字段，不出现错位。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0040 begin');
      const spec: ParamSpec = new ParamSpec('alpha', PARAM_RANGE, 100, 0, 100, 5, '%', ['a', 'b']);
      expect(spec.key).assertEqual('alpha');
      expect(spec.kind).assertEqual(PARAM_RANGE);
      expect(spec.def).assertEqual(100);
      expect(spec.min).assertEqual(0);
      expect(spec.max).assertEqual(100);
      expect(spec.step).assertEqual(5);
      expect(spec.unit).assertEqual('%');
      expect(spec.options.length).assertEqual(2);
      logInfo('testNdkRenderNodeParam0040 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0041
     * @tc.name      testNdkRenderNodeParam0041
     * @tc.desc      校验 rangeParam 产出滑杆类型且不带选项，min 小于等于 max。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0041 begin');
      const spec: ParamSpec = rangeParam('angle', '°', 30, -90, 90, 5);
      expect(spec.kind).assertEqual(PARAM_RANGE);
      expect(spec.options.length).assertEqual(0);
      expect(spec.min <= spec.max).assertTrue();
      expect(spec.def >= spec.min && spec.def <= spec.max).assertTrue();
      logInfo('testNdkRenderNodeParam0041 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0042
     * @tc.name      testNdkRenderNodeParam0042
     * @tc.desc      校验 toggleParam 的取值域被固定为 0..1、步长 1、无单位。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0042 begin');
      const on: ParamSpec = toggleParam('a', true);
      const off: ParamSpec = toggleParam('b', false);
      expect(on.def).assertEqual(1);
      expect(off.def).assertEqual(0);
      expect(on.min).assertEqual(0);
      expect(on.max).assertEqual(1);
      expect(on.step).assertEqual(1);
      expect(on.unit).assertEqual('');
      logInfo('testNdkRenderNodeParam0042 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0043
     * @tc.name      testNdkRenderNodeParam0043
     * @tc.desc      校验无选项的下拉参数边界收敛为 0，避免出现 max 为负。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeParam0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeParam0043 begin');
      const spec: ParamSpec = selectParam('empty', 0, []);
      expect(spec.max).assertEqual(0);
      expect(spec.min).assertEqual(0);
      expect(spec.options.length).assertEqual(0);
      expect(ParamEngine.describe(spec, 0)).assertEqual('-');
      logInfo('testNdkRenderNodeParam0043 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0044
     * @tc.name      testNdkRenderNodeParam0044
     * @tc.desc      校验场景与能力域构造函数的描述字段按位置写入，标题可用于界面。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0044 begin');
      const target: SceneSpec = scene(7, 'Translate', 'apply translate', [rangeParam('dx', '%', 20, -40, 40, 5)]);
      expect(target.id).assertEqual(7);
      expect(target.title).assertEqual('Translate');
      expect(target.desc).assertEqual('apply translate');
      expect(target.params.length).assertEqual(1);
      logInfo('testNdkRenderNodeParam0044 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0045
     * @tc.name      testNdkRenderNodeParam0045
     * @tc.desc      校验画布能力域内同一场景的参数键不重复，避免面板出现重名控件。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0045 begin');
      for (let index = 0; index < CANVAS_GROUP.scenes.length; index++) {
        const spec: SceneSpec = CANVAS_GROUP.scenes[index];
        const keys: string[] = [];
        for (let param = 0; param < spec.params.length; param++) {
          const key: string = spec.params[param].key;
          expect(keys.indexOf(key)).assertEqual(-1);
          keys.push(key);
        }
      }
      expect(CANVAS_GROUP.scenes.length > 0).assertTrue();
      expect(CANVAS_GROUP.key.length).assertLarger(0);
      logInfo('testNdkRenderNodeParam0045 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0046
     * @tc.name      testNdkRenderNodeParam0046
     * @tc.desc      校验画布能力域所有参数默认值都落在声明的上下界之内。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0046 begin');
      for (let index = 0; index < CANVAS_GROUP.scenes.length; index++) {
        const spec: SceneSpec = CANVAS_GROUP.scenes[index];
        for (let param = 0; param < spec.params.length; param++) {
          const item: ParamSpec = spec.params[param];
          expect(item.def >= item.min && item.def <= item.max).assertTrue();
        }
      }
      expect(CANVAS_GROUP.scenes.length > 0).assertTrue();
      expect(CANVAS_GROUP.id).assertEqual(1);
      logInfo('testNdkRenderNodeParam0046 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0047
     * @tc.name      testNdkRenderNodeParam0047
     * @tc.desc      校验画布能力域滑杆参数的步长为正，保证刻度对齐可终止。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0047 begin');
      for (let index = 0; index < CANVAS_GROUP.scenes.length; index++) {
        const spec: SceneSpec = CANVAS_GROUP.scenes[index];
        for (let param = 0; param < spec.params.length; param++) {
          const item: ParamSpec = spec.params[param];
          if (item.kind === PARAM_RANGE) {
            expect(item.step > 0).assertTrue();
          }
        }
      }
      expect(CANVAS_GROUP.scenes.length > 0).assertTrue();
      expect(CANVAS_GROUP.scenes[0].params.length >= 0).assertTrue();
      logInfo('testNdkRenderNodeParam0047 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_0048
     * @tc.name      testNdkRenderNodeParam0048
     * @tc.desc      校验下拉参数的默认下标落在选项数组范围内。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParam0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParam0048 begin');
      for (let index = 0; index < CANVAS_GROUP.scenes.length; index++) {
        const spec: SceneSpec = CANVAS_GROUP.scenes[index];
        for (let param = 0; param < spec.params.length; param++) {
          const item: ParamSpec = spec.params[param];
          if (item.kind === PARAM_SELECT) {
            expect(item.options.length > 0).assertTrue();
            expect(item.def >= 0 && item.def < item.options.length).assertTrue();
          }
        }
      }
      expect(CANVAS_GROUP.scenes.length).assertLarger(0);
      logInfo('testNdkRenderNodeParam0048 end');
    })
  })
}
