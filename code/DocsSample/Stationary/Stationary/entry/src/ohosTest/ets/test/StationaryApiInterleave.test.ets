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
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN: number = 0xF812;
const TAG: string = 'Sample_Stationary';

const ALLOWED_CODES: number[] = [201, 401, 801];

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

function onRelative(event: stationary.ActivityEvent): CallOutcome {
  return run(() => stationary.on('relativeStill', event, 1000000000, callback));
}

function offRelative(event: stationary.ActivityEvent, withCallback: boolean): CallOutcome {
  return withCallback ? run(() => stationary.off('relativeStill', event, callback)) :
    run(() => stationary.off('relativeStill', event));
}

function onceRelative(): CallOutcome {
  return run(() => stationary.once('relativeStill', callback));
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

function caseBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function caseEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

function expectDocumentedOutcome(outcome: CallOutcome, label: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s',
    label + ' success=' + outcome.success + ' allowed=' + outcome.allowedError +
      ' invalid=' + outcome.invalidError);
  expect(outcome.invalidError).assertEqual(0);
  expect(outcome.success + outcome.allowedError).assertEqual(1);
}

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
      caseBegin('testInterleaveStill0001');
      check(onStill());
      check(offStill());
      check(onStill());
      check(offStill());
      caseEnd('testInterleaveStill0001');
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
      caseBegin('testInterleaveStill0002');
      check(offStill());
      check(onStill());
      check(offStill());
      caseEnd('testInterleaveStill0002');
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
      caseBegin('testInterleaveStill0003');
      check(onStill());
      check(onStill());
      check(offStill());
      caseEnd('testInterleaveStill0003');
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
      caseBegin('testInterleaveStill0004');
      check(offStill());
      check(offStill());
      check(onStill());
      check(offStill());
      caseEnd('testInterleaveStill0004');
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
      caseBegin('testInterleaveStill0005');
      check(onStill());
      check(offStill());
      check(offStill());
      caseEnd('testInterleaveStill0005');
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
      caseBegin('testInterleaveStill0006');
      check(offStill());
      check(onStill());
      check(onStill());
      caseEnd('testInterleaveStill0006');
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
      caseBegin('testInterleaveStill0007');
      check(onStill());
      check(onStill());
      check(onStill());
      check(offStill());
      caseEnd('testInterleaveStill0007');
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
      caseBegin('testInterleaveStill0008');
      check(offStill());
      check(offStill());
      check(offStill());
      caseEnd('testInterleaveStill0008');
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
      caseBegin('testInterleaveOnce0009');
      check(onceStill());
      check(offStill());
      check(onStill());
      check(offStill());
      caseEnd('testInterleaveOnce0009');
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
      caseBegin('testInterleaveOnce0010');
      check(offStill());
      check(onceStill());
      check(onStill());
      check(offStill());
      caseEnd('testInterleaveOnce0010');
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
      caseBegin('testInterleaveOnce0011');
      check(onStill());
      check(onceStill());
      check(offStill());
      caseEnd('testInterleaveOnce0011');
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
      caseBegin('testInterleaveOnce0012');
      check(onceStill());
      check(onStill());
      check(offStill());
      caseEnd('testInterleaveOnce0012');
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
      caseBegin('testInterleaveOnce0013');
      check(onceStill());
      check(onceStill());
      check(onceStill());
      caseEnd('testInterleaveOnce0013');
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
      caseBegin('testInterleaveOnce0014');
      check(onStill());
      check(onStill());
      check(onceStill());
      check(offStill());
      caseEnd('testInterleaveOnce0014');
    });

    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_1500
     * @tc.name testInterleaveRelative0015
     * @tc.desc Verify relativeStill ENTER on/off yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveRelative0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      caseBegin('testInterleaveRelative0015');
      check(onRelative(stationary.ActivityEvent.ENTER));
      check(offRelative(stationary.ActivityEvent.ENTER, true));
      caseEnd('testInterleaveRelative0015');
    });

    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_1600
     * @tc.name testInterleaveRelative0016
     * @tc.desc Verify relativeStill EXIT on/off yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveRelative0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      caseBegin('testInterleaveRelative0016');
      check(onRelative(stationary.ActivityEvent.EXIT));
      check(offRelative(stationary.ActivityEvent.EXIT, true));
      caseEnd('testInterleaveRelative0016');
    });

    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_1700
     * @tc.name testInterleaveRelative0017
     * @tc.desc Verify relativeStill ENTER_EXIT on/off yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveRelative0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      caseBegin('testInterleaveRelative0017');
      check(onRelative(stationary.ActivityEvent.ENTER_EXIT));
      check(offRelative(stationary.ActivityEvent.ENTER_EXIT, true));
      caseEnd('testInterleaveRelative0017');
    });

    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_1800
     * @tc.name testInterleaveRelative0018
     * @tc.desc Verify relativeStill one-shot query yields one valid outcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveRelative0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      caseBegin('testInterleaveRelative0018');
      check(onceRelative());
      caseEnd('testInterleaveRelative0018');
    });

    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_1900
     * @tc.name testInterleaveRelative0019
     * @tc.desc Verify relativeStill on then once then off yields a valid outcome each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveRelative0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      caseBegin('testInterleaveRelative0019');
      check(onRelative(stationary.ActivityEvent.ENTER_EXIT));
      check(onceRelative());
      check(offRelative(stationary.ActivityEvent.ENTER_EXIT, true));
      caseEnd('testInterleaveRelative0019');
    });

    /**
     * @tc.number SUB_STATIONARY_INTERLEAVE_2000
     * @tc.name testInterleaveRelative0020
     * @tc.desc Verify cancelling relativeStill without a callback yields one valid outcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testInterleaveRelative0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      caseBegin('testInterleaveRelative0020');
      check(offRelative(stationary.ActivityEvent.ENTER, false));
      check(offRelative(stationary.ActivityEvent.EXIT, false));
      check(offRelative(stationary.ActivityEvent.ENTER_EXIT, false));
      caseEnd('testInterleaveRelative0020');
    });
  });
}
