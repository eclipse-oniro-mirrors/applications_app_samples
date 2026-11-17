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

export default function sensorOfflineGeomagneticTest(): void {
  describe('SensorOfflineGeomagnetic', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorOfflineGeomagneticTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_0100
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 106
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 10, longitude: 23, altitude: 1877 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1586995200000;
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
     * @tc.name testSensorOfflineGeomagneticTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_0200
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 107
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 23, longitude: 52, altitude: 1990 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1587081600000;
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
     * @tc.name testSensorOfflineGeomagneticTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_0300
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 108
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 36, longitude: 81, altitude: 2103 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1587168000000;
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
     * @tc.name testSensorOfflineGeomagneticTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_0400
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 109
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 49, longitude: 110, altitude: 2216 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1587254400000;
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
     * @tc.name testSensorOfflineGeomagneticTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_0500
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 110
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 62, longitude: 139, altitude: 2329 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1587340800000;
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
     * @tc.name testSensorOfflineGeomagneticTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_0600
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 75, longitude: 168, altitude: 2442 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1587427200000;
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
     * @tc.name testSensorOfflineGeomagneticTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_0700
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 112
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -73, longitude: -162, altitude: 2555 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1587513600000;
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
     * @tc.name testSensorOfflineGeomagneticTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_0800
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 113
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -60, longitude: -133, altitude: 2668 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1587600000000;
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
     * @tc.name testSensorOfflineGeomagneticTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_0900
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 114
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -47, longitude: -104, altitude: 2781 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1587686400000;
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
     * @tc.name testSensorOfflineGeomagneticTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_1000
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 115
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -34, longitude: -75, altitude: 2894 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1587772800000;
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
     * @tc.name testSensorOfflineGeomagneticTest0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_1100
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 116
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -21, longitude: -46, altitude: 3007 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1587859200000;
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
     * @tc.name testSensorOfflineGeomagneticTest0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_1200
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 117
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -8, longitude: -17, altitude: 3120 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1587945600000;
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
     * @tc.name testSensorOfflineGeomagneticTest0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_1300
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 118
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 5, longitude: 12, altitude: 3233 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1588032000000;
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

    /**
     * @tc.name testSensorOfflineGeomagneticTest0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_1400
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 119
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 18, longitude: 41, altitude: 3346 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1588118400000;
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
        const assertionActual27 = JSON.stringify(location);
        expect(assertionActual27).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual28 = JSON.stringify(location);
        expect(assertionActual28).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorOfflineGeomagneticTest0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_1500
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 120
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 31, longitude: 70, altitude: 3459 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1588204800000;
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
        const assertionActual29 = JSON.stringify(location);
        expect(assertionActual29).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual30 = JSON.stringify(location);
        expect(assertionActual30).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorOfflineGeomagneticTest0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_1600
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 121
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 44, longitude: 99, altitude: 3572 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1588291200000;
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
        const assertionActual31 = JSON.stringify(location);
        expect(assertionActual31).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual32 = JSON.stringify(location);
        expect(assertionActual32).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorOfflineGeomagneticTest0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_1700
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 122
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 57, longitude: 128, altitude: 3685 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1588377600000;
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
        const assertionActual33 = JSON.stringify(location);
        expect(assertionActual33).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual34 = JSON.stringify(location);
        expect(assertionActual34).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorOfflineGeomagneticTest0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_1800
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 123
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 70, longitude: 157, altitude: 3798 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1588464000000;
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
        const assertionActual35 = JSON.stringify(location);
        expect(assertionActual35).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual36 = JSON.stringify(location);
        expect(assertionActual36).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorOfflineGeomagneticTest0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_1900
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 124
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -78, longitude: -173, altitude: 3911 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1588550400000;
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
        const assertionActual37 = JSON.stringify(location);
        expect(assertionActual37).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual38 = JSON.stringify(location);
        expect(assertionActual38).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorOfflineGeomagneticTest0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_2000
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 125
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -65, longitude: -144, altitude: 4024 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1588636800000;
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
        const assertionActual39 = JSON.stringify(location);
        expect(assertionActual39).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual40 = JSON.stringify(location);
        expect(assertionActual40).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorOfflineGeomagneticTest0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_2100
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 126
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -52, longitude: -115, altitude: 4137 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1588723200000;
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
        const assertionActual41 = JSON.stringify(location);
        expect(assertionActual41).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual42 = JSON.stringify(location);
        expect(assertionActual42).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorOfflineGeomagneticTest0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_2200
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -39, longitude: -86, altitude: 4250 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1588809600000;
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
        const assertionActual43 = JSON.stringify(location);
        expect(assertionActual43).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual44 = JSON.stringify(location);
        expect(assertionActual44).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorOfflineGeomagneticTest0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_2300
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -26, longitude: -57, altitude: 4363 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1588896000000;
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
        const assertionActual45 = JSON.stringify(location);
        expect(assertionActual45).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual46 = JSON.stringify(location);
        expect(assertionActual46).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorOfflineGeomagneticTest0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_2400
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 129
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: -13, longitude: -28, altitude: 4476 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1588982400000;
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
        const assertionActual47 = JSON.stringify(location);
        expect(assertionActual47).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual48 = JSON.stringify(location);
        expect(assertionActual48).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorOfflineGeomagneticTest0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_2500
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 130
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 0, longitude: 1, altitude: 4589 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1589068800000;
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
        const assertionActual49 = JSON.stringify(location);
        expect(assertionActual49).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual50 = JSON.stringify(location);
        expect(assertionActual50).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorOfflineGeomagneticTest0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_2600
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 131
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 13, longitude: 30, altitude: 4702 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1589155200000;
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
        const assertionActual51 = JSON.stringify(location);
        expect(assertionActual51).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual52 = JSON.stringify(location);
        expect(assertionActual52).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorOfflineGeomagneticTest0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_2700
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 132
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 26, longitude: 59, altitude: 4815 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1589241600000;
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
        const assertionActual53 = JSON.stringify(location);
        expect(assertionActual53).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual54 = JSON.stringify(location);
        expect(assertionActual54).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorOfflineGeomagneticTest0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_2800
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 133
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 39, longitude: 88, altitude: 4928 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1589328000000;
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
        const assertionActual55 = JSON.stringify(location);
        expect(assertionActual55).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual56 = JSON.stringify(location);
        expect(assertionActual56).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorOfflineGeomagneticTest0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_2900
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 134
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 52, longitude: 117, altitude: 5041 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1589414400000;
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
        const assertionActual57 = JSON.stringify(location);
        expect(assertionActual57).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual58 = JSON.stringify(location);
        expect(assertionActual58).assertEqual(locationBefore);
      },
    );

    /**
     * @tc.name testSensorOfflineGeomagneticTest0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_OFFLINE_GEOMAGNETIC_3000
     * @tc.desc Verify sensor.getGeomagneticInfo with independent expectations for input partition 135
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorOfflineGeomagneticTest0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const location: sensor.LocationOptions = { latitude: 65, longitude: 146, altitude: 5154 };
        const locationBefore: string = JSON.stringify(location);
        const epochMillis: number = 1589500800000;
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
        const assertionActual59 = JSON.stringify(location);
        expect(assertionActual59).assertEqual(locationBefore);
        const repeatedResult: sensor.GeomagneticResponse = await sensor.getGeomagneticInfo(location, epochMillis);
        assertNear(repeatedResult.totalIntensity, promiseResult.totalIntensity, 0.02);
        const assertionActual60 = JSON.stringify(location);
        expect(assertionActual60).assertEqual(locationBefore);
      },
    );
  });
}
