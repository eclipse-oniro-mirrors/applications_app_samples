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

const TAG: string = 'SetWindowLimits_Test';
const DOMAIN: number = 0xF811;
const DELAY_UI_READY = 1000;

const delegator: abilityDelegatorRegistry.AbilityDelegator =
  abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
const driver = Driver.create();

async function launchEntryAbility(): Promise<void> {
  const want: Want = {
    bundleName: bundleName,
    abilityName: 'EntryAbility'
  };
  await delegator.startAbility(want);
}

async function getTopAbilityName(): Promise<string> {
  const ability: UIAbility = await delegator.getCurrentTopAbility();
  return ability.context.abilityInfo.name;
}

export default function SetWindowLimitsTest(): void {
  describe('SetWindowLimitsTest', () => {
    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_0100
     * @tc.name      testSetWindowLimitsStartAbility0001
     * @tc.desc      Start the application and verify the main page is displayed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSetWindowLimitsStartAbility0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testSetWindowLimitsStartAbility0001 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const abilityName = await getTopAbilityName();
        expect(abilityName).assertEqual('EntryAbility');
        const mainText = await driver.findComponent(ON.text('setWindowLimits.'));
        expect(mainText !== null).assertTrue();
        hilog.info(DOMAIN, TAG, '%{public}s', 'testSetWindowLimitsStartAbility0001 end');
        done();
      });

    /**
     * @tc.number    SUB_WINDOW_SET_WINDOW_LIMITS_0200
     * @tc.name      testSetWindowLimitsBounds0001
     * @tc.desc      Verify window bounds stay within the limits or the expected resize error is reported.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testSetWindowLimitsBounds0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'testSetWindowLimitsBounds0001 begin');
        await launchEntryAbility();
        await driver.delayMs(DELAY_UI_READY);
        const window = await driver.findWindow({ bundleName: bundleName });
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
            err.message === 'Fullscreen window can not resize';
          expect(resizeUnsupported).assertTrue();
        }
        hilog.info(DOMAIN, TAG, '%{public}s', 'testSetWindowLimitsBounds0001 end');
        done();
      });
  })
}
