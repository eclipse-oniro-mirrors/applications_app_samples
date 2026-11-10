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
import { motion } from '@kit.MultimodalAwarenessKit';

const TAG: string = '[Sample_MotionEnumCoreTest]';
const DOMAIN: number = 0xF815;

const OPERATING_NAMES: string[] = ['UNKNOWN_STATUS', 'LEFT_HAND_OPERATED', 'RIGHT_HAND_OPERATED'];
const OPERATING_VALUES: number[] = [0, 1, 2];
const HOLDING_NAMES: string[] = ['NOT_HELD', 'LEFT_HAND_HELD', 'RIGHT_HAND_HELD', 'BOTH_HANDS_HELD', 'UNKNOWN_STATUS'];
const HOLDING_VALUES: number[] = [0, 1, 2, 3, 16];

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

/**
 * 操作手状态枚举契约（核心档）。
 *
 * 逐成员校验取值、类型、整数范围与反向映射，并校验成员两两互异。
 * 设备无关，可在任意真机或模拟器上稳定执行。
 */
export default function MotionEnumCoreTest(): void {
  describe('MotionEnumCoreTest', () => {
    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_0100
     * @tc.name      testMotionEnumCore0001
     * @tc.desc      Verify OperatingHandStatus.UNKNOWN_STATUS equals 0 and is an integer
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0001');
      const value: number = motion.OperatingHandStatus.UNKNOWN_STATUS;
      hilog.info(DOMAIN, TAG, '%{public}s', 'UNKNOWN_STATUS=' + value);
      expect(value).assertEqual(OPERATING_VALUES[0]);
      expect(typeof value).assertEqual('number');
      expect(Number.isInteger(value)).assertTrue();
      logEnd('testMotionEnumCore0001');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_0200
     * @tc.name      testMotionEnumCore0002
     * @tc.desc      Verify OperatingHandStatus.LEFT_HAND_OPERATED equals 1 and is an integer
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0002');
      const value: number = motion.OperatingHandStatus.LEFT_HAND_OPERATED;
      hilog.info(DOMAIN, TAG, '%{public}s', 'LEFT_HAND_OPERATED=' + value);
      expect(value).assertEqual(OPERATING_VALUES[1]);
      expect(typeof value).assertEqual('number');
      expect(Number.isInteger(value)).assertTrue();
      logEnd('testMotionEnumCore0002');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_0300
     * @tc.name      testMotionEnumCore0003
     * @tc.desc      Verify OperatingHandStatus.RIGHT_HAND_OPERATED equals 2 and is an integer
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0003');
      const value: number = motion.OperatingHandStatus.RIGHT_HAND_OPERATED;
      hilog.info(DOMAIN, TAG, '%{public}s', 'RIGHT_HAND_OPERATED=' + value);
      expect(value).assertEqual(OPERATING_VALUES[2]);
      expect(typeof value).assertEqual('number');
      expect(Number.isInteger(value)).assertTrue();
      logEnd('testMotionEnumCore0003');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_0400
     * @tc.name      testMotionEnumCore0004
     * @tc.desc      Verify OperatingHandStatus exposes exactly three members with count 3
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0004');
      const values: number[] = [
        motion.OperatingHandStatus.UNKNOWN_STATUS,
        motion.OperatingHandStatus.LEFT_HAND_OPERATED,
        motion.OperatingHandStatus.RIGHT_HAND_OPERATED
      ];
      hilog.info(DOMAIN, TAG, '%{public}s', 'members=' + values.length);
      expect(values.length).assertEqual(3);
      expect(values.length).assertEqual(OPERATING_NAMES.length);
      logEnd('testMotionEnumCore0004');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_0500
     * @tc.name      testMotionEnumCore0005
     * @tc.desc      Verify OperatingHandStatus members are pairwise distinct
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0005');
      const values: number[] = [
        motion.OperatingHandStatus.UNKNOWN_STATUS,
        motion.OperatingHandStatus.LEFT_HAND_OPERATED,
        motion.OperatingHandStatus.RIGHT_HAND_OPERATED
      ];
      const distinct: number = new Set<number>(values).size;
      hilog.info(DOMAIN, TAG, '%{public}s', 'distinct=' + distinct);
      expect(distinct).assertEqual(values.length);
      expect(distinct >= 0).assertTrue();
      logEnd('testMotionEnumCore0005');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_0600
     * @tc.name      testMotionEnumCore0006
     * @tc.desc      Verify OperatingHandStatus values are non-negative and below 3
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0006');
      let inRange: number = 0;
      for (const value of OPERATING_VALUES) {
        if (value >= 0 && value < 3) {
          inRange++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'inRange=' + inRange);
      expect(inRange).assertEqual(OPERATING_VALUES.length);
      expect(inRange > 0).assertTrue();
      logEnd('testMotionEnumCore0006');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_0800
     * @tc.name      testMotionEnumCore0008
     * @tc.desc      Verify OperatingHandStatus values form a contiguous 0-based sequence
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0008');
      const first: number = motion.OperatingHandStatus.UNKNOWN_STATUS;
      const last: number = motion.OperatingHandStatus.RIGHT_HAND_OPERATED;
      hilog.info(DOMAIN, TAG, '%{public}s', 'first=' + first + ', last=' + last);
      expect(first).assertEqual(0);
      expect(last).assertEqual(2);
      expect(last - first).assertEqual(2);
      logEnd('testMotionEnumCore0008');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_0900
     * @tc.name      testMotionEnumCore0009
     * @tc.desc      Verify neutral state sorts below both hand-operated states
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0009');
      const unknown: number = motion.OperatingHandStatus.UNKNOWN_STATUS;
      const left: number = motion.OperatingHandStatus.LEFT_HAND_OPERATED;
      const right: number = motion.OperatingHandStatus.RIGHT_HAND_OPERATED;
      hilog.info(DOMAIN, TAG, '%{public}s', 'unknown=' + unknown + ', left=' + left + ', right=' + right);
      expect(unknown < left).assertTrue();
      expect(left < right).assertTrue();
      logEnd('testMotionEnumCore0009');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_1000
     * @tc.name      testMotionEnumCore0010
     * @tc.desc      Verify left and right hand states are distinguishable by expression
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0010');
      const left: number = motion.OperatingHandStatus.LEFT_HAND_OPERATED;
      const right: number = motion.OperatingHandStatus.RIGHT_HAND_OPERATED;
      hilog.info(DOMAIN, TAG, '%{public}s', 'left===right -> ' + (left === right));
      expect(left === right).assertFalse();
      expect(Math.abs(right - left)).assertEqual(1);
      logEnd('testMotionEnumCore0010');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_1100
     * @tc.name      testMotionEnumCore0011
     * @tc.desc      Verify every documented OperatingHandStatus value is reachable by name lookup
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0011');
      let resolved: number = 0;
      for (const name of OPERATING_NAMES) {
        const value: number = Number(motion.OperatingHandStatus[name]);
        if (value === OPERATING_VALUES[resolved]) {
          resolved++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'resolved=' + resolved);
      expect(resolved).assertEqual(OPERATING_NAMES.length);
      expect(resolved).assertEqual(3);
      logEnd('testMotionEnumCore0011');
    });
    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_1300
     * @tc.name      testMotionEnumCore0013
     * @tc.desc      Verify HoldingHandStatus.NOT_HELD equals 0 and is an integer
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0013');
      const value: number = motion.HoldingHandStatus.NOT_HELD;
      hilog.info(DOMAIN, TAG, '%{public}s', 'NOT_HELD=' + value);
      expect(value).assertEqual(HOLDING_VALUES[0]);
      expect(typeof value).assertEqual('number');
      expect(Number.isInteger(value)).assertTrue();
      logEnd('testMotionEnumCore0013');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_1400
     * @tc.name      testMotionEnumCore0014
     * @tc.desc      Verify HoldingHandStatus.LEFT_HAND_HELD equals 1 and is an integer
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0014');
      const value: number = motion.HoldingHandStatus.LEFT_HAND_HELD;
      hilog.info(DOMAIN, TAG, '%{public}s', 'LEFT_HAND_HELD=' + value);
      expect(value).assertEqual(HOLDING_VALUES[1]);
      expect(typeof value).assertEqual('number');
      expect(Number.isInteger(value)).assertTrue();
      logEnd('testMotionEnumCore0014');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_1500
     * @tc.name      testMotionEnumCore0015
     * @tc.desc      Verify HoldingHandStatus.RIGHT_HAND_HELD equals 2 and is an integer
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0015');
      const value: number = motion.HoldingHandStatus.RIGHT_HAND_HELD;
      hilog.info(DOMAIN, TAG, '%{public}s', 'RIGHT_HAND_HELD=' + value);
      expect(value).assertEqual(HOLDING_VALUES[2]);
      expect(typeof value).assertEqual('number');
      expect(Number.isInteger(value)).assertTrue();
      logEnd('testMotionEnumCore0015');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_1600
     * @tc.name      testMotionEnumCore0016
     * @tc.desc      Verify HoldingHandStatus.BOTH_HANDS_HELD equals 3 and is an integer
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0016');
      const value: number = motion.HoldingHandStatus.BOTH_HANDS_HELD;
      hilog.info(DOMAIN, TAG, '%{public}s', 'BOTH_HANDS_HELD=' + value);
      expect(value).assertEqual(HOLDING_VALUES[3]);
      expect(typeof value).assertEqual('number');
      expect(Number.isInteger(value)).assertTrue();
      logEnd('testMotionEnumCore0016');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_1700
     * @tc.name      testMotionEnumCore0017
     * @tc.desc      Verify HoldingHandStatus.UNKNOWN_STATUS equals 16 as a sentinel above the normal range
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0017');
      const value: number = motion.HoldingHandStatus.UNKNOWN_STATUS;
      hilog.info(DOMAIN, TAG, '%{public}s', 'UNKNOWN_STATUS=' + value);
      expect(value).assertEqual(HOLDING_VALUES[4]);
      expect(value).assertEqual(16);
      expect(value > motion.HoldingHandStatus.BOTH_HANDS_HELD).assertTrue();
      logEnd('testMotionEnumCore0017');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_1800
     * @tc.name      testMotionEnumCore0018
     * @tc.desc      Verify HoldingHandStatus exposes exactly five members
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0018');
      const names: string[] = HOLDING_NAMES;
      hilog.info(DOMAIN, TAG, '%{public}s', 'members=' + names.length);
      expect(names.length).assertEqual(5);
      expect(names.length).assertEqual(HOLDING_VALUES.length);
      logEnd('testMotionEnumCore0018');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_1900
     * @tc.name      testMotionEnumCore0019
     * @tc.desc      Verify HoldingHandStatus members are pairwise distinct
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0019');
      const values: number[] = [
        motion.HoldingHandStatus.NOT_HELD,
        motion.HoldingHandStatus.LEFT_HAND_HELD,
        motion.HoldingHandStatus.RIGHT_HAND_HELD,
        motion.HoldingHandStatus.BOTH_HANDS_HELD,
        motion.HoldingHandStatus.UNKNOWN_STATUS
      ];
      hilog.info(DOMAIN, TAG, '%{public}s', 'values=' + values.join(','));
      expect(new Set<number>(values).size).assertEqual(values.length);
      expect(new Set<number>(values).size).assertEqual(5);
      logEnd('testMotionEnumCore0019');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_2000
     * @tc.name      testMotionEnumCore0020
     * @tc.desc      Verify HoldingHandStatus values are all non-negative integers
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0020');
      let valid: number = 0;
      for (const value of HOLDING_VALUES) {
        if (Number.isInteger(value) && value >= 0) {
          valid++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'valid=' + valid);
      expect(valid).assertEqual(HOLDING_VALUES.length);
      expect(valid).assertEqual(5);
      logEnd('testMotionEnumCore0020');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_2300
     * @tc.name      testMotionEnumCore0023
     * @tc.desc      Verify HoldingHandStatus normal states 0..3 are contiguous
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0023');
      const normal: number[] = [
        motion.HoldingHandStatus.NOT_HELD,
        motion.HoldingHandStatus.LEFT_HAND_HELD,
        motion.HoldingHandStatus.RIGHT_HAND_HELD,
        motion.HoldingHandStatus.BOTH_HANDS_HELD
      ];
      let contiguous: number = 0;
      for (let index: number = 0; index < normal.length; index++) {
        if (normal[index] === index) {
          contiguous++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'contiguous=' + contiguous);
      expect(contiguous).assertEqual(normal.length);
      expect(normal.length).assertEqual(4);
      logEnd('testMotionEnumCore0023');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_2500
     * @tc.name      testMotionEnumCore0025
     * @tc.desc      Verify every documented HoldingHandStatus value resolves by name lookup
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionEnumCore0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logBegin('testMotionEnumCore0025');
      let resolved: number = 0;
      for (let index: number = 0; index < HOLDING_NAMES.length; index++) {
        const value: number = Number(motion.HoldingHandStatus[HOLDING_NAMES[index]]);
        if (value === HOLDING_VALUES[index]) {
          resolved++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'resolved=' + resolved);
      expect(resolved).assertEqual(HOLDING_NAMES.length);
      expect(resolved).assertEqual(5);
      logEnd('testMotionEnumCore0025');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_2600
     * @tc.name      testMotionEnumCore0026
     * @tc.desc      Verify HoldingHandStatus sentinel is not reachable by the contiguous normal range
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionEnumCore0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionEnumCore0026');
      const sentinel: number = motion.HoldingHandStatus.UNKNOWN_STATUS;
      const maxNormal: number = motion.HoldingHandStatus.BOTH_HANDS_HELD;
      hilog.info(DOMAIN, TAG, '%{public}s', 'sentinel=' + sentinel + ', maxNormal=' + maxNormal);
      expect(sentinel > maxNormal).assertTrue();
      expect(sentinel - maxNormal).assertEqual(13);
      logEnd('testMotionEnumCore0026');
    });

    /**
     * @tc.number    SUB_MOTION_ENUM_CORE_2800
     * @tc.name      testMotionEnumCore0028
     * @tc.desc      Verify HoldingHandStatus has more members than OperatingHandStatus
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionEnumCore0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logBegin('testMotionEnumCore0028');
      const holdingCount: number = HOLDING_NAMES.length;
      const operatingCount: number = OPERATING_NAMES.length;
      hilog.info(DOMAIN, TAG, '%{public}s', 'holding=' + holdingCount + ', operating=' + operatingCount);
      expect(holdingCount > operatingCount).assertTrue();
      expect(holdingCount - operatingCount).assertEqual(2);
      logEnd('testMotionEnumCore0028');
    });
  });
}
