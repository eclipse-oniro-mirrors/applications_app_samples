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
import { FenceConfig, GeofenceFeature, MAX_RADIUS, MIN_RADIUS } from 'library';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_CFGCART]';

interface ConfigCase {
  latitude: number;
  longitude: number;
  radius: number;
  expected: boolean;
}

const CONFIG_CASES: ConfigCase[] = [
  { latitude: -90, longitude: -180, radius: 49, expected: false },
  { latitude: -90, longitude: -180, radius: 50, expected: true },
  { latitude: -90, longitude: -180, radius: 200, expected: true },
  { latitude: -90, longitude: -180, radius: 4999, expected: true },
  { latitude: -90, longitude: -180, radius: 5000, expected: true },
  { latitude: -90, longitude: -180, radius: 5001, expected: false },
  { latitude: -90, longitude: -120, radius: 49, expected: false },
  { latitude: -90, longitude: -120, radius: 50, expected: true },
  { latitude: -90, longitude: -120, radius: 200, expected: true },
  { latitude: -90, longitude: -120, radius: 4999, expected: true },
  { latitude: -90, longitude: -120, radius: 5000, expected: true },
  { latitude: -90, longitude: -120, radius: 5001, expected: false },
  { latitude: -90, longitude: 0, radius: 49, expected: false },
  { latitude: -90, longitude: 0, radius: 50, expected: true },
  { latitude: -90, longitude: 0, radius: 200, expected: true },
  { latitude: -90, longitude: 0, radius: 4999, expected: true },
  { latitude: -90, longitude: 0, radius: 5000, expected: true },
  { latitude: -90, longitude: 0, radius: 5001, expected: false },
  { latitude: -90, longitude: 116.397499, radius: 49, expected: false },
  { latitude: -90, longitude: 116.397499, radius: 50, expected: true },
  { latitude: -90, longitude: 116.397499, radius: 200, expected: true },
  { latitude: -90, longitude: 116.397499, radius: 4999, expected: true },
  { latitude: -90, longitude: 116.397499, radius: 5000, expected: true },
  { latitude: -90, longitude: 116.397499, radius: 5001, expected: false },
  { latitude: -90, longitude: 150, radius: 49, expected: false },
  { latitude: -90, longitude: 150, radius: 50, expected: true },
  { latitude: -90, longitude: 150, radius: 200, expected: true },
  { latitude: -90, longitude: 150, radius: 4999, expected: true },
  { latitude: -90, longitude: 150, radius: 5000, expected: true },
  { latitude: -90, longitude: 150, radius: 5001, expected: false },
  { latitude: -90, longitude: 180, radius: 49, expected: false },
  { latitude: -90, longitude: 180, radius: 50, expected: true },
  { latitude: -90, longitude: 180, radius: 200, expected: true },
  { latitude: -90, longitude: 180, radius: 4999, expected: true },
  { latitude: -90, longitude: 180, radius: 5000, expected: true },
  { latitude: -90, longitude: 180, radius: 5001, expected: false },
  { latitude: -90, longitude: 180.1, radius: 49, expected: false },
  { latitude: -90, longitude: 180.1, radius: 50, expected: false },
  { latitude: -90, longitude: 180.1, radius: 200, expected: false },
  { latitude: -90, longitude: 180.1, radius: 4999, expected: false },
  { latitude: -90, longitude: 180.1, radius: 5000, expected: false },
  { latitude: -90, longitude: 180.1, radius: 5001, expected: false },
  { latitude: -45, longitude: -180, radius: 49, expected: false },
  { latitude: -45, longitude: -180, radius: 50, expected: true },
  { latitude: -45, longitude: -180, radius: 200, expected: true },
  { latitude: -45, longitude: -180, radius: 4999, expected: true },
  { latitude: -45, longitude: -180, radius: 5000, expected: true },
  { latitude: -45, longitude: -180, radius: 5001, expected: false },
  { latitude: -45, longitude: -120, radius: 49, expected: false },
  { latitude: -45, longitude: -120, radius: 50, expected: true },
  { latitude: -45, longitude: -120, radius: 200, expected: true },
  { latitude: -45, longitude: -120, radius: 4999, expected: true },
  { latitude: -45, longitude: -120, radius: 5000, expected: true },
  { latitude: -45, longitude: -120, radius: 5001, expected: false },
  { latitude: -45, longitude: 0, radius: 49, expected: false },
  { latitude: -45, longitude: 0, radius: 50, expected: true },
  { latitude: -45, longitude: 0, radius: 200, expected: true },
  { latitude: -45, longitude: 0, radius: 4999, expected: true },
  { latitude: -45, longitude: 0, radius: 5000, expected: true },
  { latitude: -45, longitude: 0, radius: 5001, expected: false },
  { latitude: -45, longitude: 116.397499, radius: 49, expected: false },
  { latitude: -45, longitude: 116.397499, radius: 50, expected: true },
  { latitude: -45, longitude: 116.397499, radius: 200, expected: true },
  { latitude: -45, longitude: 116.397499, radius: 4999, expected: true },
  { latitude: -45, longitude: 116.397499, radius: 5000, expected: true },
  { latitude: -45, longitude: 116.397499, radius: 5001, expected: false },
  { latitude: -45, longitude: 150, radius: 49, expected: false },
  { latitude: -45, longitude: 150, radius: 50, expected: true },
  { latitude: -45, longitude: 150, radius: 200, expected: true },
  { latitude: -45, longitude: 150, radius: 4999, expected: true },
  { latitude: -45, longitude: 150, radius: 5000, expected: true },
  { latitude: -45, longitude: 150, radius: 5001, expected: false },
  { latitude: -45, longitude: 180, radius: 49, expected: false },
  { latitude: -45, longitude: 180, radius: 50, expected: true },
  { latitude: -45, longitude: 180, radius: 200, expected: true },
  { latitude: -45, longitude: 180, radius: 4999, expected: true },
  { latitude: -45, longitude: 180, radius: 5000, expected: true },
  { latitude: -45, longitude: 180, radius: 5001, expected: false },
  { latitude: -45, longitude: 180.1, radius: 49, expected: false },
  { latitude: -45, longitude: 180.1, radius: 50, expected: false },
  { latitude: -45, longitude: 180.1, radius: 200, expected: false },
  { latitude: -45, longitude: 180.1, radius: 4999, expected: false },
  { latitude: -45, longitude: 180.1, radius: 5000, expected: false },
  { latitude: -45, longitude: 180.1, radius: 5001, expected: false },
  { latitude: 0, longitude: -180, radius: 49, expected: false },
  { latitude: 0, longitude: -180, radius: 50, expected: true },
  { latitude: 0, longitude: -180, radius: 200, expected: true },
  { latitude: 0, longitude: -180, radius: 4999, expected: true },
  { latitude: 0, longitude: -180, radius: 5000, expected: true },
  { latitude: 0, longitude: -180, radius: 5001, expected: false },
  { latitude: 0, longitude: -120, radius: 49, expected: false },
  { latitude: 0, longitude: -120, radius: 50, expected: true },
  { latitude: 0, longitude: -120, radius: 200, expected: true },
  { latitude: 0, longitude: -120, radius: 4999, expected: true },
  { latitude: 0, longitude: -120, radius: 5000, expected: true },
  { latitude: 0, longitude: -120, radius: 5001, expected: false },
  { latitude: 0, longitude: 0, radius: 49, expected: false },
  { latitude: 0, longitude: 0, radius: 50, expected: true },
  { latitude: 0, longitude: 0, radius: 200, expected: true },
  { latitude: 0, longitude: 0, radius: 4999, expected: true },
  { latitude: 0, longitude: 0, radius: 5000, expected: true },
  { latitude: 0, longitude: 0, radius: 5001, expected: false },
  { latitude: 0, longitude: 116.397499, radius: 49, expected: false },
  { latitude: 0, longitude: 116.397499, radius: 50, expected: true },
  { latitude: 0, longitude: 116.397499, radius: 200, expected: true },
  { latitude: 0, longitude: 116.397499, radius: 4999, expected: true },
  { latitude: 0, longitude: 116.397499, radius: 5000, expected: true },
  { latitude: 0, longitude: 116.397499, radius: 5001, expected: false },
  { latitude: 0, longitude: 150, radius: 49, expected: false },
  { latitude: 0, longitude: 150, radius: 50, expected: true },
  { latitude: 0, longitude: 150, radius: 200, expected: true },
  { latitude: 0, longitude: 150, radius: 4999, expected: true },
  { latitude: 0, longitude: 150, radius: 5000, expected: true },
  { latitude: 0, longitude: 150, radius: 5001, expected: false },
  { latitude: 0, longitude: 180, radius: 49, expected: false },
  { latitude: 0, longitude: 180, radius: 50, expected: true },
  { latitude: 0, longitude: 180, radius: 200, expected: true },
  { latitude: 0, longitude: 180, radius: 4999, expected: true },
  { latitude: 0, longitude: 180, radius: 5000, expected: true },
  { latitude: 0, longitude: 180, radius: 5001, expected: false },
  { latitude: 0, longitude: 180.1, radius: 49, expected: false },
  { latitude: 0, longitude: 180.1, radius: 50, expected: false },
  { latitude: 0, longitude: 180.1, radius: 200, expected: false },
  { latitude: 0, longitude: 180.1, radius: 4999, expected: false },
  { latitude: 0, longitude: 180.1, radius: 5000, expected: false },
  { latitude: 0, longitude: 180.1, radius: 5001, expected: false },
  { latitude: 39.908722, longitude: -180, radius: 49, expected: false },
  { latitude: 39.908722, longitude: -180, radius: 50, expected: true },
  { latitude: 39.908722, longitude: -180, radius: 200, expected: true },
  { latitude: 39.908722, longitude: -180, radius: 4999, expected: true },
  { latitude: 39.908722, longitude: -180, radius: 5000, expected: true },
  { latitude: 39.908722, longitude: -180, radius: 5001, expected: false },
  { latitude: 39.908722, longitude: -120, radius: 49, expected: false },
  { latitude: 39.908722, longitude: -120, radius: 50, expected: true },
  { latitude: 39.908722, longitude: -120, radius: 200, expected: true },
  { latitude: 39.908722, longitude: -120, radius: 4999, expected: true },
  { latitude: 39.908722, longitude: -120, radius: 5000, expected: true },
  { latitude: 39.908722, longitude: -120, radius: 5001, expected: false },
  { latitude: 39.908722, longitude: 0, radius: 49, expected: false },
  { latitude: 39.908722, longitude: 0, radius: 50, expected: true },
  { latitude: 39.908722, longitude: 0, radius: 200, expected: true },
  { latitude: 39.908722, longitude: 0, radius: 4999, expected: true },
  { latitude: 39.908722, longitude: 0, radius: 5000, expected: true },
  { latitude: 39.908722, longitude: 0, radius: 5001, expected: false },
  { latitude: 39.908722, longitude: 116.397499, radius: 49, expected: false },
  { latitude: 39.908722, longitude: 116.397499, radius: 50, expected: true },
  { latitude: 39.908722, longitude: 116.397499, radius: 200, expected: true },
  { latitude: 39.908722, longitude: 116.397499, radius: 4999, expected: true },
  { latitude: 39.908722, longitude: 116.397499, radius: 5000, expected: true },
  { latitude: 39.908722, longitude: 116.397499, radius: 5001, expected: false },
  { latitude: 39.908722, longitude: 150, radius: 49, expected: false },
  { latitude: 39.908722, longitude: 150, radius: 50, expected: true },
  { latitude: 39.908722, longitude: 150, radius: 200, expected: true },
  { latitude: 39.908722, longitude: 150, radius: 4999, expected: true },
  { latitude: 39.908722, longitude: 150, radius: 5000, expected: true },
  { latitude: 39.908722, longitude: 150, radius: 5001, expected: false },
  { latitude: 39.908722, longitude: 180, radius: 49, expected: false },
  { latitude: 39.908722, longitude: 180, radius: 50, expected: true },
  { latitude: 39.908722, longitude: 180, radius: 200, expected: true },
  { latitude: 39.908722, longitude: 180, radius: 4999, expected: true },
  { latitude: 39.908722, longitude: 180, radius: 5000, expected: true },
  { latitude: 39.908722, longitude: 180, radius: 5001, expected: false },
  { latitude: 39.908722, longitude: 180.1, radius: 49, expected: false },
  { latitude: 39.908722, longitude: 180.1, radius: 50, expected: false },
  { latitude: 39.908722, longitude: 180.1, radius: 200, expected: false },
  { latitude: 39.908722, longitude: 180.1, radius: 4999, expected: false },
  { latitude: 39.908722, longitude: 180.1, radius: 5000, expected: false },
  { latitude: 39.908722, longitude: 180.1, radius: 5001, expected: false },
  { latitude: 60, longitude: -180, radius: 49, expected: false },
  { latitude: 60, longitude: -180, radius: 50, expected: true },
  { latitude: 60, longitude: -180, radius: 200, expected: true },
  { latitude: 60, longitude: -180, radius: 4999, expected: true },
  { latitude: 60, longitude: -180, radius: 5000, expected: true },
  { latitude: 60, longitude: -180, radius: 5001, expected: false },
  { latitude: 60, longitude: -120, radius: 49, expected: false },
  { latitude: 60, longitude: -120, radius: 50, expected: true },
  { latitude: 60, longitude: -120, radius: 200, expected: true },
  { latitude: 60, longitude: -120, radius: 4999, expected: true },
  { latitude: 60, longitude: -120, radius: 5000, expected: true },
  { latitude: 60, longitude: -120, radius: 5001, expected: false },
  { latitude: 60, longitude: 0, radius: 49, expected: false },
  { latitude: 60, longitude: 0, radius: 50, expected: true },
  { latitude: 60, longitude: 0, radius: 200, expected: true },
  { latitude: 60, longitude: 0, radius: 4999, expected: true },
  { latitude: 60, longitude: 0, radius: 5000, expected: true },
  { latitude: 60, longitude: 0, radius: 5001, expected: false },
  { latitude: 60, longitude: 116.397499, radius: 49, expected: false },
  { latitude: 60, longitude: 116.397499, radius: 50, expected: true },
  { latitude: 60, longitude: 116.397499, radius: 200, expected: true },
  { latitude: 60, longitude: 116.397499, radius: 4999, expected: true },
  { latitude: 60, longitude: 116.397499, radius: 5000, expected: true },
  { latitude: 60, longitude: 116.397499, radius: 5001, expected: false },
  { latitude: 60, longitude: 150, radius: 49, expected: false },
  { latitude: 60, longitude: 150, radius: 50, expected: true },
  { latitude: 60, longitude: 150, radius: 200, expected: true },
  { latitude: 60, longitude: 150, radius: 4999, expected: true },
  { latitude: 60, longitude: 150, radius: 5000, expected: true },
  { latitude: 60, longitude: 150, radius: 5001, expected: false },
  { latitude: 60, longitude: 180, radius: 49, expected: false },
  { latitude: 60, longitude: 180, radius: 50, expected: true },
  { latitude: 60, longitude: 180, radius: 200, expected: true },
  { latitude: 60, longitude: 180, radius: 4999, expected: true },
  { latitude: 60, longitude: 180, radius: 5000, expected: true },
  { latitude: 60, longitude: 180, radius: 5001, expected: false },
  { latitude: 60, longitude: 180.1, radius: 49, expected: false },
  { latitude: 60, longitude: 180.1, radius: 50, expected: false },
  { latitude: 60, longitude: 180.1, radius: 200, expected: false },
  { latitude: 60, longitude: 180.1, radius: 4999, expected: false },
  { latitude: 60, longitude: 180.1, radius: 5000, expected: false },
  { latitude: 60, longitude: 180.1, radius: 5001, expected: false },
  { latitude: 90, longitude: -180, radius: 49, expected: false },
  { latitude: 90, longitude: -180, radius: 50, expected: true },
  { latitude: 90, longitude: -180, radius: 200, expected: true },
  { latitude: 90, longitude: -180, radius: 4999, expected: true },
  { latitude: 90, longitude: -180, radius: 5000, expected: true },
  { latitude: 90, longitude: -180, radius: 5001, expected: false },
  { latitude: 90, longitude: -120, radius: 49, expected: false },
  { latitude: 90, longitude: -120, radius: 50, expected: true },
  { latitude: 90, longitude: -120, radius: 200, expected: true },
  { latitude: 90, longitude: -120, radius: 4999, expected: true },
  { latitude: 90, longitude: -120, radius: 5000, expected: true },
  { latitude: 90, longitude: -120, radius: 5001, expected: false },
  { latitude: 90, longitude: 0, radius: 49, expected: false },
  { latitude: 90, longitude: 0, radius: 50, expected: true },
  { latitude: 90, longitude: 0, radius: 200, expected: true },
  { latitude: 90, longitude: 0, radius: 4999, expected: true },
  { latitude: 90, longitude: 0, radius: 5000, expected: true },
  { latitude: 90, longitude: 0, radius: 5001, expected: false },
  { latitude: 90, longitude: 116.397499, radius: 49, expected: false },
  { latitude: 90, longitude: 116.397499, radius: 50, expected: true },
  { latitude: 90, longitude: 116.397499, radius: 200, expected: true },
  { latitude: 90, longitude: 116.397499, radius: 4999, expected: true },
  { latitude: 90, longitude: 116.397499, radius: 5000, expected: true },
  { latitude: 90, longitude: 116.397499, radius: 5001, expected: false },
  { latitude: 90, longitude: 150, radius: 49, expected: false },
  { latitude: 90, longitude: 150, radius: 50, expected: true },
  { latitude: 90, longitude: 150, radius: 200, expected: true },
  { latitude: 90, longitude: 150, radius: 4999, expected: true },
  { latitude: 90, longitude: 150, radius: 5000, expected: true },
  { latitude: 90, longitude: 150, radius: 5001, expected: false },
  { latitude: 90, longitude: 180, radius: 49, expected: false },
  { latitude: 90, longitude: 180, radius: 50, expected: true },
  { latitude: 90, longitude: 180, radius: 200, expected: true },
  { latitude: 90, longitude: 180, radius: 4999, expected: true },
  { latitude: 90, longitude: 180, radius: 5000, expected: true },
  { latitude: 90, longitude: 180, radius: 5001, expected: false },
  { latitude: 90, longitude: 180.1, radius: 49, expected: false },
  { latitude: 90, longitude: 180.1, radius: 50, expected: false },
  { latitude: 90, longitude: 180.1, radius: 200, expected: false },
  { latitude: 90, longitude: 180.1, radius: 4999, expected: false },
  { latitude: 90, longitude: 180.1, radius: 5000, expected: false },
  { latitude: 90, longitude: 180.1, radius: 5001, expected: false },
  { latitude: 90.1, longitude: -180, radius: 49, expected: false },
  { latitude: 90.1, longitude: -180, radius: 50, expected: false },
  { latitude: 90.1, longitude: -180, radius: 200, expected: false },
  { latitude: 90.1, longitude: -180, radius: 4999, expected: false },
  { latitude: 90.1, longitude: -180, radius: 5000, expected: false },
  { latitude: 90.1, longitude: -180, radius: 5001, expected: false },
  { latitude: 90.1, longitude: -120, radius: 49, expected: false },
  { latitude: 90.1, longitude: -120, radius: 50, expected: false },
  { latitude: 90.1, longitude: -120, radius: 200, expected: false },
  { latitude: 90.1, longitude: -120, radius: 4999, expected: false },
  { latitude: 90.1, longitude: -120, radius: 5000, expected: false },
  { latitude: 90.1, longitude: -120, radius: 5001, expected: false },
  { latitude: 90.1, longitude: 0, radius: 49, expected: false },
  { latitude: 90.1, longitude: 0, radius: 50, expected: false },
  { latitude: 90.1, longitude: 0, radius: 200, expected: false },
  { latitude: 90.1, longitude: 0, radius: 4999, expected: false },
  { latitude: 90.1, longitude: 0, radius: 5000, expected: false },
  { latitude: 90.1, longitude: 0, radius: 5001, expected: false },
  { latitude: 90.1, longitude: 116.397499, radius: 49, expected: false },
  { latitude: 90.1, longitude: 116.397499, radius: 50, expected: false },
  { latitude: 90.1, longitude: 116.397499, radius: 200, expected: false },
  { latitude: 90.1, longitude: 116.397499, radius: 4999, expected: false },
  { latitude: 90.1, longitude: 116.397499, radius: 5000, expected: false },
  { latitude: 90.1, longitude: 116.397499, radius: 5001, expected: false },
  { latitude: 90.1, longitude: 150, radius: 49, expected: false },
  { latitude: 90.1, longitude: 150, radius: 50, expected: false },
  { latitude: 90.1, longitude: 150, radius: 200, expected: false },
  { latitude: 90.1, longitude: 150, radius: 4999, expected: false },
  { latitude: 90.1, longitude: 150, radius: 5000, expected: false },
  { latitude: 90.1, longitude: 150, radius: 5001, expected: false },
  { latitude: 90.1, longitude: 180, radius: 49, expected: false },
  { latitude: 90.1, longitude: 180, radius: 50, expected: false },
  { latitude: 90.1, longitude: 180, radius: 200, expected: false },
  { latitude: 90.1, longitude: 180, radius: 4999, expected: false },
  { latitude: 90.1, longitude: 180, radius: 5000, expected: false },
  { latitude: 90.1, longitude: 180, radius: 5001, expected: false },
  { latitude: 90.1, longitude: 180.1, radius: 49, expected: false },
  { latitude: 90.1, longitude: 180.1, radius: 50, expected: false },
  { latitude: 90.1, longitude: 180.1, radius: 200, expected: false },
  { latitude: 90.1, longitude: 180.1, radius: 4999, expected: false },
  { latitude: 90.1, longitude: 180.1, radius: 5000, expected: false },
  { latitude: 90.1, longitude: 180.1, radius: 5001, expected: false },
];


/**
 * Build a fence configuration with the three validated fields set explicitly.
 * @param latitude the latitude to validate
 * @param longitude the longitude to validate
 * @param radius the radius to validate
 * @returns the configuration carrying the requested values
 */
function makeConfig(latitude: number, longitude: number, radius: number): FenceConfig {
  const config: FenceConfig = {
    name: 'matrix',
    latitude: latitude,
    longitude: longitude,
    radius: radius,
    fenceId: -1,
    enabled: false,
    updatedAt: 0
  };
  return config;
}

export default function geofenceConfigCartesianMatrixTest() {
  describe('GeofenceConfigCartesianMatrixTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'GeofenceConfigCartesianMatrixTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'GeofenceConfigCartesianMatrixTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_CFGCART_0100
     * @tc.name      testCartesianValidity0001
     * @tc.desc      Verify validateConfig over the full latitude, longitude and radius cartesian matrix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCartesianValidity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCartesianValidity0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < CONFIG_CASES.length; i++) {
        const row: ConfigCase = CONFIG_CASES[i];
        const config: FenceConfig = {
          name: 'matrix', latitude: row.latitude, longitude: row.longitude,
          radius: row.radius, fenceId: -1, enabled: false, updatedAt: 0
        };
        expect(GeofenceFeature.validateConfig(config)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(CONFIG_CASES.length);
      expect(CONFIG_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'config rows checked: ' + checked);
      expect(CONFIG_CASES.length).assertEqual(294);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_CFGCART_0200
     * @tc.name      testLatitudeBoundary0002
     * @tc.desc      Verify the latitude boundary is inclusive at both ends of the supported range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLatitudeBoundary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLatitudeBoundary0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(GeofenceFeature.validateConfig(makeConfig(-90, 0, 200))).assertTrue();
      expect(GeofenceFeature.validateConfig(makeConfig(90, 0, 200))).assertTrue();
      expect(GeofenceFeature.validateConfig(makeConfig(-90.0001, 0, 200))).assertFalse();
      expect(GeofenceFeature.validateConfig(makeConfig(90.0001, 0, 200))).assertFalse();
      expect(GeofenceFeature.validateConfig(makeConfig(NaN, 0, 200))).assertFalse();
      expect(GeofenceFeature.validateConfig(makeConfig(Infinity, 0, 200))).assertFalse();
      expect(GeofenceFeature.validateConfig(makeConfig(-Infinity, 0, 200))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_CFGCART_0300
     * @tc.name      testLongitudeBoundary0003
     * @tc.desc      Verify the longitude boundary is inclusive at both ends of the supported range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLongitudeBoundary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLongitudeBoundary0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(GeofenceFeature.validateConfig(makeConfig(0, -180, 200))).assertTrue();
      expect(GeofenceFeature.validateConfig(makeConfig(0, 180, 200))).assertTrue();
      expect(GeofenceFeature.validateConfig(makeConfig(0, -180.0001, 200))).assertFalse();
      expect(GeofenceFeature.validateConfig(makeConfig(0, 180.0001, 200))).assertFalse();
      expect(GeofenceFeature.validateConfig(makeConfig(0, NaN, 200))).assertFalse();
      expect(GeofenceFeature.validateConfig(makeConfig(0, Infinity, 200))).assertFalse();
      expect(GeofenceFeature.validateConfig(makeConfig(0, -Infinity, 200))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_CFGCART_0400
     * @tc.name      testRadiusBoundary0004
     * @tc.desc      Verify the radius boundary is inclusive and rejects values outside the range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRadiusBoundary0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRadiusBoundary0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(GeofenceFeature.validateConfig(makeConfig(0, 0, MIN_RADIUS))).assertTrue();
      expect(GeofenceFeature.validateConfig(makeConfig(0, 0, MAX_RADIUS))).assertTrue();
      expect(GeofenceFeature.validateConfig(makeConfig(0, 0, MIN_RADIUS - 1))).assertFalse();
      expect(GeofenceFeature.validateConfig(makeConfig(0, 0, MAX_RADIUS + 1))).assertFalse();
      expect(GeofenceFeature.validateConfig(makeConfig(0, 0, 0))).assertFalse();
      expect(GeofenceFeature.validateConfig(makeConfig(0, 0, -1))).assertFalse();
      expect(GeofenceFeature.validateConfig(makeConfig(0, 0, NaN))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_CFGCART_0500
     * @tc.name      testMultipleInvalid0005
     * @tc.desc      Verify configurations with more than one invalid field are still rejected.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMultipleInvalid0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMultipleInvalid0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(GeofenceFeature.validateConfig(makeConfig(91, 181, 200))).assertFalse();
      expect(GeofenceFeature.validateConfig(makeConfig(91, 0, 49))).assertFalse();
      expect(GeofenceFeature.validateConfig(makeConfig(0, 181, 49))).assertFalse();
      expect(GeofenceFeature.validateConfig(makeConfig(91, 181, 5001))).assertFalse();
      expect(GeofenceFeature.validateConfig(makeConfig(-91, -181, 0))).assertFalse();
      expect(GeofenceFeature.validateConfig(makeConfig(NaN, NaN, NaN))).assertFalse();
      expect(GeofenceFeature.validateConfig(makeConfig(0, 0, 200))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_CFGCART_0600
     * @tc.name      testConfigFieldIndependence0006
     * @tc.desc      Verify every valid field combination only depends on the three range checks.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testConfigFieldIndependence0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testConfigFieldIndependence0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const latitudes: number[] = [-90, 0, 90];
      const longitudes: number[] = [-180, 0, 180];
      const radii: number[] = [50, 200, 5000];
      let validCount: number = 0;
      for (let i = 0; i < latitudes.length; i++) {
        for (let j = 0; j < longitudes.length; j++) {
          for (let k = 0; k < radii.length; k++) {
            expect(GeofenceFeature.validateConfig(makeConfig(latitudes[i], longitudes[j], radii[k]))).assertTrue();
            validCount = validCount + 1;
          }
        }
      }
      expect(validCount).assertEqual(27);
      expect(latitudes.length * longitudes.length * radii.length).assertEqual(27);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
