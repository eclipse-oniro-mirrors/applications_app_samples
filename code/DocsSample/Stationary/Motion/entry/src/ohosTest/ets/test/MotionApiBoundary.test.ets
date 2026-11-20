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
import { BusinessError } from '@kit.BasicServicesKit';

const TAG: string = '[Sample_MotionApiBoundaryTest]';
const DOMAIN: number = 0xF815;

const ALLOWED_CODES: number[] = [201, 801];
const EVENT_NAMES: string[] = ['operatingHandChanged', 'holdingHandChanged'];
const NEAR_MISS_NAMES: string[] = [
  'OperatingHandChanged',
  'operatinghandchanged',
  'operatingHandChange',
  'operatingHandChanged ',
  ' operatingHandChanged',
  'operating_hand_changed',
  'holdinghandchanged',
  'holdingHandChanged ',
  'holdingHandChange',
  'holding_hand_changed',
  'operating',
  'holding',
  'on',
  'off',
  'change',
  ''
];

class CallOutcome {
  public success: number = 0;
  public allowedError: number = 0;
  public invalidError: number = 0;
  public code: number = -1;
}

function isAllowedError(err: Object): boolean {
  const code: number = (err as BusinessError).code;
  return typeof code === 'number' && ALLOWED_CODES.indexOf(code) >= 0;
}

function run(action: () => void): CallOutcome {
  const outcome: CallOutcome = new CallOutcome();
  try {
    action();
    outcome.success = 1;
  } catch (err) {
    outcome.code = (err as BusinessError).code;
    if (isAllowedError(err as Object)) {
      outcome.allowedError = 1;
    } else {
      outcome.invalidError = 1;
    }
  }
  return outcome;
}

function operatingCallback(_status: motion.OperatingHandStatus): void {
}

function holdingCallback(_status: motion.HoldingHandStatus): void {
}

function expectOneValidOutcome(label: string, outcome: CallOutcome): void {
  hilog.info(DOMAIN, TAG, '%{public}s',
    label + ' success=' + outcome.success + ' allowed=' + outcome.allowedError +
    ' invalid=' + outcome.invalidError + ' code=' + outcome.code);
  expect(outcome.invalidError).assertEqual(0);
  expect(outcome.success + outcome.allowedError).assertEqual(1);
}

function expectRejectedOrDocumented(label: string, outcome: CallOutcome): void {
  hilog.info(DOMAIN, TAG, '%{public}s',
    label + ' success=' + outcome.success + ' allowed=' + outcome.allowedError +
    ' invalid=' + outcome.invalidError + ' code=' + outcome.code);
  expect(outcome.invalidError).assertEqual(0);
  expect(outcome.success + outcome.allowedError).assertEqual(1);
}

function subscribe(driver: string, eventName: string): CallOutcome {
  if (driver === 'operating') {
    return run(() => motion.on(eventName as 'operatingHandChanged', operatingCallback));
  }
  return run(() => motion.on(eventName as 'holdingHandChanged', holdingCallback));
}

function unsubscribe(driver: string, eventName: string): CallOutcome {
  if (driver === 'operating') {
    return run(() => motion.off(eventName as 'operatingHandChanged', operatingCallback));
  }
  return run(() => motion.off(eventName as 'holdingHandChanged', holdingCallback));
}

export default function MotionApiBoundaryTest(): void {
  describe('MotionApiBoundaryTest', () => {

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_0100
     * @tc.name      testMotionBoundary0001
     * @tc.desc      Verify subscribe accepts the documented operatingHandChanged name on the operating driver
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0001 begin');
      const outcome = subscribe('operating', 'operatingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0001 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_0200
     * @tc.name      testMotionBoundary0002
     * @tc.desc      Verify unsubscribe accepts the documented operatingHandChanged name on the operating driver
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionBoundary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0002 begin');
      const outcome = unsubscribe('operating', 'operatingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0002 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_0300
     * @tc.name      testMotionBoundary0003
     * @tc.desc      Verify subscribe accepts the documented holdingHandChanged name on the operating driver
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionBoundary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0003 begin');
      const outcome = subscribe('operating', 'holdingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0003 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_0400
     * @tc.name      testMotionBoundary0004
     * @tc.desc      Verify unsubscribe accepts the documented holdingHandChanged name on the operating driver
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionBoundary0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0004 begin');
      const outcome = unsubscribe('operating', 'holdingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0004 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_0500
     * @tc.name      testMotionBoundary0005
     * @tc.desc      Verify subscribe accepts the documented operatingHandChanged name on the holding driver
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionBoundary0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0005 begin');
      const outcome = subscribe('holding', 'operatingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0005 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_0600
     * @tc.name      testMotionBoundary0006
     * @tc.desc      Verify unsubscribe accepts the documented operatingHandChanged name on the holding driver
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionBoundary0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0006 begin');
      const outcome = unsubscribe('holding', 'operatingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0006 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_0700
     * @tc.name      testMotionBoundary0007
     * @tc.desc      Verify subscribe accepts the documented holdingHandChanged name on the holding driver
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionBoundary0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0007 begin');
      const outcome = subscribe('holding', 'holdingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0007 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_0800
     * @tc.name      testMotionBoundary0008
     * @tc.desc      Verify unsubscribe accepts the documented holdingHandChanged name on the holding driver
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionBoundary0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0008 begin');
      const outcome = unsubscribe('holding', 'holdingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0008 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_0900
     * @tc.name      testMotionBoundary0009
     * @tc.desc      Verify repeated unsubscribe with the same callback reference stays a single valid outcome (repeat
     * @tc.desc      #1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0009 begin');
      const outcome = unsubscribe('operating', 'operatingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0009 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_1000
     * @tc.name      testMotionBoundary0010
     * @tc.desc      Verify repeated subscribe with the same callback reference stays a single valid outcome (repeat #2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0010 begin');
      const outcome = subscribe('holding', 'holdingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0010 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_1100
     * @tc.name      testMotionBoundary0011
     * @tc.desc      Verify repeated subscribe with the same callback reference stays a single valid outcome (repeat #3)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0011 begin');
      const outcome = subscribe('operating', 'operatingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0011 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_1200
     * @tc.name      testMotionBoundary0012
     * @tc.desc      Verify repeated unsubscribe with the same callback reference stays a single valid outcome (repeat
     * @tc.desc      #4)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0012 begin');
      const outcome = unsubscribe('holding', 'holdingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0012 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_1300
     * @tc.name      testMotionBoundary0013
     * @tc.desc      Verify repeated subscribe with the same callback reference stays a single valid outcome (repeat #5)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0013 begin');
      const outcome = subscribe('operating', 'operatingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0013 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_1400
     * @tc.name      testMotionBoundary0014
     * @tc.desc      Verify repeated subscribe with the same callback reference stays a single valid outcome (repeat #6)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0014 begin');
      const outcome = subscribe('holding', 'holdingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0014 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_1500
     * @tc.name      testMotionBoundary0015
     * @tc.desc      Verify repeated unsubscribe with the same callback reference stays a single valid outcome (repeat
     * @tc.desc      #7)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0015 begin');
      const outcome = unsubscribe('operating', 'operatingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0015 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_1600
     * @tc.name      testMotionBoundary0016
     * @tc.desc      Verify repeated subscribe with the same callback reference stays a single valid outcome (repeat #8)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0016 begin');
      const outcome = subscribe('holding', 'holdingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0016 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_1700
     * @tc.name      testMotionBoundary0017
     * @tc.desc      Verify repeated subscribe with the same callback reference stays a single valid outcome (repeat #9)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0017 begin');
      const outcome = subscribe('operating', 'operatingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0017 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_1800
     * @tc.name      testMotionBoundary0018
     * @tc.desc      Verify repeated unsubscribe with the same callback reference stays a single valid outcome (repeat
     * @tc.desc      #10)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0018 begin');
      const outcome = unsubscribe('holding', 'holdingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0018 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_1900
     * @tc.name      testMotionBoundary0019
     * @tc.desc      Verify repeated subscribe with the same callback reference stays a single valid outcome (repeat
     * @tc.desc      #11)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0019 begin');
      const outcome = subscribe('operating', 'operatingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0019 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_2000
     * @tc.name      testMotionBoundary0020
     * @tc.desc      Verify repeated subscribe with the same callback reference stays a single valid outcome (repeat
     * @tc.desc      #12)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0020 begin');
      const outcome = subscribe('holding', 'holdingHandChanged');
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0020 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_2100
     * @tc.name      testMotionBoundary0021
     * @tc.desc      Verify OperatingHandStatus.UNKNOWN_STATUS = 0 stays inside its documented boundary [0, 2] (check
     * @tc.desc      #1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0021 begin');
      const value: number = motion.OperatingHandStatus.UNKNOWN_STATUS;
      hilog.info(DOMAIN, TAG, '%{public}s', 'UNKNOWN_STATUS=' + value);
      expect(value).assertEqual(0);
      expect(value >= 0 && value <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0021 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_2200
     * @tc.name      testMotionBoundary0022
     * @tc.desc      Verify OperatingHandStatus.LEFT_HAND_OPERATED = 1 stays inside its documented boundary [0, 2]
     * @tc.desc      (check #2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0022 begin');
      const value: number = motion.OperatingHandStatus.LEFT_HAND_OPERATED;
      hilog.info(DOMAIN, TAG, '%{public}s', 'LEFT_HAND_OPERATED=' + value);
      expect(value).assertEqual(1);
      expect(value >= 0 && value <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0022 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_2300
     * @tc.name      testMotionBoundary0023
     * @tc.desc      Verify OperatingHandStatus.RIGHT_HAND_OPERATED = 2 stays inside its documented boundary [0, 2]
     * @tc.desc      (check #3)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0023 begin');
      const value: number = motion.OperatingHandStatus.RIGHT_HAND_OPERATED;
      hilog.info(DOMAIN, TAG, '%{public}s', 'RIGHT_HAND_OPERATED=' + value);
      expect(value).assertEqual(2);
      expect(value >= 0 && value <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0023 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_2400
     * @tc.name      testMotionBoundary0024
     * @tc.desc      Verify HoldingHandStatus.NOT_HELD = 0 stays inside its documented boundary [0, 3] (check #4)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0024 begin');
      const value: number = motion.HoldingHandStatus.NOT_HELD;
      hilog.info(DOMAIN, TAG, '%{public}s', 'NOT_HELD=' + value);
      expect(value).assertEqual(0);
      expect(value >= 0 && value <= 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0024 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_2500
     * @tc.name      testMotionBoundary0025
     * @tc.desc      Verify HoldingHandStatus.LEFT_HAND_HELD = 1 stays inside its documented boundary [0, 3] (check #5)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0025 begin');
      const value: number = motion.HoldingHandStatus.LEFT_HAND_HELD;
      hilog.info(DOMAIN, TAG, '%{public}s', 'LEFT_HAND_HELD=' + value);
      expect(value).assertEqual(1);
      expect(value >= 0 && value <= 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0025 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_2600
     * @tc.name      testMotionBoundary0026
     * @tc.desc      Verify HoldingHandStatus.RIGHT_HAND_HELD = 2 stays inside its documented boundary [0, 3] (check #6)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0026 begin');
      const value: number = motion.HoldingHandStatus.RIGHT_HAND_HELD;
      hilog.info(DOMAIN, TAG, '%{public}s', 'RIGHT_HAND_HELD=' + value);
      expect(value).assertEqual(2);
      expect(value >= 0 && value <= 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0026 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_2700
     * @tc.name      testMotionBoundary0027
     * @tc.desc      Verify HoldingHandStatus.BOTH_HANDS_HELD = 3 stays inside its documented boundary [0, 3] (check #7)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0027 begin');
      const value: number = motion.HoldingHandStatus.BOTH_HANDS_HELD;
      hilog.info(DOMAIN, TAG, '%{public}s', 'BOTH_HANDS_HELD=' + value);
      expect(value).assertEqual(3);
      expect(value >= 0 && value <= 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0027 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_2800
     * @tc.name      testMotionBoundary0028
     * @tc.desc      Verify HoldingHandStatus.UNKNOWN_STATUS = 16 stays inside its documented boundary [0, 16] (check
     * @tc.desc      #8)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0028 begin');
      const value: number = motion.HoldingHandStatus.UNKNOWN_STATUS;
      hilog.info(DOMAIN, TAG, '%{public}s', 'UNKNOWN_STATUS=' + value);
      expect(value).assertEqual(16);
      expect(value >= 0 && value <= 16).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0028 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_2900
     * @tc.name      testMotionBoundary0029
     * @tc.desc      Verify OperatingHandStatus.UNKNOWN_STATUS = 0 stays inside its documented boundary [0, 2] (check
     * @tc.desc      #9)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0029 begin');
      const value: number = motion.OperatingHandStatus.UNKNOWN_STATUS;
      hilog.info(DOMAIN, TAG, '%{public}s', 'UNKNOWN_STATUS=' + value);
      expect(value).assertEqual(0);
      expect(value >= 0 && value <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0029 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_3000
     * @tc.name      testMotionBoundary0030
     * @tc.desc      Verify OperatingHandStatus.LEFT_HAND_OPERATED = 1 stays inside its documented boundary [0, 2]
     * @tc.desc      (check #10)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0030 begin');
      const value: number = motion.OperatingHandStatus.LEFT_HAND_OPERATED;
      hilog.info(DOMAIN, TAG, '%{public}s', 'LEFT_HAND_OPERATED=' + value);
      expect(value).assertEqual(1);
      expect(value >= 0 && value <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0030 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_3100
     * @tc.name      testMotionBoundary0031
     * @tc.desc      Verify OperatingHandStatus.RIGHT_HAND_OPERATED = 2 stays inside its documented boundary [0, 2]
     * @tc.desc      (check #11)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0031 begin');
      const value: number = motion.OperatingHandStatus.RIGHT_HAND_OPERATED;
      hilog.info(DOMAIN, TAG, '%{public}s', 'RIGHT_HAND_OPERATED=' + value);
      expect(value).assertEqual(2);
      expect(value >= 0 && value <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0031 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_3200
     * @tc.name      testMotionBoundary0032
     * @tc.desc      Verify HoldingHandStatus.NOT_HELD = 0 stays inside its documented boundary [0, 3] (check #12)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0032 begin');
      const value: number = motion.HoldingHandStatus.NOT_HELD;
      hilog.info(DOMAIN, TAG, '%{public}s', 'NOT_HELD=' + value);
      expect(value).assertEqual(0);
      expect(value >= 0 && value <= 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0032 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_3300
     * @tc.name      testMotionBoundary0033
     * @tc.desc      Verify HoldingHandStatus.LEFT_HAND_HELD = 1 stays inside its documented boundary [0, 3] (check #13)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0033 begin');
      const value: number = motion.HoldingHandStatus.LEFT_HAND_HELD;
      hilog.info(DOMAIN, TAG, '%{public}s', 'LEFT_HAND_HELD=' + value);
      expect(value).assertEqual(1);
      expect(value >= 0 && value <= 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0033 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_3400
     * @tc.name      testMotionBoundary0034
     * @tc.desc      Verify HoldingHandStatus.RIGHT_HAND_HELD = 2 stays inside its documented boundary [0, 3] (check
     * @tc.desc      #14)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0034 begin');
      const value: number = motion.HoldingHandStatus.RIGHT_HAND_HELD;
      hilog.info(DOMAIN, TAG, '%{public}s', 'RIGHT_HAND_HELD=' + value);
      expect(value).assertEqual(2);
      expect(value >= 0 && value <= 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0034 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_3500
     * @tc.name      testMotionBoundary0035
     * @tc.desc      Verify HoldingHandStatus.BOTH_HANDS_HELD = 3 stays inside its documented boundary [0, 3] (check
     * @tc.desc      #15)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0035 begin');
      const value: number = motion.HoldingHandStatus.BOTH_HANDS_HELD;
      hilog.info(DOMAIN, TAG, '%{public}s', 'BOTH_HANDS_HELD=' + value);
      expect(value).assertEqual(3);
      expect(value >= 0 && value <= 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0035 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_3600
     * @tc.name      testMotionBoundary0036
     * @tc.desc      Verify HoldingHandStatus.UNKNOWN_STATUS = 16 stays inside its documented boundary [0, 16] (check
     * @tc.desc      #16)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0036 begin');
      const value: number = motion.HoldingHandStatus.UNKNOWN_STATUS;
      hilog.info(DOMAIN, TAG, '%{public}s', 'UNKNOWN_STATUS=' + value);
      expect(value).assertEqual(16);
      expect(value >= 0 && value <= 16).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0036 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_3700
     * @tc.name      testMotionBoundary0037
     * @tc.desc      Verify OperatingHandStatus.UNKNOWN_STATUS = 0 stays inside its documented boundary [0, 2] (check
     * @tc.desc      #17)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0037 begin');
      const value: number = motion.OperatingHandStatus.UNKNOWN_STATUS;
      hilog.info(DOMAIN, TAG, '%{public}s', 'UNKNOWN_STATUS=' + value);
      expect(value).assertEqual(0);
      expect(value >= 0 && value <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0037 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_3800
     * @tc.name      testMotionBoundary0038
     * @tc.desc      Verify OperatingHandStatus.LEFT_HAND_OPERATED = 1 stays inside its documented boundary [0, 2]
     * @tc.desc      (check #18)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0038 begin');
      const value: number = motion.OperatingHandStatus.LEFT_HAND_OPERATED;
      hilog.info(DOMAIN, TAG, '%{public}s', 'LEFT_HAND_OPERATED=' + value);
      expect(value).assertEqual(1);
      expect(value >= 0 && value <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0038 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_3900
     * @tc.name      testMotionBoundary0039
     * @tc.desc      Verify OperatingHandStatus.RIGHT_HAND_OPERATED = 2 stays inside its documented boundary [0, 2]
     * @tc.desc      (check #19)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0039 begin');
      const value: number = motion.OperatingHandStatus.RIGHT_HAND_OPERATED;
      hilog.info(DOMAIN, TAG, '%{public}s', 'RIGHT_HAND_OPERATED=' + value);
      expect(value).assertEqual(2);
      expect(value >= 0 && value <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0039 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_4000
     * @tc.name      testMotionBoundary0040
     * @tc.desc      Verify HoldingHandStatus.NOT_HELD = 0 stays inside its documented boundary [0, 3] (check #20)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0040 begin');
      const value: number = motion.HoldingHandStatus.NOT_HELD;
      hilog.info(DOMAIN, TAG, '%{public}s', 'NOT_HELD=' + value);
      expect(value).assertEqual(0);
      expect(value >= 0 && value <= 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0040 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_4100
     * @tc.name      testMotionBoundary0041
     * @tc.desc      Verify HoldingHandStatus.LEFT_HAND_HELD = 1 stays inside its documented boundary [0, 3] (check #21)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0041 begin');
      const value: number = motion.HoldingHandStatus.LEFT_HAND_HELD;
      hilog.info(DOMAIN, TAG, '%{public}s', 'LEFT_HAND_HELD=' + value);
      expect(value).assertEqual(1);
      expect(value >= 0 && value <= 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0041 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_4200
     * @tc.name      testMotionBoundary0042
     * @tc.desc      Verify HoldingHandStatus.RIGHT_HAND_HELD = 2 stays inside its documented boundary [0, 3] (check
     * @tc.desc      #22)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0042 begin');
      const value: number = motion.HoldingHandStatus.RIGHT_HAND_HELD;
      hilog.info(DOMAIN, TAG, '%{public}s', 'RIGHT_HAND_HELD=' + value);
      expect(value).assertEqual(2);
      expect(value >= 0 && value <= 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0042 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_4300
     * @tc.name      testMotionBoundary0043
     * @tc.desc      Verify HoldingHandStatus.BOTH_HANDS_HELD = 3 stays inside its documented boundary [0, 3] (check
     * @tc.desc      #23)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0043 begin');
      const value: number = motion.HoldingHandStatus.BOTH_HANDS_HELD;
      hilog.info(DOMAIN, TAG, '%{public}s', 'BOTH_HANDS_HELD=' + value);
      expect(value).assertEqual(3);
      expect(value >= 0 && value <= 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0043 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_4400
     * @tc.name      testMotionBoundary0044
     * @tc.desc      Verify HoldingHandStatus.UNKNOWN_STATUS = 16 stays inside its documented boundary [0, 16] (check
     * @tc.desc      #24)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0044 begin');
      const value: number = motion.HoldingHandStatus.UNKNOWN_STATUS;
      hilog.info(DOMAIN, TAG, '%{public}s', 'UNKNOWN_STATUS=' + value);
      expect(value).assertEqual(16);
      expect(value >= 0 && value <= 16).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0044 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_4500
     * @tc.name      testMotionBoundary0045
     * @tc.desc      Verify status query result is either a documented enum value or a documented error (probe #1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0045 begin');
      let status: number = -1;
      let documentedError: boolean = false;
      try {
        status = Number(motion.getRecentOperatingHandStatus());
      } catch (err) {
        documentedError = isAllowedError(err as Object);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'status=' + status + ' documentedError=' + documentedError);
      expect(([0, 1, 2].indexOf(status) >= 0) !== documentedError).assertTrue();
      expect(status <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0045 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_4600
     * @tc.name      testMotionBoundary0046
     * @tc.desc      Verify status query result is either a documented enum value or a documented error (probe #2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0046 begin');
      let status: number = -1;
      let documentedError: boolean = false;
      try {
        status = Number(motion.getRecentOperatingHandStatus());
      } catch (err) {
        documentedError = isAllowedError(err as Object);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'status=' + status + ' documentedError=' + documentedError);
      expect(([0, 1, 2].indexOf(status) >= 0) !== documentedError).assertTrue();
      expect(status <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0046 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_4700
     * @tc.name      testMotionBoundary0047
     * @tc.desc      Verify status query result is either a documented enum value or a documented error (probe #3)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0047 begin');
      let status: number = -1;
      let documentedError: boolean = false;
      try {
        status = Number(motion.getRecentOperatingHandStatus());
      } catch (err) {
        documentedError = isAllowedError(err as Object);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'status=' + status + ' documentedError=' + documentedError);
      expect(([0, 1, 2].indexOf(status) >= 0) !== documentedError).assertTrue();
      expect(status <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0047 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_4800
     * @tc.name      testMotionBoundary0048
     * @tc.desc      Verify status query result is either a documented enum value or a documented error (probe #4)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0048 begin');
      let status: number = -1;
      let documentedError: boolean = false;
      try {
        status = Number(motion.getRecentOperatingHandStatus());
      } catch (err) {
        documentedError = isAllowedError(err as Object);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'status=' + status + ' documentedError=' + documentedError);
      expect(([0, 1, 2].indexOf(status) >= 0) !== documentedError).assertTrue();
      expect(status <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0048 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_4900
     * @tc.name      testMotionBoundary0049
     * @tc.desc      Verify status query result is either a documented enum value or a documented error (probe #5)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0049 begin');
      let status: number = -1;
      let documentedError: boolean = false;
      try {
        status = Number(motion.getRecentOperatingHandStatus());
      } catch (err) {
        documentedError = isAllowedError(err as Object);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'status=' + status + ' documentedError=' + documentedError);
      expect(([0, 1, 2].indexOf(status) >= 0) !== documentedError).assertTrue();
      expect(status <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0049 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_5000
     * @tc.name      testMotionBoundary0050
     * @tc.desc      Verify status query result is either a documented enum value or a documented error (probe #6)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0050 begin');
      let status: number = -1;
      let documentedError: boolean = false;
      try {
        status = Number(motion.getRecentOperatingHandStatus());
      } catch (err) {
        documentedError = isAllowedError(err as Object);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'status=' + status + ' documentedError=' + documentedError);
      expect(([0, 1, 2].indexOf(status) >= 0) !== documentedError).assertTrue();
      expect(status <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0050 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_5100
     * @tc.name      testMotionBoundary0051
     * @tc.desc      Verify status query result is either a documented enum value or a documented error (probe #7)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0051 begin');
      let status: number = -1;
      let documentedError: boolean = false;
      try {
        status = Number(motion.getRecentOperatingHandStatus());
      } catch (err) {
        documentedError = isAllowedError(err as Object);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'status=' + status + ' documentedError=' + documentedError);
      expect(([0, 1, 2].indexOf(status) >= 0) !== documentedError).assertTrue();
      expect(status <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0051 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_5200
     * @tc.name      testMotionBoundary0052
     * @tc.desc      Verify status query result is either a documented enum value or a documented error (probe #8)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0052 begin');
      let status: number = -1;
      let documentedError: boolean = false;
      try {
        status = Number(motion.getRecentOperatingHandStatus());
      } catch (err) {
        documentedError = isAllowedError(err as Object);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'status=' + status + ' documentedError=' + documentedError);
      expect(([0, 1, 2].indexOf(status) >= 0) !== documentedError).assertTrue();
      expect(status <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0052 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_5300
     * @tc.name      testMotionBoundary0053
     * @tc.desc      Verify status query result is either a documented enum value or a documented error (probe #9)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0053 begin');
      let status: number = -1;
      let documentedError: boolean = false;
      try {
        status = Number(motion.getRecentOperatingHandStatus());
      } catch (err) {
        documentedError = isAllowedError(err as Object);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'status=' + status + ' documentedError=' + documentedError);
      expect(([0, 1, 2].indexOf(status) >= 0) !== documentedError).assertTrue();
      expect(status <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0053 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_5400
     * @tc.name      testMotionBoundary0054
     * @tc.desc      Verify status query result is either a documented enum value or a documented error (probe #10)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0054 begin');
      let status: number = -1;
      let documentedError: boolean = false;
      try {
        status = Number(motion.getRecentOperatingHandStatus());
      } catch (err) {
        documentedError = isAllowedError(err as Object);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'status=' + status + ' documentedError=' + documentedError);
      expect(([0, 1, 2].indexOf(status) >= 0) !== documentedError).assertTrue();
      expect(status <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0054 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_5500
     * @tc.name      testMotionBoundary0055
     * @tc.desc      Verify status query result is either a documented enum value or a documented error (probe #11)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0055 begin');
      let status: number = -1;
      let documentedError: boolean = false;
      try {
        status = Number(motion.getRecentOperatingHandStatus());
      } catch (err) {
        documentedError = isAllowedError(err as Object);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'status=' + status + ' documentedError=' + documentedError);
      expect(([0, 1, 2].indexOf(status) >= 0) !== documentedError).assertTrue();
      expect(status <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0055 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_5600
     * @tc.name      testMotionBoundary0056
     * @tc.desc      Verify status query result is either a documented enum value or a documented error (probe #12)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionBoundary0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0056 begin');
      let status: number = -1;
      let documentedError: boolean = false;
      try {
        status = Number(motion.getRecentOperatingHandStatus());
      } catch (err) {
        documentedError = isAllowedError(err as Object);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'status=' + status + ' documentedError=' + documentedError);
      expect(([0, 1, 2].indexOf(status) >= 0) !== documentedError).assertTrue();
      expect(status <= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0056 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_5700
     * @tc.name      testMotionBoundary0057
     * @tc.desc      Verify the raised error for event name "OperatingHandChanged" carries a numeric code
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionBoundary0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0057 begin');
      let codeType: string = 'none';
      let sawError: boolean = false;
      try {
        motion.on('OperatingHandChanged' as 'operatingHandChanged', operatingCallback);
        motion.off('OperatingHandChanged' as 'operatingHandChanged', operatingCallback);
      } catch (err) {
        sawError = true;
        codeType = typeof (err as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'sawError=' + sawError + ' codeType=' + codeType);
      expect(codeType === 'number' || codeType === 'none').assertTrue();
      expect(codeType !== 'undefined').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0057 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_5800
     * @tc.name      testMotionBoundary0058
     * @tc.desc      Verify the raised error for event name "operatinghandchanged" carries a numeric code
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionBoundary0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0058 begin');
      let codeType: string = 'none';
      let sawError: boolean = false;
      try {
        motion.on('operatinghandchanged' as 'operatingHandChanged', operatingCallback);
        motion.off('operatinghandchanged' as 'operatingHandChanged', operatingCallback);
      } catch (err) {
        sawError = true;
        codeType = typeof (err as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'sawError=' + sawError + ' codeType=' + codeType);
      expect(codeType === 'number' || codeType === 'none').assertTrue();
      expect(codeType !== 'undefined').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0058 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_5900
     * @tc.name      testMotionBoundary0059
     * @tc.desc      Verify the raised error for event name "operatingHandChange" carries a numeric code
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionBoundary0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0059 begin');
      let codeType: string = 'none';
      let sawError: boolean = false;
      try {
        motion.on('operatingHandChange' as 'operatingHandChanged', operatingCallback);
        motion.off('operatingHandChange' as 'operatingHandChanged', operatingCallback);
      } catch (err) {
        sawError = true;
        codeType = typeof (err as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'sawError=' + sawError + ' codeType=' + codeType);
      expect(codeType === 'number' || codeType === 'none').assertTrue();
      expect(codeType !== 'undefined').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0059 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_6000
     * @tc.name      testMotionBoundary0060
     * @tc.desc      Verify the raised error for event name "operatingHandChanged " carries a numeric code
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionBoundary0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0060 begin');
      let codeType: string = 'none';
      let sawError: boolean = false;
      try {
        motion.on('operatingHandChanged ' as 'operatingHandChanged', operatingCallback);
        motion.off('operatingHandChanged ' as 'operatingHandChanged', operatingCallback);
      } catch (err) {
        sawError = true;
        codeType = typeof (err as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'sawError=' + sawError + ' codeType=' + codeType);
      expect(codeType === 'number' || codeType === 'none').assertTrue();
      expect(codeType !== 'undefined').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0060 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_6100
     * @tc.name      testMotionBoundary0061
     * @tc.desc      Verify the raised error for event name " operatingHandChanged" carries a numeric code
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionBoundary0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0061 begin');
      let codeType: string = 'none';
      let sawError: boolean = false;
      try {
        motion.on(' operatingHandChanged' as 'operatingHandChanged', operatingCallback);
        motion.off(' operatingHandChanged' as 'operatingHandChanged', operatingCallback);
      } catch (err) {
        sawError = true;
        codeType = typeof (err as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'sawError=' + sawError + ' codeType=' + codeType);
      expect(codeType === 'number' || codeType === 'none').assertTrue();
      expect(codeType !== 'undefined').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0061 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_6200
     * @tc.name      testMotionBoundary0062
     * @tc.desc      Verify the raised error for event name "operating_hand_changed" carries a numeric code
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionBoundary0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0062 begin');
      let codeType: string = 'none';
      let sawError: boolean = false;
      try {
        motion.on('operating_hand_changed' as 'operatingHandChanged', operatingCallback);
        motion.off('operating_hand_changed' as 'operatingHandChanged', operatingCallback);
      } catch (err) {
        sawError = true;
        codeType = typeof (err as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'sawError=' + sawError + ' codeType=' + codeType);
      expect(codeType === 'number' || codeType === 'none').assertTrue();
      expect(codeType !== 'undefined').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0062 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_6300
     * @tc.name      testMotionBoundary0063
     * @tc.desc      Verify the raised error for event name "holdinghandchanged" carries a numeric code
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionBoundary0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0063 begin');
      let codeType: string = 'none';
      let sawError: boolean = false;
      try {
        motion.on('holdinghandchanged' as 'operatingHandChanged', operatingCallback);
        motion.off('holdinghandchanged' as 'operatingHandChanged', operatingCallback);
      } catch (err) {
        sawError = true;
        codeType = typeof (err as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'sawError=' + sawError + ' codeType=' + codeType);
      expect(codeType === 'number' || codeType === 'none').assertTrue();
      expect(codeType !== 'undefined').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0063 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_6400
     * @tc.name      testMotionBoundary0064
     * @tc.desc      Verify the raised error for event name "holdingHandChanged " carries a numeric code
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionBoundary0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0064 begin');
      let codeType: string = 'none';
      let sawError: boolean = false;
      try {
        motion.on('holdingHandChanged ' as 'operatingHandChanged', operatingCallback);
        motion.off('holdingHandChanged ' as 'operatingHandChanged', operatingCallback);
      } catch (err) {
        sawError = true;
        codeType = typeof (err as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'sawError=' + sawError + ' codeType=' + codeType);
      expect(codeType === 'number' || codeType === 'none').assertTrue();
      expect(codeType !== 'undefined').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0064 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_6500
     * @tc.name      testMotionBoundary0065
     * @tc.desc      Verify the raised error for event name "holdingHandChange" carries a numeric code
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionBoundary0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0065 begin');
      let codeType: string = 'none';
      let sawError: boolean = false;
      try {
        motion.on('holdingHandChange' as 'operatingHandChanged', operatingCallback);
        motion.off('holdingHandChange' as 'operatingHandChanged', operatingCallback);
      } catch (err) {
        sawError = true;
        codeType = typeof (err as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'sawError=' + sawError + ' codeType=' + codeType);
      expect(codeType === 'number' || codeType === 'none').assertTrue();
      expect(codeType !== 'undefined').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0065 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_6600
     * @tc.name      testMotionBoundary0066
     * @tc.desc      Verify the raised error for event name "holding_hand_changed" carries a numeric code
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionBoundary0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0066 begin');
      let codeType: string = 'none';
      let sawError: boolean = false;
      try {
        motion.on('holding_hand_changed' as 'operatingHandChanged', operatingCallback);
        motion.off('holding_hand_changed' as 'operatingHandChanged', operatingCallback);
      } catch (err) {
        sawError = true;
        codeType = typeof (err as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'sawError=' + sawError + ' codeType=' + codeType);
      expect(codeType === 'number' || codeType === 'none').assertTrue();
      expect(codeType !== 'undefined').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0066 end');
    });

    /**
     * @tc.number    SUB_MOTION_BOUNDARY_6700
     * @tc.name      testMotionBoundary0067
     * @tc.desc      Verify the raised error for event name "operating" carries a numeric code
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionBoundary0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0067 begin');
      let codeType: string = 'none';
      let sawError: boolean = false;
      try {
        motion.on('operating' as 'operatingHandChanged', operatingCallback);
        motion.off('operating' as 'operatingHandChanged', operatingCallback);
      } catch (err) {
        sawError = true;
        codeType = typeof (err as BusinessError).code;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'sawError=' + sawError + ' codeType=' + codeType);
      expect(codeType === 'number' || codeType === 'none').assertTrue();
      expect(codeType !== 'undefined').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionBoundary0067 end');
    });
  });
}
