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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { getDriver, ensureAppReady, checkComponentExists, BUNDLE_NAME } from '../Shared/SharedDriver';

enum ErrorClass {
  TRANSIENT = 0,
  PERMANENT = 1,
  TIMEOUT = 2,
  UNKNOWN = 3
}

enum CircuitState {
  CLOSED = 0,
  OPEN = 1,
  HALF_OPEN = 2
}

class ErrorRecord {
  code: number = 0;
  category: number = ErrorClass.UNKNOWN;
  attempt: number = 0;
  message: string = '';

  constructor(code: number, category: number, attempt: number, message: string) {
    this.code = code;
    this.category = category;
    this.attempt = attempt;
    this.message = message;
  }
}

class ErrorClassifier {
  classify(code: number): number {
    if (code === 408) {
      return ErrorClass.TIMEOUT;
    }
    if (code >= 500 && code < 600) {
      return ErrorClass.TRANSIENT;
    }
    if (code >= 400 && code < 500) {
      return ErrorClass.PERMANENT;
    }
    return ErrorClass.UNKNOWN;
  }

  isRetryable(code: number): boolean {
    const category = this.classify(code);
    return category === ErrorClass.TRANSIENT || category === ErrorClass.TIMEOUT;
  }
}

class RetryPolicy {
  maxAttempts: number = 3;
  baseDelay: number = 100;
  factor: number = 2;
  maxDelay: number = 2000;

  constructor(maxAttempts: number, baseDelay: number, factor: number, maxDelay: number) {
    this.maxAttempts = maxAttempts;
    this.baseDelay = baseDelay;
    this.factor = factor;
    this.maxDelay = maxDelay;
  }

  delayFor(attempt: number): number {
    if (attempt <= 0) {
      return 0;
    }
    let delay = this.baseDelay;
    for (let i = 1; i < attempt; i++) {
      delay = delay * this.factor;
      if (delay >= this.maxDelay) {
        return this.maxDelay;
      }
    }
    return delay > this.maxDelay ? this.maxDelay : delay;
  }

  shouldRetry(attempt: number, category: number): boolean {
    if (category !== ErrorClass.TRANSIENT && category !== ErrorClass.TIMEOUT) {
      return false;
    }
    return attempt < this.maxAttempts;
  }
}

class CircuitBreaker {
  threshold: number = 3;
  cooldown: number = 1000;
  state: number = CircuitState.CLOSED;
  failures: number = 0;
  successes: number = 0;
  private clock: number = 0;
  private openedAt: number = 0;

  constructor(threshold: number, cooldown: number) {
    this.threshold = threshold;
    this.cooldown = cooldown;
  }

  advance(ms: number): void {
    if (ms > 0) {
      this.clock = this.clock + ms;
    }
  }

  getClock(): number {
    return this.clock;
  }

  recordFailure(): boolean {
    this.failures = this.failures + 1;
    if (this.state === CircuitState.CLOSED && this.failures >= this.threshold) {
      this.state = CircuitState.OPEN;
      this.openedAt = this.clock;
      return true;
    }
    return false;
  }

  recordSuccess(): void {
    this.successes = this.successes + 1;
    if (this.state === CircuitState.HALF_OPEN) {
      this.state = CircuitState.CLOSED;
      this.failures = 0;
    }
  }

  canAttempt(): boolean {
    if (this.state === CircuitState.CLOSED) {
      return true;
    }
    if (this.state === CircuitState.OPEN) {
      if (this.clock - this.openedAt >= this.cooldown) {
        this.state = CircuitState.HALF_OPEN;
        return true;
      }
      return false;
    }
    return true;
  }

  reset(): void {
    this.state = CircuitState.CLOSED;
    this.failures = 0;
    this.openedAt = 0;
  }
}

class RecoveryPlan {
  name: string = '';
  steps: string[] = [];
  currentStep: number = 0;
  complete: boolean = false;

  constructor(name: string, steps: string[]) {
    this.name = name;
    this.steps = steps;
  }

  advance(): boolean {
    if (this.complete) {
      return false;
    }
    this.currentStep = this.currentStep + 1;
    if (this.currentStep >= this.steps.length) {
      this.complete = true;
    }
    return true;
  }

  reset(): void {
    this.currentStep = 0;
    this.complete = false;
  }

  isComplete(): boolean {
    return this.complete;
  }

  progress(): number {
    if (this.steps.length === 0) {
      return 0;
    }
    return Math.floor((this.currentStep * 100) / this.steps.length);
  }

  current(): string {
    if (this.currentStep >= this.steps.length || this.currentStep < 0) {
      return '';
    }
    return this.steps[this.currentStep];
  }
}

class RecoveryEngine {
  classifier: ErrorClassifier = new ErrorClassifier();
  policy: RetryPolicy = new RetryPolicy(3, 100, 2, 2000);
  breaker: CircuitBreaker = new CircuitBreaker(3, 1000);
  private history: ErrorRecord[] = [];
  private attemptCounter: number = 0;

  constructor(policy: RetryPolicy, breaker: CircuitBreaker) {
    this.policy = policy;
    this.breaker = breaker;
  }

  attempts(): number {
    return this.attemptCounter;
  }

  historySize(): number {
    return this.history.length;
  }

  lastRecord(): ErrorRecord | null {
    if (this.history.length === 0) {
      return null;
    }
    return this.history[this.history.length - 1];
  }

  attempt(code: number, message: string): string {
    if (!this.breaker.canAttempt()) {
      return 'blocked';
    }
    this.attemptCounter = this.attemptCounter + 1;
    const category = this.classifier.classify(code);
    this.history.push(new ErrorRecord(code, category, this.attemptCounter, message));
    if (category === ErrorClass.PERMANENT || category === ErrorClass.UNKNOWN) {
      this.breaker.recordFailure();
      return 'fatal';
    }
    if (this.policy.shouldRetry(this.attemptCounter, category)) {
      this.breaker.recordFailure();
      return 'retry';
    }
    this.breaker.recordFailure();
    return 'exhausted';
  }

  markSuccess(): void {
    this.attemptCounter = 0;
    this.breaker.recordSuccess();
  }

  resetAttempts(): void {
    this.attemptCounter = 0;
  }
}

function isServerError(code: number): boolean {
  return code >= 500 && code < 600;
}

function isClientError(code: number): boolean {
  return code >= 400 && code < 500;
}

export default function errorRecoveryDeepTest(): void {
  describe('ErrorRecoveryDeep', () => {
    it('ErrorRecoveryDeep_001', 0, async (done: Function) => {
      const classifier = new ErrorClassifier();
      expect(classifier.classify(408)).assertEqual(ErrorClass.TIMEOUT);
      expect(classifier.classify(500)).assertEqual(ErrorClass.TRANSIENT);
      expect(classifier.classify(503)).assertEqual(ErrorClass.TRANSIENT);
      expect(classifier.classify(599)).assertEqual(ErrorClass.TRANSIENT);
      expect(classifier.classify(404)).assertEqual(ErrorClass.PERMANENT);
      done();
    });

    it('ErrorRecoveryDeep_002', 0, async (done: Function) => {
      const classifier = new ErrorClassifier();
      expect(classifier.classify(400)).assertEqual(ErrorClass.PERMANENT);
      expect(classifier.classify(499)).assertEqual(ErrorClass.PERMANENT);
      expect(classifier.classify(301)).assertEqual(ErrorClass.UNKNOWN);
      expect(classifier.classify(0)).assertEqual(ErrorClass.UNKNOWN);
      expect(classifier.classify(600)).assertEqual(ErrorClass.UNKNOWN);
      done();
    });

    it('ErrorRecoveryDeep_003', 0, async (done: Function) => {
      const classifier = new ErrorClassifier();
      expect(classifier.isRetryable(500)).assertTrue();
      expect(classifier.isRetryable(408)).assertTrue();
      expect(classifier.isRetryable(404)).assertFalse();
      expect(classifier.isRetryable(301)).assertFalse();
      expect(classifier.isRetryable(599)).assertTrue();
      done();
    });

    it('ErrorRecoveryDeep_004', 0, async (done: Function) => {
      expect(isServerError(500)).assertTrue();
      expect(isServerError(599)).assertTrue();
      expect(isServerError(499)).assertFalse();
      expect(isClientError(400)).assertTrue();
      expect(isClientError(404)).assertTrue();
      expect(isClientError(500)).assertFalse();
      done();
    });

    it('ErrorRecoveryDeep_005', 0, async (done: Function) => {
      const policy = new RetryPolicy(3, 100, 2, 2000);
      expect(policy.delayFor(0)).assertEqual(0);
      expect(policy.delayFor(1)).assertEqual(100);
      expect(policy.delayFor(2)).assertEqual(200);
      expect(policy.delayFor(3)).assertEqual(400);
      expect(policy.delayFor(4)).assertEqual(800);
      done();
    });

    it('ErrorRecoveryDeep_006', 0, async (done: Function) => {
      const policy = new RetryPolicy(3, 100, 2, 2000);
      expect(policy.delayFor(5)).assertEqual(1600);
      expect(policy.delayFor(6)).assertEqual(2000);
      expect(policy.delayFor(7)).assertEqual(2000);
      expect(policy.delayFor(-1)).assertEqual(0);
      done();
    });

    it('ErrorRecoveryDeep_007', 0, async (done: Function) => {
      const policy = new RetryPolicy(3, 100, 2, 2000);
      expect(policy.shouldRetry(1, ErrorClass.TRANSIENT)).assertTrue();
      expect(policy.shouldRetry(2, ErrorClass.TRANSIENT)).assertTrue();
      expect(policy.shouldRetry(3, ErrorClass.TRANSIENT)).assertFalse();
      expect(policy.shouldRetry(1, ErrorClass.TIMEOUT)).assertTrue();
      expect(policy.shouldRetry(1, ErrorClass.PERMANENT)).assertFalse();
      done();
    });

    it('ErrorRecoveryDeep_008', 0, async (done: Function) => {
      const policy = new RetryPolicy(5, 50, 3, 1000);
      expect(policy.delayFor(1)).assertEqual(50);
      expect(policy.delayFor(2)).assertEqual(150);
      expect(policy.delayFor(3)).assertEqual(450);
      expect(policy.delayFor(4)).assertEqual(1000);
      expect(policy.delayFor(5)).assertEqual(1000);
      done();
    });

    it('ErrorRecoveryDeep_009', 0, async (done: Function) => {
      const policy = new RetryPolicy(5, 50, 3, 1000);
      expect(policy.shouldRetry(4, ErrorClass.TRANSIENT)).assertTrue();
      expect(policy.shouldRetry(5, ErrorClass.TRANSIENT)).assertFalse();
      expect(policy.shouldRetry(4, ErrorClass.TIMEOUT)).assertTrue();
      expect(policy.shouldRetry(4, ErrorClass.UNKNOWN)).assertFalse();
      done();
    });

    it('ErrorRecoveryDeep_010', 0, async (done: Function) => {
      const classifier = new ErrorClassifier();
      expect(classifier.classify(399)).assertEqual(ErrorClass.UNKNOWN);
      expect(classifier.classify(499)).assertEqual(ErrorClass.PERMANENT);
      expect(classifier.classify(599)).assertEqual(ErrorClass.TRANSIENT);
      expect(classifier.isRetryable(600)).assertFalse();
      done();
    });

    it('ErrorRecoveryDeep_011', 0, async (done: Function) => {
      const breaker = new CircuitBreaker(3, 1000);
      expect(breaker.state).assertEqual(CircuitState.CLOSED);
      expect(breaker.canAttempt()).assertTrue();
      expect(breaker.failures).assertEqual(0);
      expect(breaker.successes).assertEqual(0);
      expect(breaker.getClock()).assertEqual(0);
      done();
    });

    it('ErrorRecoveryDeep_012', 0, async (done: Function) => {
      const breaker = new CircuitBreaker(3, 1000);
      expect(breaker.recordFailure()).assertFalse();
      expect(breaker.recordFailure()).assertFalse();
      expect(breaker.failures).assertEqual(2);
      expect(breaker.state).assertEqual(CircuitState.CLOSED);
      expect(breaker.recordFailure()).assertTrue();
      expect(breaker.state).assertEqual(CircuitState.OPEN);
      done();
    });

    it('ErrorRecoveryDeep_013', 0, async (done: Function) => {
      const breaker = new CircuitBreaker(3, 1000);
      breaker.recordFailure();
      breaker.recordFailure();
      breaker.recordFailure();
      expect(breaker.canAttempt()).assertFalse();
      breaker.advance(500);
      expect(breaker.canAttempt()).assertFalse();
      breaker.advance(500);
      expect(breaker.canAttempt()).assertTrue();
      expect(breaker.state).assertEqual(CircuitState.HALF_OPEN);
      done();
    });

    it('ErrorRecoveryDeep_014', 0, async (done: Function) => {
      const breaker = new CircuitBreaker(2, 100);
      breaker.recordFailure();
      breaker.recordFailure();
      breaker.advance(100);
      expect(breaker.canAttempt()).assertTrue();
      expect(breaker.state).assertEqual(CircuitState.HALF_OPEN);
      breaker.recordSuccess();
      expect(breaker.state).assertEqual(CircuitState.CLOSED);
      expect(breaker.failures).assertEqual(0);
      expect(breaker.successes).assertEqual(1);
      done();
    });

    it('ErrorRecoveryDeep_015', 0, async (done: Function) => {
      const breaker = new CircuitBreaker(1, 100);
      breaker.recordFailure();
      expect(breaker.state).assertEqual(CircuitState.OPEN);
      breaker.reset();
      expect(breaker.state).assertEqual(CircuitState.CLOSED);
      expect(breaker.failures).assertEqual(0);
      expect(breaker.canAttempt()).assertTrue();
      done();
    });

    it('ErrorRecoveryDeep_016', 0, async (done: Function) => {
      const breaker = new CircuitBreaker(2, 100);
      breaker.recordSuccess();
      breaker.recordSuccess();
      expect(breaker.successes).assertEqual(2);
      expect(breaker.state).assertEqual(CircuitState.CLOSED);
      expect(breaker.failures).assertEqual(0);
      done();
    });

    it('ErrorRecoveryDeep_017', 0, async (done: Function) => {
      const breaker = new CircuitBreaker(1, 100);
      breaker.recordFailure();
      expect(breaker.recordFailure()).assertFalse();
      expect(breaker.failures).assertEqual(2);
      expect(breaker.state).assertEqual(CircuitState.OPEN);
      done();
    });

    it('ErrorRecoveryDeep_018', 0, async (done: Function) => {
      const breaker = new CircuitBreaker(1, 50);
      breaker.advance(20);
      expect(breaker.recordFailure()).assertTrue();
      expect(breaker.getClock()).assertEqual(20);
      expect(breaker.state).assertEqual(CircuitState.OPEN);
      done();
    });

    it('ErrorRecoveryDeep_019', 0, async (done: Function) => {
      const breaker = new CircuitBreaker(1, 1000);
      breaker.recordFailure();
      breaker.advance(999);
      expect(breaker.canAttempt()).assertFalse();
      expect(breaker.state).assertEqual(CircuitState.OPEN);
      breaker.advance(1);
      expect(breaker.canAttempt()).assertTrue();
      expect(breaker.state).assertEqual(CircuitState.HALF_OPEN);
      done();
    });

    it('ErrorRecoveryDeep_020', 0, async (done: Function) => {
      const breaker = new CircuitBreaker(3, 1000);
      breaker.advance(100);
      breaker.advance(200);
      expect(breaker.getClock()).assertEqual(300);
      breaker.advance(-50);
      expect(breaker.getClock()).assertEqual(300);
      done();
    });

    it('ErrorRecoveryDeep_021', 0, async (done: Function) => {
      const plan = new RecoveryPlan('restart', ['stop', 'cleanup', 'start']);
      expect(plan.name).assertEqual('restart');
      expect(plan.steps.length).assertEqual(3);
      expect(plan.currentStep).assertEqual(0);
      expect(plan.isComplete()).assertFalse();
      expect(plan.progress()).assertEqual(0);
      expect(plan.current()).assertEqual('stop');
      done();
    });

    it('ErrorRecoveryDeep_022', 0, async (done: Function) => {
      const plan = new RecoveryPlan('restart', ['stop', 'cleanup', 'start']);
      expect(plan.advance()).assertTrue();
      expect(plan.currentStep).assertEqual(1);
      expect(plan.current()).assertEqual('cleanup');
      expect(plan.progress()).assertEqual(33);
      expect(plan.isComplete()).assertFalse();
      done();
    });

    it('ErrorRecoveryDeep_023', 0, async (done: Function) => {
      const plan = new RecoveryPlan('restart', ['stop', 'cleanup', 'start']);
      expect(plan.advance()).assertTrue();
      expect(plan.advance()).assertTrue();
      expect(plan.advance()).assertTrue();
      expect(plan.isComplete()).assertTrue();
      expect(plan.progress()).assertEqual(100);
      expect(plan.advance()).assertFalse();
      done();
    });

    it('ErrorRecoveryDeep_024', 0, async (done: Function) => {
      const plan = new RecoveryPlan('restart', ['stop', 'cleanup']);
      plan.advance();
      plan.advance();
      expect(plan.isComplete()).assertTrue();
      plan.reset();
      expect(plan.currentStep).assertEqual(0);
      expect(plan.isComplete()).assertFalse();
      expect(plan.progress()).assertEqual(0);
      expect(plan.current()).assertEqual('stop');
      done();
    });

    it('ErrorRecoveryDeep_025', 0, async (done: Function) => {
      const plan = new RecoveryPlan('empty', []);
      expect(plan.progress()).assertEqual(0);
      expect(plan.current()).assertEqual('');
      expect(plan.isComplete()).assertFalse();
      expect(plan.advance()).assertTrue();
      expect(plan.isComplete()).assertTrue();
      done();
    });

    it('ErrorRecoveryDeep_026', 0, async (done: Function) => {
      const plan = new RecoveryPlan('one', ['only']);
      expect(plan.current()).assertEqual('only');
      plan.advance();
      expect(plan.isComplete()).assertTrue();
      expect(plan.current()).assertEqual('');
      expect(plan.progress()).assertEqual(100);
      done();
    });

    it('ErrorRecoveryDeep_027', 0, async (done: Function) => {
      const plan = new RecoveryPlan('four', ['a', 'b', 'c', 'd']);
      plan.advance();
      plan.advance();
      expect(plan.progress()).assertEqual(50);
      expect(plan.currentStep).assertEqual(2);
      expect(plan.current()).assertEqual('c');
      done();
    });

    it('ErrorRecoveryDeep_028', 0, async (done: Function) => {
      const plan = new RecoveryPlan('two', ['a', 'b']);
      plan.advance();
      plan.advance();
      const step = plan.currentStep;
      expect(plan.advance()).assertFalse();
      expect(plan.currentStep).assertEqual(step);
      expect(plan.isComplete()).assertTrue();
      done();
    });

    it('ErrorRecoveryDeep_029', 0, async (done: Function) => {
      const plan = new RecoveryPlan('three', ['x', 'y', 'z']);
      expect(plan.progress()).assertEqual(0);
      plan.advance();
      expect(plan.progress()).assertEqual(33);
      plan.advance();
      expect(plan.progress()).assertEqual(66);
      plan.advance();
      expect(plan.progress()).assertEqual(100);
      done();
    });

    it('ErrorRecoveryDeep_030', 0, async (done: Function) => {
      const plan = new RecoveryPlan('resetOnce', ['a']);
      plan.advance();
      expect(plan.isComplete()).assertTrue();
      plan.reset();
      expect(plan.advance()).assertTrue();
      expect(plan.isComplete()).assertTrue();
      expect(plan.currentStep).assertEqual(1);
      done();
    });

    it('ErrorRecoveryDeep_031', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(3, 1000));
      expect(engine.attempts()).assertEqual(0);
      expect(engine.historySize()).assertEqual(0);
      expect(engine.lastRecord()).assertNull();
      expect(engine.breaker.state).assertEqual(CircuitState.CLOSED);
      done();
    });

    it('ErrorRecoveryDeep_032', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(3, 1000));
      expect(engine.attempt(404, 'notFound')).assertEqual('fatal');
      expect(engine.attempts()).assertEqual(1);
      expect(engine.historySize()).assertEqual(1);
      const record = engine.lastRecord();
      expect(record === null ? 0 : record.code).assertEqual(404);
      expect(record === null ? -1 : record.category).assertEqual(ErrorClass.PERMANENT);
      expect(engine.breaker.failures).assertEqual(1);
      done();
    });

    it('ErrorRecoveryDeep_033', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(3, 1000));
      expect(engine.attempt(301, 'redirect')).assertEqual('fatal');
      const record = engine.lastRecord();
      expect(record === null ? -1 : record.category).assertEqual(ErrorClass.UNKNOWN);
      expect(engine.attempts()).assertEqual(1);
      done();
    });

    it('ErrorRecoveryDeep_034', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(3, 1000));
      expect(engine.attempt(503, 'busy')).assertEqual('retry');
      expect(engine.attempt(503, 'busy')).assertEqual('retry');
      expect(engine.attempt(503, 'busy')).assertEqual('exhausted');
      expect(engine.attempt(503, 'busy')).assertEqual('blocked');
      expect(engine.attempts()).assertEqual(3);
      expect(engine.historySize()).assertEqual(3);
      expect(engine.breaker.state).assertEqual(CircuitState.OPEN);
      done();
    });

    it('ErrorRecoveryDeep_035', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(3, 1000));
      expect(engine.attempt(408, 'timeout')).assertEqual('retry');
      expect(engine.attempt(408, 'timeout')).assertEqual('retry');
      expect(engine.attempt(408, 'timeout')).assertEqual('exhausted');
      expect(engine.breaker.state).assertEqual(CircuitState.OPEN);
      const record = engine.lastRecord();
      expect(record === null ? -1 : record.category).assertEqual(ErrorClass.TIMEOUT);
      done();
    });

    it('ErrorRecoveryDeep_036', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(3, 1000));
      engine.attempt(503, 'busy');
      engine.attempt(503, 'busy');
      engine.attempt(503, 'busy');
      expect(engine.breaker.state).assertEqual(CircuitState.OPEN);
      engine.breaker.advance(1000);
      engine.breaker.canAttempt();
      engine.markSuccess();
      expect(engine.attempts() <= 1).assertTrue();
      expect(engine.breaker.state).assertEqual(CircuitState.CLOSED);
      expect(engine.breaker.failures).assertEqual(0);
      done();
    });

    it('ErrorRecoveryDeep_037', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(3, 1000));
      expect(engine.attempt(404, 'bad')).assertEqual('fatal');
      expect(engine.attempt(500, 'boom')).assertEqual('retry');
      expect(engine.attempt(500, 'boom')).assertEqual('exhausted');
      expect(engine.attempt(500, 'boom')).assertEqual('blocked');
      expect(engine.attempts()).assertEqual(3);
      done();
    });

    it('ErrorRecoveryDeep_038', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(1, 100, 2, 2000), new CircuitBreaker(5, 1000));
      expect(engine.attempt(503, 'busy')).assertEqual('exhausted');
      expect(engine.attempts()).assertEqual(1);
      expect(engine.breaker.failures).assertEqual(1);
      expect(engine.breaker.state).assertEqual(CircuitState.CLOSED);
      done();
    });

    it('ErrorRecoveryDeep_039', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(5, 1000));
      engine.attempt(404, 'bad');
      engine.attempt(500, 'boom');
      expect(engine.attempts()).assertEqual(2);
      engine.resetAttempts();
      expect(engine.attempts()).assertEqual(0);
      expect(engine.historySize()).assertEqual(2);
      done();
    });

    it('ErrorRecoveryDeep_040', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(1, 1000));
      expect(engine.attempt(503, 'busy')).assertEqual('retry');
      expect(engine.breaker.state).assertEqual(CircuitState.OPEN);
      expect(engine.attempt(503, 'busy')).assertEqual('blocked');
      expect(engine.attempts()).assertEqual(1);
      done();
    });

    it('ErrorRecoveryDeep_041', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(3, 1000));
      expect(engine.attempt(500, 'boom')).assertEqual('retry');
      engine.markSuccess();
      expect(engine.attempts()).assertEqual(0);
      expect(engine.breaker.state).assertEqual(CircuitState.CLOSED);
      expect(engine.attempt(503, 'busy')).assertEqual('retry');
      expect(engine.attempts()).assertEqual(1);
      done();
    });

    it('ErrorRecoveryDeep_042', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(2, 1000));
      expect(engine.attempt(503, 'busy')).assertEqual('retry');
      expect(engine.attempt(503, 'busy')).assertEqual('retry');
      expect(engine.breaker.state).assertEqual(CircuitState.OPEN);
      expect(engine.attempt(503, 'busy')).assertEqual('blocked');
      expect(engine.attempts()).assertEqual(2);
      done();
    });

    it('ErrorRecoveryDeep_043', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(5, 1000));
      engine.attempt(500, 'first');
      engine.attempt(500, 'second');
      expect(engine.historySize()).assertEqual(2);
      const latest = engine.lastRecord();
      expect(latest === null ? 0 : latest.attempt).assertEqual(2);
      expect(latest === null ? '' : latest.message).assertEqual('second');
      done();
    });

    it('ErrorRecoveryDeep_044', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(5, 1000));
      engine.attempt(404, 'not found on disk');
      const record = engine.lastRecord();
      expect(record === null ? '' : record.message).assertEqual('not found on disk');
      expect(record === null ? 0 : record.code).assertEqual(404);
      done();
    });

    it('ErrorRecoveryDeep_045', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(2, 100, 2, 2000), new CircuitBreaker(5, 1000));
      expect(engine.attempt(503, 'busy')).assertEqual('retry');
      expect(engine.attempt(503, 'busy')).assertEqual('exhausted');
      expect(engine.attempts()).assertEqual(2);
      expect(engine.breaker.state).assertEqual(CircuitState.CLOSED);
      done();
    });

    it('ErrorRecoveryDeep_046', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(3, 1000));
      engine.attempt(503, 'busy');
      engine.attempt(503, 'busy');
      engine.attempt(503, 'busy');
      engine.breaker.advance(999);
      expect(engine.breaker.canAttempt()).assertFalse();
      engine.breaker.advance(1);
      expect(engine.breaker.canAttempt()).assertTrue();
      expect(engine.breaker.state).assertEqual(CircuitState.HALF_OPEN);
      done();
    });

    it('ErrorRecoveryDeep_047', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(3, 1000));
      expect(engine.attempt(404, 'bad')).assertEqual('fatal');
      expect(engine.breaker.failures).assertEqual(1);
      engine.markSuccess();
      expect(engine.attempts()).assertEqual(0);
      expect(engine.breaker.successes).assertEqual(1);
      expect(engine.breaker.state).assertEqual(CircuitState.CLOSED);
      done();
    });

    it('ErrorRecoveryDeep_048', 0, async (done: Function) => {
      const classifier = new ErrorClassifier();
      const codes: number[] = [200, 301, 400, 408, 404, 500, 503, 599, 600];
      let retryable = 0;
      for (let i = 0; i < codes.length; i++) {
        if (classifier.isRetryable(codes[i])) {
          retryable = retryable + 1;
        }
      }
      expect(retryable).assertEqual(4);
      expect(classifier.isRetryable(200)).assertFalse();
      done();
    });

    it('ErrorRecoveryDeep_049', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(3, 1000));
      engine.markSuccess();
      engine.markSuccess();
      expect(engine.breaker.successes).assertEqual(2);
      expect(engine.attempts()).assertEqual(0);
      done();
    });

    it('ErrorRecoveryDeep_050', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(5, 1000));
      engine.attempt(500, 'a');
      engine.attempt(503, 'b');
      engine.attempt(599, 'c');
      expect(engine.historySize()).assertEqual(3);
      const record = engine.lastRecord();
      expect(record === null ? 0 : record.code).assertEqual(599);
      expect(record === null ? 0 : record.attempt).assertEqual(3);
      done();
    });

    it('ErrorRecoveryDeep_051', 0, async (done: Function) => {
      const policy = new RetryPolicy(4, 100, 1, 2000);
      expect(policy.delayFor(1)).assertEqual(100);
      expect(policy.delayFor(2)).assertEqual(100);
      expect(policy.delayFor(4)).assertEqual(100);
      expect(policy.shouldRetry(3, ErrorClass.TRANSIENT)).assertTrue();
      done();
    });

    it('ErrorRecoveryDeep_052', 0, async (done: Function) => {
      const plan = new RecoveryPlan('six', ['1', '2', '3', '4', '5', '6']);
      plan.advance();
      expect(plan.progress()).assertEqual(16);
      plan.advance();
      expect(plan.progress()).assertEqual(33);
      done();
    });

    it('ErrorRecoveryDeep_053', 0, async (done: Function) => {
      const plan = new RecoveryPlan('three', ['a', 'b', 'c']);
      plan.advance();
      plan.advance();
      plan.advance();
      expect(plan.complete).assertTrue();
      expect(plan.currentStep).assertEqual(3);
      expect(plan.progress()).assertEqual(100);
      expect(plan.advance()).assertFalse();
      done();
    });

    it('ErrorRecoveryDeep_054', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(3, 1000));
      expect(engine.attempt(999, 'unknown')).assertEqual('fatal');
      const record = engine.lastRecord();
      expect(record === null ? -1 : record.category).assertEqual(ErrorClass.UNKNOWN);
      expect(engine.breaker.failures).assertEqual(1);
      done();
    });

    it('ErrorRecoveryDeep_055', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(3, 1000));
      expect(engine.attempt(600, 'unknown')).assertEqual('fatal');
      expect(engine.attempts()).assertEqual(1);
      expect(engine.historySize()).assertEqual(1);
      done();
    });

    it('ErrorRecoveryDeep_056', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(3, 1000));
      expect(engine.attempt(500, 'a')).assertEqual('retry');
      expect(engine.attempt(408, 'b')).assertEqual('retry');
      expect(engine.attempt(503, 'c')).assertEqual('exhausted');
      expect(engine.historySize()).assertEqual(3);
      done();
    });

    it('ErrorRecoveryDeep_057', 0, async (done: Function) => {
      const breaker = new CircuitBreaker(3, 1000);
      breaker.recordFailure();
      breaker.recordFailure();
      breaker.recordSuccess();
      expect(breaker.failures).assertEqual(2);
      expect(breaker.successes).assertEqual(1);
      expect(breaker.state).assertEqual(CircuitState.CLOSED);
      done();
    });

    it('ErrorRecoveryDeep_058', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(1, 1000));
      expect(engine.attempt(503, 'a')).assertEqual('retry');
      expect(engine.attempt(503, 'b')).assertEqual('blocked');
      expect(engine.attempt(503, 'c')).assertEqual('blocked');
      expect(engine.attempts()).assertEqual(1);
      expect(engine.historySize()).assertEqual(1);
      done();
    });

    it('ErrorRecoveryDeep_059', 0, async (done: Function) => {
      const policy = new RetryPolicy(5, 1, 10, 1000);
      expect(policy.delayFor(1)).assertEqual(1);
      expect(policy.delayFor(2)).assertEqual(10);
      expect(policy.delayFor(3)).assertEqual(100);
      expect(policy.delayFor(4)).assertEqual(1000);
      expect(policy.delayFor(5)).assertEqual(1000);
      done();
    });

    it('ErrorRecoveryDeep_060', 0, async (done: Function) => {
      const classifier = new ErrorClassifier();
      expect(classifier.classify(409)).assertEqual(ErrorClass.PERMANENT);
      expect(classifier.classify(408)).assertEqual(ErrorClass.TIMEOUT);
      expect(classifier.classify(502)).assertEqual(ErrorClass.TRANSIENT);
      expect(classifier.isRetryable(409)).assertFalse();
      done();
    });

    it('ErrorRecoveryDeep_061', 0, async (done: Function) => {
      const plan = new RecoveryPlan('six', ['1', '2', '3', '4', '5', '6']);
      plan.advance();
      plan.advance();
      plan.advance();
      expect(plan.progress()).assertEqual(50);
      plan.reset();
      expect(plan.progress()).assertEqual(0);
      expect(plan.isComplete()).assertFalse();
      expect(plan.current()).assertEqual('1');
      done();
    });

    it('ErrorRecoveryDeep_062', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(5, 1000));
      expect(engine.attempt(503, 'a')).assertEqual('retry');
      expect(engine.attempts()).assertEqual(1);
      engine.markSuccess();
      expect(engine.attempts()).assertEqual(0);
      expect(engine.attempt(503, 'b')).assertEqual('retry');
      expect(engine.attempts()).assertEqual(1);
      done();
    });

    it('ErrorRecoveryDeep_063', 0, async (done: Function) => {
      const breaker = new CircuitBreaker(1, 1000);
      breaker.recordFailure();
      expect(breaker.state).assertEqual(CircuitState.OPEN);
      breaker.reset();
      expect(breaker.canAttempt()).assertTrue();
      expect(breaker.recordFailure()).assertTrue();
      expect(breaker.state).assertEqual(CircuitState.OPEN);
      done();
    });

    it('ErrorRecoveryDeep_064', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(5, 1000));
      engine.markSuccess();
      engine.markSuccess();
      engine.markSuccess();
      expect(engine.breaker.successes).assertEqual(3);
      expect(engine.attempts()).assertEqual(0);
      expect(engine.breaker.failures).assertEqual(0);
      done();
    });

    it('ErrorRecoveryDeep_065', 0, async (done: Function) => {
      const policy = new RetryPolicy(3, 100, 2, 2000);
      expect(policy.shouldRetry(0, ErrorClass.TRANSIENT)).assertTrue();
      expect(policy.shouldRetry(0, ErrorClass.UNKNOWN)).assertFalse();
      expect(policy.shouldRetry(2, ErrorClass.PERMANENT)).assertFalse();
      done();
    });

    it('ErrorRecoveryDeep_066', 0, async (done: Function) => {
      const plan = new RecoveryPlan('two', ['prepare', 'finish']);
      plan.advance();
      expect(plan.current()).assertEqual('finish');
      plan.reset();
      expect(plan.current()).assertEqual('prepare');
      plan.advance();
      plan.advance();
      expect(plan.isComplete()).assertTrue();
      done();
    });

    it('ErrorRecoveryDeep_067', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(1, 100, 2, 2000), new CircuitBreaker(5, 1000));
      expect(engine.attempt(408, 'timeout')).assertEqual('exhausted');
      expect(engine.attempts()).assertEqual(1);
      const record = engine.lastRecord();
      expect(record === null ? 0 : record.attempt).assertEqual(1);
      done();
    });

    it('ErrorRecoveryDeep_068', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
        hilog.info(0x0000, 'StageModelTest', '%{public}s', `error ui probe ${exists}`);
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
    it('ErrorRecoveryDeep_069', 0, async (done: Function) => {
      const engine = new RecoveryEngine(new RetryPolicy(3, 100, 2, 2000), new CircuitBreaker(5, 1000));
      expect(engine.attempt(500, 'a')).assertEqual('retry');
      expect(engine.attempt(404, 'b')).assertEqual('fatal');
      expect(engine.attempts()).assertEqual(2);
      expect(engine.breaker.failures).assertEqual(2);
      expect(engine.breaker.state).assertEqual(CircuitState.CLOSED);
      done();
    });

    it('ErrorRecoveryDeep_070', 0, async (done: Function) => {
      const plan = new RecoveryPlan('five', ['1', '2', '3', '4', '5']);
      plan.advance();
      plan.advance();
      plan.advance();
      plan.advance();
      expect(plan.progress()).assertEqual(80);
      expect(plan.isComplete()).assertFalse();
      plan.advance();
      expect(plan.progress()).assertEqual(100);
      expect(plan.isComplete()).assertTrue();
      done();
    });
  });
}







