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

export default function avoidWindowTitleButtonStressTest() {
  describe('AvoidWindowTitleButtonStressTest', () => {
    /**
     * @tc.name   AvoidWindowTitleButton_stress_001
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_STRESS_0001
     * @tc.desc   Verify ten hide clicks keep hidden text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_stress_001', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const hide = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
      for (let i: number = 0; i < 10; i++) { await hide.click(); await driver.delayMs(100); }
      await driver.delayMs(DELAY_UI_READY);
      await driver.assertComponentExist(ON.text('Top layout area, hide the title bar and avoid the three buttons.'));
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_stress_002
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_STRESS_0002
     * @tc.desc   Verify ten restore clicks keep restored text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_stress_002', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const show = await driver.findComponent(ON.text('do not hide the title bar.'));
      for (let i: number = 0; i < 10; i++) { await show.click(); await driver.delayMs(100); }
      await driver.delayMs(DELAY_UI_READY);
      await driver.assertComponentExist(ON.text('Top layout area, do not hide the title bar.'));
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_stress_003
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_STRESS_0003
     * @tc.desc   Verify twenty alternating clicks end restored.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_stress_003', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const hide = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
      const show = await driver.findComponent(ON.text('do not hide the title bar.'));
      for (let i: number = 0; i < 10; i++) { await hide.click(); await driver.delayMs(50); await show.click(); await driver.delayMs(50); }
      await driver.delayMs(DELAY_UI_READY);
      await driver.assertComponentExist(ON.text('Top layout area, do not hide the title bar.'));
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_stress_004
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_STRESS_0004
     * @tc.desc   Verify hide button bounds after hide.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_stress_004', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const hide = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
      await hide.click(); await driver.delayMs(500);
      const rect = await hide.getBounds();
      expect((rect.right - rect.left) > 0).assertTrue();
      expect((rect.bottom - rect.top) > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_stress_005
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_STRESS_0005
     * @tc.desc   Verify title bounds after restore.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_stress_005', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const show = await driver.findComponent(ON.text('do not hide the title bar.'));
      await show.click(); await driver.delayMs(500);
      const title = await driver.findComponent(ON.text('Top layout area, do not hide the title bar.'));
      const rect = await title.getBounds();
      expect((rect.right - rect.left) > 0).assertTrue();
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_stress_006
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_STRESS_0006
     * @tc.desc   Verify hidden text after hide action.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_stress_006', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const hide = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
      await hide.click(); await driver.delayMs(DELAY_UI_READY);
      const title = await driver.findComponent(ON.text('Top layout area, hide the title bar and avoid the three buttons.'));
      expect(title !== undefined && title !== null).assertTrue();
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_stress_007
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_STRESS_0007
     * @tc.desc   Verify restored text after restore action.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_stress_007', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const show = await driver.findComponent(ON.text('do not hide the title bar.'));
      await show.click(); await driver.delayMs(DELAY_UI_READY);
      const title = await driver.findComponent(ON.text('Top layout area, do not hide the title bar.'));
      expect(title !== undefined && title !== null).assertTrue();
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_stress_008
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_STRESS_0008
     * @tc.desc   Verify five launches keep EntryAbility top.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_stress_008', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      for (let i: number = 0; i < 5; i++) { await launchEntryAbility(); await driver.delayMs(200); }
      expect(await getTopAbilityName()).assertEqual('EntryAbility');
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_stress_009
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_STRESS_0009
     * @tc.desc   Verify hide then five launches keep EntryAbility top.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_stress_009', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const hide = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
      await hide.click(); await driver.delayMs(300);
      for (let i: number = 0; i < 5; i++) { await launchEntryAbility(); await driver.delayMs(200); }
      expect(await getTopAbilityName()).assertEqual('EntryAbility');
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_stress_010
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_STRESS_0010
     * @tc.desc   Verify ten toggle rounds end restored.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_stress_010', 0, async (done: Function) => {
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const hide = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
      const show = await driver.findComponent(ON.text('do not hide the title bar.'));
      for (let i: number = 0; i < 10; i++) { await hide.click(); await driver.delayMs(50); await show.click(); await driver.delayMs(50); }
      await driver.delayMs(DELAY_UI_READY);
      await driver.assertComponentExist(ON.text('Top layout area, do not hide the title bar.'));
      done();
    });
  })
}
