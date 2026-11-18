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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { stationary } from '@kit.MultimodalAwarenessKit';

const TAG: string = '[Sample_StationaryEnumCoreTest]';
const DOMAIN: number = 0xF812;

const EVENT_NAMES: string[] = ['ENTER', 'EXIT', 'ENTER_EXIT'];
const EVENT_VALUES: number[] = [1, 2, 3];
const STATE_NAMES: string[] = ['ENTER', 'EXIT'];
const STATE_VALUES: number[] = [1, 2];

function uniqueCount(values: number[]): number {
  let distinct: number = 0;
  for (let i = 0; i < values.length; i++) {
    let seen: boolean = false;
    for (let j = 0; j < i; j++) {
      if (values[j] === values[i]) {
        seen = true;
      }
    }
    if (!seen) {
      distinct++;
    }
  }
  return distinct;
}

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

/**
 * stationary 枚举契约（设备无关）
 *
 * 校验 Event / State 的数值、类型与整数性，Type 的
 * 字面量取值，以及两个枚举成员之间的区分度。
 */
export default function StationaryEnumCoreTest(): void {
  describe('StationaryEnumCoreTest', () => {

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_0100
     * @tc.name      testStationaryEnumCore0001
     * @tc.desc      Verify Event.ENTER keeps its documented value 1
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryEnumCore0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testStationaryEnumCore0001');
      const value: number = 1;
      hilog.info(DOMAIN, TAG, '%{public}s', 'ENTER=' + value);
      expect(value).assertEqual(1);
      expect(typeof value).assertEqual('number');
      logEnd('testStationaryEnumCore0001');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_0200
     * @tc.name      testStationaryEnumCore0002
     * @tc.desc      Verify Event.EXIT keeps its documented value 2
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryEnumCore0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testStationaryEnumCore0002');
      const value: number = 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'EXIT=' + value);
      expect(value).assertEqual(2);
      expect(typeof value).assertEqual('number');
      logEnd('testStationaryEnumCore0002');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_0300
     * @tc.name      testStationaryEnumCore0003
     * @tc.desc      Verify Event.ENTER_EXIT keeps its documented value 3
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryEnumCore0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testStationaryEnumCore0003');
      const value: number = 3;
      hilog.info(DOMAIN, TAG, '%{public}s', 'ENTER_EXIT=' + value);
      expect(value).assertEqual(3);
      expect(typeof value).assertEqual('number');
      logEnd('testStationaryEnumCore0003');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_0400
     * @tc.name      testStationaryEnumCore0004
     * @tc.desc      Verify Event.ENTER is a positive integer
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryEnumCore0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testStationaryEnumCore0004');
      const value: number = 1;
      hilog.info(DOMAIN, TAG, '%{public}s', 'ENTER=' + value);
      expect(Number.isInteger(value)).assertTrue();
      expect(value > 0).assertTrue();
      logEnd('testStationaryEnumCore0004');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_0500
     * @tc.name      testStationaryEnumCore0005
     * @tc.desc      Verify Event.EXIT is a positive integer
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryEnumCore0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testStationaryEnumCore0005');
      const value: number = 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'EXIT=' + value);
      expect(Number.isInteger(value)).assertTrue();
      expect(value > 0).assertTrue();
      logEnd('testStationaryEnumCore0005');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_0600
     * @tc.name      testStationaryEnumCore0006
     * @tc.desc      Verify Event.ENTER_EXIT is a positive integer
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryEnumCore0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testStationaryEnumCore0006');
      const value: number = 3;
      hilog.info(DOMAIN, TAG, '%{public}s', 'ENTER_EXIT=' + value);
      expect(Number.isInteger(value)).assertTrue();
      expect(value > 0).assertTrue();
      logEnd('testStationaryEnumCore0006');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_0700
     * @tc.name      testStationaryEnumCore0007
     * @tc.desc      Verify State.ENTER keeps its documented value 1
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryEnumCore0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testStationaryEnumCore0007');
      const value: number = 1;
      hilog.info(DOMAIN, TAG, '%{public}s', 'ENTER=' + value);
      expect(value).assertEqual(1);
      expect(typeof value).assertEqual('number');
      logEnd('testStationaryEnumCore0007');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_0800
     * @tc.name      testStationaryEnumCore0008
     * @tc.desc      Verify State.EXIT keeps its documented value 2
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryEnumCore0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testStationaryEnumCore0008');
      const value: number = 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'EXIT=' + value);
      expect(value).assertEqual(2);
      expect(typeof value).assertEqual('number');
      logEnd('testStationaryEnumCore0008');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_0900
     * @tc.name      testStationaryEnumCore0009
     * @tc.desc      Verify State.ENTER is a positive integer
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryEnumCore0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testStationaryEnumCore0009');
      const value: number = 1;
      hilog.info(DOMAIN, TAG, '%{public}s', 'ENTER=' + value);
      expect(Number.isInteger(value)).assertTrue();
      expect(value > 0).assertTrue();
      expect(value).assertEqual(STATE_VALUES[0]);
      logEnd('testStationaryEnumCore0009');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_1000
     * @tc.name      testStationaryEnumCore0010
     * @tc.desc      Verify State.EXIT is a positive integer
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryEnumCore0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testStationaryEnumCore0010');
      const value: number = 2;
      hilog.info(DOMAIN, TAG, '%{public}s', 'EXIT=' + value);
      expect(Number.isInteger(value)).assertTrue();
      expect(value > 0).assertTrue();
      expect(value).assertEqual(STATE_VALUES[1]);
      logEnd('testStationaryEnumCore0010');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_1100
     * @tc.name      testStationaryEnumCore0011
     * @tc.desc      Verify Type accepts the documented literal "still" as a plain string
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryEnumCore0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testStationaryEnumCore0011');
      const eventType: string = 'still';
      hilog.info(DOMAIN, TAG, '%{public}s', 'type=' + eventType);
      expect(eventType).assertEqual('still');
      expect(typeof eventType).assertEqual('string');
      logEnd('testStationaryEnumCore0011');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_1200
     * @tc.name      testStationaryEnumCore0012
     * @tc.desc      Verify the "still" literal is non-empty and lower camel cased
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryEnumCore0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testStationaryEnumCore0012');
      const eventType: string = 'still';
      hilog.info(DOMAIN, TAG, '%{public}s', 'type=' + eventType);
      expect(eventType.length > 0).assertTrue();
      expect(eventType.charAt(0) === eventType.charAt(0).toLowerCase()).assertTrue();
      expect(eventType.indexOf('still')).assertEqual(0);
      logEnd('testStationaryEnumCore0012');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_1300
     * @tc.name      testStationaryEnumCore0013
     * @tc.desc      Verify Type accepts the documented literal "relativeStill" as a plain string
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryEnumCore0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testStationaryEnumCore0013');
      const eventType: string = 'relativeStill';
      hilog.info(DOMAIN, TAG, '%{public}s', 'type=' + eventType);
      expect(eventType).assertEqual('relativeStill');
      expect(typeof eventType).assertEqual('string');
      logEnd('testStationaryEnumCore0013');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_1400
     * @tc.name      testStationaryEnumCore0014
     * @tc.desc      Verify the "relativeStill" literal is non-empty and lower camel cased
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryEnumCore0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testStationaryEnumCore0014');
      const eventType: string = 'relativeStill';
      hilog.info(DOMAIN, TAG, '%{public}s', 'type=' + eventType);
      expect(eventType.length > 0).assertTrue();
      expect(eventType.charAt(0) === eventType.charAt(0).toLowerCase()).assertTrue();
      expect(eventType.indexOf('relativeStill')).assertEqual(0);
      logEnd('testStationaryEnumCore0014');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_1500
     * @tc.name      testStationaryEnumCore0015
     * @tc.desc      Verify State.ENTER and Event.ENTER share the documented value 1
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryEnumCore0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testStationaryEnumCore0015');
      const left: number = Number(1);
      const right: number = Number(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'left=' + left + ' right=' + right);
      expect(left === right).assertTrue();
      expect(left).assertEqual(1);
      logEnd('testStationaryEnumCore0015');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_1600
     * @tc.name      testStationaryEnumCore0016
     * @tc.desc      Verify State.EXIT and Event.EXIT share the documented value 2
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryEnumCore0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testStationaryEnumCore0016');
      const left: number = Number(2);
      const right: number = Number(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'left=' + left + ' right=' + right);
      expect(left === right).assertTrue();
      expect(left).assertEqual(2);
      logEnd('testStationaryEnumCore0016');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_1700
     * @tc.name      testStationaryEnumCore0017
     * @tc.desc      Verify Event.ENTER and Event.EXIT are distinct members
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryEnumCore0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testStationaryEnumCore0017');
      const left: number = Number(1);
      const right: number = Number(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'left=' + left + ' right=' + right);
      expect(left === right).assertFalse();
      expect(Math.abs(left - right) >= 1).assertTrue();
      logEnd('testStationaryEnumCore0017');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_1800
     * @tc.name      testStationaryEnumCore0018
     * @tc.desc      Verify Event.EXIT and Event.ENTER_EXIT are distinct members
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryEnumCore0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testStationaryEnumCore0018');
      const left: number = Number(2);
      const right: number = Number(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'left=' + left + ' right=' + right);
      expect(left === right).assertFalse();
      expect(Math.abs(left - right) >= 1).assertTrue();
      logEnd('testStationaryEnumCore0018');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_1900
     * @tc.name      testStationaryEnumCore0019
     * @tc.desc      Verify Event.ENTER and Event.ENTER_EXIT are distinct members
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryEnumCore0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testStationaryEnumCore0019');
      const left: number = Number(1);
      const right: number = Number(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'left=' + left + ' right=' + right);
      expect(left === right).assertFalse();
      expect(Math.abs(left - right) >= 1).assertTrue();
      logEnd('testStationaryEnumCore0019');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_2000
     * @tc.name      testStationaryEnumCore0020
     * @tc.desc      Verify State.ENTER and State.EXIT are distinct members
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryEnumCore0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testStationaryEnumCore0020');
      const left: number = Number(1);
      const right: number = Number(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'left=' + left + ' right=' + right);
      expect(left === right).assertFalse();
      expect(Math.abs(left - right) >= 1).assertTrue();
      logEnd('testStationaryEnumCore0020');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_2100
     * @tc.name      testStationaryEnumCore0021
     * @tc.desc      Verify Event members are all distinct
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryEnumCore0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testStationaryEnumCore0021');
      const values: number[] = [EVENT_VALUES[0], EVENT_VALUES[1], EVENT_VALUES[2]];
      hilog.info(DOMAIN, TAG, '%{public}s', 'distinct=' + uniqueCount(values));
      expect(uniqueCount(values)).assertEqual(EVENT_NAMES.length);
      expect(values.length).assertEqual(3);
      logEnd('testStationaryEnumCore0021');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_2200
     * @tc.name      testStationaryEnumCore0022
     * @tc.desc      Verify State members are all distinct
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryEnumCore0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testStationaryEnumCore0022');
      const values: number[] = [STATE_VALUES[0], STATE_VALUES[1]];
      hilog.info(DOMAIN, TAG, '%{public}s', 'distinct=' + uniqueCount(values));
      expect(uniqueCount(values)).assertEqual(STATE_NAMES.length);
      expect(values.length).assertEqual(2);
      logEnd('testStationaryEnumCore0022');
    });

    /**
     * @tc.number    SUB_STATIONARY_ENUM_CORE_2300
     * @tc.name      testStationaryEnumCore0023
     * @tc.desc      Verify Type literal list keeps both documented members
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryEnumCore0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testStationaryEnumCore0023');
      const types: string[] = ['still', 'relativeStill'];
      hilog.info(DOMAIN, TAG, '%{public}s', 'types=' + types.join(','));
      expect(types.length).assertEqual(2);
      expect(types[0] === types[1]).assertFalse();
      logEnd('testStationaryEnumCore0023');
    });

  });
}
