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
import { assertArrayNear, assertRotationMatrix, transformCallback } from '../Shared/SharedDriver';

export default function sensorCoordinatePersistenceTest(): void {
  describe('SensorCoordinatePersistence', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await Promise.resolve();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorCoordinatePersistenceTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_PERSISTENCE_0100
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 53
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinatePersistenceTest0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.388789250993, 0.5333797121774, 0.7512316559823, -0.9082642096779, 0.08507294258626, 0.4096568318214,
          0.1545931555101, -0.8415869991137, 0.5175251483669,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 2, y: 3 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.7512316559823, 0.388789250993, 0.5333797121774, 0.4096568318214, -0.9082642096779, 0.08507294258626,
          0.5175251483669, 0.1545931555101, -0.8415869991137,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual1 = promiseResult.length;
        expect(assertionActual1).assertEqual(9);
        const assertionActual2 = callbackResult.length;
        expect(assertionActual2).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual3 = JSON.stringify(input);
        expect(assertionActual3).assertEqual(inputBefore);
        const assertionActual4 = JSON.stringify(coordinates);
        expect(assertionActual4).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinatePersistenceTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_PERSISTENCE_0200
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 54
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinatePersistenceTest0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.7501253590089, -0.4580035875012, -0.4770164144008, 0.3013765940195, 0.8788387122764, -0.369884666324,
          0.5886289955048, 0.1336982858546, 0.7972707658071,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 2, y: 129 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.4580035875012, 0.7501253590089, -0.4770164144008, -0.8788387122764, 0.3013765940195, -0.369884666324,
          -0.1336982858546, 0.5886289955048, 0.7972707658071,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual5 = promiseResult.length;
        expect(assertionActual5).assertEqual(9);
        const assertionActual6 = callbackResult.length;
        expect(assertionActual6).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual7 = JSON.stringify(input);
        expect(assertionActual7).assertEqual(inputBefore);
        const assertionActual8 = JSON.stringify(coordinates);
        expect(assertionActual8).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinatePersistenceTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_PERSISTENCE_0300
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 55
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinatePersistenceTest0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.1045304346738, 0.9476785433518, -0.3016268666707, 0.8910888472751, -0.2239255707321, -0.3947378940946,
          -0.4416266007487, -0.2275142132769, -0.8678728180259,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 2, y: 131 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.3016268666707, 0.1045304346738, -0.9476785433518, 0.3947378940946, 0.8910888472751, 0.2239255707321,
          0.8678728180259, -0.4416266007487, 0.2275142132769,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual9 = promiseResult.length;
        expect(assertionActual9).assertEqual(9);
        const assertionActual10 = callbackResult.length;
        expect(assertionActual10).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual11 = JSON.stringify(input);
        expect(assertionActual11).assertEqual(inputBefore);
        const assertionActual12 = JSON.stringify(coordinates);
        expect(assertionActual12).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinatePersistenceTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_PERSISTENCE_0400
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 56
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinatePersistenceTest0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9307567409562, -0.3417202060207, 0.1300737866049, 0.3581000423984, 0.7800670351149, -0.5130884722554,
          0.07386642538294, 0.5241399827568, 0.8484226715953,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 3, y: 1 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.3417202060207, 0.1300737866049, 0.9307567409562, 0.7800670351149, -0.5130884722554, 0.3581000423984,
          0.5241399827568, 0.8484226715953, 0.07386642538294,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual13 = promiseResult.length;
        expect(assertionActual13).assertEqual(9);
        const assertionActual14 = callbackResult.length;
        expect(assertionActual14).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual15 = JSON.stringify(input);
        expect(assertionActual15).assertEqual(inputBefore);
        const assertionActual16 = JSON.stringify(coordinates);
        expect(assertionActual16).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinatePersistenceTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_PERSISTENCE_0500
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 57
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinatePersistenceTest0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.4838941601612, 0.8320408006132, 0.2712094170136, 0.09283387558571, 0.259355667269, -0.9613097884653,
          -0.8701886653512, 0.4903496140209, 0.04825912062983,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 3, y: 2 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.2712094170136, 0.8320408006132, 0.4838941601612, 0.9613097884653, 0.259355667269, 0.09283387558571,
          -0.04825912062983, 0.4903496140209, -0.8701886653512,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual17 = promiseResult.length;
        expect(assertionActual17).assertEqual(9);
        const assertionActual18 = callbackResult.length;
        expect(assertionActual18).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual19 = JSON.stringify(input);
        expect(assertionActual19).assertEqual(inputBefore);
        const assertionActual20 = JSON.stringify(coordinates);
        expect(assertionActual20).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinatePersistenceTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_PERSISTENCE_0600
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 58
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinatePersistenceTest0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.5050475719763, -0.6935976099103, -0.5136626378933, 0.3933513583046, 0.3447697563503, -0.8522960307464,
          0.7682458323745, -0.6324999372592, 0.09870243363943,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 3, y: 129 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.6935976099103, 0.5136626378933, -0.5050475719763, -0.3447697563503, 0.8522960307464, 0.3933513583046,
          0.6324999372592, -0.09870243363943, 0.7682458323745,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual21 = promiseResult.length;
        expect(assertionActual21).assertEqual(9);
        const assertionActual22 = callbackResult.length;
        expect(assertionActual22).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual23 = JSON.stringify(input);
        expect(assertionActual23).assertEqual(inputBefore);
        const assertionActual24 = JSON.stringify(coordinates);
        expect(assertionActual24).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinatePersistenceTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_PERSISTENCE_0700
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 59
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinatePersistenceTest0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.9863646807259, 0.1475262863685, 0.0729432069955, -0.156658898967, 0.9774647265082, 0.1414945151115,
          -0.05042525152058, -0.1509923947175, 0.9872479884743,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 3, y: 130 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.0729432069955, -0.1475262863685, 0.9863646807259, 0.1414945151115, -0.9774647265082, -0.156658898967,
          0.9872479884743, 0.1509923947175, -0.05042525152058,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual25 = promiseResult.length;
        expect(assertionActual25).assertEqual(9);
        const assertionActual26 = callbackResult.length;
        expect(assertionActual26).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual27 = JSON.stringify(input);
        expect(assertionActual27).assertEqual(inputBefore);
        const assertionActual28 = JSON.stringify(coordinates);
        expect(assertionActual28).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinatePersistenceTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_PERSISTENCE_0800
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 60
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinatePersistenceTest0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          -0.5514267501365, 0.1422787592498, -0.8220007870435, -0.7414834528319, -0.5351135778878, 0.4047909929044,
          -0.3822706219555, 0.8327125635094, 0.4005732868818,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 129, y: 2 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          0.5514267501365, 0.1422787592498, 0.8220007870435, 0.7414834528319, -0.5351135778878, -0.4047909929044,
          0.3822706219555, 0.8327125635094, -0.4005732868818,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual29 = promiseResult.length;
        expect(assertionActual29).assertEqual(9);
        const assertionActual30 = callbackResult.length;
        expect(assertionActual30).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual31 = JSON.stringify(input);
        expect(assertionActual31).assertEqual(inputBefore);
        const assertionActual32 = JSON.stringify(coordinates);
        expect(assertionActual32).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinatePersistenceTest0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_PERSISTENCE_0900
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 61
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinatePersistenceTest0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.5245860399033, -0.7284773554556, 0.4406021213373, 0.2523223275834, 0.6273115876367, 0.7367588581209,
          -0.8131069608247, -0.2753196589512, 0.5128900034642,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 129, y: 3 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.5245860399033, 0.4406021213373, -0.7284773554556, -0.2523223275834, 0.7367588581209, 0.6273115876367,
          0.8131069608247, 0.5128900034642, -0.2753196589512,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual33 = promiseResult.length;
        expect(assertionActual33).assertEqual(9);
        const assertionActual34 = callbackResult.length;
        expect(assertionActual34).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual35 = JSON.stringify(input);
        expect(assertionActual35).assertEqual(inputBefore);
        const assertionActual36 = JSON.stringify(coordinates);
        expect(assertionActual36).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );

    /**
     * @tc.name testSensorCoordinatePersistenceTest0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_SENSOR_COORDINATE_PERSISTENCE_1000
     * @tc.desc Verify sensor.transformRotationMatrix with independent expectations for input partition 62
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it(
      'testSensorCoordinatePersistenceTest0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const input: number[] = [
          0.6731482977625, 0.5918154912464, -0.4434250709424, -0.1143271260742, 0.6756969750991, 0.7282601911992,
          0.7306166419287, -0.4395315940438, 0.5225048328717,
        ];
        const inputBefore: string = JSON.stringify(input);
        const coordinates: sensor.CoordinatesOptions = { x: 129, y: 130 };
        const coordinatesBefore: string = JSON.stringify(coordinates);
        const expected: number[] = [
          -0.6731482977625, -0.5918154912464, -0.4434250709424, 0.1143271260742, -0.6756969750991, 0.7282601911992,
          -0.7306166419287, 0.4395315940438, 0.5225048328717,
        ];
        const promiseResult: number[] = await sensor.transformRotationMatrix(input, coordinates);
        const callbackResult: number[] = await transformCallback(input, coordinates);
        const assertionActual37 = promiseResult.length;
        expect(assertionActual37).assertEqual(9);
        const assertionActual38 = callbackResult.length;
        expect(assertionActual38).assertEqual(9);
        assertArrayNear(promiseResult, expected, 0.00005);
        assertArrayNear(callbackResult, expected, 0.00005);
        assertArrayNear(callbackResult, promiseResult, 0.00005);
        assertRotationMatrix(promiseResult);
        assertRotationMatrix(callbackResult);
        const assertionActual39 = JSON.stringify(input);
        expect(assertionActual39).assertEqual(inputBefore);
        const assertionActual40 = JSON.stringify(coordinates);
        expect(assertionActual40).assertEqual(coordinatesBefore);
        const identityMapping: number[] = await sensor.transformRotationMatrix(input, { x: 1, y: 2 });
        assertArrayNear(identityMapping, input, 0.00005);
      },
    );
  });
}
