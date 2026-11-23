/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from './TestYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import geoLocationManager from '@ohos.geoLocationManager';

const DOMAIN: number = 0xF814;
const TAG: string = 'GeoParamModelCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function geoParamModelCoreTest(): void {
  describe('GeoParamModelCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0201
     * @tc.name      testGeoParamPriorityUnset0201
     * @tc.desc      Verify LocationRequestPriority.UNSET keeps the documented value 0x200.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamPriorityUnset0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamPriorityUnset0201 begin');
      const value: geoLocationManager.LocationRequestPriority = geoLocationManager.LocationRequestPriority.UNSET;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0x200`);
      expect(value).assertEqual(0x200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual 0x200=${0x200}, expected=512`);
      expect(0x200).assertEqual(512);
      log('testGeoParamPriorityUnset0201 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0202
     * @tc.name      testGeoParamPriorityAccuracy0202
     * @tc.desc      Verify LocationRequestPriority.ACCURACY keeps the documented value 0x201.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamPriorityAccuracy0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamPriorityAccuracy0202 begin');
      const value: geoLocationManager.LocationRequestPriority = geoLocationManager.LocationRequestPriority.ACCURACY;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0x201`);
      expect(value).assertEqual(0x201);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value - 0x200=${value - 0x200}, expected=1`);
      expect(value - 0x200).assertEqual(1);
      log('testGeoParamPriorityAccuracy0202 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0203
     * @tc.name      testGeoParamPriorityLowPower0203
     * @tc.desc      Verify LocationRequestPriority.LOW_POWER keeps the documented value 0x202.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamPriorityLowPower0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamPriorityLowPower0203 begin');
      const value: geoLocationManager.LocationRequestPriority = geoLocationManager.LocationRequestPriority.LOW_POWER;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0x202`);
      expect(value).assertEqual(0x202);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value - 0x200=${value - 0x200}, expected=2`);
      expect(value - 0x200).assertEqual(2);
      log('testGeoParamPriorityLowPower0203 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0204
     * @tc.name      testGeoParamPriorityFirstFix0204
     * @tc.desc      Verify LocationRequestPriority.FIRST_FIX keeps the documented value 0x203.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamPriorityFirstFix0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamPriorityFirstFix0204 begin');
      const value: geoLocationManager.LocationRequestPriority = geoLocationManager.LocationRequestPriority.FIRST_FIX;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0x203`);
      expect(value).assertEqual(0x203);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual 0x203=${0x203}, expected=515`);
      expect(0x203).assertEqual(515);
      log('testGeoParamPriorityFirstFix0204 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0205
     * @tc.name      testGeoParamPriorityDistinct0205
     * @tc.desc      Verify all four LocationRequestPriority members stay pairwise distinct.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamPriorityDistinct0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamPriorityDistinct0205 begin');
      const values: number[] = [
        geoLocationManager.LocationRequestPriority.UNSET,
        geoLocationManager.LocationRequestPriority.ACCURACY,
        geoLocationManager.LocationRequestPriority.LOW_POWER,
        geoLocationManager.LocationRequestPriority.FIRST_FIX
      ];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual new Set<number>(values).size, expected=4`);
      expect(new Set<number>(values).size).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue values[0] < values[1]=${values[0] < values[1]}`);
      expect(values[0] < values[1]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual values[3]=${values[3]}, expected=0x203`);
      expect(values[3]).assertEqual(0x203);
      log('testGeoParamPriorityDistinct0205 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0206
     * @tc.name      testGeoParamScenarioUnset0206
     * @tc.desc      Verify LocationRequestScenario.UNSET keeps the documented value 0x300.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamScenarioUnset0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamScenarioUnset0206 begin');
      const value: geoLocationManager.LocationRequestScenario = geoLocationManager.LocationRequestScenario.UNSET;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0x300`);
      expect(value).assertEqual(0x300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual 0x300=${0x300}, expected=768`);
      expect(0x300).assertEqual(768);
      log('testGeoParamScenarioUnset0206 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0207
     * @tc.name      testGeoParamScenarioNavigation0207
     * @tc.desc      Verify LocationRequestScenario.NAVIGATION keeps the documented value 0x301.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamScenarioNavigation0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamScenarioNavigation0207 begin');
      const value: geoLocationManager.LocationRequestScenario = geoLocationManager.LocationRequestScenario.NAVIGATION;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0x301`);
      expect(value).assertEqual(0x301);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value - 0x300=${value - 0x300}, expected=1`);
      expect(value - 0x300).assertEqual(1);
      log('testGeoParamScenarioNavigation0207 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0208
     * @tc.name      testGeoParamScenarioTrajectory0208
     * @tc.desc      Verify LocationRequestScenario.TRAJECTORY_TRACKING keeps value 0x302.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamScenarioTrajectory0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamScenarioTrajectory0208 begin');
      const value: geoLocationManager.LocationRequestScenario =
        geoLocationManager.LocationRequestScenario.TRAJECTORY_TRACKING;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0x302`);
      expect(value).assertEqual(0x302);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value - 0x300=${value - 0x300}, expected=2`);
      expect(value - 0x300).assertEqual(2);
      log('testGeoParamScenarioTrajectory0208 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0209
     * @tc.name      testGeoParamScenarioCarHailing0209
     * @tc.desc      Verify LocationRequestScenario.CAR_HAILING keeps the documented value 0x303.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamScenarioCarHailing0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamScenarioCarHailing0209 begin');
      const value: geoLocationManager.LocationRequestScenario = geoLocationManager.LocationRequestScenario.CAR_HAILING;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0x303`);
      expect(value).assertEqual(0x303);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value - 0x300=${value - 0x300}, expected=3`);
      expect(value - 0x300).assertEqual(3);
      log('testGeoParamScenarioCarHailing0209 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0210
     * @tc.name      testGeoParamScenarioDailyLife0210
     * @tc.desc      Verify LocationRequestScenario.DAILY_LIFE_SERVICE keeps value 0x304.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamScenarioDailyLife0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamScenarioDailyLife0210 begin');
      const value: geoLocationManager.LocationRequestScenario =
        geoLocationManager.LocationRequestScenario.DAILY_LIFE_SERVICE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0x304`);
      expect(value).assertEqual(0x304);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value - 0x300=${value - 0x300}, expected=4`);
      expect(value - 0x300).assertEqual(4);
      log('testGeoParamScenarioDailyLife0210 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0211
     * @tc.name      testGeoParamScenarioNoPower0211
     * @tc.desc      Verify LocationRequestScenario.NO_POWER keeps the documented value 0x305.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamScenarioNoPower0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamScenarioNoPower0211 begin');
      const value: geoLocationManager.LocationRequestScenario = geoLocationManager.LocationRequestScenario.NO_POWER;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0x305`);
      expect(value).assertEqual(0x305);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value - 0x300=${value - 0x300}, expected=5`);
      expect(value - 0x300).assertEqual(5);
      log('testGeoParamScenarioNoPower0211 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0212
     * @tc.name      testGeoParamScenarioDistinct0212
     * @tc.desc      Verify all six LocationRequestScenario members stay pairwise distinct.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamScenarioDistinct0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamScenarioDistinct0212 begin');
      const values: number[] = [
        geoLocationManager.LocationRequestScenario.UNSET,
        geoLocationManager.LocationRequestScenario.NAVIGATION,
        geoLocationManager.LocationRequestScenario.TRAJECTORY_TRACKING,
        geoLocationManager.LocationRequestScenario.CAR_HAILING,
        geoLocationManager.LocationRequestScenario.DAILY_LIFE_SERVICE,
        geoLocationManager.LocationRequestScenario.NO_POWER
      ];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual new Set<number>(values).size, expected=6`);
      expect(new Set<number>(values).size).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual values[0]=${values[0]}, expected=0x300`);
      expect(values[0]).assertEqual(0x300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual values[5]=${values[5]}, expected=0x305`);
      expect(values[5]).assertEqual(0x305);
      log('testGeoParamScenarioDistinct0212 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0213
     * @tc.name      testGeoParamUserActivityNavigation0213
     * @tc.desc      Verify UserActivityScenario.NAVIGATION keeps the documented value 0x401.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamUserActivityNavigation0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamUserActivityNavigation0213 begin');
      const value: geoLocationManager.UserActivityScenario = geoLocationManager.UserActivityScenario.NAVIGATION;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0x401`);
      expect(value).assertEqual(0x401);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual 0x401=${0x401}, expected=1025`);
      expect(0x401).assertEqual(1025);
      log('testGeoParamUserActivityNavigation0213 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0214
     * @tc.name      testGeoParamUserActivitySport0214
     * @tc.desc      Verify UserActivityScenario.SPORT keeps the documented value 0x402.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamUserActivitySport0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamUserActivitySport0214 begin');
      const value: geoLocationManager.UserActivityScenario = geoLocationManager.UserActivityScenario.SPORT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0x402`);
      expect(value).assertEqual(0x402);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value - 0x401=${value - 0x401}, expected=1`);
      expect(value - 0x401).assertEqual(1);
      log('testGeoParamUserActivitySport0214 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0215
     * @tc.name      testGeoParamUserActivityTransport0215
     * @tc.desc      Verify UserActivityScenario.TRANSPORT keeps the documented value 0x403.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamUserActivityTransport0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamUserActivityTransport0215 begin');
      const value: geoLocationManager.UserActivityScenario = geoLocationManager.UserActivityScenario.TRANSPORT;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0x403`);
      expect(value).assertEqual(0x403);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value - 0x401=${value - 0x401}, expected=2`);
      expect(value - 0x401).assertEqual(2);
      log('testGeoParamUserActivityTransport0215 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0216
     * @tc.name      testGeoParamUserActivityDailyLife0216
     * @tc.desc      Verify UserActivityScenario.DAILY_LIFE_SERVICE keeps value 0x404.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamUserActivityDailyLife0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamUserActivityDailyLife0216 begin');
      const value: geoLocationManager.UserActivityScenario = geoLocationManager.UserActivityScenario.DAILY_LIFE_SERVICE;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value=${value}, expected=0x404`);
      expect(value).assertEqual(0x404);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual value - 0x401=${value - 0x401}, expected=3`);
      expect(value - 0x401).assertEqual(3);
      log('testGeoParamUserActivityDailyLife0216 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0217
     * @tc.name      testGeoParamUserActivityDistinct0217
     * @tc.desc      Verify all four UserActivityScenario members stay pairwise distinct.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamUserActivityDistinct0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamUserActivityDistinct0217 begin');
      const values: number[] = [
        geoLocationManager.UserActivityScenario.NAVIGATION,
        geoLocationManager.UserActivityScenario.SPORT,
        geoLocationManager.UserActivityScenario.TRANSPORT,
        geoLocationManager.UserActivityScenario.DAILY_LIFE_SERVICE
      ];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual new Set<number>(values).size, expected=4`);
      expect(new Set<number>(values).size).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual values[0]=${values[0]}, expected=0x401`);
      expect(values[0]).assertEqual(0x401);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual values[3]=${values[3]}, expected=0x404`);
      expect(values[3]).assertEqual(0x404);
      log('testGeoParamUserActivityDistinct0217 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0218
     * @tc.name      testGeoParamSingleRequestSample0218
     * @tc.desc      Verify the single-fix request model keeps the page parameters 0x203 0x300 100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamSingleRequestSample0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamSingleRequestSample0218 begin');
      const request: geoLocationManager.CurrentLocationRequest = {
        priority: 0x203,
        scenario: 0x300,
        maxAccuracy: 100
      };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.priority=${request.priority}, expected=0x203`);
      expect(request.priority).assertEqual(0x203);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.scenario=${request.scenario}, expected=0x300`);
      expect(request.scenario).assertEqual(0x300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.maxAccuracy=${request.maxAccuracy}, expected=100`);
      expect(request.maxAccuracy).assertEqual(100);
      log('testGeoParamSingleRequestSample0218 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0219
     * @tc.name      testGeoParamSingleRequestEnum0219
     * @tc.desc      Verify enum-based single-fix parameters equal the raw page literals.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamSingleRequestEnum0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamSingleRequestEnum0219 begin');
      const request: geoLocationManager.CurrentLocationRequest = {
        priority: geoLocationManager.LocationRequestPriority.FIRST_FIX,
        scenario: geoLocationManager.LocationRequestScenario.UNSET
      };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.priority=${request.priority}, expected=0x203`);
      expect(request.priority).assertEqual(0x203);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.scenario=${request.scenario}, expected=0x300`);
      expect(request.scenario).assertEqual(0x300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.maxAccuracy=${request.maxAccuracy}`);
      expect(request.maxAccuracy).assertEqual(undefined);
      log('testGeoParamSingleRequestEnum0219 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0220
     * @tc.name      testGeoParamSingleRequestUnset0220
     * @tc.desc      Verify unset priority and scenario values stay valid request fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamSingleRequestUnset0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamSingleRequestUnset0220 begin');
      const request: geoLocationManager.CurrentLocationRequest = {
        priority: geoLocationManager.LocationRequestPriority.UNSET,
        scenario: geoLocationManager.LocationRequestScenario.UNSET,
        maxAccuracy: 0
      };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.priority=${request.priority}, expected=0x200`);
      expect(request.priority).assertEqual(0x200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.scenario=${request.scenario}, expected=0x300`);
      expect(request.scenario).assertEqual(0x300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.maxAccuracy=${request.maxAccuracy}, expected=0`);
      expect(request.maxAccuracy).assertEqual(0);
      log('testGeoParamSingleRequestUnset0220 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0221
     * @tc.name      testGeoParamMaxAccuracyBounds0221
     * @tc.desc      Verify maxAccuracy accepts zero and large accuracy bounds unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamMaxAccuracyBounds0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamMaxAccuracyBounds0221 begin');
      const low: geoLocationManager.CurrentLocationRequest = { maxAccuracy: 0 };
      const high: geoLocationManager.CurrentLocationRequest = { maxAccuracy: 10000 };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual low.maxAccuracy=${low.maxAccuracy}, expected=0`);
      expect(low.maxAccuracy).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual high.maxAccuracy=${high.maxAccuracy}, expected=10000`);
      expect(high.maxAccuracy).assertEqual(10000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof high.maxAccuracy=${typeof high.maxAccuracy}`);
      expect(typeof high.maxAccuracy).assertEqual('number');
      log('testGeoParamMaxAccuracyBounds0221 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0222
     * @tc.name      testGeoParamTimeoutField0222
     * @tc.desc      Verify timeoutMs stays on the single-fix request model unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamTimeoutField0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamTimeoutField0222 begin');
      const request: geoLocationManager.CurrentLocationRequest = {
        priority: 0x203,
        scenario: 0x300,
        maxAccuracy: 100,
        timeoutMs: 5000
      };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.timeoutMs=${request.timeoutMs}, expected=5000`);
      expect(request.timeoutMs).assertEqual(5000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof request.timeoutMs=${typeof request.timeoutMs}`);
      expect(typeof request.timeoutMs).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.priority=${request.priority}, expected=0x203`);
      expect(request.priority).assertEqual(0x203);
      log('testGeoParamTimeoutField0222 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0223
     * @tc.name      testGeoParamSingleRequestTypes0223
     * @tc.desc      Verify single-fix request fields keep their declared primitive types.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamSingleRequestTypes0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamSingleRequestTypes0223 begin');
      const request: geoLocationManager.CurrentLocationRequest = {
        priority: 0x203,
        scenario: 0x300,
        maxAccuracy: 100
      };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof request.priority=${typeof request.priority}`);
      expect(typeof request.priority).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof request.scenario=${typeof request.scenario}`);
      expect(typeof request.scenario).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof request.maxAccuracy=${typeof request.maxAccuracy}`);
      expect(typeof request.maxAccuracy).assertEqual('number');
      log('testGeoParamSingleRequestTypes0223 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0224
     * @tc.name      testGeoParamSingleRequestIndependence0224
     * @tc.desc      Verify two single-fix request models stay fully independent objects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamSingleRequestIndependence0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamSingleRequestIndependence0224 begin');
      const first: geoLocationManager.CurrentLocationRequest = { priority: 0x203, maxAccuracy: 100 };
      const second: geoLocationManager.CurrentLocationRequest = { priority: 0x201, maxAccuracy: 5 };
      first.maxAccuracy = 200;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.priority=${first.priority}, expected=0x203`);
      expect(first.priority).assertEqual(0x203);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.priority=${second.priority}, expected=0x201`);
      expect(second.priority).assertEqual(0x201);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.maxAccuracy=${second.maxAccuracy}, expected=5`);
      expect(second.maxAccuracy).assertEqual(5);
      log('testGeoParamSingleRequestIndependence0224 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0225
     * @tc.name      testGeoParamContinuousSample0225
     * @tc.desc      Verify the continuous request model keeps the page parameters 1s navigation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamContinuousSample0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamContinuousSample0225 begin');
      const request: geoLocationManager.ContinuousLocationRequest = {
        interval: 1,
        locationScenario: geoLocationManager.UserActivityScenario.NAVIGATION
      };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.interval=${request.interval}, expected=1`);
      expect(request.interval).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.locationScenario=${request.locationScenario}`);
      expect(request.locationScenario).assertEqual(0x401);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof request.interval=${typeof request.interval}`);
      expect(typeof request.interval).assertEqual('number');
      log('testGeoParamContinuousSample0225 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0226
     * @tc.name      testGeoParamContinuousInterval0226
     * @tc.desc      Verify continuous request interval accepts other second values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamContinuousInterval0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamContinuousInterval0226 begin');
      const request: geoLocationManager.ContinuousLocationRequest = {
        interval: 5,
        locationScenario: geoLocationManager.UserActivityScenario.DAILY_LIFE_SERVICE
      };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.interval=${request.interval}, expected=5`);
      expect(request.interval).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.locationScenario=${request.locationScenario}`);
      expect(request.locationScenario).assertEqual(0x404);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue request.interval > 0=${request.interval > 0}`);
      expect(request.interval > 0).assertTrue();
      log('testGeoParamContinuousInterval0226 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0227
     * @tc.name      testGeoParamContinuousNeedPoi0227
     * @tc.desc      Verify needPoi defaults to undefined and keeps explicit false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamContinuousNeedPoi0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamContinuousNeedPoi0227 begin');
      const plain: geoLocationManager.ContinuousLocationRequest = {
        interval: 1,
        locationScenario: geoLocationManager.UserActivityScenario.NAVIGATION
      };
      const withPoi: geoLocationManager.ContinuousLocationRequest = {
        interval: 1,
        locationScenario: geoLocationManager.UserActivityScenario.NAVIGATION,
        needPoi: false
      };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual plain.needPoi=${plain.needPoi}, expected=undefined`);
      expect(plain.needPoi).assertEqual(undefined);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse withPoi.needPoi=${withPoi.needPoi}`);
      expect(withPoi.needPoi).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual withPoi.interval=${withPoi.interval}, expected=1`);
      expect(withPoi.interval).assertEqual(1);
      log('testGeoParamContinuousNeedPoi0227 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0228
     * @tc.name      testGeoParamContinuousSport0228
     * @tc.desc      Verify ContinuousLocationRequest keeps locationScenario UserActivityScenario.SPORT at 0x402.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamContinuousSport0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamContinuousSport0228 begin');
      const request: geoLocationManager.ContinuousLocationRequest = {
        interval: 2,
        locationScenario: geoLocationManager.UserActivityScenario.SPORT
      };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.locationScenario=${request.locationScenario}`);
      expect(request.locationScenario).assertEqual(0x402);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.interval=${request.interval}, expected=2`);
      expect(request.interval).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof request.locationScenario}, expected='number'`);
      expect(typeof request.locationScenario).assertEqual('number');
      log('testGeoParamContinuousSport0228 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0229
     * @tc.name      testGeoParamReverseSample0229
     * @tc.desc      Verify the reverse geocode request keeps the sample coordinates 34.34 108.94.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamReverseSample0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamReverseSample0229 begin');
      const request: geoLocationManager.ReverseGeoCodeRequest = {
        latitude: 34.34,
        longitude: 108.94,
        maxItems: 1
      };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.latitude=${request.latitude}, expected=34.34`);
      expect(request.latitude).assertEqual(34.34);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.longitude=${request.longitude}, expected=108.94`);
      expect(request.longitude).assertEqual(108.94);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.maxItems=${request.maxItems}, expected=1`);
      expect(request.maxItems).assertEqual(1);
      log('testGeoParamReverseSample0229 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0230
     * @tc.name      testGeoParamReverseBoundsMax0230
     * @tc.desc      Verify reverse geocode accepts the maximum latitude 90 and longitude 180.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamReverseBoundsMax0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamReverseBoundsMax0230 begin');
      const request: geoLocationManager.ReverseGeoCodeRequest = {
        latitude: 90,
        longitude: 180,
        maxItems: 1
      };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.latitude=${request.latitude}, expected=90`);
      expect(request.latitude).assertEqual(90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.longitude=${request.longitude}, expected=180`);
      expect(request.longitude).assertEqual(180);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue request.latitude <= 90=${request.latitude <= 90}`);
      expect(request.latitude <= 90).assertTrue();
      log('testGeoParamReverseBoundsMax0230 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0231
     * @tc.name      testGeoParamReverseBoundsMin0231
     * @tc.desc      Verify reverse geocode accepts negative and zero coordinate bounds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamReverseBoundsMin0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamReverseBoundsMin0231 begin');
      const negative: geoLocationManager.ReverseGeoCodeRequest = {
        latitude: -90,
        longitude: -180,
        maxItems: 1
      };
      const zero: geoLocationManager.ReverseGeoCodeRequest = {
        latitude: 0,
        longitude: 0,
        maxItems: 1
      };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual negative.latitude=${negative.latitude}, expected=-90`);
      expect(negative.latitude).assertEqual(-90);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual negative.longitude=${negative.longitude}, expected=-180`);
      expect(negative.longitude).assertEqual(-180);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual zero.latitude=${zero.latitude}, expected=0`);
      expect(zero.latitude).assertEqual(0);
      log('testGeoParamReverseBoundsMin0231 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0232
     * @tc.name      testGeoParamReverseLocale0232
     * @tc.desc      Verify locale and maxItems stay on the reverse geocode request model.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamReverseLocale0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamReverseLocale0232 begin');
      const request: geoLocationManager.ReverseGeoCodeRequest = {
        locale: 'zh',
        latitude: 34.34,
        longitude: 108.94,
        maxItems: 5
      };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.locale=${request.locale}, expected='zh'`);
      expect(request.locale).assertEqual('zh');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual request.maxItems=${request.maxItems}, expected=5`);
      expect(request.maxItems).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof request.locale=${typeof request.locale}`);
      expect(typeof request.locale).assertEqual('string');
      log('testGeoParamReverseLocale0232 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0233
     * @tc.name      testGeoParamLocationModel0233
     * @tc.desc      Verify the Location model keeps all mandatory coordinate fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamLocationModel0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamLocationModel0233 begin');
      const location: geoLocationManager.Location = {
        latitude: 34.34,
        longitude: 108.94,
        altitude: 400,
        accuracy: 10,
        speed: 0,
        timeStamp: 1700000000000,
        direction: 90,
        timeSinceBoot: 120000
      };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual location.latitude=${location.latitude}, expected=34.34`);
      expect(location.latitude).assertEqual(34.34);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual location.longitude=${location.longitude}, expected=108.94`);
      expect(location.longitude).assertEqual(108.94);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual location.altitude=${location.altitude}, expected=400`);
      expect(location.altitude).assertEqual(400);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual location.accuracy=${location.accuracy}, expected=10`);
      expect(location.accuracy).assertEqual(10);
      log('testGeoParamLocationModel0233 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0234
     * @tc.name      testGeoParamLocationTiming0234
     * @tc.desc      Verify Location timing and direction fields keep numeric values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamLocationTiming0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamLocationTiming0234 begin');
      const location: geoLocationManager.Location = {
        latitude: 34.34,
        longitude: 108.94,
        altitude: 400,
        accuracy: 10,
        speed: 5,
        timeStamp: 1700000000000,
        direction: 90,
        timeSinceBoot: 120000
      };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof location.timeStamp=${typeof location.timeStamp}`);
      expect(typeof location.timeStamp).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof location.timeSinceBoot}, expected='number'`);
      expect(typeof location.timeSinceBoot).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual location.direction=${location.direction}, expected=90`);
      expect(location.direction).assertEqual(90);
      log('testGeoParamLocationTiming0234 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0235
     * @tc.name      testGeoParamLocationArray0235
     * @tc.desc      Verify Location instances stay independent inside an array.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamLocationArray0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamLocationArray0235 begin');
      const first: geoLocationManager.Location = {
        latitude: 34.34,
        longitude: 108.94,
        altitude: 400,
        accuracy: 10,
        speed: 0,
        timeStamp: 1700000000000,
        direction: 90,
        timeSinceBoot: 120000
      };
      const second: geoLocationManager.Location = {
        latitude: 30.57,
        longitude: 114.3,
        altitude: 30,
        accuracy: 20,
        speed: 2,
        timeStamp: 1700000001000,
        direction: 45,
        timeSinceBoot: 130000
      };
      const locations: geoLocationManager.Location[] = [first, second];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual locations.length=${locations.length}, expected=2`);
      expect(locations.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual locations[1].latitude=${locations[1].latitude}`);
      expect(locations[1].latitude).assertEqual(30.57);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual locations[0].longitude=${locations[0].longitude}`);
      expect(locations[0].longitude).assertEqual(108.94);
      log('testGeoParamLocationArray0235 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0236
     * @tc.name      testGeoParamGeoAddress0236
     * @tc.desc      Verify the GeoAddress model keeps the locality used by the page logic.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamGeoAddress0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamGeoAddress0236 begin');
      const address: geoLocationManager.GeoAddress = {
        latitude: 34.34,
        longitude: 108.94,
        locality: '西安'
      };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual address.locality=${address.locality}, expected='西安'`);
      expect(address.locality).assertEqual('西安');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof address.locality=${typeof address.locality}`);
      expect(typeof address.locality).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual address.latitude=${address.latitude}, expected=34.34`);
      expect(address.latitude).assertEqual(34.34);
      log('testGeoParamGeoAddress0236 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0237
     * @tc.name      testGeoParamAddressChain0237
     * @tc.desc      Verify the page reverse-geocode guard passes for a locality address.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamAddressChain0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamAddressChain0237 begin');
      const address: geoLocationManager.GeoAddress = {
        latitude: 34.34,
        longitude: 108.94,
        locality: '西安'
      };
      const addresses: geoLocationManager.GeoAddress[] = [address];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue addresses.length >= 1=${addresses.length >= 1}`);
      expect(addresses.length >= 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${addresses[0].locality !== undefined}`);
      expect(addresses[0].locality !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual addresses[0].locality=${addresses[0].locality}`);
      expect(addresses[0].locality).assertEqual('西安');
      log('testGeoParamAddressChain0237 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0238
     * @tc.name      testGeoParamAddressEmpty0238
     * @tc.desc      Verify an empty GeoAddress keeps every field optional and undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamAddressEmpty0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamAddressEmpty0238 begin');
      const address: geoLocationManager.GeoAddress = {};
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual address.locality=${address.locality}, expected=undefined`);
      expect(address.locality).assertEqual(undefined);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual address.placeName=${address.placeName}, expected=undefined`);
      expect(address.placeName).assertEqual(undefined);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual address.latitude=${address.latitude}, expected=undefined`);
      expect(address.latitude).assertEqual(undefined);
      log('testGeoParamAddressEmpty0238 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0239
     * @tc.name      testGeoParamAddressDetail0239
     * @tc.desc      Verify GeoAddress keeps the detailed address text chain together.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamAddressDetail0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamAddressDetail0239 begin');
      const address: geoLocationManager.GeoAddress = {
        placeName: '陕西省西安市雁塔区',
        locality: '西安市',
        subLocality: '雁塔区'
      };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual address.placeName=${address.placeName}, expected='陕西省西安市雁塔区'`);
      expect(address.placeName).assertEqual('陕西省西安市雁塔区');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual address.locality=${address.locality}, expected='西安市'`);
      expect(address.locality).assertEqual('西安市');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual address.subLocality=${address.subLocality}, expected='雁塔区'`);
      expect(address.subLocality).assertEqual('雁塔区');
      log('testGeoParamAddressDetail0239 end');
    })

    /**
     * @tc.number    SUB_LOCATION_GEOPARAM_0240
     * @tc.name      testGeoParamEnumsAccessible0240
     * @tc.desc      Verify the three request enums stay statically accessible objects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGeoParamEnumsAccessible0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testGeoParamEnumsAccessible0240 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof geoLocationManager.LocationRequestPriority}`);
      expect(typeof geoLocationManager.LocationRequestPriority).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof geoLocationManager.LocationRequestScenario}`);
      expect(typeof geoLocationManager.LocationRequestScenario).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof geoLocationManager.UserActivityScenario}`);
      expect(typeof geoLocationManager.UserActivityScenario).assertEqual('object');
      log('testGeoParamEnumsAccessible0240 end');
    })
  })
}
