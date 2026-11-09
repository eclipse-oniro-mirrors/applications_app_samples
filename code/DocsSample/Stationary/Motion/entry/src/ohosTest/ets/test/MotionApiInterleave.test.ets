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
import { motion } from '@kit.MultimodalAwarenessKit';
import { BusinessError } from '@kit.BasicServicesKit';

const ALLOWED_CODES: number[] = [201, 801];

class CallOutcome {
  public success: number = 0;
  public allowedError: number = 0;
  public invalidError: number = 0;
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

function check(outcome: CallOutcome): void {
  expect(outcome.invalidError).assertEqual(0);
  expect(outcome.success + outcome.allowedError).assertEqual(1);
}

export default function MotionApiInterleaveTest() {
  describe('MotionApiInterleaveTest', () => {
    /**
     * @tc.number SUB_MOTION_INTERLEAVE_0100
     * @tc.name testInterleaveOperating0001
     * @tc.desc Verify operating on/off pattern on-off-on yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveOperating0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      check(run(() => motion.on('operatingHandChanged', operatingCallback)));
      check(run(() => motion.off('operatingHandChanged', operatingCallback)));
      check(run(() => motion.on('operatingHandChanged', operatingCallback)));
    });

    /**
     * @tc.number SUB_MOTION_INTERLEAVE_0200
     * @tc.name testInterleaveOperating0002
     * @tc.desc Verify operating on/off pattern off-on-off yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveOperating0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      check(run(() => motion.off('operatingHandChanged', operatingCallback)));
      check(run(() => motion.on('operatingHandChanged', operatingCallback)));
      check(run(() => motion.off('operatingHandChanged', operatingCallback)));
    });

    /**
     * @tc.number SUB_MOTION_INTERLEAVE_0300
     * @tc.name testInterleaveOperating0003
     * @tc.desc Verify operating on/off pattern on-on-off yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveOperating0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      check(run(() => motion.on('operatingHandChanged', operatingCallback)));
      check(run(() => motion.on('operatingHandChanged', operatingCallback)));
      check(run(() => motion.off('operatingHandChanged', operatingCallback)));
    });

    /**
     * @tc.number SUB_MOTION_INTERLEAVE_0400
     * @tc.name testInterleaveOperating0004
     * @tc.desc Verify operating on/off pattern off-off-on yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveOperating0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      check(run(() => motion.off('operatingHandChanged', operatingCallback)));
      check(run(() => motion.off('operatingHandChanged', operatingCallback)));
      check(run(() => motion.on('operatingHandChanged', operatingCallback)));
    });

    /**
     * @tc.number SUB_MOTION_INTERLEAVE_0500
     * @tc.name testInterleaveOperating0005
     * @tc.desc Verify operating on/off pattern on-off-off yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveOperating0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      check(run(() => motion.on('operatingHandChanged', operatingCallback)));
      check(run(() => motion.off('operatingHandChanged', operatingCallback)));
      check(run(() => motion.off('operatingHandChanged', operatingCallback)));
    });

    /**
     * @tc.number SUB_MOTION_INTERLEAVE_0600
     * @tc.name testInterleaveOperating0006
     * @tc.desc Verify operating on/off pattern off-on-on yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveOperating0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      check(run(() => motion.off('operatingHandChanged', operatingCallback)));
      check(run(() => motion.on('operatingHandChanged', operatingCallback)));
      check(run(() => motion.on('operatingHandChanged', operatingCallback)));
    });

    /**
     * @tc.number SUB_MOTION_INTERLEAVE_0700
     * @tc.name testInterleaveOperating0007
     * @tc.desc Verify operating on/off pattern on-on-on yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveOperating0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      check(run(() => motion.on('operatingHandChanged', operatingCallback)));
      check(run(() => motion.on('operatingHandChanged', operatingCallback)));
      check(run(() => motion.on('operatingHandChanged', operatingCallback)));
    });

    /**
     * @tc.number SUB_MOTION_INTERLEAVE_0800
     * @tc.name testInterleaveOperating0008
     * @tc.desc Verify operating on/off pattern off-off-off yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveOperating0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      check(run(() => motion.off('operatingHandChanged', operatingCallback)));
      check(run(() => motion.off('operatingHandChanged', operatingCallback)));
      check(run(() => motion.off('operatingHandChanged', operatingCallback)));
    });

    /**
     * @tc.number SUB_MOTION_INTERLEAVE_0900
     * @tc.name testInterleaveHolding0009
     * @tc.desc Verify holding on/off pattern on-off-on yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveHolding0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      check(run(() => motion.on('holdingHandChanged', holdingCallback)));
      check(run(() => motion.off('holdingHandChanged', holdingCallback)));
      check(run(() => motion.on('holdingHandChanged', holdingCallback)));
    });

    /**
     * @tc.number SUB_MOTION_INTERLEAVE_1000
     * @tc.name testInterleaveHolding0010
     * @tc.desc Verify holding on/off pattern off-on-off yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveHolding0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      check(run(() => motion.off('holdingHandChanged', holdingCallback)));
      check(run(() => motion.on('holdingHandChanged', holdingCallback)));
      check(run(() => motion.off('holdingHandChanged', holdingCallback)));
    });

    /**
     * @tc.number SUB_MOTION_INTERLEAVE_1100
     * @tc.name testInterleaveHolding0011
     * @tc.desc Verify holding on/off pattern on-on-off yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveHolding0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      check(run(() => motion.on('holdingHandChanged', holdingCallback)));
      check(run(() => motion.on('holdingHandChanged', holdingCallback)));
      check(run(() => motion.off('holdingHandChanged', holdingCallback)));
    });

    /**
     * @tc.number SUB_MOTION_INTERLEAVE_1200
     * @tc.name testInterleaveHolding0012
     * @tc.desc Verify holding on/off pattern off-off-on yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveHolding0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      check(run(() => motion.off('holdingHandChanged', holdingCallback)));
      check(run(() => motion.off('holdingHandChanged', holdingCallback)));
      check(run(() => motion.on('holdingHandChanged', holdingCallback)));
    });

    /**
     * @tc.number SUB_MOTION_INTERLEAVE_1300
     * @tc.name testInterleaveHolding0013
     * @tc.desc Verify holding on/off pattern on-off-off yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveHolding0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      check(run(() => motion.on('holdingHandChanged', holdingCallback)));
      check(run(() => motion.off('holdingHandChanged', holdingCallback)));
      check(run(() => motion.off('holdingHandChanged', holdingCallback)));
    });

    /**
     * @tc.number SUB_MOTION_INTERLEAVE_1400
     * @tc.name testInterleaveHolding0014
     * @tc.desc Verify holding on/off pattern off-on-on yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveHolding0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      check(run(() => motion.off('holdingHandChanged', holdingCallback)));
      check(run(() => motion.on('holdingHandChanged', holdingCallback)));
      check(run(() => motion.on('holdingHandChanged', holdingCallback)));
    });

    /**
     * @tc.number SUB_MOTION_INTERLEAVE_1500
     * @tc.name testInterleaveHolding0015
     * @tc.desc Verify holding on/off pattern on-on-on yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveHolding0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      check(run(() => motion.on('holdingHandChanged', holdingCallback)));
      check(run(() => motion.on('holdingHandChanged', holdingCallback)));
      check(run(() => motion.on('holdingHandChanged', holdingCallback)));
    });

    /**
     * @tc.number SUB_MOTION_INTERLEAVE_1600
     * @tc.name testInterleaveHolding0016
     * @tc.desc Verify holding on/off pattern off-off-off yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveHolding0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      check(run(() => motion.off('holdingHandChanged', holdingCallback)));
      check(run(() => motion.off('holdingHandChanged', holdingCallback)));
      check(run(() => motion.off('holdingHandChanged', holdingCallback)));
    });
  });
}
