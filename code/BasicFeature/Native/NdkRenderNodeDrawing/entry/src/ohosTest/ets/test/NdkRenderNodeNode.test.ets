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
  checkedOfId,
  clickId,
  clickText,
  countText,
  delay,
  enterPage,
  logInfo,
  textOfId,
  UI_SETTLE_TIME
} from './UiDriverUtil';

const TAG: string = '[Sample_NdkRenderNodeNodeTest]';
const CHILD_COUNT_ID: string = 'node_tree_child_count';
const DISPOSED_ID: string = 'lifecycle_disposed';
const MAX_CHILD_COUNT: number = 6;
const ADD_CHILD_CLICK_TIMES: number = 8;
const PROPERTY_TOGGLE_IDS: string[] = ['prop_background_toggle', 'prop_opacity_toggle', 'prop_clip_toggle',
  'prop_shadow_toggle', 'prop_scale_toggle', 'prop_rotation_toggle'];

export default function ndkRenderNodeNodeTest(): void {
  describe('NdkRenderNodeNode', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_NODE_0001
     * @tc.name      testNdkRenderNodeNode0001
     * @tc.desc      校验节点树页面初始子节点数为 0，点击添加子节点后子节点数变为 1。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeNode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo(TAG, 'testNdkRenderNodeNode0001 begin');
      const driver: Driver = Driver.create();
      expect(await enterPage(driver, 'Node Tree', 'Add Child', TAG)).assertTrue();
      const initialCount: string = await textOfId(driver, CHILD_COUNT_ID, TAG);
      logInfo(TAG, 'initial child count = ' + initialCount);
      expect(initialCount).assertEqual('0');
      expect(await clickText(driver, 'Add Child', TAG)).assertTrue();
      const afterAdd: string = await textOfId(driver, CHILD_COUNT_ID, TAG);
      logInfo(TAG, 'child count after add = ' + afterAdd);
      expect(afterAdd).assertEqual('1');
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeNode0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NODE_0002
     * @tc.name      testNdkRenderNodeNode0002
     * @tc.desc      校验连续添加子节点达到上限六个后不再增长，子节点数保持为 6。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNode0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeNode0002 begin');
      const driver: Driver = Driver.create();
      expect(await enterPage(driver, 'Node Tree', 'Add Child', TAG)).assertTrue();
      for (let index = 0; index < ADD_CHILD_CLICK_TIMES; index++) {
        expect(await clickText(driver, 'Add Child', TAG)).assertTrue();
      }
      const limitedCount: string = await textOfId(driver, CHILD_COUNT_ID, TAG);
      logInfo(TAG, 'child count after ' + ADD_CHILD_CLICK_TIMES.toString() + ' adds = ' + limitedCount);
      expect(limitedCount).assertEqual(MAX_CHILD_COUNT.toString());
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeNode0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NODE_0003
     * @tc.name      testNdkRenderNodeNode0003
     * @tc.desc      校验移除子节点后子节点数递减，点击重置后子节点数归零。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNode0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeNode0003 begin');
      const driver: Driver = Driver.create();
      expect(await enterPage(driver, 'Node Tree', 'Add Child', TAG)).assertTrue();
      expect(await clickText(driver, 'Add Child', TAG)).assertTrue();
      expect(await clickText(driver, 'Add Child', TAG)).assertTrue();
      const twoChildren: string = await textOfId(driver, CHILD_COUNT_ID, TAG);
      logInfo(TAG, 'child count after two adds = ' + twoChildren);
      expect(twoChildren).assertEqual('2');
      expect(await clickText(driver, 'Remove Child', TAG)).assertTrue();
      const afterRemove: string = await textOfId(driver, CHILD_COUNT_ID, TAG);
      logInfo(TAG, 'child count after remove = ' + afterRemove);
      expect(afterRemove).assertEqual('1');
      expect(await clickText(driver, 'Reset', TAG)).assertTrue();
      const afterReset: string = await textOfId(driver, CHILD_COUNT_ID, TAG);
      logInfo(TAG, 'child count after reset = ' + afterReset);
      expect(afterReset).assertEqual('0');
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeNode0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NODE_0004
     * @tc.name      testNdkRenderNodeNode0004
     * @tc.desc      校验渲染属性页六个开关默认关闭，逐个打开后状态均为选中，且页面保持可用。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNode0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeNode0004 begin');
      const driver: Driver = Driver.create();
      expect(await enterPage(driver, 'Render Properties', 'Opacity', TAG)).assertTrue();
      for (let index = 0; index < PROPERTY_TOGGLE_IDS.length; index++) {
        const id: string = PROPERTY_TOGGLE_IDS[index];
        const before: boolean = await checkedOfId(driver, id, TAG);
        logInfo(TAG, id + ' checked before click = ' + before.toString());
        expect(before).assertFalse();
        expect(await clickId(driver, id, TAG)).assertTrue();
        const after: boolean = await checkedOfId(driver, id, TAG);
        logInfo(TAG, id + ' checked after click = ' + after.toString());
        expect(after).assertTrue();
      }
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeNode0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NODE_0005
     * @tc.name      testNdkRenderNodeNode0005
     * @tc.desc      校验模糊页可依次切换背景、内容、前景三种模糊模式并重置，切换过程中页面保持可用。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNode0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeNode0005 begin');
      const driver: Driver = Driver.create();
      expect(await enterPage(driver, 'Blur Effects', 'Foreground', TAG)).assertTrue();
      const modes: string[] = ['Background', 'Content', 'Foreground', 'Reset'];
      for (let index = 0; index < modes.length; index++) {
        const mode: string = modes[index];
        expect(await clickText(driver, mode, TAG)).assertTrue();
        const alive: number = await countText(driver, 'Foreground', TAG);
        logInfo(TAG, 'blur mode=' + mode + ' alive=' + alive.toString());
        expect(alive).assertEqual(1);
      }
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeNode0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_NODE_0006
     * @tc.name      testNdkRenderNodeNode0006
     * @tc.desc      校验生命周期页销毁节点后状态变为 true，重建后状态恢复为 false。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeNode0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo(TAG, 'testNdkRenderNodeNode0006 begin');
      const driver: Driver = Driver.create();
      expect(await enterPage(driver, 'Lifecycle', 'Set Label', TAG)).assertTrue();
      expect(await textOfId(driver, DISPOSED_ID, TAG)).assertEqual('false');
      expect(await clickText(driver, 'Dispose', TAG)).assertTrue();
      await delay(driver, UI_SETTLE_TIME);
      const disposed: string = await textOfId(driver, DISPOSED_ID, TAG);
      logInfo(TAG, 'disposed state = ' + disposed);
      expect(disposed).assertEqual('true');
      expect(await clickText(driver, 'Recreate', TAG)).assertTrue();
      await delay(driver, UI_SETTLE_TIME);
      const rebuilt: string = await textOfId(driver, DISPOSED_ID, TAG);
      logInfo(TAG, 'rebuilt disposed state = ' + rebuilt);
      expect(rebuilt).assertEqual('false');
      expect(await backToIndex(driver, TAG)).assertTrue();
      logInfo(TAG, 'testNdkRenderNodeNode0006 end');
    })
  })
}
