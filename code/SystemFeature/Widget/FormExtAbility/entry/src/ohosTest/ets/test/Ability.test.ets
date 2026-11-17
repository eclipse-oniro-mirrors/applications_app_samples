/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const DRIVER = Driver.create();
const SAMPLE_LAUNCHER_BUNDLE = 'ohos.samples.launcher';
let launcherReady = false;

async function isSampleLauncherInstalled(): Promise<boolean> {
  try {
    const result = await abilityDelegatorRegistry.getAbilityDelegator()
      .executeShellCommand(`bm dump -n ${SAMPLE_LAUNCHER_BUNDLE}`);
    return JSON.stringify(result).indexOf(SAMPLE_LAUNCHER_BUNDLE) >= 0;
  } catch (err) {
    hilog.info(0x0000, 'testTag', 'check sample launcher failed: ' + JSON.stringify(err));
    return false;
  }
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(async () => {
      // Exit the test interface to execute the test case
      await DRIVER.pressBack();
      await DRIVER.delayMs(1000);
      // Legacy cases depend on the sample launcher desktop and its app icon menu
      launcherReady = await isSampleLauncherInstalled();
      hilog.info(0x0000, 'testTag', 'sample launcher ready: ' + launcherReady);
    })
    
    /**
     * 长按打开卡片列表
     */
    /**
     * @tc.number    SUB_FORMEXTABILITY_LEGACY_0001
     * @tc.name      OpenFormList_001
     * @tc.desc      Verify legacy case OpenFormList_001 runs without error.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('OpenFormList_001', 0, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', 'OpenFormList_001 begin');
      if (!launcherReady) {
        hilog.info(0x0000, 'testTag', 'OpenFormList_001 skipped: sample launcher is not available');
        done();
        return;
      }
      await DRIVER.delayMs(1000);
      await DRIVER.click(210, 1244);
      await DRIVER.delayMs(1500);
      await DRIVER.assertComponentExist(ON.text('eTSFormExtAbility'));
      let app = await DRIVER.findComponent(ON.text('eTSFormExtAbility'));
      // 获取文字控件边框
      let rect = await app.getBounds();
      // 计算文字控件高度
      let height = rect.bottom - rect.top;
      // 获取文字控件中心点
      let point = await app.getBoundsCenter();
      await DRIVER.longClick(point.x, point.y - height);
      await DRIVER.delayMs(1000);
      await DRIVER.assertComponentExist(ON.text('服务卡片'));
      let formBtn = await DRIVER.findComponent(ON.text('服务卡片'));
      await formBtn.click();
      await DRIVER.delayMs(1000);
      done();
      hilog.info(0x0000, 'testTag', 'OpenFormList_001 end');
    })

    /**
     * 创建卡片
     */
    /**
     * @tc.number    SUB_FORMEXTABILITY_LEGACY_0002
     * @tc.name      createForm_001
     * @tc.desc      Verify legacy case createForm_001 runs without error.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('createForm_001', 0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', 'createForm_001 begin');
      if (!launcherReady) {
        hilog.info(0x0000, 'testTag', 'createForm_001 skipped: sample launcher is not available');
        return;
      }
      await DRIVER.delayMs(1000);
      await DRIVER.assertComponentExist(ON.text('添加到桌面'));
      let addToDesk = await DRIVER.findComponent(ON.text('添加到桌面'));
      await addToDesk.click();
      await DRIVER.delayMs(1000);
      await DRIVER.assertComponentExist(ON.text('eTSFormExtAbility'));
      let resultArray = await DRIVER.findComponents(ON.text('eTSFormExtAbility'));
      expect(resultArray.length).assertEqual(2);
      hilog.info(0x0000, 'testTag', 'createForm_001 end');
    })
  })
}
