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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = 'AvoidWindowTitleButton_Extra';
const DOMAIN: number = 0xF811;
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

export default function avoidWindowTitleButtonExtraTest() {
  describe('AvoidWindowTitleButtonExtraTest', () => {
    /**
     * @tc.name   AvoidWindowTitleButton_extra_001
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_EXTRA_0001
     * @tc.desc   Verify initial title area text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_extra_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, 'extra_001 start');
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      await driver.assertComponentExist(ON.text('Top layout area, do not hide the title bar.'));
      hilog.info(DOMAIN, TAG, 'extra_001 end');
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_extra_002
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_EXTRA_0002
     * @tc.desc   Verify initial hide button exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_extra_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, 'extra_002 start');
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      await driver.assertComponentExist(ON.text('hide the title bar and avoid the three buttons.'));
      hilog.info(DOMAIN, TAG, 'extra_002 end');
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_extra_003
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_EXTRA_0003
     * @tc.desc   Verify initial restore button exists.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_extra_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, 'extra_003 start');
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      await driver.assertComponentExist(ON.text('do not hide the title bar.'));
      hilog.info(DOMAIN, TAG, 'extra_003 end');
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_extra_004
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_EXTRA_0004
     * @tc.desc   Verify hide action updates title text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_extra_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, 'extra_004 start');
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const hide = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
      expect(hide !== undefined && hide !== null).assertTrue();
      await hide.click();
      await driver.delayMs(DELAY_UI_READY);
      await driver.assertComponentExist(ON.text('Top layout area, hide the title bar and avoid the three buttons.'));
      hilog.info(DOMAIN, TAG, 'extra_004 end');
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_extra_005
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_EXTRA_0005
     * @tc.desc   Verify hide then restore title text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_extra_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, 'extra_005 start');
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const hide = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
      await hide.click();
      await driver.delayMs(500);
      const show = await driver.findComponent(ON.text('do not hide the title bar.'));
      await show.click();
      await driver.delayMs(DELAY_UI_READY);
      await driver.assertComponentExist(ON.text('Top layout area, do not hide the title bar.'));
      hilog.info(DOMAIN, TAG, 'extra_005 end');
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_extra_006
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_EXTRA_0006
     * @tc.desc   Verify repeated hide remains stable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_extra_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, 'extra_006 start');
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const hide = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
      await hide.click();
      await driver.delayMs(500);
      await hide.click();
      await driver.delayMs(DELAY_UI_READY);
      await driver.assertComponentExist(ON.text('Top layout area, hide the title bar and avoid the three buttons.'));
      hilog.info(DOMAIN, TAG, 'extra_006 end');
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_extra_007
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_EXTRA_0007
     * @tc.desc   Verify repeated restore remains stable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_extra_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, 'extra_007 start');
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const show = await driver.findComponent(ON.text('do not hide the title bar.'));
      await show.click();
      await driver.delayMs(500);
      await show.click();
      await driver.delayMs(DELAY_UI_READY);
      await driver.assertComponentExist(ON.text('Top layout area, do not hide the title bar.'));
      hilog.info(DOMAIN, TAG, 'extra_007 end');
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_extra_008
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_EXTRA_0008
     * @tc.desc   Verify hide-show-hide sequence.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_extra_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, 'extra_008 start');
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const hide = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
      const show = await driver.findComponent(ON.text('do not hide the title bar.'));
      await hide.click();
      await driver.delayMs(300);
      await show.click();
      await driver.delayMs(300);
      await hide.click();
      await driver.delayMs(DELAY_UI_READY);
      await driver.assertComponentExist(ON.text('Top layout area, hide the title bar and avoid the three buttons.'));
      hilog.info(DOMAIN, TAG, 'extra_008 end');
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_extra_009
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_EXTRA_0009
     * @tc.desc   Verify two toggle rounds end in restored state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_extra_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, 'extra_009 start');
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const hide = await driver.findComponent(ON.text('hide the title bar and avoid the three buttons.'));
      const show = await driver.findComponent(ON.text('do not hide the title bar.'));
      for (let round: number = 0; round < 2; round++) {
        await hide.click();
        await driver.delayMs(300);
        await show.click();
        await driver.delayMs(300);
      }
      await driver.delayMs(DELAY_UI_READY);
      await driver.assertComponentExist(ON.text('Top layout area, do not hide the title bar.'));
      hilog.info(DOMAIN, TAG, 'extra_009 end');
      done();
    });

    /**
     * @tc.name   AvoidWindowTitleButton_extra_010
     * @tc.number SUB_AVOID_WINDOW_TITLE_BUTTON_EXTRA_0010
     * @tc.desc   Verify top ability after launch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AvoidWindowTitleButton_extra_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, 'extra_010 start');
      await launchEntryAbility();
      await driver.delayMs(DELAY_UI_READY);
      const abilityName = await getTopAbilityName();
      expect(abilityName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, 'extra_010 end');
      done();
    });
  })
}
