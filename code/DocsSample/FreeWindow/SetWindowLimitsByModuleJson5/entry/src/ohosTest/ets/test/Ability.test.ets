/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, ResizeDirection } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG = '[Sample_SetWindowLimitsByModuleJson5]';
const DOMAIN = 0xF811;
const DELAY_UI_READY = 1000;

const DELEGATOR: abilityDelegatorRegistry.AbilityDelegator =
  abilityDelegatorRegistry.getAbilityDelegator();
const BUNDLENAME: string = abilityDelegatorRegistry.getArguments().bundleName;
const driver = Driver.create();

async function launchEntryAbility(): Promise<void> {
  const want: Want = {
    bundleName: BUNDLENAME,
    abilityName: 'EntryAbility'
  };
  await DELEGATOR.startAbility(want);
}

async function getTopAbilityName(): Promise<string> {
  const ability: UIAbility = await DELEGATOR.getCurrentTopAbility();
  return ability.context.abilityInfo.name;
}

export default function SetWindowLimitsByModuleJson5Test(): void {
  describe('SetWindowLimitsByModuleJson5Test', () => {
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_0100
     * @tc.name      testSetWindowLimitsByModuleJson5StartAbility0001
     * @tc.desc      Start EntryAbility and verify the main page and the title bar buttons are displayed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSetWindowLimitsByModuleJson5StartAbility0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testSetWindowLimitsByModuleJson5StartAbility0001 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const abilityName = await getTopAbilityName();
        expect(abilityName).assertEqual('EntryAbility');
        const topArea = await driver.findComponent(ON.text('Top layout area, do not hide the title bar.'));
        expect(topArea !== null).assertTrue();
        const hideButton = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
        expect(hideButton !== null).assertTrue();
        const showButton = await driver.findComponent(ON.text('do not hide the title bar.'));
        expect(showButton !== null).assertTrue();
        done();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testSetWindowLimitsByModuleJson5StartAbility0001 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_0200
     * @tc.name      testSetWindowLimitsByModuleJson5HideTitleBar0001
     * @tc.desc      Click the hide button and verify the title bar is hidden and the top area avoids the buttons.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSetWindowLimitsByModuleJson5HideTitleBar0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testSetWindowLimitsByModuleJson5HideTitleBar0001 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const hideButton = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
        expect(hideButton !== null).assertTrue();
        await hideButton?.click();
        await driver.delayMs(DELAY_UI_READY);
        const hiddenTip = await driver.findComponent(ON.text('Top layout area, hide the title bar and avoid the three buttons.'));
        expect(hiddenTip !== null).assertTrue();
        done();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testSetWindowLimitsByModuleJson5HideTitleBar0001 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_0300
     * @tc.name      testSetWindowLimitsByModuleJson5ShowTitleBar0001
     * @tc.desc      Click the show button after hiding and verify the title bar is visible again.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSetWindowLimitsByModuleJson5ShowTitleBar0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testSetWindowLimitsByModuleJson5ShowTitleBar0001 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const hideButton = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
        expect(hideButton !== null).assertTrue();
        await hideButton?.click();
        await driver.delayMs(DELAY_UI_READY);
        const showButton = await driver.findComponent(ON.text('do not hide the title bar.'));
        expect(showButton !== null).assertTrue();
        await showButton?.click();
        await driver.delayMs(DELAY_UI_READY);
        const visibleTip = await driver.findComponent(ON.text('Top layout area, do not hide the title bar.'));
        expect(visibleTip !== null).assertTrue();
        done();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testSetWindowLimitsByModuleJson5ShowTitleBar0001 end');
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_JSON5_0400
     * @tc.name      testSetWindowLimitsByModuleJson5WindowLimits0001
     * @tc.desc      Verify the window size declared in module.json5 limits both enlarging and shrinking.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSetWindowLimitsByModuleJson5WindowLimits0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testSetWindowLimitsByModuleJson5WindowLimits0001 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const window = await driver.findWindow({ bundleName: BUNDLENAME });
        try {
          await window.resize(20000, 20000, ResizeDirection.RIGHT_DOWN);
          await driver.delayMs(DELAY_UI_READY);
          const maxBounds = await window.getBounds();
          const maxWidth = maxBounds.right - maxBounds.left;
          const maxHeight = maxBounds.bottom - maxBounds.top;
          expect(maxWidth < 20000).assertTrue();
          expect(maxHeight < 20000).assertTrue();
          await window.resize(10, 10, ResizeDirection.LEFT_UP);
          await driver.delayMs(DELAY_UI_READY);
          const minBounds = await window.getBounds();
          const minWidth = minBounds.right - minBounds.left;
          const minHeight = minBounds.bottom - minBounds.top;
          expect(minWidth > 100).assertTrue();
          expect(minHeight > 100).assertTrue();
        } catch (err) {
          const resizeUnsupported: boolean =
            err.message === 'this device can not support this action' ||
            err.message === 'Fullscreen window can not resize' ||
            err.message.indexOf('Capability not supported') >= 0;
          expect(resizeUnsupported).assertTrue();
        }
        done();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testSetWindowLimitsByModuleJson5WindowLimits0001 end');
      });
  })
}
