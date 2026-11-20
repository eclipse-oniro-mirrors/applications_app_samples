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
import { GeofenceFeature, FenceConfig, MAX_RADIUS, MIN_RADIUS } from 'library';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_Validation]';

// Build a complete fence configuration for validation, only the location fields vary.
function makeConfig(latitude: number, longitude: number, radius: number): FenceConfig {
  const config: FenceConfig = {
    name: 'test',
    latitude: latitude,
    longitude: longitude,
    radius: radius,
    fenceId: -1,
    enabled: false,
    updatedAt: 0
  };
  return config;
}

export default function geofenceValidationLogicTest() {
  describe('GeofenceValidationLogicTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'GeofenceValidationLogicTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'GeofenceValidationLogicTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_VALIDATION_0100
     * @tc.name      testValidateConfigValid0001
     * @tc.desc      Verify validateConfig accepts a normal fence configuration and
     *               every boundary value of latitude, longitude and radius.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateConfigValid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateConfigValid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The boundary expectations rely on the documented radius constants.
      expect(MIN_RADIUS).assertEqual(50);
      expect(MAX_RADIUS).assertEqual(5000);
      const normalResult: boolean = GeofenceFeature.validateConfig(makeConfig(39.908722, 116.397499, 200));
      hilog.info(DOMAIN, TAG, '%{public}s', 'normal config valid: ' + normalResult);
      expect(normalResult).assertTrue();
      // Latitude bounds are inclusive on both ends.
      expect(GeofenceFeature.validateConfig(makeConfig(90, 116.397499, 200))).assertTrue();
      expect(GeofenceFeature.validateConfig(makeConfig(-90, 116.397499, 200))).assertTrue();
      // Longitude bounds are inclusive on both ends.
      expect(GeofenceFeature.validateConfig(makeConfig(39.908722, 180, 200))).assertTrue();
      expect(GeofenceFeature.validateConfig(makeConfig(39.908722, -180, 200))).assertTrue();
      // Radius bounds are inclusive on both ends.
      expect(GeofenceFeature.validateConfig(makeConfig(39.908722, 116.397499, MIN_RADIUS))).assertTrue();
      expect(GeofenceFeature.validateConfig(makeConfig(39.908722, 116.397499, MAX_RADIUS))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_VALIDATION_0200
     * @tc.name      testValidateConfigBadLatitude0001
     * @tc.desc      Verify validateConfig rejects latitudes outside the closed
     *               range from -90 to 90 including NaN input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateConfigBadLatitude0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateConfigBadLatitude0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Just above the upper latitude bound.
      expect(GeofenceFeature.validateConfig(makeConfig(90.1, 116.397499, 200))).assertFalse();
      // Just below the lower latitude bound.
      expect(GeofenceFeature.validateConfig(makeConfig(-90.1, 116.397499, 200))).assertFalse();
      // NaN fails every range comparison, so the configuration must be rejected.
      expect(GeofenceFeature.validateConfig(makeConfig(NaN, 116.397499, 200))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_VALIDATION_0300
     * @tc.name      testValidateConfigBadLongitudeRadius0001
     * @tc.desc      Verify validateConfig rejects longitudes outside the closed
     *               range from -180 to 180 and radii outside the supported
     *               radius range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateConfigBadLongitudeRadius0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidateConfigBadLongitudeRadius0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Just above the upper longitude bound.
      expect(GeofenceFeature.validateConfig(makeConfig(39.908722, 180.1, 200))).assertFalse();
      // Just below the lower longitude bound.
      expect(GeofenceFeature.validateConfig(makeConfig(39.908722, -180.1, 200))).assertFalse();
      // Just below the smallest supported radius.
      expect(GeofenceFeature.validateConfig(makeConfig(39.908722, 116.397499, 49.9))).assertFalse();
      // Just above the largest supported radius.
      expect(GeofenceFeature.validateConfig(makeConfig(39.908722, 116.397499, 5000.1))).assertFalse();
      // Zero and negative radii are never accepted.
      expect(GeofenceFeature.validateConfig(makeConfig(39.908722, 116.397499, 0))).assertFalse();
      expect(GeofenceFeature.validateConfig(makeConfig(39.908722, 116.397499, -1))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
