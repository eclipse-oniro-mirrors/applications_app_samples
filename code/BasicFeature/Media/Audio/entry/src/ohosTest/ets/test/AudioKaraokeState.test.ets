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
import {
  ensureHomeReady,
  openFromHome,
  tapId,
  exists,
  existsText,
  getIdText,
  labelOf,
  HOME_ID
} from './shared/AudioDriver';

const CARD: string = 'karaoke_card';
const STATUS_ID: string = 'karaoke_status_text';
const INIT_BTN: string = 'karaoke_init_btn';
const ENABLE_BTN: string = 'karaoke_enable_btn';
const DISABLE_BTN: string = 'karaoke_disable_btn';
const VOLUME_SLIDER: string = 'karaoke_volume_slider';
const REVERB_LABEL: string = 'karaoke_reverb_label';
const EQUALIZER_LABEL: string = 'karaoke_equalizer_label';
const REVERB_KEYS: string[] = ['ORIGINAL', 'KTV', 'THEATER', 'CONCERT'];
const EQUALIZER_LABELS: string[] = ['平坦', '饱满', '明亮'];

async function readStatus(driver: Driver): Promise<string> {
  const text: string | null = await getIdText(driver, STATUS_ID);
  return text === null ? '' : text;
}

async function waitStatusIn(driver: Driver, allowed: string[], attempts: number): Promise<string> {
  let status: string = '';
  for (let i = 0; i < attempts; i++) {
    status = await readStatus(driver);
    if (allowed.indexOf(status) >= 0) {
      return status;
    }
    await driver.delayMs(800);
  }
  return status;
}

/**
 * 卡拉 OK（AudioLoopback）页状态与控件
 *
 * 相较既有用例只断言控件/状态文本“存在”，本节断言状态文本的具体取值：
 * 初始为未初始化；未初始化时点启用/停用都落到“无实例”；初始化后落到
 * 初始化成功/硬件不支持/初始化失败之一；并验证音效按钮文案与离开后状态复位。
 */
export default function audioKaraokeState() {
  describe('AudioKaraokeState', () => {
    const driver: Driver = Driver.create();

    beforeAll(async () => {
      await ensureHomeReady(driver);
    });

    /**
     * @tc.number SUB_AUDIO_KARAOKE_STATE_0100
     * @tc.name testKaraokeState0001
     * @tc.desc Verify the karaoke page opens with the not-initialized status and all controls rendered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testKaraokeState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openFromHome(driver, CARD, INIT_BTN)).assertTrue();
      expect(await getIdText(driver, 'karaoke_title')).assertEqual(labelOf('KARAOKE_DEMO_TITLE'));
      expect(await readStatus(driver)).assertEqual(labelOf('KARAOKE_NOT_INITIALIZED'));
      expect(await exists(driver, INIT_BTN, 3000)).assertTrue();
      expect(await exists(driver, ENABLE_BTN, 3000)).assertTrue();
      expect(await exists(driver, DISABLE_BTN, 3000)).assertTrue();
      expect(await exists(driver, VOLUME_SLIDER, 3000)).assertTrue();
      expect(await exists(driver, REVERB_LABEL, 3000)).assertTrue();
      expect(await exists(driver, EQUALIZER_LABEL, 3000)).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_KARAOKE_STATE_0200
     * @tc.name testKaraokeState0002
     * @tc.desc Verify enabling before initialization reports the no-instance status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKaraokeState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openFromHome(driver, CARD, INIT_BTN)).assertTrue();
      expect(await tapId(driver, ENABLE_BTN, 1200)).assertTrue();
      expect(await readStatus(driver)).assertEqual(labelOf('KARAOKE_NO_INSTANCE'));
    });

    /**
     * @tc.number SUB_AUDIO_KARAOKE_STATE_0300
     * @tc.name testKaraokeState0003
     * @tc.desc Verify disabling before initialization reports the no-instance status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKaraokeState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openFromHome(driver, CARD, INIT_BTN)).assertTrue();
      expect(await tapId(driver, DISABLE_BTN, 1200)).assertTrue();
      expect(await readStatus(driver)).assertEqual(labelOf('KARAOKE_NO_INSTANCE'));
    });

    /**
     * @tc.number SUB_AUDIO_KARAOKE_STATE_0400
     * @tc.name testKaraokeState0004
     * @tc.desc Verify initialization moves the status off not-initialized into a valid result state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKaraokeState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openFromHome(driver, CARD, INIT_BTN)).assertTrue();
      expect(await tapId(driver, INIT_BTN, 1200)).assertTrue();
      const allowed: string[] = [
        labelOf('KARAOKE_INITIALIZED'),
        labelOf('KARAOKE_UNSUPPORTED_HARDWARE'),
        labelOf('KARAOKE_INITIALIZATION_FAILED')
      ];
      const status: string = await waitStatusIn(driver, allowed, 5);
      expect(status === labelOf('KARAOKE_NOT_INITIALIZED')).assertFalse();
      expect(allowed.indexOf(status) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_KARAOKE_STATE_0500
     * @tc.name testKaraokeState0005
     * @tc.desc Verify all four reverb preset buttons are rendered by their localized labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKaraokeState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openFromHome(driver, CARD, INIT_BTN)).assertTrue();
      for (const key of REVERB_KEYS) {
        expect(await existsText(driver, labelOf(key), 3000)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_AUDIO_KARAOKE_STATE_0600
     * @tc.name testKaraokeState0006
     * @tc.desc Verify all three equalizer preset buttons are rendered by their labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKaraokeState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openFromHome(driver, CARD, INIT_BTN)).assertTrue();
      for (const label of EQUALIZER_LABELS) {
        expect(await existsText(driver, label, 3000)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_AUDIO_KARAOKE_STATE_0700
     * @tc.name testKaraokeState0007
     * @tc.desc Verify leaving the karaoke page returns home and removes its controls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testKaraokeState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await openFromHome(driver, CARD, INIT_BTN)).assertTrue();
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await exists(driver, HOME_ID, 4000)).assertTrue();
      expect(await exists(driver, INIT_BTN, 1000)).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_KARAOKE_STATE_0800
     * @tc.name testKaraokeState0008
     * @tc.desc Verify re-entering the karaoke page after initialization resets the status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testKaraokeState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(await openFromHome(driver, CARD, INIT_BTN)).assertTrue();
      expect(await tapId(driver, INIT_BTN, 1200)).assertTrue();
      await driver.delayMs(1200);
      await driver.pressBack();
      await driver.delayMs(1200);
      expect(await openFromHome(driver, CARD, INIT_BTN)).assertTrue();
      expect(await readStatus(driver)).assertEqual(labelOf('KARAOKE_NOT_INITIALIZED'));
    });
  });
}
