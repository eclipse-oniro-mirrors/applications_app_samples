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

export default function sensorCalculationCommandsTest(): void {
  describe('SensorCalculationCommands', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorCalculationCommandsTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_0100
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1048;
        const currentPressure: number = 566.5;
        const expectedAltitude: number = 4897.140612466;
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
     * @tc.name testSensorCalculationCommandsTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_0200
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1085;
        const currentPressure: number = 645.625;
        const expectedAltitude: number = 4169.80179805;
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
     * @tc.name testSensorCalculationCommandsTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_0300
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 902;
        const currentPressure: number = 724.75;
        const expectedAltitude: number = 1807.751086029;
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
     * @tc.name testSensorCalculationCommandsTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_0400
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 939;
        const currentPressure: number = 803;
        const expectedAltitude: number = 1300.412772758;
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
     * @tc.name testSensorCalculationCommandsTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_0500
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 976;
        const currentPressure: number = 882.125;
        const expectedAltitude: number = 844.9437392158;
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
     * @tc.name testSensorCalculationCommandsTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_0600
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1013;
        const currentPressure: number = 961.25;
        const expectedAltitude: number = 440.1469636462;
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
     * @tc.name testSensorCalculationCommandsTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_0700
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1050;
        const currentPressure: number = 1040.375;
        const expectedAltitude: number = 77.61651425222;
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
     * @tc.name testSensorCalculationCommandsTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_0800
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 11
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1087;
        const currentPressure: number = 1119.5;
        const expectedAltitude: number = -249.2205118787;
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
     * @tc.name testSensorCalculationCommandsTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_0900
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 904;
        const currentPressure: number = 1198.625;
        const expectedAltitude: number = -2444.77414626;
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
     * @tc.name testSensorCalculationCommandsTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_1000
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 13
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 941;
        const currentPressure: number = 1277.75;
        const expectedAltitude: number = -2657.204641906;
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
     * @tc.name testSensorCalculationCommandsTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_1100
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 14
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 978;
        const currentPressure: number = 306;
        const expectedAltitude: number = 8793.751400965;
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
     * @tc.name testSensorCalculationCommandsTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_1200
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1015;
        const currentPressure: number = 385.125;
        const expectedAltitude: number = 7465.413112746;
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
     * @tc.name testSensorCalculationCommandsTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_1300
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1052;
        const currentPressure: number = 464.25;
        const expectedAltitude: number = 6390.393998758;
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

    /**
     * @tc.name testSensorCalculationCommandsTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_1400
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1089;
        const currentPressure: number = 543.375;
        const expectedAltitude: number = 5493.300709807;
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
        const assertionActual27 = Number.isFinite(promiseResult);
        expect(assertionActual27).assertTrue();
        const assertionActual28 = Number.isFinite(callbackResult);
        expect(assertionActual28).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorCalculationCommandsTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_1500
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 18
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 906;
        const currentPressure: number = 622.5;
        const expectedAltitude: number = 3055.504211046;
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
        const assertionActual29 = Number.isFinite(promiseResult);
        expect(assertionActual29).assertTrue();
        const assertionActual30 = Number.isFinite(callbackResult);
        expect(assertionActual30).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorCalculationCommandsTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_1600
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 19
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 943;
        const currentPressure: number = 701.625;
        const expectedAltitude: number = 2425.313521217;
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
        const assertionActual31 = Number.isFinite(promiseResult);
        expect(assertionActual31).assertTrue();
        const assertionActual32 = Number.isFinite(callbackResult);
        expect(assertionActual32).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorCalculationCommandsTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_1700
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 980;
        const currentPressure: number = 780.75;
        const expectedAltitude: number = 1876.554889822;
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
        const assertionActual33 = Number.isFinite(promiseResult);
        expect(assertionActual33).assertTrue();
        const assertionActual34 = Number.isFinite(callbackResult);
        expect(assertionActual34).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorCalculationCommandsTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_1800
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 21
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1017;
        const currentPressure: number = 859;
        const expectedAltitude: number = 1401.68690753;
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
        const assertionActual35 = Number.isFinite(promiseResult);
        expect(assertionActual35).assertTrue();
        const assertionActual36 = Number.isFinite(callbackResult);
        expect(assertionActual36).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorCalculationCommandsTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_1900
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 22
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1054;
        const currentPressure: number = 938.125;
        const expectedAltitude: number = 971.6615449922;
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
        const assertionActual37 = Number.isFinite(promiseResult);
        expect(assertionActual37).assertTrue();
        const assertionActual38 = Number.isFinite(callbackResult);
        expect(assertionActual38).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorCalculationCommandsTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_2000
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 23
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1091;
        const currentPressure: number = 1017.25;
        const expectedAltitude: number = 586.5204704178;
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
        const assertionActual39 = Number.isFinite(promiseResult);
        expect(assertionActual39).assertTrue();
        const assertionActual40 = Number.isFinite(callbackResult);
        expect(assertionActual40).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorCalculationCommandsTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_2100
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 24
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 908;
        const currentPressure: number = 1096.375;
        const expectedAltitude: number = -1619.183946047;
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
        const assertionActual41 = Number.isFinite(promiseResult);
        expect(assertionActual41).assertTrue();
        const assertionActual42 = Number.isFinite(callbackResult);
        expect(assertionActual42).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorCalculationCommandsTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_2200
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 25
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 945;
        const currentPressure: number = 1175.5;
        const expectedAltitude: number = -1879.997739609;
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
        const assertionActual43 = Number.isFinite(promiseResult);
        expect(assertionActual43).assertTrue();
        const assertionActual44 = Number.isFinite(callbackResult);
        expect(assertionActual44).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorCalculationCommandsTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_2300
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 26
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 982;
        const currentPressure: number = 1254.625;
        const expectedAltitude: number = -2115.707290755;
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
        const assertionActual45 = Number.isFinite(promiseResult);
        expect(assertionActual45).assertTrue();
        const assertionActual46 = Number.isFinite(callbackResult);
        expect(assertionActual46).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorCalculationCommandsTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_2400
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 27
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1019;
        const currentPressure: number = 283.75;
        const expectedAltitude: number = 9573.288410298;
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
        const assertionActual47 = Number.isFinite(promiseResult);
        expect(assertionActual47).assertTrue();
        const assertionActual48 = Number.isFinite(callbackResult);
        expect(assertionActual48).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorCalculationCommandsTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_2500
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 28
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1056;
        const currentPressure: number = 362;
        const expectedAltitude: number = 8170.778359886;
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
        const assertionActual49 = Number.isFinite(promiseResult);
        expect(assertionActual49).assertTrue();
        const assertionActual50 = Number.isFinite(callbackResult);
        expect(assertionActual50).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorCalculationCommandsTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_2600
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 29
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1093;
        const currentPressure: number = 441.125;
        const expectedAltitude: number = 7029.866369283;
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
        const assertionActual51 = Number.isFinite(promiseResult);
        expect(assertionActual51).assertTrue();
        const assertionActual52 = Number.isFinite(callbackResult);
        expect(assertionActual52).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorCalculationCommandsTest0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_2700
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 910;
        const currentPressure: number = 520.25;
        const expectedAltitude: number = 4474.474530379;
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
        const assertionActual53 = Number.isFinite(promiseResult);
        expect(assertionActual53).assertTrue();
        const assertionActual54 = Number.isFinite(callbackResult);
        expect(assertionActual54).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorCalculationCommandsTest0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_2800
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 31
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 947;
        const currentPressure: number = 599.375;
        const expectedAltitude: number = 3695.456951566;
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
        const assertionActual55 = Number.isFinite(promiseResult);
        expect(assertionActual55).assertTrue();
        const assertionActual56 = Number.isFinite(callbackResult);
        expect(assertionActual56).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorCalculationCommandsTest0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_CALCULATION_COMMANDS_2900
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCalculationCommandsTest0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 984;
        const currentPressure: number = 678.5;
        const expectedAltitude: number = 3027.578443491;
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
        const assertionActual57 = Number.isFinite(promiseResult);
        expect(assertionActual57).assertTrue();
        const assertionActual58 = Number.isFinite(callbackResult);
        expect(assertionActual58).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );
  });
}
