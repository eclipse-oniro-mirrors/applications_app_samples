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
import { Component, Driver } from '@kit.TestKit';
import {
  backToIndex,
  catalogItemCountId,
  catalogItemDescId,
  catalogItemId,
  clickId,
  clickScene,
  countId,
  countType,
  delay,
  findId,
  findText,
  findType,
  groupDescId,
  groupTitleId,
  ID_CATALOG_PAGE_TITLE,
  logInfo,
  navBackId,
  openCapabilityGroup,
  openCatalog,
  paramsResetId,
  paramsTitleId,
  sceneButtonId,
  sceneDescId,
  scrollListToTop,
  scrollToId,
  textOfId,
  UI_SETTLE_TIME,
  waitForId
} from './UiDriverUtil';
import { ParamEngine } from '../../../main/ets/core/ParamEngine';
import { GroupSpec, PARAM_RANGE, PARAM_SELECT, PARAM_TOGGLE, SceneSpec } from '../../../main/ets/core/SchemaTypes';
import { CAPABILITY_GROUPS } from './SceneDefaults';

const TAG: string = '[Sample_NdkRenderNodeCapabilityTest]';
const GROUP_TOTAL: number = 19;
// 画布能力域的场景总数，与 cap_canvas.cpp 中的 CANVAS_SCENE_COUNT 一致。
const CANVAS_SCENE_TOTAL: number = 10;
// 每个能力域的首场景下标。
const SCENE_FIRST: number = 0;
// 能力域页面上除场景按钮之外的两个按钮：返回与重置。
const EXTRA_BUTTONS: number = 2;
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

// 分组页面底部状态栏的初始文案，GroupHost 固定输出「scene <id> · <参数摘要>」。
function defaultStatus(group: GroupSpec): string {
  const spec: SceneSpec = group.scenes[0];
  return 'scene ' + spec.id.toString() + ' · ' + ParamEngine.summary(spec, ParamEngine.defaults(spec));
}

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

// 从目录页进入指定能力域页面。
async function openGroup(driver: Driver, group: GroupSpec): Promise<boolean> {
  if (!await openCatalog(driver, TAG)) {
    return false;
  }
  return await openCapabilityGroup(driver, group.key, TAG);
}

// 能力域页面返回目录页。
async function backToCatalog(driver: Driver, groupKey: string): Promise<boolean> {
  if (!await clickId(driver, navBackId(groupKey), TAG)) {
    return false;
  }
  return await waitForId(driver, ID_CATALOG_PAGE_TITLE, TAG);
}

// 能力域面板的观测量：标题、说明、状态栏、控件规模与参数键文案的逐项判定结果。
class GroupPanelObs {
  public groupKey: string = '';
  public groupId: number = 0;
  public sceneCount: number = 0;
  public firstSceneId: number = -1;
  public paramCount: number = 0;
  public keyLabelMatched: number = 0;
  public buttonCount: number = 0;
  public titleMatched: boolean = false;
  public descMatched: boolean = false;
  public statusMatched: boolean = false;
  public sliderMatched: boolean = false;
  public toggleMatched: boolean = false;
  public selectMatched: boolean = false;
  public returnedToCatalog: boolean = false;
  public returnedToIndex: boolean = false;
}

// 校验一个能力域页面的标题、初始状态栏、三类参数控件与场景按钮均来自 schema。
async function verifyGroupPanel(driver: Driver, index: number): Promise<GroupPanelObs> {
  const observed: GroupPanelObs = new GroupPanelObs();
  const group: GroupSpec = CAPABILITY_GROUPS[index];
  observed.groupKey = group.key;
  observed.groupId = group.id;
  observed.sceneCount = group.scenes.length;
  expect(await openGroup(driver, group)).assertTrue();
  const titleCount: number = await countId(driver, groupTitleId(group.key), TAG);
  observed.titleMatched = titleCount === 1;
  expect(observed.titleMatched).assertTrue();
  observed.descMatched = await findId(driver, groupDescId(group.key), TAG) !== undefined;
  expect(observed.descMatched).assertTrue();
  const status: string = defaultStatus(group);
  logInfo(TAG, 'expected status: ' + status);
  observed.statusMatched = await findText(driver, status, TAG) !== undefined;
  expect(observed.statusMatched).assertTrue();
  const scene: SceneSpec = group.scenes[0];
  observed.firstSceneId = scene.id;
  observed.paramCount = scene.params.length;
  observed.sliderMatched = await countType(driver, 'Slider', TAG) === countKind(scene, PARAM_RANGE);
  observed.toggleMatched = await countType(driver, 'Toggle', TAG) === countKind(scene, PARAM_TOGGLE);
  observed.selectMatched = await countType(driver, 'Select', TAG) === countKind(scene, PARAM_SELECT);
  expect(observed.sliderMatched).assertTrue();
  expect(observed.toggleMatched).assertTrue();
  expect(observed.selectMatched).assertTrue();
  observed.buttonCount = await countType(driver, 'Button', TAG);
  expect(observed.buttonCount).assertEqual(group.scenes.length + EXTRA_BUTTONS);
  for (let paramIndex = 0; paramIndex < scene.params.length; paramIndex++) {
    if (await findText(driver, scene.params[paramIndex].key, TAG) !== undefined) {
      observed.keyLabelMatched += 1;
    }
  }
  expect(observed.keyLabelMatched).assertEqual(scene.params.length);
  observed.returnedToCatalog = await backToCatalog(driver, group.key);
  expect(observed.returnedToCatalog).assertTrue();
  observed.returnedToIndex = await backToIndex(driver, TAG);
  expect(observed.returnedToIndex).assertTrue();
  return observed;
}

export default function ndkRenderNodeCapabilityTest(): void {
  describe('NdkRenderNodeCapability', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0001
     * @tc.name      testNdkRenderNodeCapability0001
     * @tc.desc      校验首页能力矩阵入口可进入目录页，滚动后十九个能力域标题与场景计数均可定位。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeCapability0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0001 begin');
      const driver: Driver = Driver.create();
      expect(await openCatalog(driver, TAG)).assertTrue();
      expect(CAPABILITY_GROUPS.length).assertEqual(GROUP_TOTAL);
      // 目录共十九项，超出首屏，逐项滚动定位后计数。
      let locatedCount: number = 0;
      for (const group of CAPABILITY_GROUPS) {
        if (await scrollToId(driver, catalogItemId(group.key), TAG)) {
          locatedCount += 1;
        } else {
          logInfo(TAG, 'missing capability group: ' + group.key);
        }
      }
      logInfo(TAG, 'located capability group count = ' + locatedCount.toString());
      expect(locatedCount).assertEqual(GROUP_TOTAL);
      // 画布域排在目录首位，滚回顶部后其场景计数可见。
      await scrollListToTop(driver, TAG);
      const countLabel: string = await textOfId(driver, catalogItemCountId(CAPABILITY_GROUPS[0].key), TAG);
      logInfo(TAG, 'canvas count label: ' + countLabel);
      expect(countLabel.indexOf(CANVAS_SCENE_TOTAL.toString()) >= 0).assertTrue();
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0002
     * @tc.name      testNdkRenderNodeCapability0002
     * @tc.desc      校验画布能力域页面列出全部十个场景按钮，并渲染参数面板与重置按钮。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeCapability0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0002 begin');
      const driver: Driver = Driver.create();
      const group: GroupSpec = CAPABILITY_GROUPS[0];
      expect(await openGroup(driver, group)).assertTrue();
      const first: SceneSpec = group.scenes[0];
      const last: SceneSpec = group.scenes[group.scenes.length - 1];
      expect(await findId(driver, sceneButtonId(group.key, first.id), TAG) !== undefined).assertTrue();
      expect(await findId(driver, sceneButtonId(group.key, last.id), TAG) !== undefined).assertTrue();
      expect(await findId(driver, paramsTitleId(group.key), TAG) !== undefined).assertTrue();
      expect(await findId(driver, paramsResetId(group.key), TAG) !== undefined).assertTrue();
      const sliderCount: number = await countType(driver, 'Slider', TAG);
      logInfo(TAG, 'canvas slider count = ' + sliderCount.toString());
      expect(sliderCount >= 1).assertTrue();
      expect(await backToCatalog(driver, group.key)).assertTrue();
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0003
     * @tc.name      testNdkRenderNodeCapability0003
     * @tc.desc      校验切换画布场景后场景说明随之更新，说明文本来自对应 schema 条目。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0003 begin');
      const driver: Driver = Driver.create();
      const group: GroupSpec = CAPABILITY_GROUPS[0];
      expect(await openGroup(driver, group)).assertTrue();
      // 切换到最后一个场景，场景说明随之更新且首场景说明不再存在。
      const first: SceneSpec = group.scenes[0];
      const last: SceneSpec = group.scenes[group.scenes.length - 1];
      expect(await clickScene(driver, group.key, last.id, TAG)).assertTrue();
      await delay(driver, UI_SETTLE_TIME);
      expect(await waitForId(driver, sceneDescId(group.key, last.id), TAG)).assertTrue();
      expect(await findId(driver, sceneDescId(group.key, first.id), TAG) === undefined).assertTrue();
      expect(await backToCatalog(driver, group.key)).assertTrue();
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0004
     * @tc.name      testNdkRenderNodeCapability0004
     * @tc.desc      校验十九个能力域可逐一进入并逐级返回首页，每层页面均保留返回按钮。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0004 begin');
      const driver: Driver = Driver.create();
      expect(await openCatalog(driver, TAG)).assertTrue();
      for (const group of CAPABILITY_GROUPS) {
        expect(await openCapabilityGroup(driver, group.key, TAG)).assertTrue();
        expect(await findId(driver, paramsTitleId(group.key), TAG) !== undefined).assertTrue();
        expect(await findId(driver, navBackId(group.key), TAG) !== undefined).assertTrue();
        expect(await backToCatalog(driver, group.key)).assertTrue();
      }
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0005
     * @tc.name      testNdkRenderNodeCapability0005
     * @tc.desc      校验画布域页面标题、初始状态栏与参数控件均与画布 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0005 begin');
      const observed: GroupPanelObs = await verifyGroupPanel(Driver.create(), DOMAIN_CANVAS);
      // 面板控件数量、场景按钮规模与状态栏文案都必须来自 schema。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.groupId).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.statusMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.keyLabelMatched).assertEqual(observed.paramCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0006
     * @tc.name      testNdkRenderNodeCapability0006
     * @tc.desc      校验几何域页面标题、初始状态栏与参数控件均与几何 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0006 begin');
      const observed: GroupPanelObs = await verifyGroupPanel(Driver.create(), DOMAIN_GEOMETRY);
      // 面板控件数量、场景按钮规模与状态栏文案都必须来自 schema。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.groupId).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.statusMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.keyLabelMatched).assertEqual(observed.paramCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0006 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0007
     * @tc.name      testNdkRenderNodeCapability0007
     * @tc.desc      校验画笔域页面标题、初始状态栏与参数控件均与画笔 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0007 begin');
      const observed: GroupPanelObs = await verifyGroupPanel(Driver.create(), DOMAIN_PAINT);
      // 面板控件数量、场景按钮规模与状态栏文案都必须来自 schema。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.groupId).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.statusMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.keyLabelMatched).assertEqual(observed.paramCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0007 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0008
     * @tc.name      testNdkRenderNodeCapability0008
     * @tc.desc      校验颜色模型域页面标题、初始状态栏与参数控件均与颜色 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0008 begin');
      const observed: GroupPanelObs = await verifyGroupPanel(Driver.create(), DOMAIN_COLOR);
      // 面板控件数量、场景按钮规模与状态栏文案都必须来自 schema。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.groupId).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.statusMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.keyLabelMatched).assertEqual(observed.paramCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0008 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0009
     * @tc.name      testNdkRenderNodeCapability0009
     * @tc.desc      校验颜色滤镜域页面标题、初始状态栏与参数控件均与颜色滤镜 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0009 begin');
      const observed: GroupPanelObs = await verifyGroupPanel(Driver.create(), DOMAIN_COLOR_FILTER);
      // 面板控件数量、场景按钮规模与状态栏文案都必须来自 schema。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.groupId).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.statusMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.keyLabelMatched).assertEqual(observed.paramCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0009 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0010
     * @tc.name      testNdkRenderNodeCapability0010
     * @tc.desc      校验着色器域页面标题、初始状态栏与参数控件均与着色器 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0010 begin');
      const observed: GroupPanelObs = await verifyGroupPanel(Driver.create(), DOMAIN_SHADER);
      // 面板控件数量、场景按钮规模与状态栏文案都必须来自 schema。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.groupId).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.statusMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.keyLabelMatched).assertEqual(observed.paramCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0010 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0011
     * @tc.name      testNdkRenderNodeCapability0011
     * @tc.desc      校验遮罩滤镜域页面标题、初始状态栏与参数控件均与遮罩 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0011 begin');
      const observed: GroupPanelObs = await verifyGroupPanel(Driver.create(), DOMAIN_MASK_FILTER);
      // 面板控件数量、场景按钮规模与状态栏文案都必须来自 schema。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.groupId).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.statusMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.keyLabelMatched).assertEqual(observed.paramCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0011 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0012
     * @tc.name      testNdkRenderNodeCapability0012
     * @tc.desc      校验图像滤镜域页面标题、初始状态栏与参数控件均与图像滤镜 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0012 begin');
      const observed: GroupPanelObs = await verifyGroupPanel(Driver.create(), DOMAIN_IMAGE_FILTER);
      // 面板控件数量、场景按钮规模与状态栏文案都必须来自 schema。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.groupId).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.statusMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.keyLabelMatched).assertEqual(observed.paramCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0012 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0013
     * @tc.name      testNdkRenderNodeCapability0013
     * @tc.desc      校验位图域页面标题、初始状态栏与参数控件均与位图 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0013 begin');
      const observed: GroupPanelObs = await verifyGroupPanel(Driver.create(), DOMAIN_BITMAP);
      // 面板控件数量、场景按钮规模与状态栏文案都必须来自 schema。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.groupId).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.statusMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.keyLabelMatched).assertEqual(observed.paramCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0013 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0014
     * @tc.name      testNdkRenderNodeCapability0014
     * @tc.desc      校验像素图域页面标题、初始状态栏与参数控件均与像素图 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0014 begin');
      const observed: GroupPanelObs = await verifyGroupPanel(Driver.create(), DOMAIN_PIXELMAP);
      // 面板控件数量、场景按钮规模与状态栏文案都必须来自 schema。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.groupId).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.statusMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.keyLabelMatched).assertEqual(observed.paramCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0014 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0015
     * @tc.name      testNdkRenderNodeCapability0015
     * @tc.desc      校验图片编解码域页面标题、初始状态栏与参数控件均与编解码 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0015 begin');
      const observed: GroupPanelObs = await verifyGroupPanel(Driver.create(), DOMAIN_IMAGE_IO);
      // 面板控件数量、场景按钮规模与状态栏文案都必须来自 schema。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.groupId).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.statusMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.keyLabelMatched).assertEqual(observed.paramCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0015 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0016
     * @tc.name      testNdkRenderNodeCapability0016
     * @tc.desc      校验字体域页面标题、初始状态栏与参数控件均与字体 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0016 begin');
      const observed: GroupPanelObs = await verifyGroupPanel(Driver.create(), DOMAIN_FONT);
      // 面板控件数量、场景按钮规模与状态栏文案都必须来自 schema。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.groupId).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.statusMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.keyLabelMatched).assertEqual(observed.paramCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0016 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0017
     * @tc.name      testNdkRenderNodeCapability0017
     * @tc.desc      校验文本块域页面标题、初始状态栏与参数控件均与文本块 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0017 begin');
      const observed: GroupPanelObs = await verifyGroupPanel(Driver.create(), DOMAIN_TEXTBLOB);
      // 面板控件数量、场景按钮规模与状态栏文案都必须来自 schema。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.groupId).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.statusMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.keyLabelMatched).assertEqual(observed.paramCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0017 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0018
     * @tc.name      testNdkRenderNodeCapability0018
     * @tc.desc      校验排版域页面标题、初始状态栏与参数控件均与排版 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0018 begin');
      const observed: GroupPanelObs = await verifyGroupPanel(Driver.create(), DOMAIN_TYPOGRAPHY);
      // 面板控件数量、场景按钮规模与状态栏文案都必须来自 schema。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.groupId).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.statusMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.keyLabelMatched).assertEqual(observed.paramCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0018 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0019
     * @tc.name      testNdkRenderNodeCapability0019
     * @tc.desc      校验阴影层域页面标题、初始状态栏与参数控件均与阴影 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0019 begin');
      const observed: GroupPanelObs = await verifyGroupPanel(Driver.create(), DOMAIN_SHADOW);
      // 面板控件数量、场景按钮规模与状态栏文案都必须来自 schema。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.groupId).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.statusMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.keyLabelMatched).assertEqual(observed.paramCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0019 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0020
     * @tc.name      testNdkRenderNodeCapability0020
     * @tc.desc      校验矩阵域页面标题、初始状态栏与参数控件均与矩阵 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0020 begin');
      const observed: GroupPanelObs = await verifyGroupPanel(Driver.create(), DOMAIN_MATRIX);
      // 面板控件数量、场景按钮规模与状态栏文案都必须来自 schema。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.groupId).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.statusMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.keyLabelMatched).assertEqual(observed.paramCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0020 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0021
     * @tc.name      testNdkRenderNodeCapability0021
     * @tc.desc      校验录制命令域页面标题、初始状态栏与参数控件均与录制 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0021 begin');
      const observed: GroupPanelObs = await verifyGroupPanel(Driver.create(), DOMAIN_RECORD);
      // 面板控件数量、场景按钮规模与状态栏文案都必须来自 schema。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.groupId).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.statusMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.keyLabelMatched).assertEqual(observed.paramCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0021 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0022
     * @tc.name      testNdkRenderNodeCapability0022
     * @tc.desc      校验离屏表面域页面标题、初始状态栏与参数控件均与离屏表面 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0022 begin');
      const observed: GroupPanelObs = await verifyGroupPanel(Driver.create(), DOMAIN_OFFSCREEN);
      // 面板控件数量、场景按钮规模与状态栏文案都必须来自 schema。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.groupId).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.statusMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.keyLabelMatched).assertEqual(observed.paramCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0022 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0023
     * @tc.name      testNdkRenderNodeCapability0023
     * @tc.desc      校验错误码域页面标题、初始状态栏与参数控件均与错误码 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0023 begin');
      const observed: GroupPanelObs = await verifyGroupPanel(Driver.create(), DOMAIN_ERROR);
      // 面板控件数量、场景按钮规模与状态栏文案都必须来自 schema。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.groupId).assertLarger(0);
      expect(observed.titleMatched).assertTrue();
      expect(observed.descMatched).assertTrue();
      expect(observed.statusMatched).assertTrue();
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.sliderMatched).assertTrue();
      expect(observed.toggleMatched).assertTrue();
      expect(observed.selectMatched).assertTrue();
      expect(observed.keyLabelMatched).assertEqual(observed.paramCount);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0023 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0024
     * @tc.name      testNdkRenderNodeCapability0024
     * @tc.desc      校验切换画布场景后状态栏场景编号与参数摘要同步更新，场景说明来自目标场景。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0024 begin');
      const driver: Driver = Driver.create();
      const group: GroupSpec = CAPABILITY_GROUPS[0];
      expect(await openGroup(driver, group)).assertTrue();
      const spec: SceneSpec = group.scenes[1];
      expect(await clickScene(driver, group.key, spec.id, TAG)).assertTrue();
      await delay(driver, UI_SETTLE_TIME);
      const status: string = 'scene ' + spec.id.toString() + ' · ' +
        ParamEngine.summary(spec, ParamEngine.defaults(spec));
      logInfo(TAG, 'scene switch status: ' + status);
      expect(await findText(driver, status, TAG) !== undefined).assertTrue();
      expect(await waitForId(driver, sceneDescId(group.key, spec.id), TAG)).assertTrue();
      expect(await backToCatalog(driver, group.key)).assertTrue();
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0024 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0025
     * @tc.name      testNdkRenderNodeCapability0025
     * @tc.desc      校验排版域方向场景的开关点击后状态栏变为开启，重置后回到默认关闭状态。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0025 begin');
      const driver: Driver = Driver.create();
      const group: GroupSpec = CAPABILITY_GROUPS[13];
      expect(await openGroup(driver, group)).assertTrue();
      const spec: SceneSpec = group.scenes[12];
      expect(await clickScene(driver, group.key, spec.id, TAG)).assertTrue();
      await delay(driver, UI_SETTLE_TIME);
      const values: number[] = ParamEngine.defaults(spec);
      const base: string = 'scene ' + spec.id.toString() + ' · ' + ParamEngine.summary(spec, values);
      expect(await findText(driver, base, TAG) !== undefined).assertTrue();
      const toggle: Component | undefined = await findType(driver, 'Toggle', TAG);
      expect(toggle !== undefined).assertTrue();
      if (toggle === undefined) {
        return;
      }
      await toggle.click();
      await delay(driver, UI_SETTLE_TIME);
      const toggled: string = 'scene ' + spec.id.toString() + ' · ' +
        ParamEngine.summary(spec, ParamEngine.withValue(spec, values, 1, 1));
      logInfo(TAG, 'toggle on status: ' + toggled);
      expect(await findText(driver, toggled, TAG) !== undefined).assertTrue();
      expect(await clickId(driver, paramsResetId(group.key), TAG)).assertTrue();
      await delay(driver, UI_SETTLE_TIME);
      expect(await findText(driver, base, TAG) !== undefined).assertTrue();
      expect(await backToCatalog(driver, group.key)).assertTrue();
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0025 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_CAPABILITY_0026
     * @tc.name      testNdkRenderNodeCapability0026
     * @tc.desc      校验目录页每个条目的场景计数与说明文本均来自对应能力域 schema。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeCapability0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeCapability0026 begin');
      const driver: Driver = Driver.create();
      expect(await openCatalog(driver, TAG)).assertTrue();
      for (const group of CAPABILITY_GROUPS) {
        const scrolled: boolean = await scrollToId(driver, catalogItemId(group.key), TAG);
        logInfo(TAG, 'catalog entry scroll ' + group.key + ' = ' + scrolled.toString());
        expect(scrolled).assertTrue();
        const countLabel: string = await textOfId(driver, catalogItemCountId(group.key), TAG);
        const hasCount: boolean = countLabel.indexOf(group.scenes.length.toString()) >= 0;
        logInfo(TAG, 'catalog entry count ' + group.key + ' -> ' + countLabel + ' = ' + hasCount.toString());
        expect(hasCount).assertTrue();
        // 条目滚到列表边缘时说明文本可能被裁剪出无障碍树，改用滚动搜索再定位一次。
        let hasDesc: boolean = await findId(driver, catalogItemDescId(group.key), TAG) !== undefined;
        if (!hasDesc) {
          hasDesc = await scrollToId(driver, catalogItemDescId(group.key), TAG);
        }
        logInfo(TAG, 'catalog entry desc ' + group.key + ' = ' + hasDesc.toString());
        expect(hasDesc).assertTrue();
      }
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeCapability0026 end');
    })
  })
}
