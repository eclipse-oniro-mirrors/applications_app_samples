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

function callback(_response: stationary.ActivityResponse): void {
}

function onStill(): CallOutcome {
  return run(() => stationary.on('still', stationary.ActivityEvent.ENTER, 1000000000, callback));
}

function offStill(): CallOutcome {
  return run(() => stationary.off('still', stationary.ActivityEvent.ENTER, callback));
}

function onceStill(): CallOutcome {
  return run(() => stationary.once('still', callback));
}

function check(outcome: CallOutcome): void {
  expect(outcome.invalidError).assertEqual(0);
  expect(outcome.success + outcome.allowedError).assertEqual(1);
}

/**
 * 订阅/取消订阅/一次性获取的交错调用矩阵（环境自适应）
 *
 * 覆盖 on/off 三连调用的 8 种组合，以及 once 与 on/off 混排的典型组合。
 * 每一步都要求恰好一个合法结果，用于验证重复订阅、重复取消与一次性查询
 * 交错执行时不会产生未文档化的异常。
 */
export default function StationaryApiInterleaveTest() {
  describe('StationaryApiInterleaveTest', () => {
    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_0100
     * @tc.name testInterleaveStill0001
     * @tc.desc Verify on/off pattern on-off-on yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveStill0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      check(onStill());
      check(offStill());
      check(onStill());
      check(offStill());
    });

    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_0200
     * @tc.name testInterleaveStill0002
     * @tc.desc Verify on/off pattern off-on-off yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveStill0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      check(offStill());
      check(onStill());
      check(offStill());
    });

    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_0300
     * @tc.name testInterleaveStill0003
     * @tc.desc Verify on/off pattern on-on-off yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveStill0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      check(onStill());
      check(onStill());
      check(offStill());
    });

    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_0400
     * @tc.name testInterleaveStill0004
     * @tc.desc Verify on/off pattern off-off-on yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveStill0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      check(offStill());
      check(offStill());
      check(onStill());
      check(offStill());
    });

    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_0500
     * @tc.name testInterleaveStill0005
     * @tc.desc Verify on/off pattern on-off-off yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveStill0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      check(onStill());
      check(offStill());
      check(offStill());
    });

    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_0600
     * @tc.name testInterleaveStill0006
     * @tc.desc Verify on/off pattern off-on-on yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveStill0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      check(offStill());
      check(onStill());
      check(onStill());
    });

    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_0700
     * @tc.name testInterleaveStill0007
     * @tc.desc Verify on/off pattern on-on-on yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveStill0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      check(onStill());
      check(onStill());
      check(onStill());
      check(offStill());
    });

    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_0800
     * @tc.name testInterleaveStill0008
     * @tc.desc Verify on/off pattern off-off-off yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveStill0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      check(offStill());
      check(offStill());
      check(offStill());
    });

    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_0900
     * @tc.name testInterleaveOnce0009
     * @tc.desc Verify once then off then on yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveOnce0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      check(onceStill());
      check(offStill());
      check(onStill());
      check(offStill());
    });

    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_1000
     * @tc.name testInterleaveOnce0010
     * @tc.desc Verify off then once then on yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveOnce0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      check(offStill());
      check(onceStill());
      check(onStill());
      check(offStill());
    });

    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_1100
     * @tc.name testInterleaveOnce0011
     * @tc.desc Verify on then once then off yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveOnce0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      check(onStill());
      check(onceStill());
      check(offStill());
    });

    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_1200
     * @tc.name testInterleaveOnce0012
     * @tc.desc Verify once then on then off yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveOnce0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      check(onceStill());
      check(onStill());
      check(offStill());
    });

    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_1300
     * @tc.name testInterleaveOnce0013
     * @tc.desc Verify two consecutive one-shot queries yield a valid outcome each
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveOnce0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      check(onceStill());
      check(onceStill());
      check(onceStill());
    });

    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_1400
     * @tc.name testInterleaveOnce0014
     * @tc.desc Verify on then on then once then off yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveOnce0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      check(onStill());
      check(onStill());
      check(onceStill());
      check(offStill());
    });
  });
}
