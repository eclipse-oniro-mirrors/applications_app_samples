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

export default function sensorInputIsolationTest(): void {
  describe('SensorInputIsolation', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorInputIsolationTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INPUT_ISOLATION_0100
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 33
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInputIsolationTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1021;
        const currentPressure: number = 757.625;
        const expectedAltitude: number = 2446.695550534;
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
     * @tc.name testSensorInputIsolationTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INPUT_ISOLATION_0200
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 34
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInputIsolationTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1058;
        const currentPressure: number = 836.75;
        const expectedAltitude: number = 1935.59071621;
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
     * @tc.name testSensorInputIsolationTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INPUT_ISOLATION_0300
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 35
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInputIsolationTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1095;
        const currentPressure: number = 915;
        const expectedAltitude: number = 1489.349962494;
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
     * @tc.name testSensorInputIsolationTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INPUT_ISOLATION_0400
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 36
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInputIsolationTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 912;
        const currentPressure: number = 994.125;
        const expectedAltitude: number = -733.3574935824;
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
     * @tc.name testSensorInputIsolationTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INPUT_ISOLATION_0500
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 37
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInputIsolationTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 949;
        const currentPressure: number = 1073.25;
        const expectedAltitude: number = -1050.16622426;
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
     * @tc.name testSensorInputIsolationTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INPUT_ISOLATION_0600
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 38
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInputIsolationTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 986;
        const currentPressure: number = 1152.375;
        const expectedAltitude: number = -1335.047987632;
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

    /**
     * @tc.name testSensorInputIsolationTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INPUT_ISOLATION_0700
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 39
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInputIsolationTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1023;
        const currentPressure: number = 1231.5;
        const expectedAltitude: number = -1592.726129865;
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
        const assertionActual13 = Number.isFinite(promiseResult);
        expect(assertionActual13).assertTrue();
        const assertionActual14 = Number.isFinite(callbackResult);
        expect(assertionActual14).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorInputIsolationTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INPUT_ISOLATION_0800
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 40
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInputIsolationTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1060;
        const currentPressure: number = 260.625;
        const expectedAltitude: number = 10386.78646691;
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
        const assertionActual15 = Number.isFinite(promiseResult);
        expect(assertionActual15).assertTrue();
        const assertionActual16 = Number.isFinite(callbackResult);
        expect(assertionActual16).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorInputIsolationTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INPUT_ISOLATION_0900
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 41
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInputIsolationTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1097;
        const currentPressure: number = 339.75;
        const expectedAltitude: number = 8862.659579891;
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
        const assertionActual17 = Number.isFinite(promiseResult);
        expect(assertionActual17).assertTrue();
        const assertionActual18 = Number.isFinite(callbackResult);
        expect(assertionActual18).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorInputIsolationTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INPUT_ISOLATION_1000
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInputIsolationTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 914;
        const currentPressure: number = 418;
        const expectedAltitude: number = 6131.946727474;
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
        const assertionActual19 = Number.isFinite(promiseResult);
        expect(assertionActual19).assertTrue();
        const assertionActual20 = Number.isFinite(callbackResult);
        expect(assertionActual20).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorInputIsolationTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INPUT_ISOLATION_1100
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 43
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInputIsolationTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 951;
        const currentPressure: number = 497.125;
        const expectedAltitude: number = 5147.801180362;
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
        const assertionActual21 = Number.isFinite(promiseResult);
        expect(assertionActual21).assertTrue();
        const assertionActual22 = Number.isFinite(callbackResult);
        expect(assertionActual22).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorInputIsolationTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INPUT_ISOLATION_1200
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 44
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInputIsolationTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 988;
        const currentPressure: number = 576.25;
        const expectedAltitude: number = 4322.544847403;
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
        const assertionActual23 = Number.isFinite(promiseResult);
        expect(assertionActual23).assertTrue();
        const assertionActual24 = Number.isFinite(callbackResult);
        expect(assertionActual24).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorInputIsolationTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_INPUT_ISOLATION_1300
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 45
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorInputIsolationTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1025;
        const currentPressure: number = 655.375;
        const expectedAltitude: number = 3616.730351983;
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
        const assertionActual25 = Number.isFinite(promiseResult);
        expect(assertionActual25).assertTrue();
        const assertionActual26 = Number.isFinite(callbackResult);
        expect(assertionActual26).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );
  });
}
