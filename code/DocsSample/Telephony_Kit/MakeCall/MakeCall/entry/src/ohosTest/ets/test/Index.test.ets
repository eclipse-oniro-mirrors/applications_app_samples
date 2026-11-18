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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import hilog from '@ohos.hilog';
import {
  checkComponentExists,
  findComponentsByType,
  getDriver,
  isMakeCallVisible,
  launchMakeCallApp,
  runSerializedUiOperation,
  waitForMakeCallStable,
} from './Shared/SharedDriver';

export default function indexTest(): void {
  describe('MakeCallPageTest', () => {
    let driver: Driver;
    beforeAll(() => {
      driver = getDriver();
      hilog.info(0x0000, 'MakeCallTest', 'Starting device UI tests');
    });
    beforeEach(async () => {
      await launchMakeCallApp();
      expect(await waitForMakeCallStable(driver, 5000)).assertTrue();
    });
    afterEach(async () => {
      await runSerializedUiOperation(async () => Promise.resolve());
    });
    afterAll(() => {
      hilog.info(0x0000, 'MakeCallTest', 'Finished device UI tests');
    });

    /**
     * @tc.name MakeCallPage_EntryAbilityLaunch_001
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallPage_EntryAbilityLaunch_0100
     * @tc.desc Verify that the application opens the project EntryAbility.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallPage_EntryAbilityLaunch_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const delegator = abilityDelegatorRegistry.getAbilityDelegator();
        const ability = await delegator.getCurrentTopAbility();
        expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
        expect(await isMakeCallVisible(driver)).assertTrue();
      },
    );

    /**
     * @tc.name MakeCallPage_MakeCallButtonLabel_002
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallPage_MakeCallButtonLabel_0200
     * @tc.desc Verify the real page button label and stable automation identifier.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallPage_MakeCallButtonLabel_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const button = await runSerializedUiOperation(async () => driver.findComponent(ON.id('makeCallButton')));
        expect(await button.getText()).assertEqual('Make Call');
        expect(await button.isEnabled()).assertTrue();
        expect(await button.isClickable()).assertTrue();
      },
    );

    /**
     * @tc.name MakeCallPage_SingleMakeCallButton_003
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallPage_SingleMakeCallButton_0300
     * @tc.desc Verify that only one Make Call action is rendered.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallPage_SingleMakeCallButton_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buttons = await runSerializedUiOperation(async () => driver.findComponents(ON.text('Make Call')));
        expect(buttons.length).assertEqual(1);
        expect(await buttons[0].getText()).assertEqual('Make Call');
        expect(await buttons[0].isEnabled()).assertTrue();
      },
    );

    /**
     * @tc.name MakeCallPage_SystemDialActionAbsent_004
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallPage_SystemDialActionAbsent_0400
     * @tc.desc Verify removal of the unsupported system-only Dial Call action.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallPage_SystemDialActionAbsent_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const buttons = await runSerializedUiOperation(async () => driver.findComponents(ON.text('Dial Call')));
        const buttonCount: number = buttons === null ? 0 : buttons.length;
        expect(buttonCount).assertEqual(0);
        const button = await runSerializedUiOperation(async () => driver.findComponent(ON.id('makeCallButton')));
        expect(await button.getText()).assertEqual('Make Call');
      },
    );

    /**
     * @tc.name MakeCallPage_MakeCallButtonBounds_005
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallPage_MakeCallButtonBounds_0500
     * @tc.desc Verify that the call action has a visible nonempty layout rectangle.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallPage_MakeCallButtonBounds_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const button = await runSerializedUiOperation(async () => driver.findComponent(ON.id('makeCallButton')));
        const bounds = await button.getBounds();
        expect(bounds.right).assertLarger(bounds.left);
        expect(bounds.bottom).assertLarger(bounds.top);
        expect(bounds.left).assertLargerOrEqual(0);
        expect(bounds.top).assertLargerOrEqual(0);
      },
    );

    /**
     * @tc.name MakeCallPage_PageRelaunch_006
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallPage_PageRelaunch_0600
     * @tc.desc Verify repeated EntryAbility startup restores the Make Call page.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('MakeCallPage_PageRelaunch_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await launchMakeCallApp();
      expect(await waitForMakeCallStable(driver, 5000)).assertTrue();
      const button = await runSerializedUiOperation(async () => driver.findComponent(ON.id('makeCallButton')));
      expect(await button.getText()).assertEqual('Make Call');
      expect(await button.isEnabled()).assertTrue();
    });

    /**
     * @tc.name MakeCallPage_ButtonComponentPresence_007
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallPage_ButtonComponentPresence_0700
     * @tc.desc Verify the preserved component-search helper against the real page.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallPage_ButtonComponentPresence_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        expect(await checkComponentExists(driver, 'Button')).assertTrue();
        const buttons = await findComponentsByType(driver, 'Button');
        expect(buttons.length).assertEqual(1);
        expect(await buttons[0].getText()).assertEqual('Make Call');
      },
    );

    /**
     * @tc.name MakeCallPage_PageStablePolling_008
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallPage_PageStablePolling_0800
     * @tc.desc Verify bounded readiness polling observes the real Make Call action.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallPage_PageStablePolling_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        expect(await waitForMakeCallStable(driver, 5000)).assertTrue();
        expect(await isMakeCallVisible(driver)).assertTrue();
        const button = await runSerializedUiOperation(async () => driver.findComponent(ON.text('Make Call')));
        expect(await button.isClickable()).assertTrue();
      },
    );

    /**
     * @tc.name MakeCallPage_ClickAndResume_009
     * @tc.number SUB_TELEPHONY_MAKECALL_MakeCallPage_ClickAndResume_0900
     * @tc.desc Verify that the page is reusable after dispatching its Make Call action.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'MakeCallPage_ClickAndResume_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const button = await runSerializedUiOperation(async () => driver.findComponent(ON.id('makeCallButton')));
        await runSerializedUiOperation(async () => button.click());
        await launchMakeCallApp();
        expect(await waitForMakeCallStable(driver, 5000)).assertTrue();
        const restored = await runSerializedUiOperation(async () => driver.findComponent(ON.id('makeCallButton')));
        expect(await restored.getText()).assertEqual('Make Call');
        expect(await restored.isEnabled()).assertTrue();
      },
    );
  });
}
