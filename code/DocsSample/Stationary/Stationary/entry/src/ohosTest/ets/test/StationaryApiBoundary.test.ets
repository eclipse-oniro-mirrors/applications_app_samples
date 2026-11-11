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

const TAG: string = '[Sample_StationaryApiBoundaryTest]';
const DOMAIN: number = 0xF812;

const ALLOWED_CODES: number[] = [201, 401, 801];
const LATENCY: number = 1000000000;

const TYPES: string[] = ['still', 'relativeStill'];
const MALFORMED_TYPES: string[] = [
  'Still',
  'RELATIVESTILL',
  'relative_still',
  'relative still',
  'still ',
  ' still',
  'stable',
  'stillness',
  'relative',
  ''
];
const EVENTS: number[] = [1, 2, 3];
const MALFORMED_EVENTS: number[] = [0, 4, -1, 100, Number.NaN, 1.5];
const LATENCIES: number[] = [
  1000000000,
  2000000000,
  3000000000,
  999999999,
  3000000001,
  0,
  1,
  -1,
  1000000000.5
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

function callback(_response: Object): void {
}

function expectDocumentedOutcome(label: string, outcome: CallOutcome): void {
  hilog.info(DOMAIN, TAG, '%{public}s',
    label + ' success=' + outcome.success + ' allowed=' + outcome.allowedError +
    ' invalid=' + outcome.invalidError + ' code=' + outcome.code);
  expect(outcome.invalidError).assertEqual(0);
  expect(outcome.success + outcome.allowedError).assertEqual(1);
}

function onType(eventType: string): CallOutcome {
  return run(() => stationary.on(eventType as string as 'still' | 'relativeStill', 1,
    LATENCY, callback));
}

function totalOf(outcome: CallOutcome): number {
  return outcome.success + outcome.allowedError;
}

function onIndex(eventType: string): number {
  return TYPES.indexOf(eventType);
}

function onceIndex(eventType: string): number {
  return TYPES.indexOf(eventType);
}

function onLatencyTotal(latency: number): number {
  return totalOf(onLatency(latency));
}

function onEventTotal(event: number): number {
  return totalOf(onEvent(event));
}

function offEvent(event: number, withCallback: boolean): CallOutcome {
  if (withCallback) {
    return run(() => stationary.off('still', event as 1, callback));
  }
  return run(() => stationary.off('still', event as 1));
}

function onceType(eventType: string): CallOutcome {
  return run(() => stationary.once(eventType as string as 'still' | 'relativeStill', callback));
}

function onEvent(event: number): CallOutcome {
  return run(() => stationary.on('still', event as 1, LATENCY, callback));
}

function onLatency(latency: number): CallOutcome {
  return run(() => stationary.on('still', 1, latency, callback));
}

/**
 * stationary API 入参边界（环境自适应）。
 *
 * 文档合法入参只允许成功或 201/401/801；非法入参（错误 eventType 字面量、越界 event、
 * 超出 1e9~3e9 的 reportLatencyNs）同样只允许这两种终态，非文档错误码计非法。
 */
export default function StationaryApiBoundaryTest(): void {
  describe('StationaryApiBoundaryTest', () => {

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_0100
     * @tc.name      testStationaryBoundary0001
     * @tc.desc      Verify on accepts documented type "still"
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0001 begin');
      expectDocumentedOutcome('on still',
        onType('still'));
      expect(onIndex('still')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0001 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_0200
     * @tc.name      testStationaryBoundary0002
     * @tc.desc      Verify once accepts documented type "still"
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryBoundary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0002 begin');
      expectDocumentedOutcome('once still',
        onceType('still'));
      expect(onceIndex('still')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0002 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_0300
     * @tc.name      testStationaryBoundary0003
     * @tc.desc      Verify on accepts documented type "relativeStill"
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryBoundary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0003 begin');
      expectDocumentedOutcome('on relativeStill',
        onType('relativeStill'));
      expect(onIndex('relativeStill')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0003 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_0400
     * @tc.name      testStationaryBoundary0004
     * @tc.desc      Verify once accepts documented type "relativeStill"
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryBoundary0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0004 begin');
      expectDocumentedOutcome('once relativeStill',
        onceType('relativeStill'));
      expect(onceIndex('relativeStill')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0004 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_0500
     * @tc.name      testStationaryBoundary0005
     * @tc.desc      Verify on rejects malformed type "Still" with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0005 begin');
      expectDocumentedOutcome('on Still',
        onType('Still'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0005 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_0600
     * @tc.name      testStationaryBoundary0006
     * @tc.desc      Verify once rejects malformed type "Still" with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0006 begin');
      expectDocumentedOutcome('once Still',
        onceType('Still'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0006 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_0700
     * @tc.name      testStationaryBoundary0007
     * @tc.desc      Verify on rejects malformed type "RELATIVESTILL" with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0007 begin');
      expectDocumentedOutcome('on RELATIVESTILL',
        onType('RELATIVESTILL'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0007 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_0800
     * @tc.name      testStationaryBoundary0008
     * @tc.desc      Verify once rejects malformed type "RELATIVESTILL" with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0008 begin');
      expectDocumentedOutcome('once RELATIVESTILL',
        onceType('RELATIVESTILL'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0008 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_0900
     * @tc.name      testStationaryBoundary0009
     * @tc.desc      Verify on rejects malformed type "relative_still" with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0009 begin');
      expectDocumentedOutcome('on relative_still',
        onType('relative_still'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0009 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_1000
     * @tc.name      testStationaryBoundary0010
     * @tc.desc      Verify once rejects malformed type "relative_still" with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0010 begin');
      expectDocumentedOutcome('once relative_still',
        onceType('relative_still'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0010 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_1100
     * @tc.name      testStationaryBoundary0011
     * @tc.desc      Verify on rejects malformed type "relative still" with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0011 begin');
      expectDocumentedOutcome('on relative still',
        onType('relative still'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0011 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_1200
     * @tc.name      testStationaryBoundary0012
     * @tc.desc      Verify once rejects malformed type "relative still" with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0012 begin');
      expectDocumentedOutcome('once relative still',
        onceType('relative still'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0012 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_1300
     * @tc.name      testStationaryBoundary0013
     * @tc.desc      Verify on rejects malformed type "still " with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0013 begin');
      expectDocumentedOutcome('on still ',
        onType('still '));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0013 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_1400
     * @tc.name      testStationaryBoundary0014
     * @tc.desc      Verify once rejects malformed type "still " with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0014 begin');
      expectDocumentedOutcome('once still ',
        onceType('still '));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0014 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_1500
     * @tc.name      testStationaryBoundary0015
     * @tc.desc      Verify on rejects malformed type " still" with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0015 begin');
      expectDocumentedOutcome('on  still',
        onType(' still'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0015 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_1600
     * @tc.name      testStationaryBoundary0016
     * @tc.desc      Verify once rejects malformed type " still" with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0016 begin');
      expectDocumentedOutcome('once  still',
        onceType(' still'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0016 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_1700
     * @tc.name      testStationaryBoundary0017
     * @tc.desc      Verify on rejects malformed type "stable" with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0017 begin');
      expectDocumentedOutcome('on stable',
        onType('stable'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0017 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_1800
     * @tc.name      testStationaryBoundary0018
     * @tc.desc      Verify once rejects malformed type "stable" with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0018 begin');
      expectDocumentedOutcome('once stable',
        onceType('stable'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0018 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_1900
     * @tc.name      testStationaryBoundary0019
     * @tc.desc      Verify on rejects malformed type "stillness" with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0019 begin');
      expectDocumentedOutcome('on stillness',
        onType('stillness'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0019 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_2000
     * @tc.name      testStationaryBoundary0020
     * @tc.desc      Verify once rejects malformed type "stillness" with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0020 begin');
      expectDocumentedOutcome('once stillness',
        onceType('stillness'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0020 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_2100
     * @tc.name      testStationaryBoundary0021
     * @tc.desc      Verify on rejects malformed type "relative" with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0021 begin');
      expectDocumentedOutcome('on relative',
        onType('relative'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0021 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_2200
     * @tc.name      testStationaryBoundary0022
     * @tc.desc      Verify once rejects malformed type "relative" with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0022 begin');
      expectDocumentedOutcome('once relative',
        onceType('relative'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0022 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_2300
     * @tc.name      testStationaryBoundary0023
     * @tc.desc      Verify on rejects malformed type "<empty>" with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0023 begin');
      expectDocumentedOutcome('on <empty>',
        onType(''));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0023 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_2400
     * @tc.name      testStationaryBoundary0024
     * @tc.desc      Verify once rejects malformed type "<empty>" with documented error
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0024 begin');
      expectDocumentedOutcome('once <empty>',
        onceType(''));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0024 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_2500
     * @tc.name      testStationaryBoundary0025
     * @tc.desc      Verify documented Event value 1 is accepted by on
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryBoundary0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0025 begin');
      expectDocumentedOutcome('event 1', onEvent(1));
      expect(onEventTotal(1)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0025 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_2600
     * @tc.name      testStationaryBoundary0026
     * @tc.desc      Verify documented Event value 2 is accepted by on
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryBoundary0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0026 begin');
      expectDocumentedOutcome('event 2', onEvent(2));
      expect(onEventTotal(2)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0026 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_2700
     * @tc.name      testStationaryBoundary0027
     * @tc.desc      Verify documented Event value 3 is accepted by on
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL0
     */
    it('testStationaryBoundary0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0027 begin');
      expectDocumentedOutcome('event 3', onEvent(3));
      expect(onEventTotal(3)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0027 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_2800
     * @tc.name      testStationaryBoundary0028
     * @tc.desc      Verify on with out-of-range event 0 yields documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0028 begin');
      const outcome: CallOutcome = run(() => stationary.on('still', 0 as 1,
        LATENCY, callback));
      expectDocumentedOutcome('on 0', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0028 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_2900
     * @tc.name      testStationaryBoundary0029
     * @tc.desc      Verify off with out-of-range event 0 yields documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0029 begin');
      const outcome: CallOutcome = run(() => stationary.off('still', 0 as 1,
        callback));
      expectDocumentedOutcome('off 0', outcome);
      expect(totalOf(offEvent(0, true))).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0029 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_3000
     * @tc.name      testStationaryBoundary0030
     * @tc.desc      Verify on with out-of-range event 4 yields documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0030 begin');
      const outcome: CallOutcome = run(() => stationary.on('still', 4 as 1,
        LATENCY, callback));
      expectDocumentedOutcome('on 4', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0030 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_3100
     * @tc.name      testStationaryBoundary0031
     * @tc.desc      Verify off with out-of-range event 4 yields documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0031 begin');
      const outcome: CallOutcome = run(() => stationary.off('still', 4 as 1,
        callback));
      expectDocumentedOutcome('off 4', outcome);
      expect(totalOf(offEvent(4, true))).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0031 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_3200
     * @tc.name      testStationaryBoundary0032
     * @tc.desc      Verify on with out-of-range event -1 yields documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0032 begin');
      const outcome: CallOutcome = run(() => stationary.on('still', -1 as 1,
        LATENCY, callback));
      expectDocumentedOutcome('on -1', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0032 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_3300
     * @tc.name      testStationaryBoundary0033
     * @tc.desc      Verify off with out-of-range event -1 yields documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0033 begin');
      const outcome: CallOutcome = run(() => stationary.off('still', -1 as 1,
        callback));
      expectDocumentedOutcome('off -1', outcome);
      expect(totalOf(offEvent(-1, true))).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0033 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_3400
     * @tc.name      testStationaryBoundary0034
     * @tc.desc      Verify on with out-of-range event 100 yields documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0034 begin');
      const outcome: CallOutcome = run(() => stationary.on('still', 100 as 1,
        LATENCY, callback));
      expectDocumentedOutcome('on 100', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0034 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_3500
     * @tc.name      testStationaryBoundary0035
     * @tc.desc      Verify off with out-of-range event 100 yields documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0035 begin');
      const outcome: CallOutcome = run(() => stationary.off('still', 100 as 1,
        callback));
      expectDocumentedOutcome('off 100', outcome);
      expect(totalOf(offEvent(100, true))).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0035 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_3600
     * @tc.name      testStationaryBoundary0036
     * @tc.desc      Verify on with out-of-range event NaN yields documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0036 begin');
      const outcome: CallOutcome = run(() => stationary.on('still', NaN as 1,
        LATENCY, callback));
      expectDocumentedOutcome('on NaN', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0036 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_3700
     * @tc.name      testStationaryBoundary0037
     * @tc.desc      Verify off with out-of-range event NaN yields documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0037 begin');
      const outcome: CallOutcome = run(() => stationary.off('still', NaN as 1,
        callback));
      expectDocumentedOutcome('off NaN', outcome);
      expect(totalOf(offEvent(Number.NaN, true))).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0037 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_3800
     * @tc.name      testStationaryBoundary0038
     * @tc.desc      Verify on with out-of-range event 1.5 yields documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0038 begin');
      const outcome: CallOutcome = run(() => stationary.on('still', 1.5 as 1,
        LATENCY, callback));
      expectDocumentedOutcome('on 1.5', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0038 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_3900
     * @tc.name      testStationaryBoundary0039
     * @tc.desc      Verify off with out-of-range event 1.5 yields documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0039 begin');
      const outcome: CallOutcome = run(() => stationary.off('still', 1.5 as 1,
        callback));
      expectDocumentedOutcome('off 1.5', outcome);
      expect(totalOf(offEvent(1.5, true))).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0039 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_4000
     * @tc.name      testStationaryBoundary0040
     * @tc.desc      Verify reportLatencyNs 1000000000 yields documented outcome (variant 0)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryBoundary0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0040 begin');
      const outcome: CallOutcome = onLatency(1000000000);
      expectDocumentedOutcome('latency 1000000000', outcome);
      expect(onLatencyTotal(1000000000)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0040 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_4100
     * @tc.name      testStationaryBoundary0041
     * @tc.desc      Verify reportLatencyNs 1000000000 yields documented outcome (variant 1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0041 begin');
      const outcome: CallOutcome = onLatency(1000000000);
      expectDocumentedOutcome('latency 1000000000', outcome);
      expect(onLatencyTotal(1000000000)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0041 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_4200
     * @tc.name      testStationaryBoundary0042
     * @tc.desc      Verify reportLatencyNs 1000000000 yields documented outcome (variant 2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0042 begin');
      const outcome: CallOutcome = onLatency(1000000000);
      expectDocumentedOutcome('latency 1000000000', outcome);
      expect(onLatencyTotal(1000000000)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0042 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_4300
     * @tc.name      testStationaryBoundary0043
     * @tc.desc      Verify reportLatencyNs 2000000000 yields documented outcome (variant 0)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryBoundary0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0043 begin');
      const outcome: CallOutcome = onLatency(2000000000);
      expectDocumentedOutcome('latency 2000000000', outcome);
      expect(onLatencyTotal(2000000000)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0043 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_4400
     * @tc.name      testStationaryBoundary0044
     * @tc.desc      Verify reportLatencyNs 2000000000 yields documented outcome (variant 1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0044 begin');
      const outcome: CallOutcome = onLatency(2000000000);
      expectDocumentedOutcome('latency 2000000000', outcome);
      expect(onLatencyTotal(2000000000)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0044 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_4500
     * @tc.name      testStationaryBoundary0045
     * @tc.desc      Verify reportLatencyNs 2000000000 yields documented outcome (variant 2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0045 begin');
      const outcome: CallOutcome = onLatency(2000000000);
      expectDocumentedOutcome('latency 2000000000', outcome);
      expect(onLatencyTotal(2000000000)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0045 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_4600
     * @tc.name      testStationaryBoundary0046
     * @tc.desc      Verify reportLatencyNs 3000000000 yields documented outcome (variant 0)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryBoundary0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0046 begin');
      const outcome: CallOutcome = onLatency(3000000000);
      expectDocumentedOutcome('latency 3000000000', outcome);
      expect(onLatencyTotal(3000000000)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0046 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_4700
     * @tc.name      testStationaryBoundary0047
     * @tc.desc      Verify reportLatencyNs 3000000000 yields documented outcome (variant 1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0047 begin');
      const outcome: CallOutcome = onLatency(3000000000);
      expectDocumentedOutcome('latency 3000000000', outcome);
      expect(onLatencyTotal(3000000000)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0047 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_4800
     * @tc.name      testStationaryBoundary0048
     * @tc.desc      Verify reportLatencyNs 3000000000 yields documented outcome (variant 2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0048 begin');
      const outcome: CallOutcome = onLatency(3000000000);
      expectDocumentedOutcome('latency 3000000000', outcome);
      expect(onLatencyTotal(3000000000)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0048 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_4900
     * @tc.name      testStationaryBoundary0049
     * @tc.desc      Verify reportLatencyNs 999999999 yields documented outcome (variant 0)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryBoundary0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0049 begin');
      const outcome: CallOutcome = onLatency(999999999);
      expectDocumentedOutcome('latency 999999999', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0049 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_5000
     * @tc.name      testStationaryBoundary0050
     * @tc.desc      Verify reportLatencyNs 999999999 yields documented outcome (variant 1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0050 begin');
      const outcome: CallOutcome = onLatency(999999999);
      expectDocumentedOutcome('latency 999999999', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0050 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_5100
     * @tc.name      testStationaryBoundary0051
     * @tc.desc      Verify reportLatencyNs 999999999 yields documented outcome (variant 2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0051 begin');
      const outcome: CallOutcome = onLatency(999999999);
      expectDocumentedOutcome('latency 999999999', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0051 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_5200
     * @tc.name      testStationaryBoundary0052
     * @tc.desc      Verify reportLatencyNs 3000000001 yields documented outcome (variant 0)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryBoundary0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0052 begin');
      const outcome: CallOutcome = onLatency(3000000001);
      expectDocumentedOutcome('latency 3000000001', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0052 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_5300
     * @tc.name      testStationaryBoundary0053
     * @tc.desc      Verify reportLatencyNs 3000000001 yields documented outcome (variant 1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0053 begin');
      const outcome: CallOutcome = onLatency(3000000001);
      expectDocumentedOutcome('latency 3000000001', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0053 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_5400
     * @tc.name      testStationaryBoundary0054
     * @tc.desc      Verify reportLatencyNs 3000000001 yields documented outcome (variant 2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0054 begin');
      const outcome: CallOutcome = onLatency(3000000001);
      expectDocumentedOutcome('latency 3000000001', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0054 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_5500
     * @tc.name      testStationaryBoundary0055
     * @tc.desc      Verify reportLatencyNs 0 yields documented outcome (variant 0)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryBoundary0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0055 begin');
      const outcome: CallOutcome = onLatency(0);
      expectDocumentedOutcome('latency 0', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0055 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_5600
     * @tc.name      testStationaryBoundary0056
     * @tc.desc      Verify reportLatencyNs 0 yields documented outcome (variant 1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0056 begin');
      const outcome: CallOutcome = onLatency(0);
      expectDocumentedOutcome('latency 0', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0056 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_5700
     * @tc.name      testStationaryBoundary0057
     * @tc.desc      Verify reportLatencyNs 0 yields documented outcome (variant 2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0057 begin');
      const outcome: CallOutcome = onLatency(0);
      expectDocumentedOutcome('latency 0', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0057 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_5800
     * @tc.name      testStationaryBoundary0058
     * @tc.desc      Verify reportLatencyNs 1 yields documented outcome (variant 0)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryBoundary0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0058 begin');
      const outcome: CallOutcome = onLatency(1);
      expectDocumentedOutcome('latency 1', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0058 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_5900
     * @tc.name      testStationaryBoundary0059
     * @tc.desc      Verify reportLatencyNs 1 yields documented outcome (variant 1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0059 begin');
      const outcome: CallOutcome = onLatency(1);
      expectDocumentedOutcome('latency 1', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0059 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_6000
     * @tc.name      testStationaryBoundary0060
     * @tc.desc      Verify reportLatencyNs 1 yields documented outcome (variant 2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0060 begin');
      const outcome: CallOutcome = onLatency(1);
      expectDocumentedOutcome('latency 1', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0060 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_6100
     * @tc.name      testStationaryBoundary0061
     * @tc.desc      Verify reportLatencyNs -1 yields documented outcome (variant 0)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryBoundary0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0061 begin');
      const outcome: CallOutcome = onLatency(-1);
      expectDocumentedOutcome('latency -1', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0061 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_6200
     * @tc.name      testStationaryBoundary0062
     * @tc.desc      Verify reportLatencyNs -1 yields documented outcome (variant 1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0062 begin');
      const outcome: CallOutcome = onLatency(-1);
      expectDocumentedOutcome('latency -1', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0062 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_6300
     * @tc.name      testStationaryBoundary0063
     * @tc.desc      Verify reportLatencyNs -1 yields documented outcome (variant 2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0063 begin');
      const outcome: CallOutcome = onLatency(-1);
      expectDocumentedOutcome('latency -1', outcome);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0063 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_6400
     * @tc.name      testStationaryBoundary0064
     * @tc.desc      Verify reportLatencyNs 1000000000.5 yields documented outcome (variant 0)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryBoundary0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0064 begin');
      const outcome: CallOutcome = onLatency(1000000000.5);
      expectDocumentedOutcome('latency 1000000000.5', outcome);
      expect(onLatencyTotal(1000000000.5)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0064 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_6500
     * @tc.name      testStationaryBoundary0065
     * @tc.desc      Verify reportLatencyNs 1000000000.5 yields documented outcome (variant 1)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0065 begin');
      const outcome: CallOutcome = onLatency(1000000000.5);
      expectDocumentedOutcome('latency 1000000000.5', outcome);
      expect(onLatencyTotal(1000000000.5)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0065 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_6600
     * @tc.name      testStationaryBoundary0066
     * @tc.desc      Verify reportLatencyNs 1000000000.5 yields documented outcome (variant 2)
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0066 begin');
      const outcome: CallOutcome = onLatency(1000000000.5);
      expectDocumentedOutcome('latency 1000000000.5', outcome);
      expect(onLatencyTotal(1000000000.5)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0066 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_6700
     * @tc.name      testStationaryBoundary0067
     * @tc.desc      Verify off with callback for event 1 yields documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryBoundary0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0067 begin');
      expectDocumentedOutcome('off cb 1',
        run(() => stationary.off('still', 1 as 1, callback)));
      expect(totalOf(offEvent(1, true))).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0067 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_6800
     * @tc.name      testStationaryBoundary0068
     * @tc.desc      Verify off without callback for event 1 yields documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryBoundary0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0068 begin');
      expectDocumentedOutcome('off all 1',
        run(() => stationary.off('still', 1 as 1)));
      expect(totalOf(offEvent(1, false))).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0068 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_6900
     * @tc.name      testStationaryBoundary0069
     * @tc.desc      Verify off with callback for event 2 yields documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryBoundary0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0069 begin');
      expectDocumentedOutcome('off cb 2',
        run(() => stationary.off('still', 2 as 1, callback)));
      expect(totalOf(offEvent(2, true))).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0069 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_7000
     * @tc.name      testStationaryBoundary0070
     * @tc.desc      Verify off without callback for event 2 yields documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryBoundary0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0070 begin');
      expectDocumentedOutcome('off all 2',
        run(() => stationary.off('still', 2 as 1)));
      expect(totalOf(offEvent(2, false))).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0070 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_7100
     * @tc.name      testStationaryBoundary0071
     * @tc.desc      Verify off with callback for event 3 yields documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryBoundary0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0071 begin');
      expectDocumentedOutcome('off cb 3',
        run(() => stationary.off('still', 3 as 1, callback)));
      expect(totalOf(offEvent(3, true))).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0071 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_7200
     * @tc.name      testStationaryBoundary0072
     * @tc.desc      Verify off without callback for event 3 yields documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL1
     */
    it('testStationaryBoundary0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0072 begin');
      expectDocumentedOutcome('off all 3',
        run(() => stationary.off('still', 3 as 1)));
      expect(totalOf(offEvent(3, false))).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0072 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_7300
     * @tc.name      testStationaryBoundary0073
     * @tc.desc      Verify off relative to eventType "still" keeps documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0073 begin');
      expectDocumentedOutcome('off still',
        run(() => stationary.off('still' as string as 'still' | 'relativeStill',
          1, callback)));
      expect(totalOf(run(() => stationary.off('still', 1, callback)))).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0073 end');
    });

    /**
     * @tc.number    SUB_STATIONARY_BOUNDARY_7400
     * @tc.name      testStationaryBoundary0074
     * @tc.desc      Verify off relative to eventType "relativeStill" keeps documented outcome
     * @tc.type      Function
     * @tc.size      SmallTest
     * @tc.level     LEVEL2
     */
    it('testStationaryBoundary0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0074 begin');
      expectDocumentedOutcome('off relativeStill',
        run(() => stationary.off('relativeStill' as string as 'still' | 'relativeStill',
          1, callback)));
      expect(totalOf(run(() => stationary.off('relativeStill', 1,
        callback)))).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStationaryBoundary0074 end');
    });

  });
}
