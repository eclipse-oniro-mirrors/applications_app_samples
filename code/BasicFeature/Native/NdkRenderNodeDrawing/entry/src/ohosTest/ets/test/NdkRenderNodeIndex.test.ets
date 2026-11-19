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
  BACK_BUTTON,
  backToIndex,
  catalogItemCountId,
  catalogItemId,
  clickText,
  countId,
  countText,
  ensureIndex,
  enterPage,
  findId,
  findText,
  findType,
  logInfo,
  openCapabilityGroup,
  openTopicGroup,
  paramsReapplyId,
  paramsTitleId,
  scrollListToBottom,
  scrollListToTop,
  scrollToId,
  scrollToTitle,
  textOfId,
  topicItemCountId,
  topicItemId,
  waitForText
} from './UiDriverUtil';
import { GroupSpec } from '../../../main/ets/core/SchemaTypes';
import { CAPABILITY_GROUPS, TOPIC_GROUPS } from './SceneDefaults';

const TAG: string = '[Sample_NdkRenderNodeIndexTest]';
// 首页标题与副标题，取自 string.json 的 index_title / index_subtitle。
const HOME_TITLE: string = 'RenderNode Drawing';
const HOME_SUBTITLE: string = 'RenderNode + Native Drawing capability demos';
const PARAM_PANEL_TITLE: string = 'Parameters';
// 两个目录入口及其页面副标题（目录页标题与首页入口同名，只能用副标题区分是否进入）。
const CAPABILITY_ENTRY: string = 'Capability Matrix';
const CAPABILITY_SUBTITLE: string =
  'Schema driven demos: each group renders every native drawing capability of one header family.';
const TOPIC_ENTRY: string = 'RenderNode Topics';
const TOPIC_SUBTITLE: string =
  'Node level topics: tree, properties, blur, animation, hit testing, performance, record and device fit.';
const ENTRY_TOTAL: number = 12;
// 两个目录页承载的分组数量：能力矩阵 19 个能力域，专题目录 10 个专题。
const CAPABILITY_GROUP_TOTAL: number = 19;
const TOPIC_GROUP_TOTAL: number = 10;
// 同一入口连续进出首页的轮数，用于校验重复跳转不会破坏路由栈。
const REPEAT_ENTRY_ROUNDS: number = 2;
// 首页两个目录入口的说明文案，取自 string.json 的 capability_desc / topic_desc。
const CAPABILITY_DESC: string =
  'Schema driven demos across 19 capability families: canvas, paint, bitmap, text, shadow, matrix, record, ' +
  'offscreen layer and error codes.';
const TOPIC_DESC: string =
  'Ten node level topics: tree, properties, blur, animation, hit testing, performance, record and device fit.';

// 首页十二个入口标题，顺序与 Index.ets 的 demos 定义一致。
const ENTRY_TITLES: string[] = ['Canvas Drawing', 'Primitives', 'Drawing Effects', 'Canvas Transform', 'Image Drawing',
  'Text Drawing', 'Node Tree', 'Render Properties', 'Blur Effects', 'Lifecycle', CAPABILITY_ENTRY, TOPIC_ENTRY];
// 每个入口条目的描述文案，取自 string.json 的 *_desc 条目。
const ENTRY_DESCS: string[] = ['Draw path, text and image onto a RenderNode through Node-API.',
  'Point, line, circle, oval, rect, round rect, arc, path and region.',
  'Fill and stroke, blend mode, dash, gradients, color filter and mask blur.',
  'Clip, translate, rotate, scale, matrix and save/restore.',
  'Draw a pixel map with different sampling modes and a scale view.',
  'TextBlob, typography layout and text measurement.',
  'Append and remove child render nodes at runtime.',
  'Toggle background color, opacity, clip, shadow, scale and rotation.',
  'Background, content and foreground blur supported since API 26.',
  'Set label, invalidate, dispose and recreate the render node.',
  CAPABILITY_DESC, TOPIC_DESC];
// 每个入口进入后页面特有的标记控件。
const ENTRY_MARKERS: string[] = ['Draw Path', 'Point', 'Fill/Stroke', 'ClipRect', 'Stretch', 'TextBlob', 'Add Child',
  'Opacity', 'Foreground', 'Set Label', CAPABILITY_SUBTITLE, TOPIC_SUBTITLE];

// 确认停留在首页，并以副标题作为首页加载完成的标志。
async function openHome(driver: Driver): Promise<boolean> {
  if (!await ensureIndex(driver, TAG)) {
    return false;
  }
  return await waitForText(driver, HOME_SUBTITLE, TAG);
}

// 从能力矩阵目录返回首页：目录页自身只有 Back，回到首页后再确认首页副标题。
async function backFromCapabilityCatalog(driver: Driver): Promise<boolean> {
  if (!await clickText(driver, BACK_BUTTON, TAG)) {
    return false;
  }
  return await waitForText(driver, HOME_SUBTITLE, TAG);
}

// 从专题目录返回首页。
async function backFromTopicCatalog(driver: Driver): Promise<boolean> {
  if (!await clickText(driver, BACK_BUTTON, TAG)) {
    return false;
  }
  return await waitForText(driver, HOME_SUBTITLE, TAG);
}

// 目录页的观测量：分组总数、可定位条目数、计数文案命中数与首末条目 id。
class CatalogCountObs {
  public entry: string = '';
  public marker: string = '';
  public groupCount: number = 0;
  public locatedCount: number = 0;
  public countLabelMatched: number = 0;
  public firstItemId: string = '';
  public lastItemId: string = '';
  public topicMode: boolean = false;
  public returnedHome: boolean = false;
}

// 进入目录页并按分组 key 逐个定位条目与其场景计数文案。
async function verifyCatalogCounts(driver: Driver, entry: string, marker: string, groups: GroupSpec[],
  topic: boolean): Promise<CatalogCountObs> {
  const observed: CatalogCountObs = new CatalogCountObs();
  observed.entry = entry;
  observed.marker = marker;
  observed.groupCount = groups.length;
  observed.topicMode = topic;
  expect(await enterPage(driver, entry, marker, TAG)).assertTrue();
  for (const group of groups) {
    const itemId: string = topic ? topicItemId(group.key) : catalogItemId(group.key);
    const countLabelId: string = topic ? topicItemCountId(group.key) : catalogItemCountId(group.key);
    expect(await scrollToId(driver, itemId, TAG)).assertTrue();
    const countLabel: string = await textOfId(driver, countLabelId, TAG);
    const countMatched: boolean = countLabel.indexOf(group.scenes.length.toString()) >= 0;
    expect(countMatched).assertTrue();
    if (countMatched) {
      observed.countLabelMatched += 1;
    }
    if (observed.firstItemId.length === 0) {
      observed.firstItemId = itemId;
    }
    observed.lastItemId = itemId;
    observed.locatedCount += 1;
  }
  logInfo(TAG, entry + ' located groups = ' + observed.locatedCount.toString());
  expect(observed.locatedCount).assertEqual(observed.groupCount);
  observed.returnedHome = topic ? await backFromTopicCatalog(driver) : await backFromCapabilityCatalog(driver);
  expect(observed.returnedHome).assertTrue();
  return observed;
}

export default function ndkRenderNodeIndexTest(): void {
  describe('NdkRenderNodeIndex', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_INDEX_0001
     * @tc.name      testNdkRenderNodeIndex0001
     * @tc.desc      校验首页标题、副标题与可滚动入口列表同时呈现，入口总数与文档一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeIndex0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo(TAG, 'testNdkRenderNodeIndex0001 begin');
      const driver: Driver = Driver.create();
      expect(await openHome(driver)).assertTrue();
      expect(await findText(driver, HOME_TITLE, TAG) !== undefined).assertTrue();
      expect(await findText(driver, HOME_SUBTITLE, TAG) !== undefined).assertTrue();
      expect(await findType(driver, 'List', TAG) !== undefined).assertTrue();
      expect(ENTRY_TITLES.length).assertEqual(ENTRY_TOTAL);
      expect(ENTRY_DESCS.length).assertEqual(ENTRY_TOTAL);
      logInfo(TAG, 'testNdkRenderNodeIndex0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_INDEX_0002
     * @tc.name      testNdkRenderNodeIndex0002
     * @tc.desc      校验首页十二个入口标题均可滚动定位，且每个标题在首页只出现一次，不重复渲染。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeIndex0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo(TAG, 'testNdkRenderNodeIndex0002 begin');
      const driver: Driver = Driver.create();
      expect(await openHome(driver)).assertTrue();
      for (const title of ENTRY_TITLES) {
        expect(await scrollToTitle(driver, title, TAG)).assertTrue();
        expect(await countText(driver, title, TAG)).assertEqual(1);
      }
      logInfo(TAG, 'testNdkRenderNodeIndex0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_INDEX_0003
     * @tc.name      testNdkRenderNodeIndex0003
     * @tc.desc      校验首页十二个入口的说明文案均可滚动定位，说明文本来自 string.json 资源。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeIndex0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeIndex0003 begin');
      const driver: Driver = Driver.create();
      expect(await openHome(driver)).assertTrue();
      await scrollListToTop(driver, TAG);
      // 首屏只渲染靠前的条目，这里校验前十个入口的标题与说明成对出现。
      for (let index = 0; index < ENTRY_TOTAL - 2; index++) {
        expect(await findText(driver, ENTRY_TITLES[index], TAG) !== undefined).assertTrue();
        expect(await findText(driver, ENTRY_DESCS[index], TAG) !== undefined).assertTrue();
      }
      logInfo(TAG, 'testNdkRenderNodeIndex0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_INDEX_0004
     * @tc.name      testNdkRenderNodeIndex0004
     * @tc.desc      校验首页滚到底部时末项标题与说明可见，滚回顶部时首项标题可见。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeIndex0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeIndex0004 begin');
      const driver: Driver = Driver.create();
      expect(await openHome(driver)).assertTrue();
      await scrollListToBottom(driver, TAG);
      expect(await findText(driver, ENTRY_TITLES[ENTRY_TOTAL - 1], TAG) !== undefined).assertTrue();
      await scrollListToTop(driver, TAG);
      expect(await findText(driver, ENTRY_TITLES[0], TAG) !== undefined).assertTrue();
      expect(await findText(driver, ENTRY_DESCS[0], TAG) !== undefined).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeIndex0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_INDEX_0005
     * @tc.name      testNdkRenderNodeIndex0005
     * @tc.desc      校验首页十二个入口逐一点击后均进入标记页面，返回后首页可再次进入。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeIndex0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeIndex0005 begin');
      const driver: Driver = Driver.create();
      for (let index = 0; index < ENTRY_TOTAL; index++) {
        expect(await enterPage(driver, ENTRY_TITLES[index], ENTRY_MARKERS[index], TAG)).assertTrue();
        expect(await findText(driver, BACK_BUTTON, TAG) !== undefined).assertTrue();
        expect(await backToIndex(driver, TAG)).assertTrue();
      }
      logInfo(TAG, 'testNdkRenderNodeIndex0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_INDEX_0006
     * @tc.name      testNdkRenderNodeIndex0006
     * @tc.desc      校验同一入口连续两次进入均成功，返回首页后重复跳转不会破坏路由栈。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeIndex0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeIndex0006 begin');
      const driver: Driver = Driver.create();
      let enteredTimes: number = 0;
      for (let round = 0; round < REPEAT_ENTRY_ROUNDS; round++) {
        expect(await enterPage(driver, ENTRY_TITLES[0], ENTRY_MARKERS[0], TAG)).assertTrue();
        expect(await backToIndex(driver, TAG)).assertTrue();
        enteredTimes += 1;
      }
      expect(enteredTimes).assertEqual(REPEAT_ENTRY_ROUNDS);
      expect(await findText(driver, HOME_SUBTITLE, TAG) !== undefined).assertTrue();
      expect(await countText(driver, ENTRY_TITLES[0], TAG)).assertEqual(1);
      logInfo(TAG, 'testNdkRenderNodeIndex0006 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_INDEX_0007
     * @tc.name      testNdkRenderNodeIndex0007
     * @tc.desc      校验首页到能力矩阵再到画布能力域的三层跳转，可逐层返回到首页。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeIndex0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeIndex0007 begin');
      const driver: Driver = Driver.create();
      expect(await enterPage(driver, CAPABILITY_ENTRY, CAPABILITY_SUBTITLE, TAG)).assertTrue();
      expect(await openCapabilityGroup(driver, CAPABILITY_GROUPS[0].key, TAG)).assertTrue();
      expect(await countId(driver, paramsTitleId(CAPABILITY_GROUPS[0].key), TAG)).assertEqual(1);
      expect(await findText(driver, BACK_BUTTON, TAG) !== undefined).assertTrue();
      // 上一层是目录页而不是首页，因此第一次返回只会回到目录页。
      expect(await clickText(driver, BACK_BUTTON, TAG)).assertTrue();
      expect(await waitForText(driver, CAPABILITY_SUBTITLE, TAG)).assertTrue();
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeIndex0007 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_INDEX_0008
     * @tc.name      testNdkRenderNodeIndex0008
     * @tc.desc      校验首页到专题目录再到节点树专题的三层跳转，可逐层返回到首页。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeIndex0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeIndex0008 begin');
      const driver: Driver = Driver.create();
      expect(await enterPage(driver, TOPIC_ENTRY, TOPIC_SUBTITLE, TAG)).assertTrue();
      expect(await openTopicGroup(driver, TOPIC_GROUPS[0].key, TAG)).assertTrue();
      expect(await waitForText(driver, PARAM_PANEL_TITLE, TAG)).assertTrue();
      expect(await findId(driver, paramsReapplyId(TOPIC_GROUPS[0].key), TAG) !== undefined).assertTrue();
      expect(await clickText(driver, BACK_BUTTON, TAG)).assertTrue();
      expect(await waitForText(driver, TOPIC_SUBTITLE, TAG)).assertTrue();
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeIndex0008 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_INDEX_0009
     * @tc.name      testNdkRenderNodeIndex0009
     * @tc.desc      校验两个目录页可交替进出，每次返回首页后仍能进入另一个目录。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeIndex0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeIndex0009 begin');
      const driver: Driver = Driver.create();
      expect(await enterPage(driver, CAPABILITY_ENTRY, CAPABILITY_SUBTITLE, TAG)).assertTrue();
      expect(await backFromCapabilityCatalog(driver)).assertTrue();
      expect(await enterPage(driver, TOPIC_ENTRY, TOPIC_SUBTITLE, TAG)).assertTrue();
      expect(await backFromTopicCatalog(driver)).assertTrue();
      expect(await enterPage(driver, CAPABILITY_ENTRY, CAPABILITY_SUBTITLE, TAG)).assertTrue();
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeIndex0009 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_INDEX_0010
     * @tc.name      testNdkRenderNodeIndex0010
     * @tc.desc      校验首页滚到底部后最末入口可点击进入专题目录，返回后首页副标题可见。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeIndex0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeIndex0010 begin');
      const driver: Driver = Driver.create();
      expect(await openHome(driver)).assertTrue();
      await scrollListToBottom(driver, TAG);
      expect(await clickText(driver, TOPIC_ENTRY, TAG)).assertTrue();
      expect(await waitForText(driver, TOPIC_SUBTITLE, TAG)).assertTrue();
      expect(await backFromTopicCatalog(driver)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeIndex0010 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_INDEX_0011
     * @tc.name      testNdkRenderNodeIndex0011
     * @tc.desc      校验能力矩阵目录十九个能力域的场景计数文案全部可定位，计数来自各域 schema。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeIndex0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeIndex0011 begin');
      const observed: CatalogCountObs = await verifyCatalogCounts(
        Driver.create(), CAPABILITY_ENTRY, CAPABILITY_SUBTITLE, CAPABILITY_GROUPS, false);
      // 目录页应逐项列出十九个能力域，每个条目的场景计数文案与 schema 一致。
      expect(observed.entry).assertEqual(CAPABILITY_ENTRY);
      expect(observed.marker).assertEqual(CAPABILITY_SUBTITLE);
      expect(observed.groupCount).assertEqual(CAPABILITY_GROUP_TOTAL);
      expect(observed.locatedCount).assertEqual(observed.groupCount);
      expect(observed.countLabelMatched).assertEqual(observed.groupCount);
      expect(observed.firstItemId.length).assertLarger(0);
      expect(observed.lastItemId.length).assertLarger(0);
      expect(observed.topicMode).assertFalse();
      expect(observed.returnedHome).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeIndex0011 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_INDEX_0012
     * @tc.name      testNdkRenderNodeIndex0012
     * @tc.desc      校验专题目录十个专题的场景计数文案全部可定位，计数来自各专题 schema。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeIndex0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeIndex0012 begin');
      const observed: CatalogCountObs = await verifyCatalogCounts(
        Driver.create(), TOPIC_ENTRY, TOPIC_SUBTITLE, TOPIC_GROUPS, true);
      // 专题目录走专题条目与专题计数 id 分支，十个专题的场景计数文案同样来自 schema。
      expect(observed.entry).assertEqual(TOPIC_ENTRY);
      expect(observed.marker).assertEqual(TOPIC_SUBTITLE);
      expect(observed.groupCount).assertEqual(TOPIC_GROUP_TOTAL);
      expect(observed.locatedCount).assertEqual(observed.groupCount);
      expect(observed.countLabelMatched).assertEqual(observed.groupCount);
      expect(observed.firstItemId.length).assertLarger(0);
      expect(observed.lastItemId.length).assertLarger(0);
      expect(observed.topicMode).assertTrue();
      expect(observed.returnedHome).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeIndex0012 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_INDEX_0013
     * @tc.name      testNdkRenderNodeIndex0013
     * @tc.desc      校验能力矩阵最后一个能力域可滚动定位、进入并返回目录页，目录尾部可正常点击。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeIndex0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeIndex0013 begin');
      const driver: Driver = Driver.create();
      expect(await enterPage(driver, CAPABILITY_ENTRY, CAPABILITY_SUBTITLE, TAG)).assertTrue();
      const last: GroupSpec = CAPABILITY_GROUPS[CAPABILITY_GROUPS.length - 1];
      expect(await openCapabilityGroup(driver, last.key, TAG)).assertTrue();
      expect(await waitForText(driver, PARAM_PANEL_TITLE, TAG)).assertTrue();
      expect(await clickText(driver, BACK_BUTTON, TAG)).assertTrue();
      expect(await waitForText(driver, CAPABILITY_SUBTITLE, TAG)).assertTrue();
      expect(await backFromCapabilityCatalog(driver)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeIndex0013 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_INDEX_0014
     * @tc.name      testNdkRenderNodeIndex0014
     * @tc.desc      校验首页首屏条目同时渲染标题与说明，且标题与说明各只出现一次。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeIndex0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeIndex0014 begin');
      const driver: Driver = Driver.create();
      expect(await openHome(driver)).assertTrue();
      await scrollListToTop(driver, TAG);
      expect(await countText(driver, HOME_TITLE, TAG)).assertEqual(1);
      expect(await countText(driver, HOME_SUBTITLE, TAG)).assertEqual(1);
      expect(await countText(driver, ENTRY_TITLES[0], TAG)).assertEqual(1);
      expect(await countText(driver, ENTRY_DESCS[0], TAG)).assertEqual(1);
      logInfo(TAG, 'testNdkRenderNodeIndex0014 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_INDEX_0015
     * @tc.name      testNdkRenderNodeIndex0015
     * @tc.desc      校验首页连续三轮进出首项后，列表仍可滚动定位末项入口，滚动能力未被破坏。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeIndex0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeIndex0015 begin');
      const driver: Driver = Driver.create();
      for (let round = 0; round < 3; round++) {
        expect(await enterPage(driver, ENTRY_TITLES[0], ENTRY_MARKERS[0], TAG)).assertTrue();
        expect(await backToIndex(driver, TAG)).assertTrue();
      }
      expect(await scrollToTitle(driver, TOPIC_ENTRY, TAG)).assertTrue();
      await scrollListToBottom(driver, TAG);
      expect(await findText(driver, ENTRY_TITLES[ENTRY_TOTAL - 1], TAG) !== undefined).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeIndex0015 end');
    })
  })
}
