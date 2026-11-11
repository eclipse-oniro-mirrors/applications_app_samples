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
import { BusinessError } from '@kit.BasicServicesKit';

const TAG: string = '[Sample_StationaryApiOutcomeMatrixTest]';
const DOMAIN: number = 0xF812;

const ALLOWED_CODES: number[] = [201, 401, 801];
const LATENCY: number = 1000000000;

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

function callback(_response: stationary.ActivityResponse): void {
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

function onStillEnter(): CallOutcome {
  return run(() => stationary.on('still', stationary.ActivityEvent.ENTER, LATENCY, callback));
}

function onStillExit(): CallOutcome {
  return run(() => stationary.on('still', stationary.ActivityEvent.EXIT, LATENCY, callback));
}

function onStillBoth(): CallOutcome {
  return run(() => stationary.on('still', stationary.ActivityEvent.ENTER_EXIT, LATENCY, callback));
}

function onRelativeEnter(): CallOutcome {
  return run(() => stationary.on('relativeStill', stationary.ActivityEvent.ENTER, LATENCY, callback));
}

function onRelativeExit(): CallOutcome {
  return run(() => stationary.on('relativeStill', stationary.ActivityEvent.EXIT, LATENCY, callback));
}

function onRelativeBoth(): CallOutcome {
  return run(() => stationary.on('relativeStill', stationary.ActivityEvent.ENTER_EXIT, LATENCY, callback));
}

function offStillEnter(): CallOutcome {
  return run(() => stationary.off('still', stationary.ActivityEvent.ENTER, callback));
}

function offStillExit(): CallOutcome {
  return run(() => stationary.off('still', stationary.ActivityEvent.EXIT, callback));
}

function offStillBoth(): CallOutcome {
  return run(() => stationary.off('still', stationary.ActivityEvent.ENTER_EXIT, callback));
}

function offAllStillEnter(): CallOutcome {
  return run(() => stationary.off('still', stationary.ActivityEvent.ENTER));
}

function offAllStillBoth(): CallOutcome {
  return run(() => stationary.off('still', stationary.ActivityEvent.ENTER_EXIT));
}

function onStillEnterAt(reportLatencyNs: number): CallOutcome {
  return run(() => stationary.on('still', stationary.ActivityEvent.ENTER, reportLatencyNs, callback));
}

function onceStill(): CallOutcome {
  return run(() => stationary.once('still', callback));
}

function onceRelative(): CallOutcome {
  return run(() => stationary.once('relativeStill', callback));
}

/**
 * stationary API 结果矩阵（环境自适应）。
 *
 * 每个动作只允许两种合法终态：调用成功，或抛出参数/能力类错误 201/401/801。
 * 矩阵按单动作、两动作、三动作混排、回调形态与重复轮次展开。
 */
export default function StationaryApiOutcomeMatrixTest(): void {
  describe('StationaryApiOutcomeMatrixTest', () => {

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_0100
     * @tc.name      testStationaryOutcome0001
     * @tc.desc      Verify still ENTER subscribe yields exactly one valid outcome (step #1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryOutcome0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0001 begin');
      expectOneValidOutcome('onStillEnter', onStillEnter());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0001 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_0200
     * @tc.name      testStationaryOutcome0002
     * @tc.desc      Verify still EXIT subscribe yields exactly one valid outcome (step #2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryOutcome0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0002 begin');
      expectOneValidOutcome('onStillExit', onStillExit());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0002 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_0300
     * @tc.name      testStationaryOutcome0003
     * @tc.desc      Verify still ENTER_EXIT subscribe yields exactly one valid outcome (step #3)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryOutcome0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0003 begin');
      expectOneValidOutcome('onStillBoth', onStillBoth());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0003 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_0400
     * @tc.name      testStationaryOutcome0004
     * @tc.desc      Verify relativeStill ENTER subscribe yields exactly one valid outcome (step #4)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryOutcome0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0004 begin');
      expectOneValidOutcome('onRelativeEnter', onRelativeEnter());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0004 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_0500
     * @tc.name      testStationaryOutcome0005
     * @tc.desc      Verify relativeStill EXIT subscribe yields exactly one valid outcome (step #5)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryOutcome0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0005 begin');
      expectOneValidOutcome('onRelativeExit', onRelativeExit());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0005 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_0600
     * @tc.name      testStationaryOutcome0006
     * @tc.desc      Verify relativeStill ENTER_EXIT subscribe yields exactly one valid outcome (step #6)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryOutcome0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0006 begin');
      expectOneValidOutcome('onRelativeBoth', onRelativeBoth());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0006 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_0700
     * @tc.name      testStationaryOutcome0007
     * @tc.desc      Verify still ENTER unsubscribe with callback yields exactly one valid outcome (step #7)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryOutcome0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0007 begin');
      expectOneValidOutcome('offStillEnter', offStillEnter());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0007 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_0800
     * @tc.name      testStationaryOutcome0008
     * @tc.desc      Verify still EXIT unsubscribe with callback yields exactly one valid outcome (step #8)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryOutcome0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0008 begin');
      expectOneValidOutcome('offStillExit', offStillExit());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0008 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_0900
     * @tc.name      testStationaryOutcome0009
     * @tc.desc      Verify still ENTER subscribe yields exactly one valid outcome (step #9)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0009 begin');
      expectOneValidOutcome('onStillEnter', onStillEnter());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0009 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_1000
     * @tc.name      testStationaryOutcome0010
     * @tc.desc      Verify still EXIT subscribe yields exactly one valid outcome (step #10)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0010 begin');
      expectOneValidOutcome('onStillExit', onStillExit());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0010 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_1100
     * @tc.name      testStationaryOutcome0011
     * @tc.desc      Verify still ENTER_EXIT subscribe yields exactly one valid outcome (step #11)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0011 begin');
      expectOneValidOutcome('onStillBoth', onStillBoth());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0011 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_1200
     * @tc.name      testStationaryOutcome0012
     * @tc.desc      Verify relativeStill ENTER subscribe yields exactly one valid outcome (step #12)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0012 begin');
      expectOneValidOutcome('onRelativeEnter', onRelativeEnter());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0012 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_1300
     * @tc.name      testStationaryOutcome0013
     * @tc.desc      Verify relativeStill EXIT subscribe yields exactly one valid outcome (step #13)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0013 begin');
      expectOneValidOutcome('onRelativeExit', onRelativeExit());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0013 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_1400
     * @tc.name      testStationaryOutcome0014
     * @tc.desc      Verify relativeStill ENTER_EXIT subscribe yields exactly one valid outcome (step #14)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0014 begin');
      expectOneValidOutcome('onRelativeBoth', onRelativeBoth());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0014 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_1500
     * @tc.name      testStationaryOutcome0015
     * @tc.desc      Verify still ENTER unsubscribe with callback yields exactly one valid outcome (step #15)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0015 begin');
      expectOneValidOutcome('offStillEnter', offStillEnter());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0015 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_1600
     * @tc.name      testStationaryOutcome0016
     * @tc.desc      Verify still EXIT unsubscribe with callback yields exactly one valid outcome (step #16)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0016 begin');
      expectOneValidOutcome('offStillExit', offStillExit());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0016 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_1700
     * @tc.name      testStationaryOutcome0017
     * @tc.desc      Verify still ENTER subscribe yields exactly one valid outcome (step #17)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0017 begin');
      expectOneValidOutcome('onStillEnter', onStillEnter());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0017 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_1800
     * @tc.name      testStationaryOutcome0018
     * @tc.desc      Verify still EXIT subscribe yields exactly one valid outcome (step #18)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0018 begin');
      expectOneValidOutcome('onStillExit', onStillExit());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0018 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_1900
     * @tc.name      testStationaryOutcome0019
     * @tc.desc      Verify still ENTER_EXIT subscribe yields exactly one valid outcome (step #19)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0019 begin');
      expectOneValidOutcome('onStillBoth', onStillBoth());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0019 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_2000
     * @tc.name      testStationaryOutcome0020
     * @tc.desc      Verify relativeStill ENTER subscribe yields exactly one valid outcome (step #20)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0020 begin');
      expectOneValidOutcome('onRelativeEnter', onRelativeEnter());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0020 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_2100
     * @tc.name      testStationaryOutcome0021
     * @tc.desc      Verify relativeStill EXIT subscribe yields exactly one valid outcome (step #21)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0021 begin');
      expectOneValidOutcome('onRelativeExit', onRelativeExit());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0021 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_2200
     * @tc.name      testStationaryOutcome0022
     * @tc.desc      Verify relativeStill ENTER_EXIT subscribe yields exactly one valid outcome (step #22)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0022 begin');
      expectOneValidOutcome('onRelativeBoth', onRelativeBoth());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0022 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_2300
     * @tc.name      testStationaryOutcome0023
     * @tc.desc      Verify still ENTER unsubscribe with callback yields exactly one valid outcome (step #23)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0023 begin');
      expectOneValidOutcome('offStillEnter', offStillEnter());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0023 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_2400
     * @tc.name      testStationaryOutcome0024
     * @tc.desc      Verify still EXIT unsubscribe with callback yields exactly one valid outcome (step #24)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0024 begin');
      expectOneValidOutcome('offStillExit', offStillExit());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0024 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_2500
     * @tc.name      testStationaryOutcome0025
     * @tc.desc      Verify still ENTER subscribe yields exactly one valid outcome (step #25)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0025 begin');
      expectOneValidOutcome('onStillEnter', onStillEnter());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0025 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_2600
     * @tc.name      testStationaryOutcome0026
     * @tc.desc      Verify still EXIT subscribe yields exactly one valid outcome (step #26)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0026 begin');
      expectOneValidOutcome('onStillExit', onStillExit());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0026 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_2700
     * @tc.name      testStationaryOutcome0027
     * @tc.desc      Verify still ENTER_EXIT subscribe yields exactly one valid outcome (step #27)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0027 begin');
      expectOneValidOutcome('onStillBoth', onStillBoth());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0027 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_2800
     * @tc.name      testStationaryOutcome0028
     * @tc.desc      Verify relativeStill ENTER subscribe yields exactly one valid outcome (step #28)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0028 begin');
      expectOneValidOutcome('onRelativeEnter', onRelativeEnter());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0028 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_2900
     * @tc.name      testStationaryOutcome0029
     * @tc.desc      Verify relativeStill EXIT subscribe yields exactly one valid outcome (step #29)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0029 begin');
      expectOneValidOutcome('onRelativeExit', onRelativeExit());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0029 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_3000
     * @tc.name      testStationaryOutcome0030
     * @tc.desc      Verify relativeStill ENTER_EXIT subscribe yields exactly one valid outcome (step #30)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0030 begin');
      expectOneValidOutcome('onRelativeBoth', onRelativeBoth());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0030 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_3100
     * @tc.name      testStationaryOutcome0031
     * @tc.desc      Verify still ENTER unsubscribe with callback yields exactly one valid outcome (step #31)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0031 begin');
      expectOneValidOutcome('offStillEnter', offStillEnter());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0031 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_3200
     * @tc.name      testStationaryOutcome0032
     * @tc.desc      Verify still EXIT unsubscribe with callback yields exactly one valid outcome (step #32)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0032 begin');
      expectOneValidOutcome('offStillExit', offStillExit());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0032 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_3300
     * @tc.name      testStationaryOutcome0033
     * @tc.desc      Verify still ENTER subscribe yields exactly one valid outcome (step #33)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0033 begin');
      expectOneValidOutcome('onStillEnter', onStillEnter());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0033 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_3400
     * @tc.name      testStationaryOutcome0034
     * @tc.desc      Verify still EXIT subscribe yields exactly one valid outcome (step #34)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0034 begin');
      expectOneValidOutcome('onStillExit', onStillExit());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0034 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_3500
     * @tc.name      testStationaryOutcome0035
     * @tc.desc      Verify still ENTER_EXIT subscribe yields exactly one valid outcome (step #35)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0035 begin');
      expectOneValidOutcome('onStillBoth', onStillBoth());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0035 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_3600
     * @tc.name      testStationaryOutcome0036
     * @tc.desc      Verify relativeStill ENTER subscribe yields exactly one valid outcome (step #36)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0036 begin');
      expectOneValidOutcome('onRelativeEnter', onRelativeEnter());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0036 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_3700
     * @tc.name      testStationaryOutcome0037
     * @tc.desc      Verify relativeStill EXIT subscribe yields exactly one valid outcome (step #37)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0037 begin');
      expectOneValidOutcome('onRelativeExit', onRelativeExit());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0037 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_3800
     * @tc.name      testStationaryOutcome0038
     * @tc.desc      Verify relativeStill ENTER_EXIT subscribe yields exactly one valid outcome (step #38)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0038 begin');
      expectOneValidOutcome('onRelativeBoth', onRelativeBoth());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0038 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_3900
     * @tc.name      testStationaryOutcome0039
     * @tc.desc      Verify still ENTER unsubscribe with callback yields exactly one valid outcome (step #39)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0039 begin');
      expectOneValidOutcome('offStillEnter', offStillEnter());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0039 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_4000
     * @tc.name      testStationaryOutcome0040
     * @tc.desc      Verify still EXIT unsubscribe with callback yields exactly one valid outcome (step #40)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0040 begin');
      expectOneValidOutcome('offStillExit', offStillExit());
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0040 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_4100
     * @tc.name      testStationaryOutcome0041
     * @tc.desc      Verify onStillEnter then offStillEnter each yield a valid outcome (pair #1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0041 begin');
      expectSequenceValid('onStillEnter->offStillEnter', [onStillEnter(), offStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0041 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_4200
     * @tc.name      testStationaryOutcome0042
     * @tc.desc      Verify offStillEnter then onStillEnter each yield a valid outcome (pair #2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0042 begin');
      expectSequenceValid('offStillEnter->onStillEnter', [offStillEnter(), onStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0042 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_4300
     * @tc.name      testStationaryOutcome0043
     * @tc.desc      Verify onStillEnter then onStillEnter each yield a valid outcome (pair #3)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0043 begin');
      expectSequenceValid('onStillEnter->onStillEnter', [onStillEnter(), onStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0043 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_4400
     * @tc.name      testStationaryOutcome0044
     * @tc.desc      Verify offStillEnter then offAllStillEnter each yield a valid outcome (pair #4)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0044 begin');
      expectSequenceValid('offStillEnter->offAllStillEnter', [offStillEnter(), offAllStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0044 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_4500
     * @tc.name      testStationaryOutcome0045
     * @tc.desc      Verify onRelativeBoth then offAllStillBoth each yield a valid outcome (pair #5)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0045 begin');
      expectSequenceValid('onRelativeBoth->offAllStillBoth', [onRelativeBoth(), offAllStillBoth()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0045 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_4600
     * @tc.name      testStationaryOutcome0046
     * @tc.desc      Verify offStillExit then onStillExit each yield a valid outcome (pair #6)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0046 begin');
      expectSequenceValid('offStillExit->onStillExit', [offStillExit(), onStillExit()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0046 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_4700
     * @tc.name      testStationaryOutcome0047
     * @tc.desc      Verify onStillEnter then offStillEnter each yield a valid outcome (pair #7)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0047 begin');
      expectSequenceValid('onStillEnter->offStillEnter', [onStillEnter(), offStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0047 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_4800
     * @tc.name      testStationaryOutcome0048
     * @tc.desc      Verify offStillEnter then onStillEnter each yield a valid outcome (pair #8)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0048 begin');
      expectSequenceValid('offStillEnter->onStillEnter', [offStillEnter(), onStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0048 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_4900
     * @tc.name      testStationaryOutcome0049
     * @tc.desc      Verify onStillEnter then onStillEnter each yield a valid outcome (pair #9)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0049 begin');
      expectSequenceValid('onStillEnter->onStillEnter', [onStillEnter(), onStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0049 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_5000
     * @tc.name      testStationaryOutcome0050
     * @tc.desc      Verify offStillEnter then offAllStillEnter each yield a valid outcome (pair #10)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0050 begin');
      expectSequenceValid('offStillEnter->offAllStillEnter', [offStillEnter(), offAllStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0050 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_5100
     * @tc.name      testStationaryOutcome0051
     * @tc.desc      Verify onRelativeBoth then offAllStillBoth each yield a valid outcome (pair #11)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0051 begin');
      expectSequenceValid('onRelativeBoth->offAllStillBoth', [onRelativeBoth(), offAllStillBoth()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0051 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_5200
     * @tc.name      testStationaryOutcome0052
     * @tc.desc      Verify offStillExit then onStillExit each yield a valid outcome (pair #12)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0052 begin');
      expectSequenceValid('offStillExit->onStillExit', [offStillExit(), onStillExit()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0052 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_5300
     * @tc.name      testStationaryOutcome0053
     * @tc.desc      Verify onStillEnter then offStillEnter each yield a valid outcome (pair #13)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0053 begin');
      expectSequenceValid('onStillEnter->offStillEnter', [onStillEnter(), offStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0053 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_5400
     * @tc.name      testStationaryOutcome0054
     * @tc.desc      Verify offStillEnter then onStillEnter each yield a valid outcome (pair #14)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0054 begin');
      expectSequenceValid('offStillEnter->onStillEnter', [offStillEnter(), onStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0054 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_5500
     * @tc.name      testStationaryOutcome0055
     * @tc.desc      Verify onStillEnter then onStillEnter each yield a valid outcome (pair #15)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0055 begin');
      expectSequenceValid('onStillEnter->onStillEnter', [onStillEnter(), onStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0055 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_5600
     * @tc.name      testStationaryOutcome0056
     * @tc.desc      Verify offStillEnter then offAllStillEnter each yield a valid outcome (pair #16)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0056 begin');
      expectSequenceValid('offStillEnter->offAllStillEnter', [offStillEnter(), offAllStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0056 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_5700
     * @tc.name      testStationaryOutcome0057
     * @tc.desc      Verify onRelativeBoth then offAllStillBoth each yield a valid outcome (pair #17)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0057 begin');
      expectSequenceValid('onRelativeBoth->offAllStillBoth', [onRelativeBoth(), offAllStillBoth()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0057 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_5800
     * @tc.name      testStationaryOutcome0058
     * @tc.desc      Verify offStillExit then onStillExit each yield a valid outcome (pair #18)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0058 begin');
      expectSequenceValid('offStillExit->onStillExit', [offStillExit(), onStillExit()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0058 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_5900
     * @tc.name      testStationaryOutcome0059
     * @tc.desc      Verify onStillEnter then offStillEnter each yield a valid outcome (pair #19)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0059 begin');
      expectSequenceValid('onStillEnter->offStillEnter', [onStillEnter(), offStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0059 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_6000
     * @tc.name      testStationaryOutcome0060
     * @tc.desc      Verify offStillEnter then onStillEnter each yield a valid outcome (pair #20)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0060 begin');
      expectSequenceValid('offStillEnter->onStillEnter', [offStillEnter(), onStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0060 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_6100
     * @tc.name      testStationaryOutcome0061
     * @tc.desc      Verify onStillEnter then onStillEnter each yield a valid outcome (pair #21)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0061 begin');
      expectSequenceValid('onStillEnter->onStillEnter', [onStillEnter(), onStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0061 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_6200
     * @tc.name      testStationaryOutcome0062
     * @tc.desc      Verify offStillEnter then offAllStillEnter each yield a valid outcome (pair #22)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0062 begin');
      expectSequenceValid('offStillEnter->offAllStillEnter', [offStillEnter(), offAllStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0062 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_6300
     * @tc.name      testStationaryOutcome0063
     * @tc.desc      Verify onRelativeBoth then offAllStillBoth each yield a valid outcome (pair #23)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0063 begin');
      expectSequenceValid('onRelativeBoth->offAllStillBoth', [onRelativeBoth(), offAllStillBoth()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0063 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_6400
     * @tc.name      testStationaryOutcome0064
     * @tc.desc      Verify offStillExit then onStillExit each yield a valid outcome (pair #24)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0064 begin');
      expectSequenceValid('offStillExit->onStillExit', [offStillExit(), onStillExit()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0064 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_6500
     * @tc.name      testStationaryOutcome0065
     * @tc.desc      Verify onStillEnter then offStillEnter each yield a valid outcome (pair #25)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0065 begin');
      expectSequenceValid('onStillEnter->offStillEnter', [onStillEnter(), offStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0065 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_6600
     * @tc.name      testStationaryOutcome0066
     * @tc.desc      Verify offStillEnter then onStillEnter each yield a valid outcome (pair #26)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0066 begin');
      expectSequenceValid('offStillEnter->onStillEnter', [offStillEnter(), onStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0066 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_6700
     * @tc.name      testStationaryOutcome0067
     * @tc.desc      Verify onStillEnter then onStillEnter each yield a valid outcome (pair #27)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0067 begin');
      expectSequenceValid('onStillEnter->onStillEnter', [onStillEnter(), onStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0067 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_6800
     * @tc.name      testStationaryOutcome0068
     * @tc.desc      Verify offStillEnter then offAllStillEnter each yield a valid outcome (pair #28)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0068 begin');
      expectSequenceValid('offStillEnter->offAllStillEnter', [offStillEnter(), offAllStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0068 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_6900
     * @tc.name      testStationaryOutcome0069
     * @tc.desc      Verify onRelativeBoth then offAllStillBoth each yield a valid outcome (pair #29)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0069 begin');
      expectSequenceValid('onRelativeBoth->offAllStillBoth', [onRelativeBoth(), offAllStillBoth()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0069 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_7000
     * @tc.name      testStationaryOutcome0070
     * @tc.desc      Verify offStillExit then onStillExit each yield a valid outcome (pair #30)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryOutcome0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0070 begin');
      expectSequenceValid('offStillExit->onStillExit', [offStillExit(), onStillExit()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0070 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_7100
     * @tc.name      testStationaryOutcome0071
     * @tc.desc      Verify triple onStillEnter-onStillExit-offStillEnter stays legal (#1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0071 begin');
      expectSequenceValid('onStillEnter->onStillExit->offStillEnter',
        [onStillEnter(), onStillExit(), offStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0071 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_7200
     * @tc.name      testStationaryOutcome0072
     * @tc.desc      Verify triple onStillBoth-offAllStillBoth-onceStill stays legal (#2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0072 begin');
      expectSequenceValid('onStillBoth->offAllStillBoth->onceStill',
        [onStillBoth(), offAllStillBoth(), onceStill()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0072 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_7300
     * @tc.name      testStationaryOutcome0073
     * @tc.desc      Verify triple onRelativeEnter-onRelativeExit-onceRelative stays legal (#3)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0073 begin');
      expectSequenceValid('onRelativeEnter->onRelativeExit->onceRelative',
        [onRelativeEnter(), onRelativeExit(), onceRelative()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0073 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_7400
     * @tc.name      testStationaryOutcome0074
     * @tc.desc      Verify triple offAllStillEnter-onStillEnter-offStillEnter stays legal (#4)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0074 begin');
      expectSequenceValid('offAllStillEnter->onStillEnter->offStillEnter',
        [offAllStillEnter(), onStillEnter(), offStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0074 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_7500
     * @tc.name      testStationaryOutcome0075
     * @tc.desc      Verify triple onceStill-onStillEnter-offAllStillEnter stays legal (#5)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0075 begin');
      expectSequenceValid('onceStill->onStillEnter->offAllStillEnter',
        [onceStill(), onStillEnter(), offAllStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0075 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_7600
     * @tc.name      testStationaryOutcome0076
     * @tc.desc      Verify triple onStillEnter-offStillEnter-onStillEnter stays legal (#6)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0076 begin');
      expectSequenceValid('onStillEnter->offStillEnter->onStillEnter',
        [onStillEnter(), offStillEnter(), onStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0076 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_7700
     * @tc.name      testStationaryOutcome0077
     * @tc.desc      Verify triple onStillEnter-onStillExit-offStillEnter stays legal (#7)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0077 begin');
      expectSequenceValid('onStillEnter->onStillExit->offStillEnter',
        [onStillEnter(), onStillExit(), offStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0077 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_7800
     * @tc.name      testStationaryOutcome0078
     * @tc.desc      Verify triple onStillBoth-offAllStillBoth-onceStill stays legal (#8)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0078 begin');
      expectSequenceValid('onStillBoth->offAllStillBoth->onceStill',
        [onStillBoth(), offAllStillBoth(), onceStill()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0078 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_7900
     * @tc.name      testStationaryOutcome0079
     * @tc.desc      Verify triple onRelativeEnter-onRelativeExit-onceRelative stays legal (#9)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0079 begin');
      expectSequenceValid('onRelativeEnter->onRelativeExit->onceRelative',
        [onRelativeEnter(), onRelativeExit(), onceRelative()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0079 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_8000
     * @tc.name      testStationaryOutcome0080
     * @tc.desc      Verify triple offAllStillEnter-onStillEnter-offStillEnter stays legal (#10)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0080 begin');
      expectSequenceValid('offAllStillEnter->onStillEnter->offStillEnter',
        [offAllStillEnter(), onStillEnter(), offStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0080 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_8100
     * @tc.name      testStationaryOutcome0081
     * @tc.desc      Verify triple onceStill-onStillEnter-offAllStillEnter stays legal (#11)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0081 begin');
      expectSequenceValid('onceStill->onStillEnter->offAllStillEnter',
        [onceStill(), onStillEnter(), offAllStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0081 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_8200
     * @tc.name      testStationaryOutcome0082
     * @tc.desc      Verify triple onStillEnter-offStillEnter-onStillEnter stays legal (#12)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0082 begin');
      expectSequenceValid('onStillEnter->offStillEnter->onStillEnter',
        [onStillEnter(), offStillEnter(), onStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0082 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_8300
     * @tc.name      testStationaryOutcome0083
     * @tc.desc      Verify triple onStillEnter-onStillExit-offStillEnter stays legal (#13)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0083 begin');
      expectSequenceValid('onStillEnter->onStillExit->offStillEnter',
        [onStillEnter(), onStillExit(), offStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0083 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_8400
     * @tc.name      testStationaryOutcome0084
     * @tc.desc      Verify triple onStillBoth-offAllStillBoth-onceStill stays legal (#14)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0084 begin');
      expectSequenceValid('onStillBoth->offAllStillBoth->onceStill',
        [onStillBoth(), offAllStillBoth(), onceStill()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0084 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_8500
     * @tc.name      testStationaryOutcome0085
     * @tc.desc      Verify triple onRelativeEnter-onRelativeExit-onceRelative stays legal (#15)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0085 begin');
      expectSequenceValid('onRelativeEnter->onRelativeExit->onceRelative',
        [onRelativeEnter(), onRelativeExit(), onceRelative()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0085 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_8600
     * @tc.name      testStationaryOutcome0086
     * @tc.desc      Verify triple offAllStillEnter-onStillEnter-offStillEnter stays legal (#16)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0086 begin');
      expectSequenceValid('offAllStillEnter->onStillEnter->offStillEnter',
        [offAllStillEnter(), onStillEnter(), offStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0086 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_8700
     * @tc.name      testStationaryOutcome0087
     * @tc.desc      Verify triple onceStill-onStillEnter-offAllStillEnter stays legal (#17)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0087 begin');
      expectSequenceValid('onceStill->onStillEnter->offAllStillEnter',
        [onceStill(), onStillEnter(), offAllStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0087 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_8800
     * @tc.name      testStationaryOutcome0088
     * @tc.desc      Verify triple onStillEnter-offStillEnter-onStillEnter stays legal (#18)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0088 begin');
      expectSequenceValid('onStillEnter->offStillEnter->onStillEnter',
        [onStillEnter(), offStillEnter(), onStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0088 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_8900
     * @tc.name      testStationaryOutcome0089
     * @tc.desc      Verify triple onStillEnter-onStillExit-offStillEnter stays legal (#19)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0089 begin');
      expectSequenceValid('onStillEnter->onStillExit->offStillEnter',
        [onStillEnter(), onStillExit(), offStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0089 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_9000
     * @tc.name      testStationaryOutcome0090
     * @tc.desc      Verify triple onStillBoth-offAllStillBoth-onceStill stays legal (#20)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0090 begin');
      expectSequenceValid('onStillBoth->offAllStillBoth->onceStill',
        [onStillBoth(), offAllStillBoth(), onceStill()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0090 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_9100
     * @tc.name      testStationaryOutcome0091
     * @tc.desc      Verify triple onRelativeEnter-onRelativeExit-onceRelative stays legal (#21)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0091 begin');
      expectSequenceValid('onRelativeEnter->onRelativeExit->onceRelative',
        [onRelativeEnter(), onRelativeExit(), onceRelative()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0091 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_9200
     * @tc.name      testStationaryOutcome0092
     * @tc.desc      Verify triple offAllStillEnter-onStillEnter-offStillEnter stays legal (#22)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0092 begin');
      expectSequenceValid('offAllStillEnter->onStillEnter->offStillEnter',
        [offAllStillEnter(), onStillEnter(), offStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0092 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_9300
     * @tc.name      testStationaryOutcome0093
     * @tc.desc      Verify triple onceStill-onStillEnter-offAllStillEnter stays legal (#23)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0093 begin');
      expectSequenceValid('onceStill->onStillEnter->offAllStillEnter',
        [onceStill(), onStillEnter(), offAllStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0093 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_9400
     * @tc.name      testStationaryOutcome0094
     * @tc.desc      Verify triple onStillEnter-offStillEnter-onStillEnter stays legal (#24)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0094 begin');
      expectSequenceValid('onStillEnter->offStillEnter->onStillEnter',
        [onStillEnter(), offStillEnter(), onStillEnter()]);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0094 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_9500
     * @tc.name      testStationaryOutcome0095
     * @tc.desc      Verify once with malformed activity "empty" only raises documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0095 begin');
      let invalidError: number = 0;
      let validOutcome: number = 0;
      try {
        stationary.once('' as stationary.ActivityType, callback);
        validOutcome++;
      } catch (err) {
        if (isAllowedError(err as Object)) {
          validOutcome++;
        } else {
          invalidError++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'valid=' + validOutcome + ' invalid=' + invalidError);
      expect(invalidError).assertEqual(0);
      expect(validOutcome).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0095 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_9600
     * @tc.name      testStationaryOutcome0096
     * @tc.desc      Verify once with malformed activity "upper" only raises documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0096 begin');
      let invalidError: number = 0;
      let validOutcome: number = 0;
      try {
        stationary.once('STILL' as stationary.ActivityType, callback);
        validOutcome++;
      } catch (err) {
        if (isAllowedError(err as Object)) {
          validOutcome++;
        } else {
          invalidError++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'valid=' + validOutcome + ' invalid=' + invalidError);
      expect(invalidError).assertEqual(0);
      expect(validOutcome).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0096 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_9700
     * @tc.name      testStationaryOutcome0097
     * @tc.desc      Verify once with malformed activity "space" only raises documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0097 begin');
      let invalidError: number = 0;
      let validOutcome: number = 0;
      try {
        stationary.once('still ' as stationary.ActivityType, callback);
        validOutcome++;
      } catch (err) {
        if (isAllowedError(err as Object)) {
          validOutcome++;
        } else {
          invalidError++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'valid=' + validOutcome + ' invalid=' + invalidError);
      expect(invalidError).assertEqual(0);
      expect(validOutcome).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0097 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_9800
     * @tc.name      testStationaryOutcome0098
     * @tc.desc      Verify once with malformed activity "underscore" only raises documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0098 begin');
      let invalidError: number = 0;
      let validOutcome: number = 0;
      try {
        stationary.once('relative_still' as stationary.ActivityType, callback);
        validOutcome++;
      } catch (err) {
        if (isAllowedError(err as Object)) {
          validOutcome++;
        } else {
          invalidError++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'valid=' + validOutcome + ' invalid=' + invalidError);
      expect(invalidError).assertEqual(0);
      expect(validOutcome).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0098 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_9900
     * @tc.name      testStationaryOutcome0099
     * @tc.desc      Verify once with malformed activity "camel" only raises documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0099 begin');
      let invalidError: number = 0;
      let validOutcome: number = 0;
      try {
        stationary.once('relativeboth' as stationary.ActivityType, callback);
        validOutcome++;
      } catch (err) {
        if (isAllowedError(err as Object)) {
          validOutcome++;
        } else {
          invalidError++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'valid=' + validOutcome + ' invalid=' + invalidError);
      expect(invalidError).assertEqual(0);
      expect(validOutcome).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0099 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_ONE_0100
     * @tc.name      testStationaryOutcome0100
     * @tc.desc      Verify once with malformed activity "num" only raises documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0100 begin');
      let invalidError: number = 0;
      let validOutcome: number = 0;
      try {
        stationary.once('1' as stationary.ActivityType, callback);
        validOutcome++;
      } catch (err) {
        if (isAllowedError(err as Object)) {
          validOutcome++;
        } else {
          invalidError++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'valid=' + validOutcome + ' invalid=' + invalidError);
      expect(invalidError).assertEqual(0);
      expect(validOutcome).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0100 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_ONE_0200
     * @tc.name      testStationaryOutcome0101
     * @tc.desc      Verify once with malformed activity "null" only raises documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0101 begin');
      let invalidError: number = 0;
      let validOutcome: number = 0;
      try {
        stationary.once('null' as stationary.ActivityType, callback);
        validOutcome++;
      } catch (err) {
        if (isAllowedError(err as Object)) {
          validOutcome++;
        } else {
          invalidError++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'valid=' + validOutcome + ' invalid=' + invalidError);
      expect(invalidError).assertEqual(0);
      expect(validOutcome).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0101 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_ONE_0300
     * @tc.name      testStationaryOutcome0102
     * @tc.desc      Verify once with malformed activity "mixed" only raises documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0102 begin');
      let invalidError: number = 0;
      let validOutcome: number = 0;
      try {
        stationary.once('Still' as stationary.ActivityType, callback);
        validOutcome++;
      } catch (err) {
        if (isAllowedError(err as Object)) {
          validOutcome++;
        } else {
          invalidError++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'valid=' + validOutcome + ' invalid=' + invalidError);
      expect(invalidError).assertEqual(0);
      expect(validOutcome).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0102 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_ONE_0400
     * @tc.name      testStationaryOutcome0103
     * @tc.desc      Verify once with malformed activity "empty" only raises documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0103 begin');
      let invalidError: number = 0;
      let validOutcome: number = 0;
      try {
        stationary.once('' as stationary.ActivityType, callback);
        validOutcome++;
      } catch (err) {
        if (isAllowedError(err as Object)) {
          validOutcome++;
        } else {
          invalidError++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'valid=' + validOutcome + ' invalid=' + invalidError);
      expect(invalidError).assertEqual(0);
      expect(validOutcome).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0103 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_ONE_0500
     * @tc.name      testStationaryOutcome0104
     * @tc.desc      Verify once with malformed activity "upper" only raises documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0104 begin');
      let invalidError: number = 0;
      let validOutcome: number = 0;
      try {
        stationary.once('STILL' as stationary.ActivityType, callback);
        validOutcome++;
      } catch (err) {
        if (isAllowedError(err as Object)) {
          validOutcome++;
        } else {
          invalidError++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'valid=' + validOutcome + ' invalid=' + invalidError);
      expect(invalidError).assertEqual(0);
      expect(validOutcome).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0104 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_ONE_0600
     * @tc.name      testStationaryOutcome0105
     * @tc.desc      Verify once with malformed activity "space" only raises documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0105 begin');
      let invalidError: number = 0;
      let validOutcome: number = 0;
      try {
        stationary.once('still ' as stationary.ActivityType, callback);
        validOutcome++;
      } catch (err) {
        if (isAllowedError(err as Object)) {
          validOutcome++;
        } else {
          invalidError++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'valid=' + validOutcome + ' invalid=' + invalidError);
      expect(invalidError).assertEqual(0);
      expect(validOutcome).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0105 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_ONE_0700
     * @tc.name      testStationaryOutcome0106
     * @tc.desc      Verify once with malformed activity "underscore" only raises documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0106 begin');
      let invalidError: number = 0;
      let validOutcome: number = 0;
      try {
        stationary.once('relative_still' as stationary.ActivityType, callback);
        validOutcome++;
      } catch (err) {
        if (isAllowedError(err as Object)) {
          validOutcome++;
        } else {
          invalidError++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'valid=' + validOutcome + ' invalid=' + invalidError);
      expect(invalidError).assertEqual(0);
      expect(validOutcome).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0106 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_ONE_0800
     * @tc.name      testStationaryOutcome0107
     * @tc.desc      Verify once with malformed activity "camel" only raises documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0107 begin');
      let invalidError: number = 0;
      let validOutcome: number = 0;
      try {
        stationary.once('relativeboth' as stationary.ActivityType, callback);
        validOutcome++;
      } catch (err) {
        if (isAllowedError(err as Object)) {
          validOutcome++;
        } else {
          invalidError++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'valid=' + validOutcome + ' invalid=' + invalidError);
      expect(invalidError).assertEqual(0);
      expect(validOutcome).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0107 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_ONE_0900
     * @tc.name      testStationaryOutcome0108
     * @tc.desc      Verify once with malformed activity "num" only raises documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0108 begin');
      let invalidError: number = 0;
      let validOutcome: number = 0;
      try {
        stationary.once('1' as stationary.ActivityType, callback);
        validOutcome++;
      } catch (err) {
        if (isAllowedError(err as Object)) {
          validOutcome++;
        } else {
          invalidError++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'valid=' + validOutcome + ' invalid=' + invalidError);
      expect(invalidError).assertEqual(0);
      expect(validOutcome).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0108 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_OUTCOME_ONE_1000
     * @tc.name      testStationaryOutcome0109
     * @tc.desc      Verify once with malformed activity "null" only raises documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryOutcome0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0109 begin');
      let invalidError: number = 0;
      let validOutcome: number = 0;
      try {
        stationary.once('null' as stationary.ActivityType, callback);
        validOutcome++;
      } catch (err) {
        if (isAllowedError(err as Object)) {
          validOutcome++;
        } else {
          invalidError++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'valid=' + validOutcome + ' invalid=' + invalidError);
      expect(invalidError).assertEqual(0);
      expect(validOutcome).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryOutcome0109 end');
    });



  });
}
