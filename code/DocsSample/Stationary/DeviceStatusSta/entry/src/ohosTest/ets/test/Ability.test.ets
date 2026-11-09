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
import { describe, it, expect } from '@ohos/hypium';
import { Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN = 0xF811;
const TAG = '[Sample_DeviceStatus]';
const BUNDLE = 'DeviceStatus_';
const SUBSCRIBE_CASE = `${BUNDLE}SubscribeDrop_001`;
const UNSUBSCRIBE_ALL_CASE = `${BUNDLE}UnsubscribeAllDrop_002`;
const UNSUBSCRIBE_CASE = `${BUNDLE}UnsubscribeDrop_003`;
const delegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;

async function startTestAbility(): Promise<Driver> {
  const want: Want = {
    bundleName: bundleName,
    abilityName: 'EntryAbility'
  };
  await delegator.startAbility(want);
  const driver = Driver.create();
  await driver.delayMs(1000);
  return driver;
}

async function clickAndRead(driver: Driver, buttonId: string): Promise<string> {
  const button = await driver.findComponent(ON.id(buttonId));
  await button.click();
  await driver.delayMs(1000);
  const text = await driver.findComponent(ON.id('show'));
  return await text.getText();
}

async function cleanupSubscriptions(driver: Driver): Promise<boolean> {
  try {
    const content = await clickAndRead(driver, 'button5');
    if (content !== 'dropDetect unsubscribeAll') {
      hilog.error(DOMAIN, TAG, 'Drop detection cleanup failed: %{public}s', content);
      return false;
    }
    return true;
  } catch (err: Error) {
    hilog.error(DOMAIN, TAG, 'Drop detection cleanup error: %{public}s', err.message);
    return false;
  }
}

export default function abilityTest() {
  describe('DeviceStatusTest', () => {
    // 订阅跌落检测。
    it(SUBSCRIBE_CASE, 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s begin', SUBSCRIBE_CASE);
      let driver: Driver | undefined = undefined;
      try {
        driver = await startTestAbility();
        const ability = await delegator.getCurrentTopAbility();
        const abilityName = ability.context.abilityInfo.name;
        hilog.info(DOMAIN, TAG, 'Top ability: actual=%{public}s, expected=EntryAbility', abilityName);
        expect(abilityName).assertEqual('EntryAbility');
        const cleaned = await cleanupSubscriptions(driver);
        hilog.info(DOMAIN, TAG, 'Precondition cleanup: actual=%{public}s, expected=true', String(cleaned));
        expect(cleaned).assertTrue();
        const content = await clickAndRead(driver, 'button4');
        hilog.info(DOMAIN, TAG, 'Subscribe: actual=%{public}s, expected=dropDetect subscribe', content);
        expect(content).assertEqual('dropDetect subscribe');
      } finally {
        if (driver !== undefined) {
          await cleanupSubscriptions(driver);
        }
        hilog.info(DOMAIN, TAG, '%{public}s end', SUBSCRIBE_CASE);
      }
    });

    // 先订阅，再取消全部跌落检测订阅。
    it(UNSUBSCRIBE_ALL_CASE, 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s begin', UNSUBSCRIBE_ALL_CASE);
      let driver: Driver | undefined = undefined;
      try {
        driver = await startTestAbility();
        const ability = await delegator.getCurrentTopAbility();
        const abilityName = ability.context.abilityInfo.name;
        hilog.info(DOMAIN, TAG, 'Top ability: actual=%{public}s, expected=EntryAbility', abilityName);
        expect(abilityName).assertEqual('EntryAbility');
        const cleaned = await cleanupSubscriptions(driver);
        hilog.info(DOMAIN, TAG, 'Precondition cleanup: actual=%{public}s, expected=true', String(cleaned));
        expect(cleaned).assertTrue();
        const subscribed = await clickAndRead(driver, 'button4');
        hilog.info(DOMAIN, TAG, 'Subscribe: actual=%{public}s, expected=dropDetect subscribe', subscribed);
        expect(subscribed).assertEqual('dropDetect subscribe');
        const content = await clickAndRead(driver, 'button5');
        hilog.info(DOMAIN, TAG, 'Unsubscribe all: actual=%{public}s, expected=dropDetect unsubscribeAll', content);
        expect(content).assertEqual('dropDetect unsubscribeAll');
      } finally {
        if (driver !== undefined) {
          await cleanupSubscriptions(driver);
        }
        hilog.info(DOMAIN, TAG, '%{public}s end', UNSUBSCRIBE_ALL_CASE);
      }
    });

    // 先订阅并取消同一回调，再验证重复取消时的失败提示。
    it(UNSUBSCRIBE_CASE, 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s begin', UNSUBSCRIBE_CASE);
      let driver: Driver | undefined = undefined;
      try {
        driver = await startTestAbility();
        const ability = await delegator.getCurrentTopAbility();
        const abilityName = ability.context.abilityInfo.name;
        hilog.info(DOMAIN, TAG, 'Top ability: actual=%{public}s, expected=EntryAbility', abilityName);
        expect(abilityName).assertEqual('EntryAbility');
        const cleaned = await cleanupSubscriptions(driver);
        hilog.info(DOMAIN, TAG, 'Precondition cleanup: actual=%{public}s, expected=true', String(cleaned));
        expect(cleaned).assertTrue();
        const subscribed = await clickAndRead(driver, 'button4');
        hilog.info(DOMAIN, TAG, 'Subscribe: actual=%{public}s, expected=dropDetect subscribe', subscribed);
        expect(subscribed).assertEqual('dropDetect subscribe');
        const cancelled = await clickAndRead(driver, 'button6');
        hilog.info(DOMAIN, TAG, 'Unsubscribe callback: actual=%{public}s, expected=dropDetect unsubscribe', cancelled);
        expect(cancelled).assertEqual('dropDetect unsubscribe');
        const content = await clickAndRead(driver, 'button6');
        const expected = 'dropDetect unsubscribe failed: no active subscription';
        hilog.info(DOMAIN, TAG, 'Repeated unsubscribe: actual=%{public}s, expected=%{public}s', content, expected);
        expect(content).assertEqual(expected);
      } finally {
        if (driver !== undefined) {
          await cleanupSubscriptions(driver);
        }
        hilog.info(DOMAIN, TAG, '%{public}s end', UNSUBSCRIBE_CASE);
      }
    });
  });
}
