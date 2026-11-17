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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';
import Logger from '../../utils/Logger';
import {
  BUNDLE,
  SETTLE_UI,
  SuiteTag
} from '../common/TestConstant';
import {
  createDriver,
  ensureAppVisible,
  getTopAbility,
  sleep
} from '../common/UiFlowHelper';

const TAG: string = SuiteTag.DISPLAY;

async function topWindow(): Promise<window.Window | null> {
  const ability: UIAbility | null = await getTopAbility();
  if (ability === null) {
    return null;
  }
  try {
    return await window.getTopWindow(ability.context);
  } catch (error) {
    return null;
  }
}

async function restoreBrightness(win: window.Window): Promise<void> {
  try {
    await win.setWindowBrightness(-1);
    await sleep(SETTLE_UI);
  } catch (error) {
    Logger.info(TAG, 'restoreBrightness failed');
  }
}

/**
 * Window state setters and their readable properties. Every case restores the
 * default value in a finally block so the page keeps the flags it started with
 * and the display suites that run later are not affected.
 */
export default function windowStateTest(): void {
  describe('LottieWindowStateTest', (): void => {
    let driver: Driver;

    beforeAll(async (): Promise<void> => {
      driver = await createDriver();
      await ensureAppVisible(driver);
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_WINDOWSTATE_0100
     * @tc.name brightnessHalfRoundTrip001
     * @tc.desc Verify a half brightness value is applied and readable, then restored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'brightnessHalfRoundTrip_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'brightnessHalfRoundTrip_001 begin');
      const win: window.Window | null = await topWindow();
      const check01: boolean = win !== null;
      Logger.info(TAG, 'brightnessHalfRoundTrip_001, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (win === null) {
        return;
      }
      try {
        await win.setWindowBrightness(0.5);
        await sleep(SETTLE_UI);
        const brightness: number = win.getWindowProperties().brightness;
        const check02: boolean = Math.abs(brightness - 0.5) < 0.01;
        Logger.info(TAG, 'brightnessHalfRoundTrip_001, check02=' + JSON.stringify(check02));
        expect(check02).assertTrue();
      } finally {
        await restoreBrightness(win);
      }
      const restored: number = win.getWindowProperties().brightness;
      const check03: number = restored;
      Logger.info(TAG, 'brightnessHalfRoundTrip_001, check03=' + JSON.stringify(check03));
      expect(check03).assertEqual(-1);
      Logger.info(TAG, 'brightnessHalfRoundTrip_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_WINDOWSTATE_0200
     * @tc.name brightnessZeroBoundary002
     * @tc.desc Verify the minimum brightness boundary is accepted and readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'brightnessZeroBoundary_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'brightnessZeroBoundary_002 begin');
      const win: window.Window | null = await topWindow();
      const check01: boolean = win !== null;
      Logger.info(TAG, 'brightnessZeroBoundary_002, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (win === null) {
        return;
      }
      try {
        await win.setWindowBrightness(0);
        await sleep(SETTLE_UI);
        const brightness: number = win.getWindowProperties().brightness;
        const check02: boolean = Math.abs(brightness) < 0.01;
        Logger.info(TAG, 'brightnessZeroBoundary_002, check02=' + JSON.stringify(check02));
        expect(check02).assertTrue();
      } finally {
        await restoreBrightness(win);
      }
      Logger.info(TAG, 'brightnessZeroBoundary_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_WINDOWSTATE_0300
     * @tc.name brightnessOneBoundary003
     * @tc.desc Verify the maximum brightness boundary is accepted and readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'brightnessOneBoundary_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'brightnessOneBoundary_003 begin');
      const win: window.Window | null = await topWindow();
      const check01: boolean = win !== null;
      Logger.info(TAG, 'brightnessOneBoundary_003, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      if (win === null) {
        return;
      }
      try {
        await win.setWindowBrightness(1);
        await sleep(SETTLE_UI);
        const brightness: number = win.getWindowProperties().brightness;
        const check02: boolean = Math.abs(brightness - 1) < 0.01;
        Logger.info(TAG, 'brightnessOneBoundary_003, check02=' + JSON.stringify(check02));
        expect(check02).assertTrue();
      } finally {
        await restoreBrightness(win);
      }
      Logger.info(TAG, 'brightnessOneBoundary_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_WINDOWSTATE_0400
     * @tc.name pageUsableAfterWindowFlags004
     * @tc.desc Verify the page is still visible after all window flag round trips
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'pageUsableAfterWindowFlags_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'pageUsableAfterWindowFlags_004 begin');
      const check01: boolean = await ensureAppVisible(driver);
      Logger.info(TAG, 'pageUsableAfterWindowFlags_004, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'pageUsableAfterWindowFlags_004 end');
    });
  });
}
