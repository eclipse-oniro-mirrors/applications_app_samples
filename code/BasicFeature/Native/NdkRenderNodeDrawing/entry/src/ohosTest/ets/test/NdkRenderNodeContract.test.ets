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
import { PARAM_RANGE, PARAM_SELECT, PARAM_TOGGLE, ParamSpec, rangeParam, SceneSpec, SceneText, scene,
  selectParam, toggleParam } from '../../../main/ets/core/SchemaTypes';
import { ParamEngine } from '../../../main/ets/core/ParamEngine';
import { CANVAS_GROUP } from '../../../main/ets/schema/CapabilityCanvas';

const TAG: string = '[Sample_NdkRenderNodeContractTest]';
const DOMAIN: number = 0xF811;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function ndkRenderNodeContractTest(): void {
  describe('NdkRenderNodeContract', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_CONTRACT_0001
     * @tc.name      testNdkRenderNodeContract0001
     * @tc.desc      校验滑杆参数按声明顺序取默认值，默认值数量与参数个数一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeContract0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeContract0001 begin');
      const spec: SceneSpec = scene(3, 'Probe', 'probe scene', [
        rangeParam('a', 'vp', 10, 0, 20, 5),
        rangeParam('b', '%', 50, 0, 100, 5)
      ]);
      const values: number[] = ParamEngine.defaults(spec);
      logInfo('defaults = ' + values.join(','));
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(10);
      expect(values[1]).assertEqual(50);
      logInfo('testNdkRenderNodeContract0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CONTRACT_0002
     * @tc.name      testNdkRenderNodeContract0002
     * @tc.desc      校验滑杆按步长对齐到最近刻度，并对超界输入做上下界裁剪。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeContract0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeContract0002 begin');
      const spec: ParamSpec = rangeParam('spacing', 'vp', 24, 8, 64, 4);
      logInfo('clamp(23) = ' + ParamEngine.clamp(spec, 23).toString());
      expect(ParamEngine.clamp(spec, 23)).assertEqual(24);
      expect(ParamEngine.clamp(spec, -5)).assertEqual(8);
      expect(ParamEngine.clamp(spec, 999)).assertEqual(64);
      logInfo('testNdkRenderNodeContract0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CONTRACT_0003
     * @tc.name      testNdkRenderNodeContract0003
     * @tc.desc      校验开关参数被规整为 0/1，下拉参数被规整为整数下标。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeContract0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeContract0003 begin');
      const toggle: ParamSpec = toggleParam('enabled', true);
      expect(toggle.kind).assertEqual(PARAM_TOGGLE);
      expect(ParamEngine.clamp(toggle, 0.9)).assertEqual(1);
      expect(ParamEngine.clamp(toggle, 0.1)).assertEqual(0);
      const select: ParamSpec = selectParam('palette', 1, ['blue', 'amber', 'green']);
      expect(select.kind).assertEqual(PARAM_SELECT);
      expect(select.max).assertEqual(2);
      expect(ParamEngine.clamp(select, -3)).assertEqual(0);
      expect(ParamEngine.clamp(select, 9)).assertEqual(2);
      logInfo('testNdkRenderNodeContract0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CONTRACT_0004
     * @tc.name      testNdkRenderNodeContract0004
     * @tc.desc      校验参数归一化会补齐缺失项并按声明顺序输出，长度始终与参数声明一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeContract0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeContract0004 begin');
      const spec: SceneSpec = scene(0, 'Normalize', 'probe', [
        rangeParam('first', '', 10, 0, 100, 10),
        rangeParam('second', '', 20, 0, 100, 10)
      ]);
      const short: number[] = ParamEngine.normalize(spec, [30]);
      logInfo('normalize([30]) = ' + short.join(','));
      expect(short.length).assertEqual(2);
      expect(short[0]).assertEqual(30);
      expect(short[1]).assertEqual(20);
      const overflow: number[] = ParamEngine.normalize(spec, [500, -100, 70]);
      expect(overflow.length).assertEqual(2);
      expect(overflow[0]).assertEqual(100);
      expect(overflow[1]).assertEqual(0);
      logInfo('testNdkRenderNodeContract0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CONTRACT_0005
     * @tc.name      testNdkRenderNodeContract0005
     * @tc.desc      校验画布能力域的 schema 声明与 native 侧编号一致，包含 10 个场景，文案均为资源引用。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeContract0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodeContract0005 begin');
      expect(CANVAS_GROUP.id).assertEqual(1);
      expect(CANVAS_GROUP.key).assertEqual('canvas');
      expect(CANVAS_GROUP.scenes.length).assertEqual(10);
      expect(CANVAS_GROUP.scenes[0].params[0].key).assertEqual('palette');
      // 生产 schema 的标题与说明一律来自 $r 资源，不再持有硬编码英文字面量。
      const title: SceneText = CANVAS_GROUP.scenes[0].title;
      const desc: SceneText = CANVAS_GROUP.scenes[0].desc;
      expect(typeof title === 'string').assertFalse();
      expect(typeof desc === 'string').assertFalse();
      expect((title as Resource).id > 0).assertTrue();
      expect((desc as Resource).id > 0).assertTrue();
      expect(PARAM_RANGE).assertEqual(0);
      logInfo('testNdkRenderNodeContract0005 end');
    })
  })
}
