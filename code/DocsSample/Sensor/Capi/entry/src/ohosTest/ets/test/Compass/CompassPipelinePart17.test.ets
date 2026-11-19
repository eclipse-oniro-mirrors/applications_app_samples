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

export default function CompassPipelinePart17(): void {
  describe('CompassPipelinePart17', () => {
    let fixture: CompassFixture;
    beforeAll(() => {
      hilog.info(0xF811, 'SensorTest', '%{public}s', 'CompassPipelinePart17 begin');
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
      hilog.info(0xF811, 'SensorTest', '%{public}s', 'CompassPipelinePart17 end');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_0100
     * @tc.name testCompassPipelinePart17Test0001
     * @tc.desc Verify onSensor rounds yaw 201.499 to 201 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0001', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(201.499, -12, -11, 41200000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(201);
      expect(fixture.state.angleTest).assertEqual('201°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(201.499);
      expect(event.data[1]).assertEqual(-12);
      expect(event.data[2]).assertEqual(-11);
      expect(event.timestamp).assertEqual(41200000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(201);
      expect(fixture.state.angleTest).assertEqual('201°');
      fixture.emit(201.499, 12, 11);
      expect(fixture.state.angle).assertEqual(201);
      expect(fixture.state.angleTest).assertEqual('201°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_0200
     * @tc.name testCompassPipelinePart17Test0002
     * @tc.desc Verify onSensor rounds yaw 202.499 to 202 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0002', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(202.499, 5, 2, 41400000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(202);
      expect(fixture.state.angleTest).assertEqual('202°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(202.499);
      expect(event.data[1]).assertEqual(5);
      expect(event.data[2]).assertEqual(2);
      expect(event.timestamp).assertEqual(41400000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(202);
      expect(fixture.state.angleTest).assertEqual('202°');
      fixture.emit(202.499, -5, -2);
      expect(fixture.state.angle).assertEqual(202);
      expect(fixture.state.angleTest).assertEqual('202°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_0300
     * @tc.name testCompassPipelinePart17Test0003
     * @tc.desc Verify onSensor rounds yaw 203.499 to 203 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0003', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(203.499, 22, 15, 41600000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(203);
      expect(fixture.state.angleTest).assertEqual('203°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(203.499);
      expect(event.data[1]).assertEqual(22);
      expect(event.data[2]).assertEqual(15);
      expect(event.timestamp).assertEqual(41600000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(203);
      expect(fixture.state.angleTest).assertEqual('203°');
      fixture.emit(203.499, -22, -15);
      expect(fixture.state.angle).assertEqual(203);
      expect(fixture.state.angleTest).assertEqual('203°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_0400
     * @tc.name testCompassPipelinePart17Test0004
     * @tc.desc Verify onSensor rounds yaw 204.499 to 204 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0004', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(204.499, 39, 28, 41800000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(204);
      expect(fixture.state.angleTest).assertEqual('204°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(204.499);
      expect(event.data[1]).assertEqual(39);
      expect(event.data[2]).assertEqual(28);
      expect(event.timestamp).assertEqual(41800000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(204);
      expect(fixture.state.angleTest).assertEqual('204°');
      fixture.emit(204.499, -39, -28);
      expect(fixture.state.angle).assertEqual(204);
      expect(fixture.state.angleTest).assertEqual('204°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_0500
     * @tc.name testCompassPipelinePart17Test0005
     * @tc.desc Verify onSensor rounds yaw 205.499 to 205 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0005', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(205.499, 56, 41, 42000000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(205);
      expect(fixture.state.angleTest).assertEqual('205°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(205.499);
      expect(event.data[1]).assertEqual(56);
      expect(event.data[2]).assertEqual(41);
      expect(event.timestamp).assertEqual(42000000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(205);
      expect(fixture.state.angleTest).assertEqual('205°');
      fixture.emit(205.499, -56, -41);
      expect(fixture.state.angle).assertEqual(205);
      expect(fixture.state.angleTest).assertEqual('205°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_0600
     * @tc.name testCompassPipelinePart17Test0006
     * @tc.desc Verify onSensor rounds yaw 206.499 to 206 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0006', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(206.499, 73, 54, 42200000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(206);
      expect(fixture.state.angleTest).assertEqual('206°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(206.499);
      expect(event.data[1]).assertEqual(73);
      expect(event.data[2]).assertEqual(54);
      expect(event.timestamp).assertEqual(42200000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(206);
      expect(fixture.state.angleTest).assertEqual('206°');
      fixture.emit(206.499, -73, -54);
      expect(fixture.state.angle).assertEqual(206);
      expect(fixture.state.angleTest).assertEqual('206°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_0700
     * @tc.name testCompassPipelinePart17Test0007
     * @tc.desc Verify onSensor rounds yaw 207.499 to 207 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0007', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(207.499, 90, 67, 42400000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(207);
      expect(fixture.state.angleTest).assertEqual('207°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(207.499);
      expect(event.data[1]).assertEqual(90);
      expect(event.data[2]).assertEqual(67);
      expect(event.timestamp).assertEqual(42400000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(207);
      expect(fixture.state.angleTest).assertEqual('207°');
      fixture.emit(207.499, -90, -67);
      expect(fixture.state.angle).assertEqual(207);
      expect(fixture.state.angleTest).assertEqual('207°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_0800
     * @tc.name testCompassPipelinePart17Test0008
     * @tc.desc Verify onSensor rounds yaw 208.499 to 208 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0008', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(208.499, 107, 80, 42600000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(208);
      expect(fixture.state.angleTest).assertEqual('208°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(208.499);
      expect(event.data[1]).assertEqual(107);
      expect(event.data[2]).assertEqual(80);
      expect(event.timestamp).assertEqual(42600000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(208);
      expect(fixture.state.angleTest).assertEqual('208°');
      fixture.emit(208.499, -107, -80);
      expect(fixture.state.angle).assertEqual(208);
      expect(fixture.state.angleTest).assertEqual('208°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_0900
     * @tc.name testCompassPipelinePart17Test0009
     * @tc.desc Verify onSensor rounds yaw 209.499 to 209 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0009', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(209.499, 124, -88, 42800000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(209);
      expect(fixture.state.angleTest).assertEqual('209°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(209.499);
      expect(event.data[1]).assertEqual(124);
      expect(event.data[2]).assertEqual(-88);
      expect(event.timestamp).assertEqual(42800000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(209);
      expect(fixture.state.angleTest).assertEqual('209°');
      fixture.emit(209.499, -124, 88);
      expect(fixture.state.angle).assertEqual(209);
      expect(fixture.state.angleTest).assertEqual('209°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_1000
     * @tc.name testCompassPipelinePart17Test0010
     * @tc.desc Verify onSensor rounds yaw 210.499 to 210 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0010', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(210.499, 141, -75, 43000000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(210);
      expect(fixture.state.angleTest).assertEqual('210°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(210.499);
      expect(event.data[1]).assertEqual(141);
      expect(event.data[2]).assertEqual(-75);
      expect(event.timestamp).assertEqual(43000000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(210);
      expect(fixture.state.angleTest).assertEqual('210°');
      fixture.emit(210.499, -141, 75);
      expect(fixture.state.angle).assertEqual(210);
      expect(fixture.state.angleTest).assertEqual('210°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_1100
     * @tc.name testCompassPipelinePart17Test0011
     * @tc.desc Verify onSensor rounds yaw 211.499 to 211 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0011', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(211.499, 158, -62, 43200000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(211);
      expect(fixture.state.angleTest).assertEqual('211°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(211.499);
      expect(event.data[1]).assertEqual(158);
      expect(event.data[2]).assertEqual(-62);
      expect(event.timestamp).assertEqual(43200000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(211);
      expect(fixture.state.angleTest).assertEqual('211°');
      fixture.emit(211.499, -158, 62);
      expect(fixture.state.angle).assertEqual(211);
      expect(fixture.state.angleTest).assertEqual('211°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_1200
     * @tc.name testCompassPipelinePart17Test0012
     * @tc.desc Verify onSensor rounds yaw 212.499 to 212 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0012', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(212.499, 175, -49, 43400000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(212);
      expect(fixture.state.angleTest).assertEqual('212°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(212.499);
      expect(event.data[1]).assertEqual(175);
      expect(event.data[2]).assertEqual(-49);
      expect(event.timestamp).assertEqual(43400000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(212);
      expect(fixture.state.angleTest).assertEqual('212°');
      fixture.emit(212.499, -175, 49);
      expect(fixture.state.angle).assertEqual(212);
      expect(fixture.state.angleTest).assertEqual('212°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_1300
     * @tc.name testCompassPipelinePart17Test0013
     * @tc.desc Verify onSensor rounds yaw 213.499 to 213 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0013', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(213.499, -169, -36, 43600000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(213);
      expect(fixture.state.angleTest).assertEqual('213°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(213.499);
      expect(event.data[1]).assertEqual(-169);
      expect(event.data[2]).assertEqual(-36);
      expect(event.timestamp).assertEqual(43600000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(213);
      expect(fixture.state.angleTest).assertEqual('213°');
      fixture.emit(213.499, 169, 36);
      expect(fixture.state.angle).assertEqual(213);
      expect(fixture.state.angleTest).assertEqual('213°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_1400
     * @tc.name testCompassPipelinePart17Test0014
     * @tc.desc Verify onSensor rounds yaw 214.499 to 214 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0014', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(214.499, -152, -23, 43800000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(214);
      expect(fixture.state.angleTest).assertEqual('214°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(214.499);
      expect(event.data[1]).assertEqual(-152);
      expect(event.data[2]).assertEqual(-23);
      expect(event.timestamp).assertEqual(43800000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(214);
      expect(fixture.state.angleTest).assertEqual('214°');
      fixture.emit(214.499, 152, 23);
      expect(fixture.state.angle).assertEqual(214);
      expect(fixture.state.angleTest).assertEqual('214°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_1500
     * @tc.name testCompassPipelinePart17Test0015
     * @tc.desc Verify onSensor rounds yaw 215.499 to 215 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0015', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(215.499, -135, -10, 44000000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(215);
      expect(fixture.state.angleTest).assertEqual('215°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(215.499);
      expect(event.data[1]).assertEqual(-135);
      expect(event.data[2]).assertEqual(-10);
      expect(event.timestamp).assertEqual(44000000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(215);
      expect(fixture.state.angleTest).assertEqual('215°');
      fixture.emit(215.499, 135, 10);
      expect(fixture.state.angle).assertEqual(215);
      expect(fixture.state.angleTest).assertEqual('215°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_1600
     * @tc.name testCompassPipelinePart17Test0016
     * @tc.desc Verify onSensor rounds yaw 216.499 to 216 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0016', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(216.499, -118, 3, 44200000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(216);
      expect(fixture.state.angleTest).assertEqual('216°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(216.499);
      expect(event.data[1]).assertEqual(-118);
      expect(event.data[2]).assertEqual(3);
      expect(event.timestamp).assertEqual(44200000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(216);
      expect(fixture.state.angleTest).assertEqual('216°');
      fixture.emit(216.499, 118, -3);
      expect(fixture.state.angle).assertEqual(216);
      expect(fixture.state.angleTest).assertEqual('216°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_1700
     * @tc.name testCompassPipelinePart17Test0017
     * @tc.desc Verify onSensor rounds yaw 217.499 to 217 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0017', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(217.499, -101, 16, 44400000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(217);
      expect(fixture.state.angleTest).assertEqual('217°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(217.499);
      expect(event.data[1]).assertEqual(-101);
      expect(event.data[2]).assertEqual(16);
      expect(event.timestamp).assertEqual(44400000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(217);
      expect(fixture.state.angleTest).assertEqual('217°');
      fixture.emit(217.499, 101, -16);
      expect(fixture.state.angle).assertEqual(217);
      expect(fixture.state.angleTest).assertEqual('217°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_1800
     * @tc.name testCompassPipelinePart17Test0018
     * @tc.desc Verify onSensor rounds yaw 218.499 to 218 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0018', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(218.499, -84, 29, 44600000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(218);
      expect(fixture.state.angleTest).assertEqual('218°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(218.499);
      expect(event.data[1]).assertEqual(-84);
      expect(event.data[2]).assertEqual(29);
      expect(event.timestamp).assertEqual(44600000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(218);
      expect(fixture.state.angleTest).assertEqual('218°');
      fixture.emit(218.499, 84, -29);
      expect(fixture.state.angle).assertEqual(218);
      expect(fixture.state.angleTest).assertEqual('218°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_1900
     * @tc.name testCompassPipelinePart17Test0019
     * @tc.desc Verify onSensor rounds yaw 219.499 to 219 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0019', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(219.499, -67, 42, 44800000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(219);
      expect(fixture.state.angleTest).assertEqual('219°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(219.499);
      expect(event.data[1]).assertEqual(-67);
      expect(event.data[2]).assertEqual(42);
      expect(event.timestamp).assertEqual(44800000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(219);
      expect(fixture.state.angleTest).assertEqual('219°');
      fixture.emit(219.499, 67, -42);
      expect(fixture.state.angle).assertEqual(219);
      expect(fixture.state.angleTest).assertEqual('219°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_2000
     * @tc.name testCompassPipelinePart17Test0020
     * @tc.desc Verify onSensor rounds yaw 220.499 to 220 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0020', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(220.499, -50, 55, 45000000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(220);
      expect(fixture.state.angleTest).assertEqual('220°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(220.499);
      expect(event.data[1]).assertEqual(-50);
      expect(event.data[2]).assertEqual(55);
      expect(event.timestamp).assertEqual(45000000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(220);
      expect(fixture.state.angleTest).assertEqual('220°');
      fixture.emit(220.499, 50, -55);
      expect(fixture.state.angle).assertEqual(220);
      expect(fixture.state.angleTest).assertEqual('220°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_2100
     * @tc.name testCompassPipelinePart17Test0021
     * @tc.desc Verify onSensor rounds yaw 221.499 to 221 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0021', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(221.499, -33, 68, 45200000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(221);
      expect(fixture.state.angleTest).assertEqual('221°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(221.499);
      expect(event.data[1]).assertEqual(-33);
      expect(event.data[2]).assertEqual(68);
      expect(event.timestamp).assertEqual(45200000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(221);
      expect(fixture.state.angleTest).assertEqual('221°');
      fixture.emit(221.499, 33, -68);
      expect(fixture.state.angle).assertEqual(221);
      expect(fixture.state.angleTest).assertEqual('221°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_2200
     * @tc.name testCompassPipelinePart17Test0022
     * @tc.desc Verify onSensor rounds yaw 222.499 to 222 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0022', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(222.499, -16, 81, 45400000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(222);
      expect(fixture.state.angleTest).assertEqual('222°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(222.499);
      expect(event.data[1]).assertEqual(-16);
      expect(event.data[2]).assertEqual(81);
      expect(event.timestamp).assertEqual(45400000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(222);
      expect(fixture.state.angleTest).assertEqual('222°');
      fixture.emit(222.499, 16, -81);
      expect(fixture.state.angle).assertEqual(222);
      expect(fixture.state.angleTest).assertEqual('222°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_2300
     * @tc.name testCompassPipelinePart17Test0023
     * @tc.desc Verify onSensor rounds yaw 223.499 to 223 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0023', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(223.499, 1, -87, 45600000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(223);
      expect(fixture.state.angleTest).assertEqual('223°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(223.499);
      expect(event.data[1]).assertEqual(1);
      expect(event.data[2]).assertEqual(-87);
      expect(event.timestamp).assertEqual(45600000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(223);
      expect(fixture.state.angleTest).assertEqual('223°');
      fixture.emit(223.499, -1, 87);
      expect(fixture.state.angle).assertEqual(223);
      expect(fixture.state.angleTest).assertEqual('223°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_2400
     * @tc.name testCompassPipelinePart17Test0024
     * @tc.desc Verify onSensor rounds yaw 224.499 to 224 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0024', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(224.499, 18, -74, 45800000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(224);
      expect(fixture.state.angleTest).assertEqual('224°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(224.499);
      expect(event.data[1]).assertEqual(18);
      expect(event.data[2]).assertEqual(-74);
      expect(event.timestamp).assertEqual(45800000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(224);
      expect(fixture.state.angleTest).assertEqual('224°');
      fixture.emit(224.499, -18, 74);
      expect(fixture.state.angle).assertEqual(224);
      expect(fixture.state.angleTest).assertEqual('224°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_2500
     * @tc.name testCompassPipelinePart17Test0025
     * @tc.desc Verify onSensor rounds yaw 225.499 to 225 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0025', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(225.499, 35, -61, 46000000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(225);
      expect(fixture.state.angleTest).assertEqual('225°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(225.499);
      expect(event.data[1]).assertEqual(35);
      expect(event.data[2]).assertEqual(-61);
      expect(event.timestamp).assertEqual(46000000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(225);
      expect(fixture.state.angleTest).assertEqual('225°');
      fixture.emit(225.499, -35, 61);
      expect(fixture.state.angle).assertEqual(225);
      expect(fixture.state.angleTest).assertEqual('225°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_2600
     * @tc.name testCompassPipelinePart17Test0026
     * @tc.desc Verify onSensor rounds yaw 226.499 to 226 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0026', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(226.499, 52, -48, 46200000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(226);
      expect(fixture.state.angleTest).assertEqual('226°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(226.499);
      expect(event.data[1]).assertEqual(52);
      expect(event.data[2]).assertEqual(-48);
      expect(event.timestamp).assertEqual(46200000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(226);
      expect(fixture.state.angleTest).assertEqual('226°');
      fixture.emit(226.499, -52, 48);
      expect(fixture.state.angle).assertEqual(226);
      expect(fixture.state.angleTest).assertEqual('226°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_2700
     * @tc.name testCompassPipelinePart17Test0027
     * @tc.desc Verify onSensor rounds yaw 227.499 to 227 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0027', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(227.499, 69, -35, 46400000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(227);
      expect(fixture.state.angleTest).assertEqual('227°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(227.499);
      expect(event.data[1]).assertEqual(69);
      expect(event.data[2]).assertEqual(-35);
      expect(event.timestamp).assertEqual(46400000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(227);
      expect(fixture.state.angleTest).assertEqual('227°');
      fixture.emit(227.499, -69, 35);
      expect(fixture.state.angle).assertEqual(227);
      expect(fixture.state.angleTest).assertEqual('227°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_2800
     * @tc.name testCompassPipelinePart17Test0028
     * @tc.desc Verify onSensor rounds yaw 228.499 to 228 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0028', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(228.499, 86, -22, 46600000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(228);
      expect(fixture.state.angleTest).assertEqual('228°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(228.499);
      expect(event.data[1]).assertEqual(86);
      expect(event.data[2]).assertEqual(-22);
      expect(event.timestamp).assertEqual(46600000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(228);
      expect(fixture.state.angleTest).assertEqual('228°');
      fixture.emit(228.499, -86, 22);
      expect(fixture.state.angle).assertEqual(228);
      expect(fixture.state.angleTest).assertEqual('228°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_2900
     * @tc.name testCompassPipelinePart17Test0029
     * @tc.desc Verify onSensor rounds yaw 229.499 to 229 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0029', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(229.499, 103, -9, 46800000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(229);
      expect(fixture.state.angleTest).assertEqual('229°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(229.499);
      expect(event.data[1]).assertEqual(103);
      expect(event.data[2]).assertEqual(-9);
      expect(event.timestamp).assertEqual(46800000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(229);
      expect(fixture.state.angleTest).assertEqual('229°');
      fixture.emit(229.499, -103, 9);
      expect(fixture.state.angle).assertEqual(229);
      expect(fixture.state.angleTest).assertEqual('229°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_17_3000
     * @tc.name testCompassPipelinePart17Test0030
     * @tc.desc Verify onSensor rounds yaw 230.499 to 230 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart17Test0030', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(230.499, 120, 4, 47000000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(230);
      expect(fixture.state.angleTest).assertEqual('230°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(230.499);
      expect(event.data[1]).assertEqual(120);
      expect(event.data[2]).assertEqual(4);
      expect(event.timestamp).assertEqual(47000000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(230);
      expect(fixture.state.angleTest).assertEqual('230°');
      fixture.emit(230.499, -120, -4);
      expect(fixture.state.angle).assertEqual(230);
      expect(fixture.state.angleTest).assertEqual('230°');
      expect(fixture.state.isLand).assertEqual(false);
    });

  });
}
