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

const TAG: string = '[Sample_MotionApiOutcomeMatrixTest]';
const DOMAIN: number = 0xF815;

const ALLOWED_CODES: number[] = [201, 801];

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

function operatingSecondCallback(_status: motion.OperatingHandStatus): void {
}

function holdingCallback(_status: motion.HoldingHandStatus): void {
}

function holdingSecondCallback(_status: motion.HoldingHandStatus): void {
}

function record(label: string, outcome: CallOutcome): void {
  hilog.info(DOMAIN, TAG, '%{public}s',
    label + ' success=' + outcome.success + ' allowed=' + outcome.allowedError +
    ' invalid=' + outcome.invalidError + ' code=' + outcome.code);
}

function expectOneValidOutcome(label: string, outcome: CallOutcome): void {
  record(label, outcome);
  expect(outcome.invalidError).assertEqual(0);
  expect(outcome.success + outcome.allowedError).assertEqual(1);
}

function expectSequenceValid(label: string, outcomes: CallOutcome[]): void {
  hilog.info(DOMAIN, TAG, '%{public}s', label + ' steps=' + outcomes.length);
  let invalid: number = 0;
  let valid: number = 0;
  for (const outcome of outcomes) {
    invalid += outcome.invalidError;
    valid += outcome.success + outcome.allowedError;
  }
  expect(invalid).assertEqual(0);
  expect(valid).assertEqual(outcomes.length);
}

function isSequenceValid(outcomes: CallOutcome[]): boolean {
  let invalid: number = 0;
  let valid: number = 0;
  for (let i = 0; i < outcomes.length; i++) {
    if (outcomes[i].invalidError !== 0) {
      invalid++;
    }
    if (outcomes[i].success + outcomes[i].allowedError === 1) {
      valid++;
    }
  }
  return invalid === 0 && valid === outcomes.length;
}

function onOperating(): CallOutcome {
  return run(() => motion.on('operatingHandChanged', operatingCallback));
}

function offOperating(): CallOutcome {
  return run(() => motion.off('operatingHandChanged', operatingCallback));
}

function offAllOperating(): CallOutcome {
  return run(() => motion.off('operatingHandChanged'));
}

function onHolding(): CallOutcome {
  return run(() => motion.on('holdingHandChanged', holdingCallback));
}

function offHolding(): CallOutcome {
  return run(() => motion.off('holdingHandChanged', holdingCallback));
}

function offAllHolding(): CallOutcome {
  return run(() => motion.off('holdingHandChanged'));
}

function query(): CallOutcome {
  return run(() => {
    const status: motion.OperatingHandStatus = motion.getRecentOperatingHandStatus();
    if ([0, 1, 2].indexOf(Number(status)) < 0) {
      throw new RangeError('unexpected status ' + status);
    }
  });
}

export default function MotionApiOutcomeMatrixTest(): void {
  describe('MotionApiOutcomeMatrixTest', () => {

    /**
     * @tc.number    SUB_MOTION_OUTCOME_0100
     * @tc.name      testMotionOutcome0001
     * @tc.desc      Verify operating subscribe with callback yields one valid outcome (step #1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionOutcome0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0001 begin');
      const outcome = onOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0001 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_0200
     * @tc.name      testMotionOutcome0002
     * @tc.desc      Verify operating unsubscribe with callback yields one valid outcome (step #2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionOutcome0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0002 begin');
      const outcome = offOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0002 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_0300
     * @tc.name      testMotionOutcome0003
     * @tc.desc      Verify operating unsubscribe without callback yields one valid outcome (step #3)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionOutcome0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0003 begin');
      const outcome = offAllOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0003 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_0400
     * @tc.name      testMotionOutcome0004
     * @tc.desc      Verify holding subscribe with callback yields one valid outcome (step #4)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionOutcome0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0004 begin');
      const outcome = onHolding();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0004 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_0500
     * @tc.name      testMotionOutcome0005
     * @tc.desc      Verify holding unsubscribe with callback yields one valid outcome (step #5)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionOutcome0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0005 begin');
      const outcome = offHolding();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0005 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_0600
     * @tc.name      testMotionOutcome0006
     * @tc.desc      Verify holding unsubscribe without callback yields one valid outcome (step #6)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionOutcome0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0006 begin');
      const outcome = offAllHolding();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0006 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_0700
     * @tc.name      testMotionOutcome0007
     * @tc.desc      Verify recent operating status query yields one valid outcome (step #7)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testMotionOutcome0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0007 begin');
      const outcome = query();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0007 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_0800
     * @tc.name      testMotionOutcome0008
     * @tc.desc      Verify operating subscribe repeated as a single isolated step yields one valid outcome (step #8)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0008 begin');
      const outcome = onOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0008 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_0900
     * @tc.name      testMotionOutcome0009
     * @tc.desc      Verify operating subscribe with callback yields one valid outcome (step #9)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0009 begin');
      const outcome = onOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0009 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_1000
     * @tc.name      testMotionOutcome0010
     * @tc.desc      Verify operating unsubscribe with callback yields one valid outcome (step #10)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0010 begin');
      const outcome = offOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0010 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_1100
     * @tc.name      testMotionOutcome0011
     * @tc.desc      Verify operating unsubscribe without callback yields one valid outcome (step #11)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0011 begin');
      const outcome = offAllOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0011 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_1200
     * @tc.name      testMotionOutcome0012
     * @tc.desc      Verify holding subscribe with callback yields one valid outcome (step #12)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0012 begin');
      const outcome = onHolding();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0012 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_1300
     * @tc.name      testMotionOutcome0013
     * @tc.desc      Verify holding unsubscribe with callback yields one valid outcome (step #13)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0013 begin');
      const outcome = offHolding();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0013 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_1400
     * @tc.name      testMotionOutcome0014
     * @tc.desc      Verify holding unsubscribe without callback yields one valid outcome (step #14)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0014 begin');
      const outcome = offAllHolding();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0014 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_1500
     * @tc.name      testMotionOutcome0015
     * @tc.desc      Verify recent operating status query yields one valid outcome (step #15)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0015 begin');
      const outcome = query();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0015 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_1600
     * @tc.name      testMotionOutcome0016
     * @tc.desc      Verify operating subscribe repeated as a single isolated step yields one valid outcome (step #16)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0016 begin');
      const outcome = onOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0016 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_1700
     * @tc.name      testMotionOutcome0017
     * @tc.desc      Verify operating subscribe with callback yields one valid outcome (step #17)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0017 begin');
      const outcome = onOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0017 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_1800
     * @tc.name      testMotionOutcome0018
     * @tc.desc      Verify operating unsubscribe with callback yields one valid outcome (step #18)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0018 begin');
      const outcome = offOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0018 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_1900
     * @tc.name      testMotionOutcome0019
     * @tc.desc      Verify operating unsubscribe without callback yields one valid outcome (step #19)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0019 begin');
      const outcome = offAllOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0019 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_2000
     * @tc.name      testMotionOutcome0020
     * @tc.desc      Verify holding subscribe with callback yields one valid outcome (step #20)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0020 begin');
      const outcome = onHolding();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0020 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_2100
     * @tc.name      testMotionOutcome0021
     * @tc.desc      Verify holding unsubscribe with callback yields one valid outcome (step #21)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0021 begin');
      const outcome = offHolding();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0021 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_2200
     * @tc.name      testMotionOutcome0022
     * @tc.desc      Verify holding unsubscribe without callback yields one valid outcome (step #22)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0022 begin');
      const outcome = offAllHolding();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0022 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_2300
     * @tc.name      testMotionOutcome0023
     * @tc.desc      Verify recent operating status query yields one valid outcome (step #23)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0023 begin');
      const outcome = query();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0023 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_2400
     * @tc.name      testMotionOutcome0024
     * @tc.desc      Verify operating subscribe repeated as a single isolated step yields one valid outcome (step #24)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0024 begin');
      const outcome = onOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0024 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_2500
     * @tc.name      testMotionOutcome0025
     * @tc.desc      Verify operating subscribe with callback yields one valid outcome (step #25)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0025 begin');
      const outcome = onOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0025 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_2600
     * @tc.name      testMotionOutcome0026
     * @tc.desc      Verify operating unsubscribe with callback yields one valid outcome (step #26)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0026 begin');
      const outcome = offOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0026 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_2700
     * @tc.name      testMotionOutcome0027
     * @tc.desc      Verify operating unsubscribe without callback yields one valid outcome (step #27)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0027 begin');
      const outcome = offAllOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0027 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_2800
     * @tc.name      testMotionOutcome0028
     * @tc.desc      Verify holding subscribe with callback yields one valid outcome (step #28)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0028 begin');
      const outcome = onHolding();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0028 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_2900
     * @tc.name      testMotionOutcome0029
     * @tc.desc      Verify holding unsubscribe with callback yields one valid outcome (step #29)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0029 begin');
      const outcome = offHolding();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0029 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_3000
     * @tc.name      testMotionOutcome0030
     * @tc.desc      Verify holding unsubscribe without callback yields one valid outcome (step #30)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0030 begin');
      const outcome = offAllHolding();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0030 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_3100
     * @tc.name      testMotionOutcome0031
     * @tc.desc      Verify recent operating status query yields one valid outcome (step #31)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0031 begin');
      const outcome = query();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0031 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_3200
     * @tc.name      testMotionOutcome0032
     * @tc.desc      Verify operating subscribe repeated as a single isolated step yields one valid outcome (step #32)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0032 begin');
      const outcome = onOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0032 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_3300
     * @tc.name      testMotionOutcome0033
     * @tc.desc      Verify operating subscribe with callback yields one valid outcome (step #33)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0033 begin');
      const outcome = onOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0033 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_3400
     * @tc.name      testMotionOutcome0034
     * @tc.desc      Verify operating unsubscribe with callback yields one valid outcome (step #34)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0034 begin');
      const outcome = offOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0034 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_3500
     * @tc.name      testMotionOutcome0035
     * @tc.desc      Verify operating unsubscribe without callback yields one valid outcome (step #35)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0035 begin');
      const outcome = offAllOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0035 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_3600
     * @tc.name      testMotionOutcome0036
     * @tc.desc      Verify holding subscribe with callback yields one valid outcome (step #36)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0036 begin');
      const outcome = onHolding();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0036 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_3700
     * @tc.name      testMotionOutcome0037
     * @tc.desc      Verify holding unsubscribe with callback yields one valid outcome (step #37)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0037 begin');
      const outcome = offHolding();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0037 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_3800
     * @tc.name      testMotionOutcome0038
     * @tc.desc      Verify holding unsubscribe without callback yields one valid outcome (step #38)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0038 begin');
      const outcome = offAllHolding();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0038 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_3900
     * @tc.name      testMotionOutcome0039
     * @tc.desc      Verify recent operating status query yields one valid outcome (step #39)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0039 begin');
      const outcome = query();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0039 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_4000
     * @tc.name      testMotionOutcome0040
     * @tc.desc      Verify operating subscribe repeated as a single isolated step yields one valid outcome (step #40)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0040 begin');
      const outcome = onOperating();
      expect(outcome.invalidError).assertEqual(0);
      expect(outcome.success + outcome.allowedError).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0040 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_4100
     * @tc.name      testMotionOutcome0041
     * @tc.desc      Verify onOperating then offOperating each yield a valid outcome (pair #1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0041 begin');
      expect(isSequenceValid([onOperating(), offOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0041 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_4200
     * @tc.name      testMotionOutcome0042
     * @tc.desc      Verify offOperating then onOperating each yield a valid outcome (pair #2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0042 begin');
      expect(isSequenceValid([offOperating(), onOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0042 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_4300
     * @tc.name      testMotionOutcome0043
     * @tc.desc      Verify onOperating then onOperating each yield a valid outcome (pair #3)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0043 begin');
      expect(isSequenceValid([onOperating(), onOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0043 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_4400
     * @tc.name      testMotionOutcome0044
     * @tc.desc      Verify offOperating then offOperating each yield a valid outcome (pair #4)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0044 begin');
      expect(isSequenceValid([offOperating(), offOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0044 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_4500
     * @tc.name      testMotionOutcome0045
     * @tc.desc      Verify onHolding then offHolding each yield a valid outcome (pair #5)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0045 begin');
      expect(isSequenceValid([onHolding(), offHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0045 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_4600
     * @tc.name      testMotionOutcome0046
     * @tc.desc      Verify offHolding then onHolding each yield a valid outcome (pair #6)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0046 begin');
      expect(isSequenceValid([offHolding(), onHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0046 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_4700
     * @tc.name      testMotionOutcome0047
     * @tc.desc      Verify onHolding then onHolding each yield a valid outcome (pair #7)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0047 begin');
      expect(isSequenceValid([onHolding(), onHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0047 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_4800
     * @tc.name      testMotionOutcome0048
     * @tc.desc      Verify offHolding then offHolding each yield a valid outcome (pair #8)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0048 begin');
      expect(isSequenceValid([offHolding(), offHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0048 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_4900
     * @tc.name      testMotionOutcome0049
     * @tc.desc      Verify onOperating then offOperating each yield a valid outcome (pair #9)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0049 begin');
      expect(isSequenceValid([onOperating(), offOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0049 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_5000
     * @tc.name      testMotionOutcome0050
     * @tc.desc      Verify offOperating then onOperating each yield a valid outcome (pair #10)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0050 begin');
      expect(isSequenceValid([offOperating(), onOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0050 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_5100
     * @tc.name      testMotionOutcome0051
     * @tc.desc      Verify onOperating then onOperating each yield a valid outcome (pair #11)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0051 begin');
      expect(isSequenceValid([onOperating(), onOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0051 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_5200
     * @tc.name      testMotionOutcome0052
     * @tc.desc      Verify offOperating then offOperating each yield a valid outcome (pair #12)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0052 begin');
      expect(isSequenceValid([offOperating(), offOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0052 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_5300
     * @tc.name      testMotionOutcome0053
     * @tc.desc      Verify onHolding then offHolding each yield a valid outcome (pair #13)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0053 begin');
      expect(isSequenceValid([onHolding(), offHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0053 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_5400
     * @tc.name      testMotionOutcome0054
     * @tc.desc      Verify offHolding then onHolding each yield a valid outcome (pair #14)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0054 begin');
      expect(isSequenceValid([offHolding(), onHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0054 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_5500
     * @tc.name      testMotionOutcome0055
     * @tc.desc      Verify onHolding then onHolding each yield a valid outcome (pair #15)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0055 begin');
      expect(isSequenceValid([onHolding(), onHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0055 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_5600
     * @tc.name      testMotionOutcome0056
     * @tc.desc      Verify offHolding then offHolding each yield a valid outcome (pair #16)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0056 begin');
      expect(isSequenceValid([offHolding(), offHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0056 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_5700
     * @tc.name      testMotionOutcome0057
     * @tc.desc      Verify onOperating then offOperating each yield a valid outcome (pair #17)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0057 begin');
      expect(isSequenceValid([onOperating(), offOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0057 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_5800
     * @tc.name      testMotionOutcome0058
     * @tc.desc      Verify offOperating then onOperating each yield a valid outcome (pair #18)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0058 begin');
      expect(isSequenceValid([offOperating(), onOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0058 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_5900
     * @tc.name      testMotionOutcome0059
     * @tc.desc      Verify onOperating then onOperating each yield a valid outcome (pair #19)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0059 begin');
      expect(isSequenceValid([onOperating(), onOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0059 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_6000
     * @tc.name      testMotionOutcome0060
     * @tc.desc      Verify offOperating then offOperating each yield a valid outcome (pair #20)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0060 begin');
      expect(isSequenceValid([offOperating(), offOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0060 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_6100
     * @tc.name      testMotionOutcome0061
     * @tc.desc      Verify onHolding then offHolding each yield a valid outcome (pair #21)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0061 begin');
      expect(isSequenceValid([onHolding(), offHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0061 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_6200
     * @tc.name      testMotionOutcome0062
     * @tc.desc      Verify offHolding then onHolding each yield a valid outcome (pair #22)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0062 begin');
      expect(isSequenceValid([offHolding(), onHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0062 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_6300
     * @tc.name      testMotionOutcome0063
     * @tc.desc      Verify onHolding then onHolding each yield a valid outcome (pair #23)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0063 begin');
      expect(isSequenceValid([onHolding(), onHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0063 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_6400
     * @tc.name      testMotionOutcome0064
     * @tc.desc      Verify offHolding then offHolding each yield a valid outcome (pair #24)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0064 begin');
      expect(isSequenceValid([offHolding(), offHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0064 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_6500
     * @tc.name      testMotionOutcome0065
     * @tc.desc      Verify onOperating then offOperating each yield a valid outcome (pair #25)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0065 begin');
      expect(isSequenceValid([onOperating(), offOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0065 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_6600
     * @tc.name      testMotionOutcome0066
     * @tc.desc      Verify offOperating then onOperating each yield a valid outcome (pair #26)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0066 begin');
      expect(isSequenceValid([offOperating(), onOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0066 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_6700
     * @tc.name      testMotionOutcome0067
     * @tc.desc      Verify onOperating then onOperating each yield a valid outcome (pair #27)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0067 begin');
      expect(isSequenceValid([onOperating(), onOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0067 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_6800
     * @tc.name      testMotionOutcome0068
     * @tc.desc      Verify offOperating then offOperating each yield a valid outcome (pair #28)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0068 begin');
      expect(isSequenceValid([offOperating(), offOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0068 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_6900
     * @tc.name      testMotionOutcome0069
     * @tc.desc      Verify onHolding then offHolding each yield a valid outcome (pair #29)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0069 begin');
      expect(isSequenceValid([onHolding(), offHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0069 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_7000
     * @tc.name      testMotionOutcome0070
     * @tc.desc      Verify offHolding then onHolding each yield a valid outcome (pair #30)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0070 begin');
      expect(isSequenceValid([offHolding(), onHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0070 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_7100
     * @tc.name      testMotionOutcome0071
     * @tc.desc      Verify onHolding then onHolding each yield a valid outcome (pair #31)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0071 begin');
      expect(isSequenceValid([onHolding(), onHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0071 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_7200
     * @tc.name      testMotionOutcome0072
     * @tc.desc      Verify offHolding then offHolding each yield a valid outcome (pair #32)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0072 begin');
      expect(isSequenceValid([offHolding(), offHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0072 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_7300
     * @tc.name      testMotionOutcome0073
     * @tc.desc      Verify mixed sequence onOperating-onHolding-offOperating yields valid outcomes (triple #1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0073 begin');
      expect(isSequenceValid([onOperating(), onHolding(), offOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0073 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_7400
     * @tc.name      testMotionOutcome0074
     * @tc.desc      Verify mixed sequence onHolding-onOperating-offHolding yields valid outcomes (triple #2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0074 begin');
      expect(isSequenceValid([onHolding(), onOperating(), offHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0074 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_7500
     * @tc.name      testMotionOutcome0075
     * @tc.desc      Verify mixed sequence offOperating-offHolding-query yields valid outcomes (triple #3)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0075 begin');
      expect(isSequenceValid([offOperating(), offHolding(), query()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0075 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_7600
     * @tc.name      testMotionOutcome0076
     * @tc.desc      Verify mixed sequence onOperating-query-offOperating yields valid outcomes (triple #4)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0076 begin');
      expect(isSequenceValid([onOperating(), query(), offOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0076 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_7700
     * @tc.name      testMotionOutcome0077
     * @tc.desc      Verify mixed sequence onHolding-query-offHolding yields valid outcomes (triple #5)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0077 begin');
      expect(isSequenceValid([onHolding(), query(), offHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0077 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_7800
     * @tc.name      testMotionOutcome0078
     * @tc.desc      Verify mixed sequence query-onOperating-onHolding yields valid outcomes (triple #6)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0078 begin');
      expect(isSequenceValid([query(), onOperating(), onHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0078 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_7900
     * @tc.name      testMotionOutcome0079
     * @tc.desc      Verify mixed sequence onOperating-onHolding-offOperating yields valid outcomes (triple #7)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0079 begin');
      expect(isSequenceValid([onOperating(), onHolding(), offOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0079 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_8000
     * @tc.name      testMotionOutcome0080
     * @tc.desc      Verify mixed sequence onHolding-onOperating-offHolding yields valid outcomes (triple #8)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0080 begin');
      expect(isSequenceValid([onHolding(), onOperating(), offHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0080 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_8100
     * @tc.name      testMotionOutcome0081
     * @tc.desc      Verify mixed sequence offOperating-offHolding-query yields valid outcomes (triple #9)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0081 begin');
      expect(isSequenceValid([offOperating(), offHolding(), query()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0081 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_8200
     * @tc.name      testMotionOutcome0082
     * @tc.desc      Verify mixed sequence onOperating-query-offOperating yields valid outcomes (triple #10)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0082 begin');
      expect(isSequenceValid([onOperating(), query(), offOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0082 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_8300
     * @tc.name      testMotionOutcome0083
     * @tc.desc      Verify mixed sequence onHolding-query-offHolding yields valid outcomes (triple #11)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0083 begin');
      expect(isSequenceValid([onHolding(), query(), offHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0083 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_8400
     * @tc.name      testMotionOutcome0084
     * @tc.desc      Verify mixed sequence query-onOperating-onHolding yields valid outcomes (triple #12)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0084 begin');
      expect(isSequenceValid([query(), onOperating(), onHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0084 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_8500
     * @tc.name      testMotionOutcome0085
     * @tc.desc      Verify mixed sequence onOperating-onHolding-offOperating yields valid outcomes (triple #13)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0085 begin');
      expect(isSequenceValid([onOperating(), onHolding(), offOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0085 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_8600
     * @tc.name      testMotionOutcome0086
     * @tc.desc      Verify mixed sequence onHolding-onOperating-offHolding yields valid outcomes (triple #14)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0086 begin');
      expect(isSequenceValid([onHolding(), onOperating(), offHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0086 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_8700
     * @tc.name      testMotionOutcome0087
     * @tc.desc      Verify mixed sequence offOperating-offHolding-query yields valid outcomes (triple #15)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0087 begin');
      expect(isSequenceValid([offOperating(), offHolding(), query()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0087 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_8800
     * @tc.name      testMotionOutcome0088
     * @tc.desc      Verify mixed sequence onOperating-query-offOperating yields valid outcomes (triple #16)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0088 begin');
      expect(isSequenceValid([onOperating(), query(), offOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0088 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_8900
     * @tc.name      testMotionOutcome0089
     * @tc.desc      Verify mixed sequence onHolding-query-offHolding yields valid outcomes (triple #17)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0089 begin');
      expect(isSequenceValid([onHolding(), query(), offHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0089 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_9000
     * @tc.name      testMotionOutcome0090
     * @tc.desc      Verify mixed sequence query-onOperating-onHolding yields valid outcomes (triple #18)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0090 begin');
      expect(isSequenceValid([query(), onOperating(), onHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0090 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_9100
     * @tc.name      testMotionOutcome0091
     * @tc.desc      Verify mixed sequence onOperating-onHolding-offOperating yields valid outcomes (triple #19)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0091 begin');
      expect(isSequenceValid([onOperating(), onHolding(), offOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0091 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_9200
     * @tc.name      testMotionOutcome0092
     * @tc.desc      Verify mixed sequence onHolding-onOperating-offHolding yields valid outcomes (triple #20)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0092 begin');
      expect(isSequenceValid([onHolding(), onOperating(), offHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0092 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_9300
     * @tc.name      testMotionOutcome0093
     * @tc.desc      Verify mixed sequence offOperating-offHolding-query yields valid outcomes (triple #21)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0093 begin');
      expect(isSequenceValid([offOperating(), offHolding(), query()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0093 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_9400
     * @tc.name      testMotionOutcome0094
     * @tc.desc      Verify mixed sequence onOperating-query-offOperating yields valid outcomes (triple #22)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0094 begin');
      expect(isSequenceValid([onOperating(), query(), offOperating()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0094 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_9500
     * @tc.name      testMotionOutcome0095
     * @tc.desc      Verify mixed sequence onHolding-query-offHolding yields valid outcomes (triple #23)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0095 begin');
      expect(isSequenceValid([onHolding(), query(), offHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0095 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_9600
     * @tc.name      testMotionOutcome0096
     * @tc.desc      Verify mixed sequence query-onOperating-onHolding yields valid outcomes (triple #24)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0096 begin');
      expect(isSequenceValid([query(), onOperating(), onHolding()])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0096 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_9700
     * @tc.name      testMotionOutcome0097
     * @tc.desc      Verify multiple callbacks on one event do not leak invalid outcomes (case #1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0097 begin');
      const outcomes: CallOutcome[] = [onOperating(), offAllOperating()];
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0097 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_9800
     * @tc.name      testMotionOutcome0098
     * @tc.desc      Verify multiple callbacks on one event do not leak invalid outcomes (case #2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0098 begin');
      const outcomes: CallOutcome[] = [onHolding(), offAllHolding()];
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0098 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_9900
     * @tc.name      testMotionOutcome0099
     * @tc.desc      Verify multiple callbacks on one event do not leak invalid outcomes (case #3)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0099 begin');
      const outcomes: CallOutcome[] = [onOperating(), offOperating(), offAllOperating()];
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0099 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_0100
     * @tc.name      testMotionOutcome0100
     * @tc.desc      Verify multiple callbacks on one event do not leak invalid outcomes (case #4)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0100 begin');
      const outcomes: CallOutcome[] = [onHolding(), offHolding(), offAllHolding()];
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0100 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_0200
     * @tc.name      testMotionOutcome0101
     * @tc.desc      Verify multiple callbacks on one event do not leak invalid outcomes (case #5)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0101 begin');
      const outcomes: CallOutcome[] = [onOperating(), offAllOperating()];
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0101 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_0300
     * @tc.name      testMotionOutcome0102
     * @tc.desc      Verify multiple callbacks on one event do not leak invalid outcomes (case #6)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0102 begin');
      const outcomes: CallOutcome[] = [onHolding(), offAllHolding()];
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0102 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_0400
     * @tc.name      testMotionOutcome0103
     * @tc.desc      Verify multiple callbacks on one event do not leak invalid outcomes (case #7)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0103 begin');
      const outcomes: CallOutcome[] = [onOperating(), offOperating(), offAllOperating()];
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0103 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_0500
     * @tc.name      testMotionOutcome0104
     * @tc.desc      Verify multiple callbacks on one event do not leak invalid outcomes (case #8)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0104 begin');
      const outcomes: CallOutcome[] = [onHolding(), offHolding(), offAllHolding()];
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0104 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_0600
     * @tc.name      testMotionOutcome0105
     * @tc.desc      Verify multiple callbacks on one event do not leak invalid outcomes (case #9)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0105 begin');
      const outcomes: CallOutcome[] = [onOperating(), offAllOperating()];
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0105 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_0700
     * @tc.name      testMotionOutcome0106
     * @tc.desc      Verify multiple callbacks on one event do not leak invalid outcomes (case #10)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0106 begin');
      const outcomes: CallOutcome[] = [onHolding(), offAllHolding()];
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0106 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_0800
     * @tc.name      testMotionOutcome0107
     * @tc.desc      Verify multiple callbacks on one event do not leak invalid outcomes (case #11)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0107 begin');
      const outcomes: CallOutcome[] = [onOperating(), offOperating(), offAllOperating()];
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0107 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_0900
     * @tc.name      testMotionOutcome0108
     * @tc.desc      Verify multiple callbacks on one event do not leak invalid outcomes (case #12)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0108 begin');
      const outcomes: CallOutcome[] = [onHolding(), offHolding(), offAllHolding()];
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0108 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_1000
     * @tc.name      testMotionOutcome0109
     * @tc.desc      Verify multiple callbacks on one event do not leak invalid outcomes (case #13)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0109 begin');
      const outcomes: CallOutcome[] = [onOperating(), offAllOperating()];
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0109 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_1100
     * @tc.name      testMotionOutcome0110
     * @tc.desc      Verify multiple callbacks on one event do not leak invalid outcomes (case #14)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0110 begin');
      const outcomes: CallOutcome[] = [onHolding(), offAllHolding()];
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0110 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_1200
     * @tc.name      testMotionOutcome0111
     * @tc.desc      Verify multiple callbacks on one event do not leak invalid outcomes (case #15)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0111 begin');
      const outcomes: CallOutcome[] = [onOperating(), offOperating(), offAllOperating()];
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0111 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_1300
     * @tc.name      testMotionOutcome0112
     * @tc.desc      Verify multiple callbacks on one event do not leak invalid outcomes (case #16)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0112 begin');
      const outcomes: CallOutcome[] = [onHolding(), offHolding(), offAllHolding()];
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0112 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_1400
     * @tc.name      testMotionOutcome0113
     * @tc.desc      Verify 1 consecutive status queries never produce an undocumented error (run #1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0113 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 1; i++) {
        outcomes.push(query());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0113 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_1500
     * @tc.name      testMotionOutcome0114
     * @tc.desc      Verify 2 consecutive status queries never produce an undocumented error (run #2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0114 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 2; i++) {
        outcomes.push(query());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0114 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_1600
     * @tc.name      testMotionOutcome0115
     * @tc.desc      Verify 3 consecutive status queries never produce an undocumented error (run #3)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0115 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 3; i++) {
        outcomes.push(query());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0115 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_1700
     * @tc.name      testMotionOutcome0116
     * @tc.desc      Verify 4 consecutive status queries never produce an undocumented error (run #4)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0116 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 4; i++) {
        outcomes.push(query());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0116 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_1800
     * @tc.name      testMotionOutcome0117
     * @tc.desc      Verify 5 consecutive status queries never produce an undocumented error (run #5)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0117 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 5; i++) {
        outcomes.push(query());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0117 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_1900
     * @tc.name      testMotionOutcome0118
     * @tc.desc      Verify 6 consecutive status queries never produce an undocumented error (run #6)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testMotionOutcome0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0118 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 6; i++) {
        outcomes.push(query());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0118 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_2000
     * @tc.name      testMotionOutcome0119
     * @tc.desc      Verify 1 consecutive status queries never produce an undocumented error (run #7)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0119 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 1; i++) {
        outcomes.push(query());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0119 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_2100
     * @tc.name      testMotionOutcome0120
     * @tc.desc      Verify 2 consecutive status queries never produce an undocumented error (run #8)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0120 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 2; i++) {
        outcomes.push(query());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0120 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_2200
     * @tc.name      testMotionOutcome0121
     * @tc.desc      Verify 3 consecutive status queries never produce an undocumented error (run #9)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0121 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 3; i++) {
        outcomes.push(query());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0121 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_2300
     * @tc.name      testMotionOutcome0122
     * @tc.desc      Verify 4 consecutive status queries never produce an undocumented error (run #10)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0122 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 4; i++) {
        outcomes.push(query());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0122 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_2400
     * @tc.name      testMotionOutcome0123
     * @tc.desc      Verify 5 consecutive status queries never produce an undocumented error (run #11)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0123 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 5; i++) {
        outcomes.push(query());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0123 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_2500
     * @tc.name      testMotionOutcome0124
     * @tc.desc      Verify 6 consecutive status queries never produce an undocumented error (run #12)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0124 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 6; i++) {
        outcomes.push(query());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0124 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_2600
     * @tc.name      testMotionOutcome0125
     * @tc.desc      Verify 1 consecutive status queries never produce an undocumented error (run #13)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0125 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 1; i++) {
        outcomes.push(query());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0125 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_2700
     * @tc.name      testMotionOutcome0126
     * @tc.desc      Verify 2 consecutive status queries never produce an undocumented error (run #14)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0126 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 2; i++) {
        outcomes.push(query());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0126 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_2800
     * @tc.name      testMotionOutcome0127
     * @tc.desc      Verify 3 consecutive status queries never produce an undocumented error (run #15)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0127 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 3; i++) {
        outcomes.push(query());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0127 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_2900
     * @tc.name      testMotionOutcome0128
     * @tc.desc      Verify 4 consecutive status queries never produce an undocumented error (run #16)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0128 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 4; i++) {
        outcomes.push(query());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0128 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_3000
     * @tc.name      testMotionOutcome0129
     * @tc.desc      Verify 2 operating subscribe/unsubscribe cycles stay valid (cycle #1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0129 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 2; i++) {
        outcomes.push(onOperating());
        outcomes.push(offOperating());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0129 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_3100
     * @tc.name      testMotionOutcome0130
     * @tc.desc      Verify 3 holding subscribe/unsubscribe cycles stay valid (cycle #2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0130 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 3; i++) {
        outcomes.push(onHolding());
        outcomes.push(offHolding());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0130 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_3200
     * @tc.name      testMotionOutcome0131
     * @tc.desc      Verify 4 operating subscribe/unsubscribe cycles stay valid (cycle #3)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0131 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 4; i++) {
        outcomes.push(onOperating());
        outcomes.push(offOperating());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0131 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_3300
     * @tc.name      testMotionOutcome0132
     * @tc.desc      Verify 5 holding subscribe/unsubscribe cycles stay valid (cycle #4)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0132 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 5; i++) {
        outcomes.push(onHolding());
        outcomes.push(offHolding());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0132 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_3400
     * @tc.name      testMotionOutcome0133
     * @tc.desc      Verify 6 operating subscribe/unsubscribe cycles stay valid (cycle #5)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0133 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 6; i++) {
        outcomes.push(onOperating());
        outcomes.push(offOperating());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0133 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_3500
     * @tc.name      testMotionOutcome0134
     * @tc.desc      Verify 2 holding subscribe/unsubscribe cycles stay valid (cycle #6)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0134 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 2; i++) {
        outcomes.push(onHolding());
        outcomes.push(offHolding());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0134 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_3600
     * @tc.name      testMotionOutcome0135
     * @tc.desc      Verify 3 operating subscribe/unsubscribe cycles stay valid (cycle #7)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0135 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 3; i++) {
        outcomes.push(onOperating());
        outcomes.push(offOperating());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0135 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_3700
     * @tc.name      testMotionOutcome0136
     * @tc.desc      Verify 4 holding subscribe/unsubscribe cycles stay valid (cycle #8)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0136 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 4; i++) {
        outcomes.push(onHolding());
        outcomes.push(offHolding());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0136 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_3800
     * @tc.name      testMotionOutcome0137
     * @tc.desc      Verify 5 operating subscribe/unsubscribe cycles stay valid (cycle #9)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0137 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 5; i++) {
        outcomes.push(onOperating());
        outcomes.push(offOperating());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0137 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_3900
     * @tc.name      testMotionOutcome0138
     * @tc.desc      Verify 6 holding subscribe/unsubscribe cycles stay valid (cycle #10)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0138 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 6; i++) {
        outcomes.push(onHolding());
        outcomes.push(offHolding());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0138 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_4000
     * @tc.name      testMotionOutcome0139
     * @tc.desc      Verify 2 operating subscribe/unsubscribe cycles stay valid (cycle #11)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0139 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 2; i++) {
        outcomes.push(onOperating());
        outcomes.push(offOperating());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0139 end');
    });

    /**
     * @tc.number    SUB_MOTION_OUTCOME_ONE_4100
     * @tc.name      testMotionOutcome0140
     * @tc.desc      Verify 3 holding subscribe/unsubscribe cycles stay valid (cycle #12)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testMotionOutcome0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0140 begin');
      const outcomes: CallOutcome[] = [];
      for (let i = 0; i < 3; i++) {
        outcomes.push(onHolding());
        outcomes.push(offHolding());
      }
      expect(isSequenceValid(outcomes)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMotionOutcome0140 end');
    });
  });
}
