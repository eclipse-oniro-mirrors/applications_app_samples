/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver, Component } from '@ohos.UiTest';
import {
  getDriver,
  ensureIndexPageInitial,
  launchEntryAbility,
  waitForIndexPageStable,
  isIndexPageVisible,
  pageComponentCount,
  checkTextContent,
  checkComponentExistsByKey,
  findComponentsByText,
  findComponentsByType,
  measureElapsed,
  isWithinBudget,
  logInfo,
  logError,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_TEXT_APPEAR,
  TIMEOUT_ABILITY_LAUNCH,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  ENV_CALLBACK_EVENT
} from '../Shared/SharedDriver';

enum ErrorClass {
  PARAM = 'param',
  STATE = 'state',
  TIMEOUT = 'timeout'
}

class ParameterError extends Error {
  public code: number = 401;

  constructor(message: string) {
    super(message);
    this.name = 'ParameterError';
  }
}

class LifecycleStateError extends Error {
  public code: number = 409;

  constructor(message: string) {
    super(message);
    this.name = 'LifecycleStateError';
  }
}

class OperationTimeoutError extends Error {
  public code: number = 408;

  constructor(message: string) {
    super(message);
    this.name = 'OperationTimeoutError';
  }
}

interface BoundedStringSpec {
  key: string;
  minLength: number;
  maxLength: number;
}

interface BoundedArraySpec {
  key: string;
  maxLength: number;
}

class BoundaryCatalog {
  public static readonly MAX_STRING_LENGTH: number = 1024;

  public static readonly MAX_SAFE_INTEGER: number = 9007199254740991;

  public static readonly TWO_POW_53: number = 9007199254740992;

  public static readonly MIN_SAFE_INTEGER: number = -9007199254740991;

  public static readonly EVENT_KEY_SPEC: BoundedStringSpec = {
    key: ENV_CALLBACK_EVENT, minLength: 1, maxLength: 64
  };

  public static readonly COMPONENT_TYPE_SPEC: BoundedStringSpec = {
    key: 'Text', minLength: 1, maxLength: 64
  };

  public static readonly SUBSCRIBER_SPEC: BoundedArraySpec = {
    key: 'subscribers', maxLength: 256
  };

  public classify(errorName: string): ErrorClass {
    if (errorName === 'ParameterError') {
      return ErrorClass.PARAM;
    }
    if (errorName === 'LifecycleStateError') {
      return ErrorClass.STATE;
    }
    if (errorName === 'OperationTimeoutError') {
      return ErrorClass.TIMEOUT;
    }
    throw new ParameterError(`unknown error name ${errorName}`);
  }

  public checkStringBound(value: string, spec: BoundedStringSpec): void {
    if (value.length < spec.minLength) {
      throw new ParameterError(`${spec.key} shorter than ${spec.minLength}`);
    }
    if (value.length > spec.maxLength) {
      throw new ParameterError(`${spec.key} longer than ${spec.maxLength}`);
    }
  }

  public checkArrayBound(size: number, spec: BoundedArraySpec): void {
    if (size < 0) {
      throw new ParameterError(`${spec.key} size must not be negative`);
    }
    if (size > spec.maxLength) {
      throw new ParameterError(`${spec.key} size ${size} exceeds ${spec.maxLength}`);
    }
  }

  public checkIntSafe(value: number): void {
    if (isNaN(value)) {
      throw new ParameterError('value must not be NaN');
    }
    if (!isFinite(value)) {
      throw new ParameterError('value must be finite');
    }
    if (Math.floor(value) !== value) {
      throw new ParameterError(`value ${value} is not an integer`);
    }
    if (value > BoundaryCatalog.MAX_SAFE_INTEGER || value < BoundaryCatalog.MIN_SAFE_INTEGER) {
      throw new ParameterError(`value ${value} exceeds safe integer range`);
    }
  }

  public isSafeIntegerValue(value: number): boolean {
    if (isNaN(value) || !isFinite(value)) {
      return false;
    }
    if (Math.floor(value) !== value) {
      return false;
    }
    return value <= BoundaryCatalog.MAX_SAFE_INTEGER && value >= BoundaryCatalog.MIN_SAFE_INTEGER;
  }

  public repeatChar(char: string, times: number): string {
    if (times < 0) {
      throw new ParameterError('repeat count must not be negative');
    }
    let result: string = '';
    for (let i = 0; i < times; i++) {
      result += char;
    }
    return result;
  }
}

class LifecycleGate {
  private state: string = 'CREATED';

  public getState(): string {
    return this.state;
  }

  public advanceTo(target: string): void {
    const allowed: string[] = this.allowedTargets();
    let permitted: boolean = false;
    for (let i = 0; i < allowed.length; i++) {
      if (allowed[i] === target) {
        permitted = true;
      }
    }
    if (!permitted) {
      throw new LifecycleStateError(`cannot move from ${this.state} to ${target}`);
    }
    this.state = target;
  }

  private allowedTargets(): string[] {
    if (this.state === 'CREATED') {
      return ['ACTIVE'];
    }
    if (this.state === 'ACTIVE') {
      return ['FOREGROUND', 'DESTROYED'];
    }
    if (this.state === 'FOREGROUND') {
      return ['BACKGROUND', 'DESTROYED'];
    }
    if (this.state === 'BACKGROUND') {
      return ['FOREGROUND', 'DESTROYED'];
    }
    return [];
  }

  public isTerminal(): boolean {
    return this.state === 'DESTROYED';
  }
}

class DeadlineTracker {
  private budgetMs: number = 0;
  private waiting: boolean = false;

  constructor(budgetMs: number) {
    if (budgetMs <= 0) {
      throw new ParameterError('budget must be positive');
    }
    this.budgetMs = budgetMs;
  }

  public start(): void {
    if (this.waiting) {
      throw new LifecycleStateError('deadline already started');
    }
    this.waiting = true;
  }

  public check(elapsedMs: number): void {
    if (!this.waiting) {
      throw new LifecycleStateError('deadline not started');
    }
    if (elapsedMs < 0) {
      throw new ParameterError('elapsed must not be negative');
    }
    if (elapsedMs > this.budgetMs) {
      throw new OperationTimeoutError(`elapsed ${elapsedMs} exceeds budget ${this.budgetMs}`);
    }
  }

  public finish(): void {
    if (!this.waiting) {
      throw new LifecycleStateError('deadline not started');
    }
    this.waiting = false;
  }

  public isWithin(elapsedMs: number): boolean {
    return elapsedMs <= this.budgetMs;
  }

  public getBudget(): number {
    return this.budgetMs;
  }
}

export default function boundaryErrorTestingTest(): void {
  describe('BoundaryErrorTestingTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      logInfo('BoundaryErrorTestingTest: beforeAll start');
      await launchEntryAbility();
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      await ensureIndexPageInitial(driver);
      logInfo('BoundaryErrorTestingTest: beforeAll finished');
    })

    afterAll(async () => {
      logInfo('BoundaryErrorTestingTest: afterAll start');
      await driver.delayMs(200);
      logInfo('BoundaryErrorTestingTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_0100
     * @tc.name testIntegerZeroBoundary
     * @tc.desc Verify zero is classified as a safe integer by the numeric boundary gate and passes validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIntegerZeroBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        expect(catalog.isSafeIntegerValue(0)).assertTrue();
        catalog.checkIntSafe(0);
        expect(isFinite(0)).assertTrue();
        expect(isNaN(0)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_0200
     * @tc.name testIntegerPlusMinusOne
     * @tc.desc Verify plus and minus one both pass the safe integer gate with distinct sign values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIntegerPlusMinusOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        catalog.checkIntSafe(1);
        catalog.checkIntSafe(-1);
        expect(catalog.isSafeIntegerValue(1)).assertTrue();
        expect(catalog.isSafeIntegerValue(-1)).assertTrue();
        expect(1 + (-1)).assertEqual(0);
        expect(-1 < 0).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_0300
     * @tc.name testMaxSafeIntegerAccepted
     * @tc.desc Verify Number.MAX_SAFE_INTEGER is accepted while MAX_SAFE_INTEGER plus one is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMaxSafeIntegerAccepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        expect(catalog.isSafeIntegerValue(BoundaryCatalog.MAX_SAFE_INTEGER)).assertTrue();
        catalog.checkIntSafe(BoundaryCatalog.MAX_SAFE_INTEGER);
        expect(catalog.isSafeIntegerValue(BoundaryCatalog.MAX_SAFE_INTEGER + 1)).assertFalse();
        try {
          catalog.checkIntSafe(BoundaryCatalog.MAX_SAFE_INTEGER + 1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ParameterError');
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_0400
     * @tc.name testMinSafeIntegerAccepted
     * @tc.desc Verify MIN_SAFE_INTEGER is accepted while MIN_SAFE_INTEGER minus one is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMinSafeIntegerAccepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        expect(catalog.isSafeIntegerValue(BoundaryCatalog.MIN_SAFE_INTEGER)).assertTrue();
        catalog.checkIntSafe(BoundaryCatalog.MIN_SAFE_INTEGER);
        expect(catalog.isSafeIntegerValue(BoundaryCatalog.MIN_SAFE_INTEGER - 1)).assertFalse();
        try {
          catalog.checkIntSafe(BoundaryCatalog.MIN_SAFE_INTEGER - 1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ParameterError');
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_0500
     * @tc.name testTwoPow53Boundary
     * @tc.desc Verify 2^53 is outside the safe integer range for the classifier while 2^53 minus one is safe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTwoPow53Boundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        expect(BoundaryCatalog.TWO_POW_53).assertEqual(BoundaryCatalog.MAX_SAFE_INTEGER + 1);
        expect(catalog.isSafeIntegerValue(BoundaryCatalog.TWO_POW_53)).assertFalse();
        expect(catalog.isSafeIntegerValue(BoundaryCatalog.TWO_POW_53 - 1)).assertTrue();
        expect(catalog.isSafeIntegerValue(-BoundaryCatalog.TWO_POW_53)).assertFalse();
        expect(catalog.isSafeIntegerValue(-(BoundaryCatalog.TWO_POW_53 - 1))).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_0600
     * @tc.name testDoublePrecisionLossAboveTwoPow53
     * @tc.desc Verify 2^53 and 2^53 plus one collapse to the same value under double precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDoublePrecisionLossAboveTwoPow53', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const inflated: number = BoundaryCatalog.TWO_POW_53 + 1;
        expect(inflated).assertEqual(BoundaryCatalog.TWO_POW_53);
        expect(BoundaryCatalog.MAX_SAFE_INTEGER + 1).assertEqual(BoundaryCatalog.TWO_POW_53);
        const exact: number = BoundaryCatalog.TWO_POW_53 - 1;
        expect(exact).assertEqual(BoundaryCatalog.MAX_SAFE_INTEGER);
        expect(exact + 1).assertEqual(BoundaryCatalog.TWO_POW_53);
        expect(exact + 2).assertEqual(BoundaryCatalog.TWO_POW_53);
        expect(isFinite(inflated)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_0700
     * @tc.name testSmallestPositiveValue
     * @tc.desc Verify the smallest positive double is greater than zero and still finite
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSmallestPositiveValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        const smallest: number = 5e-324;
        expect(smallest > 0).assertTrue();
        expect(isFinite(smallest)).assertTrue();
        expect(smallest / 2).assertEqual(0);
        expect(catalog.isSafeIntegerValue(smallest)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_0800
     * @tc.name testNonIntegerRejected
     * @tc.desc Verify a fractional value fails the integer gate with ParameterError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNonIntegerRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        expect(catalog.isSafeIntegerValue(1.5)).assertFalse();
        try {
          catalog.checkIntSafe(1.5);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ParameterError');
        }
        expect(catalog.isSafeIntegerValue(-0.5)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_0900
     * @tc.name testNaNRejectedByNumericGate
     * @tc.desc Verify NaN and non finite values are rejected by both the classifier and the checker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNaNRejectedByNumericGate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        const notANumber: number = Number.NaN;
        expect(isNaN(notANumber)).assertTrue();
        expect(catalog.isSafeIntegerValue(notANumber)).assertFalse();
        try {
          catalog.checkIntSafe(notANumber);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ParameterError');
        }
        const infinite: number = Number.POSITIVE_INFINITY;
        expect(isFinite(infinite)).assertFalse();
        expect(catalog.isSafeIntegerValue(infinite)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_1000
     * @tc.name testEmptyStringRejected
     * @tc.desc Verify an empty string fails the minimum length gate while a single char passes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEmptyStringRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        expect(BoundaryCatalog.EVENT_KEY_SPEC.key).assertEqual(ENV_CALLBACK_EVENT);
        try {
          catalog.checkStringBound('', BoundaryCatalog.EVENT_KEY_SPEC);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ParameterError');
        }
        catalog.checkStringBound('e', BoundaryCatalog.EVENT_KEY_SPEC);
        expect(BoundaryCatalog.EVENT_KEY_SPEC.key.length).assertEqual(11);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_1100
     * @tc.name testSingleCharacterStringAccepted
     * @tc.desc Verify a one character string satisfies both the minimum and maximum bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSingleCharacterStringAccepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        const single: string = catalog.repeatChar('x', 1);
        expect(single.length).assertEqual(1);
        expect(single).assertEqual('x');
        catalog.checkStringBound(single, BoundaryCatalog.COMPONENT_TYPE_SPEC);
        expect(single.length >= BoundaryCatalog.COMPONENT_TYPE_SPEC.minLength).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_1200
     * @tc.name testStringLength1024Accepted
     * @tc.desc Verify a 1024 character string is accepted at the upper bound and 1025 is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringLength1024Accepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        const spec: BoundedStringSpec = { key: 'longText', minLength: 1, maxLength: BoundaryCatalog.MAX_STRING_LENGTH };
        const atLimit: string = catalog.repeatChar('a', BoundaryCatalog.MAX_STRING_LENGTH);
        expect(atLimit.length).assertEqual(1024);
        catalog.checkStringBound(atLimit, spec);
        const overLimit: string = catalog.repeatChar('a', BoundaryCatalog.MAX_STRING_LENGTH + 1);
        expect(overLimit.length).assertEqual(1025);
        try {
          catalog.checkStringBound(overLimit, spec);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ParameterError');
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_1300
     * @tc.name testNegativeRepeatCountRejected
     * @tc.desc Verify a negative repeat count raises ParameterError and zero repeat yields the empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNegativeRepeatCountRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        expect(catalog.repeatChar('a', 0)).assertEqual('');
        try {
          catalog.repeatChar('a', -1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ParameterError');
        }
        expect(catalog.repeatChar('a', 3)).assertEqual('aaa');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_1400
     * @tc.name testEmptyArrayBoundAccepted
     * @tc.desc Verify an empty subscriber list is allowed while a negative size is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEmptyArrayBoundAccepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        catalog.checkArrayBound(0, BoundaryCatalog.SUBSCRIBER_SPEC);
        expect(BoundaryCatalog.SUBSCRIBER_SPEC.maxLength).assertEqual(256);
        try {
          catalog.checkArrayBound(-1, BoundaryCatalog.SUBSCRIBER_SPEC);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ParameterError');
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_1500
     * @tc.name testSingleElementArrayBound
     * @tc.desc Verify a one element subscriber array is accepted and its size is reported exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSingleElementArrayBound', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        const subscribers: number[] = [7];
        expect(subscribers.length).assertEqual(1);
        catalog.checkArrayBound(subscribers.length, BoundaryCatalog.SUBSCRIBER_SPEC);
        expect(subscribers[0]).assertEqual(7);
        subscribers.push(9);
        expect(subscribers.length).assertEqual(2);
        catalog.checkArrayBound(subscribers.length, BoundaryCatalog.SUBSCRIBER_SPEC);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_1600
     * @tc.name testArrayAtUpperBoundAccepted
     * @tc.desc Verify an array exactly at the 256 element limit passes and 257 is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayAtUpperBoundAccepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        const limit: number = BoundaryCatalog.SUBSCRIBER_SPEC.maxLength;
        catalog.checkArrayBound(limit, BoundaryCatalog.SUBSCRIBER_SPEC);
        expect(limit).assertEqual(256);
        try {
          catalog.checkArrayBound(limit + 1, BoundaryCatalog.SUBSCRIBER_SPEC);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ParameterError');
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_1700
     * @tc.name testParameterErrorClassification
     * @tc.desc Verify ParameterError is classified into the parameter bucket with numeric code 401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParameterErrorClassification', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        const error: ParameterError = new ParameterError('bad argument');
        expect(error.name).assertEqual('ParameterError');
        expect(error.code).assertEqual(401);
        expect(catalog.classify(error.name)).assertEqual(ErrorClass.PARAM);
        expect(catalog.classify(error.name) === ErrorClass.STATE).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_1800
     * @tc.name testStateErrorClassification
     * @tc.desc Verify LifecycleStateError is classified into the state bucket with numeric code 409
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStateErrorClassification', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        const gate: LifecycleGate = new LifecycleGate();
        try {
          gate.advanceTo('BACKGROUND');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('LifecycleStateError');
          expect(catalog.classify(e.name)).assertEqual(ErrorClass.STATE);
        }
        expect(gate.getState()).assertEqual('CREATED');
        expect(gate.isTerminal()).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_1900
     * @tc.name testTimeoutErrorClassification
     * @tc.desc Verify OperationTimeoutError is classified into the timeout bucket with numeric code 408
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTimeoutErrorClassification', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        const tracker: DeadlineTracker = new DeadlineTracker(TIMEOUT_TEXT_APPEAR);
        tracker.start();
        tracker.check(TIMEOUT_TEXT_APPEAR);
        try {
          tracker.check(TIMEOUT_TEXT_APPEAR + 1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('OperationTimeoutError');
          expect((e as OperationTimeoutError).code).assertEqual(408);
          expect(catalog.classify(e.name)).assertEqual(ErrorClass.TIMEOUT);
        }
        tracker.finish();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_2000
     * @tc.name testUnknownErrorNameRejected
     * @tc.desc Verify classifying an unknown error name raises ParameterError instead of guessing a bucket
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUnknownErrorNameRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        try {
          catalog.classify('NotARealError');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ParameterError');
        }
        expect(catalog.classify('ParameterError')).assertEqual(ErrorClass.PARAM);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_2100
     * @tc.name testLifecycleGateLegalPath
     * @tc.desc Verify the legal lifecycle path CREATED to ACTIVE to FOREGROUND to BACKGROUND to DESTROYED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleGateLegalPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const gate: LifecycleGate = new LifecycleGate();
        expect(gate.getState()).assertEqual('CREATED');
        gate.advanceTo('ACTIVE');
        expect(gate.getState()).assertEqual('ACTIVE');
        gate.advanceTo('FOREGROUND');
        expect(gate.getState()).assertEqual('FOREGROUND');
        gate.advanceTo('BACKGROUND');
        expect(gate.getState()).assertEqual('BACKGROUND');
        gate.advanceTo('FOREGROUND');
        expect(gate.getState()).assertEqual('FOREGROUND');
        gate.advanceTo('DESTROYED');
        expect(gate.getState()).assertEqual('DESTROYED');
        expect(gate.isTerminal()).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_2200
     * @tc.name testLifecycleGateRejectsTransitionFromTerminal
     * @tc.desc Verify a destroyed gate rejects any further transition with LifecycleStateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleGateRejectsTransitionFromTerminal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const gate: LifecycleGate = new LifecycleGate();
        gate.advanceTo('ACTIVE');
        gate.advanceTo('DESTROYED');
        expect(gate.isTerminal()).assertTrue();
        try {
          gate.advanceTo('ACTIVE');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('LifecycleStateError');
        }
        expect(gate.getState()).assertEqual('DESTROYED');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_2300
     * @tc.name testDeadlineZeroBudgetRejected
     * @tc.desc Verify a zero or negative deadline budget is rejected at construction time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeadlineZeroBudgetRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        try {
          const zeroBudget: DeadlineTracker = new DeadlineTracker(0);
          expect(zeroBudget.getBudget()).assertEqual(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ParameterError');
        }
        try {
          const negativeBudget: DeadlineTracker = new DeadlineTracker(-5);
          expect(negativeBudget.getBudget()).assertEqual(-5);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ParameterError');
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_2400
     * @tc.name testDeadlineStateOrderEnforced
     * @tc.desc Verify checking or finishing a deadline before start raises LifecycleStateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeadlineStateOrderEnforced', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const tracker: DeadlineTracker = new DeadlineTracker(TIMEOUT_ABILITY_LAUNCH);
        try {
          tracker.check(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('LifecycleStateError');
        }
        tracker.start();
        try {
          tracker.start();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('LifecycleStateError');
        }
        tracker.finish();
        expect(tracker.isWithin(0)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_2500
     * @tc.name testUiPageVisibleAtStartup
     * @tc.desc Verify the real Index page is visible after launch so boundary probes run against a live page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiPageVisibleAtStartup', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const startTime: number = Date.now();
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const elapsed: number = measureElapsed(startTime);
        logInfo(`testUiPageVisibleAtStartup: stable ${stable} in ${elapsed} ms`);
        expect(stable).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
        expect(isWithinBudget(elapsed, TIMEOUT_ABILITY_LAUNCH)).assertTrue();
        expect(await pageComponentCount(driver) > 0).assertTrue();
      } catch (error) {
        logError(`testUiPageVisibleAtStartup failed: ${error}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_2600
     * @tc.name testUiTextQueryEmptyStringNoMatch
     * @tc.desc Verify an empty text query only matches components whose text is empty and never the page copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiTextQueryEmptyStringNoMatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const matches: Component[] = await findComponentsByText(driver, '');
        logInfo(`testUiTextQueryEmptyStringNoMatch: ${matches.length} matches`);
        for (let i = 0; i < matches.length; i++) {
          const content: string = await matches[i].getText();
          expect(content).assertEqual('');
        }
        expect(await checkTextContent(driver, '')).assertFalse();
        const initialSeen: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        const clickedSeen: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(initialSeen || clickedSeen).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_2700
     * @tc.name testUiUnknownComponentTypeNoMatch
     * @tc.desc Verify querying an unknown component type on the live page returns an empty list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiUnknownComponentTypeNoMatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const unknownType: string = 'NotARealComponentType';
        const matches: Component[] = await findComponentsByType(driver, unknownType);
        logInfo(`testUiUnknownComponentTypeNoMatch: ${matches.length} matches for ${unknownType}`);
        expect(matches.length).assertEqual(0);
        const liveTexts: Component[] = await findComponentsByType(driver, 'Text');
        expect(liveTexts.length >= 1).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_2800
     * @tc.name testUiTextLengthBoundaryOnLivePage
     * @tc.desc Verify page copies fit the 1024 character bound and are at least one character long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiTextLengthBoundaryOnLivePage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        const spec: BoundedStringSpec = { key: 'pageText', minLength: 1, maxLength: BoundaryCatalog.MAX_STRING_LENGTH };
        catalog.checkStringBound(PAGE_TEXT_INITIAL, spec);
        catalog.checkStringBound(PAGE_TEXT_CLICKED, spec);
        expect(PAGE_TEXT_INITIAL.length).assertEqual(11);
        expect(PAGE_TEXT_CLICKED.length).assertEqual(7);
        const initialPresent: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        const clickedPresent: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(initialPresent || clickedPresent).assertTrue();
        expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BOUNDARY_2900
     * @tc.name testUiMaxLengthStringDoesNotMatchPage
     * @tc.desc Verify the maximum length synthetic string is well formed at model level and that a short
     * probe string never matches the live page copy; the UI probe is capped at 32 characters because
     * findComponents with a 1024 character text value aborts libuitest on this build
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiMaxLengthStringDoesNotMatchPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const catalog: BoundaryCatalog = new BoundaryCatalog();
        const huge: string = catalog.repeatChar('z', BoundaryCatalog.MAX_STRING_LENGTH);
        expect(huge.length).assertEqual(1024);
        expect(huge.charAt(0)).assertEqual('z');
        expect(huge.charAt(huge.length - 1)).assertEqual('z');
        const maxSpec: BoundedStringSpec = {
          key: 'maxProbe', minLength: 1, maxLength: BoundaryCatalog.MAX_STRING_LENGTH
        };
        catalog.checkStringBound(huge, maxSpec);
        try {
          catalog.checkStringBound(huge + 'z', maxSpec);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ParameterError');
        }
        const probe: string = catalog.repeatChar('z', 32);
        expect(probe.length).assertEqual(32);
        const matches: Component[] = await findComponentsByText(driver, probe);
        expect(matches.length).assertEqual(0);
        expect(await checkTextContent(driver, probe)).assertFalse();
        expect(await checkTextContent(driver, huge)).assertFalse();
        const liveVisible: boolean = await isIndexPageVisible(driver);
        expect(liveVisible).assertTrue();
      } finally {
        done();
      }
    })
  })
}
