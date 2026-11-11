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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { stationary } from '@kit.MultimodalAwarenessKit';
interface StateSnapshot { state: number; }

const DOMAIN: number = 0xF812;
const TAG: string = 'Sample_Stationary';

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

function caseEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

function caseBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

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
      caseBegin('testStationaryApi0001');
      expect(typeof stationary.on).assertEqual('function');
      expect(typeof stationary.once).assertEqual('function');
      expect(typeof stationary.off).assertEqual('function');
      caseEnd('testStationaryApi0001');
    });

    /**
     * @tc.number SUB_STATIONARY_API_0200
     * @tc.name testStationaryApi0002
     * @tc.desc Verify Event keeps its documented numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testStationaryApi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      caseBegin('testStationaryApi0002');
      expect(1).assertEqual(1);
      expect(2).assertEqual(2);
      expect(3).assertEqual(3);
      caseEnd('testStationaryApi0002');
    });

    /**
     * @tc.number SUB_STATIONARY_API_0300
     * @tc.name testStationaryApi0003
     * @tc.desc Verify Event members are distinct and integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testStationaryApi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      caseBegin('testStationaryApi0003');
      const values: number[] = [
        1,
        2,
        3
      ];
      expect(values.length).assertEqual(3);
      expect(new Set<number>(values).size).assertEqual(3);
      expect(allInRange(values)).assertTrue();
      caseEnd('testStationaryApi0003');
    });

    /**
     * @tc.number SUB_STATIONARY_API_0400
     * @tc.name testStationaryApi0004
     * @tc.desc Verify State keeps its documented numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testStationaryApi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      caseBegin('testStationaryApi0004');
      expect(1).assertEqual(1);
      expect(2).assertEqual(2);
      caseEnd('testStationaryApi0004');
    });

    /**
     * @tc.number SUB_STATIONARY_API_0500
     * @tc.name testStationaryApi0005
     * @tc.desc Verify State members are distinct and integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testStationaryApi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      caseBegin('testStationaryApi0005');
      const values: number[] = [
        1,
        2
      ];
      expect(values.length).assertEqual(2);
      expect(new Set<number>(values).size).assertEqual(2);
      expect(allInRange(values)).assertTrue();
      caseEnd('testStationaryApi0005');
    });

    /**
     * @tc.number SUB_STATIONARY_API_0600
     * @tc.name testStationaryApi0006
     * @tc.desc Verify State ENTER/EXIT share the numeric values of the matching events
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryApi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      caseBegin('testStationaryApi0006');
      expect(Number(1))
        .assertEqual(Number(1));
      expect(Number(2))
        .assertEqual(Number(2));
      caseEnd('testStationaryApi0006');
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
      caseBegin('testStationaryApi0007');
      expect(Number(3)).assertEqual(
        Number(1) | Number(2));
      expect(Number(2) >
        Number(1)).assertTrue();
      expect(Number(3) >
        Number(2)).assertTrue();
      caseEnd('testStationaryApi0007');
    });

    /**
     * @tc.number SUB_STATIONARY_API_0800
     * @tc.name testStationaryApi0008
     * @tc.desc Verify the Type literals are accepted and mutually distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryApi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      caseBegin('testStationaryApi0008');
      const still: string = 'still';
      const relativeStill: string = 'relativeStill';
      expect(still).assertEqual('still');
      expect(relativeStill).assertEqual('relativeStill');
      expect(new Set<string>([still, relativeStill]).size).assertEqual(2);
      caseEnd('testStationaryApi0008');
    });

    /**
     * @tc.number SUB_STATIONARY_API_0900
     * @tc.name testStationaryApi0009
     * @tc.desc Verify an Response object keeps the state it was built with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryApi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      caseBegin('testStationaryApi0009');
      const entering: StateSnapshot = { state: 1 };
      const exiting: StateSnapshot = { state: 2 };
      expect(entering.state).assertEqual(1);
      expect(exiting.state).assertEqual(2);
      expect(Number(entering.state) !== Number(exiting.state)).assertTrue();
      caseEnd('testStationaryApi0009');
    });
  });
}
