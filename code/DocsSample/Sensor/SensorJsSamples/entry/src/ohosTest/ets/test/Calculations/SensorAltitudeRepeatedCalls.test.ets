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

export default function sensorAltitudeRepeatedCallsTest(): void {
  describe('SensorAltitudeRepeatedCalls', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorAltitudeRepeatedCallsTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_REPEATED_CALLS_0100
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 52
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeRepeatedCallsTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1064;
        const currentPressure: number = 1208.375;
        const expectedAltitude: number = -1086.477816536;
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
     * @tc.name testSensorAltitudeRepeatedCallsTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_REPEATED_CALLS_0200
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 53
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeRepeatedCallsTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1101;
        const currentPressure: number = 1287.5;
        const expectedAltitude: number = -1339.910564351;
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
     * @tc.name testSensorAltitudeRepeatedCallsTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_REPEATED_CALLS_0300
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 54
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeRepeatedCallsTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 918;
        const currentPressure: number = 316.625;
        const expectedAltitude: number = 8128.642819279;
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
     * @tc.name testSensorAltitudeRepeatedCallsTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_REPEATED_CALLS_0400
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 55
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeRepeatedCallsTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 955;
        const currentPressure: number = 395.75;
        const expectedAltitude: number = 6841.831722226;
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
  });
}
