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

import { describe, it, expect, beforeEach } from '@ohos/hypium';

const ERROR_NETWORK: number = -1;

const ERROR_SERVER: number = 500;

const ERROR_BAD_REQUEST: number = 400;

const ERROR_UNAUTHORIZED: number = 401;

const ERROR_NOT_FOUND: number = 404;

const MAX_RETRY_ATTEMPTS: number = 3;

const BASE_BACKOFF_MS: number = 500;

const MAX_BACKOFF_MS: number = 4000;

interface RecoveryAttempt {
  attempt: number;
  delayMs: number;
  errorCode: number;
}

// Classifies business errors into recoverable categories
class ErrorClassifier {
  public static readonly NETWORK: string = 'network';

  public static readonly SERVER: string = 'server';

  public static readonly CLIENT: string = 'client';

  public static readonly UNKNOWN: string = 'unknown';

  public static classify(code: number): string {
    if (code === ERROR_NETWORK || code === ERROR_UNAUTHORIZED) {
      return ErrorClassifier.NETWORK;
    }
    if (code >= 500 && code < 600) {
      return ErrorClassifier.SERVER;
    }
    if (code >= 400 && code < 500) {
      return ErrorClassifier.CLIENT;
    }
    return ErrorClassifier.UNKNOWN;
  }

  public static isRecoverable(code: number): boolean {
    const category = ErrorClassifier.classify(code);
    return category === ErrorClassifier.NETWORK || category === ErrorClassifier.SERVER;
  }

  public static isAuthFailure(code: number): boolean {
    return code === ERROR_UNAUTHORIZED;
  }

  public static isClientFault(code: number): boolean {
    return code === ERROR_BAD_REQUEST || code === ERROR_NOT_FOUND;
  }
}

// Computes capped exponential backoff for retries
class RetryPolicyEngine {
  private attempts: RecoveryAttempt[] = [];
  private readonly maxAttempts: number;

  constructor(maxAttempts: number = MAX_RETRY_ATTEMPTS) {
    this.maxAttempts = maxAttempts;
  }

  public canRetry(errorCode: number): boolean {
    return this.attempts.length < this.maxAttempts && ErrorClassifier.isRecoverable(errorCode);
  }

  public nextDelay(attempt: number): number {
    if (attempt <= 0) {
      return BASE_BACKOFF_MS;
    }
    let delay = BASE_BACKOFF_MS;
    for (let i = 0; i < attempt; i++) {
      delay = delay * 2;
    }
    return delay > MAX_BACKOFF_MS ? MAX_BACKOFF_MS : delay;
  }

  public record(errorCode: number): RecoveryAttempt {
    const attempt = this.attempts.length + 1;
    const entry: RecoveryAttempt = {
      attempt: attempt,
      delayMs: this.nextDelay(attempt - 1),
      errorCode: errorCode
    };
    this.attempts.push(entry);
    return entry;
  }

  public getAttempts(): RecoveryAttempt[] {
    return [...this.attempts];
  }

  public getAttemptCount(): number {
    return this.attempts.length;
  }

  public isExhausted(): boolean {
    return this.attempts.length >= this.maxAttempts;
  }

  public getLastError(): number {
    return this.attempts.length === 0 ? 0 : this.attempts[this.attempts.length - 1].errorCode;
  }

  public reset(): void {
    this.attempts = [];
  }
}

// Models the upload recovery state machine
class UploadRecoveryState {
  public static readonly IDLE: string = 'idle';

  public static readonly UPLOADING: string = 'uploading';

  public static readonly FAILED: string = 'failed';

  public static readonly RETRYING: string = 'retrying';

  public static readonly SUCCESS: string = 'success';

  private state: string = UploadRecoveryState.IDLE;

  public transition(next: string): boolean {
    if (this.state === UploadRecoveryState.IDLE && next === UploadRecoveryState.UPLOADING) {
      this.state = next;
      return true;
    }
    if (this.state === UploadRecoveryState.UPLOADING &&
      (next === UploadRecoveryState.SUCCESS || next === UploadRecoveryState.FAILED)) {
      this.state = next;
      return true;
    }
    if (this.state === UploadRecoveryState.FAILED && next === UploadRecoveryState.RETRYING) {
      this.state = next;
      return true;
    }
    if (this.state === UploadRecoveryState.RETRYING &&
      (next === UploadRecoveryState.UPLOADING || next === UploadRecoveryState.FAILED)) {
      this.state = next;
      return true;
    }
    if (this.state === UploadRecoveryState.SUCCESS && next === UploadRecoveryState.UPLOADING) {
      this.state = next;
      return true;
    }
    return false;
  }

  public getState(): string {
    return this.state;
  }

  public isTerminal(): boolean {
    return this.state === UploadRecoveryState.SUCCESS || this.state === UploadRecoveryState.FAILED;
  }

  public canRetry(): boolean {
    return this.state === UploadRecoveryState.FAILED;
  }

  public reset(): void {
    this.state = UploadRecoveryState.IDLE;
  }
}

// Tries fallback strategies in priority order
class FallbackChain {
  private strategies: string[] = [];
  private active: number = 0;
  private used: string[] = [];

  public add(strategy: string): boolean {
    if (strategy.length === 0 || this.strategies.includes(strategy)) {
      return false;
    }
    this.strategies.push(strategy);
    return true;
  }

  public current(): string {
    return this.strategies.length === 0 ? '' : this.strategies[this.active];
  }

  public advance(): string {
    if (this.active < this.strategies.length - 1) {
      this.used.push(this.strategies[this.active]);
      this.active++;
    }
    return this.current();
  }

  public hasNext(): boolean {
    return this.active < this.strategies.length - 1;
  }

  public getUsed(): string[] {
    return [...this.used];
  }

  public size(): number {
    return this.strategies.length;
  }

  public reset(): void {
    this.active = 0;
    this.used = [];
  }
}

// Records failures for diagnostics
class RecoveryJournal {
  private entries: number[] = [];

  public record(code: number): void {
    this.entries.push(code);
  }

  public count(): number {
    return this.entries.length;
  }

  public countByCategory(category: string): number {
    let count: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (ErrorClassifier.classify(this.entries[i]) === category) {
        count++;
      }
    }
    return count;
  }

  public getLast(): number {
    return this.entries.length === 0 ? 0 : this.entries[this.entries.length - 1];
  }

  public getEntries(): number[] {
    return [...this.entries];
  }

  public clear(): void {
    this.entries = [];
  }
}

export default function errorRecoveryTest() {
  describe('ErrorRecovery_Test', () => {
    let journal: RecoveryJournal;

    beforeEach(() => {
      journal = new RecoveryJournal();
    });

    it('error_classifier_should_map_network_errors', 0, () => {
      expect(ErrorClassifier.classify(ERROR_NETWORK)).assertEqual(ErrorClassifier.NETWORK);
      expect(ErrorClassifier.classify(ERROR_UNAUTHORIZED)).assertEqual(ErrorClassifier.NETWORK);
      expect(ErrorClassifier.isRecoverable(ERROR_NETWORK)).assertTrue();
      expect(ErrorClassifier.isRecoverable(ERROR_UNAUTHORIZED)).assertTrue();
    });

    it('error_classifier_should_map_server_errors', 0, () => {
      expect(ErrorClassifier.classify(ERROR_SERVER)).assertEqual(ErrorClassifier.SERVER);
      expect(ErrorClassifier.classify(599)).assertEqual(ErrorClassifier.SERVER);
      expect(ErrorClassifier.classify(600)).assertEqual(ErrorClassifier.UNKNOWN);
      expect(ErrorClassifier.isRecoverable(ERROR_SERVER)).assertTrue();
    });

    it('error_classifier_should_map_client_errors', 0, () => {
      expect(ErrorClassifier.classify(ERROR_BAD_REQUEST)).assertEqual(ErrorClassifier.CLIENT);
      expect(ErrorClassifier.classify(ERROR_NOT_FOUND)).assertEqual(ErrorClassifier.CLIENT);
      expect(ErrorClassifier.isRecoverable(ERROR_BAD_REQUEST)).assertFalse();
      expect(ErrorClassifier.isClientFault(ERROR_NOT_FOUND)).assertTrue();
    });

    it('error_classifier_should_detect_auth_failure', 0, () => {
      expect(ErrorClassifier.isAuthFailure(ERROR_UNAUTHORIZED)).assertTrue();
      expect(ErrorClassifier.isAuthFailure(ERROR_SERVER)).assertFalse();
      expect(ErrorClassifier.isAuthFailure(ERROR_NETWORK)).assertFalse();
      expect(ErrorClassifier.classify(0)).assertEqual(ErrorClassifier.UNKNOWN);
    });

    it('retry_policy_should_allow_limited_attempts', 0, () => {
      const policy = new RetryPolicyEngine(3);
      expect(policy.canRetry(ERROR_SERVER)).assertTrue();
      policy.record(ERROR_SERVER);
      policy.record(ERROR_SERVER);
      expect(policy.canRetry(ERROR_SERVER)).assertTrue();
      policy.record(ERROR_SERVER);
      expect(policy.canRetry(ERROR_SERVER)).assertFalse();
      expect(policy.isExhausted()).assertTrue();
      expect(policy.getAttemptCount()).assertEqual(3);
    });

    it('retry_policy_should_not_retry_client_errors', 0, () => {
      const policy = new RetryPolicyEngine(3);
      expect(policy.canRetry(ERROR_BAD_REQUEST)).assertFalse();
      expect(policy.canRetry(ERROR_NOT_FOUND)).assertFalse();
      expect(policy.canRetry(ERROR_NETWORK)).assertTrue();
      expect(policy.getAttemptCount()).assertEqual(0);
    });

    it('retry_policy_should_apply_exponential_backoff', 0, () => {
      const policy = new RetryPolicyEngine(5);
      expect(policy.nextDelay(0)).assertEqual(BASE_BACKOFF_MS);
      expect(policy.nextDelay(1)).assertEqual(BASE_BACKOFF_MS * 2);
      expect(policy.nextDelay(2)).assertEqual(BASE_BACKOFF_MS * 4);
      expect(policy.nextDelay(3)).assertEqual(BASE_BACKOFF_MS * 8);
      expect(policy.nextDelay(10)).assertEqual(MAX_BACKOFF_MS);
    });

    it('retry_policy_should_record_attempts', 0, () => {
      const policy = new RetryPolicyEngine(3);
      const first = policy.record(ERROR_NETWORK);
      expect(first.attempt).assertEqual(1);
      expect(first.delayMs).assertEqual(BASE_BACKOFF_MS);
      const second = policy.record(ERROR_SERVER);
      expect(second.attempt).assertEqual(2);
      expect(second.delayMs).assertEqual(BASE_BACKOFF_MS * 2);
      expect(policy.getLastError()).assertEqual(ERROR_SERVER);
      expect(policy.getAttempts().length).assertEqual(2);
    });

    it('retry_policy_should_reset_after_success', 0, () => {
      const policy = new RetryPolicyEngine(2);
      policy.record(ERROR_SERVER);
      policy.record(ERROR_SERVER);
      expect(policy.isExhausted()).assertTrue();
      policy.reset();
      expect(policy.getAttemptCount()).assertEqual(0);
      expect(policy.isExhausted()).assertFalse();
      expect(policy.canRetry(ERROR_SERVER)).assertTrue();
    });

    it('upload_state_should_recover_after_failure', 0, () => {
      const state = new UploadRecoveryState();
      expect(state.getState()).assertEqual(UploadRecoveryState.IDLE);
      expect(state.transition(UploadRecoveryState.UPLOADING)).assertTrue();
      expect(state.transition(UploadRecoveryState.FAILED)).assertTrue();
      expect(state.isTerminal()).assertTrue();
      expect(state.canRetry()).assertTrue();
      expect(state.transition(UploadRecoveryState.RETRYING)).assertTrue();
      expect(state.transition(UploadRecoveryState.UPLOADING)).assertTrue();
      expect(state.transition(UploadRecoveryState.SUCCESS)).assertTrue();
      expect(state.isTerminal()).assertTrue();
      expect(state.canRetry()).assertFalse();
    });

    it('upload_state_should_reject_invalid_transitions', 0, () => {
      const state = new UploadRecoveryState();
      expect(state.transition(UploadRecoveryState.SUCCESS)).assertFalse();
      expect(state.transition(UploadRecoveryState.FAILED)).assertFalse();
      expect(state.getState()).assertEqual(UploadRecoveryState.IDLE);
      state.transition(UploadRecoveryState.UPLOADING);
      expect(state.transition(UploadRecoveryState.RETRYING)).assertFalse();
      expect(state.transition(UploadRecoveryState.UPLOADING)).assertFalse();
      state.reset();
      expect(state.getState()).assertEqual(UploadRecoveryState.IDLE);
    });

    it('fallback_chain_should_advance_in_order', 0, () => {
      const chain = new FallbackChain();
      expect(chain.add('primary')).assertTrue();
      expect(chain.add('secondary')).assertTrue();
      expect(chain.add('cache')).assertTrue();
      expect(chain.add('primary')).assertFalse();
      expect(chain.size()).assertEqual(3);
      expect(chain.current()).assertEqual('primary');
      expect(chain.advance()).assertEqual('secondary');
      expect(chain.advance()).assertEqual('cache');
      expect(chain.hasNext()).assertFalse();
      expect(chain.advance()).assertEqual('cache');
      expect(chain.getUsed().length).assertEqual(2);
    });

    it('fallback_chain_should_reject_empty_strategies', 0, () => {
      const chain = new FallbackChain();
      expect(chain.add('')).assertFalse();
      expect(chain.size()).assertEqual(0);
      expect(chain.current()).assertEqual('');
      expect(chain.hasNext()).assertFalse();
      chain.add('only');
      expect(chain.current()).assertEqual('only');
      expect(chain.advance()).assertEqual('only');
      chain.reset();
      expect(chain.current()).assertEqual('only');
      expect(chain.getUsed().length).assertEqual(0);
    });

    it('journal_should_count_failures_by_category', 0, () => {
      journal.record(ERROR_NETWORK);
      journal.record(ERROR_SERVER);
      journal.record(ERROR_BAD_REQUEST);
      journal.record(ERROR_SERVER);
      expect(journal.count()).assertEqual(4);
      expect(journal.countByCategory(ErrorClassifier.SERVER)).assertEqual(2);
      expect(journal.countByCategory(ErrorClassifier.NETWORK)).assertEqual(1);
      expect(journal.countByCategory(ErrorClassifier.CLIENT)).assertEqual(1);
      expect(journal.countByCategory(ErrorClassifier.UNKNOWN)).assertEqual(0);
      expect(journal.getLast()).assertEqual(ERROR_SERVER);
    });

    it('journal_should_reset_and_copy_entries', 0, () => {
      journal.record(ERROR_NETWORK);
      const entries = journal.getEntries();
      entries.push(ERROR_SERVER);
      expect(journal.count()).assertEqual(1);
      expect(entries.length).assertEqual(2);
      journal.clear();
      expect(journal.count()).assertEqual(0);
      expect(journal.getLast()).assertEqual(0);
      expect(journal.getEntries().length).assertEqual(0);
    });

    it('recovery_flow_should_retry_until_success', 0, () => {
      const policy = new RetryPolicyEngine(3);
      const state = new UploadRecoveryState();
      state.transition(UploadRecoveryState.UPLOADING);
      let attempts: number = 0;
      while (policy.canRetry(ERROR_SERVER) && attempts < 5) {
        policy.record(ERROR_SERVER);
        attempts++;
      }
      expect(attempts).assertEqual(3);
      expect(policy.isExhausted()).assertTrue();
      state.transition(UploadRecoveryState.FAILED);
      state.transition(UploadRecoveryState.RETRYING);
      state.transition(UploadRecoveryState.UPLOADING);
      state.transition(UploadRecoveryState.SUCCESS);
      expect(state.getState()).assertEqual(UploadRecoveryState.SUCCESS);
      expect(policy.getAttempts().length).assertEqual(3);
    });

    it('recovery_flow_should_fallback_to_cache', 0, () => {
      const chain = new FallbackChain();
      chain.add('server');
      chain.add('localCache');
      let resolved = '';
      while (resolved === '') {
        const current = chain.current();
        if (current === 'server') {
          chain.advance();
          continue;
        }
        resolved = current;
      }
      expect(resolved).assertEqual('localCache');
      expect(chain.getUsed()).assertDeepEquals(['server']);
    });
  });
}


