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

export default function sensorAltitudeCatalogTest(): void {
  describe('SensorAltitudeCatalog', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorAltitudeCatalogTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_0100
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 56
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 992;
        const currentPressure: number = 474;
        const expectedAltitude: number = 5811.994050637;
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
     * @tc.name testSensorAltitudeCatalogTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_0200
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 57
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1029;
        const currentPressure: number = 553.125;
        const expectedAltitude: number = 4939.116956241;
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
     * @tc.name testSensorAltitudeCatalogTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_0300
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 58
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1066;
        const currentPressure: number = 632.25;
        const expectedAltitude: number = 4194.763616216;
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
     * @tc.name testSensorAltitudeCatalogTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_0400
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 59
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1103;
        const currentPressure: number = 711.375;
        const expectedAltitude: number = 3549.651284548;
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
     * @tc.name testSensorAltitudeCatalogTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_0500
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 60
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 920;
        const currentPressure: number = 790.5;
        const expectedAltitude: number = 1261.478146605;
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
     * @tc.name testSensorAltitudeCatalogTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_0600
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 61
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 957;
        const currentPressure: number = 869.625;
        const expectedAltitude: number = 800.3393047247;
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
     * @tc.name testSensorAltitudeCatalogTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_0700
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 62
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 994;
        const currentPressure: number = 948.75;
        const expectedAltitude: number = 391.3013788841;
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
     * @tc.name testSensorAltitudeCatalogTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_0800
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 63
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1031;
        const currentPressure: number = 1027;
        const expectedAltitude: number = 32.78004566561;
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
     * @tc.name testSensorAltitudeCatalogTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_0900
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 64
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1068;
        const currentPressure: number = 1106.125;
        const expectedAltitude: number = -296.8759755911;
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
     * @tc.name testSensorAltitudeCatalogTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_1000
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 65
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1105;
        const currentPressure: number = 1185.25;
        const expectedAltitude: number = -595.3813586106;
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
     * @tc.name testSensorAltitudeCatalogTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_1100
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 66
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 922;
        const currentPressure: number = 1264.375;
        const expectedAltitude: number = -2745.585389628;
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
     * @tc.name testSensorAltitudeCatalogTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_1200
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 67
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 959;
        const currentPressure: number = 293.5;
        const expectedAltitude: number = 8942.810973945;
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
     * @tc.name testSensorAltitudeCatalogTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_1300
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 68
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 996;
        const currentPressure: number = 372.625;
        const expectedAltitude: number = 7564.185476918;
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
     * @tc.name testSensorAltitudeCatalogTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_1400
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 69
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1033;
        const currentPressure: number = 451.75;
        const expectedAltitude: number = 6455.808425165;
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
     * @tc.name testSensorAltitudeCatalogTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_1500
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 70
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1070;
        const currentPressure: number = 530;
        const expectedAltitude: number = 5547.371958738;
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
     * @tc.name testSensorAltitudeCatalogTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_1600
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 71
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1107;
        const currentPressure: number = 609.125;
        const expectedAltitude: number = 4763.523225518;
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
     * @tc.name testSensorAltitudeCatalogTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_1700
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 72
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 924;
        const currentPressure: number = 688.25;
        const expectedAltitude: number = 2416.482848806;
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
     * @tc.name testSensorAltitudeCatalogTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_1800
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 73
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 961;
        const currentPressure: number = 767.375;
        const expectedAltitude: number = 1857.979838188;
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
     * @tc.name testSensorAltitudeCatalogTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_1900
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 74
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 998;
        const currentPressure: number = 846.5;
        const expectedAltitude: number = 1367.359953918;
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
     * @tc.name testSensorAltitudeCatalogTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_2000
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 75
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1035;
        const currentPressure: number = 925.625;
        const expectedAltitude: number = 932.2291540058;
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
     * @tc.name testSensorAltitudeCatalogTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_2100
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 76
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1072;
        const currentPressure: number = 1004.75;
        const expectedAltitude: number = 543.1759785841;
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
     * @tc.name testSensorAltitudeCatalogTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_2200
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 77
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1109;
        const currentPressure: number = 1083;
        const expectedAltitude: number = 199.6770854214;
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
     * @tc.name testSensorAltitudeCatalogTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_2300
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 78
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 926;
        const currentPressure: number = 1162.125;
        const expectedAltitude: number = -1958.03868973;
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
     * @tc.name testSensorAltitudeCatalogTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_2400
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 79
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 963;
        const currentPressure: number = 1241.25;
        const expectedAltitude: number = -2193.728264632;
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
     * @tc.name testSensorAltitudeCatalogTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_2500
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 80
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1000;
        const currentPressure: number = 270.375;
        const expectedAltitude: number = 9767.605187707;
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
     * @tc.name testSensorAltitudeCatalogTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_2600
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 81
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1037;
        const currentPressure: number = 349.5;
        const expectedAltitude: number = 8287.457916821;
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
     * @tc.name testSensorAltitudeCatalogTest0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_2700
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 82
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1074;
        const currentPressure: number = 428.625;
        const expectedAltitude: number = 7109.348025949;
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
     * @tc.name testSensorAltitudeCatalogTest0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_2800
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 83
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1111;
        const currentPressure: number = 507.75;
        const expectedAltitude: number = 6136.870726106;
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
     * @tc.name testSensorAltitudeCatalogTest0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_2900
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 84
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 928;
        const currentPressure: number = 586;
        const expectedAltitude: number = 3713.240207168;
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

    /**
     * @tc.name testSensorAltitudeCatalogTest0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_3000
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 85
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 965;
        const currentPressure: number = 665.125;
        const expectedAltitude: number = 3030.814058054;
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
        const assertionActual59 = Number.isFinite(promiseResult);
        expect(assertionActual59).assertTrue();
        const assertionActual60 = Number.isFinite(callbackResult);
        expect(assertionActual60).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorAltitudeCatalogTest0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_3100
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 86
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1002;
        const currentPressure: number = 744.25;
        const expectedAltitude: number = 2438.939876558;
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
        const assertionActual61 = Number.isFinite(promiseResult);
        expect(assertionActual61).assertTrue();
        const assertionActual62 = Number.isFinite(callbackResult);
        expect(assertionActual62).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorAltitudeCatalogTest0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_3200
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 87
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1039;
        const currentPressure: number = 823.375;
        const expectedAltitude: number = 1919.387969183;
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
        const assertionActual63 = Number.isFinite(promiseResult);
        expect(assertionActual63).assertTrue();
        const assertionActual64 = Number.isFinite(callbackResult);
        expect(assertionActual64).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorAltitudeCatalogTest0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_3300
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 88
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1076;
        const currentPressure: number = 902.5;
        const expectedAltitude: number = 1458.779724605;
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
        const assertionActual65 = Number.isFinite(promiseResult);
        expect(assertionActual65).assertTrue();
        const assertionActual66 = Number.isFinite(callbackResult);
        expect(assertionActual66).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorAltitudeCatalogTest0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_3400
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 89
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 1113;
        const currentPressure: number = 981.625;
        const expectedAltitude: number = 1047.012793354;
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
        const assertionActual67 = Number.isFinite(promiseResult);
        expect(assertionActual67).assertTrue();
        const assertionActual68 = Number.isFinite(callbackResult);
        expect(assertionActual68).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );

    /**
     * @tc.name testSensorAltitudeCatalogTest0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_ALTITUDE_CATALOG_3500
     * @tc.desc Verify sensor.getDeviceAltitude with independent expectations for input partition 90
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorAltitudeCatalogTest0035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const seaPressure: number = 930;
        const currentPressure: number = 1060.75;
        const expectedAltitude: number = -1123.706118811;
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
        const assertionActual69 = Number.isFinite(promiseResult);
        expect(assertionActual69).assertTrue();
        const assertionActual70 = Number.isFinite(callbackResult);
        expect(assertionActual70).assertTrue();
        const repeatedResult: number = await sensor.getDeviceAltitude(seaPressure, currentPressure);
        assertNear(repeatedResult, promiseResult, 0.02);
      },
    );
  });
}
