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

export default function CompassPipelinePart54(): void {
  describe('CompassPipelinePart54', () => {
    let fixture: CompassFixture;
    beforeAll(() => {
      hilog.info(0xF811, 'SensorTest', '%{public}s', 'CompassPipelinePart54 begin');
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
      hilog.info(0xF811, 'SensorTest', '%{public}s', 'CompassPipelinePart54 end');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_0100
     * @tc.name testCompassPipelinePart54Test0001
     * @tc.desc Verify onSensor rounds yaw 59.501 to 60 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0001', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(59.501, 67, 82, 156800000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(60);
      expect(fixture.state.angleTest).assertEqual('60°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(59.501);
      expect(event.data[1]).assertEqual(67);
      expect(event.data[2]).assertEqual(82);
      expect(event.timestamp).assertEqual(156800000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(60);
      expect(fixture.state.angleTest).assertEqual('60°');
      fixture.emit(59.501, -67, -82);
      expect(fixture.state.angle).assertEqual(60);
      expect(fixture.state.angleTest).assertEqual('60°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_0200
     * @tc.name testCompassPipelinePart54Test0002
     * @tc.desc Verify onSensor rounds yaw 60.501 to 61 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0002', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(60.501, 84, -86, 157000000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(61);
      expect(fixture.state.angleTest).assertEqual('61°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(60.501);
      expect(event.data[1]).assertEqual(84);
      expect(event.data[2]).assertEqual(-86);
      expect(event.timestamp).assertEqual(157000000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(61);
      expect(fixture.state.angleTest).assertEqual('61°');
      fixture.emit(60.501, -84, 86);
      expect(fixture.state.angle).assertEqual(61);
      expect(fixture.state.angleTest).assertEqual('61°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_0300
     * @tc.name testCompassPipelinePart54Test0003
     * @tc.desc Verify onSensor rounds yaw 61.501 to 62 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0003', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(61.501, 101, -73, 157200000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(62);
      expect(fixture.state.angleTest).assertEqual('62°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(61.501);
      expect(event.data[1]).assertEqual(101);
      expect(event.data[2]).assertEqual(-73);
      expect(event.timestamp).assertEqual(157200000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(62);
      expect(fixture.state.angleTest).assertEqual('62°');
      fixture.emit(61.501, -101, 73);
      expect(fixture.state.angle).assertEqual(62);
      expect(fixture.state.angleTest).assertEqual('62°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_0400
     * @tc.name testCompassPipelinePart54Test0004
     * @tc.desc Verify onSensor rounds yaw 62.501 to 63 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0004', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(62.501, 118, -60, 157400000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(63);
      expect(fixture.state.angleTest).assertEqual('63°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(62.501);
      expect(event.data[1]).assertEqual(118);
      expect(event.data[2]).assertEqual(-60);
      expect(event.timestamp).assertEqual(157400000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(63);
      expect(fixture.state.angleTest).assertEqual('63°');
      fixture.emit(62.501, -118, 60);
      expect(fixture.state.angle).assertEqual(63);
      expect(fixture.state.angleTest).assertEqual('63°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_0500
     * @tc.name testCompassPipelinePart54Test0005
     * @tc.desc Verify onSensor rounds yaw 63.501 to 64 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0005', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(63.501, 135, -47, 157600000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(64);
      expect(fixture.state.angleTest).assertEqual('64°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(63.501);
      expect(event.data[1]).assertEqual(135);
      expect(event.data[2]).assertEqual(-47);
      expect(event.timestamp).assertEqual(157600000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(64);
      expect(fixture.state.angleTest).assertEqual('64°');
      fixture.emit(63.501, -135, 47);
      expect(fixture.state.angle).assertEqual(64);
      expect(fixture.state.angleTest).assertEqual('64°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_0600
     * @tc.name testCompassPipelinePart54Test0006
     * @tc.desc Verify onSensor rounds yaw 64.501 to 65 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0006', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(64.501, 152, -34, 157800000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(65);
      expect(fixture.state.angleTest).assertEqual('65°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(64.501);
      expect(event.data[1]).assertEqual(152);
      expect(event.data[2]).assertEqual(-34);
      expect(event.timestamp).assertEqual(157800000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(65);
      expect(fixture.state.angleTest).assertEqual('65°');
      fixture.emit(64.501, -152, 34);
      expect(fixture.state.angle).assertEqual(65);
      expect(fixture.state.angleTest).assertEqual('65°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_0700
     * @tc.name testCompassPipelinePart54Test0007
     * @tc.desc Verify onSensor rounds yaw 65.501 to 66 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0007', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(65.501, 169, -21, 158000000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(66);
      expect(fixture.state.angleTest).assertEqual('66°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(65.501);
      expect(event.data[1]).assertEqual(169);
      expect(event.data[2]).assertEqual(-21);
      expect(event.timestamp).assertEqual(158000000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(66);
      expect(fixture.state.angleTest).assertEqual('66°');
      fixture.emit(65.501, -169, 21);
      expect(fixture.state.angle).assertEqual(66);
      expect(fixture.state.angleTest).assertEqual('66°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_0800
     * @tc.name testCompassPipelinePart54Test0008
     * @tc.desc Verify onSensor rounds yaw 66.501 to 67 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0008', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(66.501, -175, -8, 158200000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(67);
      expect(fixture.state.angleTest).assertEqual('67°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(66.501);
      expect(event.data[1]).assertEqual(-175);
      expect(event.data[2]).assertEqual(-8);
      expect(event.timestamp).assertEqual(158200000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(67);
      expect(fixture.state.angleTest).assertEqual('67°');
      fixture.emit(66.501, 175, 8);
      expect(fixture.state.angle).assertEqual(67);
      expect(fixture.state.angleTest).assertEqual('67°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_0900
     * @tc.name testCompassPipelinePart54Test0009
     * @tc.desc Verify onSensor rounds yaw 67.501 to 68 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0009', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(67.501, -158, 5, 158400000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(68);
      expect(fixture.state.angleTest).assertEqual('68°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(67.501);
      expect(event.data[1]).assertEqual(-158);
      expect(event.data[2]).assertEqual(5);
      expect(event.timestamp).assertEqual(158400000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(68);
      expect(fixture.state.angleTest).assertEqual('68°');
      fixture.emit(67.501, 158, -5);
      expect(fixture.state.angle).assertEqual(68);
      expect(fixture.state.angleTest).assertEqual('68°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_1000
     * @tc.name testCompassPipelinePart54Test0010
     * @tc.desc Verify onSensor rounds yaw 68.501 to 69 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0010', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(68.501, -141, 18, 158600000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(69);
      expect(fixture.state.angleTest).assertEqual('69°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(68.501);
      expect(event.data[1]).assertEqual(-141);
      expect(event.data[2]).assertEqual(18);
      expect(event.timestamp).assertEqual(158600000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(69);
      expect(fixture.state.angleTest).assertEqual('69°');
      fixture.emit(68.501, 141, -18);
      expect(fixture.state.angle).assertEqual(69);
      expect(fixture.state.angleTest).assertEqual('69°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_1100
     * @tc.name testCompassPipelinePart54Test0011
     * @tc.desc Verify onSensor rounds yaw 69.501 to 70 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0011', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(69.501, -124, 31, 158800000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(70);
      expect(fixture.state.angleTest).assertEqual('70°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(69.501);
      expect(event.data[1]).assertEqual(-124);
      expect(event.data[2]).assertEqual(31);
      expect(event.timestamp).assertEqual(158800000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(70);
      expect(fixture.state.angleTest).assertEqual('70°');
      fixture.emit(69.501, 124, -31);
      expect(fixture.state.angle).assertEqual(70);
      expect(fixture.state.angleTest).assertEqual('70°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_1200
     * @tc.name testCompassPipelinePart54Test0012
     * @tc.desc Verify onSensor rounds yaw 70.501 to 71 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0012', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(70.501, -107, 44, 159000000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(71);
      expect(fixture.state.angleTest).assertEqual('71°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(70.501);
      expect(event.data[1]).assertEqual(-107);
      expect(event.data[2]).assertEqual(44);
      expect(event.timestamp).assertEqual(159000000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(71);
      expect(fixture.state.angleTest).assertEqual('71°');
      fixture.emit(70.501, 107, -44);
      expect(fixture.state.angle).assertEqual(71);
      expect(fixture.state.angleTest).assertEqual('71°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_1300
     * @tc.name testCompassPipelinePart54Test0013
     * @tc.desc Verify onSensor rounds yaw 71.501 to 72 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0013', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(71.501, -90, 57, 159200000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(72);
      expect(fixture.state.angleTest).assertEqual('72°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(71.501);
      expect(event.data[1]).assertEqual(-90);
      expect(event.data[2]).assertEqual(57);
      expect(event.timestamp).assertEqual(159200000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(72);
      expect(fixture.state.angleTest).assertEqual('72°');
      fixture.emit(71.501, 90, -57);
      expect(fixture.state.angle).assertEqual(72);
      expect(fixture.state.angleTest).assertEqual('72°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_1400
     * @tc.name testCompassPipelinePart54Test0014
     * @tc.desc Verify onSensor rounds yaw 72.501 to 73 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0014', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(72.501, -73, 70, 159400000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(73);
      expect(fixture.state.angleTest).assertEqual('73°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(72.501);
      expect(event.data[1]).assertEqual(-73);
      expect(event.data[2]).assertEqual(70);
      expect(event.timestamp).assertEqual(159400000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(73);
      expect(fixture.state.angleTest).assertEqual('73°');
      fixture.emit(72.501, 73, -70);
      expect(fixture.state.angle).assertEqual(73);
      expect(fixture.state.angleTest).assertEqual('73°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_1500
     * @tc.name testCompassPipelinePart54Test0015
     * @tc.desc Verify onSensor rounds yaw 73.501 to 74 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0015', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(73.501, -56, 83, 159600000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(74);
      expect(fixture.state.angleTest).assertEqual('74°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(73.501);
      expect(event.data[1]).assertEqual(-56);
      expect(event.data[2]).assertEqual(83);
      expect(event.timestamp).assertEqual(159600000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(74);
      expect(fixture.state.angleTest).assertEqual('74°');
      fixture.emit(73.501, 56, -83);
      expect(fixture.state.angle).assertEqual(74);
      expect(fixture.state.angleTest).assertEqual('74°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_1600
     * @tc.name testCompassPipelinePart54Test0016
     * @tc.desc Verify onSensor rounds yaw 74.501 to 75 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0016', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(74.501, -39, -85, 159800000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(75);
      expect(fixture.state.angleTest).assertEqual('75°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(74.501);
      expect(event.data[1]).assertEqual(-39);
      expect(event.data[2]).assertEqual(-85);
      expect(event.timestamp).assertEqual(159800000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(75);
      expect(fixture.state.angleTest).assertEqual('75°');
      fixture.emit(74.501, 39, 85);
      expect(fixture.state.angle).assertEqual(75);
      expect(fixture.state.angleTest).assertEqual('75°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_1700
     * @tc.name testCompassPipelinePart54Test0017
     * @tc.desc Verify onSensor rounds yaw 75.501 to 76 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0017', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(75.501, -22, -72, 160000000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(76);
      expect(fixture.state.angleTest).assertEqual('76°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(75.501);
      expect(event.data[1]).assertEqual(-22);
      expect(event.data[2]).assertEqual(-72);
      expect(event.timestamp).assertEqual(160000000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(76);
      expect(fixture.state.angleTest).assertEqual('76°');
      fixture.emit(75.501, 22, 72);
      expect(fixture.state.angle).assertEqual(76);
      expect(fixture.state.angleTest).assertEqual('76°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_1800
     * @tc.name testCompassPipelinePart54Test0018
     * @tc.desc Verify onSensor rounds yaw 76.501 to 77 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0018', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(76.501, -5, -59, 160200000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(77);
      expect(fixture.state.angleTest).assertEqual('77°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(76.501);
      expect(event.data[1]).assertEqual(-5);
      expect(event.data[2]).assertEqual(-59);
      expect(event.timestamp).assertEqual(160200000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(77);
      expect(fixture.state.angleTest).assertEqual('77°');
      fixture.emit(76.501, 5, 59);
      expect(fixture.state.angle).assertEqual(77);
      expect(fixture.state.angleTest).assertEqual('77°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_1900
     * @tc.name testCompassPipelinePart54Test0019
     * @tc.desc Verify onSensor rounds yaw 77.501 to 78 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0019', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(77.501, 12, -46, 160400000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(78);
      expect(fixture.state.angleTest).assertEqual('78°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(77.501);
      expect(event.data[1]).assertEqual(12);
      expect(event.data[2]).assertEqual(-46);
      expect(event.timestamp).assertEqual(160400000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(78);
      expect(fixture.state.angleTest).assertEqual('78°');
      fixture.emit(77.501, -12, 46);
      expect(fixture.state.angle).assertEqual(78);
      expect(fixture.state.angleTest).assertEqual('78°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_2000
     * @tc.name testCompassPipelinePart54Test0020
     * @tc.desc Verify onSensor rounds yaw 78.501 to 79 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0020', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(78.501, 29, -33, 160600000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(79);
      expect(fixture.state.angleTest).assertEqual('79°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(78.501);
      expect(event.data[1]).assertEqual(29);
      expect(event.data[2]).assertEqual(-33);
      expect(event.timestamp).assertEqual(160600000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(79);
      expect(fixture.state.angleTest).assertEqual('79°');
      fixture.emit(78.501, -29, 33);
      expect(fixture.state.angle).assertEqual(79);
      expect(fixture.state.angleTest).assertEqual('79°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_2100
     * @tc.name testCompassPipelinePart54Test0021
     * @tc.desc Verify onSensor rounds yaw 79.501 to 80 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0021', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(79.501, 46, -20, 160800000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(80);
      expect(fixture.state.angleTest).assertEqual('80°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(79.501);
      expect(event.data[1]).assertEqual(46);
      expect(event.data[2]).assertEqual(-20);
      expect(event.timestamp).assertEqual(160800000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(80);
      expect(fixture.state.angleTest).assertEqual('80°');
      fixture.emit(79.501, -46, 20);
      expect(fixture.state.angle).assertEqual(80);
      expect(fixture.state.angleTest).assertEqual('80°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_2200
     * @tc.name testCompassPipelinePart54Test0022
     * @tc.desc Verify onSensor rounds yaw 80.501 to 81 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0022', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(80.501, 63, -7, 161000000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(81);
      expect(fixture.state.angleTest).assertEqual('81°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(80.501);
      expect(event.data[1]).assertEqual(63);
      expect(event.data[2]).assertEqual(-7);
      expect(event.timestamp).assertEqual(161000000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(81);
      expect(fixture.state.angleTest).assertEqual('81°');
      fixture.emit(80.501, -63, 7);
      expect(fixture.state.angle).assertEqual(81);
      expect(fixture.state.angleTest).assertEqual('81°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_2300
     * @tc.name testCompassPipelinePart54Test0023
     * @tc.desc Verify onSensor rounds yaw 81.501 to 82 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0023', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(81.501, 80, 6, 161200000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(82);
      expect(fixture.state.angleTest).assertEqual('82°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(81.501);
      expect(event.data[1]).assertEqual(80);
      expect(event.data[2]).assertEqual(6);
      expect(event.timestamp).assertEqual(161200000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(82);
      expect(fixture.state.angleTest).assertEqual('82°');
      fixture.emit(81.501, -80, -6);
      expect(fixture.state.angle).assertEqual(82);
      expect(fixture.state.angleTest).assertEqual('82°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_2400
     * @tc.name testCompassPipelinePart54Test0024
     * @tc.desc Verify onSensor rounds yaw 82.501 to 83 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0024', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(82.501, 97, 19, 161400000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(83);
      expect(fixture.state.angleTest).assertEqual('83°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(82.501);
      expect(event.data[1]).assertEqual(97);
      expect(event.data[2]).assertEqual(19);
      expect(event.timestamp).assertEqual(161400000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(83);
      expect(fixture.state.angleTest).assertEqual('83°');
      fixture.emit(82.501, -97, -19);
      expect(fixture.state.angle).assertEqual(83);
      expect(fixture.state.angleTest).assertEqual('83°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_54_2500
     * @tc.name testCompassPipelinePart54Test0025
     * @tc.desc Verify onSensor rounds yaw 83.501 to 84 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart54Test0025', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(83.501, 114, 32, 161600000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(84);
      expect(fixture.state.angleTest).assertEqual('84°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(83.501);
      expect(event.data[1]).assertEqual(114);
      expect(event.data[2]).assertEqual(32);
      expect(event.timestamp).assertEqual(161600000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(84);
      expect(fixture.state.angleTest).assertEqual('84°');
      fixture.emit(83.501, -114, -32);
      expect(fixture.state.angle).assertEqual(84);
      expect(fixture.state.angleTest).assertEqual('84°');
      expect(fixture.state.isLand).assertEqual(true);
    });

  });
}
