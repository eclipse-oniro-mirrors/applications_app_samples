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
import { assertNear, assertGeomagneticResponse, geomagneticCallback } from '../Shared/SharedDriver';

export default function sensorGeomagneticSessionsTest(): void {
  describe('SensorGeomagneticSessions', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorGeomagneticSessionsTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_SESSIONS_0100
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 34
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticSessionsTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 40, longitude: 89, altitude: 3742 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1580774400000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual1 = JSON.stringify(location);
        expect(assertionActual1).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual2 = JSON.stringify(location);
        expect(assertionActual2).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticSessionsTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_SESSIONS_0200
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 35
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticSessionsTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 53, longitude: 118, altitude: 3855 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1580860800000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual3 = JSON.stringify(location);
        expect(assertionActual3).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual4 = JSON.stringify(location);
        expect(assertionActual4).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticSessionsTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_SESSIONS_0300
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 36
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticSessionsTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 66, longitude: 147, altitude: 3968 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1580947200000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual5 = JSON.stringify(location);
        expect(assertionActual5).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual6 = JSON.stringify(location);
        expect(assertionActual6).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticSessionsTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_SESSIONS_0400
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 37
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticSessionsTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 79, longitude: 176, altitude: 4081 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1581033600000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual7 = JSON.stringify(location);
        expect(assertionActual7).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual8 = JSON.stringify(location);
        expect(assertionActual8).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticSessionsTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_SESSIONS_0500
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 38
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticSessionsTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -69, longitude: -154, altitude: 4194 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1581120000000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual9 = JSON.stringify(location);
        expect(assertionActual9).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual10 = JSON.stringify(location);
        expect(assertionActual10).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticSessionsTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_SESSIONS_0600
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 39
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticSessionsTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -56, longitude: -125, altitude: 4307 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1581206400000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual11 = JSON.stringify(location);
        expect(assertionActual11).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual12 = JSON.stringify(location);
        expect(assertionActual12).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticSessionsTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_SESSIONS_0700
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 40
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticSessionsTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -43, longitude: -96, altitude: 4420 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1581292800000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual13 = JSON.stringify(location);
        expect(assertionActual13).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual14 = JSON.stringify(location);
        expect(assertionActual14).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticSessionsTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_SESSIONS_0800
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 41
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticSessionsTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -30, longitude: -67, altitude: 4533 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1581379200000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual15 = JSON.stringify(location);
        expect(assertionActual15).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual16 = JSON.stringify(location);
        expect(assertionActual16).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticSessionsTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_SESSIONS_0900
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticSessionsTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -17, longitude: -38, altitude: 4646 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1581465600000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual17 = JSON.stringify(location);
        expect(assertionActual17).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual18 = JSON.stringify(location);
        expect(assertionActual18).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticSessionsTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_SESSIONS_1000
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 43
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticSessionsTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -4, longitude: -9, altitude: 4759 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1581552000000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual19 = JSON.stringify(location);
        expect(assertionActual19).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual20 = JSON.stringify(location);
        expect(assertionActual20).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticSessionsTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_SESSIONS_1100
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 44
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticSessionsTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 9, longitude: 20, altitude: 4872 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1581638400000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual21 = JSON.stringify(location);
        expect(assertionActual21).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual22 = JSON.stringify(location);
        expect(assertionActual22).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticSessionsTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_SESSIONS_1200
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 45
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticSessionsTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 22, longitude: 49, altitude: 4985 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1581724800000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual23 = JSON.stringify(location);
        expect(assertionActual23).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual24 = JSON.stringify(location);
        expect(assertionActual24).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorGeomagneticSessionsTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_GEOMAGNETIC_SESSIONS_1300
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 46
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorGeomagneticSessionsTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 35, longitude: 78, altitude: 5098 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1581811200000;
        const promiseResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        const callbackResult: sensor.GeomagneticResponse = await geomagneticCallback(location, epochMillis);
        assertGeomagneticResponse(promiseResult);
        assertGeomagneticResponse(callbackResult);
        assertNear(callbackResult.x, promiseResult.x, 0.02);
        assertNear(callbackResult.y, promiseResult.y, 0.02);
        assertNear(callbackResult.z, promiseResult.z, 0.02);
        assertNear(callbackResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        assertNear(callbackResult.levelIntensity, promiseResult.levelIntensity, 0.02);
        assertNear(callbackResult.geomagneticDip, promiseResult.geomagneticDip, 0.0001);
        assertNear(callbackResult.deflectionAngle, promiseResult.deflectionAngle, 0.0001);
        const assertionActual25 = JSON.stringify(location);
        expect(assertionActual25).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual26 = JSON.stringify(location);
        expect(assertionActual26).assertEqual(locationBefore);
      },
    );
  });
}
