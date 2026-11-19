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
import { Driver } from '@kit.TestKit';
import {
  backToIndex,
  clickId,
  clickScene,
  collectTexts,
  countId,
  countType,
  groupDescId,
  groupTitleId,
  ID_TOPIC_CATALOG_PAGE_TITLE,
  logInfo,
  navBackId,
  openTopicCatalog,
  openTopicGroup,
  paramsReapplyId,
  paramsResetId,
  paramsTitleId,
  sceneDescId,
  waitForId
} from './UiDriverUtil';
import { GroupSpec, PARAM_RANGE, PARAM_SELECT, PARAM_TOGGLE, SceneSpec } from '../../../main/ets/core/SchemaTypes';
import { TOPIC_GROUPS } from './SceneDefaults';

const TAG: string = '[Sample_NdkRenderNodeTopicFlowTest]';
// 专题页面上除场景按钮之外的三个按钮：返回、重新下发与重置。
const EXTRA_BUTTONS: number = 3;
const TOPIC_TOTAL: number = 10;
const SCENE_PER_TOPIC: number = 4;
// 重新下发按钮的点击轮次。
const REAPPLY_ROUNDS: number = 3;
// 每个专题的首场景下标。
const SCENE_FIRST: number = 0;
// 专题页只应出现一条带四个计数器的状态栏。
const SINGLE_STATUS: number = 1;
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

// 统计场景参数中某类控件的个数，用于和页面实际渲染的控件个数比对。
function countKind(spec: SceneSpec, kind: number): number {
  let count: number = 0;
  for (let index = 0; index < spec.params.length; index++) {
    if (spec.params[index].kind === kind) {
      count += 1;
    }
  }
  return count;
}

// 专题页状态栏由 TopicEngine 结果与四个计数器拼接而成，这里只校验计数器格式存在。
function counterStatus(texts: string[]): string[] {
  const matched: string[] = [];
  for (const text of texts) {
    if (text.indexOf(' · nodes ') >= 0 && text.indexOf(' · draws ') >= 0 &&
      text.indexOf(' · touches ') >= 0 && text.indexOf(' · rebuilds ') >= 0) {
      matched.push(text);
    }
  }
  return matched;
}

// 从专题目录页进入指定专题页面，全程按 group.key 定位，不依赖界面文案。
async function openTopic(driver: Driver, group: GroupSpec): Promise<boolean> {
  if (!await openTopicCatalog(driver, TAG)) {
    return false;
  }
  return await openTopicGroup(driver, group.key, TAG);
}

// 专题页返回专题目录页：按返回按钮 id 点击，再等待目录页标题出现。
async function backToTopicCatalog(driver: Driver, groupKey: string): Promise<boolean> {
  if (!await clickId(driver, navBackId(groupKey), TAG)) {
    return false;
  }
  return await waitForId(driver, ID_TOPIC_CATALOG_PAGE_TITLE, TAG);
}

// 专题场景巡检的观测量：说明、控件匹配情况与状态栏计数器数量。
class TopicSweepObs {
  public groupKey: string = '';
  public sceneCount: number = 0;
  public sweptCount: number = 0;
  public descMatched: number = 0;
  public controlMatched: number = 0;
  public statusCount: number = 0;
  public opened: boolean = false;
  public returnedToCatalog: boolean = false;
  public returnedToIndex: boolean = false;
}

// 逐个切换专题的全部场景：场景说明与三类参数控件都要随 schema 刷新，状态栏保留计数器。
async function sweepTopicScenes(driver: Driver, index: number): Promise<TopicSweepObs> {
  const observed: TopicSweepObs = new TopicSweepObs();
  const group: GroupSpec = TOPIC_GROUPS[index];
  observed.groupKey = group.key;
  observed.sceneCount = group.scenes.length;
  observed.opened = await openTopic(driver, group);
  expect(observed.opened).assertTrue();
  for (const spec of group.scenes) {
    expect(await clickScene(driver, group.key, spec.id, TAG)).assertTrue();
    const descReady: boolean = await waitForId(driver, sceneDescId(group.key, spec.id), TAG);
    expect(descReady).assertTrue();
    if (descReady) {
      observed.descMatched += 1;
    }
    const sliderMatched: boolean = await countType(driver, 'Slider', TAG) === countKind(spec, PARAM_RANGE);
    const toggleMatched: boolean = await countType(driver, 'Toggle', TAG) === countKind(spec, PARAM_TOGGLE);
    const selectMatched: boolean = await countType(driver, 'Select', TAG) === countKind(spec, PARAM_SELECT);
    expect(sliderMatched).assertTrue();
    expect(toggleMatched).assertTrue();
    expect(selectMatched).assertTrue();
    if (sliderMatched && toggleMatched && selectMatched) {
      observed.controlMatched += 1;
    }
    observed.sweptCount += 1;
  }
  logInfo(TAG, 'topic ' + group.key + ' swept ' + observed.sweptCount.toString() + ' scenes');
  expect(observed.sweptCount).assertEqual(SCENE_PER_TOPIC);
  observed.statusCount = counterStatus(await collectTexts(driver, TAG)).length;
  logInfo(TAG, 'topic ' + group.key + ' counter status count = ' + observed.statusCount.toString());
  expect(observed.statusCount).assertEqual(SINGLE_STATUS);
  observed.returnedToCatalog = await backToTopicCatalog(driver, group.key);
  expect(observed.returnedToCatalog).assertTrue();
  observed.returnedToIndex = await backToIndex(driver, TAG);
  expect(observed.returnedToIndex).assertTrue();
  return observed;
}

// 重新下发与重置流程的观测量：按钮规模、重发轮次与重置后面板稳定性。
class TopicFlowObs {
  public groupKey: string = '';
  public sceneCount: number = 0;
  public buttonCount: number = 0;
  public reapplyRounds: number = 0;
  public firstSceneId: number = -1;
  public lastSceneId: number = -1;
  public initialStatusCount: number = 0;
  public finalStatusCount: number = 0;
  public resetStable: boolean = false;
  public returnedToCatalog: boolean = false;
  public returnedToIndex: boolean = false;
}

// 重新下发与重置流程：重新下发不改变场景与参数，重置后面板回到当前场景默认参数。
async function verifyTopicFlow(driver: Driver, index: number): Promise<TopicFlowObs> {
  const observed: TopicFlowObs = new TopicFlowObs();
  const group: GroupSpec = TOPIC_GROUPS[index];
  observed.groupKey = group.key;
  observed.sceneCount = group.scenes.length;
  expect(await openTopic(driver, group)).assertTrue();
  observed.buttonCount = await countType(driver, 'Button', TAG);
  expect(observed.buttonCount).assertEqual(group.scenes.length + EXTRA_BUTTONS);
  expect(await countId(driver, paramsTitleId(group.key), TAG)).assertEqual(1);
  expect(await countId(driver, paramsReapplyId(group.key), TAG)).assertEqual(1);
  expect(await countId(driver, paramsResetId(group.key), TAG)).assertEqual(1);
  expect(await countId(driver, navBackId(group.key), TAG)).assertEqual(1);
  expect(await countId(driver, groupTitleId(group.key), TAG)).assertEqual(1);
  expect(await countId(driver, groupDescId(group.key), TAG)).assertEqual(1);
  const first: SceneSpec = group.scenes[0];
  const last: SceneSpec = group.scenes[group.scenes.length - 1];
  observed.firstSceneId = first.id;
  observed.lastSceneId = last.id;
  observed.initialStatusCount = counterStatus(await collectTexts(driver, TAG)).length;
  expect(observed.initialStatusCount).assertEqual(SINGLE_STATUS);
  for (let round = 0; round < REAPPLY_ROUNDS; round++) {
    expect(await clickId(driver, paramsReapplyId(group.key), TAG)).assertTrue();
    expect(await waitForId(driver, sceneDescId(group.key, first.id), TAG)).assertTrue();
    observed.reapplyRounds += 1;
  }
  expect(counterStatus(await collectTexts(driver, TAG)).length).assertEqual(SINGLE_STATUS);
  // 切到末场景后重置：场景不变，参数回到默认，面板控件数量与末场景 schema 一致。
  expect(await clickScene(driver, group.key, last.id, TAG)).assertTrue();
  expect(await waitForId(driver, sceneDescId(group.key, last.id), TAG)).assertTrue();
  expect(await clickId(driver, paramsResetId(group.key), TAG)).assertTrue();
  const lastDescCount: number = await countId(driver, sceneDescId(group.key, last.id), TAG);
  const sliderMatched: boolean = await countType(driver, 'Slider', TAG) === countKind(last, PARAM_RANGE);
  const toggleMatched: boolean = await countType(driver, 'Toggle', TAG) === countKind(last, PARAM_TOGGLE);
  const selectMatched: boolean = await countType(driver, 'Select', TAG) === countKind(last, PARAM_SELECT);
  expect(lastDescCount).assertEqual(1);
  expect(sliderMatched).assertTrue();
  expect(toggleMatched).assertTrue();
  expect(selectMatched).assertTrue();
  observed.resetStable = lastDescCount === 1 && sliderMatched && toggleMatched && selectMatched;
  observed.finalStatusCount = counterStatus(await collectTexts(driver, TAG)).length;
  expect(observed.finalStatusCount).assertEqual(SINGLE_STATUS);
  observed.returnedToCatalog = await backToTopicCatalog(driver, group.key);
  expect(observed.returnedToCatalog).assertTrue();
  observed.returnedToIndex = await backToIndex(driver, TAG);
  expect(observed.returnedToIndex).assertTrue();
  return observed;
}

export default function ndkRenderNodeTopicFlowTest(): void {
  describe('NdkRenderNodeTopicFlow', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0001
     * @tc.name      testNdkRenderNodeTopicFlow0001
     * @tc.desc      校验节点树专题四个场景逐个切换后说明与参数控件随 schema 刷新，状态栏保留四个计数器。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeTopicFlow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0001 begin');
      expect(TOPIC_GROUPS.length).assertEqual(TOPIC_TOTAL);
      const observed: TopicSweepObs = await sweepTopicScenes(Driver.create(), TOPIC_NODE_TREE);
      // 四个场景逐个切换后说明与控件随 schema 刷新，状态栏计数器始终唯一。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertEqual(SCENE_PER_TOPIC);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.statusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0002
     * @tc.name      testNdkRenderNodeTopicFlow0002
     * @tc.desc      校验节点树专题重新下发三次后说明不变，切末场景重置后面板控件数量与该场景 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeTopicFlow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0002 begin');
      const observed: TopicFlowObs = await verifyTopicFlow(Driver.create(), TOPIC_NODE_TREE);
      // 按钮规模为场景数加返回、重新下发与重置三个工具按钮。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.reapplyRounds).assertEqual(REAPPLY_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetStable).assertTrue();
      expect(observed.initialStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.finalStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0003
     * @tc.name      testNdkRenderNodeTopicFlow0003
     * @tc.desc      校验渲染属性专题四个场景逐个切换后说明与参数控件随 schema 刷新，状态栏保留四个计数器。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicFlow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0003 begin');
      const observed: TopicSweepObs = await sweepTopicScenes(Driver.create(), TOPIC_RENDER_PROP);
      // 四个场景逐个切换后说明与控件随 schema 刷新，状态栏计数器始终唯一。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertEqual(SCENE_PER_TOPIC);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.statusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0004
     * @tc.name      testNdkRenderNodeTopicFlow0004
     * @tc.desc      校验渲染属性专题重新下发三次后说明不变，切末场景重置后面板控件数量与该场景 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicFlow0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0004 begin');
      const observed: TopicFlowObs = await verifyTopicFlow(Driver.create(), TOPIC_RENDER_PROP);
      // 按钮规模为场景数加返回、重新下发与重置三个工具按钮。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.reapplyRounds).assertEqual(REAPPLY_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetStable).assertTrue();
      expect(observed.initialStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.finalStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0005
     * @tc.name      testNdkRenderNodeTopicFlow0005
     * @tc.desc      校验模糊专题四个场景逐个切换后说明与参数控件随 schema 刷新，状态栏保留四个计数器。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicFlow0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0005 begin');
      const observed: TopicSweepObs = await sweepTopicScenes(Driver.create(), TOPIC_BLUR);
      // 四个场景逐个切换后说明与控件随 schema 刷新，状态栏计数器始终唯一。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertEqual(SCENE_PER_TOPIC);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.statusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0006
     * @tc.name      testNdkRenderNodeTopicFlow0006
     * @tc.desc      校验模糊专题重新下发三次后说明不变，切末场景重置后面板控件数量与该场景 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicFlow0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0006 begin');
      const observed: TopicFlowObs = await verifyTopicFlow(Driver.create(), TOPIC_BLUR);
      // 按钮规模为场景数加返回、重新下发与重置三个工具按钮。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.reapplyRounds).assertEqual(REAPPLY_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetStable).assertTrue();
      expect(observed.initialStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.finalStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0006 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0007
     * @tc.name      testNdkRenderNodeTopicFlow0007
     * @tc.desc      校验动画专题四个场景逐个切换后说明与参数控件随 schema 刷新，状态栏保留四个计数器。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicFlow0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0007 begin');
      const observed: TopicSweepObs = await sweepTopicScenes(Driver.create(), TOPIC_LIFECYCLE);
      // 四个场景逐个切换后说明与控件随 schema 刷新，状态栏计数器始终唯一。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertEqual(SCENE_PER_TOPIC);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.statusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0007 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0008
     * @tc.name      testNdkRenderNodeTopicFlow0008
     * @tc.desc      校验动画专题重新下发三次后说明不变，切末场景重置后面板控件数量与该场景 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicFlow0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0008 begin');
      const observed: TopicFlowObs = await verifyTopicFlow(Driver.create(), TOPIC_LIFECYCLE);
      // 按钮规模为场景数加返回、重新下发与重置三个工具按钮。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.reapplyRounds).assertEqual(REAPPLY_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetStable).assertTrue();
      expect(observed.initialStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.finalStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0008 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0009
     * @tc.name      testNdkRenderNodeTopicFlow0009
     * @tc.desc      校验命中测试专题四个场景逐个切换后说明与参数控件随 schema 刷新，状态栏保留四个计数器。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicFlow0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0009 begin');
      const observed: TopicSweepObs = await sweepTopicScenes(Driver.create(), TOPIC_HIT_TEST);
      // 四个场景逐个切换后说明与控件随 schema 刷新，状态栏计数器始终唯一。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertEqual(SCENE_PER_TOPIC);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.statusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0009 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0010
     * @tc.name      testNdkRenderNodeTopicFlow0010
     * @tc.desc      校验命中测试专题重新下发三次后说明不变，切末场景重置后面板控件数量与该场景 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicFlow0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0010 begin');
      const observed: TopicFlowObs = await verifyTopicFlow(Driver.create(), TOPIC_HIT_TEST);
      // 按钮规模为场景数加返回、重新下发与重置三个工具按钮。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.reapplyRounds).assertEqual(REAPPLY_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetStable).assertTrue();
      expect(observed.initialStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.finalStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0010 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0011
     * @tc.name      testNdkRenderNodeTopicFlow0011
     * @tc.desc      校验性能专题四个场景逐个切换后说明与参数控件随 schema 刷新，状态栏保留四个计数器。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicFlow0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0011 begin');
      const observed: TopicSweepObs = await sweepTopicScenes(Driver.create(), TOPIC_ANIMATION);
      // 四个场景逐个切换后说明与控件随 schema 刷新，状态栏计数器始终唯一。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertEqual(SCENE_PER_TOPIC);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.statusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0011 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0012
     * @tc.name      testNdkRenderNodeTopicFlow0012
     * @tc.desc      校验性能专题重新下发三次后说明不变，切末场景重置后面板控件数量与该场景 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicFlow0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0012 begin');
      const observed: TopicFlowObs = await verifyTopicFlow(Driver.create(), TOPIC_ANIMATION);
      // 按钮规模为场景数加返回、重新下发与重置三个工具按钮。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.reapplyRounds).assertEqual(REAPPLY_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetStable).assertTrue();
      expect(observed.initialStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.finalStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0012 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0013
     * @tc.name      testNdkRenderNodeTopicFlow0013
     * @tc.desc      校验录制重放专题四个场景逐个切换后说明与参数控件随 schema 刷新，状态栏保留四个计数器。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicFlow0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0013 begin');
      const observed: TopicSweepObs = await sweepTopicScenes(Driver.create(), TOPIC_MULTI_DEVICE);
      // 四个场景逐个切换后说明与控件随 schema 刷新，状态栏计数器始终唯一。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertEqual(SCENE_PER_TOPIC);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.statusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0013 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0014
     * @tc.name      testNdkRenderNodeTopicFlow0014
     * @tc.desc      校验录制重放专题重新下发三次后说明不变，切末场景重置后面板控件数量与该场景 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicFlow0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0014 begin');
      const observed: TopicFlowObs = await verifyTopicFlow(Driver.create(), TOPIC_MULTI_DEVICE);
      // 按钮规模为场景数加返回、重新下发与重置三个工具按钮。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.reapplyRounds).assertEqual(REAPPLY_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetStable).assertTrue();
      expect(observed.initialStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.finalStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0014 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0015
     * @tc.name      testNdkRenderNodeTopicFlow0015
     * @tc.desc      校验多设备专题四个场景逐个切换后说明与参数控件随 schema 刷新，状态栏保留四个计数器。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicFlow0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0015 begin');
      const observed: TopicSweepObs = await sweepTopicScenes(Driver.create(), TOPIC_PERFORMANCE);
      // 四个场景逐个切换后说明与控件随 schema 刷新，状态栏计数器始终唯一。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertEqual(SCENE_PER_TOPIC);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.statusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0015 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0016
     * @tc.name      testNdkRenderNodeTopicFlow0016
     * @tc.desc      校验多设备专题重新下发三次后说明不变，切末场景重置后面板控件数量与该场景 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicFlow0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0016 begin');
      const observed: TopicFlowObs = await verifyTopicFlow(Driver.create(), TOPIC_PERFORMANCE);
      // 按钮规模为场景数加返回、重新下发与重置三个工具按钮。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.reapplyRounds).assertEqual(REAPPLY_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetStable).assertTrue();
      expect(observed.initialStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.finalStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0016 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0017
     * @tc.name      testNdkRenderNodeTopicFlow0017
     * @tc.desc      校验生命周期专题四个场景逐个切换后说明与参数控件随 schema 刷新，状态栏保留四个计数器。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicFlow0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0017 begin');
      const observed: TopicSweepObs = await sweepTopicScenes(Driver.create(), TOPIC_RECORD);
      // 四个场景逐个切换后说明与控件随 schema 刷新，状态栏计数器始终唯一。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertEqual(SCENE_PER_TOPIC);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.statusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0017 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0018
     * @tc.name      testNdkRenderNodeTopicFlow0018
     * @tc.desc      校验生命周期专题重新下发三次后说明不变，切末场景重置后面板控件数量与该场景 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicFlow0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0018 begin');
      const observed: TopicFlowObs = await verifyTopicFlow(Driver.create(), TOPIC_RECORD);
      // 按钮规模为场景数加返回、重新下发与重置三个工具按钮。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.reapplyRounds).assertEqual(REAPPLY_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetStable).assertTrue();
      expect(observed.initialStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.finalStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0018 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0019
     * @tc.name      testNdkRenderNodeTopicFlow0019
     * @tc.desc      校验帧同步专题四个场景逐个切换后说明与参数控件随 schema 刷新，状态栏保留四个计数器。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicFlow0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0019 begin');
      const observed: TopicSweepObs = await sweepTopicScenes(Driver.create(), TOPIC_FRAME_TICK);
      // 四个场景逐个切换后说明与控件随 schema 刷新，状态栏计数器始终唯一。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertEqual(SCENE_PER_TOPIC);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.statusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0019 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPICFLOW_0020
     * @tc.name      testNdkRenderNodeTopicFlow0020
     * @tc.desc      校验帧同步专题重新下发三次后说明不变，切末场景重置后面板控件数量与该场景 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopicFlow0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0020 begin');
      const observed: TopicFlowObs = await verifyTopicFlow(Driver.create(), TOPIC_FRAME_TICK);
      // 按钮规模为场景数加返回、重新下发与重置三个工具按钮。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.reapplyRounds).assertEqual(REAPPLY_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetStable).assertTrue();
      expect(observed.initialStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.finalStatusCount).assertEqual(SINGLE_STATUS);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopicFlow0020 end');
    })
  })
}
