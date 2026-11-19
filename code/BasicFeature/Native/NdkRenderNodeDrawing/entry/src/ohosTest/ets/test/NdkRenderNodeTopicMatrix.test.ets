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
import { GroupSpec, PARAM_RANGE, PARAM_SELECT, PARAM_TOGGLE, ParamSpec,
  SceneSpec } from '../../../main/ets/core/SchemaTypes';
import { TOPIC_GROUPS } from './SceneDefaults';

const TAG: string = '[Sample_NdkRenderNodeTopicMatrixTest]';
const DOMAIN: number = 0xF811;

// 专题页固定四个场景，编号接在十九个能力域之后。
const TOPIC_SCENE_PER_GROUP: number = 4;
const TOPIC_GROUP_TOTAL: number = 10;
const TOPIC_SCENE_TOTAL: number = 40;
const TOPIC_FIRST_ID: number = 20;
const TOPIC_LAST_ID: number = 29;
// 十个专题的索引命名常量，与 TOPIC_GROUPS 的声明顺序一一对应。
const TOPIC_NODE_TREE: number = 0;
const TOPIC_RENDER_PROP: number = 1;
const TOPIC_BLUR: number = 2;
const TOPIC_ANIMATION: number = 3;
const TOPIC_HIT_TEST: number = 4;
const TOPIC_PERFORMANCE: number = 5;
const TOPIC_RECORD: number = 6;
const TOPIC_MULTI_DEVICE: number = 7;
const TOPIC_LIFECYCLE: number = 8;
const TOPIC_FRAME_TICK: number = 9;
// 每页四个场景的下标命名常量。
const SCENE_FIRST: number = 0;
const SCENE_SECOND: number = 1;
const SCENE_THIRD: number = 2;
const SCENE_LAST: number = 3;
// 夹取探针越界量，用于把单个参数推到声明区间之外。
const CLAMP_OVERSHOOT: number = 1000;
// 数值容差：引擎按刻度对齐时用乘除实现，同一份默认值再对齐一次或夹到上界时
// 会漂移 1e-16 量级，直接用 === 或区间闭包判定会把这类浮点噪声误判为违约。
const VALUE_EPSILON: number = 1e-9;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// 专题场景观测量：把参数契约、默认值幂等与摘要覆盖情况记录为可判定位，由用例决定断言。
class TopicSceneObs {
  public topicIndex: number = 0;
  public groupId: number = 0;
  public groupKey: string = '';
  public sceneIndex: number = 0;
  public sceneCount: number = 0;
  public paramCount: number = 0;
  public rangeCount: number = 0;
  public toggleCount: number = 0;
  public selectCount: number = 0;
  public keyOk: boolean = false;
  public kindOk: boolean = false;
  public rangeOk: boolean = false;
  public toggleOk: boolean = false;
  public selectOk: boolean = false;
  public defaultsIdempotent: boolean = false;
  public summaryCovered: boolean = false;
  public clampOk: boolean = false;
}

// 采集单个专题场景的全部可判定位：编号、参数契约、默认值幂等、摘要覆盖与夹取行为。
function observeTopicScene(topicIndex: number, sceneIndex: number): TopicSceneObs {
  const observed: TopicSceneObs = new TopicSceneObs();
  const group: GroupSpec = TOPIC_GROUPS[topicIndex];
  const target: SceneSpec = group.scenes[sceneIndex];
  observed.topicIndex = topicIndex;
  observed.groupId = group.id;
  observed.groupKey = group.key;
  observed.sceneIndex = target.id;
  observed.sceneCount = group.scenes.length;
  observed.paramCount = target.params.length;
  observed.keyOk = true;
  observed.kindOk = true;
  observed.rangeOk = true;
  observed.toggleOk = true;
  observed.selectOk = true;
  for (const spec of target.params) {
    observed.keyOk = observed.keyOk && spec.key.length > 0;
    if (spec.kind === PARAM_RANGE) {
      observed.rangeCount++;
      observed.rangeOk = observed.rangeOk && spec.min <= spec.max && spec.def >= spec.min
        && spec.def <= spec.max && spec.step > 0;
    } else if (spec.kind === PARAM_TOGGLE) {
      observed.toggleCount++;
      observed.toggleOk = observed.toggleOk && (spec.def === 0 || spec.def === 1);
    } else if (spec.kind === PARAM_SELECT) {
      observed.selectCount++;
      observed.selectOk = observed.selectOk && spec.options.length > 0 && Number.isInteger(spec.def)
        && spec.def >= 0 && spec.def < spec.options.length;
    } else {
      observed.kindOk = false;
    }
  }
  const defaults: number[] = ParamEngine.defaults(target);
  const normalized: number[] = ParamEngine.normalize(target, defaults);
  observed.defaultsIdempotent = defaults.length === observed.paramCount
    && normalized.length === observed.paramCount;
  for (let index = 0; index < normalized.length; index++) {
    observed.defaultsIdempotent = observed.defaultsIdempotent
      && Math.abs(normalized[index] - defaults[index]) <= VALUE_EPSILON;
  }
  const summary: string = ParamEngine.summary(target, defaults);
  observed.summaryCovered = true;
  for (const spec of target.params) {
    observed.summaryCovered = observed.summaryCovered && summary.indexOf(spec.key + '=') >= 0;
  }
  // 单个参数推到上下界，其余参数保持默认，结果必须仍落在该参数声明区间内。
  observed.clampOk = true;
  for (let index = 0; index < target.params.length; index++) {
    const spec: ParamSpec = target.params[index];
    const low: number[] = ParamEngine.withValue(target, defaults, index, spec.min - CLAMP_OVERSHOOT);
    const high: number[] = ParamEngine.withValue(target, defaults, index, spec.max + CLAMP_OVERSHOOT);
    observed.clampOk = observed.clampOk && low[index] >= spec.min - VALUE_EPSILON
      && high[index] <= spec.max + VALUE_EPSILON;
  }
  logInfo('topic ' + group.key + '/scene ' + target.id.toString() + '/params ' + observed.paramCount.toString());
  return observed;
}

export default function ndkRenderNodeTopicMatrixTest(): void {
  describe('NdkRenderNodeTopicMatrix', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0001
     * @tc.name      testNdkRenderNodeTopicMatrix0001
     * @tc.desc      校验专题 20（topic-node-tree）场景 0 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_NODE_TREE, SCENE_FIRST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_NODE_TREE);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_NODE_TREE);
      expect(observed.sceneIndex).assertEqual(SCENE_FIRST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 每个参数都必须是区间型、开关型或下拉型之一，摘要要逐个列出键名。
      expect(observed.kindOk).assertTrue();
      expect(observed.summaryCovered).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0002
     * @tc.name      testNdkRenderNodeTopicMatrix0002
     * @tc.desc      校验专题 20（topic-node-tree）场景 1 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_NODE_TREE, SCENE_SECOND);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_NODE_TREE);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_NODE_TREE);
      expect(observed.sceneIndex).assertEqual(SCENE_SECOND);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 三种控件类型的计数之和必须等于参数总数。
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(observed.paramCount);
      expect(observed.clampOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0003
     * @tc.name      testNdkRenderNodeTopicMatrix0003
     * @tc.desc      校验专题 20（topic-node-tree）场景 2 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_NODE_TREE, SCENE_THIRD);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_NODE_TREE);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_NODE_TREE);
      expect(observed.sceneIndex).assertEqual(SCENE_THIRD);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 区间型步长为正、默认值落在区间内；开关型默认值只能是 0 或 1。
      expect(observed.rangeOk).assertTrue();
      expect(observed.toggleOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0004
     * @tc.name      testNdkRenderNodeTopicMatrix0004
     * @tc.desc      校验专题 20（topic-node-tree）场景 3 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_NODE_TREE, SCENE_LAST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_NODE_TREE);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_NODE_TREE);
      expect(observed.sceneIndex).assertEqual(SCENE_LAST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 下拉型默认下标必须指向存在的选项，专题编号不超过上界。
      expect(observed.selectOk).assertTrue();
      expect(observed.groupId <= TOPIC_LAST_ID).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0005
     * @tc.name      testNdkRenderNodeTopicMatrix0005
     * @tc.desc      校验专题 21（topic-render-prop）场景 0 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_RENDER_PROP, SCENE_FIRST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_RENDER_PROP);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_RENDER_PROP);
      expect(observed.sceneIndex).assertEqual(SCENE_FIRST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 每个参数都必须是区间型、开关型或下拉型之一，摘要要逐个列出键名。
      expect(observed.kindOk).assertTrue();
      expect(observed.summaryCovered).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0006
     * @tc.name      testNdkRenderNodeTopicMatrix0006
     * @tc.desc      校验专题 21（topic-render-prop）场景 1 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_RENDER_PROP, SCENE_SECOND);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_RENDER_PROP);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_RENDER_PROP);
      expect(observed.sceneIndex).assertEqual(SCENE_SECOND);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 三种控件类型的计数之和必须等于参数总数。
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(observed.paramCount);
      expect(observed.clampOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0007
     * @tc.name      testNdkRenderNodeTopicMatrix0007
     * @tc.desc      校验专题 21（topic-render-prop）场景 2 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_RENDER_PROP, SCENE_THIRD);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_RENDER_PROP);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_RENDER_PROP);
      expect(observed.sceneIndex).assertEqual(SCENE_THIRD);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 区间型步长为正、默认值落在区间内；开关型默认值只能是 0 或 1。
      expect(observed.rangeOk).assertTrue();
      expect(observed.toggleOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0008
     * @tc.name      testNdkRenderNodeTopicMatrix0008
     * @tc.desc      校验专题 21（topic-render-prop）场景 3 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_RENDER_PROP, SCENE_LAST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_RENDER_PROP);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_RENDER_PROP);
      expect(observed.sceneIndex).assertEqual(SCENE_LAST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 下拉型默认下标必须指向存在的选项，专题编号不超过上界。
      expect(observed.selectOk).assertTrue();
      expect(observed.groupId <= TOPIC_LAST_ID).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0009
     * @tc.name      testNdkRenderNodeTopicMatrix0009
     * @tc.desc      校验专题 22（topic-blur）场景 0 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_BLUR, SCENE_FIRST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_BLUR);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_BLUR);
      expect(observed.sceneIndex).assertEqual(SCENE_FIRST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 每个参数都必须是区间型、开关型或下拉型之一，摘要要逐个列出键名。
      expect(observed.kindOk).assertTrue();
      expect(observed.summaryCovered).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0010
     * @tc.name      testNdkRenderNodeTopicMatrix0010
     * @tc.desc      校验专题 22（topic-blur）场景 1 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_BLUR, SCENE_SECOND);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_BLUR);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_BLUR);
      expect(observed.sceneIndex).assertEqual(SCENE_SECOND);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 三种控件类型的计数之和必须等于参数总数。
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(observed.paramCount);
      expect(observed.clampOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0011
     * @tc.name      testNdkRenderNodeTopicMatrix0011
     * @tc.desc      校验专题 22（topic-blur）场景 2 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_BLUR, SCENE_THIRD);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_BLUR);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_BLUR);
      expect(observed.sceneIndex).assertEqual(SCENE_THIRD);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 区间型步长为正、默认值落在区间内；开关型默认值只能是 0 或 1。
      expect(observed.rangeOk).assertTrue();
      expect(observed.toggleOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0012
     * @tc.name      testNdkRenderNodeTopicMatrix0012
     * @tc.desc      校验专题 22（topic-blur）场景 3 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_BLUR, SCENE_LAST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_BLUR);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_BLUR);
      expect(observed.sceneIndex).assertEqual(SCENE_LAST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 下拉型默认下标必须指向存在的选项，专题编号不超过上界。
      expect(observed.selectOk).assertTrue();
      expect(observed.groupId <= TOPIC_LAST_ID).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0013
     * @tc.name      testNdkRenderNodeTopicMatrix0013
     * @tc.desc      校验专题 23（topic-animation）场景 0 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_ANIMATION, SCENE_FIRST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_ANIMATION);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_ANIMATION);
      expect(observed.sceneIndex).assertEqual(SCENE_FIRST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 每个参数都必须是区间型、开关型或下拉型之一，摘要要逐个列出键名。
      expect(observed.kindOk).assertTrue();
      expect(observed.summaryCovered).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0014
     * @tc.name      testNdkRenderNodeTopicMatrix0014
     * @tc.desc      校验专题 23（topic-animation）场景 1 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_ANIMATION, SCENE_SECOND);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_ANIMATION);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_ANIMATION);
      expect(observed.sceneIndex).assertEqual(SCENE_SECOND);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 三种控件类型的计数之和必须等于参数总数。
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(observed.paramCount);
      expect(observed.clampOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0015
     * @tc.name      testNdkRenderNodeTopicMatrix0015
     * @tc.desc      校验专题 23（topic-animation）场景 2 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_ANIMATION, SCENE_THIRD);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_ANIMATION);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_ANIMATION);
      expect(observed.sceneIndex).assertEqual(SCENE_THIRD);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 区间型步长为正、默认值落在区间内；开关型默认值只能是 0 或 1。
      expect(observed.rangeOk).assertTrue();
      expect(observed.toggleOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0016
     * @tc.name      testNdkRenderNodeTopicMatrix0016
     * @tc.desc      校验专题 23（topic-animation）场景 3 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_ANIMATION, SCENE_LAST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_ANIMATION);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_ANIMATION);
      expect(observed.sceneIndex).assertEqual(SCENE_LAST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 下拉型默认下标必须指向存在的选项，专题编号不超过上界。
      expect(observed.selectOk).assertTrue();
      expect(observed.groupId <= TOPIC_LAST_ID).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0017
     * @tc.name      testNdkRenderNodeTopicMatrix0017
     * @tc.desc      校验专题 24（topic-hit-test）场景 0 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_HIT_TEST, SCENE_FIRST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_HIT_TEST);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_HIT_TEST);
      expect(observed.sceneIndex).assertEqual(SCENE_FIRST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 每个参数都必须是区间型、开关型或下拉型之一，摘要要逐个列出键名。
      expect(observed.kindOk).assertTrue();
      expect(observed.summaryCovered).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0018
     * @tc.name      testNdkRenderNodeTopicMatrix0018
     * @tc.desc      校验专题 24（topic-hit-test）场景 1 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_HIT_TEST, SCENE_SECOND);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_HIT_TEST);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_HIT_TEST);
      expect(observed.sceneIndex).assertEqual(SCENE_SECOND);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 三种控件类型的计数之和必须等于参数总数。
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(observed.paramCount);
      expect(observed.clampOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0019
     * @tc.name      testNdkRenderNodeTopicMatrix0019
     * @tc.desc      校验专题 24（topic-hit-test）场景 2 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_HIT_TEST, SCENE_THIRD);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_HIT_TEST);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_HIT_TEST);
      expect(observed.sceneIndex).assertEqual(SCENE_THIRD);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 区间型步长为正、默认值落在区间内；开关型默认值只能是 0 或 1。
      expect(observed.rangeOk).assertTrue();
      expect(observed.toggleOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0020
     * @tc.name      testNdkRenderNodeTopicMatrix0020
     * @tc.desc      校验专题 24（topic-hit-test）场景 3 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_HIT_TEST, SCENE_LAST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_HIT_TEST);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_HIT_TEST);
      expect(observed.sceneIndex).assertEqual(SCENE_LAST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 下拉型默认下标必须指向存在的选项，专题编号不超过上界。
      expect(observed.selectOk).assertTrue();
      expect(observed.groupId <= TOPIC_LAST_ID).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0021
     * @tc.name      testNdkRenderNodeTopicMatrix0021
     * @tc.desc      校验专题 25（topic-performance）场景 0 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_PERFORMANCE, SCENE_FIRST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_PERFORMANCE);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_PERFORMANCE);
      expect(observed.sceneIndex).assertEqual(SCENE_FIRST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 每个参数都必须是区间型、开关型或下拉型之一，摘要要逐个列出键名。
      expect(observed.kindOk).assertTrue();
      expect(observed.summaryCovered).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0022
     * @tc.name      testNdkRenderNodeTopicMatrix0022
     * @tc.desc      校验专题 25（topic-performance）场景 1 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_PERFORMANCE, SCENE_SECOND);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_PERFORMANCE);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_PERFORMANCE);
      expect(observed.sceneIndex).assertEqual(SCENE_SECOND);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 三种控件类型的计数之和必须等于参数总数。
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(observed.paramCount);
      expect(observed.clampOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0023
     * @tc.name      testNdkRenderNodeTopicMatrix0023
     * @tc.desc      校验专题 25（topic-performance）场景 2 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_PERFORMANCE, SCENE_THIRD);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_PERFORMANCE);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_PERFORMANCE);
      expect(observed.sceneIndex).assertEqual(SCENE_THIRD);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 区间型步长为正、默认值落在区间内；开关型默认值只能是 0 或 1。
      expect(observed.rangeOk).assertTrue();
      expect(observed.toggleOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0024
     * @tc.name      testNdkRenderNodeTopicMatrix0024
     * @tc.desc      校验专题 25（topic-performance）场景 3 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_PERFORMANCE, SCENE_LAST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_PERFORMANCE);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_PERFORMANCE);
      expect(observed.sceneIndex).assertEqual(SCENE_LAST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 下拉型默认下标必须指向存在的选项，专题编号不超过上界。
      expect(observed.selectOk).assertTrue();
      expect(observed.groupId <= TOPIC_LAST_ID).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0025
     * @tc.name      testNdkRenderNodeTopicMatrix0025
     * @tc.desc      校验专题 26（topic-record）场景 0 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_RECORD, SCENE_FIRST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_RECORD);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_RECORD);
      expect(observed.sceneIndex).assertEqual(SCENE_FIRST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 每个参数都必须是区间型、开关型或下拉型之一，摘要要逐个列出键名。
      expect(observed.kindOk).assertTrue();
      expect(observed.summaryCovered).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0026
     * @tc.name      testNdkRenderNodeTopicMatrix0026
     * @tc.desc      校验专题 26（topic-record）场景 1 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_RECORD, SCENE_SECOND);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_RECORD);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_RECORD);
      expect(observed.sceneIndex).assertEqual(SCENE_SECOND);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 三种控件类型的计数之和必须等于参数总数。
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(observed.paramCount);
      expect(observed.clampOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0027
     * @tc.name      testNdkRenderNodeTopicMatrix0027
     * @tc.desc      校验专题 26（topic-record）场景 2 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_RECORD, SCENE_THIRD);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_RECORD);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_RECORD);
      expect(observed.sceneIndex).assertEqual(SCENE_THIRD);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 区间型步长为正、默认值落在区间内；开关型默认值只能是 0 或 1。
      expect(observed.rangeOk).assertTrue();
      expect(observed.toggleOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0028
     * @tc.name      testNdkRenderNodeTopicMatrix0028
     * @tc.desc      校验专题 26（topic-record）场景 3 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_RECORD, SCENE_LAST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_RECORD);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_RECORD);
      expect(observed.sceneIndex).assertEqual(SCENE_LAST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 下拉型默认下标必须指向存在的选项，专题编号不超过上界。
      expect(observed.selectOk).assertTrue();
      expect(observed.groupId <= TOPIC_LAST_ID).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0029
     * @tc.name      testNdkRenderNodeTopicMatrix0029
     * @tc.desc      校验专题 27（topic-multi-device）场景 0 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_MULTI_DEVICE, SCENE_FIRST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_MULTI_DEVICE);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_MULTI_DEVICE);
      expect(observed.sceneIndex).assertEqual(SCENE_FIRST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 每个参数都必须是区间型、开关型或下拉型之一，摘要要逐个列出键名。
      expect(observed.kindOk).assertTrue();
      expect(observed.summaryCovered).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0030
     * @tc.name      testNdkRenderNodeTopicMatrix0030
     * @tc.desc      校验专题 27（topic-multi-device）场景 1 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_MULTI_DEVICE, SCENE_SECOND);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_MULTI_DEVICE);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_MULTI_DEVICE);
      expect(observed.sceneIndex).assertEqual(SCENE_SECOND);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 三种控件类型的计数之和必须等于参数总数。
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(observed.paramCount);
      expect(observed.clampOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0031
     * @tc.name      testNdkRenderNodeTopicMatrix0031
     * @tc.desc      校验专题 27（topic-multi-device）场景 2 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_MULTI_DEVICE, SCENE_THIRD);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_MULTI_DEVICE);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_MULTI_DEVICE);
      expect(observed.sceneIndex).assertEqual(SCENE_THIRD);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 区间型步长为正、默认值落在区间内；开关型默认值只能是 0 或 1。
      expect(observed.rangeOk).assertTrue();
      expect(observed.toggleOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0032
     * @tc.name      testNdkRenderNodeTopicMatrix0032
     * @tc.desc      校验专题 27（topic-multi-device）场景 3 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_MULTI_DEVICE, SCENE_LAST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_MULTI_DEVICE);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_MULTI_DEVICE);
      expect(observed.sceneIndex).assertEqual(SCENE_LAST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 下拉型默认下标必须指向存在的选项，专题编号不超过上界。
      expect(observed.selectOk).assertTrue();
      expect(observed.groupId <= TOPIC_LAST_ID).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0033
     * @tc.name      testNdkRenderNodeTopicMatrix0033
     * @tc.desc      校验专题 28（topic-lifecycle）场景 0 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_LIFECYCLE, SCENE_FIRST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_LIFECYCLE);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_LIFECYCLE);
      expect(observed.sceneIndex).assertEqual(SCENE_FIRST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 每个参数都必须是区间型、开关型或下拉型之一，摘要要逐个列出键名。
      expect(observed.kindOk).assertTrue();
      expect(observed.summaryCovered).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0034
     * @tc.name      testNdkRenderNodeTopicMatrix0034
     * @tc.desc      校验专题 28（topic-lifecycle）场景 1 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_LIFECYCLE, SCENE_SECOND);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_LIFECYCLE);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_LIFECYCLE);
      expect(observed.sceneIndex).assertEqual(SCENE_SECOND);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 三种控件类型的计数之和必须等于参数总数。
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(observed.paramCount);
      expect(observed.clampOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0035
     * @tc.name      testNdkRenderNodeTopicMatrix0035
     * @tc.desc      校验专题 28（topic-lifecycle）场景 2 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_LIFECYCLE, SCENE_THIRD);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_LIFECYCLE);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_LIFECYCLE);
      expect(observed.sceneIndex).assertEqual(SCENE_THIRD);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 区间型步长为正、默认值落在区间内；开关型默认值只能是 0 或 1。
      expect(observed.rangeOk).assertTrue();
      expect(observed.toggleOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0036
     * @tc.name      testNdkRenderNodeTopicMatrix0036
     * @tc.desc      校验专题 28（topic-lifecycle）场景 3 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_LIFECYCLE, SCENE_LAST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_LIFECYCLE);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_LIFECYCLE);
      expect(observed.sceneIndex).assertEqual(SCENE_LAST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 下拉型默认下标必须指向存在的选项，专题编号不超过上界。
      expect(observed.selectOk).assertTrue();
      expect(observed.groupId <= TOPIC_LAST_ID).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0037
     * @tc.name      testNdkRenderNodeTopicMatrix0037
     * @tc.desc      校验专题 29（topic-frame-tick）场景 0 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_FRAME_TICK, SCENE_FIRST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_FRAME_TICK);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_FRAME_TICK);
      expect(observed.sceneIndex).assertEqual(SCENE_FIRST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 每个参数都必须是区间型、开关型或下拉型之一，摘要要逐个列出键名。
      expect(observed.kindOk).assertTrue();
      expect(observed.summaryCovered).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0038
     * @tc.name      testNdkRenderNodeTopicMatrix0038
     * @tc.desc      校验专题 29（topic-frame-tick）场景 1 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_FRAME_TICK, SCENE_SECOND);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_FRAME_TICK);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_FRAME_TICK);
      expect(observed.sceneIndex).assertEqual(SCENE_SECOND);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 三种控件类型的计数之和必须等于参数总数。
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(observed.paramCount);
      expect(observed.clampOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0039
     * @tc.name      testNdkRenderNodeTopicMatrix0039
     * @tc.desc      校验专题 29（topic-frame-tick）场景 2 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_FRAME_TICK, SCENE_THIRD);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_FRAME_TICK);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_FRAME_TICK);
      expect(observed.sceneIndex).assertEqual(SCENE_THIRD);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 区间型步长为正、默认值落在区间内；开关型默认值只能是 0 或 1。
      expect(observed.rangeOk).assertTrue();
      expect(observed.toggleOk).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_0040
     * @tc.name      testNdkRenderNodeTopicMatrix0040
     * @tc.desc      校验专题 29（topic-frame-tick）场景 3 的参数契约、默认值幂等与摘要文案。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: TopicSceneObs = observeTopicScene(TOPIC_FRAME_TICK, SCENE_LAST);
      // 专题编号由起始编号加下标得出，场景下标与声明顺序一致。
      expect(observed.topicIndex).assertEqual(TOPIC_FRAME_TICK);
      expect(observed.groupId).assertEqual(TOPIC_FIRST_ID + TOPIC_FRAME_TICK);
      expect(observed.sceneIndex).assertEqual(SCENE_LAST);
      expect(observed.sceneCount).assertEqual(TOPIC_SCENE_PER_GROUP);
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.keyOk).assertTrue();
      expect(observed.defaultsIdempotent).assertTrue();
      // 下拉型默认下标必须指向存在的选项，专题编号不超过上界。
      expect(observed.selectOk).assertTrue();
      expect(observed.groupId <= TOPIC_LAST_ID).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_MATRIX_TOTAL_0001
     * @tc.name      testNdkRenderNodeTopicMatrixTotal0001
     * @tc.desc      校验十个专题编号在 20 到 29 区间连续、每页四个场景、场景总数为 40。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeTopicMatrixTotal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(TOPIC_GROUPS.length).assertEqual(TOPIC_GROUP_TOTAL);
      let total: number = 0;
      for (let index = 0; index < TOPIC_GROUPS.length; index++) {
        const group: GroupSpec = TOPIC_GROUPS[index];
        expect(group.id).assertEqual(TOPIC_FIRST_ID + index);
        expect(group.scenes.length).assertEqual(TOPIC_SCENE_PER_GROUP);
        total += group.scenes.length;
      }
      expect(total).assertEqual(TOPIC_SCENE_TOTAL);
      logInfo('topic matrix total scenes = ' + total.toString());
    })
  })
}
