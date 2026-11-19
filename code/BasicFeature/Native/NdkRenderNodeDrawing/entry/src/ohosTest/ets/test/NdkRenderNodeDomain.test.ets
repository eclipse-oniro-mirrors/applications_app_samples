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
  ID_CATALOG_PAGE_TITLE,
  logInfo,
  navBackId,
  openCapabilityGroup,
  openCatalog,
  paramsResetId,
  paramsTitleId,
  sceneDescId,
  waitForId,
  waitForText
} from './UiDriverUtil';
import { ParamEngine } from '../../../main/ets/core/ParamEngine';
import { GroupSpec, PARAM_RANGE, PARAM_SELECT, PARAM_TOGGLE, SceneSpec } from '../../../main/ets/core/SchemaTypes';
import { CAPABILITY_GROUPS } from './SceneDefaults';

const TAG: string = '[Sample_NdkRenderNodeDomainTest]';
// 能力域页面上除场景按钮之外的两个按钮：返回与重置。
const EXTRA_BUTTONS: number = 2;
const DOMAIN_TOTAL: number = 19;
// 首末场景来回切换的轮次。
const SWITCH_ROUNDS: number = 2;
// 每个域的首场景下标。
const SCENE_FIRST: number = 0;
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

// 能力域页底部状态栏文案，GroupHost 固定输出「scene <id> · <参数摘要>」。
function statusOf(spec: SceneSpec): string {
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

// 从目录页进入指定能力域页面，以页面标题出现作为就绪标志。
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

// 逐场景巡检的观测量：把每个场景的状态栏、说明与控件匹配情况累计下来。
class DomainSweepObs {
  public groupKey: string = '';
  public groupId: number = 0;
  public sceneCount: number = 0;
  public sweptCount: number = 0;
  public statusMatched: number = 0;
  public descMatched: number = 0;
  public controlMatched: number = 0;
  public opened: boolean = false;
  public returnedToCatalog: boolean = false;
  public returnedToIndex: boolean = false;
}

// 逐个切换能力域的全部场景：每个场景都要刷新状态栏、场景说明与三类参数控件。
async function sweepDomainScenes(driver: Driver, index: number): Promise<DomainSweepObs> {
  const observed: DomainSweepObs = new DomainSweepObs();
  const group: GroupSpec = CAPABILITY_GROUPS[index];
  observed.groupKey = group.key;
  observed.groupId = group.id;
  observed.sceneCount = group.scenes.length;
  observed.opened = await openGroup(driver, group);
  expect(observed.opened).assertTrue();
  for (const spec of group.scenes) {
    expect(await clickScene(driver, group.key, spec.id, TAG)).assertTrue();
    const status: string = statusOf(spec);
    const statusReady: boolean = await waitForText(driver, status, TAG);
    if (!statusReady) {
      // 状态栏未按预期刷新时把当前页全部文本打进日志，便于区分是参数被回写还是渲染延迟。
      const liveTexts: string[] = await collectTexts(driver, TAG);
      logInfo(TAG, 'status mismatch, expect=[' + status + '] live=[' + liveTexts.join(' || ') + ']');
    }
    expect(statusReady).assertTrue();
    if (statusReady) {
      observed.statusMatched += 1;
    }
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
  logInfo(TAG, 'domain ' + group.key + ' swept ' + observed.sweptCount.toString() + ' scenes');
  expect(observed.sweptCount).assertEqual(group.scenes.length);
  observed.returnedToCatalog = await backToCatalog(driver, group.key);
  expect(observed.returnedToCatalog).assertTrue();
  observed.returnedToIndex = await backToIndex(driver, TAG);
  expect(observed.returnedToIndex).assertTrue();
  return observed;
}

// 首末场景切换的观测量：按钮规模、切换轮次与重置结果。
class DomainSwitchObs {
  public groupKey: string = '';
  public groupId: number = 0;
  public sceneCount: number = 0;
  public buttonCount: number = 0;
  public rounds: number = 0;
  public firstSceneId: number = -1;
  public lastSceneId: number = -1;
  public resetRestored: boolean = false;
  public returnedToCatalog: boolean = false;
  public returnedToIndex: boolean = false;
}

// 首末场景来回切换两轮，校验面板随 schema 重建、按钮规模恒定、重置后状态栏不变。
async function verifySceneSwitch(driver: Driver, index: number): Promise<DomainSwitchObs> {
  const observed: DomainSwitchObs = new DomainSwitchObs();
  const group: GroupSpec = CAPABILITY_GROUPS[index];
  observed.groupKey = group.key;
  observed.groupId = group.id;
  observed.sceneCount = group.scenes.length;
  expect(await openGroup(driver, group)).assertTrue();
  observed.buttonCount = await countType(driver, 'Button', TAG);
  expect(observed.buttonCount).assertEqual(group.scenes.length + EXTRA_BUTTONS);
  expect(await countId(driver, paramsTitleId(group.key), TAG)).assertEqual(1);
  // 工具栏重置按钮带 group.key 后缀，与 Error 域同名场景按钮不再混淆。
  expect(await countId(driver, paramsResetId(group.key), TAG)).assertEqual(1);
  const first: SceneSpec = group.scenes[0];
  const last: SceneSpec = group.scenes[group.scenes.length - 1];
  observed.firstSceneId = first.id;
  observed.lastSceneId = last.id;
  for (let round = 0; round < SWITCH_ROUNDS; round++) {
    expect(await clickScene(driver, group.key, last.id, TAG)).assertTrue();
    expect(await waitForText(driver, statusOf(last), TAG)).assertTrue();
    expect(await countType(driver, 'Slider', TAG)).assertEqual(countKind(last, PARAM_RANGE));
    expect(await countType(driver, 'Toggle', TAG)).assertEqual(countKind(last, PARAM_TOGGLE));
    expect(await countType(driver, 'Select', TAG)).assertEqual(countKind(last, PARAM_SELECT));
    expect(await clickScene(driver, group.key, first.id, TAG)).assertTrue();
    expect(await waitForText(driver, statusOf(first), TAG)).assertTrue();
    expect(await countType(driver, 'Slider', TAG)).assertEqual(countKind(first, PARAM_RANGE));
    observed.rounds += 1;
    logInfo(TAG, 'domain ' + group.key + ' round ' + round.toString() + ' switched');
  }
  // 重置只恢复参数，不改变当前场景，状态栏仍应是首场景默认摘要。
  const resetClicked: boolean = await clickId(driver, paramsResetId(group.key), TAG);
  const resetStatus: boolean = await waitForText(driver, statusOf(first), TAG);
  observed.resetRestored = resetClicked && resetStatus;
  expect(resetClicked).assertTrue();
  expect(resetStatus).assertTrue();
  observed.returnedToCatalog = await backToCatalog(driver, group.key);
  expect(observed.returnedToCatalog).assertTrue();
  observed.returnedToIndex = await backToIndex(driver, TAG);
  expect(observed.returnedToIndex).assertTrue();
  return observed;
}

export default function ndkRenderNodeDomainTest(): void {
  describe('NdkRenderNodeDomain', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0001
     * @tc.name      testNdkRenderNodeDomain0001
     * @tc.desc      校验画布与裁剪域十个场景逐个切换后状态栏、场景说明与参数控件均与画布 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeDomain0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0001 begin');
      expect(CAPABILITY_GROUPS.length).assertEqual(DOMAIN_TOTAL);
      const observed: DomainSweepObs = await sweepDomainScenes(Driver.create(), DOMAIN_CANVAS);
      // 逐场景巡检必须覆盖全部场景，状态栏、说明与控件三类判定都要命中。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.statusMatched).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0002
     * @tc.name      testNdkRenderNodeDomain0002
     * @tc.desc      校验画布与裁剪域首末场景来回切换两轮后面板按 schema 重建，重置后状态栏保持首场景摘要。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeDomain0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0002 begin');
      const observed: DomainSwitchObs = await verifySceneSwitch(Driver.create(), DOMAIN_CANVAS);
      // 按钮规模等于场景数加返回与重置两个工具按钮，来回切换轮次固定。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.rounds).assertEqual(SWITCH_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetRestored).assertTrue();
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0003
     * @tc.name      testNdkRenderNodeDomain0003
     * @tc.desc      校验几何与路径域十一个场景逐个切换后状态栏、场景说明与参数控件均与几何 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0003 begin');
      const observed: DomainSweepObs = await sweepDomainScenes(Driver.create(), DOMAIN_GEOMETRY);
      // 逐场景巡检必须覆盖全部场景，状态栏、说明与控件三类判定都要命中。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.statusMatched).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0004
     * @tc.name      testNdkRenderNodeDomain0004
     * @tc.desc      校验几何与路径域首末场景来回切换两轮后面板按 schema 重建，重置后状态栏保持首场景摘要。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0004 begin');
      const observed: DomainSwitchObs = await verifySceneSwitch(Driver.create(), DOMAIN_GEOMETRY);
      // 按钮规模等于场景数加返回与重置两个工具按钮，来回切换轮次固定。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.rounds).assertEqual(SWITCH_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetRestored).assertTrue();
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0005
     * @tc.name      testNdkRenderNodeDomain0005
     * @tc.desc      校验画笔与画刷域十个场景逐个切换后状态栏、场景说明与参数控件均与画笔 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0005 begin');
      const observed: DomainSweepObs = await sweepDomainScenes(Driver.create(), DOMAIN_PAINT);
      // 逐场景巡检必须覆盖全部场景，状态栏、说明与控件三类判定都要命中。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.statusMatched).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0006
     * @tc.name      testNdkRenderNodeDomain0006
     * @tc.desc      校验画笔与画刷域首末场景来回切换两轮后面板按 schema 重建，重置后状态栏保持首场景摘要。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0006 begin');
      const observed: DomainSwitchObs = await verifySceneSwitch(Driver.create(), DOMAIN_PAINT);
      // 按钮规模等于场景数加返回与重置两个工具按钮，来回切换轮次固定。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.rounds).assertEqual(SWITCH_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetRestored).assertTrue();
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0006 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0007
     * @tc.name      testNdkRenderNodeDomain0007
     * @tc.desc      校验颜色模型域九个场景逐个切换后状态栏、场景说明与参数控件均与颜色 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0007 begin');
      const observed: DomainSweepObs = await sweepDomainScenes(Driver.create(), DOMAIN_COLOR);
      // 逐场景巡检必须覆盖全部场景，状态栏、说明与控件三类判定都要命中。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.statusMatched).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0007 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0008
     * @tc.name      testNdkRenderNodeDomain0008
     * @tc.desc      校验颜色模型域首末场景来回切换两轮后面板按 schema 重建，重置后状态栏保持首场景摘要。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0008 begin');
      const observed: DomainSwitchObs = await verifySceneSwitch(Driver.create(), DOMAIN_COLOR);
      // 按钮规模等于场景数加返回与重置两个工具按钮，来回切换轮次固定。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.rounds).assertEqual(SWITCH_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetRestored).assertTrue();
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0008 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0009
     * @tc.name      testNdkRenderNodeDomain0009
     * @tc.desc      校验颜色滤镜域九个场景逐个切换后状态栏、场景说明与参数控件均与滤镜 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0009 begin');
      const observed: DomainSweepObs = await sweepDomainScenes(Driver.create(), DOMAIN_COLOR_FILTER);
      // 逐场景巡检必须覆盖全部场景，状态栏、说明与控件三类判定都要命中。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.statusMatched).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0009 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0010
     * @tc.name      testNdkRenderNodeDomain0010
     * @tc.desc      校验颜色滤镜域首末场景来回切换两轮后面板按 schema 重建，重置后状态栏保持首场景摘要。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0010 begin');
      const observed: DomainSwitchObs = await verifySceneSwitch(Driver.create(), DOMAIN_COLOR_FILTER);
      // 按钮规模等于场景数加返回与重置两个工具按钮，来回切换轮次固定。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.rounds).assertEqual(SWITCH_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetRestored).assertTrue();
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0010 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0011
     * @tc.name      testNdkRenderNodeDomain0011
     * @tc.desc      校验着色器与渐变域十一个场景逐个切换后状态栏、场景说明与参数控件均与着色 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0011 begin');
      const observed: DomainSweepObs = await sweepDomainScenes(Driver.create(), DOMAIN_SHADER);
      // 逐场景巡检必须覆盖全部场景，状态栏、说明与控件三类判定都要命中。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.statusMatched).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0011 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0012
     * @tc.name      testNdkRenderNodeDomain0012
     * @tc.desc      校验着色器与渐变域首末场景来回切换两轮后面板按 schema 重建，重置后状态栏保持首场景摘要。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0012 begin');
      const observed: DomainSwitchObs = await verifySceneSwitch(Driver.create(), DOMAIN_SHADER);
      // 按钮规模等于场景数加返回与重置两个工具按钮，来回切换轮次固定。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.rounds).assertEqual(SWITCH_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetRestored).assertTrue();
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0012 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0013
     * @tc.name      testNdkRenderNodeDomain0013
     * @tc.desc      校验遮罩滤镜域八个场景逐个切换后状态栏、场景说明与参数控件均与遮罩 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0013 begin');
      const observed: DomainSweepObs = await sweepDomainScenes(Driver.create(), DOMAIN_MASK_FILTER);
      // 逐场景巡检必须覆盖全部场景，状态栏、说明与控件三类判定都要命中。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.statusMatched).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0013 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0014
     * @tc.name      testNdkRenderNodeDomain0014
     * @tc.desc      校验遮罩滤镜域首末场景来回切换两轮后面板按 schema 重建，重置后状态栏保持首场景摘要。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0014 begin');
      const observed: DomainSwitchObs = await verifySceneSwitch(Driver.create(), DOMAIN_MASK_FILTER);
      // 按钮规模等于场景数加返回与重置两个工具按钮，来回切换轮次固定。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.rounds).assertEqual(SWITCH_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetRestored).assertTrue();
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0014 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0015
     * @tc.name      testNdkRenderNodeDomain0015
     * @tc.desc      校验图像滤镜域十个场景逐个切换后状态栏、场景说明与参数控件均与图像滤镜 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0015 begin');
      const observed: DomainSweepObs = await sweepDomainScenes(Driver.create(), DOMAIN_IMAGE_FILTER);
      // 逐场景巡检必须覆盖全部场景，状态栏、说明与控件三类判定都要命中。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.statusMatched).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0015 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0016
     * @tc.name      testNdkRenderNodeDomain0016
     * @tc.desc      校验图像滤镜域首末场景来回切换两轮后面板按 schema 重建，重置后状态栏保持首场景摘要。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0016 begin');
      const observed: DomainSwitchObs = await verifySceneSwitch(Driver.create(), DOMAIN_IMAGE_FILTER);
      // 按钮规模等于场景数加返回与重置两个工具按钮，来回切换轮次固定。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.rounds).assertEqual(SWITCH_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetRestored).assertTrue();
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0016 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0017
     * @tc.name      testNdkRenderNodeDomain0017
     * @tc.desc      校验位图域十个场景逐个切换后状态栏、场景说明与参数控件均与位图 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0017 begin');
      const observed: DomainSweepObs = await sweepDomainScenes(Driver.create(), DOMAIN_BITMAP);
      // 逐场景巡检必须覆盖全部场景，状态栏、说明与控件三类判定都要命中。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.statusMatched).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0017 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0018
     * @tc.name      testNdkRenderNodeDomain0018
     * @tc.desc      校验位图域首末场景来回切换两轮后面板按 schema 重建，重置后状态栏保持首场景摘要。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0018 begin');
      const observed: DomainSwitchObs = await verifySceneSwitch(Driver.create(), DOMAIN_BITMAP);
      // 按钮规模等于场景数加返回与重置两个工具按钮，来回切换轮次固定。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.rounds).assertEqual(SWITCH_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetRestored).assertTrue();
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0018 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0019
     * @tc.name      testNdkRenderNodeDomain0019
     * @tc.desc      校验像素图域十二个场景逐个切换后状态栏、场景说明与参数控件均与像素图 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0019 begin');
      const observed: DomainSweepObs = await sweepDomainScenes(Driver.create(), DOMAIN_PIXELMAP);
      // 逐场景巡检必须覆盖全部场景，状态栏、说明与控件三类判定都要命中。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.statusMatched).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0019 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0020
     * @tc.name      testNdkRenderNodeDomain0020
     * @tc.desc      校验像素图域首末场景来回切换两轮后面板按 schema 重建，重置后状态栏保持首场景摘要。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0020 begin');
      const observed: DomainSwitchObs = await verifySceneSwitch(Driver.create(), DOMAIN_PIXELMAP);
      // 按钮规模等于场景数加返回与重置两个工具按钮，来回切换轮次固定。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.rounds).assertEqual(SWITCH_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetRestored).assertTrue();
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0020 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0021
     * @tc.name      testNdkRenderNodeDomain0021
     * @tc.desc      校验图像编解码域十个场景逐个切换后状态栏、场景说明与参数控件均与编解码 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0021 begin');
      const observed: DomainSweepObs = await sweepDomainScenes(Driver.create(), DOMAIN_IMAGE_IO);
      // 逐场景巡检必须覆盖全部场景，状态栏、说明与控件三类判定都要命中。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.statusMatched).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0021 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0022
     * @tc.name      testNdkRenderNodeDomain0022
     * @tc.desc      校验图像编解码域首末场景来回切换两轮后面板按 schema 重建，重置后状态栏保持首场景摘要。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0022 begin');
      const observed: DomainSwitchObs = await verifySceneSwitch(Driver.create(), DOMAIN_IMAGE_IO);
      // 按钮规模等于场景数加返回与重置两个工具按钮，来回切换轮次固定。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.rounds).assertEqual(SWITCH_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetRestored).assertTrue();
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0022 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0023
     * @tc.name      testNdkRenderNodeDomain0023
     * @tc.desc      校验字体域十二个场景逐个切换后状态栏、场景说明与参数控件均与字体 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0023 begin');
      const observed: DomainSweepObs = await sweepDomainScenes(Driver.create(), DOMAIN_FONT);
      // 逐场景巡检必须覆盖全部场景，状态栏、说明与控件三类判定都要命中。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.statusMatched).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0023 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0024
     * @tc.name      testNdkRenderNodeDomain0024
     * @tc.desc      校验字体域首末场景来回切换两轮后面板按 schema 重建，重置后状态栏保持首场景摘要。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0024 begin');
      const observed: DomainSwitchObs = await verifySceneSwitch(Driver.create(), DOMAIN_FONT);
      // 按钮规模等于场景数加返回与重置两个工具按钮，来回切换轮次固定。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.rounds).assertEqual(SWITCH_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetRestored).assertTrue();
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0024 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0025
     * @tc.name      testNdkRenderNodeDomain0025
     * @tc.desc      校验文本块域八个场景逐个切换后状态栏、场景说明与参数控件均与文本块 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0025 begin');
      const observed: DomainSweepObs = await sweepDomainScenes(Driver.create(), DOMAIN_TEXTBLOB);
      // 逐场景巡检必须覆盖全部场景，状态栏、说明与控件三类判定都要命中。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.statusMatched).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0025 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0026
     * @tc.name      testNdkRenderNodeDomain0026
     * @tc.desc      校验文本块域首末场景来回切换两轮后面板按 schema 重建，重置后状态栏保持首场景摘要。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0026 begin');
      const observed: DomainSwitchObs = await verifySceneSwitch(Driver.create(), DOMAIN_TEXTBLOB);
      // 按钮规模等于场景数加返回与重置两个工具按钮，来回切换轮次固定。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.rounds).assertEqual(SWITCH_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetRestored).assertTrue();
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0026 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0027
     * @tc.name      testNdkRenderNodeDomain0027
     * @tc.desc      校验排版域十四个场景逐个切换后状态栏、场景说明与参数控件均与排版 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0027 begin');
      const observed: DomainSweepObs = await sweepDomainScenes(Driver.create(), DOMAIN_TYPOGRAPHY);
      // 逐场景巡检必须覆盖全部场景，状态栏、说明与控件三类判定都要命中。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.statusMatched).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0027 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0028
     * @tc.name      testNdkRenderNodeDomain0028
     * @tc.desc      校验排版域首末场景来回切换两轮后面板按 schema 重建，重置后状态栏保持首场景摘要。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0028 begin');
      const observed: DomainSwitchObs = await verifySceneSwitch(Driver.create(), DOMAIN_TYPOGRAPHY);
      // 按钮规模等于场景数加返回与重置两个工具按钮，来回切换轮次固定。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.rounds).assertEqual(SWITCH_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetRestored).assertTrue();
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0028 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0029
     * @tc.name      testNdkRenderNodeDomain0029
     * @tc.desc      校验阴影层域八个场景逐个切换后状态栏、场景说明与参数控件均与阴影 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0029 begin');
      const observed: DomainSweepObs = await sweepDomainScenes(Driver.create(), DOMAIN_SHADOW);
      // 逐场景巡检必须覆盖全部场景，状态栏、说明与控件三类判定都要命中。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.statusMatched).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0029 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0030
     * @tc.name      testNdkRenderNodeDomain0030
     * @tc.desc      校验阴影层域首末场景来回切换两轮后面板按 schema 重建，重置后状态栏保持首场景摘要。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0030 begin');
      const observed: DomainSwitchObs = await verifySceneSwitch(Driver.create(), DOMAIN_SHADOW);
      // 按钮规模等于场景数加返回与重置两个工具按钮，来回切换轮次固定。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.rounds).assertEqual(SWITCH_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetRestored).assertTrue();
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0030 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0031
     * @tc.name      testNdkRenderNodeDomain0031
     * @tc.desc      校验矩阵域十个场景逐个切换后状态栏、场景说明与参数控件均与矩阵 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0031 begin');
      const observed: DomainSweepObs = await sweepDomainScenes(Driver.create(), DOMAIN_MATRIX);
      // 逐场景巡检必须覆盖全部场景，状态栏、说明与控件三类判定都要命中。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.statusMatched).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0031 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0032
     * @tc.name      testNdkRenderNodeDomain0032
     * @tc.desc      校验矩阵域首末场景来回切换两轮后面板按 schema 重建，重置后状态栏保持首场景摘要。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0032 begin');
      const observed: DomainSwitchObs = await verifySceneSwitch(Driver.create(), DOMAIN_MATRIX);
      // 按钮规模等于场景数加返回与重置两个工具按钮，来回切换轮次固定。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.rounds).assertEqual(SWITCH_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetRestored).assertTrue();
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0032 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0033
     * @tc.name      testNdkRenderNodeDomain0033
     * @tc.desc      校验录制命令域八个场景逐个切换后状态栏、场景说明与参数控件均与录制 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0033 begin');
      const observed: DomainSweepObs = await sweepDomainScenes(Driver.create(), DOMAIN_RECORD);
      // 逐场景巡检必须覆盖全部场景，状态栏、说明与控件三类判定都要命中。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.statusMatched).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0033 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0034
     * @tc.name      testNdkRenderNodeDomain0034
     * @tc.desc      校验录制命令域首末场景来回切换两轮后面板按 schema 重建，重置后状态栏保持首场景摘要。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0034 begin');
      const observed: DomainSwitchObs = await verifySceneSwitch(Driver.create(), DOMAIN_RECORD);
      // 按钮规模等于场景数加返回与重置两个工具按钮，来回切换轮次固定。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.rounds).assertEqual(SWITCH_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetRestored).assertTrue();
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0034 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0035
     * @tc.name      testNdkRenderNodeDomain0035
     * @tc.desc      校验离屏表面域八个场景逐个切换后状态栏、场景说明与参数控件均与离屏表面 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0035 begin');
      const observed: DomainSweepObs = await sweepDomainScenes(Driver.create(), DOMAIN_OFFSCREEN);
      // 逐场景巡检必须覆盖全部场景，状态栏、说明与控件三类判定都要命中。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.statusMatched).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0035 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0036
     * @tc.name      testNdkRenderNodeDomain0036
     * @tc.desc      校验离屏表面域首末场景来回切换两轮后面板按 schema 重建，重置后状态栏保持首场景摘要。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0036 begin');
      const observed: DomainSwitchObs = await verifySceneSwitch(Driver.create(), DOMAIN_OFFSCREEN);
      // 按钮规模等于场景数加返回与重置两个工具按钮，来回切换轮次固定。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.rounds).assertEqual(SWITCH_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetRestored).assertTrue();
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0036 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0037
     * @tc.name      testNdkRenderNodeDomain0037
     * @tc.desc      校验错误码域十个场景逐个切换后状态栏、场景说明与参数控件均与错误码 schema 一致。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0037 begin');
      const observed: DomainSweepObs = await sweepDomainScenes(Driver.create(), DOMAIN_ERROR);
      // 逐场景巡检必须覆盖全部场景，状态栏、说明与控件三类判定都要命中。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.sweptCount).assertEqual(observed.sceneCount);
      expect(observed.statusMatched).assertEqual(observed.sceneCount);
      expect(observed.descMatched).assertEqual(observed.sceneCount);
      expect(observed.controlMatched).assertEqual(observed.sceneCount);
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0037 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_DOMAIN_0038
     * @tc.name      testNdkRenderNodeDomain0038
     * @tc.desc      校验错误码域首末场景来回切换两轮后面板按 schema 重建，重置后状态栏保持首场景摘要。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeDomain0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeDomain0038 begin');
      const observed: DomainSwitchObs = await verifySceneSwitch(Driver.create(), DOMAIN_ERROR);
      // 按钮规模等于场景数加返回与重置两个工具按钮，来回切换轮次固定。
      expect(observed.groupKey.length).assertLarger(0);
      expect(observed.buttonCount).assertEqual(observed.sceneCount + EXTRA_BUTTONS);
      expect(observed.rounds).assertEqual(SWITCH_ROUNDS);
      expect(observed.firstSceneId).assertEqual(SCENE_FIRST);
      expect(observed.lastSceneId).assertEqual(observed.sceneCount - 1);
      expect(observed.resetRestored).assertTrue();
      expect(observed.returnedToCatalog).assertTrue();
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeDomain0038 end');
    })
  })
}
