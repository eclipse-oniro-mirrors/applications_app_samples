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
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@kit.TestKit';
import { ensureHomeReady, openFromHome, exists, getIdText, labelOf, PAGE_TIMEOUT, HOME_ID } from './shared/AudioDriver';

const DEVICE_CARD: string = 'select_output_device_card';
const DEVICE_NAME: string = 'device_name_text';
const BACK_ID: string = 'back_btn';

function knownDeviceNames(): string[] {
  const names: string[] = [labelOf('Speaker'), labelOf('EarPiece'), labelOf('WiredHeadset'),
    labelOf('WiredHeadPhones'), labelOf('Bluetooth_A2DP'), labelOf('BLUETOOTH_SCO'), labelOf('USB_Headset')];
  names.push('Invalid');
  return names;
}

/**
 * 输出设备页
 *
 * 验证页面能解析出可读的设备名（已知设备类型或 Invalid 兜底），返回入口可用，
 * 返回首页后重入仍能解析设备名。
 */
export default function audioDevicePageTest() {
  describe('audioDevicePageTest', () => {
    const driver: Driver = Driver.create();

    beforeAll(async () => {
      await ensureHomeReady(driver);
    });

    /**
     * @tc.number SUB_AUDIO_DEVICE_PAGE_0100
     * @tc.name devicePageShowsResolvedName
     * @tc.desc Verify the device page renders a non-empty preferred output device name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('devicePageShowsResolvedName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openFromHome(driver, DEVICE_CARD, DEVICE_NAME)).assertTrue();
      const name: string | null = await getIdText(driver, DEVICE_NAME);
      expect(name !== null).assertTrue();
      expect(name!.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_DEVICE_PAGE_0200
     * @tc.name deviceNameIsKnownOrInvalid
     * @tc.desc Verify the resolved device name is one of the known labels or the Invalid fallback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('deviceNameIsKnownOrInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openFromHome(driver, DEVICE_CARD, DEVICE_NAME)).assertTrue();
      const name: string | null = await getIdText(driver, DEVICE_NAME);
      expect(name !== null).assertTrue();
      expect(knownDeviceNames().includes(name as string)).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_DEVICE_PAGE_0300
     * @tc.name devicePageHasBackEntry
     * @tc.desc Verify the device page exposes its back navigation entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('devicePageHasBackEntry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openFromHome(driver, DEVICE_CARD, DEVICE_NAME)).assertTrue();
      expect(await exists(driver, BACK_ID, PAGE_TIMEOUT)).assertTrue();
      expect(await exists(driver, DEVICE_NAME, PAGE_TIMEOUT)).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_DEVICE_PAGE_0400
     * @tc.name deviceBackReturnsHome
     * @tc.desc Verify leaving the device page through the system back returns to the home cards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('deviceBackReturnsHome', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openFromHome(driver, DEVICE_CARD, DEVICE_NAME)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await exists(driver, HOME_ID, 4000)).assertTrue();
      expect(await exists(driver, DEVICE_NAME, 1000)).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_DEVICE_PAGE_0500
     * @tc.name reopenResolvesNameAgain
     * @tc.desc Verify reopening the device page resolves a non-empty device name again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('reopenResolvesNameAgain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openFromHome(driver, DEVICE_CARD, DEVICE_NAME)).assertTrue();
      const first: string | null = await getIdText(driver, DEVICE_NAME);
      expect(first !== null).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await openFromHome(driver, DEVICE_CARD, DEVICE_NAME)).assertTrue();
      const second: string | null = await getIdText(driver, DEVICE_NAME);
      expect(second !== null).assertTrue();
      expect(second!.length > 0).assertTrue();
    });
  });
}
