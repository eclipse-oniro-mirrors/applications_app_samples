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

const MAX_KEYS: number = 32;

interface ConfigPair {
  key: string;
  local: string;
  remote: string;
}

interface Mismatch {
  key: string;
  local: string;
  remote: string;
}

// Compares local and remote configuration values
class ConfigConsistencyChecker {
  private pairs: Map<string, ConfigPair> = new Map<string, ConfigPair>();

  public add(key: string, local: string, remote: string): boolean {
    if (key.length === 0 || this.pairs.has(key) || this.pairs.size >= MAX_KEYS) {
      return false;
    }
    this.pairs.set(key, { key: key, local: local, remote: remote });
    return true;
  }

  public mismatches(): Mismatch[] {
    const result: Mismatch[] = [];
    this.pairs.forEach((pair: ConfigPair) => {
      if (pair.local !== pair.remote) {
        result.push({ key: pair.key, local: pair.local, remote: pair.remote });
      }
    });
    return result;
  }

  public isConsistent(): boolean {
    return this.mismatches().length === 0;
  }

  public count(): number {
    return this.pairs.size;
  }

  public mismatchCount(): number {
    return this.mismatches().length;
  }

  public hasKey(key: string): boolean {
    return this.pairs.has(key);
  }

  public localOf(key: string): string {
    const pair = this.pairs.get(key);
    return pair === undefined ? '' : pair.local;
  }

  public remoteOf(key: string): string {
    const pair = this.pairs.get(key);
    return pair === undefined ? '' : pair.remote;
  }

  public keys(): string[] {
    const result: string[] = [];
    this.pairs.forEach((pair: ConfigPair, key: string) => {
      result.push(key);
    });
    return result;
  }

  public clear(): void {
    this.pairs = new Map<string, ConfigPair>();
  }
}

// Plans updates from the mismatch list
class ConfigSyncPlan {
  private updates: Mismatch[] = [];

  public build(mismatches: Mismatch[]): void {
    this.updates = [];
    for (let i = 0; i < mismatches.length; i++) {
      if (mismatches[i].key.length > 0 && mismatches[i].remote.length > 0) {
        this.updates.push(mismatches[i]);
      }
    }
  }

  public count(): number {
    return this.updates.length;
  }

  public keys(): string[] {
    return this.updates.map((update: Mismatch) => update.key);
  }

  public contains(key: string): boolean {
    for (let i = 0; i < this.updates.length; i++) {
      if (this.updates[i].key === key) {
        return true;
      }
    }
    return false;
  }

  public isEmpty(): boolean {
    return this.updates.length === 0;
  }

  public summary(): string {
    return `updates=${this.updates.length}`;
  }

  public clear(): void {
    this.updates = [];
  }
}

// Verifies applied updates produce a consistent state
class ConfigApplyVerifier {
  public static apply(count: number, failures: number): boolean {
    return failures === 0 && count >= 0;
  }

  public static isFullyApplied(expected: number, applied: number): boolean {
    return expected >= 0 && applied === expected;
  }

  public static retryNeeded(applied: number, expected: number): boolean {
    return applied < expected;
  }

  public static successRate(expected: number, applied: number): number {
    return expected <= 0 ? 0 : applied * 100 / expected;
  }
}

export default function configurationConsistencyTest() {
  describe('ConfigurationConsistency_Test', () => {

    it('checker_should_add_pairs', 0, () => {
      const checker = new ConfigConsistencyChecker();
      expect(checker.add('baseUrl', 'local', 'remote')).assertTrue();
      expect(checker.add('baseUrl', 'a', 'b')).assertFalse();
      expect(checker.add('', 'a', 'b')).assertFalse();
      expect(checker.count()).assertEqual(1);
      expect(checker.hasKey('baseUrl')).assertTrue();
      expect(checker.localOf('baseUrl')).assertEqual('local');
      expect(checker.remoteOf('baseUrl')).assertEqual('remote');
    });

    it('checker_should_detect_mismatches', 0, () => {
      const checker = new ConfigConsistencyChecker();
      checker.add('same', 'v', 'v');
      checker.add('diff', 'local', 'remote');
      expect(checker.count()).assertEqual(2);
      expect(checker.mismatchCount()).assertEqual(1);
      expect(checker.isConsistent()).assertFalse();
      const mismatches = checker.mismatches();
      expect(mismatches.length).assertEqual(1);
      expect(mismatches[0].key).assertEqual('diff');
      expect(mismatches[0].local).assertEqual('local');
      expect(mismatches[0].remote).assertEqual('remote');
    });

    it('checker_should_report_consistency', 0, () => {
      const checker = new ConfigConsistencyChecker();
      checker.add('a', '1', '1');
      checker.add('b', '2', '2');
      expect(checker.isConsistent()).assertTrue();
      expect(checker.mismatchCount()).assertEqual(0);
      expect(checker.keys().length).assertEqual(2);
      expect(checker.localOf('missing')).assertEqual('');
      expect(checker.remoteOf('missing')).assertEqual('');
      checker.clear();
      expect(checker.count()).assertEqual(0);
    });

    it('checker_should_enforce_key_limit', 0, () => {
      const checker = new ConfigConsistencyChecker();
      for (let i = 0; i < MAX_KEYS; i++) {
        expect(checker.add(`key-${i}`, 'a', 'a')).assertTrue();
      }
      expect(checker.add('overflow', 'a', 'a')).assertFalse();
      expect(checker.count()).assertEqual(MAX_KEYS);
    });

    it('plan_should_update_all_mismatches', 0, () => {
      const plan = new ConfigSyncPlan();
      plan.build([
        { key: 'a', local: '1', remote: '2' },
        { key: 'b', local: '3', remote: '4' }
      ]);
      expect(plan.count()).assertEqual(2);
      expect(plan.keys()).assertDeepEquals(['a', 'b']);
      expect(plan.contains('a')).assertTrue();
      expect(plan.contains('missing')).assertFalse();
      expect(plan.isEmpty()).assertFalse();
      expect(plan.summary()).assertEqual('updates=2');
    });

    it('plan_should_skip_invalid_updates', 0, () => {
      const plan = new ConfigSyncPlan();
      plan.build([
        { key: '', local: '1', remote: '2' },
        { key: 'b', local: '3', remote: '' },
        { key: 'c', local: '5', remote: '6' }
      ]);
      expect(plan.count()).assertEqual(1);
      expect(plan.keys()).assertDeepEquals(['c']);
      plan.clear();
      expect(plan.isEmpty()).assertTrue();
      expect(plan.summary()).assertEqual('updates=0');
    });

    it('verifier_should_check_apply_result', 0, () => {
      expect(ConfigApplyVerifier.apply(2, 0)).assertTrue();
      expect(ConfigApplyVerifier.apply(2, 1)).assertFalse();
      expect(ConfigApplyVerifier.apply(-1, 0)).assertFalse();
      expect(ConfigApplyVerifier.isFullyApplied(2, 2)).assertTrue();
      expect(ConfigApplyVerifier.isFullyApplied(2, 1)).assertFalse();
      expect(ConfigApplyVerifier.retryNeeded(1, 2)).assertTrue();
      expect(ConfigApplyVerifier.retryNeeded(2, 2)).assertFalse();
    });

    it('verifier_should_compute_success_rate', 0, () => {
      expect(ConfigApplyVerifier.successRate(2, 2)).assertEqual(100);
      expect(ConfigApplyVerifier.successRate(2, 1)).assertEqual(50);
      expect(ConfigApplyVerifier.successRate(0, 0)).assertEqual(0);
      expect(ConfigApplyVerifier.successRate(4, 0)).assertEqual(0);
    });

    it('consistency_flow_should_sync_config', 0, () => {
      const checker = new ConfigConsistencyChecker();
      const plan = new ConfigSyncPlan();
      checker.add('baseUrl', 'http://old/', 'http://new/');
      checker.add('timeout', '30', '30');
      checker.add('retry', '1', '3');
      const mismatches = checker.mismatches();
      expect(mismatches.length).assertEqual(2);
      plan.build(mismatches);
      expect(plan.count()).assertEqual(2);
      expect(plan.contains('baseUrl')).assertTrue();
      expect(plan.contains('retry')).assertTrue();
      expect(plan.contains('timeout')).assertFalse();
      const applied = plan.count();
      expect(ConfigApplyVerifier.apply(applied, 0)).assertTrue();
      expect(ConfigApplyVerifier.isFullyApplied(applied, applied)).assertTrue();
      expect(ConfigApplyVerifier.successRate(applied, applied)).assertEqual(100);
    });

    it('consistency_constants_should_be_stable', 0, () => {
      expect(MAX_KEYS).assertEqual(32);
    });
  });
}

