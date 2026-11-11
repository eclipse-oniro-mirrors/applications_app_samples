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

/**
 * Combined matrix suite of the scene entry model and the pure format helpers
 * of the entry module. The format cases drive the byte, time and percent
 * ladders with hand computed boundary values; the entry cases pin the route
 * constants and the constructor pass through rules of the home page cards.
 */

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { FormatUtil } from '../../../main/ets/photopicker/data/FormatUtil';
import { SceneRoutes, SceneEntry } from '../../../main/ets/photopicker/data/SceneEntry';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;

/**
 * Registers every scene entry and format matrix case of the sample.
 * All inputs are pure values, no ability context is required.
 */
export default function sceneEntryFormatMatrixTest() {
  describe('SceneEntryFormatMatrixTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_0100
     * @tc.name      testSceneFormat0001
     * @tc.desc      Verify bytes renders small and mid byte counts with the
     *               plain byte unit and no decimal part.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneFormat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSceneFormat0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single byte keeps the byte unit.
      expect(FormatUtil.bytes(1)).assertEqual('1 B');
      // A half kilobyte value stays inside the byte branch.
      expect(FormatUtil.bytes(512)).assertEqual('512 B');
      // One byte below the ladder threshold is still pure bytes.
      expect(FormatUtil.bytes(1022)).assertEqual('1022 B');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_0200
     * @tc.name      testSceneFormat0002
     * @tc.desc      Verify bytes renders exact kilobyte multiples with one
     *               decimal place.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneFormat0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSceneFormat0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One byte above the threshold opens the kilobyte ladder.
      expect(FormatUtil.bytes(1025)).assertEqual('1.0 KB');
      // Two kilobytes render without rounding drift.
      expect(FormatUtil.bytes(2048)).assertEqual('2.0 KB');
      // Five kilobytes keep the single decimal convention.
      expect(FormatUtil.bytes(5120)).assertEqual('5.0 KB');
      // Ten kilobytes confirm the divider is 1024.
      expect(FormatUtil.bytes(10240)).assertEqual('10.0 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_0300
     * @tc.name      testSceneFormat0003
     * @tc.desc      Verify bytes rounds fractional kilobyte values to one
     *               decimal place.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneFormat0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSceneFormat0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 12600 bytes divide to 12.3046875 KB and round down to 12.3.
      expect(FormatUtil.bytes(12600)).assertEqual('12.3 KB');
      // One byte below two kilobytes rounds 1.9990234375 up to 2.0.
      expect(FormatUtil.bytes(2047)).assertEqual('2.0 KB');
      // 99891 bytes divide to 97.5498046875 KB and round down to 97.5.
      expect(FormatUtil.bytes(99891)).assertEqual('97.5 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_0400
     * @tc.name      testSceneFormat0004
     * @tc.desc      Verify the kilobyte ladder reaches its upper edge at one
     *               byte below one megabyte.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSceneFormat0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSceneFormat0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two bytes below one megabyte still round inside the kilobyte ladder.
      expect(FormatUtil.bytes(1048574)).assertEqual('1024.0 KB');
      // The last pure byte value sits right below the ladder threshold.
      expect(FormatUtil.bytes(1023)).assertEqual('1023 B');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_0500
     * @tc.name      testSceneFormat0005
     * @tc.desc      Verify bytes renders exact megabyte multiples with two
     *               decimal places.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneFormat0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSceneFormat0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One megabyte plus half a kilobyte rounds to the exact unit boundary.
      expect(FormatUtil.bytes(1049088)).assertEqual('1.00 MB');
      // Two megabytes render without rounding drift.
      expect(FormatUtil.bytes(2097152)).assertEqual('2.00 MB');
      // Eight megabytes confirm the divider is 1048576.
      expect(FormatUtil.bytes(8388608)).assertEqual('8.00 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_0600
     * @tc.name      testSceneFormat0006
     * @tc.desc      Verify bytes rounds and scales fractional megabyte values
     *               up to the lower gigabyte edge.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneFormat0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSceneFormat0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 2.5 megabytes render the trailing zero of the two decimal format.
      expect(FormatUtil.bytes(2621440)).assertEqual('2.50 MB');
      // 15099494 bytes divide to 14.3999 MB and round to 14.40.
      expect(FormatUtil.bytes(15099494)).assertEqual('14.40 MB');
      // Half a gigabyte stays inside the megabyte ladder as 512.00 MB.
      expect(FormatUtil.bytes(536870912)).assertEqual('512.00 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_0700
     * @tc.name      testSceneFormat0007
     * @tc.desc      Verify bytes renders exact gigabyte multiples with two
     *               decimal digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneFormat0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSceneFormat0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three gigabytes render without rounding drift.
      expect(FormatUtil.bytes(3221225472)).assertEqual('3.00 GB');
      // Four gigabytes confirm the divider is 1073741824.
      expect(FormatUtil.bytes(4294967296)).assertEqual('4.00 GB');
      // Ten gigabytes scale beyond the first unit.
      expect(FormatUtil.bytes(10737418240)).assertEqual('10.00 GB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_0800
     * @tc.name      testSceneFormat0008
     * @tc.desc      Verify the gigabyte ladder rounds a value one byte below
     *               the 1.5 gigabyte boundary to the same text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSceneFormat0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSceneFormat0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One byte below 1.5 gigabytes rounds 1.4999 up to 1.50.
      expect(FormatUtil.bytes(1610612735)).assertEqual('1.50 GB');
      // Exactly 1.5 gigabytes renders the same text.
      expect(FormatUtil.bytes(1610612736)).assertEqual('1.50 GB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_0900
     * @tc.name      testSceneFormat0009
     * @tc.desc      Verify percent renders exact quarter fractions of a
     *               positive total without rounding drift.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSceneFormat0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSceneFormat0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One half of the total reports the exact midpoint.
      expect(FormatUtil.percent(1, 2)).assertEqual(50);
      // One quarter keeps the exact integer value.
      expect(FormatUtil.percent(1, 4)).assertEqual(25);
      // Three quarters keep the exact integer value.
      expect(FormatUtil.percent(3, 4)).assertEqual(75);
      // The simplified two over four fraction matches one half.
      expect(FormatUtil.percent(2, 4)).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_1000
     * @tc.name      testSceneFormat0010
     * @tc.desc      Verify percent rounds half fractions of eighth steps up
     *               per the Math.round rule.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneFormat0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSceneFormat0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 37.5 rounds half up to 38.
      expect(FormatUtil.percent(3, 8)).assertEqual(38);
      // 62.5 rounds half up to 63.
      expect(FormatUtil.percent(5, 8)).assertEqual(63);
      // 87.5 rounds half up to 88.
      expect(FormatUtil.percent(7, 8)).assertEqual(88);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_1100
     * @tc.name      testSceneFormat0011
     * @tc.desc      Verify percent rounds fractional ratios strictly below
     *               the half boundary down to the lower integer.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneFormat0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSceneFormat0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // 14.28 rounds down to 14.
      expect(FormatUtil.percent(1, 7)).assertEqual(14);
      // 57.14 rounds down to 57.
      expect(FormatUtil.percent(4, 7)).assertEqual(57);
      // 22.22 rounds down to 22.
      expect(FormatUtil.percent(2, 9)).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_1200
     * @tc.name      testSceneFormat0012
     * @tc.desc      Verify percent guards every non positive total and
     *               returns zero instead of NaN or a flipped sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSceneFormat0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSceneFormat0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The zero total short circuits before the division.
      expect(FormatUtil.percent(0, 0)).assertEqual(0);
      // A positive part over a zero total is also guarded.
      expect(FormatUtil.percent(1, 0)).assertEqual(0);
      // A negative total is guarded so the ratio cannot flip.
      expect(FormatUtil.percent(10, -2)).assertEqual(0);
      // A negative part over a zero total stays zero as well.
      expect(FormatUtil.percent(-1, 0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_1300
     * @tc.name      testSceneFormat0013
     * @tc.desc      Verify percent passes out of range ratios through without
     *               clamping to the zero to hundred scale.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneFormat0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSceneFormat0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A doubled part passes 200 through unclamped.
      expect(FormatUtil.percent(200, 100)).assertEqual(200);
      // A six times overshoot keeps its full magnitude.
      expect(FormatUtil.percent(300, 50)).assertEqual(600);
      // A negative part passes through as a negative percentage.
      expect(FormatUtil.percent(-25, 50)).assertEqual(-50);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_1400
     * @tc.name      testSceneFormat0014
     * @tc.desc      Verify percent keeps exact values for very large
     *               denominators without precision drift.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneFormat0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testSceneFormat0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One over one million rounds 0.0001 down to zero.
      expect(FormatUtil.percent(1, 1000000)).assertEqual(0);
      // One below the full total rounds 99.9999 up to one hundred.
      expect(FormatUtil.percent(999999, 1000000)).assertEqual(100);
      // The exact half of one million stays at fifty.
      expect(FormatUtil.percent(500000, 1000000)).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_1500
     * @tc.name      testSceneFormat0015
     * @tc.desc      Verify time zero pads narrow month, day, hour and minute
     *               fields of local dates.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSceneFormat0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSceneFormat0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // March 14th at 06:30 pads month, day, hour and minute.
      const marchMorning: number = new Date(2026, 2, 14, 6, 30).getTime();
      expect(FormatUtil.time(marchMorning)).assertEqual('2026-03-14 06:30');
      // December 1st at 21:05 pads the one based month and both clock fields.
      const decemberEvening: number = new Date(2025, 11, 1, 21, 5).getTime();
      expect(FormatUtil.time(decemberEvening)).assertEqual('2025-12-01 21:05');
      // July 4th at 13:01 keeps every field two characters wide.
      const julyNoon: number = new Date(2027, 6, 4, 13, 1).getTime();
      expect(FormatUtil.time(julyNoon)).assertEqual('2027-07-04 13:01');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_1600
     * @tc.name      testSceneFormat0016
     * @tc.desc      Verify time renders wide fields unchanged and keeps the
     *               twenty four hour clock format.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneFormat0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSceneFormat0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The last minute of August uses wide fields without extra padding.
      const augustLateNight: number = new Date(2026, 7, 31, 23, 59).getTime();
      expect(FormatUtil.time(augustLateNight)).assertEqual('2026-08-31 23:59');
      // A noon minute keeps the two digit hour and minute.
      const mayNoon: number = new Date(2026, 4, 30, 12, 0).getTime();
      expect(FormatUtil.time(mayNoon)).assertEqual('2026-05-30 12:00');
      // An evening minute keeps the wide hour without padding.
      const septemberEvening: number = new Date(2026, 8, 17, 18, 44).getTime();
      expect(FormatUtil.time(septemberEvening)).assertEqual('2026-09-17 18:44');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_1700
     * @tc.name      testSceneFormat0017
     * @tc.desc      Verify time drops seconds and milliseconds because the
     *               picker only shows minute precision.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneFormat0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSceneFormat0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Seconds and milliseconds are dropped from the rendered text.
      const noisyInstant: number = new Date(2026, 10, 3, 9, 7, 21, 999).getTime();
      expect(FormatUtil.time(noisyInstant)).assertEqual('2026-11-03 09:07');
      // A mid minute second value does not leak into the minute field.
      const juneMinute: number = new Date(2026, 5, 10, 16, 2, 45).getTime();
      expect(FormatUtil.time(juneMinute)).assertEqual('2026-06-10 16:02');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_1800
     * @tc.name      testSceneFormat0018
     * @tc.desc      Verify time keeps the fixed sixteen character layout with
     *               separators at the canonical positions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneFormat0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testSceneFormat0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two instants far apart share the same canonical layout.
      const early: string = FormatUtil.time(new Date(2026, 0, 2, 6, 4).getTime());
      const late: string = FormatUtil.time(new Date(2030, 11, 28, 22, 58).getTime());
      // The layout is always sixteen characters wide.
      expect(early.length).assertEqual(16);
      expect(late.length).assertEqual(16);
      // The date separators sit at the fixed positions.
      expect(early.charAt(4)).assertEqual('-');
      expect(early.charAt(7)).assertEqual('-');
      expect(late.charAt(4)).assertEqual('-');
      expect(late.charAt(7)).assertEqual('-');
      // The date and clock parts are joined by one space.
      expect(early.charAt(10)).assertEqual(' ');
      expect(late.charAt(10)).assertEqual(' ');
      // The clock separator sits at the fixed minute position.
      expect(early.charAt(13)).assertEqual(':');
      expect(late.charAt(13)).assertEqual(':');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_1900
     * @tc.name      testSceneFormat0019
     * @tc.desc      Verify the five scene route constants keep their exact
     *               string values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSceneFormat0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSceneFormat0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Every route key keeps the short value shared with the router.
      expect(SceneRoutes.PICKER).assertEqual('picker');
      expect(SceneRoutes.RECENT).assertEqual('recent');
      expect(SceneRoutes.GALLERY).assertEqual('gallery');
      expect(SceneRoutes.EDIT).assertEqual('edit');
      expect(SceneRoutes.CACHE).assertEqual('cache');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_2000
     * @tc.name      testSceneFormat0020
     * @tc.desc      Verify every pair of route constants stays distinct so
     *               the router cannot resolve the wrong scene.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneFormat0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSceneFormat0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // All ten unordered pairs of the five constants are distinct.
      expect(SceneRoutes.PICKER !== SceneRoutes.RECENT).assertTrue();
      expect(SceneRoutes.PICKER !== SceneRoutes.GALLERY).assertTrue();
      expect(SceneRoutes.PICKER !== SceneRoutes.EDIT).assertTrue();
      expect(SceneRoutes.PICKER !== SceneRoutes.CACHE).assertTrue();
      expect(SceneRoutes.RECENT !== SceneRoutes.GALLERY).assertTrue();
      expect(SceneRoutes.RECENT !== SceneRoutes.EDIT).assertTrue();
      expect(SceneRoutes.RECENT !== SceneRoutes.CACHE).assertTrue();
      expect(SceneRoutes.GALLERY !== SceneRoutes.EDIT).assertTrue();
      expect(SceneRoutes.GALLERY !== SceneRoutes.CACHE).assertTrue();
      expect(SceneRoutes.EDIT !== SceneRoutes.CACHE).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_2100
     * @tc.name      testSceneFormat0021
     * @tc.desc      Verify the entry constructor passes every argument into
     *               its own field unchanged for the picker scene.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSceneFormat0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const TAG: string = 'testSceneFormat0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build one entry exactly the way the home page does.
      const title: Resource = $r('app.media.startIcon');
      const description: Resource = $r('app.string.pp_app_title');
      const entry: SceneEntry = new SceneEntry(SceneRoutes.PICKER, title, description, 'sefmat_picker_card');
      // The route key is stored verbatim.
      expect(entry.route).assertEqual('picker');
      // The localized resources are stored by reference.
      expect(entry.title).assertEqual(title);
      expect(entry.description).assertEqual(description);
      // The component id is stored verbatim for the UI test driver.
      expect(entry.componentId).assertEqual('sefmat_picker_card');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_2200
     * @tc.name      testSceneFormat0022
     * @tc.desc      Verify two entries built from the same resources are
     *               independent instances without field aliasing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneFormat0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSceneFormat0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const title: Resource = $r('app.media.startIcon');
      const description: Resource = $r('app.string.pp_app_title');
      // Two entries share the resources but hold separate ids.
      const first: SceneEntry = new SceneEntry(SceneRoutes.GALLERY, title, description, 'sefmat_gallery_a');
      const second: SceneEntry = new SceneEntry(SceneRoutes.GALLERY, title, description, 'sefmat_gallery_b');
      // Both entries carry their own component id.
      expect(first.componentId).assertEqual('sefmat_gallery_a');
      expect(second.componentId).assertEqual('sefmat_gallery_b');
      // The instances are not aliases of each other.
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_2300
     * @tc.name      testSceneFormat0023
     * @tc.desc      Verify an empty component id and an empty route are
     *               stored verbatim without validation errors.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneFormat0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testSceneFormat0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const title: Resource = $r('app.media.startIcon');
      const description: Resource = $r('app.string.pp_app_title');
      // The model carries no argument validation by design.
      const entry: SceneEntry = new SceneEntry('', title, description, '');
      // The empty route is stored as the empty string.
      expect(entry.route).assertEqual('');
      // The empty component id is stored as the empty string.
      expect(entry.componentId).assertEqual('');
      // The resources still pass through unchanged.
      expect(entry.title).assertEqual(title);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_2400
     * @tc.name      testSceneFormat0024
     * @tc.desc      Verify a long route string with unusual characters is
     *               stored verbatim with its full length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneFormat0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testSceneFormat0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a 120 character route without template strings.
      let longRoute: string = '';
      for (let index: number = 0; index < 60; index++) {
        longRoute = longRoute + 'x-';
      }
      expect(longRoute.length).assertEqual(120);
      const title: Resource = $r('app.media.startIcon');
      const description: Resource = $r('app.string.pp_app_title');
      const entry: SceneEntry = new SceneEntry(longRoute, title, description, 'sefmat_long_route');
      // The unusual route survives the constructor unchanged.
      expect(entry.route).assertEqual(longRoute);
      expect(entry.route.length).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_2500
     * @tc.name      testSceneFormat0025
     * @tc.desc      Verify the cache scene entry keeps the localized cache
     *               resources and the cache route key.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneFormat0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSceneFormat0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build the cache entry with its own localized resources.
      const cacheTitle: Resource = $r('app.string.pp_home_scene_cache_title');
      const cacheDescription: Resource = $r('app.string.pp_home_scene_cache_desc');
      const entry: SceneEntry = new SceneEntry(SceneRoutes.CACHE, cacheTitle, cacheDescription, 'sefmat_cache_card');
      // The route matches the cache constant.
      expect(entry.route).assertEqual(SceneRoutes.CACHE);
      expect(entry.route).assertEqual('cache');
      // The cache resources are stored by reference.
      expect(entry.title).assertEqual(cacheTitle);
      expect(entry.description).assertEqual(cacheDescription);
      expect(entry.componentId).assertEqual('sefmat_cache_card');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_2600
     * @tc.name      testSceneFormat0026
     * @tc.desc      Verify five entries over all routes carry distinct
     *               component ids and the expected route keys.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneFormat0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSceneFormat0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const title: Resource = $r('app.media.startIcon');
      const description: Resource = $r('app.string.pp_app_title');
      // One entry per scene with a unique component id.
      const picker: SceneEntry = new SceneEntry(SceneRoutes.PICKER, title, description, 'sefmat_id_picker');
      const recent: SceneEntry = new SceneEntry(SceneRoutes.RECENT, title, description, 'sefmat_id_recent');
      const gallery: SceneEntry = new SceneEntry(SceneRoutes.GALLERY, title, description, 'sefmat_id_gallery');
      const edit: SceneEntry = new SceneEntry(SceneRoutes.EDIT, title, description, 'sefmat_id_edit');
      const cache: SceneEntry = new SceneEntry(SceneRoutes.CACHE, title, description, 'sefmat_id_cache');
      // Every entry stores its own route key.
      expect(picker.route).assertEqual('picker');
      expect(recent.route).assertEqual('recent');
      expect(gallery.route).assertEqual('gallery');
      expect(edit.route).assertEqual('edit');
      expect(cache.route).assertEqual('cache');
      // The component ids are pairwise distinct.
      expect(picker.componentId !== recent.componentId).assertTrue();
      expect(picker.componentId !== gallery.componentId).assertTrue();
      expect(picker.componentId !== edit.componentId).assertTrue();
      expect(picker.componentId !== cache.componentId).assertTrue();
      expect(recent.componentId !== gallery.componentId).assertTrue();
      expect(recent.componentId !== edit.componentId).assertTrue();
      expect(recent.componentId !== cache.componentId).assertTrue();
      expect(gallery.componentId !== edit.componentId).assertTrue();
      expect(gallery.componentId !== cache.componentId).assertTrue();
      expect(edit.componentId !== cache.componentId).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_2700
     * @tc.name      testSceneFormat0027
     * @tc.desc      Verify percent rounds fifths and sixths of the total with
     *               the documented Math.round behaviour.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneFormat0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSceneFormat0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Fifths of the total map onto exact multiples of twenty.
      expect(FormatUtil.percent(1, 5)).assertEqual(20);
      expect(FormatUtil.percent(2, 5)).assertEqual(40);
      expect(FormatUtil.percent(3, 5)).assertEqual(60);
      expect(FormatUtil.percent(4, 5)).assertEqual(80);
      // Sixths round the repeating fractions to the nearest integer.
      expect(FormatUtil.percent(1, 6)).assertEqual(17);
      expect(FormatUtil.percent(5, 6)).assertEqual(83);
      // Sixteenths round the exact half values up.
      expect(FormatUtil.percent(7, 16)).assertEqual(44);
      expect(FormatUtil.percent(9, 16)).assertEqual(56);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_2800
     * @tc.name      testSceneFormat0028
     * @tc.desc      Verify bytes keeps the zero, the last byte and the first
     *               gigabyte over one in their exact ladder branches.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSceneFormat0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testSceneFormat0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Zero bytes stays inside the plain byte branch.
      expect(FormatUtil.bytes(0)).assertEqual('0 B');
      // The last byte below one kilobyte keeps the byte unit.
      expect(FormatUtil.bytes(999)).assertEqual('999 B');
      // One byte above one gigabyte opens the gigabyte ladder.
      expect(FormatUtil.bytes(1073741825)).assertEqual('1.00 GB');
      // A far unclamped percentage documents the missing clamp too.
      expect(FormatUtil.percent(1000, 3)).assertEqual(33333);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_SEFMAT_2900
     * @tc.name      testSceneFormat0029
     * @tc.desc      Verify percent and time cooperate on a mixed set of full
     *               ratio inputs and spring timestamps.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSceneFormat0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const TAG: string = 'testSceneFormat0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Full ratios report one hundred in every shape.
      expect(FormatUtil.percent(1, 1)).assertEqual(100);
      expect(FormatUtil.percent(2, 2)).assertEqual(100);
      // An over full and a slightly under full ratio round as usual.
      expect(FormatUtil.percent(19, 17)).assertEqual(112);
      expect(FormatUtil.percent(17, 19)).assertEqual(89);
      // Spring timestamps keep every padded field visible.
      const aprilMorning: number = new Date(2026, 3, 9, 8, 15).getTime();
      expect(FormatUtil.time(aprilMorning)).assertEqual('2026-04-09 08:15');
      const julyDawn: number = new Date(2026, 6, 1, 7, 45).getTime();
      expect(FormatUtil.time(julyDawn)).assertEqual('2026-07-01 07:45');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
