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

import { describe, it, expect } from '@ohos/hypium';

const PHASE_PARSE: string = 'parse';
const PHASE_IO: string = 'io';
const PHASE_NETWORK: string = 'network';
const PHASE_RENDER: string = 'render';

const ERROR_TYPE_PARSE: string = 'ParseError';
const ERROR_TYPE_IO: string = 'IoError';
const ERROR_TYPE_NETWORK: string = 'NetworkError';
const ERROR_TYPE_RENDER: string = 'RenderError';
const ERROR_TYPE_UNKNOWN: string = 'UnknownError';

interface CapturedError {
  type: string;
  message: string;
  phase: string;
  operation: string;
}

// Classifies thrown values into stable error categories
class ExceptionClassifier {
  public static typeOf(error: Error): string {
    const name = error.name;
    if (name === 'SyntaxError') {
      return ERROR_TYPE_PARSE;
    }
    if (name === 'TypeError') {
      return ERROR_TYPE_RENDER;
    }
    if (name === 'NetworkError' || name === 'HttpError') {
      return ERROR_TYPE_NETWORK;
    }
    if (name === 'IoError' || name === 'FileError') {
      return ERROR_TYPE_IO;
    }
    return ERROR_TYPE_UNKNOWN;
  }

  public static normalize(error: Error | undefined): Error {
    return error === undefined ? new Error('undefined failure') : error;
  }

  public static phaseOf(type: string): string {
    if (type === ERROR_TYPE_PARSE) {
      return PHASE_PARSE;
    }
    if (type === ERROR_TYPE_IO) {
      return PHASE_IO;
    }
    if (type === ERROR_TYPE_NETWORK) {
      return PHASE_NETWORK;
    }
    if (type === ERROR_TYPE_RENDER) {
      return PHASE_RENDER;
    }
    return 'unknown';
  }

  public static isRecoverable(type: string): boolean {
    return type === ERROR_TYPE_NETWORK || type === ERROR_TYPE_IO;
  }

  public static isFatal(type: string): boolean {
    return type === ERROR_TYPE_RENDER || type === ERROR_TYPE_PARSE;
  }
}

// Executes an action and captures failures without leaking them
class TryCatchExecutor {
  private lastError: CapturedError | null = null;
  private successCount: number = 0;
  private failureCount: number = 0;

  public execute(operation: string, phase: string, action: () => void): boolean {
    try {
      action();
      this.successCount++;
      return true;
    } catch (raw) {
      const error = ExceptionClassifier.normalize(raw instanceof Error ? raw : new Error('unknown error'));
      this.lastError = {
        type: ExceptionClassifier.typeOf(error),
        message: error.message,
        phase: phase,
        operation: operation
      };
      this.failureCount++;
      return false;
    }
  }

  public getLastError(): CapturedError | null {
    return this.lastError;
  }

  public getSuccessCount(): number {
    return this.successCount;
  }

  public getFailureCount(): number {
    return this.failureCount;
  }

  public hasFailure(): boolean {
    return this.lastError !== null;
  }

  public clearLastError(): void {
    this.lastError = null;
  }

  public reset(): void {
    this.lastError = null;
    this.successCount = 0;
    this.failureCount = 0;
  }
}

// Provides per-section fallback state for rendering failures
class ErrorBoundary {
  private failures: Map<string, CapturedError> = new Map<string, CapturedError>();

  public capture(section: string, error: Error): void {
    this.failures.set(section, {
      type: ExceptionClassifier.typeOf(error),
      message: error.message,
      phase: PHASE_RENDER,
      operation: section
    });
  }

  public hasFailed(section: string): boolean {
    return this.failures.has(section);
  }

  public failureOf(section: string): CapturedError | undefined {
    return this.failures.get(section);
  }

  public recover(section: string): boolean {
    return this.failures.delete(section);
  }

  public failedSections(): string[] {
    const result: string[] = [];
    this.failures.forEach((error: CapturedError, section: string) => {
      result.push(section);
    });
    return result;
  }

  public size(): number {
    return this.failures.size;
  }

  public clear(): void {
    this.failures = new Map<string, CapturedError>();
  }
}

// Keeps a bounded log of unhandled failures for diagnostics
class UnhandledErrorLog {
  private entries: CapturedError[] = [];
  private readonly capacity: number;
  private dropped: number = 0;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public record(error: CapturedError): void {
    if (this.capacity <= 0) {
      this.dropped++;
      return;
    }
    if (this.entries.length >= this.capacity) {
      this.entries.shift();
      this.dropped++;
    }
    this.entries.push(error);
  }

  public size(): number {
    return this.entries.length;
  }

  public getDropped(): number {
    return this.dropped;
  }

  public latest(): CapturedError | undefined {
    return this.entries.length === 0 ? undefined : this.entries[this.entries.length - 1];
  }

  public countByType(type: string): number {
    let count: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].type === type) {
        count++;
      }
    }
    return count;
  }

  public entriesSnapshot(): CapturedError[] {
    return [...this.entries];
  }

  public clear(): void {
    this.entries = [];
    this.dropped = 0;
  }
}

// Runs cleanup after failures and tracks whether it succeeded
class FailureCleanupCoordinator {
  private cleaned: number = 0;
  private cleanupFailures: number = 0;

  public cleanup(action: () => void): boolean {
    try {
      action();
      this.cleaned++;
      return true;
    } catch (error) {
      this.cleanupFailures++;
      return false;
    }
  }

  public getCleaned(): number {
    return this.cleaned;
  }

  public getCleanupFailures(): number {
    return this.cleanupFailures;
  }

  public reset(): void {
    this.cleaned = 0;
    this.cleanupFailures = 0;
  }
}

export default function exceptionHandlingTest() {
  describe('ExceptionHandling_Test', () => {

    it('classifier_should_map_error_names', 0, () => {
      expect(ExceptionClassifier.typeOf(new SyntaxError('bad json'))).assertEqual(ERROR_TYPE_PARSE);
      expect(ExceptionClassifier.typeOf(new TypeError('bad node'))).assertEqual(ERROR_TYPE_RENDER);
      const ioError = new Error('read failed');
      ioError.name = 'IoError';
      expect(ExceptionClassifier.typeOf(ioError)).assertEqual(ERROR_TYPE_IO);
      const networkError = new Error('offline');
      networkError.name = 'NetworkError';
      expect(ExceptionClassifier.typeOf(networkError)).assertEqual(ERROR_TYPE_NETWORK);
      expect(ExceptionClassifier.typeOf(new Error('plain'))).assertEqual(ERROR_TYPE_UNKNOWN);
    });

    it('classifier_should_map_phases', 0, () => {
      expect(ExceptionClassifier.phaseOf(ERROR_TYPE_PARSE)).assertEqual(PHASE_PARSE);
      expect(ExceptionClassifier.phaseOf(ERROR_TYPE_IO)).assertEqual(PHASE_IO);
      expect(ExceptionClassifier.phaseOf(ERROR_TYPE_NETWORK)).assertEqual(PHASE_NETWORK);
      expect(ExceptionClassifier.phaseOf(ERROR_TYPE_RENDER)).assertEqual(PHASE_RENDER);
      expect(ExceptionClassifier.phaseOf(ERROR_TYPE_UNKNOWN)).assertEqual('unknown');
    });

    it('classifier_should_classify_recoverability', 0, () => {
      expect(ExceptionClassifier.isRecoverable(ERROR_TYPE_NETWORK)).assertTrue();
      expect(ExceptionClassifier.isRecoverable(ERROR_TYPE_IO)).assertTrue();
      expect(ExceptionClassifier.isRecoverable(ERROR_TYPE_PARSE)).assertFalse();
      expect(ExceptionClassifier.isFatal(ERROR_TYPE_RENDER)).assertTrue();
      expect(ExceptionClassifier.isFatal(ERROR_TYPE_PARSE)).assertTrue();
      expect(ExceptionClassifier.isFatal(ERROR_TYPE_NETWORK)).assertFalse();
    });

    it('classifier_should_normalize_undefined', 0, () => {
      const normalized = ExceptionClassifier.normalize(undefined);
      expect(normalized.message).assertEqual('undefined failure');
      expect(ExceptionClassifier.typeOf(normalized)).assertEqual(ERROR_TYPE_UNKNOWN);
      const original = new Error('original');
      expect(ExceptionClassifier.normalize(original) === original).assertTrue();
    });

    it('executor_should_capture_failure', 0, () => {
      const executor = new TryCatchExecutor();
      const success = executor.execute('parseConfig', PHASE_PARSE, () => {
        throw new SyntaxError('bad config');
      });
      expect(success).assertFalse();
      expect(executor.hasFailure()).assertTrue();
      expect(executor.getFailureCount()).assertEqual(1);
      expect(executor.getSuccessCount()).assertEqual(0);
      const error = executor.getLastError() as CapturedError;
      expect(error.type).assertEqual(ERROR_TYPE_PARSE);
      expect(error.phase).assertEqual(PHASE_PARSE);
      expect(error.operation).assertEqual('parseConfig');
    });

    it('executor_should_count_successes', 0, () => {
      const executor = new TryCatchExecutor();
      expect(executor.execute('noop', PHASE_RENDER, () => {
      })).assertTrue();
      expect(executor.execute('noop2', PHASE_RENDER, () => {
      })).assertTrue();
      expect(executor.getSuccessCount()).assertEqual(2);
      expect(executor.getFailureCount()).assertEqual(0);
      expect(executor.getLastError() === null).assertTrue();
    });

    it('executor_should_continue_after_failure', 0, () => {
      const executor = new TryCatchExecutor();
      executor.execute('first', PHASE_NETWORK, () => {
        throw new Error('network down');
      });
      expect(executor.execute('second', PHASE_IO, () => {
      })).assertTrue();
      expect(executor.getFailureCount()).assertEqual(1);
      expect(executor.getSuccessCount()).assertEqual(1);
      executor.clearLastError();
      expect(executor.hasFailure()).assertFalse();
      executor.reset();
      expect(executor.getFailureCount()).assertEqual(0);
    });

    it('executor_should_normalize_generic_throws', 0, () => {
      const executor = new TryCatchExecutor();
      expect(executor.execute('genericThrow', PHASE_RENDER, () => {
        throw new Error('generic failure');
      })).assertFalse();
      const error = executor.getLastError() as CapturedError;
      expect(error.message).assertContain('generic failure');
      expect(error.type).assertEqual(ERROR_TYPE_UNKNOWN);
      expect(ExceptionClassifier.normalize(undefined).message).assertEqual('undefined failure');
    });

    it('boundary_should_capture_per_section', 0, () => {
      const boundary = new ErrorBoundary();
      boundary.capture('list', new TypeError('render failed'));
      boundary.capture('header', new Error('header failed'));
      expect(boundary.hasFailed('list')).assertTrue();
      expect(boundary.hasFailed('footer')).assertFalse();
      expect(boundary.size()).assertEqual(2);
      expect(boundary.failedSections().length).assertEqual(2);
      expect((boundary.failureOf('list') as CapturedError).type).assertEqual(ERROR_TYPE_RENDER);
    });

    it('boundary_should_recover_and_clear', 0, () => {
      const boundary = new ErrorBoundary();
      boundary.capture('list', new Error('failed'));
      expect(boundary.recover('list')).assertTrue();
      expect(boundary.recover('list')).assertFalse();
      expect(boundary.hasFailed('list')).assertFalse();
      boundary.capture('detail', new Error('failed'));
      boundary.clear();
      expect(boundary.size()).assertEqual(0);
      expect(boundary.failureOf('detail') === undefined).assertTrue();
    });

    it('error_log_should_be_bounded', 0, () => {
      const log = new UnhandledErrorLog(2);
      log.record({ type: ERROR_TYPE_PARSE, message: 'a', phase: PHASE_PARSE, operation: 'op1' });
      log.record({ type: ERROR_TYPE_IO, message: 'b', phase: PHASE_IO, operation: 'op2' });
      expect(log.size()).assertEqual(2);
      log.record({ type: ERROR_TYPE_NETWORK, message: 'c', phase: PHASE_NETWORK, operation: 'op3' });
      expect(log.size()).assertEqual(2);
      expect(log.getDropped()).assertEqual(1);
      expect((log.latest() as CapturedError).type).assertEqual(ERROR_TYPE_NETWORK);
      expect(log.countByType(ERROR_TYPE_PARSE)).assertEqual(0);
      expect(log.countByType(ERROR_TYPE_IO)).assertEqual(1);
    });

    it('error_log_should_handle_zero_capacity', 0, () => {
      const log = new UnhandledErrorLog(0);
      log.record({ type: ERROR_TYPE_PARSE, message: 'a', phase: PHASE_PARSE, operation: 'op' });
      expect(log.size()).assertEqual(0);
      expect(log.getDropped()).assertEqual(1);
      expect(log.latest() === undefined).assertTrue();
      log.clear();
      expect(log.getDropped()).assertEqual(0);
    });

    it('cleanup_should_run_after_failure', 0, () => {
      const cleanup = new FailureCleanupCoordinator();
      expect(cleanup.cleanup(() => {
      })).assertTrue();
      expect(cleanup.getCleaned()).assertEqual(1);
      expect(cleanup.cleanup(() => {
        throw new Error('cleanup failed');
      })).assertFalse();
      expect(cleanup.getCleanupFailures()).assertEqual(1);
      cleanup.reset();
      expect(cleanup.getCleaned()).assertEqual(0);
      expect(cleanup.getCleanupFailures()).assertEqual(0);
    });

    it('exception_pipeline_should_log_and_cleanup', 0, () => {
      const executor = new TryCatchExecutor();
      const log = new UnhandledErrorLog(5);
      const cleanup = new FailureCleanupCoordinator();
      const success = executor.execute('submit', PHASE_NETWORK, () => {
        throw new Error('upload failed');
      });
      if (!success) {
        const captured = executor.getLastError() as CapturedError;
        log.record(captured);
        cleanup.cleanup(() => {
        });
      }
      expect(log.size()).assertEqual(1);
      expect(cleanup.getCleaned()).assertEqual(1);
      expect((log.latest() as CapturedError).operation).assertEqual('submit');
      expect(ExceptionClassifier.isRecoverable((log.latest() as CapturedError).type)).assertFalse();
    });

    it('exception_constants_should_be_stable', 0, () => {
      expect(PHASE_PARSE).assertEqual('parse');
      expect(PHASE_IO).assertEqual('io');
      expect(PHASE_NETWORK).assertEqual('network');
      expect(PHASE_RENDER).assertEqual('render');
      expect(ERROR_TYPE_UNKNOWN).assertEqual('UnknownError');
    });
  });
}

