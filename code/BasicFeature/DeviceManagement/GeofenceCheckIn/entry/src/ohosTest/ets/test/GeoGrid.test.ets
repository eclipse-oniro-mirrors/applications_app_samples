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


import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { GeoGridUtil } from './support/GeoGridUtil';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_GEOGRID]';

interface ClampCase {
  index: number;
  count: number;
  expected: number;
}

const CLAMP_CASES: ClampCase[] = [
  { index: 0, count: 10, expected: 0 },
  { index: 5, count: 10, expected: 5 },
  { index: 9, count: 10, expected: 9 },
  { index: 10, count: 10, expected: 9 },
  { index: -1, count: 10, expected: 0 },
  { index: -20, count: 10, expected: 0 },
  { index: 3, count: 0, expected: 0 },
  { index: 3, count: 1, expected: 0 },
];

interface WrapCase {
  index: number;
  count: number;
  expected: number;
}

const WRAP_CASES: WrapCase[] = [
  { index: 0, count: 10, expected: 0 },
  { index: 10, count: 10, expected: 0 },
  { index: 11, count: 10, expected: 1 },
  { index: -1, count: 10, expected: 9 },
  { index: -10, count: 10, expected: 0 },
  { index: -11, count: 10, expected: 9 },
  { index: 25, count: 10, expected: 5 },
  { index: 5, count: 0, expected: 0 },
];

interface LatitudeCase {
  input: number;
  expected: boolean;
}

const LATITUDE_CASES: LatitudeCase[] = [
  { input: -91, expected: false },
  { input: -90.1, expected: false },
  { input: -90, expected: true },
  { input: -45, expected: true },
  { input: 0, expected: true },
  { input: 45, expected: true },
  { input: 89.9, expected: true },
  { input: 90, expected: true },
  { input: 90.1, expected: false },
  { input: 91, expected: false },
];

interface LongitudeCase {
  input: number;
  expected: boolean;
}

const LONGITUDE_CASES: LongitudeCase[] = [
  { input: -181, expected: false },
  { input: -180.1, expected: false },
  { input: -180, expected: true },
  { input: -90, expected: true },
  { input: 0, expected: true },
  { input: 90, expected: true },
  { input: 179.9, expected: true },
  { input: 180, expected: true },
  { input: 180.1, expected: false },
  { input: 181, expected: false },
];

interface IndexCase {
  input: number;
  step: number;
  expected: number;
}

const LAT_INDEX_CASES: IndexCase[] = [
  { input: -90, step: 0.5, expected: 0 },
  { input: -89.9, step: 0.5, expected: 0 },
  { input: -45, step: 0.5, expected: 90 },
  { input: 0, step: 0.5, expected: 180 },
  { input: 45, step: 0.5, expected: 270 },
  { input: 89.9, step: 0.5, expected: 359 },
  { input: 90, step: 0.5, expected: 360 },
];

interface LonIndexCase {
  input: number;
  step: number;
  expected: number;
}

const LON_INDEX_CASES: LonIndexCase[] = [
  { input: -180, step: 0.5, expected: 0 },
  { input: -179.9, step: 0.5, expected: 0 },
  { input: -90, step: 0.5, expected: 180 },
  { input: 0, step: 0.5, expected: 360 },
  { input: 90, step: 0.5, expected: 540 },
  { input: 179.9, step: 0.5, expected: 719 },
  { input: 180, step: 0.5, expected: 720 },
];

interface CenterCase {
  index: number;
  step: number;
  expected: number;
}

const LAT_CENTER_CASES: CenterCase[] = [
  { index: 0, step: 0.5, expected: -89.75 },
  { index: 1, step: 0.5, expected: -89.25 },
  { index: 10, step: 0.5, expected: -84.75 },
  { index: 100, step: 0.5, expected: -39.75 },
  { index: 359, step: 0.5, expected: 89.75 },
];

interface LonCenterCase {
  index: number;
  step: number;
  expected: number;
}

const LON_CENTER_CASES: LonCenterCase[] = [
  { index: 0, step: 0.5, expected: -179.75 },
  { index: 1, step: 0.5, expected: -179.25 },
  { index: 10, step: 0.5, expected: -174.75 },
  { index: 100, step: 0.5, expected: -129.75 },
  { index: 719, step: 0.5, expected: 179.75 },
];

interface KeyCase {
  latIndex: number;
  lonIndex: number;
  expected: string;
}

const KEY_CASES: KeyCase[] = [
  { latIndex: 0, lonIndex: 0, expected: '0:0' },
  { latIndex: 1, lonIndex: 2, expected: '1:2' },
  { latIndex: -1, lonIndex: -2, expected: '-1:-2' },
  { latIndex: 10, lonIndex: 20, expected: '10:20' },
];

export default function geoGridMatrixTest() {
  describe('GeoGridMatrixTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'GeoGridMatrixTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'GeoGridMatrixTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_GEOGRID_0100
     * @tc.name      testClampGridIndex0001
     * @tc.desc      Verify clampGridIndex keeps indexes inside the grid and maps invalid counts to zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampGridIndex0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampGridIndex0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < CLAMP_CASES.length; i++) {
        const row: ClampCase = CLAMP_CASES[i];
        expect(GeoGridUtil.clampGridIndex(row.index, row.count)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(CLAMP_CASES.length);
      expect(CLAMP_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'clampGridIndex rows checked: ' + checked);
      expect(GeoGridUtil.clampGridIndex(-1, 10)).assertEqual(0);
      expect(GeoGridUtil.clampGridIndex(10, 10)).assertEqual(9);
      expect(GeoGridUtil.clampGridIndex(3, 0)).assertEqual(0);
      expect(GeoGridUtil.clampGridIndex(3, -5)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_GEOGRID_0200
     * @tc.name      testWrapLongitudeIndex0002
     * @tc.desc      Verify wrapLongitudeIndex wraps negative and overflowing indexes around the grid.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testWrapLongitudeIndex0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testWrapLongitudeIndex0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < WRAP_CASES.length; i++) {
        const row: WrapCase = WRAP_CASES[i];
        expect(GeoGridUtil.wrapLongitudeIndex(row.index, row.count)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(WRAP_CASES.length);
      expect(WRAP_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'wrapLongitudeIndex rows checked: ' + checked);
      expect(GeoGridUtil.wrapLongitudeIndex(-1, 10)).assertEqual(9);
      expect(GeoGridUtil.wrapLongitudeIndex(10, 10)).assertEqual(0);
      expect(GeoGridUtil.wrapLongitudeIndex(5, 0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_GEOGRID_0300
     * @tc.name      testCoordinateValidity0003
     * @tc.desc      Verify latitude and longitude validity checks accept the closed ranges and reject outliers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCoordinateValidity0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCoordinateValidity0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < LATITUDE_CASES.length; i++) {
        const row: LatitudeCase = LATITUDE_CASES[i];
        expect(GeoGridUtil.isValidLatitude(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(LATITUDE_CASES.length);
      expect(LATITUDE_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'latitudeValidity rows checked: ' + checked);
      let checkedLon: number = 0;
      for (let i = 0; i < LONGITUDE_CASES.length; i++) {
        const row: LongitudeCase = LONGITUDE_CASES[i];
        expect(GeoGridUtil.isValidLongitude(row.input)).assertEqual(row.expected);
        checkedLon = checkedLon + 1;
      }
      expect(checkedLon).assertEqual(LONGITUDE_CASES.length);
      expect(LONGITUDE_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'longitudeValidity rows checked: ' + checkedLon);
      expect(GeoGridUtil.isValidLatitude(Number.NaN)).assertFalse();
      expect(GeoGridUtil.isValidLongitude(Number.NaN)).assertFalse();
      expect(GeoGridUtil.isValidLatitude(Number.POSITIVE_INFINITY)).assertFalse();
      expect(GeoGridUtil.isValidLongitude(Number.NEGATIVE_INFINITY)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_GEOGRID_0400
     * @tc.name      testLatitudeIndex0004
     * @tc.desc      Verify latitudeIndex maps degrees onto grid rows and rejects invalid steps.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLatitudeIndex0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLatitudeIndex0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < LAT_INDEX_CASES.length; i++) {
        const row: IndexCase = LAT_INDEX_CASES[i];
        expect(GeoGridUtil.latitudeIndex(row.input, row.step)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(LAT_INDEX_CASES.length);
      expect(LAT_INDEX_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'latitudeIndex rows checked: ' + checked);
      expect(GeoGridUtil.latitudeIndex(0, 0)).assertEqual(-1);
      expect(GeoGridUtil.latitudeIndex(0, -1)).assertEqual(-1);
      expect(GeoGridUtil.latitudeIndex(91, 0.5)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_GEOGRID_0500
     * @tc.name      testLongitudeIndex0005
     * @tc.desc      Verify longitudeIndex maps degrees onto grid columns and rejects invalid steps.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLongitudeIndex0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLongitudeIndex0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < LON_INDEX_CASES.length; i++) {
        const row: LonIndexCase = LON_INDEX_CASES[i];
        expect(GeoGridUtil.longitudeIndex(row.input, row.step)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(LON_INDEX_CASES.length);
      expect(LON_INDEX_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'longitudeIndex rows checked: ' + checked);
      expect(GeoGridUtil.longitudeIndex(0, 0)).assertEqual(-1);
      expect(GeoGridUtil.longitudeIndex(0, -1)).assertEqual(-1);
      expect(GeoGridUtil.longitudeIndex(181, 0.5)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_GEOGRID_0600
     * @tc.name      testCenterLatitude0006
     * @tc.desc      Verify centerLatitude returns the middle latitude of the requested grid row.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCenterLatitude0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCenterLatitude0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < LAT_CENTER_CASES.length; i++) {
        const row: CenterCase = LAT_CENTER_CASES[i];
        expect(Math.abs(GeoGridUtil.centerLatitude(row.index, row.step) - row.expected) < 0.000001).assertTrue();
        checked = checked + 1;
      }
      expect(checked).assertEqual(LAT_CENTER_CASES.length);
      expect(LAT_CENTER_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'centerLatitude rows checked: ' + checked);
      expect(GeoGridUtil.centerLatitude(-1, 0.5)).assertEqual(0);
      expect(GeoGridUtil.centerLatitude(0, 0)).assertEqual(0);
      expect(GeoGridUtil.centerLatitude(0, -1)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_GEOGRID_0700
     * @tc.name      testCenterLongitude0007
     * @tc.desc      Verify centerLongitude returns the middle longitude of the requested grid column.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCenterLongitude0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCenterLongitude0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < LON_CENTER_CASES.length; i++) {
        const row: LonCenterCase = LON_CENTER_CASES[i];
        expect(Math.abs(GeoGridUtil.centerLongitude(row.index, row.step) - row.expected) < 0.000001).assertTrue();
        checked = checked + 1;
      }
      expect(checked).assertEqual(LON_CENTER_CASES.length);
      expect(LON_CENTER_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'centerLongitude rows checked: ' + checked);
      expect(GeoGridUtil.centerLongitude(-1, 0.5)).assertEqual(0);
      expect(GeoGridUtil.centerLongitude(0, 0)).assertEqual(0);
      expect(GeoGridUtil.centerLongitude(0, -1)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_GEOGRID_0800
     * @tc.name      testGridKey0008
     * @tc.desc      Verify gridKey joins latitude and longitude indexes into a stable lookup key.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGridKey0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testGridKey0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < KEY_CASES.length; i++) {
        const row: KeyCase = KEY_CASES[i];
        expect(GeoGridUtil.gridKey(row.latIndex, row.lonIndex)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(KEY_CASES.length);
      expect(KEY_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'gridKey rows checked: ' + checked);
      expect(GeoGridUtil.gridKey(0, 0)).assertEqual('0:0');
      expect(GeoGridUtil.gridKey(1, 2)).assertEqual('1:2');
      expect(GeoGridUtil.gridKey(-1, -2)).assertEqual('-1:-2');
      expect(GeoGridUtil.gridKey(10, 20).length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_GEOGRID_0900
     * @tc.name      testNeighborKeys0009
     * @tc.desc      Verify neighborKeys returns the eight surrounding grid keys including diagonals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNeighborKeys0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNeighborKeys0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const keys: string[] = GeoGridUtil.neighborKeys(5, 5);
      expect(keys.length).assertEqual(8);
      expect(keys[0]).assertEqual('4:4');
      expect(keys[1]).assertEqual('4:5');
      expect(keys[2]).assertEqual('4:6');
      expect(keys[3]).assertEqual('5:4');
      expect(keys[4]).assertEqual('5:6');
      expect(keys[5]).assertEqual('6:4');
      expect(keys[6]).assertEqual('6:5');
      expect(keys[7]).assertEqual('6:6');
      expect(keys.indexOf('5:5') < 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_GEOGRID_1000
     * @tc.name      testCellCount0010
     * @tc.desc      Verify cell counts derive from the step size and invalid steps yield zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCellCount0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCellCount0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(GeoGridUtil.latitudeCellCount(1)).assertEqual(180);
      expect(GeoGridUtil.latitudeCellCount(0.5)).assertEqual(360);
      expect(GeoGridUtil.latitudeCellCount(10)).assertEqual(18);
      expect(GeoGridUtil.longitudeCellCount(1)).assertEqual(360);
      expect(GeoGridUtil.longitudeCellCount(0.5)).assertEqual(720);
      expect(GeoGridUtil.longitudeCellCount(10)).assertEqual(36);
      expect(GeoGridUtil.latitudeCellCount(0)).assertEqual(0);
      expect(GeoGridUtil.longitudeCellCount(-1)).assertEqual(0);
      expect(GeoGridUtil.latitudeCellCount(1) * 2).assertEqual(GeoGridUtil.longitudeCellCount(1));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_GEOGRID_1100
     * @tc.name      testGridRoundTrip0011
     * @tc.desc      Verify grid indexes and cell centers round trip for every step of a full latitude sweep.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGridRoundTrip0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testGridRoundTrip0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let step = 1; step <= 10; step++) {
        for (let index = 0; index < 10; index++) {
          const center: number = GeoGridUtil.centerLatitude(index, step);
          expect(GeoGridUtil.isValidLatitude(center)).assertTrue();
          expect(GeoGridUtil.latitudeIndex(center, step)).assertEqual(index);
          checked = checked + 1;
        }
      }
      expect(checked).assertEqual(100);
      expect(GeoGridUtil.latitudeCellCount(1)).assertEqual(180);
      expect(GeoGridUtil.longitudeCellCount(1)).assertEqual(360);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
