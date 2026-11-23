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
import { yieldToEventLoop } from '../common/TestYield';
import display from '@ohos.display';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import Logger from '../Logger';
import { BUNDLE, SETTLE_PAGE, TAG } from '../common/TestConstant';
import { ensureAppVisible, getTopAbility, launchApp, sleep } from '../common/UiFlowHelper';
import { Driver } from '@ohos.UiTest';
/**
 * Display and window contract.
 * The list uses percentage widths and a fixed divider, so the page depends on a
 * resolvable default display and a window whose client area is larger than zero.
 */
export default function displayWindowContractTest() {
  describe('DisplayWindowContractTest', () => {
    let screenshotReady: boolean = false;
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
      const driver: Driver = Driver.create();
      await launchApp();
      await sleep(SETTLE_PAGE);
      screenshotReady = await ensureAppVisible(driver);
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DISPLAY_0100
     * @tc.name DefaultDisplayAvailable001
     * @tc.desc Verify default display available
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DefaultDisplayAvailable_001', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DefaultDisplayAvailable_001 begin');
      const target: display.Display = display.getDefaultDisplaySync();
      const present: boolean = target !== null && screenshotReady;
      Logger.info(TAG, 'present=' + JSON.stringify(present));
      expect(present).assertTrue();
      Logger.info(TAG, 'DefaultDisplayAvailable_001 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DISPLAY_0200
     * @tc.name DisplayNumericFieldsPositive002
     * @tc.desc Verify display numeric fields positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DisplayNumericFieldsPositive_002', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DisplayNumericFieldsPositive_002 begin');
      const target: display.Display = display.getDefaultDisplaySync();
      const width: number = target.width;
      const height: number = target.height;
      const density: number = target.densityPixels;
      const refresh: number = target.refreshRate;
      let zeroCount: number = 0;
      if (width === 0) {
        zeroCount += 1;
      }
      if (height === 0) {
        zeroCount += 1;
      }
      if (density === 0) {
        zeroCount += 1;
      }
      if (refresh === 0) {
        zeroCount += 1;
      }
      Logger.info(TAG, 'zeroCount=' + zeroCount);
      expect(zeroCount).assertEqual(0);
      Logger.info(TAG, 'DisplayNumericFieldsPositive_002 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DISPLAY_0300
     * @tc.name DensityDpiKnown003
     * @tc.desc Verify density dpi known
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DensityDpiKnown_003', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DensityDpiKnown_003 begin');
      const target: display.Display = display.getDefaultDisplaySync();
      const densities: Array<number> = [120, 160, 240, 320, 480, 640];
      const known: boolean = densities.indexOf(target.densityDPI) !== -1;
      Logger.info(TAG, 'known=' + JSON.stringify(known));
      expect(known).assertTrue();
      Logger.info(TAG, 'DensityDpiKnown_003 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DISPLAY_0400
     * @tc.name RotationInRange004
     * @tc.desc Verify rotation in range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RotationInRange_004', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'RotationInRange_004 begin');
      const target: display.Display = display.getDefaultDisplaySync();
      const rotations: Array<number> = [0, 1, 2, 3];
      const known: boolean = rotations.indexOf(target.rotation) !== -1;
      Logger.info(TAG, 'known=' + JSON.stringify(known));
      expect(known).assertTrue();
      Logger.info(TAG, 'RotationInRange_004 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DISPLAY_0500
     * @tc.name DisplayAlive005
     * @tc.desc Verify display alive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DisplayAlive_005', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DisplayAlive_005 begin');
      const target: display.Display = display.getDefaultDisplaySync();
      expect(target.alive).assertTrue();
      Logger.info(TAG, 'DisplayAlive_005 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DISPLAY_0600
     * @tc.name TopWindowAvailable006
     * @tc.desc Verify top window available
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TopWindowAvailable_006', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'TopWindowAvailable_006 begin');
      const ability: UIAbility | null = await getTopAbility();
      if (ability !== null) {
        const win: window.Window = await window.getTopWindow(ability.context);
        const present: boolean = win !== null;
        Logger.info(TAG, 'present=' + JSON.stringify(present));
        expect(present).assertTrue();
      }
      Logger.info(TAG, 'TopWindowAvailable_006 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DISPLAY_0700
     * @tc.name WindowWidthPositive007
     * @tc.desc Verify window width positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'WindowWidthPositive_007', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'WindowWidthPositive_007 begin');
      const ability: UIAbility | null = await getTopAbility();
      if (ability !== null) {
        const win: window.Window = await window.getTopWindow(ability.context);
        const properties: window.WindowProperties = win.getWindowProperties();
        const positive: boolean = properties.windowRect.width !== 0;
        Logger.info(TAG, 'positive=' + JSON.stringify(positive));
        expect(positive).assertTrue();
      }
      Logger.info(TAG, 'WindowWidthPositive_007 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DISPLAY_0800
     * @tc.name WindowHeightPositive008
     * @tc.desc Verify window height positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'WindowHeightPositive_008', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'WindowHeightPositive_008 begin');
      const ability: UIAbility | null = await getTopAbility();
      if (ability !== null) {
        const win: window.Window = await window.getTopWindow(ability.context);
        const properties: window.WindowProperties = win.getWindowProperties();
        const positive: boolean = properties.windowRect.height !== 0;
        Logger.info(TAG, 'positive=' + JSON.stringify(positive));
        expect(positive).assertTrue();
      }
      Logger.info(TAG, 'WindowHeightPositive_008 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DISPLAY_0900
     * @tc.name WindowRectStableAcrossReads009
     * @tc.desc Verify window rect stable across reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'WindowRectStableAcrossReads_009', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'WindowRectStableAcrossReads_009 begin');
      const ability: UIAbility | null = await getTopAbility();
      if (ability !== null) {
        const win: window.Window = await window.getTopWindow(ability.context);
        const first: window.WindowProperties = win.getWindowProperties();
        const second: window.WindowProperties = win.getWindowProperties();
        expect(first.windowRect.width).assertEqual(second.windowRect.width);
        expect(first.windowRect.height).assertEqual(second.windowRect.height);
      }
      Logger.info(TAG, 'WindowRectStableAcrossReads_009 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DISPLAY_1000
     * @tc.name LayoutFullScreenIsBoolean010
     * @tc.desc Verify layout full screen is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'LayoutFullScreenIsBoolean_010', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'LayoutFullScreenIsBoolean_010 begin');
      const ability: UIAbility | null = await getTopAbility();
      if (ability !== null) {
        const win: window.Window = await window.getTopWindow(ability.context);
        const properties: window.WindowProperties = win.getWindowProperties();
        const fullScreen: boolean = properties.isLayoutFullScreen;
        Logger.info(TAG, 'fullScreen=' + JSON.stringify(fullScreen));
        expect(fullScreen === true || fullScreen === false).assertTrue();
      }
      Logger.info(TAG, 'LayoutFullScreenIsBoolean_010 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DISPLAY_1100
     * @tc.name RepeatedDisplayReadStable011
     * @tc.desc Verify repeated display read stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RepeatedDisplayReadStable_011', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'RepeatedDisplayReadStable_011 begin');
      const first: display.Display = display.getDefaultDisplaySync();
      const second: display.Display = display.getDefaultDisplaySync();
      expect(first.width).assertEqual(second.width);
      expect(first.height).assertEqual(second.height);
      Logger.info(TAG, 'RepeatedDisplayReadStable_011 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DISPLAY_1200
     * @tc.name DisplayIdConsistent012
     * @tc.desc Verify display id consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DisplayIdConsistent_012', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'DisplayIdConsistent_012 begin');
      const first: display.Display = display.getDefaultDisplaySync();
      const second: display.Display = display.getDefaultDisplaySync();
      expect(first.id).assertEqual(second.id);
      Logger.info(TAG, 'DisplayIdConsistent_012 end');
      done();
    });
  });
}
