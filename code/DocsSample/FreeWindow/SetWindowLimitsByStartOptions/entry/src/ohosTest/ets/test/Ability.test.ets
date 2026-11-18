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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
const TAG = '[Sample_SetWindowLimitsByStartOptions]';
const DOMAIN = 0x0000;
const DELAY_UI_READY = 1000;
const DELAY_START_ABILITY = 2000;

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;

export default function abilityTest(): void {
  describe('SetWindowLimitsByStartOptionsTest', () => {
    /**
     * @tc.name   testSetWindowLimitsByStartOptions0001
     * @tc.number SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0100
     * @tc.desc   Verify the entry page is displayed after the application is started.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowLimitsByStartOptions0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const want: Want = {
            bundleName: bundleName,
            abilityName: 'EntryAbility'
          };
          await delegator.startAbility(want);
          const driver = Driver.create();
          await driver.delayMs(DELAY_UI_READY);
          const ability: UIAbility = await delegator.getCurrentTopAbility();
          expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
          await driver.assertComponentExist(ON.text('启动测试窗口'));
        } catch (error) {
          hilog.error(DOMAIN, TAG, `test0001 failed, error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.name   testSetWindowLimitsByStartOptions0002
     * @tc.number SUB_FREEWINDOW_SET_WINDOW_LIMITS_START_OPTIONS_0200
     * @tc.desc   Verify WindowTestAbility is started after the button is clicked.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowLimitsByStartOptions0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const want: Want = {
            bundleName: bundleName,
            abilityName: 'EntryAbility'
          };
          await delegator.startAbility(want);
          const driver = Driver.create();
          await driver.delayMs(DELAY_UI_READY);
          const startButton = await driver.findComponent(ON.text('启动测试窗口'));
          await startButton.click();
          await driver.delayMs(DELAY_START_ABILITY);
          const ability: UIAbility = await delegator.getCurrentTopAbility();
          expect(ability.context.abilityInfo.name).assertEqual('WindowTestAbility');
        } catch (error) {
          hilog.error(DOMAIN, TAG, `test0002 failed, error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        done();
      });
  })
}
