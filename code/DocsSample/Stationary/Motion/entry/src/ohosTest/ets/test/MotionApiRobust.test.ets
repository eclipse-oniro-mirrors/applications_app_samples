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

function expectSingleValidOutcome(outcome: CallOutcome): void {
  expect(outcome.invalidError).assertEqual(0);
  expect(outcome.success + outcome.allowedError).assertEqual(1);
}

/**
 * motion Kit 运行时契约（环境自适应）
 *
 * 设备支持时调用成功；不支持或无权限时按文档抛出 201/801。每个调用都要求
 * “恰好一个合法结果”，非法异常计数必须为 0，避免把任意异常当成通过。
 */
export default function MotionApiRobustTest() {
  describe('MotionApiRobustTest', () => {
    /**
     * @tc.number SUB_MOTION_ROBUST_0100
     * @tc.name testMotionRobust0001
     * @tc.desc Verify operating-hand subscribe and unsubscribe yield one valid outcome each
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testMotionRobust0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expectSingleValidOutcome(run(() => motion.on('operatingHandChanged', operatingCallback)));
      expectSingleValidOutcome(run(() => motion.off('operatingHandChanged', operatingCallback)));
    });

    /**
     * @tc.number SUB_MOTION_ROBUST_0200
     * @tc.name testMotionRobust0002
     * @tc.desc Verify holding-hand subscribe and unsubscribe yield one valid outcome each
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testMotionRobust0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expectSingleValidOutcome(run(() => motion.on('holdingHandChanged', holdingCallback)));
      expectSingleValidOutcome(run(() => motion.off('holdingHandChanged', holdingCallback)));
    });

    /**
     * @tc.number SUB_MOTION_ROBUST_0300
     * @tc.name testMotionRobust0003
     * @tc.desc Verify cancelling without prior subscription yields one valid outcome per event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testMotionRobust0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expectSingleValidOutcome(run(() => motion.off('operatingHandChanged')));
      expectSingleValidOutcome(run(() => motion.off('holdingHandChanged')));
    });

    /**
     * @tc.number SUB_MOTION_ROBUST_0400
     * @tc.name testMotionRobust0004
     * @tc.desc Verify recent status returns a known operating enum value or a documented error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testMotionRobust0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let status: number = -1;
      let allowedError: boolean = false;
      let invalidError: boolean = false;
      try {
        status = Number(motion.getRecentOperatingHandStatus());
      } catch (err) {
        allowedError = isAllowedError(err as Object);
        invalidError = !allowedError;
      }
      expect(invalidError).assertFalse();
      const knownValue: boolean = [0, 1, 2].indexOf(status) >= 0;
      expect(knownValue !== allowedError).assertTrue();
    });

    /**
     * @tc.number SUB_MOTION_ROBUST_0500
     * @tc.name testMotionRobust0005
     * @tc.desc Verify five repeated status queries never produce an undocumented error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testMotionRobust0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let invalidError: number = 0;
      let valid: number = 0;
      for (let i = 0; i < 5; i++) {
        try {
          const status: motion.OperatingHandStatus = motion.getRecentOperatingHandStatus();
          if ([0, 1, 2].indexOf(Number(status)) >= 0) {
            valid++;
          }
        } catch (err) {
          if (isAllowedError(err as Object)) {
            valid++;
          } else {
            invalidError++;
          }
        }
      }
      expect(invalidError).assertEqual(0);
      expect(valid).assertEqual(5);
    });

    /**
     * @tc.number SUB_MOTION_ROBUST_0600
     * @tc.name testMotionRobust0006
     * @tc.desc Verify subscribe then unsubscribe then query keeps one valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testMotionRobust0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expectSingleValidOutcome(run(() => motion.on('operatingHandChanged', operatingCallback)));
      expectSingleValidOutcome(run(() => motion.off('operatingHandChanged', operatingCallback)));
      let status: number = -1;
      let allowedError: boolean = false;
      let invalidError: boolean = false;
      try {
        status = Number(motion.getRecentOperatingHandStatus());
      } catch (err) {
        allowedError = isAllowedError(err as Object);
        invalidError = !allowedError;
      }
      expect(invalidError).assertFalse();
      expect(([0, 1, 2].indexOf(status) >= 0) !== allowedError).assertTrue();
    });

    /**
     * @tc.number SUB_MOTION_ROBUST_0700
     * @tc.name testMotionRobust0007
     * @tc.desc Verify operating and holding subscriptions coexist and each cancel is valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testMotionRobust0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expectSingleValidOutcome(run(() => motion.on('operatingHandChanged', operatingCallback)));
      expectSingleValidOutcome(run(() => motion.on('holdingHandChanged', holdingCallback)));
      expectSingleValidOutcome(run(() => motion.off('operatingHandChanged', operatingCallback)));
      expectSingleValidOutcome(run(() => motion.off('holdingHandChanged', holdingCallback)));
    });
  });
}
