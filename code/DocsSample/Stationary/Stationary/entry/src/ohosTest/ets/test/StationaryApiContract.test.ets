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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { stationary } from '@kit.MultimodalAwarenessKit';

function allInRange(values: number[]): boolean {
  for (const value of values) {
    if (!Number.isInteger(value) || value < 0) {
      return false;
    }
  }
  return true;
}

/**
 * stationary Kit 接口与枚举契约（设备无关）
 *
 * 校验对外暴露的订阅/一次性获取/取消订阅能力存在，以及设备状态类型、
 * 事件枚举与状态枚举的取值、唯一性和整数范围，不依赖设备是否支持静止感知。
 */
export default function StationaryApiContractTest() {
  describe('StationaryApiContractTest', () => {
    /**
     * @tc.number SUB_STATIONARY_API_0100
     * @tc.name testStationaryApi0001
     * @tc.desc Verify stationary exposes subscribe, once and unsubscribe functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testStationaryApi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(typeof stationary.on).assertEqual('function');
      expect(typeof stationary.once).assertEqual('function');
      expect(typeof stationary.off).assertEqual('function');
    });

    /**
     * @tc.number SUB_STATIONARY_API_0200
     * @tc.name testStationaryApi0002
     * @tc.desc Verify ActivityEvent keeps its documented numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testStationaryApi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(stationary.ActivityEvent.ENTER).assertEqual(1);
      expect(stationary.ActivityEvent.EXIT).assertEqual(2);
      expect(stationary.ActivityEvent.ENTER_EXIT).assertEqual(3);
    });

    /**
     * @tc.number SUB_STATIONARY_API_0300
     * @tc.name testStationaryApi0003
     * @tc.desc Verify ActivityEvent members are distinct and integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testStationaryApi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const values: number[] = [
        stationary.ActivityEvent.ENTER,
        stationary.ActivityEvent.EXIT,
        stationary.ActivityEvent.ENTER_EXIT
      ];
      expect(values.length).assertEqual(3);
      expect(new Set<number>(values).size).assertEqual(3);
      expect(allInRange(values)).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_API_0400
     * @tc.name testStationaryApi0004
     * @tc.desc Verify ActivityState keeps its documented numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testStationaryApi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(stationary.ActivityState.ENTER).assertEqual(1);
      expect(stationary.ActivityState.EXIT).assertEqual(2);
    });

    /**
     * @tc.number SUB_STATIONARY_API_0500
     * @tc.name testStationaryApi0005
     * @tc.desc Verify ActivityState members are distinct and integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testStationaryApi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const values: number[] = [
        stationary.ActivityState.ENTER,
        stationary.ActivityState.EXIT
      ];
      expect(values.length).assertEqual(2);
      expect(new Set<number>(values).size).assertEqual(2);
      expect(allInRange(values)).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_API_0600
     * @tc.name testStationaryApi0006
     * @tc.desc Verify ActivityState ENTER/EXIT share the numeric values of the matching events
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryApi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Number(stationary.ActivityState.ENTER))
        .assertEqual(Number(stationary.ActivityEvent.ENTER));
      expect(Number(stationary.ActivityState.EXIT))
        .assertEqual(Number(stationary.ActivityEvent.EXIT));
    });

    /**
     * @tc.number SUB_STATIONARY_API_0700
     * @tc.name testStationaryApi0007
     * @tc.desc Verify ENTER_EXIT combines the ENTER and EXIT bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryApi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Number(stationary.ActivityEvent.ENTER_EXIT)).assertEqual(
        Number(stationary.ActivityEvent.ENTER) | Number(stationary.ActivityEvent.EXIT));
      expect(Number(stationary.ActivityEvent.EXIT) >
        Number(stationary.ActivityEvent.ENTER)).assertTrue();
      expect(Number(stationary.ActivityEvent.ENTER_EXIT) >
        Number(stationary.ActivityEvent.EXIT)).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_API_0800
     * @tc.name testStationaryApi0008
     * @tc.desc Verify the ActivityType literals are accepted and mutually distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryApi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const still: stationary.ActivityType = 'still';
      const relativeStill: stationary.ActivityType = 'relativeStill';
      expect(still).assertEqual('still');
      expect(relativeStill).assertEqual('relativeStill');
      expect(new Set<string>([still, relativeStill]).size).assertEqual(2);
    });

    /**
     * @tc.number SUB_STATIONARY_API_0900
     * @tc.name testStationaryApi0009
     * @tc.desc Verify an ActivityResponse object keeps the state it was built with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryApi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const entering: stationary.ActivityResponse = { state: stationary.ActivityState.ENTER };
      const exiting: stationary.ActivityResponse = { state: stationary.ActivityState.EXIT };
      expect(entering.state).assertEqual(stationary.ActivityState.ENTER);
      expect(exiting.state).assertEqual(stationary.ActivityState.EXIT);
      expect(Number(entering.state) !== Number(exiting.state)).assertTrue();
    });
  });
}
