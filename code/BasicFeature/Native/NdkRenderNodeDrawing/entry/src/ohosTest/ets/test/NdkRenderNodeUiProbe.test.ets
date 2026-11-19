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

import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Driver } from '@kit.TestKit';
import {
  backToIndex,
  clickBack,
  clickId,
  clickIndexItem,
  countId,
  demoCanvasId,
  findId,
  groupCanvasId,
  ID_BLUR_CANVAS,
  ID_BLUR_MODE_BACKGROUND,
  ID_BLUR_MODE_CONTENT,
  ID_BLUR_MODE_FOREGROUND,
  ID_BLUR_RADIUS,
  ID_BLUR_RESET,
  ID_DRAW_CANVAS,
  ID_DRAW_IMAGE,
  ID_DRAW_PATH,
  ID_DRAW_TEXT,
  ID_INDEX_TITLE,
  ID_LIFECYCLE_DISPOSE,
  ID_LIFECYCLE_DISPOSED,
  ID_LIFECYCLE_INVALIDATE,
  ID_LIFECYCLE_LABEL,
  ID_LIFECYCLE_RECREATE,
  ID_NODE_TREE_ADD,
  ID_NODE_TREE_CANVAS,
  ID_NODE_TREE_CHILD_COUNT,
  ID_NODE_TREE_REMOVE,
  ID_NODE_TREE_RESET,
  ID_PROP_BACKGROUND_TOGGLE,
  ID_PROP_CLIP_TOGGLE,
  ID_PROP_OPACITY_TOGGLE,
  ID_PROP_ROTATION_TOGGLE,
  ID_PROP_SCALE_TOGGLE,
  ID_PROP_SHADOW_TOGGLE,
  ID_TEXT_MEASURE_BTN,
  ID_TEXT_MEASURE_RESULT,
  launchAbility,
  logInfo,
  openCapabilityGroup,
  openCatalog,
  openTopicCatalog,
  openTopicGroup,
  pageBackId,
  pageTitleId,
  paramControlId,
  paramKeyId,
  paramRowId,
  paramSceneKey,
  paramValueId,
  PAGE_BLUR,
  PAGE_DRAW,
  PAGE_LIFECYCLE,
  PAGE_NODE_TREE,
  PAGE_RENDER_PROPERTY,
  PAGE_TEXT,
  sceneButtonId,
  textOfId,
  waitForId
} from './UiDriverUtil';
import { CAPABILITY_GROUPS, TOPIC_GROUPS } from './SceneDefaults';
import { GroupSpec, SceneSpec } from '../../../main/ets/core/SchemaTypes';

const TAG: string = '[Sample_NdkRenderNodeUiProbe]';
// 冷启动预热与单个控件探测的等待上限，单位毫秒；冷启动明显长于页内控件就绪。
const WARMUP_TIMEOUT: number = 30000;
const CONTROL_TIMEOUT: number = 5000;
// 冷启动可能一次拉起不成功（安装后第一次进程初始化偏慢），最多重试三轮。
const WARMUP_ROUNDS: number = 3;
// 各演示页预期可定位的页面级控件个数，与 P0-c 补的 id 一一对应。
const DRAW_CONTROLS: number = 3;
const BLUR_CONTROLS: number = 5;
const NODE_TREE_CONTROLS: number = 4;
const LIFECYCLE_CONTROLS: number = 5;
const PROP_CONTROLS: number = 6;
// 能力域页面回到首页要经过「能力域页 → 目录页 → 首页」两级。
const GROUP_BACK_STEPS: number = 2;
// 参数面板第一个参数在场景中的下标。
const PARAM_FIRST: number = 0;
// 演示页巡检结果：标题、返回、画布与页面级控件是否都能按 id 命中。
class DemoProbeObs {
  public pageKey: string = '';
  public entered: boolean = false;
  public titleFound: boolean = false;
  public backFound: boolean = false;
  public canvasFound: boolean = false;
  public controlTotal: number = 0;
  public controlFound: number = 0;
  public returnedToIndex: boolean = false;
}

// 冷启动预热：刚安装或 force-stop 后第一个用例必须先拉起应用，
// 否则 ensureIndex 内的兜底拉起会把启动耗时计成用例失败。
// 单轮「等待 + 拉起 + 再等待」不够时继续下一轮，三轮仍失败才判定预热失败。
async function warmUp(driver: Driver): Promise<boolean> {
  for (let round = 0; round < WARMUP_ROUNDS; round++) {
    if (await waitForId(driver, ID_INDEX_TITLE, TAG, WARMUP_TIMEOUT)) {
      return true;
    }
    logInfo(TAG, 'warmUp round ' + round.toString() + ' launch ability');
    if (!await launchAbility(TAG)) {
      logInfo(TAG, 'warmUp round ' + round.toString() + ' launchAbility failed');
    }
  }
  return false;
}

// 从首页进入单个演示页，逐个探测标题/返回/画布/页面控件，最后退回首页。
async function probeDemoPage(driver: Driver, pageKey: string, canvasId: string,
  controls: string[]): Promise<DemoProbeObs> {
  const observed: DemoProbeObs = new DemoProbeObs();
  observed.pageKey = pageKey;
  observed.controlTotal = controls.length;
  const ready: boolean = await warmUp(driver);
  // 入口可能排在首页列表的屏幕外，clickIndexItem 内部已含滚动重试。
  observed.entered = ready ? await clickIndexItem(driver, pageKey, TAG) : false;
  if (observed.entered) {
    observed.titleFound = await waitForId(driver, pageTitleId(pageKey), TAG);
  }
  observed.backFound = await findId(driver, pageBackId(pageKey), TAG) !== undefined;
  observed.canvasFound = await waitForId(driver, canvasId, TAG, CONTROL_TIMEOUT);
  for (const id of controls) {
    if (await waitForId(driver, id, TAG, CONTROL_TIMEOUT)) {
      observed.controlFound += 1;
    } else {
      logInfo(TAG, 'demo ' + pageKey + ' missing control ' + id);
    }
  }
  observed.returnedToIndex = await backToIndex(driver, TAG);
  logInfo(TAG, 'demo ' + pageKey + ' entered=' + observed.entered.toString() + ' title=' +
    observed.titleFound.toString() + ' canvas=' + observed.canvasFound.toString() + ' controls=' +
    observed.controlFound.toString() + '/' + observed.controlTotal.toString());
  return observed;
}

// 文本演示页巡检结果：除了页面级 id，还校验测量结果文本。
class TextProbeObs {
  public entered: boolean = false;
  public titleFound: boolean = false;
  public backFound: boolean = false;
  public canvasFound: boolean = false;
  public measureFound: boolean = false;
  public resultFound: boolean = false;
  public resultLength: number = 0;
  public returnedToIndex: boolean = false;
}

// 文本页的测量结果在未点击测量前是空串，空文本不会进入控件树，
// 所以必须点一下测量按钮再按 id 定位，这也顺带验证了测量按钮的点击通路。
async function probeTextPage(driver: Driver): Promise<TextProbeObs> {
  const observed: TextProbeObs = new TextProbeObs();
  const ready: boolean = await warmUp(driver);
  observed.entered = ready ? await clickIndexItem(driver, PAGE_TEXT, TAG) : false;
  if (observed.entered) {
    observed.titleFound = await waitForId(driver, pageTitleId(PAGE_TEXT), TAG);
  }
  observed.backFound = await findId(driver, pageBackId(PAGE_TEXT), TAG) !== undefined;
  observed.canvasFound = await waitForId(driver, demoCanvasId(PAGE_TEXT), TAG, CONTROL_TIMEOUT);
  observed.measureFound = await waitForId(driver, ID_TEXT_MEASURE_BTN, TAG, CONTROL_TIMEOUT);
  if (observed.measureFound) {
    await clickId(driver, ID_TEXT_MEASURE_BTN, TAG);
    observed.resultFound = await waitForId(driver, ID_TEXT_MEASURE_RESULT, TAG, CONTROL_TIMEOUT);
  }
  if (observed.resultFound) {
    observed.resultLength = (await textOfId(driver, ID_TEXT_MEASURE_RESULT, TAG)).length;
  }
  observed.returnedToIndex = await backToIndex(driver, TAG);
  logInfo(TAG, 'text page measure=' + observed.measureFound.toString() + ' result=' +
    observed.resultFound.toString() + ' length=' + observed.resultLength.toString());
  return observed;
}

// 宿主页巡检结果：画布、场景按钮与首行参数四类 id 是否都能命中。
class GroupProbeObs {
  public groupKey: string = '';
  public groupId: number = 0;
  public sceneId: number = -1;
  public opened: boolean = false;
  public canvasFound: boolean = false;
  public sceneButtonFound: boolean = false;
  public rowCount: number = 0;
  public keyFound: boolean = false;
  public controlFound: boolean = false;
  public valueFound: boolean = false;
  public paramTotal: number = 0;
  public returnedToIndex: boolean = false;
}

// 从首页进入能力域或专题宿主页，探测画布与首行参数 id，最后退回首页。
async function probeGroupPage(driver: Driver, index: number, topic: boolean): Promise<GroupProbeObs> {
  const observed: GroupProbeObs = new GroupProbeObs();
  const groups: GroupSpec[] = topic ? TOPIC_GROUPS : CAPABILITY_GROUPS;
  const group: GroupSpec = groups[index];
  const spec: SceneSpec = group.scenes[0];
  observed.groupKey = group.key;
  observed.groupId = group.id;
  observed.sceneId = spec.id;
  observed.paramTotal = spec.params.length;
  const ready: boolean = await warmUp(driver);
  if (topic) {
    observed.opened = ready ? await openTopicCatalog(driver, TAG) : false;
    if (observed.opened) {
      observed.opened = await openTopicGroup(driver, group.key, TAG);
    }
  } else {
    observed.opened = ready ? await openCatalog(driver, TAG) : false;
    if (observed.opened) {
      observed.opened = await openCapabilityGroup(driver, group.key, TAG);
    }
  }
  // 宿主页以「groupKey + 首场景 id」拼参数行场景标识，与 ParamPanel 内部取值一致。
  const sceneKey: string = paramSceneKey(group.key, spec.id);
  observed.canvasFound = await waitForId(driver, groupCanvasId(group.key), TAG, CONTROL_TIMEOUT);
  observed.sceneButtonFound = await waitForId(driver, sceneButtonId(group.key, spec.id), TAG, CONTROL_TIMEOUT);
  observed.rowCount = await countId(driver, paramRowId(sceneKey, PARAM_FIRST), TAG);
  observed.keyFound = await findId(driver, paramKeyId(sceneKey, PARAM_FIRST), TAG) !== undefined;
  observed.controlFound = await findId(driver, paramControlId(sceneKey, PARAM_FIRST), TAG) !== undefined;
  observed.valueFound = await findId(driver, paramValueId(sceneKey, PARAM_FIRST), TAG) !== undefined;
  // 逐级返回：能力域页退到目录页、目录页退到首页，最后统一等首页标题。
  for (let step = 0; step < GROUP_BACK_STEPS; step++) {
    await clickBack(driver, TAG);
  }
  observed.returnedToIndex = await waitForId(driver, ID_INDEX_TITLE, TAG);
  logInfo(TAG, 'group ' + group.key + ' opened=' + observed.opened.toString() + ' canvas=' +
    observed.canvasFound.toString() + ' row=' + observed.rowCount.toString() + ' params=' +
    observed.paramTotal.toString());
  return observed;
}

export default function ndkRenderNodeUiProbeTest(): void {
  describe('NdkRenderNodeUiProbe', () => {
    // 套件级预热：用例按序执行，第一个用例运行前把应用拉到首页，
    // 避免把冷启动耗时算进第一条「已进入页面」断言。
    beforeAll(async () => {
      await warmUp(Driver.create());
    });

    /**
     * @tc.number    SUB_RENDER_NODE_UI_PROBE_0001
     * @tc.name      testNdkRenderNodeUiProbe0001
     * @tc.desc      校验绘制演示页的返回、标题、画布与三个图元按钮均可按 id 定位，并能退回首页。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeUiProbe0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeUiProbe0001 begin');
      const observed: DemoProbeObs = await probeDemoPage(Driver.create(), PAGE_DRAW, ID_DRAW_CANVAS,
        [ID_DRAW_PATH, ID_DRAW_TEXT, ID_DRAW_IMAGE]);
      expect(observed.entered).assertTrue();
      expect(observed.titleFound).assertTrue();
      expect(observed.backFound).assertTrue();
      expect(observed.canvasFound).assertTrue();
      expect(observed.controlTotal).assertEqual(DRAW_CONTROLS);
      expect(observed.controlFound).assertEqual(DRAW_CONTROLS);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeUiProbe0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_UI_PROBE_0002
     * @tc.name      testNdkRenderNodeUiProbe0002
     * @tc.desc      校验模糊演示页的返回、标题、画布、三种模糊模式与半径滑杆均可按 id 定位。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeUiProbe0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeUiProbe0002 begin');
      const observed: DemoProbeObs = await probeDemoPage(Driver.create(), PAGE_BLUR, ID_BLUR_CANVAS,
        [ID_BLUR_MODE_BACKGROUND, ID_BLUR_MODE_CONTENT, ID_BLUR_MODE_FOREGROUND, ID_BLUR_RESET, ID_BLUR_RADIUS]);
      expect(observed.entered).assertTrue();
      expect(observed.titleFound).assertTrue();
      expect(observed.backFound).assertTrue();
      expect(observed.canvasFound).assertTrue();
      expect(observed.controlTotal).assertEqual(BLUR_CONTROLS);
      expect(observed.controlFound).assertEqual(BLUR_CONTROLS);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeUiProbe0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_UI_PROBE_0003
     * @tc.name      testNdkRenderNodeUiProbe0003
     * @tc.desc      校验节点树演示页的返回、标题、画布、子节点计数与三个操作按钮均可按 id 定位。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeUiProbe0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeUiProbe0003 begin');
      const observed: DemoProbeObs = await probeDemoPage(Driver.create(), PAGE_NODE_TREE, ID_NODE_TREE_CANVAS,
        [ID_NODE_TREE_CHILD_COUNT, ID_NODE_TREE_ADD, ID_NODE_TREE_REMOVE, ID_NODE_TREE_RESET]);
      expect(observed.entered).assertTrue();
      expect(observed.titleFound).assertTrue();
      expect(observed.backFound).assertTrue();
      expect(observed.canvasFound).assertTrue();
      expect(observed.controlTotal).assertEqual(NODE_TREE_CONTROLS);
      expect(observed.controlFound).assertEqual(NODE_TREE_CONTROLS);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeUiProbe0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_UI_PROBE_0004
     * @tc.name      testNdkRenderNodeUiProbe0004
     * @tc.desc      校验生命周期演示页的返回、标题、场景画布、销毁状态与四个操作按钮均可按 id 定位。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeUiProbe0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeUiProbe0004 begin');
      const observed: DemoProbeObs = await probeDemoPage(Driver.create(), PAGE_LIFECYCLE,
        demoCanvasId(PAGE_LIFECYCLE), [ID_LIFECYCLE_DISPOSED, ID_LIFECYCLE_LABEL, ID_LIFECYCLE_INVALIDATE,
          ID_LIFECYCLE_DISPOSE, ID_LIFECYCLE_RECREATE]);
      expect(observed.entered).assertTrue();
      expect(observed.titleFound).assertTrue();
      expect(observed.backFound).assertTrue();
      expect(observed.canvasFound).assertTrue();
      expect(observed.controlTotal).assertEqual(LIFECYCLE_CONTROLS);
      expect(observed.controlFound).assertEqual(LIFECYCLE_CONTROLS);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeUiProbe0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_UI_PROBE_0005
     * @tc.name      testNdkRenderNodeUiProbe0005
     * @tc.desc      校验文本演示页的返回、标题与场景画布可按 id 定位，点击测量后结果可按 id 读到非空文本。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeUiProbe0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeUiProbe0005 begin');
      const observed: TextProbeObs = await probeTextPage(Driver.create());
      expect(observed.entered).assertTrue();
      expect(observed.titleFound).assertTrue();
      expect(observed.backFound).assertTrue();
      expect(observed.canvasFound).assertTrue();
      expect(observed.measureFound).assertTrue();
      expect(observed.resultFound).assertTrue();
      expect(observed.resultLength).assertLarger(0);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeUiProbe0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_UI_PROBE_0006
     * @tc.name      testNdkRenderNodeUiProbe0006
     * @tc.desc      校验渲染属性演示页的返回、标题、场景画布与六个属性开关均可按 id 定位。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeUiProbe0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeUiProbe0006 begin');
      const observed: DemoProbeObs = await probeDemoPage(Driver.create(), PAGE_RENDER_PROPERTY,
        demoCanvasId(PAGE_RENDER_PROPERTY), [ID_PROP_BACKGROUND_TOGGLE, ID_PROP_OPACITY_TOGGLE,
          ID_PROP_CLIP_TOGGLE, ID_PROP_SHADOW_TOGGLE, ID_PROP_SCALE_TOGGLE, ID_PROP_ROTATION_TOGGLE]);
      expect(observed.entered).assertTrue();
      expect(observed.titleFound).assertTrue();
      expect(observed.backFound).assertTrue();
      expect(observed.canvasFound).assertTrue();
      expect(observed.controlTotal).assertEqual(PROP_CONTROLS);
      expect(observed.controlFound).assertEqual(PROP_CONTROLS);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeUiProbe0006 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_UI_PROBE_0007
     * @tc.name      testNdkRenderNodeUiProbe0007
     * @tc.desc      校验画布能力域页的画布、场景按钮与首行参数四类 id 均可按 id 定位且能退回首页。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeUiProbe0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeUiProbe0007 begin');
      const observed: GroupProbeObs = await probeGroupPage(Driver.create(), 0, false);
      expect(observed.opened).assertTrue();
      expect(observed.groupKey).assertEqual('canvas');
      expect(observed.canvasFound).assertTrue();
      expect(observed.sceneButtonFound).assertTrue();
      expect(observed.rowCount).assertEqual(1);
      expect(observed.keyFound).assertTrue();
      expect(observed.controlFound).assertTrue();
      expect(observed.valueFound).assertTrue();
      expect(observed.paramTotal).assertLarger(0);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeUiProbe0007 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_UI_PROBE_0008
     * @tc.name      testNdkRenderNodeUiProbe0008
     * @tc.desc      校验节点树专题页的画布、场景按钮与首行参数四类 id 均可按 id 定位且能退回首页。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeUiProbe0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeUiProbe0008 begin');
      const observed: GroupProbeObs = await probeGroupPage(Driver.create(), 0, true);
      expect(observed.opened).assertTrue();
      expect(observed.groupKey).assertEqual('topic-node-tree');
      expect(observed.canvasFound).assertTrue();
      expect(observed.sceneButtonFound).assertTrue();
      expect(observed.rowCount).assertEqual(1);
      expect(observed.keyFound).assertTrue();
      expect(observed.controlFound).assertTrue();
      expect(observed.valueFound).assertTrue();
      expect(observed.paramTotal).assertLarger(0);
      expect(observed.returnedToIndex).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeUiProbe0008 end');
    })
  })
}
