/**
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';

const DELAY_UI_READY: number = 1000;
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
const driver: Driver = Driver.create();

async function launchEntryAbility(): Promise<void> {
  const want: Want = { bundleName: bundleName, abilityName: 'EntryAbility' };
  await delegator.startAbility(want);
}

async function getTopAbilityName(): Promise<string> {
  const ability: UIAbility = await delegator.getCurrentTopAbility();
  return ability.context.abilityInfo.name;
}

export default function avoidWindowTitleButtonLayoutTest() {
  describe('AvoidWindowTitleButtonLayoutTest', () => {
    /**
     * @tc.name   AvoidWindowTitleButton_layout_001
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_LAYOUT_0001
     * @tc.desc   Verify title text has positive layout bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_layout_001', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const title = await driver.findComponent(ON.text('Top layout area, do not hide the title bar.'));
      const rect = await title.getBounds();
      expect((rect.right - rect.left) > 0).assertTrue();
      expect((rect.bottom - rect.top) > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_layout_002
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_LAYOUT_0002
     * @tc.desc   Verify hide button has positive layout bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_layout_002', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const btn = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
      const rect = await btn.getBounds();
      expect((rect.right - rect.left) > 0).assertTrue();
      expect((rect.bottom - rect.top) > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_layout_003
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_LAYOUT_0003
     * @tc.desc   Verify restore button has positive layout bounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_layout_003', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const btn = await driver.findComponent(ON.text('do not hide the title bar.'));
      const rect = await btn.getBounds();
      expect((rect.right - rect.left) > 0).assertTrue();
      expect((rect.bottom - rect.top) > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_layout_004
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_LAYOUT_0004
     * @tc.desc   Verify five hide clicks end in hidden text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_layout_004', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const btn = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
      for (let i: number = 0; i < 5; i++) {
        await btn.click();
        await driver.delayMs(200);
      }
      await driver.delayMs(DELAY_UI_READY);
      await driver.assertComponentExist(ON.text('Top layout area, hide the title bar and avoid the three buttons.'));
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_layout_005
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_LAYOUT_0005
     * @tc.desc   Verify ten alternating clicks end in restored text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_layout_005', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const hide = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
      const show = await driver.findComponent(ON.text('do not hide the title bar.'));
      for (let i: number = 0; i < 5; i++) {
        await hide.click();
        await driver.delayMs(150);
        await show.click();
        await driver.delayMs(150);
      }
      await driver.delayMs(DELAY_UI_READY);
      await driver.assertComponentExist(ON.text('Top layout area, do not hide the title bar.'));
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_layout_006
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_LAYOUT_0006
     * @tc.desc   Verify three consecutive launches keep EntryAbility on top.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_layout_006', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      for (let i: number = 0; i < 3; i++) {
        await launchEntryAbility();
        await driver.delayMs(300);
      }
      const name = await getTopAbilityName();
      expect(name).assertEqual('EntryAbility');
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_layout_007
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_LAYOUT_0007
     * @tc.desc   Verify hide action then relaunch does not crash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_layout_007', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const hide = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
      await hide.click();
      await driver.delayMs(500);
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      expect(await getTopAbilityName()).assertEqual('EntryAbility');
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_layout_008
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_LAYOUT_0008
     * @tc.desc   Verify restore action then relaunch does not crash.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_layout_008', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const show = await driver.findComponent(ON.text('do not hide the title bar.'));
      await show.click();
      await driver.delayMs(500);
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      expect(await getTopAbilityName()).assertEqual('EntryAbility');
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_layout_009
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_LAYOUT_0009
     * @tc.desc   Verify both action buttons remain clickable after hide.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_layout_009', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const hide = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
      await hide.click();
      await driver.delayMs(500);
      const show = await driver.findComponent(ON.text('do not hide the title bar.'));
      expect(show !== undefined && show !== null).assertTrue();
      await show.click();
      await driver.delayMs(300);
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_layout_010
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_LAYOUT_0010
     * @tc.desc   Verify title text is visible after restore.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_layout_010', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const show = await driver.findComponent(ON.text('do not hide the title bar.'));
      await show.click();
      await driver.delayMs(DELAY_UI_READY);
      const title = await driver.findComponent(ON.text('Top layout area, do not hide the title bar.'));
      expect(title !== undefined && title !== null).assertTrue();
      done();
    });
  })
}
