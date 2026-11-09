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

function expectSingleValidOutcome(outcome: CallOutcome): void {
  expect(outcome.invalidError).assertEqual(0);
  expect(outcome.success + outcome.allowedError).assertEqual(1);
}

/**
 * stationary Kit 运行时契约（环境自适应）
 *
 * 设备支持时调用成功；不支持或无权限时按文档抛出 201/801。每个调用都要求
 * “恰好一个合法结果”，非法异常计数必须为 0，避免把任意异常当成通过。
 */
export default function StationaryApiRobustTest() {
  describe('StationaryApiRobustTest', () => {
    /**
     * @tc.number SUB_STATIONARY_ROBUST_0100
     * @tc.name testStationaryRobust0001
     * @tc.desc Verify still ENTER subscribe and unsubscribe yield one valid outcome each
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testStationaryRobust0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expectSingleValidOutcome(run(() =>
        stationary.on('still', stationary.ActivityEvent.ENTER, 1000000000, callback)));
      expectSingleValidOutcome(run(() =>
        stationary.off('still', stationary.ActivityEvent.ENTER, callback)));
    });

    /**
     * @tc.number SUB_STATIONARY_ROBUST_0200
     * @tc.name testStationaryRobust0002
     * @tc.desc Verify still EXIT subscribe and unsubscribe yield one valid outcome each
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryRobust0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expectSingleValidOutcome(run(() =>
        stationary.on('still', stationary.ActivityEvent.EXIT, 1000000000, callback)));
      expectSingleValidOutcome(run(() =>
        stationary.off('still', stationary.ActivityEvent.EXIT, callback)));
    });

    /**
     * @tc.number SUB_STATIONARY_ROBUST_0300
     * @tc.name testStationaryRobust0003
     * @tc.desc Verify still ENTER_EXIT subscribe and unsubscribe yield one valid outcome each
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryRobust0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expectSingleValidOutcome(run(() =>
        stationary.on('still', stationary.ActivityEvent.ENTER_EXIT, 1000000000, callback)));
      expectSingleValidOutcome(run(() =>
        stationary.off('still', stationary.ActivityEvent.ENTER_EXIT, callback)));
    });

    /**
     * @tc.number SUB_STATIONARY_ROBUST_0400
     * @tc.name testStationaryRobust0004
     * @tc.desc Verify relativeStill ENTER subscribe and unsubscribe yield one valid outcome each
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryRobust0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expectSingleValidOutcome(run(() =>
        stationary.on('relativeStill', stationary.ActivityEvent.ENTER, 1000000000, callback)));
      expectSingleValidOutcome(run(() =>
        stationary.off('relativeStill', stationary.ActivityEvent.ENTER, callback)));
    });

    /**
     * @tc.number SUB_STATIONARY_ROBUST_0500
     * @tc.name testStationaryRobust0005
     * @tc.desc Verify relativeStill ENTER_EXIT subscribe and unsubscribe yield one valid outcome each
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryRobust0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expectSingleValidOutcome(run(() =>
        stationary.on('relativeStill', stationary.ActivityEvent.ENTER_EXIT, 1000000000, callback)));
      expectSingleValidOutcome(run(() =>
        stationary.off('relativeStill', stationary.ActivityEvent.ENTER_EXIT, callback)));
    });

    /**
     * @tc.number SUB_STATIONARY_ROBUST_0600
     * @tc.name testStationaryRobust0006
     * @tc.desc Verify cancelling without prior subscription yields one valid outcome per event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryRobust0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expectSingleValidOutcome(run(() =>
        stationary.off('still', stationary.ActivityEvent.ENTER, callback)));
      expectSingleValidOutcome(run(() =>
        stationary.off('still', stationary.ActivityEvent.ENTER_EXIT, callback)));
      expectSingleValidOutcome(run(() =>
        stationary.off('relativeStill', stationary.ActivityEvent.ENTER, callback)));
    });

    /**
     * @tc.number SUB_STATIONARY_ROBUST_0700
     * @tc.name testStationaryRobust0007
     * @tc.desc Verify cancelling with the callback omitted yields one valid outcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryRobust0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expectSingleValidOutcome(run(() =>
        stationary.off('still', stationary.ActivityEvent.ENTER)));
      expectSingleValidOutcome(run(() =>
        stationary.off('relativeStill', stationary.ActivityEvent.ENTER_EXIT)));
    });

    /**
     * @tc.number SUB_STATIONARY_ROBUST_0800
     * @tc.name testStationaryRobust0008
     * @tc.desc Verify a one-shot query for still yields one valid outcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testStationaryRobust0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expectSingleValidOutcome(run(() => stationary.once('still', callback)));
    });

    /**
     * @tc.number SUB_STATIONARY_ROBUST_0900
     * @tc.name testStationaryRobust0009
     * @tc.desc Verify a one-shot query for relativeStill yields one valid outcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryRobust0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expectSingleValidOutcome(run(() => stationary.once('relativeStill', callback)));
    });

    /**
     * @tc.number SUB_STATIONARY_ROBUST_1000
     * @tc.name testStationaryRobust0010
     * @tc.desc Verify three reporting periods are each accepted for subscribe and unsubscribe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryRobust0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const periods: number[] = [1000000000, 2000000000, 3000000000];
      for (const period of periods) {
        expectSingleValidOutcome(run(() =>
          stationary.on('still', stationary.ActivityEvent.ENTER, period, callback)));
        expectSingleValidOutcome(run(() =>
          stationary.off('still', stationary.ActivityEvent.ENTER, callback)));
      }
    });

    /**
     * @tc.number SUB_STATIONARY_ROBUST_1100
     * @tc.name testStationaryRobust0011
     * @tc.desc Verify five repeated one-shot queries never produce an undocumented error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryRobust0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let invalidError: number = 0;
      let valid: number = 0;
      for (let i = 0; i < 5; i++) {
        const outcome: CallOutcome = run(() => stationary.once('still', callback));
        valid += outcome.success + outcome.allowedError;
        invalidError += outcome.invalidError;
      }
      expect(invalidError).assertEqual(0);
      expect(valid).assertEqual(5);
    });
  });
}
