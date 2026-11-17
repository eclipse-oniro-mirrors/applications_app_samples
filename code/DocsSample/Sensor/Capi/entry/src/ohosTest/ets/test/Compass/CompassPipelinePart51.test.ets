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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { CompassFixture, hasBalancedSubscriptions } from '../Shared/SharedDriver';

export default function CompassPipelinePart51(): void {
  describe('CompassPipelinePart51', () => {
    let fixture: CompassFixture;
    beforeAll(() => {
      hilog.info(0xF811, 'SensorTest', '%{public}s', 'CompassPipelinePart51 begin');
    });
    beforeEach(async () => {
      fixture = new CompassFixture();
      await new Promise<void>((resolve) => {
        setTimeout(resolve, 1);
      });
    });
    afterEach(() => {
      fixture.stop();
      expect(hasBalancedSubscriptions(fixture)).assertTrue();
      expect(fixture.sensor.unsubscriptions[0]).assertEqual(256);
      expect(fixture.layout.offEvents[0]).assertEqual('change');
      expect(fixture.layout.offCallbacks[0]).assertEqual(fixture.layout.onCallbacks[0]);
    });
    afterAll(() => {
      hilog.info(0xF811, 'SensorTest', '%{public}s', 'CompassPipelinePart51 end');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_0100
     * @tc.name testCompassPipelinePart51Test0001
     * @tc.desc Verify onSensor rounds yaw 342.5 to 343 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0001', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(342.5, -159, -14, 141400000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(343);
      expect(fixture.state.angleTest).assertEqual('343°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(342.5);
      expect(event.data[1]).assertEqual(-159);
      expect(event.data[2]).assertEqual(-14);
      expect(event.timestamp).assertEqual(141400000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(343);
      expect(fixture.state.angleTest).assertEqual('343°');
      fixture.emit(342.5, 159, 14);
      expect(fixture.state.angle).assertEqual(343);
      expect(fixture.state.angleTest).assertEqual('343°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_0200
     * @tc.name testCompassPipelinePart51Test0002
     * @tc.desc Verify onSensor rounds yaw 343.5 to 344 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0002', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(343.5, -142, -1, 141600000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(344);
      expect(fixture.state.angleTest).assertEqual('344°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(343.5);
      expect(event.data[1]).assertEqual(-142);
      expect(event.data[2]).assertEqual(-1);
      expect(event.timestamp).assertEqual(141600000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(344);
      expect(fixture.state.angleTest).assertEqual('344°');
      fixture.emit(343.5, 142, 1);
      expect(fixture.state.angle).assertEqual(344);
      expect(fixture.state.angleTest).assertEqual('344°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_0300
     * @tc.name testCompassPipelinePart51Test0003
     * @tc.desc Verify onSensor rounds yaw 344.5 to 345 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0003', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(344.5, -125, 12, 141800000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(345);
      expect(fixture.state.angleTest).assertEqual('345°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(344.5);
      expect(event.data[1]).assertEqual(-125);
      expect(event.data[2]).assertEqual(12);
      expect(event.timestamp).assertEqual(141800000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(345);
      expect(fixture.state.angleTest).assertEqual('345°');
      fixture.emit(344.5, 125, -12);
      expect(fixture.state.angle).assertEqual(345);
      expect(fixture.state.angleTest).assertEqual('345°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_0400
     * @tc.name testCompassPipelinePart51Test0004
     * @tc.desc Verify onSensor rounds yaw 345.5 to 346 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0004', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(345.5, -108, 25, 142000000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(346);
      expect(fixture.state.angleTest).assertEqual('346°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(345.5);
      expect(event.data[1]).assertEqual(-108);
      expect(event.data[2]).assertEqual(25);
      expect(event.timestamp).assertEqual(142000000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(346);
      expect(fixture.state.angleTest).assertEqual('346°');
      fixture.emit(345.5, 108, -25);
      expect(fixture.state.angle).assertEqual(346);
      expect(fixture.state.angleTest).assertEqual('346°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_0500
     * @tc.name testCompassPipelinePart51Test0005
     * @tc.desc Verify onSensor rounds yaw 346.5 to 347 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0005', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(346.5, -91, 38, 142200000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(347);
      expect(fixture.state.angleTest).assertEqual('347°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(346.5);
      expect(event.data[1]).assertEqual(-91);
      expect(event.data[2]).assertEqual(38);
      expect(event.timestamp).assertEqual(142200000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(347);
      expect(fixture.state.angleTest).assertEqual('347°');
      fixture.emit(346.5, 91, -38);
      expect(fixture.state.angle).assertEqual(347);
      expect(fixture.state.angleTest).assertEqual('347°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_0600
     * @tc.name testCompassPipelinePart51Test0006
     * @tc.desc Verify onSensor rounds yaw 347.5 to 348 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0006', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(347.5, -74, 51, 142400000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(348);
      expect(fixture.state.angleTest).assertEqual('348°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(347.5);
      expect(event.data[1]).assertEqual(-74);
      expect(event.data[2]).assertEqual(51);
      expect(event.timestamp).assertEqual(142400000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(348);
      expect(fixture.state.angleTest).assertEqual('348°');
      fixture.emit(347.5, 74, -51);
      expect(fixture.state.angle).assertEqual(348);
      expect(fixture.state.angleTest).assertEqual('348°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_0700
     * @tc.name testCompassPipelinePart51Test0007
     * @tc.desc Verify onSensor rounds yaw 348.5 to 349 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0007', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(348.5, -57, 64, 142600000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(349);
      expect(fixture.state.angleTest).assertEqual('349°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(348.5);
      expect(event.data[1]).assertEqual(-57);
      expect(event.data[2]).assertEqual(64);
      expect(event.timestamp).assertEqual(142600000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(349);
      expect(fixture.state.angleTest).assertEqual('349°');
      fixture.emit(348.5, 57, -64);
      expect(fixture.state.angle).assertEqual(349);
      expect(fixture.state.angleTest).assertEqual('349°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_0800
     * @tc.name testCompassPipelinePart51Test0008
     * @tc.desc Verify onSensor rounds yaw 349.5 to 350 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0008', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(349.5, -40, 77, 142800000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(350);
      expect(fixture.state.angleTest).assertEqual('350°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(349.5);
      expect(event.data[1]).assertEqual(-40);
      expect(event.data[2]).assertEqual(77);
      expect(event.timestamp).assertEqual(142800000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(350);
      expect(fixture.state.angleTest).assertEqual('350°');
      fixture.emit(349.5, 40, -77);
      expect(fixture.state.angle).assertEqual(350);
      expect(fixture.state.angleTest).assertEqual('350°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_0900
     * @tc.name testCompassPipelinePart51Test0009
     * @tc.desc Verify onSensor rounds yaw 350.5 to 351 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0009', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(350.5, -23, 90, 143000000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(351);
      expect(fixture.state.angleTest).assertEqual('351°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(350.5);
      expect(event.data[1]).assertEqual(-23);
      expect(event.data[2]).assertEqual(90);
      expect(event.timestamp).assertEqual(143000000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(351);
      expect(fixture.state.angleTest).assertEqual('351°');
      fixture.emit(350.5, 23, -90);
      expect(fixture.state.angle).assertEqual(351);
      expect(fixture.state.angleTest).assertEqual('351°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_1000
     * @tc.name testCompassPipelinePart51Test0010
     * @tc.desc Verify onSensor rounds yaw 351.5 to 352 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0010', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(351.5, -6, -78, 143200000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(352);
      expect(fixture.state.angleTest).assertEqual('352°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(351.5);
      expect(event.data[1]).assertEqual(-6);
      expect(event.data[2]).assertEqual(-78);
      expect(event.timestamp).assertEqual(143200000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(352);
      expect(fixture.state.angleTest).assertEqual('352°');
      fixture.emit(351.5, 6, 78);
      expect(fixture.state.angle).assertEqual(352);
      expect(fixture.state.angleTest).assertEqual('352°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_1100
     * @tc.name testCompassPipelinePart51Test0011
     * @tc.desc Verify onSensor rounds yaw 352.5 to 353 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0011', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(352.5, 11, -65, 143400000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(353);
      expect(fixture.state.angleTest).assertEqual('353°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(352.5);
      expect(event.data[1]).assertEqual(11);
      expect(event.data[2]).assertEqual(-65);
      expect(event.timestamp).assertEqual(143400000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(353);
      expect(fixture.state.angleTest).assertEqual('353°');
      fixture.emit(352.5, -11, 65);
      expect(fixture.state.angle).assertEqual(353);
      expect(fixture.state.angleTest).assertEqual('353°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_1200
     * @tc.name testCompassPipelinePart51Test0012
     * @tc.desc Verify onSensor rounds yaw 353.5 to 354 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0012', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(353.5, 28, -52, 143600000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(354);
      expect(fixture.state.angleTest).assertEqual('354°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(353.5);
      expect(event.data[1]).assertEqual(28);
      expect(event.data[2]).assertEqual(-52);
      expect(event.timestamp).assertEqual(143600000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(354);
      expect(fixture.state.angleTest).assertEqual('354°');
      fixture.emit(353.5, -28, 52);
      expect(fixture.state.angle).assertEqual(354);
      expect(fixture.state.angleTest).assertEqual('354°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_1300
     * @tc.name testCompassPipelinePart51Test0013
     * @tc.desc Verify onSensor rounds yaw 354.5 to 355 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0013', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(354.5, 45, -39, 143800000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(355);
      expect(fixture.state.angleTest).assertEqual('355°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(354.5);
      expect(event.data[1]).assertEqual(45);
      expect(event.data[2]).assertEqual(-39);
      expect(event.timestamp).assertEqual(143800000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(355);
      expect(fixture.state.angleTest).assertEqual('355°');
      fixture.emit(354.5, -45, 39);
      expect(fixture.state.angle).assertEqual(355);
      expect(fixture.state.angleTest).assertEqual('355°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_1400
     * @tc.name testCompassPipelinePart51Test0014
     * @tc.desc Verify onSensor rounds yaw 355.5 to 356 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0014', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(355.5, 62, -26, 144000000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(356);
      expect(fixture.state.angleTest).assertEqual('356°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(355.5);
      expect(event.data[1]).assertEqual(62);
      expect(event.data[2]).assertEqual(-26);
      expect(event.timestamp).assertEqual(144000000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(356);
      expect(fixture.state.angleTest).assertEqual('356°');
      fixture.emit(355.5, -62, 26);
      expect(fixture.state.angle).assertEqual(356);
      expect(fixture.state.angleTest).assertEqual('356°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_1500
     * @tc.name testCompassPipelinePart51Test0015
     * @tc.desc Verify onSensor rounds yaw 356.5 to 357 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0015', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(356.5, 79, -13, 144200000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(357);
      expect(fixture.state.angleTest).assertEqual('357°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(356.5);
      expect(event.data[1]).assertEqual(79);
      expect(event.data[2]).assertEqual(-13);
      expect(event.timestamp).assertEqual(144200000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(357);
      expect(fixture.state.angleTest).assertEqual('357°');
      fixture.emit(356.5, -79, 13);
      expect(fixture.state.angle).assertEqual(357);
      expect(fixture.state.angleTest).assertEqual('357°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_1600
     * @tc.name testCompassPipelinePart51Test0016
     * @tc.desc Verify onSensor rounds yaw 357.5 to 358 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0016', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(357.5, 96, 0, 144400000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(358);
      expect(fixture.state.angleTest).assertEqual('358°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(357.5);
      expect(event.data[1]).assertEqual(96);
      expect(event.data[2]).assertEqual(0);
      expect(event.timestamp).assertEqual(144400000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(358);
      expect(fixture.state.angleTest).assertEqual('358°');
      fixture.emit(357.5, -96, 0);
      expect(fixture.state.angle).assertEqual(358);
      expect(fixture.state.angleTest).assertEqual('358°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_1700
     * @tc.name testCompassPipelinePart51Test0017
     * @tc.desc Verify onSensor rounds yaw 358.5 to 359 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0017', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(358.5, 113, 13, 144600000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(359);
      expect(fixture.state.angleTest).assertEqual('359°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(358.5);
      expect(event.data[1]).assertEqual(113);
      expect(event.data[2]).assertEqual(13);
      expect(event.timestamp).assertEqual(144600000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(359);
      expect(fixture.state.angleTest).assertEqual('359°');
      fixture.emit(358.5, -113, -13);
      expect(fixture.state.angle).assertEqual(359);
      expect(fixture.state.angleTest).assertEqual('359°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_1800
     * @tc.name testCompassPipelinePart51Test0018
     * @tc.desc Verify onSensor rounds yaw 359.5 to 0 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0018', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(359.5, 130, 26, 144800000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(359.5);
      expect(event.data[1]).assertEqual(130);
      expect(event.data[2]).assertEqual(26);
      expect(event.timestamp).assertEqual(144800000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      fixture.emit(359.5, -130, -26);
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_1900
     * @tc.name testCompassPipelinePart51Test0019
     * @tc.desc Verify onSensor rounds yaw 0.501 to 1 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0019', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(0.501, 147, 39, 145000000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(1);
      expect(fixture.state.angleTest).assertEqual('1°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(0.501);
      expect(event.data[1]).assertEqual(147);
      expect(event.data[2]).assertEqual(39);
      expect(event.timestamp).assertEqual(145000000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(1);
      expect(fixture.state.angleTest).assertEqual('1°');
      fixture.emit(0.501, -147, -39);
      expect(fixture.state.angle).assertEqual(1);
      expect(fixture.state.angleTest).assertEqual('1°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_2000
     * @tc.name testCompassPipelinePart51Test0020
     * @tc.desc Verify onSensor rounds yaw 1.501 to 2 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0020', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(1.501, 164, 52, 145200000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(2);
      expect(fixture.state.angleTest).assertEqual('2°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(1.501);
      expect(event.data[1]).assertEqual(164);
      expect(event.data[2]).assertEqual(52);
      expect(event.timestamp).assertEqual(145200000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(2);
      expect(fixture.state.angleTest).assertEqual('2°');
      fixture.emit(1.501, -164, -52);
      expect(fixture.state.angle).assertEqual(2);
      expect(fixture.state.angleTest).assertEqual('2°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_2100
     * @tc.name testCompassPipelinePart51Test0021
     * @tc.desc Verify onSensor rounds yaw 2.501 to 3 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0021', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(2.501, -180, 65, 145400000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(3);
      expect(fixture.state.angleTest).assertEqual('3°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(2.501);
      expect(event.data[1]).assertEqual(-180);
      expect(event.data[2]).assertEqual(65);
      expect(event.timestamp).assertEqual(145400000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(3);
      expect(fixture.state.angleTest).assertEqual('3°');
      fixture.emit(2.501, 180, -65);
      expect(fixture.state.angle).assertEqual(3);
      expect(fixture.state.angleTest).assertEqual('3°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_2200
     * @tc.name testCompassPipelinePart51Test0022
     * @tc.desc Verify onSensor rounds yaw 3.501 to 4 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0022', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(3.501, -163, 78, 145600000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(4);
      expect(fixture.state.angleTest).assertEqual('4°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(3.501);
      expect(event.data[1]).assertEqual(-163);
      expect(event.data[2]).assertEqual(78);
      expect(event.timestamp).assertEqual(145600000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(4);
      expect(fixture.state.angleTest).assertEqual('4°');
      fixture.emit(3.501, 163, -78);
      expect(fixture.state.angle).assertEqual(4);
      expect(fixture.state.angleTest).assertEqual('4°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_2300
     * @tc.name testCompassPipelinePart51Test0023
     * @tc.desc Verify onSensor rounds yaw 4.501 to 5 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0023', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(4.501, -146, -90, 145800000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(5);
      expect(fixture.state.angleTest).assertEqual('5°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(4.501);
      expect(event.data[1]).assertEqual(-146);
      expect(event.data[2]).assertEqual(-90);
      expect(event.timestamp).assertEqual(145800000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(5);
      expect(fixture.state.angleTest).assertEqual('5°');
      fixture.emit(4.501, 146, 90);
      expect(fixture.state.angle).assertEqual(5);
      expect(fixture.state.angleTest).assertEqual('5°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_51_2400
     * @tc.name testCompassPipelinePart51Test0024
     * @tc.desc Verify onSensor rounds yaw 5.501 to 6 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart51Test0024', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(5.501, -129, -77, 146000000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(6);
      expect(fixture.state.angleTest).assertEqual('6°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(5.501);
      expect(event.data[1]).assertEqual(-129);
      expect(event.data[2]).assertEqual(-77);
      expect(event.timestamp).assertEqual(146000000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(6);
      expect(fixture.state.angleTest).assertEqual('6°');
      fixture.emit(5.501, 129, 77);
      expect(fixture.state.angle).assertEqual(6);
      expect(fixture.state.angleTest).assertEqual('6°');
      expect(fixture.state.isLand).assertEqual(true);
    });

  });
}
