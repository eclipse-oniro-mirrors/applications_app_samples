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
import {
  createDefaultConfig,
  createEmptySummary,
  DEFAULT_RADIUS,
  FenceTransitionAction,
  FENCE_CAPABILITY_UNSUPPORTED,
  INVALID_FENCE_ID,
  MAX_RADIUS,
  MIN_RADIUS,
  NO_ERROR,
  OPEN_END
} from 'library';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_Types]';

export default function typesLogicTest() {
  describe('GeofenceTypesLogicTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TYPES_0100
     * @tc.name      testCreateDefaultConfig0001
     * @tc.desc      Verify the default fence configuration provides an empty name,
     *               zero coordinates, the default radius, the invalid fence id and
     *               a disabled state with a zero update time.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCreateDefaultConfig0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCreateDefaultConfig0001';
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', TAG + ' start');
      const config = createDefaultConfig();
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', TAG + ' name length ' + config.name.length);
      expect(config.name).assertEqual('');
      expect(config.latitude).assertEqual(0);
      expect(config.longitude).assertEqual(0);
      expect(config.radius).assertEqual(DEFAULT_RADIUS);
      expect(config.fenceId).assertEqual(INVALID_FENCE_ID);
      expect(config.enabled).assertFalse();
      expect(config.updatedAt).assertEqual(0);
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TYPES_0200
     * @tc.name      testCreateEmptySummary0001
     * @tc.desc      Verify the empty day summary provides a zero check-in count and
     *               a zero total duration before any record is counted.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCreateEmptySummary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCreateEmptySummary0001';
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', TAG + ' start');
      const summary = createEmptySummary();
      expect(summary.count).assertEqual(0);
      expect(summary.durationMs).assertEqual(0);
      expect(summary.count + summary.durationMs).assertEqual(0);
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TYPES_0300
     * @tc.name      testGeofenceConstants0001
     * @tc.desc      Verify the geofence domain constants keep their documented values
     *               and the radius bounds stay ordered around the default radius.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGeofenceConstants0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testGeofenceConstants0001';
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', TAG + ' start');
      expect(OPEN_END).assertEqual(-1);
      expect(INVALID_FENCE_ID).assertEqual(-1);
      expect(NO_ERROR).assertEqual(0);
      expect(FENCE_CAPABILITY_UNSUPPORTED).assertEqual(801);
      expect(MIN_RADIUS).assertEqual(50);
      expect(MAX_RADIUS).assertEqual(5000);
      expect(DEFAULT_RADIUS).assertEqual(200);
      expect(MIN_RADIUS < DEFAULT_RADIUS && DEFAULT_RADIUS < MAX_RADIUS).assertTrue();
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TYPES_0400
     * @tc.name      testTransitionActionEnum0001
     * @tc.desc      Verify the fence transition action enum keeps the documented
     *               numeric values and all three members stay mutually distinct.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTransitionActionEnum0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTransitionActionEnum0001';
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', TAG + ' start');
      expect(FenceTransitionAction.NONE).assertEqual(0);
      expect(FenceTransitionAction.ENTER).assertEqual(1);
      expect(FenceTransitionAction.EXIT).assertEqual(2);
      const distinct: boolean = Number(FenceTransitionAction.NONE) !== Number(FenceTransitionAction.ENTER) &&
        Number(FenceTransitionAction.ENTER) !== Number(FenceTransitionAction.EXIT) &&
        Number(FenceTransitionAction.NONE) !== Number(FenceTransitionAction.EXIT);
      expect(distinct).assertTrue();
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', TAG + ' end');
    });
  });
}
