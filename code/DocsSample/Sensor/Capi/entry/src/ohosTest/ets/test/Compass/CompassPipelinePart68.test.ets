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

export default function CompassPipelinePart68(): void {
  describe('CompassPipelinePart68', () => {
    let fixture: CompassFixture;
    beforeAll(() => {
      hilog.info(0xF811, 'SensorTest', '%{public}s', 'CompassPipelinePart68 begin');
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
      hilog.info(0xF811, 'SensorTest', '%{public}s', 'CompassPipelinePart68 end');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_0100
     * @tc.name testCompassPipelinePart68Test0001
     * @tc.desc Verify onSensor rounds yaw 296.501 to 297 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0001', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(296.501, 125, 86, 204200000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(297);
      expect(fixture.state.angleTest).assertEqual('297°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(296.501);
      expect(event.data[1]).assertEqual(125);
      expect(event.data[2]).assertEqual(86);
      expect(event.timestamp).assertEqual(204200000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(297);
      expect(fixture.state.angleTest).assertEqual('297°');
      fixture.emit(296.501, -125, -86);
      expect(fixture.state.angle).assertEqual(297);
      expect(fixture.state.angleTest).assertEqual('297°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_0200
     * @tc.name testCompassPipelinePart68Test0002
     * @tc.desc Verify onSensor rounds yaw 297.501 to 298 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0002', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(297.501, 142, -82, 204400000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(298);
      expect(fixture.state.angleTest).assertEqual('298°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(297.501);
      expect(event.data[1]).assertEqual(142);
      expect(event.data[2]).assertEqual(-82);
      expect(event.timestamp).assertEqual(204400000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(298);
      expect(fixture.state.angleTest).assertEqual('298°');
      fixture.emit(297.501, -142, 82);
      expect(fixture.state.angle).assertEqual(298);
      expect(fixture.state.angleTest).assertEqual('298°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_0300
     * @tc.name testCompassPipelinePart68Test0003
     * @tc.desc Verify onSensor rounds yaw 298.501 to 299 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0003', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(298.501, 159, -69, 204600000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(299);
      expect(fixture.state.angleTest).assertEqual('299°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(298.501);
      expect(event.data[1]).assertEqual(159);
      expect(event.data[2]).assertEqual(-69);
      expect(event.timestamp).assertEqual(204600000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(299);
      expect(fixture.state.angleTest).assertEqual('299°');
      fixture.emit(298.501, -159, 69);
      expect(fixture.state.angle).assertEqual(299);
      expect(fixture.state.angleTest).assertEqual('299°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_0400
     * @tc.name testCompassPipelinePart68Test0004
     * @tc.desc Verify onSensor rounds yaw 299.501 to 300 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0004', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(299.501, 176, -56, 204800000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(300);
      expect(fixture.state.angleTest).assertEqual('300°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(299.501);
      expect(event.data[1]).assertEqual(176);
      expect(event.data[2]).assertEqual(-56);
      expect(event.timestamp).assertEqual(204800000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(300);
      expect(fixture.state.angleTest).assertEqual('300°');
      fixture.emit(299.501, -176, 56);
      expect(fixture.state.angle).assertEqual(300);
      expect(fixture.state.angleTest).assertEqual('300°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_0500
     * @tc.name testCompassPipelinePart68Test0005
     * @tc.desc Verify onSensor rounds yaw 300.501 to 301 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0005', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(300.501, -168, -43, 205000000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(301);
      expect(fixture.state.angleTest).assertEqual('301°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(300.501);
      expect(event.data[1]).assertEqual(-168);
      expect(event.data[2]).assertEqual(-43);
      expect(event.timestamp).assertEqual(205000000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(301);
      expect(fixture.state.angleTest).assertEqual('301°');
      fixture.emit(300.501, 168, 43);
      expect(fixture.state.angle).assertEqual(301);
      expect(fixture.state.angleTest).assertEqual('301°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_0600
     * @tc.name testCompassPipelinePart68Test0006
     * @tc.desc Verify onSensor rounds yaw 301.501 to 302 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0006', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(301.501, -151, -30, 205200000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(302);
      expect(fixture.state.angleTest).assertEqual('302°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(301.501);
      expect(event.data[1]).assertEqual(-151);
      expect(event.data[2]).assertEqual(-30);
      expect(event.timestamp).assertEqual(205200000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(302);
      expect(fixture.state.angleTest).assertEqual('302°');
      fixture.emit(301.501, 151, 30);
      expect(fixture.state.angle).assertEqual(302);
      expect(fixture.state.angleTest).assertEqual('302°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_0700
     * @tc.name testCompassPipelinePart68Test0007
     * @tc.desc Verify onSensor rounds yaw 302.501 to 303 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0007', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(302.501, -134, -17, 205400000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(303);
      expect(fixture.state.angleTest).assertEqual('303°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(302.501);
      expect(event.data[1]).assertEqual(-134);
      expect(event.data[2]).assertEqual(-17);
      expect(event.timestamp).assertEqual(205400000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(303);
      expect(fixture.state.angleTest).assertEqual('303°');
      fixture.emit(302.501, 134, 17);
      expect(fixture.state.angle).assertEqual(303);
      expect(fixture.state.angleTest).assertEqual('303°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_0800
     * @tc.name testCompassPipelinePart68Test0008
     * @tc.desc Verify onSensor rounds yaw 303.501 to 304 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0008', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(303.501, -117, -4, 205600000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(304);
      expect(fixture.state.angleTest).assertEqual('304°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(303.501);
      expect(event.data[1]).assertEqual(-117);
      expect(event.data[2]).assertEqual(-4);
      expect(event.timestamp).assertEqual(205600000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(304);
      expect(fixture.state.angleTest).assertEqual('304°');
      fixture.emit(303.501, 117, 4);
      expect(fixture.state.angle).assertEqual(304);
      expect(fixture.state.angleTest).assertEqual('304°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_0900
     * @tc.name testCompassPipelinePart68Test0009
     * @tc.desc Verify onSensor rounds yaw 304.501 to 305 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0009', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(304.501, -100, 9, 205800000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(305);
      expect(fixture.state.angleTest).assertEqual('305°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(304.501);
      expect(event.data[1]).assertEqual(-100);
      expect(event.data[2]).assertEqual(9);
      expect(event.timestamp).assertEqual(205800000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(305);
      expect(fixture.state.angleTest).assertEqual('305°');
      fixture.emit(304.501, 100, -9);
      expect(fixture.state.angle).assertEqual(305);
      expect(fixture.state.angleTest).assertEqual('305°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_1000
     * @tc.name testCompassPipelinePart68Test0010
     * @tc.desc Verify onSensor rounds yaw 305.501 to 306 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0010', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(305.501, -83, 22, 206000000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(306);
      expect(fixture.state.angleTest).assertEqual('306°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(305.501);
      expect(event.data[1]).assertEqual(-83);
      expect(event.data[2]).assertEqual(22);
      expect(event.timestamp).assertEqual(206000000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(306);
      expect(fixture.state.angleTest).assertEqual('306°');
      fixture.emit(305.501, 83, -22);
      expect(fixture.state.angle).assertEqual(306);
      expect(fixture.state.angleTest).assertEqual('306°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_1100
     * @tc.name testCompassPipelinePart68Test0011
     * @tc.desc Verify onSensor rounds yaw 306.501 to 307 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0011', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(306.501, -66, 35, 206200000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(307);
      expect(fixture.state.angleTest).assertEqual('307°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(306.501);
      expect(event.data[1]).assertEqual(-66);
      expect(event.data[2]).assertEqual(35);
      expect(event.timestamp).assertEqual(206200000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(307);
      expect(fixture.state.angleTest).assertEqual('307°');
      fixture.emit(306.501, 66, -35);
      expect(fixture.state.angle).assertEqual(307);
      expect(fixture.state.angleTest).assertEqual('307°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_1200
     * @tc.name testCompassPipelinePart68Test0012
     * @tc.desc Verify onSensor rounds yaw 307.501 to 308 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0012', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(307.501, -49, 48, 206400000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(308);
      expect(fixture.state.angleTest).assertEqual('308°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(307.501);
      expect(event.data[1]).assertEqual(-49);
      expect(event.data[2]).assertEqual(48);
      expect(event.timestamp).assertEqual(206400000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(308);
      expect(fixture.state.angleTest).assertEqual('308°');
      fixture.emit(307.501, 49, -48);
      expect(fixture.state.angle).assertEqual(308);
      expect(fixture.state.angleTest).assertEqual('308°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_1300
     * @tc.name testCompassPipelinePart68Test0013
     * @tc.desc Verify onSensor rounds yaw 308.501 to 309 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0013', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(308.501, -32, 61, 206600000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(309);
      expect(fixture.state.angleTest).assertEqual('309°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(308.501);
      expect(event.data[1]).assertEqual(-32);
      expect(event.data[2]).assertEqual(61);
      expect(event.timestamp).assertEqual(206600000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(309);
      expect(fixture.state.angleTest).assertEqual('309°');
      fixture.emit(308.501, 32, -61);
      expect(fixture.state.angle).assertEqual(309);
      expect(fixture.state.angleTest).assertEqual('309°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_1400
     * @tc.name testCompassPipelinePart68Test0014
     * @tc.desc Verify onSensor rounds yaw 309.501 to 310 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0014', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(309.501, -15, 74, 206800000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(310);
      expect(fixture.state.angleTest).assertEqual('310°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(309.501);
      expect(event.data[1]).assertEqual(-15);
      expect(event.data[2]).assertEqual(74);
      expect(event.timestamp).assertEqual(206800000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(310);
      expect(fixture.state.angleTest).assertEqual('310°');
      fixture.emit(309.501, 15, -74);
      expect(fixture.state.angle).assertEqual(310);
      expect(fixture.state.angleTest).assertEqual('310°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_1500
     * @tc.name testCompassPipelinePart68Test0015
     * @tc.desc Verify onSensor rounds yaw 310.501 to 311 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0015', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(310.501, 2, 87, 207000000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(311);
      expect(fixture.state.angleTest).assertEqual('311°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(310.501);
      expect(event.data[1]).assertEqual(2);
      expect(event.data[2]).assertEqual(87);
      expect(event.timestamp).assertEqual(207000000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(311);
      expect(fixture.state.angleTest).assertEqual('311°');
      fixture.emit(310.501, -2, -87);
      expect(fixture.state.angle).assertEqual(311);
      expect(fixture.state.angleTest).assertEqual('311°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_1600
     * @tc.name testCompassPipelinePart68Test0016
     * @tc.desc Verify onSensor rounds yaw 311.501 to 312 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0016', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(311.501, 19, -81, 207200000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(312);
      expect(fixture.state.angleTest).assertEqual('312°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(311.501);
      expect(event.data[1]).assertEqual(19);
      expect(event.data[2]).assertEqual(-81);
      expect(event.timestamp).assertEqual(207200000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(312);
      expect(fixture.state.angleTest).assertEqual('312°');
      fixture.emit(311.501, -19, 81);
      expect(fixture.state.angle).assertEqual(312);
      expect(fixture.state.angleTest).assertEqual('312°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_1700
     * @tc.name testCompassPipelinePart68Test0017
     * @tc.desc Verify onSensor rounds yaw 312.501 to 313 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0017', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(312.501, 36, -68, 207400000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(313);
      expect(fixture.state.angleTest).assertEqual('313°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(312.501);
      expect(event.data[1]).assertEqual(36);
      expect(event.data[2]).assertEqual(-68);
      expect(event.timestamp).assertEqual(207400000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(313);
      expect(fixture.state.angleTest).assertEqual('313°');
      fixture.emit(312.501, -36, 68);
      expect(fixture.state.angle).assertEqual(313);
      expect(fixture.state.angleTest).assertEqual('313°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_1800
     * @tc.name testCompassPipelinePart68Test0018
     * @tc.desc Verify onSensor rounds yaw 313.501 to 314 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0018', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(313.501, 53, -55, 207600000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(314);
      expect(fixture.state.angleTest).assertEqual('314°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(313.501);
      expect(event.data[1]).assertEqual(53);
      expect(event.data[2]).assertEqual(-55);
      expect(event.timestamp).assertEqual(207600000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(314);
      expect(fixture.state.angleTest).assertEqual('314°');
      fixture.emit(313.501, -53, 55);
      expect(fixture.state.angle).assertEqual(314);
      expect(fixture.state.angleTest).assertEqual('314°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_1900
     * @tc.name testCompassPipelinePart68Test0019
     * @tc.desc Verify onSensor rounds yaw 314.501 to 315 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0019', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(314.501, 70, -42, 207800000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(315);
      expect(fixture.state.angleTest).assertEqual('315°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(314.501);
      expect(event.data[1]).assertEqual(70);
      expect(event.data[2]).assertEqual(-42);
      expect(event.timestamp).assertEqual(207800000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(315);
      expect(fixture.state.angleTest).assertEqual('315°');
      fixture.emit(314.501, -70, 42);
      expect(fixture.state.angle).assertEqual(315);
      expect(fixture.state.angleTest).assertEqual('315°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_2000
     * @tc.name testCompassPipelinePart68Test0020
     * @tc.desc Verify onSensor rounds yaw 315.501 to 316 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0020', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(315.501, 87, -29, 208000000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(316);
      expect(fixture.state.angleTest).assertEqual('316°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(315.501);
      expect(event.data[1]).assertEqual(87);
      expect(event.data[2]).assertEqual(-29);
      expect(event.timestamp).assertEqual(208000000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(316);
      expect(fixture.state.angleTest).assertEqual('316°');
      fixture.emit(315.501, -87, 29);
      expect(fixture.state.angle).assertEqual(316);
      expect(fixture.state.angleTest).assertEqual('316°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_2100
     * @tc.name testCompassPipelinePart68Test0021
     * @tc.desc Verify onSensor rounds yaw 316.501 to 317 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0021', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(316.501, 104, -16, 208200000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(317);
      expect(fixture.state.angleTest).assertEqual('317°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(316.501);
      expect(event.data[1]).assertEqual(104);
      expect(event.data[2]).assertEqual(-16);
      expect(event.timestamp).assertEqual(208200000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(317);
      expect(fixture.state.angleTest).assertEqual('317°');
      fixture.emit(316.501, -104, 16);
      expect(fixture.state.angle).assertEqual(317);
      expect(fixture.state.angleTest).assertEqual('317°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_2200
     * @tc.name testCompassPipelinePart68Test0022
     * @tc.desc Verify onSensor rounds yaw 317.501 to 318 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0022', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(317.501, 121, -3, 208400000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(318);
      expect(fixture.state.angleTest).assertEqual('318°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(317.501);
      expect(event.data[1]).assertEqual(121);
      expect(event.data[2]).assertEqual(-3);
      expect(event.timestamp).assertEqual(208400000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(318);
      expect(fixture.state.angleTest).assertEqual('318°');
      fixture.emit(317.501, -121, 3);
      expect(fixture.state.angle).assertEqual(318);
      expect(fixture.state.angleTest).assertEqual('318°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_2300
     * @tc.name testCompassPipelinePart68Test0023
     * @tc.desc Verify onSensor rounds yaw 318.501 to 319 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0023', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(318.501, 138, 10, 208600000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(319);
      expect(fixture.state.angleTest).assertEqual('319°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(318.501);
      expect(event.data[1]).assertEqual(138);
      expect(event.data[2]).assertEqual(10);
      expect(event.timestamp).assertEqual(208600000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(319);
      expect(fixture.state.angleTest).assertEqual('319°');
      fixture.emit(318.501, -138, -10);
      expect(fixture.state.angle).assertEqual(319);
      expect(fixture.state.angleTest).assertEqual('319°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_2400
     * @tc.name testCompassPipelinePart68Test0024
     * @tc.desc Verify onSensor rounds yaw 319.501 to 320 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0024', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(319.501, 155, 23, 208800000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(320);
      expect(fixture.state.angleTest).assertEqual('320°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(319.501);
      expect(event.data[1]).assertEqual(155);
      expect(event.data[2]).assertEqual(23);
      expect(event.timestamp).assertEqual(208800000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(320);
      expect(fixture.state.angleTest).assertEqual('320°');
      fixture.emit(319.501, -155, -23);
      expect(fixture.state.angle).assertEqual(320);
      expect(fixture.state.angleTest).assertEqual('320°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_2500
     * @tc.name testCompassPipelinePart68Test0025
     * @tc.desc Verify onSensor rounds yaw 320.501 to 321 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0025', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(320.501, 172, 36, 209000000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(321);
      expect(fixture.state.angleTest).assertEqual('321°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(320.501);
      expect(event.data[1]).assertEqual(172);
      expect(event.data[2]).assertEqual(36);
      expect(event.timestamp).assertEqual(209000000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(321);
      expect(fixture.state.angleTest).assertEqual('321°');
      fixture.emit(320.501, -172, -36);
      expect(fixture.state.angle).assertEqual(321);
      expect(fixture.state.angleTest).assertEqual('321°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_2600
     * @tc.name testCompassPipelinePart68Test0026
     * @tc.desc Verify onSensor rounds yaw 321.501 to 322 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0026', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(321.501, -172, 49, 209200000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(322);
      expect(fixture.state.angleTest).assertEqual('322°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(321.501);
      expect(event.data[1]).assertEqual(-172);
      expect(event.data[2]).assertEqual(49);
      expect(event.timestamp).assertEqual(209200000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(322);
      expect(fixture.state.angleTest).assertEqual('322°');
      fixture.emit(321.501, 172, -49);
      expect(fixture.state.angle).assertEqual(322);
      expect(fixture.state.angleTest).assertEqual('322°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_2700
     * @tc.name testCompassPipelinePart68Test0027
     * @tc.desc Verify onSensor rounds yaw 322.501 to 323 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0027', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(322.501, -155, 62, 209400000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(323);
      expect(fixture.state.angleTest).assertEqual('323°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(322.501);
      expect(event.data[1]).assertEqual(-155);
      expect(event.data[2]).assertEqual(62);
      expect(event.timestamp).assertEqual(209400000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(323);
      expect(fixture.state.angleTest).assertEqual('323°');
      fixture.emit(322.501, 155, -62);
      expect(fixture.state.angle).assertEqual(323);
      expect(fixture.state.angleTest).assertEqual('323°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_2800
     * @tc.name testCompassPipelinePart68Test0028
     * @tc.desc Verify onSensor rounds yaw 323.501 to 324 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0028', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(323.501, -138, 75, 209600000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(324);
      expect(fixture.state.angleTest).assertEqual('324°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(323.501);
      expect(event.data[1]).assertEqual(-138);
      expect(event.data[2]).assertEqual(75);
      expect(event.timestamp).assertEqual(209600000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(324);
      expect(fixture.state.angleTest).assertEqual('324°');
      fixture.emit(323.501, 138, -75);
      expect(fixture.state.angle).assertEqual(324);
      expect(fixture.state.angleTest).assertEqual('324°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_2900
     * @tc.name testCompassPipelinePart68Test0029
     * @tc.desc Verify onSensor rounds yaw 324.501 to 325 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0029', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(324.501, -121, 88, 209800000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(325);
      expect(fixture.state.angleTest).assertEqual('325°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(324.501);
      expect(event.data[1]).assertEqual(-121);
      expect(event.data[2]).assertEqual(88);
      expect(event.timestamp).assertEqual(209800000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(325);
      expect(fixture.state.angleTest).assertEqual('325°');
      fixture.emit(324.501, 121, -88);
      expect(fixture.state.angle).assertEqual(325);
      expect(fixture.state.angleTest).assertEqual('325°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_3000
     * @tc.name testCompassPipelinePart68Test0030
     * @tc.desc Verify onSensor rounds yaw 325.501 to 326 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0030', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(325.501, -104, -80, 210000000000, 1);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(326);
      expect(fixture.state.angleTest).assertEqual('326°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(325.501);
      expect(event.data[1]).assertEqual(-104);
      expect(event.data[2]).assertEqual(-80);
      expect(event.timestamp).assertEqual(210000000000);
      expect(event.accuracy).assertEqual(1);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(326);
      expect(fixture.state.angleTest).assertEqual('326°');
      fixture.emit(325.501, 104, 80);
      expect(fixture.state.angle).assertEqual(326);
      expect(fixture.state.angleTest).assertEqual('326°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_3100
     * @tc.name testCompassPipelinePart68Test0031
     * @tc.desc Verify onSensor rounds yaw 326.501 to 327 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0031', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(326.501, -87, -67, 210200000000, 2);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(327);
      expect(fixture.state.angleTest).assertEqual('327°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(326.501);
      expect(event.data[1]).assertEqual(-87);
      expect(event.data[2]).assertEqual(-67);
      expect(event.timestamp).assertEqual(210200000000);
      expect(event.accuracy).assertEqual(2);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(327);
      expect(fixture.state.angleTest).assertEqual('327°');
      fixture.emit(326.501, 87, 67);
      expect(fixture.state.angle).assertEqual(327);
      expect(fixture.state.angleTest).assertEqual('327°');
      expect(fixture.state.isLand).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_3200
     * @tc.name testCompassPipelinePart68Test0032
     * @tc.desc Verify onSensor rounds yaw 327.501 to 328 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0032', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(327.501, -70, -54, 210400000000, 3);
      fixture.layout.emit(false);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(328);
      expect(fixture.state.angleTest).assertEqual('328°');
      expect(fixture.state.isLand).assertEqual(false);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(327.501);
      expect(event.data[1]).assertEqual(-70);
      expect(event.data[2]).assertEqual(-54);
      expect(event.timestamp).assertEqual(210400000000);
      expect(event.accuracy).assertEqual(3);
      fixture.layout.emit(true);
      expect(fixture.state.isLand).assertEqual(true);
      expect(fixture.state.angle).assertEqual(328);
      expect(fixture.state.angleTest).assertEqual('328°');
      fixture.emit(327.501, 70, 54);
      expect(fixture.state.angle).assertEqual(328);
      expect(fixture.state.angleTest).assertEqual('328°');
      expect(fixture.state.isLand).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_PIPELINE_68_3300
     * @tc.name testCompassPipelinePart68Test0033
     * @tc.desc Verify onSensor rounds yaw 328.501 to 329 and onLayout preserves the heading
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCompassPipelinePart68Test0033', 0, (): void => {
      expect(fixture.state.angle).assertEqual(0);
      expect(fixture.state.angleTest).assertEqual('0°');
      expect(fixture.state.isLand).assertFalse();
      const result: number = fixture.start();
      expect(result).assertEqual(0);
      expect(fixture.sensor.subscriptions.length).assertEqual(1);
      expect(fixture.sensor.subscriptions[0].sensorType).assertEqual(256);
      expect(fixture.sensor.subscriptions[0].interval).assertEqual(200000000);
      const event = fixture.event(328.501, -53, -41, 210600000000, 0);
      fixture.layout.emit(true);
      fixture.sensor.emit(event);
      expect(fixture.state.angle).assertEqual(329);
      expect(fixture.state.angleTest).assertEqual('329°');
      expect(fixture.state.isLand).assertEqual(true);
      expect(event.data.length).assertEqual(3);
      expect(event.data[0]).assertEqual(328.501);
      expect(event.data[1]).assertEqual(-53);
      expect(event.data[2]).assertEqual(-41);
      expect(event.timestamp).assertEqual(210600000000);
      expect(event.accuracy).assertEqual(0);
      fixture.layout.emit(false);
      expect(fixture.state.isLand).assertEqual(false);
      expect(fixture.state.angle).assertEqual(329);
      expect(fixture.state.angleTest).assertEqual('329°');
      fixture.emit(328.501, 53, 41);
      expect(fixture.state.angle).assertEqual(329);
      expect(fixture.state.angleTest).assertEqual('329°');
      expect(fixture.state.isLand).assertEqual(false);
    });

  });
}
