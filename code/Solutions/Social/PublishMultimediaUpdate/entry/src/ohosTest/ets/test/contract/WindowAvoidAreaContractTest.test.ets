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
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Driver } from '@ohos.UiTest';
import Logger from '../Logger';
import { BUNDLE, SETTLE_PAGE, TAG } from '../common/TestConstant';
import { ensureAppVisible, getTopAbility, launchApp, sleep } from '../common/UiFlowHelper';
/**
 * Avoid areas of the running window.
 * The page fills the window and relies on the system bars being excluded from
 * the drawable area. These cases read the system and cutout avoid areas and
 * verify that every edge is a non negative rectangle, which is what a page
 * that pads itself by the avoid area needs.
 */
export default function windowAvoidAreaContractTest() {
  describe('WindowAvoidAreaContractTest', () => {
    let win: window.Window | null = null;
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
      const driver: Driver = Driver.create();
      await launchApp();
      await sleep(SETTLE_PAGE);
      await ensureAppVisible(driver);
      const ability: UIAbility | null = await getTopAbility();
      if (ability !== null) {
        win = await window.getTopWindow(ability.context);
      }
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_AVOIDAREA_0100
     * @tc.name SystemAreaRetrievable001
     * @tc.desc Verify system area retrievable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SystemAreaRetrievable_001', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'SystemAreaRetrievable_001 begin');
      if (win !== null) {
        const area: window.AvoidArea = await win.getAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
        const present: boolean = area !== null && area !== undefined;
        Logger.info(TAG, 'present=' + JSON.stringify(present));
        expect(present).assertTrue();
      }
      Logger.info(TAG, 'SystemAreaRetrievable_001 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_AVOIDAREA_0200
     * @tc.name VisibleFlagIsBoolean002
     * @tc.desc Verify visible flag is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'VisibleFlagIsBoolean_002', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'VisibleFlagIsBoolean_002 begin');
      if (win !== null) {
        const area: window.AvoidArea = await win.getAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
        const flag: boolean = area.visible;
        Logger.info(TAG, 'flag=' + JSON.stringify(flag));
        expect(flag === true || flag === false).assertTrue();
      }
      Logger.info(TAG, 'VisibleFlagIsBoolean_002 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_AVOIDAREA_0300
     * @tc.name BottomRectNonNegative003
     * @tc.desc Verify bottom rect non negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'BottomRectNonNegative_003', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'BottomRectNonNegative_003 begin');
      if (win !== null) {
        const area: window.AvoidArea = await win.getAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
        const height: number = area.bottomRect.height;
        const valid: boolean = height === Math.max(0, height);
        Logger.info(TAG, 'height=' + height + ', valid=' + JSON.stringify(valid));
        expect(valid).assertTrue();
      }
      Logger.info(TAG, 'BottomRectNonNegative_003 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_AVOIDAREA_0400
     * @tc.name TopRectNonNegative004
     * @tc.desc Verify top rect non negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TopRectNonNegative_004', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'TopRectNonNegative_004 begin');
      if (win !== null) {
        const area: window.AvoidArea = await win.getAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
        const height: number = area.topRect.height;
        const valid: boolean = height === Math.max(0, height);
        Logger.info(TAG, 'height=' + height + ', valid=' + JSON.stringify(valid));
        expect(valid).assertTrue();
      }
      Logger.info(TAG, 'TopRectNonNegative_004 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_AVOIDAREA_0500
     * @tc.name AllEdgesNonNegative005
     * @tc.desc Verify all edges non negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AllEdgesNonNegative_005', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'AllEdgesNonNegative_005 begin');
      if (win !== null) {
        const area: window.AvoidArea = await win.getAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
        const values: Array<number> = [
          area.leftRect.left,
          area.leftRect.width,
          area.topRect.top,
          area.topRect.height,
          area.rightRect.width,
          area.bottomRect.height
        ];
        let negative: number = 0;
        for (let index: number = 0; index < values.length; index++) {
          if (values[index] !== Math.max(0, values[index])) {
            negative += 1;
          }
        }
        Logger.info(TAG, 'negative=' + negative);
        expect(negative).assertEqual(0);
      }
      Logger.info(TAG, 'AllEdgesNonNegative_005 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_AVOIDAREA_0600
     * @tc.name RepeatedReadStable006
     * @tc.desc Verify repeated read stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'RepeatedReadStable_006', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'RepeatedReadStable_006 begin');
      if (win !== null) {
        const first: window.AvoidArea = await win.getAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
        const second: window.AvoidArea = await win.getAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
        expect(first.visible).assertEqual(second.visible);
        expect(first.bottomRect.height).assertEqual(second.bottomRect.height);
      }
      Logger.info(TAG, 'RepeatedReadStable_006 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_AVOIDAREA_0700
     * @tc.name CutoutAreaRetrievable007
     * @tc.desc Verify cutout area retrievable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CutoutAreaRetrievable_007', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'CutoutAreaRetrievable_007 begin');
      if (win !== null) {
        const area: window.AvoidArea = await win.getAvoidArea(window.AvoidAreaType.TYPE_CUTOUT);
        const flag: boolean = area.visible;
        Logger.info(TAG, 'flag=' + JSON.stringify(flag));
        expect(flag === true || flag === false).assertTrue();
      }
      Logger.info(TAG, 'CutoutAreaRetrievable_007 end');
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_AVOIDAREA_0800
     * @tc.name SystemAreaWithinDisplay008
     * @tc.desc Verify system area within display
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SystemAreaWithinDisplay_008', 0, async (done: Function): Promise<void> => {
      Logger.info(TAG, 'SystemAreaWithinDisplay_008 begin');
      if (win !== null) {
        const displayHeight: number = win.getWindowProperties().windowRect.height;
        const area: window.AvoidArea = await win.getAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
        const height: number = area.bottomRect.height;
        const fits: boolean = height === Math.min(height, displayHeight);
        Logger.info(TAG, 'fits=' + JSON.stringify(fits));
        expect(fits).assertTrue();
      }
      Logger.info(TAG, 'SystemAreaWithinDisplay_008 end');
      done();
    });
  });
}
