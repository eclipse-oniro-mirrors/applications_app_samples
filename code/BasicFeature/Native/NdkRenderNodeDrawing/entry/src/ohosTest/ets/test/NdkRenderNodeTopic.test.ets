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
  countId,
  countType,
  delay,
  findId,
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
  sceneButtonId,
  sceneDescId,
  scrollListToTop,
  scrollToId,
  textOfId,
  topicItemCountId,
  topicItemId,
  UI_SETTLE_TIME,
  waitForId
} from './UiDriverUtil';
import { GroupSpec, PARAM_RANGE, PARAM_SELECT, PARAM_TOGGLE, SceneSpec } from '../../../main/ets/core/SchemaTypes';
import { TOPIC_GROUPS } from './SceneDefaults';

const TAG: string = '[Sample_NdkRenderNodeTopicTest]';
const TOPIC_TOTAL: number = 10;
const SCENE_PER_TOPIC: number = 4;
// 每个专题的首场景下标。
const SCENE_FIRST: number = 0;
// 专题页面上除场景按钮之外的三个按钮：返回、重新下发与重置。
const EXTRA_BUTTONS: number = 3;
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

// 从专题目录页进入指定专题页面，全程按 group.key 定位，不依赖界面文案。
async function openTopic(driver: Driver, group: GroupSpec): Promise<boolean> {
  if (!await openTopicCatalog(driver, TAG)) {
    return false;
  }
  return await openTopicGroup(driver, group.key, TAG);
}

// 专题页的观测量：标题、说明、工具按钮、控件组与场景说明的逐项判定结果。
class TopicPageObs {
  public groupKey: string = '';
  public sceneCount: number = 0;
  public firstSceneId: number = -1;
  public buttonCount: number = 0;
  public scenesVisited: number = 0;
  public titleMatched: boolean = false;
  public descMatched: boolean = false;
  public reapplyMatched: boolean = false;
  public resetMatched: boolean = false;
  public sliderMatched: boolean = false;
  public toggleMatched: boolean = false;
  public selectMatched: boolean = false;
  public returnedToCatalog: boolean = false;
  public returnedToIndex: boolean = false;
}

// 校验一个专题页的标题、说明、四个场景与参数控件均来自 schema，且切场景后说明同步更新。
async function verifyTopicPage(driver: Driver, index: number): Promise<TopicPageObs> {
  const observed: TopicPageObs = new TopicPageObs();
  const group: GroupSpec = TOPIC_GROUPS[index];
  observed.groupKey = group.key;
  observed.sceneCount = group.scenes.length;
  expect(await openTopic(driver, group)).assertTrue();
  observed.titleMatched = await countId(driver, groupTitleId(group.key), TAG) === 1;
  expect(observed.titleMatched).assertTrue();
  observed.descMatched = await countId(driver, groupDescId(group.key), TAG) === 1;
  expect(observed.descMatched).assertTrue();
  observed.reapplyMatched = await findId(driver, paramsReapplyId(group.key), TAG) !== undefined;
  expect(observed.reapplyMatched).assertTrue();
  observed.resetMatched = await findId(driver, paramsResetId(group.key), TAG) !== undefined;
  expect(observed.resetMatched).assertTrue();
  observed.buttonCount = await countType(driver, 'Button', TAG);
  expect(observed.buttonCount).assertEqual(group.scenes.length + EXTRA_BUTTONS);
  const first: SceneSpec = group.scenes[0];
  observed.firstSceneId = first.id;
  observed.sliderMatched = await countType(driver, 'Slider', TAG) === countKind(first, PARAM_RANGE);
  observed.toggleMatched = await countType(driver, 'Toggle', TAG) === countKind(first, PARAM_TOGGLE);
  observed.selectMatched = await countType(driver, 'Select', TAG) === countKind(first, PARAM_SELECT);
  expect(observed.sliderMatched).assertTrue();
  expect(observed.toggleMatched).assertTrue();
  expect(observed.selectMatched).assertTrue();
  for (const spec of group.scenes) {
    expect(await clickScene(driver, group.key, spec.id, TAG)).assertTrue();
    await delay(driver, UI_SETTLE_TIME);
    const descReady: boolean = await waitForId(driver, sceneDescId(group.key, spec.id), TAG);
    expect(descReady).assertTrue();
    if (descReady) {
      observed.scenesVisited += 1;
    }
    logInfo(TAG, 'topic ' + group.key + ' scene ' + spec.id.toString() + ' desc checked');
  }
  observed.returnedToCatalog = await backToTopicCatalog(driver, group.key);
  expect(observed.returnedToCatalog).assertTrue();
  observed.returnedToIndex = await backToIndex(driver, TAG);
  expect(observed.returnedToIndex).assertTrue();
  return observed;
}

// 专题页返回专题目录：按返回按钮 id 点击，再等待专题目录标题出现，与界面语言无关。
async function backToTopicCatalog(driver: Driver, groupKey: string): Promise<boolean> {
  if (!await clickId(driver, navBackId(groupKey), TAG)) {
    return false;
  }
  return await waitForId(driver, ID_TOPIC_CATALOG_PAGE_TITLE, TAG);
}

export default function ndkRenderNodeTopicTest(): void {
  describe('NdkRenderNodeTopic', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_0001
     * @tc.name      testNdkRenderNodeTopic0001
     * @tc.desc      校验首页专题入口可进入专题目录页，十个专题标题与场景计数均可定位。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeTopic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopic0001 begin');
      const driver: Driver = Driver.create();
      expect(await openTopicCatalog(driver, TAG)).assertTrue();
      expect(TOPIC_GROUPS.length).assertEqual(TOPIC_TOTAL);
      let locatedCount: number = 0;
      for (const group of TOPIC_GROUPS) {
        if (await scrollToId(driver, topicItemId(group.key), TAG)) {
          locatedCount += 1;
        } else {
          logInfo(TAG, 'missing topic: ' + group.key);
        }
      }
      logInfo(TAG, 'located topic count = ' + locatedCount.toString());
      expect(locatedCount).assertEqual(TOPIC_TOTAL);
      // 全部专题都是四个场景，滚回顶部后首项的计数文案可见。
      await scrollListToTop(driver, TAG);
      const countLabel: string = await textOfId(driver, topicItemCountId(TOPIC_GROUPS[0].key), TAG);
      expect(countLabel.indexOf(SCENE_PER_TOPIC.toString()) >= 0).assertTrue();
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopic0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_0002
     * @tc.name      testNdkRenderNodeTopic0002
     * @tc.desc      校验节点树专题页列出四个场景按钮，并渲染参数面板、重置与重新下发按钮。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeTopic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopic0002 begin');
      const driver: Driver = Driver.create();
      const group: GroupSpec = TOPIC_GROUPS[0];
      expect(await openTopic(driver, group)).assertTrue();
      for (const spec of group.scenes) {
        expect(await countId(driver, sceneButtonId(group.key, spec.id), TAG)).assertEqual(1);
      }
      expect(await findId(driver, paramsTitleId(group.key), TAG) !== undefined).assertTrue();
      expect(await findId(driver, paramsResetId(group.key), TAG) !== undefined).assertTrue();
      expect(await findId(driver, paramsReapplyId(group.key), TAG) !== undefined).assertTrue();
      const sliderCount: number = await countType(driver, 'Slider', TAG);
      logInfo(TAG, 'node tree slider count = ' + sliderCount.toString());
      expect(sliderCount >= 1).assertTrue();
      expect(await backToTopicCatalog(driver, group.key)).assertTrue();
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopic0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_0003
     * @tc.name      testNdkRenderNodeTopic0003
     * @tc.desc      校验切换模糊专题的前景模糊场景后，场景说明控件切换为对应场景的说明。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopic0003 begin');
      const driver: Driver = Driver.create();
      const group: GroupSpec = TOPIC_GROUPS[2];
      expect(await openTopic(driver, group)).assertTrue();
      const spec: SceneSpec = group.scenes[2];
      expect(await clickScene(driver, group.key, spec.id, TAG)).assertTrue();
      await delay(driver, UI_SETTLE_TIME);
      expect(await waitForId(driver, sceneDescId(group.key, spec.id), TAG)).assertTrue();
      // 场景说明随场景切换更新：默认场景的说明控件不再存在。
      expect(await countId(driver, sceneDescId(group.key, group.scenes[0].id), TAG)).assertEqual(0);
      expect(await backToTopicCatalog(driver, group.key)).assertTrue();
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopic0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_0004
     * @tc.name      testNdkRenderNodeTopic0004
     * @tc.desc      校验十个专题页可逐一进入并逐级返回首页，每层页面均保留返回按钮。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopic0004 begin');
      const driver: Driver = Driver.create();
      expect(await openTopicCatalog(driver, TAG)).assertTrue();
      for (const group of TOPIC_GROUPS) {
        expect(await openTopicGroup(driver, group.key, TAG)).assertTrue();
        expect(await findId(driver, paramsTitleId(group.key), TAG) !== undefined).assertTrue();
        expect(await findId(driver, navBackId(group.key), TAG) !== undefined).assertTrue();
        expect(await backToTopicCatalog(driver, group.key)).assertTrue();
      }
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopic0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_0005
     * @tc.name      testNdkRenderNodeTopic0005
     * @tc.desc      校验节点树专题页的场景、参数控件与四个场景说明均与专题 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopic0005 begin');
      const observed: TopicPageObs = await verifyTopicPage(Driver.create(), TOPIC_NODE_TREE);
      // 标题、说明、工具按钮与三个控件组都要来自 schema，四个场景说明逐个可达。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.reapplyMatched).assertTrue();
      expect(observed.resetMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.scenesVisited).assertEqual(observed.sceneCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopic0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_0006
     * @tc.name      testNdkRenderNodeTopic0006
     * @tc.desc      校验渲染属性专题页的场景、参数控件与四个场景说明均与专题 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopic0006 begin');
      const observed: TopicPageObs = await verifyTopicPage(Driver.create(), TOPIC_RENDER_PROP);
      // 标题、说明、工具按钮与三个控件组都要来自 schema，四个场景说明逐个可达。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.reapplyMatched).assertTrue();
      expect(observed.resetMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.scenesVisited).assertEqual(observed.sceneCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopic0006 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_0007
     * @tc.name      testNdkRenderNodeTopic0007
     * @tc.desc      校验模糊专题页的场景、参数控件与四个场景说明均与专题 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopic0007 begin');
      const observed: TopicPageObs = await verifyTopicPage(Driver.create(), TOPIC_BLUR);
      // 标题、说明、工具按钮与三个控件组都要来自 schema，四个场景说明逐个可达。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.reapplyMatched).assertTrue();
      expect(observed.resetMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.scenesVisited).assertEqual(observed.sceneCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopic0007 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_0008
     * @tc.name      testNdkRenderNodeTopic0008
     * @tc.desc      校验动画专题页的场景、参数控件与四个场景说明均与专题 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopic0008 begin');
      const observed: TopicPageObs = await verifyTopicPage(Driver.create(), TOPIC_LIFECYCLE);
      // 标题、说明、工具按钮与三个控件组都要来自 schema，四个场景说明逐个可达。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.reapplyMatched).assertTrue();
      expect(observed.resetMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.scenesVisited).assertEqual(observed.sceneCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopic0008 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_0009
     * @tc.name      testNdkRenderNodeTopic0009
     * @tc.desc      校验命中测试专题页的场景、参数控件与四个场景说明均与专题 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopic0009 begin');
      const observed: TopicPageObs = await verifyTopicPage(Driver.create(), TOPIC_HIT_TEST);
      // 标题、说明、工具按钮与三个控件组都要来自 schema，四个场景说明逐个可达。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.reapplyMatched).assertTrue();
      expect(observed.resetMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.scenesVisited).assertEqual(observed.sceneCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopic0009 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_0010
     * @tc.name      testNdkRenderNodeTopic0010
     * @tc.desc      校验性能专题页的场景、参数控件与四个场景说明均与专题 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopic0010 begin');
      const observed: TopicPageObs = await verifyTopicPage(Driver.create(), TOPIC_ANIMATION);
      // 标题、说明、工具按钮与三个控件组都要来自 schema，四个场景说明逐个可达。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.reapplyMatched).assertTrue();
      expect(observed.resetMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.scenesVisited).assertEqual(observed.sceneCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopic0010 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_0011
     * @tc.name      testNdkRenderNodeTopic0011
     * @tc.desc      校验录制重放专题页的场景、参数控件与四个场景说明均与专题 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopic0011 begin');
      const observed: TopicPageObs = await verifyTopicPage(Driver.create(), TOPIC_MULTI_DEVICE);
      // 标题、说明、工具按钮与三个控件组都要来自 schema，四个场景说明逐个可达。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.reapplyMatched).assertTrue();
      expect(observed.resetMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.scenesVisited).assertEqual(observed.sceneCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopic0011 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_0012
     * @tc.name      testNdkRenderNodeTopic0012
     * @tc.desc      校验多设备专题页的场景、参数控件与四个场景说明均与专题 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopic0012 begin');
      const observed: TopicPageObs = await verifyTopicPage(Driver.create(), TOPIC_PERFORMANCE);
      // 标题、说明、工具按钮与三个控件组都要来自 schema，四个场景说明逐个可达。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.reapplyMatched).assertTrue();
      expect(observed.resetMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.scenesVisited).assertEqual(observed.sceneCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopic0012 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_0013
     * @tc.name      testNdkRenderNodeTopic0013
     * @tc.desc      校验生命周期专题页的场景、参数控件与四个场景说明均与专题 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopic0013 begin');
      const observed: TopicPageObs = await verifyTopicPage(Driver.create(), TOPIC_RECORD);
      // 标题、说明、工具按钮与三个控件组都要来自 schema，四个场景说明逐个可达。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.reapplyMatched).assertTrue();
      expect(observed.resetMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.scenesVisited).assertEqual(observed.sceneCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopic0013 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_0014
     * @tc.name      testNdkRenderNodeTopic0014
     * @tc.desc      校验帧同步专题页的场景、参数控件与四个场景说明均与专题 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopic0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopic0014 begin');
      const observed: TopicPageObs = await verifyTopicPage(Driver.create(), TOPIC_FRAME_TICK);
      // 标题、说明、工具按钮与三个控件组都要来自 schema，四个场景说明逐个可达。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.reapplyMatched).assertTrue();
      expect(observed.resetMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.scenesVisited).assertEqual(observed.sceneCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopic0014 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_0015
     * @tc.name      testNdkRenderNodeTopic0015
     * @tc.desc      校验专题页的重新下发按钮可连续点击三次，页面保持可用且场景说明不变。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopic0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopic0015 begin');
      const driver: Driver = Driver.create();
      const group: GroupSpec = TOPIC_GROUPS[0];
      expect(await openTopic(driver, group)).assertTrue();
      const spec: SceneSpec = group.scenes[0];
      for (let round = 0; round < 3; round++) {
        expect(await clickId(driver, paramsReapplyId(group.key), TAG)).assertTrue();
        await delay(driver, UI_SETTLE_TIME);
        expect(await waitForId(driver, sceneDescId(group.key, spec.id), TAG)).assertTrue();
      }
      expect(await backToTopicCatalog(driver, group.key)).assertTrue();
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopic0015 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_0016
     * @tc.name      testNdkRenderNodeTopic0016
     * @tc.desc      校验专题页重置按钮可点击，重置后场景说明与参数面板仍与 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopic0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopic0016 begin');
      const driver: Driver = Driver.create();
      const group: GroupSpec = TOPIC_GROUPS[2];
      expect(await openTopic(driver, group)).assertTrue();
      expect(await clickId(driver, paramsResetId(group.key), TAG)).assertTrue();
      await delay(driver, UI_SETTLE_TIME);
      const defaultScene: SceneSpec = group.scenes[0];
      expect(await countId(driver, sceneDescId(group.key, defaultScene.id), TAG)).assertEqual(1);
      expect(await findId(driver, paramsTitleId(group.key), TAG) !== undefined).assertTrue();
      expect(await backToTopicCatalog(driver, group.key)).assertTrue();
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopic0016 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_TOPIC_0017
     * @tc.name      testNdkRenderNodeTopic0017
     * @tc.desc      校验专题目录滚到末尾时末项可进入，滚回顶部时首项可进入，两者均能逐级返回首页。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeTopic0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeTopic0017 begin');
      const driver: Driver = Driver.create();
      expect(await openTopicCatalog(driver, TAG)).assertTrue();
      const last: GroupSpec = TOPIC_GROUPS[TOPIC_GROUPS.length - 1];
      expect(await scrollToId(driver, topicItemId(last.key), TAG)).assertTrue();
      expect(await clickId(driver, topicItemId(last.key), TAG)).assertTrue();
      expect(await waitForId(driver, paramsTitleId(last.key), TAG)).assertTrue();
      expect(await backToTopicCatalog(driver, last.key)).assertTrue();
      await scrollListToTop(driver, TAG);
      const first: GroupSpec = TOPIC_GROUPS[0];
      expect(await clickId(driver, topicItemId(first.key), TAG)).assertTrue();
      expect(await waitForId(driver, paramsTitleId(first.key), TAG)).assertTrue();
      expect(await backToTopicCatalog(driver, first.key)).assertTrue();
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeTopic0017 end');
    })
  })
}
