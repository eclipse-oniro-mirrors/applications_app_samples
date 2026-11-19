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
import { ParamEngine } from '../../../main/ets/core/ParamEngine';
import { ParamSpec, rangeParam, SceneSpec, scene, selectParam, toggleParam } from '../../../main/ets/core/SchemaTypes';

const TAG: string = '[Sample_NdkRenderNodeParamTailTest]';
const DOMAIN: number = 0xF811;
// 混合场景的参数下标与规格文案，作为文案展示的冻结基线。
const RANGE_INDEX: number = 0;
const TOGGLE_INDEX: number = 1;
const SELECT_INDEX: number = 2;
const SELECT_OPTIONS: string[] = ['Nearest', 'Linear', 'Cubic'];
const FULL_SUMMARY: string = 'width=24 vp, enabled=on, sampling=Linear';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// 三参数混合场景：滑杆 + 开关 + 下拉，覆盖 describe 的三条分支。
function mixedScene(): SceneSpec {
  return scene(0, 'Mixed', 'range + toggle + select', [
    rangeParam('width', 'vp', 24, 8, 64, 4),
    toggleParam('enabled', true),
    selectParam('sampling', 1, SELECT_OPTIONS)
  ]);
}

// 小数步长滑杆：步长 0.05 需要两位小数，用于校验小数位按步长推导。
function ratioSpec(): ParamSpec {
  return rangeParam('ratio', '', 0.5, 0, 1, 0.05);
}

export default function ndkRenderNodeParamTailTest(): void {
  describe('NdkRenderNodeParamTail', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0001
     * @tc.name      testNdkRenderNodeParamTail0001
     * @tc.desc      校验整数步长滑杆带单位时按「数值 空格 单位」展示。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeParamTail0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeParamTail0001 begin');
      const spec: ParamSpec = rangeParam('width', 'vp', 24, 8, 64, 4);
      const text: string = ParamEngine.describe(spec, 24);
      expect(text).assertEqual('24 vp');
      expect(text.length).assertEqual(5);
      expect(text.indexOf('vp') > 0).assertTrue();
      logInfo('testNdkRenderNodeParamTail0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0002
     * @tc.name      testNdkRenderNodeParamTail0002
     * @tc.desc      校验无单位滑杆只展示数值，不带尾随空格。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParamTail0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParamTail0002 begin');
      const spec: ParamSpec = rangeParam('count', '', 12, 0, 32, 1);
      const text: string = ParamEngine.describe(spec, 12);
      expect(text).assertEqual('12');
      expect(text.length).assertEqual(2);
      expect(text.indexOf(' ')).assertEqual(-1);
      logInfo('testNdkRenderNodeParamTail0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0003
     * @tc.name      testNdkRenderNodeParamTail0003
     * @tc.desc      校验小数步长滑杆按步长保留两位小数展示，不再把 0.30 显示成 0.3。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParamTail0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParamTail0003 begin');
      const text: string = ParamEngine.describe(ratioSpec(), 0.3);
      expect(text).assertEqual('0.30');
      expect(text.indexOf('.')).assertEqual(1);
      expect(text.length).assertEqual(4);
      logInfo('testNdkRenderNodeParamTail0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0004
     * @tc.name      testNdkRenderNodeParamTail0004
     * @tc.desc      校验整数步长滑杆收到小数时按整数位四舍五入展示，不出现小数点。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeParamTail0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeParamTail0004 begin');
      const spec: ParamSpec = rangeParam('width', 'vp', 24, 8, 64, 4);
      expect(ParamEngine.describe(spec, 24.6)).assertEqual('25 vp');
      expect(ParamEngine.describe(spec, 24.4)).assertEqual('24 vp');
      expect(ParamEngine.describe(spec, 24.6).indexOf('.')).assertEqual(-1);
      logInfo('testNdkRenderNodeParamTail0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0005
     * @tc.name      testNdkRenderNodeParamTail0005
     * @tc.desc      校验开关值 1 展示为 on，且不带数值。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeParamTail0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeParamTail0005 begin');
      const spec: ParamSpec = toggleParam('enabled', true);
      const text: string = ParamEngine.describe(spec, 1);
      expect(text).assertEqual('on');
      expect(text === 'off').assertFalse();
      expect(text.indexOf('1')).assertEqual(-1);
      logInfo('testNdkRenderNodeParamTail0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0006
     * @tc.name      testNdkRenderNodeParamTail0006
     * @tc.desc      校验开关值 0 展示为 off。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeParamTail0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeParamTail0006 begin');
      const spec: ParamSpec = toggleParam('enabled', true);
      const text: string = ParamEngine.describe(spec, 0);
      expect(text).assertEqual('off');
      expect(text === 'on').assertFalse();
      expect(text.length).assertEqual(3);
      logInfo('testNdkRenderNodeParamTail0006 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0007
     * @tc.name      testNdkRenderNodeParamTail0007
     * @tc.desc      校验开关在 0.5 处仍为 off，超过 0.5 才切到 on，阈值不含等号。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeParamTail0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeParamTail0007 begin');
      const spec: ParamSpec = toggleParam('enabled', true);
      expect(ParamEngine.describe(spec, 0.4)).assertEqual('off');
      expect(ParamEngine.describe(spec, 0.5)).assertEqual('off');
      expect(ParamEngine.describe(spec, 0.6)).assertEqual('on');
      logInfo('testNdkRenderNodeParamTail0007 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0008
     * @tc.name      testNdkRenderNodeParamTail0008
     * @tc.desc      校验下拉参数按整数下标取选项文案，下标 1 对应 Linear。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeParamTail0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeParamTail0008 begin');
      const spec: ParamSpec = selectParam('sampling', 1, SELECT_OPTIONS);
      expect(ParamEngine.describe(spec, 1)).assertEqual('Linear');
      expect(ParamEngine.describe(spec, 0)).assertEqual('Nearest');
      expect(ParamEngine.describe(spec, 2)).assertEqual('Cubic');
      logInfo('testNdkRenderNodeParamTail0008 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0009
     * @tc.name      testNdkRenderNodeParamTail0009
     * @tc.desc      校验下拉下标越界时展示占位符「-」，不会读到 undefined。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParamTail0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParamTail0009 begin');
      const spec: ParamSpec = selectParam('sampling', 1, SELECT_OPTIONS);
      const text: string = ParamEngine.describe(spec, 99);
      expect(text).assertEqual('-');
      expect(text.length).assertEqual(1);
      expect(text === 'undefined').assertFalse();
      logInfo('testNdkRenderNodeParamTail0009 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0010
     * @tc.name      testNdkRenderNodeParamTail0010
     * @tc.desc      校验下拉负下标同样展示占位符「-」，不出现数组回绕取值。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParamTail0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParamTail0010 begin');
      const spec: ParamSpec = selectParam('sampling', 1, SELECT_OPTIONS);
      expect(ParamEngine.describe(spec, -3)).assertEqual('-');
      expect(ParamEngine.describe(spec, -0.4)).assertEqual('Nearest');
      expect(ParamEngine.describe(spec, -1)).assertEqual('-');
      logInfo('testNdkRenderNodeParamTail0010 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0011
     * @tc.name      testNdkRenderNodeParamTail0011
     * @tc.desc      校验下拉小数下标按四舍五入取整，1.4 仍落在 Linear，2.4 进到 Cubic。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeParamTail0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeParamTail0011 begin');
      const spec: ParamSpec = selectParam('sampling', 1, SELECT_OPTIONS);
      expect(ParamEngine.describe(spec, 1.4)).assertEqual('Linear');
      expect(ParamEngine.describe(spec, 1.4) === 'Cubic').assertFalse();
      expect(ParamEngine.describe(spec, 2.4)).assertEqual('Cubic');
      logInfo('testNdkRenderNodeParamTail0011 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0012
     * @tc.name      testNdkRenderNodeParamTail0012
     * @tc.desc      校验下拉小数下标的四舍五入边界：1.5 进位到 Cubic，与 1.4 结果不同，2.6 越界回落占位符。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeParamTail0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeParamTail0012 begin');
      const spec: ParamSpec = selectParam('sampling', 1, SELECT_OPTIONS);
      const atHalf: string = ParamEngine.describe(spec, 1.5);
      expect(atHalf).assertEqual('Cubic');
      expect(atHalf === ParamEngine.describe(spec, 1.4)).assertFalse();
      expect(ParamEngine.describe(spec, 2.6)).assertEqual('-');
      logInfo('testNdkRenderNodeParamTail0012 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0013
     * @tc.name      testNdkRenderNodeParamTail0013
     * @tc.desc      校验摘要缺值时按各参数默认值补齐，得到完整的三段文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParamTail0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParamTail0013 begin');
      const spec: SceneSpec = mixedScene();
      const summary: string = ParamEngine.summary(spec, []);
      expect(summary).assertEqual(FULL_SUMMARY);
      expect(summary.indexOf('width=24 vp') >= 0).assertTrue();
      expect(summary.indexOf('sampling=Linear') >= 0).assertTrue();
      logInfo('testNdkRenderNodeParamTail0013 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0014
     * @tc.name      testNdkRenderNodeParamTail0014
     * @tc.desc      校验摘要对超出参数个数的尾部值不做拼接，段数恒等于参数个数。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeParamTail0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeParamTail0014 begin');
      const spec: SceneSpec = mixedScene();
      const summary: string = ParamEngine.summary(spec, [10, 0, 2, 99, 99]);
      expect(summary).assertEqual('width=10 vp, enabled=off, sampling=Cubic');
      let segments: number = 0;
      for (let index = 0; index < summary.length; index++) {
        if (summary.charAt(index) === '=') {
          segments += 1;
        }
      }
      expect(segments).assertEqual(3);
      expect(summary.indexOf('99') >= 0).assertFalse();
      logInfo('testNdkRenderNodeParamTail0014 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0015
     * @tc.name      testNdkRenderNodeParamTail0015
     * @tc.desc      校验摘要按参数声明顺序拼接，分隔符为逗号加空格。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParamTail0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParamTail0015 begin');
      const spec: SceneSpec = mixedScene();
      const summary: string = ParamEngine.summary(spec, ParamEngine.defaults(spec));
      const rangeAt: number = summary.indexOf('width=');
      const toggleAt: number = summary.indexOf('enabled=');
      const selectAt: number = summary.indexOf('sampling=');
      expect(rangeAt).assertEqual(0);
      expect(toggleAt > rangeAt).assertTrue();
      expect(selectAt > toggleAt).assertTrue();
      expect(summary.indexOf(', ')).assertEqual(summary.indexOf('enabled=') - 2);
      logInfo('testNdkRenderNodeParamTail0015 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0016
     * @tc.name      testNdkRenderNodeParamTail0016
     * @tc.desc      校验负下标修改被忽略，返回的仍是默认值数组。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeParamTail0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeParamTail0016 begin');
      const spec: SceneSpec = mixedScene();
      const defaults: number[] = ParamEngine.defaults(spec);
      const next: number[] = ParamEngine.withValue(spec, defaults, -1, 999);
      expect(next[RANGE_INDEX]).assertEqual(24);
      expect(next[TOGGLE_INDEX]).assertEqual(1);
      expect(next[SELECT_INDEX]).assertEqual(1);
      logInfo('testNdkRenderNodeParamTail0016 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0017
     * @tc.name      testNdkRenderNodeParamTail0017
     * @tc.desc      校验超出参数个数的下标修改被忽略，数组长度不变。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodeParamTail0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeParamTail0017 begin');
      const spec: SceneSpec = mixedScene();
      const defaults: number[] = ParamEngine.defaults(spec);
      const next: number[] = ParamEngine.withValue(spec, defaults, 9, 999);
      expect(next.length).assertEqual(3);
      expect(next[SELECT_INDEX]).assertEqual(1);
      expect(next.length > 9).assertFalse();
      logInfo('testNdkRenderNodeParamTail0017 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0018
     * @tc.name      testNdkRenderNodeParamTail0018
     * @tc.desc      校验单参数修改时下界被夹到区间端点，同参数其余值不受影响。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParamTail0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParamTail0018 begin');
      const spec: SceneSpec = mixedScene();
      const defaults: number[] = ParamEngine.defaults(spec);
      expect(ParamEngine.withValue(spec, defaults, RANGE_INDEX, -500)[RANGE_INDEX]).assertEqual(8);
      expect(ParamEngine.withValue(spec, defaults, RANGE_INDEX, 500)[RANGE_INDEX]).assertEqual(64);
      expect(ParamEngine.withValue(spec, defaults, RANGE_INDEX, 32)[RANGE_INDEX]).assertEqual(32);
      logInfo('testNdkRenderNodeParamTail0018 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0019
     * @tc.name      testNdkRenderNodeParamTail0019
     * @tc.desc      校验单参数修改不写回入参数组，连续两次修改互不干扰。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParamTail0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParamTail0019 begin');
      const spec: SceneSpec = mixedScene();
      const defaults: number[] = ParamEngine.defaults(spec);
      const first: number[] = ParamEngine.withValue(spec, defaults, RANGE_INDEX, 40);
      const second: number[] = ParamEngine.withValue(spec, defaults, TOGGLE_INDEX, 0);
      expect(defaults[RANGE_INDEX]).assertEqual(24);
      expect(first[TOGGLE_INDEX]).assertEqual(1);
      expect(second[RANGE_INDEX]).assertEqual(24);
      logInfo('testNdkRenderNodeParamTail0019 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_TAIL_0020
     * @tc.name      testNdkRenderNodeParamTail0020
     * @tc.desc      校验空数组归一化后按参数个数补齐默认值，长度与声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeParamTail0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeParamTail0020 begin');
      const spec: SceneSpec = mixedScene();
      const normalized: number[] = ParamEngine.normalize(spec, []);
      expect(normalized.length).assertEqual(spec.params.length);
      expect(normalized[RANGE_INDEX]).assertEqual(24);
      expect(normalized[SELECT_INDEX]).assertEqual(1);
      logInfo('testNdkRenderNodeParamTail0020 end');
    })
  })
}
