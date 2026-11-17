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
import { sensor } from '@kit.SensorServiceKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { assertNear, altitudeCallback } from '../Shared/SharedDriver';

export default function sensorAltitudeRepeatabilityTest(): void {
  describe('SensorAltitudeRepeatability', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorAltitudeRepeatabilityTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_REPEATABILITY_0100
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 46
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeRepeatabilityTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1062;
        const currentPressure: number = 734.5;
        const expectedAltitude: number = 3003.818108946;
        const promiseResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        const callbackResult: number = await altitudeCallback(seaPressure, currentPressure);
        assertNear(promiseResult, expectedAltitude, 0.75);
        assertNear(callbackResult, expectedAltitude, 0.75);
        assertNear(callbackResult, promiseResult, 0.02);
        const zeroAltitude: number = await sensor.getDeviceAltitude(seaPressure, seaPressure);
        assertNear(zeroAltitude, 0, 0.001);
        const scaledAltitude: number = await sensor.getDeviceAltitude(seaPressure * 2, currentPressure * 2);
        assertNear(scaledAltitude, expectedAltitude, 0.75);
        const lowerPressureAltitude: number = await sensor.getDeviceAltitude(seaPressure, currentPressure * 0.9);
        expect(lowerPressureAltitude).assertLarger(promiseResult);
        const assertionActual1 = Number.isFinite(promiseResult);
        expect(assertionActual1).assertTrue();
        const assertionActual2 = Number.isFinite(callbackResult);
        expect(assertionActual2).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorAltitudeRepeatabilityTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_REPEATABILITY_0200
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 47
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeRepeatabilityTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1099;
        const currentPressure: number = 813.625;
        const expectedAltitude: number = 2465.079557506;
        const promiseResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        const callbackResult: number = await altitudeCallback(seaPressure, currentPressure);
        assertNear(promiseResult, expectedAltitude, 0.75);
        assertNear(callbackResult, expectedAltitude, 0.75);
        assertNear(callbackResult, promiseResult, 0.02);
        const zeroAltitude: number = await sensor.getDeviceAltitude(seaPressure, seaPressure);
        assertNear(zeroAltitude, 0, 0.001);
        const scaledAltitude: number = await sensor.getDeviceAltitude(seaPressure * 2, currentPressure * 2);
        assertNear(scaledAltitude, expectedAltitude, 0.75);
        const lowerPressureAltitude: number = await sensor.getDeviceAltitude(seaPressure, currentPressure * 0.9);
        expect(lowerPressureAltitude).assertLarger(promiseResult);
        const assertionActual3 = Number.isFinite(promiseResult);
        expect(assertionActual3).assertTrue();
        const assertionActual4 = Number.isFinite(callbackResult);
        expect(assertionActual4).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorAltitudeRepeatabilityTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_REPEATABILITY_0300
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 48
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeRepeatabilityTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 916;
        const currentPressure: number = 892.75;
        const expectedAltitude: number = 216.3522389635;
        const promiseResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        const callbackResult: number = await altitudeCallback(seaPressure, currentPressure);
        assertNear(promiseResult, expectedAltitude, 0.75);
        assertNear(callbackResult, expectedAltitude, 0.75);
        assertNear(callbackResult, promiseResult, 0.02);
        const zeroAltitude: number = await sensor.getDeviceAltitude(seaPressure, seaPressure);
        assertNear(zeroAltitude, 0, 0.001);
        const scaledAltitude: number = await sensor.getDeviceAltitude(seaPressure * 2, currentPressure * 2);
        assertNear(scaledAltitude, expectedAltitude, 0.75);
        const lowerPressureAltitude: number = await sensor.getDeviceAltitude(seaPressure, currentPressure * 0.9);
        expect(lowerPressureAltitude).assertLarger(promiseResult);
        const assertionActual5 = Number.isFinite(promiseResult);
        expect(assertionActual5).assertTrue();
        const assertionActual6 = Number.isFinite(callbackResult);
        expect(assertionActual6).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorAltitudeRepeatabilityTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_REPEATABILITY_0400
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 49
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeRepeatabilityTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 953;
        const currentPressure: number = 971;
        const expectedAltitude: number = -158.1279148913;
        const promiseResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        const callbackResult: number = await altitudeCallback(seaPressure, currentPressure);
        assertNear(promiseResult, expectedAltitude, 0.75);
        assertNear(callbackResult, expectedAltitude, 0.75);
        assertNear(callbackResult, promiseResult, 0.02);
        const zeroAltitude: number = await sensor.getDeviceAltitude(seaPressure, seaPressure);
        assertNear(zeroAltitude, 0, 0.001);
        const scaledAltitude: number = await sensor.getDeviceAltitude(seaPressure * 2, currentPressure * 2);
        assertNear(scaledAltitude, expectedAltitude, 0.75);
        const lowerPressureAltitude: number = await sensor.getDeviceAltitude(seaPressure, currentPressure * 0.9);
        expect(lowerPressureAltitude).assertLarger(promiseResult);
        const assertionActual7 = Number.isFinite(promiseResult);
        expect(assertionActual7).assertTrue();
        const assertionActual8 = Number.isFinite(callbackResult);
        expect(assertionActual8).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorAltitudeRepeatabilityTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_REPEATABILITY_0500
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 50
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeRepeatabilityTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 990;
        const currentPressure: number = 1050.125;
        const expectedAltitude: number = -500.1700779616;
        const promiseResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        const callbackResult: number = await altitudeCallback(seaPressure, currentPressure);
        assertNear(promiseResult, expectedAltitude, 0.75);
        assertNear(callbackResult, expectedAltitude, 0.75);
        assertNear(callbackResult, promiseResult, 0.02);
        const zeroAltitude: number = await sensor.getDeviceAltitude(seaPressure, seaPressure);
        assertNear(zeroAltitude, 0, 0.001);
        const scaledAltitude: number = await sensor.getDeviceAltitude(seaPressure * 2, currentPressure * 2);
        assertNear(scaledAltitude, expectedAltitude, 0.75);
        const lowerPressureAltitude: number = await sensor.getDeviceAltitude(seaPressure, currentPressure * 0.9);
        expect(lowerPressureAltitude).assertLarger(promiseResult);
        const assertionActual9 = Number.isFinite(promiseResult);
        expect(assertionActual9).assertTrue();
        const assertionActual10 = Number.isFinite(callbackResult);
        expect(assertionActual10).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorAltitudeRepeatabilityTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_REPEATABILITY_0600
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 51
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeRepeatabilityTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1027;
        const currentPressure: number = 1129.25;
        const expectedAltitude: number = -807.9284623199;
        const promiseResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        const callbackResult: number = await altitudeCallback(seaPressure, currentPressure);
        assertNear(promiseResult, expectedAltitude, 0.75);
        assertNear(callbackResult, expectedAltitude, 0.75);
        assertNear(callbackResult, promiseResult, 0.02);
        const zeroAltitude: number = await sensor.getDeviceAltitude(seaPressure, seaPressure);
        assertNear(zeroAltitude, 0, 0.001);
        const scaledAltitude: number = await sensor.getDeviceAltitude(seaPressure * 2, currentPressure * 2);
        assertNear(scaledAltitude, expectedAltitude, 0.75);
        const lowerPressureAltitude: number = await sensor.getDeviceAltitude(seaPressure, currentPressure * 0.9);
        expect(lowerPressureAltitude).assertLarger(promiseResult);
        const assertionActual11 = Number.isFinite(promiseResult);
        expect(assertionActual11).assertTrue();
        const assertionActual12 = Number.isFinite(callbackResult);
        expect(assertionActual12).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );
  });
}
