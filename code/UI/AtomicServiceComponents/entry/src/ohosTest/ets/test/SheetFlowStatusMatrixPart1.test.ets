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
import { delayTick } from './shared/AsyncYield';
import { SheetStyle, sheetModeName, toggleSheetStyle, canOpenSheet, heightBucket, heightBucketLabel, sheetStatusText } from '../../../main/ets/model/SheetFlow';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function SheetFlowStatusMatrixPart1Test(): void {
  describe('SheetFlowStatusMatrixPart1', () => {

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_0100
     * @tc.name      testHeightBucket0001
     * @tc.desc      Verify heightBucket(-100) returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHeightBucket0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightBucket0001 begin');
      await delayTick();
      expect(heightBucket(-100)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightBucket0001 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_0200
     * @tc.name      testHeightBucket0002
     * @tc.desc      Verify heightBucket(-1) returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHeightBucket0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightBucket0002 begin');
      await delayTick();
      expect(heightBucket(-1)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightBucket0002 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_0300
     * @tc.name      testHeightBucket0003
     * @tc.desc      Verify heightBucket(0) returns 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHeightBucket0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightBucket0003 begin');
      await delayTick();
      expect(heightBucket(0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightBucket0003 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_0400
     * @tc.name      testHeightBucket0004
     * @tc.desc      Verify heightBucket(1) returns 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHeightBucket0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightBucket0004 begin');
      await delayTick();
      expect(heightBucket(1)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightBucket0004 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_0500
     * @tc.name      testHeightBucket0005
     * @tc.desc      Verify heightBucket(299) returns 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHeightBucket0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightBucket0005 begin');
      await delayTick();
      expect(heightBucket(299)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightBucket0005 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_0600
     * @tc.name      testHeightBucket0006
     * @tc.desc      Verify heightBucket(300) returns 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHeightBucket0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightBucket0006 begin');
      await delayTick();
      expect(heightBucket(300)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightBucket0006 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_0700
     * @tc.name      testHeightBucket0007
     * @tc.desc      Verify heightBucket(599) returns 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHeightBucket0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightBucket0007 begin');
      await delayTick();
      expect(heightBucket(599)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightBucket0007 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_0800
     * @tc.name      testHeightBucket0008
     * @tc.desc      Verify heightBucket(600) returns 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHeightBucket0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightBucket0008 begin');
      await delayTick();
      expect(heightBucket(600)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightBucket0008 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_0900
     * @tc.name      testHeightBucket0009
     * @tc.desc      Verify heightBucket(1000) returns 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHeightBucket0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightBucket0009 begin');
      await delayTick();
      expect(heightBucket(1000)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightBucket0009 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_1000
     * @tc.name      testHeightLabel0010
     * @tc.desc      Verify heightBucketLabel(-1) returns Not opened.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHeightLabel0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightLabel0010 begin');
      await delayTick();
      expect(heightBucketLabel(-1)).assertEqual('Not opened');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightLabel0010 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_1100
     * @tc.name      testHeightLabel0011
     * @tc.desc      Verify heightBucketLabel(0) returns Not opened.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHeightLabel0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightLabel0011 begin');
      await delayTick();
      expect(heightBucketLabel(0)).assertEqual('Not opened');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightLabel0011 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_1200
     * @tc.name      testHeightLabel0012
     * @tc.desc      Verify heightBucketLabel(1) returns Low (< 300vp).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHeightLabel0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightLabel0012 begin');
      await delayTick();
      expect(heightBucketLabel(1)).assertEqual('Low (< 300vp)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightLabel0012 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_1300
     * @tc.name      testHeightLabel0013
     * @tc.desc      Verify heightBucketLabel(2) returns Medium (300-600vp).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHeightLabel0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightLabel0013 begin');
      await delayTick();
      expect(heightBucketLabel(2)).assertEqual('Medium (300-600vp)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightLabel0013 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_1400
     * @tc.name      testHeightLabel0014
     * @tc.desc      Verify heightBucketLabel(3) returns High (>= 600vp).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHeightLabel0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightLabel0014 begin');
      await delayTick();
      expect(heightBucketLabel(3)).assertEqual('High (>= 600vp)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightLabel0014 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_1500
     * @tc.name      testHeightLabel0015
     * @tc.desc      Verify heightBucketLabel(4) returns Not opened.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHeightLabel0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightLabel0015 begin');
      await delayTick();
      expect(heightBucketLabel(4)).assertEqual('Not opened');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testHeightLabel0015 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_1600
     * @tc.name      testCanOpen0016
     * @tc.desc      Verify canOpenSheet(true) is False.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanOpen0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpen0016 begin');
      await delayTick();
      expect(canOpenSheet(true)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpen0016 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_1700
     * @tc.name      testCanOpen0017
     * @tc.desc      Verify canOpenSheet(false) is True.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCanOpen0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpen0017 begin');
      await delayTick();
      expect(canOpenSheet(false)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCanOpen0017 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_1800
     * @tc.name      testModeCenter0018
     * @tc.desc      Verify center sheet mode name.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testModeCenter0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModeCenter0018 begin');
      await delayTick();
      expect(sheetModeName(SheetStyle.CENTER)).assertEqual('CENTER centered style');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModeCenter0018 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_1900
     * @tc.name      testModePopup0019
     * @tc.desc      Verify popup sheet mode name.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testModePopup0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModePopup0019 begin');
      await delayTick();
      expect(sheetModeName(SheetStyle.POPUP)).assertEqual('POPUP popup style');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModePopup0019 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_2000
     * @tc.name      testToggleSequence0020
     * @tc.desc      Verify CENTER after 1 toggles ends on SheetStyle.POPUP.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToggleSequence0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToggleSequence0020 begin');
      await delayTick();
      expect(toggleSheetStyle(SheetStyle.CENTER)).assertEqual(SheetStyle.POPUP);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToggleSequence0020 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_2100
     * @tc.name      testToggleSequence0021
     * @tc.desc      Verify CENTER after 2 toggles ends on SheetStyle.CENTER.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToggleSequence0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToggleSequence0021 begin');
      await delayTick();
      expect(toggleSheetStyle(toggleSheetStyle(SheetStyle.CENTER))).assertEqual(SheetStyle.CENTER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToggleSequence0021 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_2200
     * @tc.name      testToggleSequence0022
     * @tc.desc      Verify CENTER after 3 toggles ends on SheetStyle.POPUP.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToggleSequence0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToggleSequence0022 begin');
      await delayTick();
      expect(toggleSheetStyle(toggleSheetStyle(toggleSheetStyle(SheetStyle.CENTER)))).assertEqual(SheetStyle.POPUP);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToggleSequence0022 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_2300
     * @tc.name      testToggleSequence0023
     * @tc.desc      Verify CENTER after 4 toggles ends on SheetStyle.CENTER.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToggleSequence0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToggleSequence0023 begin');
      await delayTick();
      expect(toggleSheetStyle(toggleSheetStyle(toggleSheetStyle(toggleSheetStyle(SheetStyle.CENTER))))).assertEqual(SheetStyle.CENTER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToggleSequence0023 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_2400
     * @tc.name      testToggleSequence0024
     * @tc.desc      Verify POPUP after 1 toggles ends on SheetStyle.CENTER.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToggleSequence0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToggleSequence0024 begin');
      await delayTick();
      expect(toggleSheetStyle(SheetStyle.POPUP)).assertEqual(SheetStyle.CENTER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToggleSequence0024 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_2500
     * @tc.name      testToggleSequence0025
     * @tc.desc      Verify POPUP after 2 toggles ends on SheetStyle.POPUP.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToggleSequence0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToggleSequence0025 begin');
      await delayTick();
      expect(toggleSheetStyle(toggleSheetStyle(SheetStyle.POPUP))).assertEqual(SheetStyle.POPUP);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToggleSequence0025 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_2600
     * @tc.name      testToggleSequence0026
     * @tc.desc      Verify POPUP after 3 toggles ends on SheetStyle.CENTER.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToggleSequence0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToggleSequence0026 begin');
      await delayTick();
      expect(toggleSheetStyle(toggleSheetStyle(toggleSheetStyle(SheetStyle.POPUP)))).assertEqual(SheetStyle.CENTER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToggleSequence0026 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_2700
     * @tc.name      testToggleSequence0027
     * @tc.desc      Verify POPUP after 4 toggles ends on SheetStyle.POPUP.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testToggleSequence0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToggleSequence0027 begin');
      await delayTick();
      expect(toggleSheetStyle(toggleSheetStyle(toggleSheetStyle(toggleSheetStyle(SheetStyle.POPUP))))).assertEqual(SheetStyle.POPUP);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testToggleSequence0027 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_2800
     * @tc.name      testSheetStatus0028
     * @tc.desc      Verify sheetStatusText(true, CENTER, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0028 begin');
      await delayTick();
      expect(sheetStatusText(true, SheetStyle.CENTER, 0)).assertEqual('Opened · CENTER centered style · Not opened');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0028 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_2900
     * @tc.name      testSheetStatus0029
     * @tc.desc      Verify sheetStatusText(true, CENTER, 299).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0029 begin');
      await delayTick();
      expect(sheetStatusText(true, SheetStyle.CENTER, 299)).assertEqual('Opened · CENTER centered style · Low (< 300vp)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0029 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_3000
     * @tc.name      testSheetStatus0030
     * @tc.desc      Verify sheetStatusText(true, CENTER, 300).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0030 begin');
      await delayTick();
      expect(sheetStatusText(true, SheetStyle.CENTER, 300)).assertEqual('Opened · CENTER centered style · Medium (300-600vp)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0030 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_3100
     * @tc.name      testSheetStatus0031
     * @tc.desc      Verify sheetStatusText(true, CENTER, 599).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0031 begin');
      await delayTick();
      expect(sheetStatusText(true, SheetStyle.CENTER, 599)).assertEqual('Opened · CENTER centered style · Medium (300-600vp)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0031 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_3200
     * @tc.name      testSheetStatus0032
     * @tc.desc      Verify sheetStatusText(true, CENTER, 600).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0032 begin');
      await delayTick();
      expect(sheetStatusText(true, SheetStyle.CENTER, 600)).assertEqual('Opened · CENTER centered style · High (>= 600vp)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0032 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_3300
     * @tc.name      testSheetStatus0033
     * @tc.desc      Verify sheetStatusText(true, POPUP, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0033 begin');
      await delayTick();
      expect(sheetStatusText(true, SheetStyle.POPUP, 0)).assertEqual('Opened · POPUP popup style · Not opened');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0033 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_3400
     * @tc.name      testSheetStatus0034
     * @tc.desc      Verify sheetStatusText(true, POPUP, 299).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0034 begin');
      await delayTick();
      expect(sheetStatusText(true, SheetStyle.POPUP, 299)).assertEqual('Opened · POPUP popup style · Low (< 300vp)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0034 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_3500
     * @tc.name      testSheetStatus0035
     * @tc.desc      Verify sheetStatusText(true, POPUP, 300).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0035 begin');
      await delayTick();
      expect(sheetStatusText(true, SheetStyle.POPUP, 300)).assertEqual('Opened · POPUP popup style · Medium (300-600vp)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0035 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_3600
     * @tc.name      testSheetStatus0036
     * @tc.desc      Verify sheetStatusText(true, POPUP, 599).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0036 begin');
      await delayTick();
      expect(sheetStatusText(true, SheetStyle.POPUP, 599)).assertEqual('Opened · POPUP popup style · Medium (300-600vp)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0036 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_3700
     * @tc.name      testSheetStatus0037
     * @tc.desc      Verify sheetStatusText(true, POPUP, 600).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0037 begin');
      await delayTick();
      expect(sheetStatusText(true, SheetStyle.POPUP, 600)).assertEqual('Opened · POPUP popup style · High (>= 600vp)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0037 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_3800
     * @tc.name      testSheetStatus0038
     * @tc.desc      Verify sheetStatusText(false, CENTER, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0038 begin');
      await delayTick();
      expect(sheetStatusText(false, SheetStyle.CENTER, 0)).assertEqual('Closed · CENTER centered style · Not opened');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0038 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_3900
     * @tc.name      testSheetStatus0039
     * @tc.desc      Verify sheetStatusText(false, CENTER, 299).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0039 begin');
      await delayTick();
      expect(sheetStatusText(false, SheetStyle.CENTER, 299)).assertEqual('Closed · CENTER centered style · Low (< 300vp)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0039 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP1_4000
     * @tc.name      testSheetStatus0040
     * @tc.desc      Verify sheetStatusText(false, CENTER, 300).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0040 begin');
      await delayTick();
      expect(sheetStatusText(false, SheetStyle.CENTER, 300)).assertEqual('Closed · CENTER centered style · Medium (300-600vp)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0040 end');
    })

  })
}
