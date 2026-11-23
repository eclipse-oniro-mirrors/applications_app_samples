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
import {
  BUNDLE_NAME, ABILITY_MAIN, MODULE_ENTRY, RESULT_CODE, CONNECTION_NUMBER, ACCOUNT_ID
} from '../Shared/SharedDriver';

enum RuleKind {
  RESULT_CODE_RANGE = 0,
  CONNECTION_NON_NEGATIVE = 1,
  LABEL_NON_EMPTY = 2,
  ABILITY_NAME_MATCH = 3
}

class ContextSnapshot {
  readonly abilityName: string;
  readonly missionLabel: string;
  readonly resultCode: number;
  readonly connectionCount: number;
  readonly terminating: boolean;

  constructor(abilityName: string, missionLabel: string, resultCode: number,
    connectionCount: number, terminating: boolean) {
    this.abilityName = abilityName;
    this.missionLabel = missionLabel;
    this.resultCode = resultCode;
    this.connectionCount = connectionCount;
    this.terminating = terminating;
  }

  digest(): string {
    return `${this.abilityName}|${this.missionLabel}|${this.resultCode}|${this.connectionCount}|${this.terminating}`;
  }

  equals(other: ContextSnapshot): boolean {
    return this.abilityName === other.abilityName &&
      this.missionLabel === other.missionLabel &&
      this.resultCode === other.resultCode &&
      this.connectionCount === other.connectionCount &&
      this.terminating === other.terminating;
  }

  withResultCode(code: number): ContextSnapshot {
    return new ContextSnapshot(this.abilityName, this.missionLabel, code,
      this.connectionCount, this.terminating);
  }

  withConnectionCount(count: number): ContextSnapshot {
    return new ContextSnapshot(this.abilityName, this.missionLabel, this.resultCode,
      count, this.terminating);
  }

  withTerminating(terminating: boolean): ContextSnapshot {
    return new ContextSnapshot(this.abilityName, this.missionLabel, this.resultCode,
      this.connectionCount, terminating);
  }
}

class Violation {
  readonly rule: RuleKind;
  readonly detail: string;

  constructor(rule: RuleKind, detail: string) {
    this.rule = rule;
    this.detail = detail;
  }

  describe(): string {
    return `${this.rule}:${this.detail}`;
  }
}

class ConsistencyChecker {
  check(snapshot: ContextSnapshot): Violation[] {
    const violations: Violation[] = [];
    if (snapshot.resultCode < 0 || snapshot.resultCode > 1000) {
      violations.push(new Violation(RuleKind.RESULT_CODE_RANGE,
        `resultCode out of range: ${snapshot.resultCode}`));
    }
    if (snapshot.connectionCount < 0) {
      violations.push(new Violation(RuleKind.CONNECTION_NON_NEGATIVE,
        `connectionCount negative: ${snapshot.connectionCount}`));
    }
    if (snapshot.missionLabel.trim().length === 0) {
      violations.push(new Violation(RuleKind.LABEL_NON_EMPTY, 'missionLabel empty'));
    }
    if (snapshot.abilityName !== ABILITY_MAIN) {
      violations.push(new Violation(RuleKind.ABILITY_NAME_MATCH,
        `abilityName mismatch: ${snapshot.abilityName}`));
    }
    return violations;
  }

  isConsistent(snapshot: ContextSnapshot): boolean {
    return this.check(snapshot).length === 0;
  }

  countByRule(violations: Violation[], rule: RuleKind): number {
    let count = 0;
    for (const violation of violations) {
      if (violation.rule === rule) {
        count += 1;
      }
    }
    return count;
  }
}

class SnapshotStore {
  private snapshots: ContextSnapshot[] = [];

  push(snapshot: ContextSnapshot): void {
    this.snapshots.push(snapshot);
  }

  size(): number {
    return this.snapshots.length;
  }

  latest(): ContextSnapshot | null {
    if (this.snapshots.length === 0) {
      return null;
    }
    return this.snapshots[this.snapshots.length - 1];
  }

  previous(): ContextSnapshot | null {
    if (this.snapshots.length < 2) {
      return null;
    }
    return this.snapshots[this.snapshots.length - 2];
  }

  allDigestsEqual(): boolean {
    if (this.snapshots.length < 2) {
      return true;
    }
    const first = this.snapshots[0].digest();
    for (const snapshot of this.snapshots) {
      if (snapshot.digest() !== first) {
        return false;
      }
    }
    return true;
  }

  distinctDigestCount(): number {
    const digests: string[] = [];
    for (const snapshot of this.snapshots) {
      if (digests.indexOf(snapshot.digest()) < 0) {
        digests.push(snapshot.digest());
      }
    }
    return digests.length;
  }

  clear(): void {
    this.snapshots = [];
  }
}

class StateReconciler {
  reconcile(expected: ContextSnapshot, actual: ContextSnapshot): number {
    let differences = 0;
    if (expected.abilityName !== actual.abilityName) {
      differences += 1;
    }
    if (expected.missionLabel !== actual.missionLabel) {
      differences += 1;
    }
    if (expected.resultCode !== actual.resultCode) {
      differences += 1;
    }
    if (expected.connectionCount !== actual.connectionCount) {
      differences += 1;
    }
    if (expected.terminating !== actual.terminating) {
      differences += 1;
    }
    return differences;
  }

  matches(expected: ContextSnapshot, actual: ContextSnapshot): boolean {
    return this.reconcile(expected, actual) === 0;
  }

  merged(expected: ContextSnapshot, actual: ContextSnapshot): ContextSnapshot {
    const label = actual.missionLabel.length > 0 ? actual.missionLabel : expected.missionLabel;
    const code = actual.resultCode >= 0 ? actual.resultCode : expected.resultCode;
    const connections = actual.connectionCount >= 0 ? actual.connectionCount : expected.connectionCount;
    return new ContextSnapshot(expected.abilityName, label, code, connections,
      actual.terminating || expected.terminating);
  }
}

function buildBaselineSnapshot(): ContextSnapshot {
  return new ContextSnapshot(ABILITY_MAIN, 'StageModelSample', RESULT_CODE,
    CONNECTION_NUMBER, false);
}

export default function abilityContextConsistencyTest(): void {
  describe('AbilityContextConsistencySuite', () => {
    let baseline: ContextSnapshot = buildBaselineSnapshot();

    beforeAll(() => {
      baseline = buildBaselineSnapshot();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'consistency suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'consistency suite end');
    });

    it('AbilityContextConsistency_001', 0, async (done: Function) => {
      expect(baseline.abilityName).assertEqual(ABILITY_MAIN);
      expect(baseline.missionLabel).assertEqual('StageModelSample');
      expect(baseline.resultCode).assertEqual(RESULT_CODE);
      expect(baseline.connectionCount).assertEqual(CONNECTION_NUMBER);
      expect(baseline.terminating).assertFalse();
      done();
    });

    it('AbilityContextConsistency_002', 0, async (done: Function) => {
      expect(baseline.equals(buildBaselineSnapshot())).assertTrue();
      expect(baseline.equals(baseline.withResultCode(200))).assertFalse();
      expect(baseline.digest()).assertEqual('MainAbility|StageModelSample|100|0|false');
      done();
    });

    it('AbilityContextConsistency_003', 0, async (done: Function) => {
      const changed = baseline.withConnectionCount(3);
      expect(changed.connectionCount).assertEqual(3);
      expect(changed.resultCode).assertEqual(baseline.resultCode);
      expect(changed.equals(baseline)).assertFalse();
      expect(changed.digest()).assertEqual('MainAbility|StageModelSample|100|3|false');
      done();
    });

    it('AbilityContextConsistency_004', 0, async (done: Function) => {
      const terminating = baseline.withTerminating(true);
      expect(terminating.terminating).assertTrue();
      expect(terminating.connectionCount).assertEqual(baseline.connectionCount);
      expect(terminating.equals(baseline)).assertFalse();
      expect(terminating.digest()).assertEqual('MainAbility|StageModelSample|100|0|true');
      done();
    });

    it('AbilityContextConsistency_005', 0, async (done: Function) => {
      const checker = new ConsistencyChecker();
      expect(checker.isConsistent(baseline)).assertTrue();
      expect(checker.check(baseline).length).assertEqual(0);
      done();
    });

    it('AbilityContextConsistency_006', 0, async (done: Function) => {
      const checker = new ConsistencyChecker();
      const invalid = baseline.withResultCode(-5);
      const violations = checker.check(invalid);
      expect(violations.length).assertEqual(1);
      expect(violations[0].rule).assertEqual(RuleKind.RESULT_CODE_RANGE);
      expect(checker.isConsistent(invalid)).assertFalse();
      done();
    });

    it('AbilityContextConsistency_007', 0, async (done: Function) => {
      const checker = new ConsistencyChecker();
      const invalid = baseline.withConnectionCount(-1);
      const violations = checker.check(invalid);
      expect(checker.countByRule(violations, RuleKind.CONNECTION_NON_NEGATIVE)).assertEqual(1);
      expect(checker.countByRule(violations, RuleKind.RESULT_CODE_RANGE)).assertEqual(0);
      done();
    });

    it('AbilityContextConsistency_008', 0, async (done: Function) => {
      const checker = new ConsistencyChecker();
      const invalid = new ContextSnapshot(ABILITY_MAIN, '   ', RESULT_CODE, CONNECTION_NUMBER, false);
      const violations = checker.check(invalid);
      expect(checker.countByRule(violations, RuleKind.LABEL_NON_EMPTY)).assertEqual(1);
      expect(violations.length).assertEqual(1);
      done();
    });

    it('AbilityContextConsistency_009', 0, async (done: Function) => {
      const checker = new ConsistencyChecker();
      const invalid = new ContextSnapshot('JumpAbility', 'StageModelSample', RESULT_CODE,
        CONNECTION_NUMBER, false);
      const violations = checker.check(invalid);
      expect(checker.countByRule(violations, RuleKind.ABILITY_NAME_MATCH)).assertEqual(1);
      expect(checker.isConsistent(invalid)).assertFalse();
      done();
    });

    it('AbilityContextConsistency_010', 0, async (done: Function) => {
      const checker = new ConsistencyChecker();
      const multiInvalid = new ContextSnapshot('WrongAbility', '', -1, -2, false);
      const violations = checker.check(multiInvalid);
      expect(violations.length).assertEqual(4);
      expect(checker.countByRule(violations, RuleKind.RESULT_CODE_RANGE)).assertEqual(1);
      expect(checker.countByRule(violations, RuleKind.CONNECTION_NON_NEGATIVE)).assertEqual(1);
      expect(checker.countByRule(violations, RuleKind.LABEL_NON_EMPTY)).assertEqual(1);
      expect(checker.countByRule(violations, RuleKind.ABILITY_NAME_MATCH)).assertEqual(1);
      done();
    });

    it('AbilityContextConsistency_011', 0, async (done: Function) => {
      const violation = new Violation(RuleKind.LABEL_NON_EMPTY, 'missionLabel empty');
      expect(violation.describe()).assertEqual('2:missionLabel empty');
      expect(violation.rule).assertEqual(RuleKind.LABEL_NON_EMPTY);
      expect(violation.detail).assertEqual('missionLabel empty');
      done();
    });

    it('AbilityContextConsistency_012', 0, async (done: Function) => {
      const store = new SnapshotStore();
      expect(store.size()).assertEqual(0);
      expect(store.latest()).assertNull();
      expect(store.previous()).assertNull();
      expect(store.allDigestsEqual()).assertTrue();
      done();
    });

    it('AbilityContextConsistency_013', 0, async (done: Function) => {
      const store = new SnapshotStore();
      store.push(buildBaselineSnapshot());
      expect(store.size()).assertEqual(1);
      const latest = store.latest();
      expect(latest !== null).assertTrue();
      if (latest !== null) {
        expect(latest.digest()).assertEqual('MainAbility|StageModelSample|100|0|false');
      }
      expect(store.previous()).assertNull();
      done();
    });

    it('AbilityContextConsistency_014', 0, async (done: Function) => {
      const store = new SnapshotStore();
      store.push(buildBaselineSnapshot());
      store.push(buildBaselineSnapshot());
      expect(store.size()).assertEqual(2);
      expect(store.allDigestsEqual()).assertTrue();
      expect(store.distinctDigestCount()).assertEqual(1);
      done();
    });

    it('AbilityContextConsistency_015', 0, async (done: Function) => {
      const store = new SnapshotStore();
      store.push(buildBaselineSnapshot());
      store.push(buildBaselineSnapshot().withConnectionCount(2));
      expect(store.allDigestsEqual()).assertFalse();
      expect(store.distinctDigestCount()).assertEqual(2);
      const previous = store.previous();
      expect(previous !== null).assertTrue();
      if (previous !== null) {
        expect(previous.connectionCount).assertEqual(0);
      }
      done();
    });

    it('AbilityContextConsistency_016', 0, async (done: Function) => {
      const store = new SnapshotStore();
      store.push(buildBaselineSnapshot());
      store.push(buildBaselineSnapshot());
      store.push(buildBaselineSnapshot());
      expect(store.allDigestsEqual()).assertTrue();
      expect(store.distinctDigestCount()).assertEqual(1);
      store.clear();
      expect(store.size()).assertEqual(0);
      expect(store.latest()).assertNull();
      done();
    });

    it('AbilityContextConsistency_017', 0, async (done: Function) => {
      const reconciler = new StateReconciler();
      const actual = buildBaselineSnapshot();
      expect(reconciler.reconcile(baseline, actual)).assertEqual(0);
      expect(reconciler.matches(baseline, actual)).assertTrue();
      done();
    });

    it('AbilityContextConsistency_018', 0, async (done: Function) => {
      const reconciler = new StateReconciler();
      const actual = baseline.withResultCode(500).withConnectionCount(4);
      expect(reconciler.reconcile(baseline, actual)).assertEqual(2);
      expect(reconciler.matches(baseline, actual)).assertFalse();
      done();
    });

    it('AbilityContextConsistency_019', 0, async (done: Function) => {
      const reconciler = new StateReconciler();
      const actual = new ContextSnapshot('OtherAbility', 'Other', 300, 5, true);
      expect(reconciler.reconcile(baseline, actual)).assertEqual(5);
      expect(reconciler.matches(baseline, actual)).assertFalse();
      done();
    });

    it('AbilityContextConsistency_020', 0, async (done: Function) => {
      const reconciler = new StateReconciler();
      const actual = new ContextSnapshot(ABILITY_MAIN, '', -1, -1, false);
      const merged = reconciler.merged(baseline, actual);
      expect(merged.abilityName).assertEqual(ABILITY_MAIN);
      expect(merged.missionLabel).assertEqual('StageModelSample');
      expect(merged.resultCode).assertEqual(RESULT_CODE);
      expect(merged.connectionCount).assertEqual(CONNECTION_NUMBER);
      done();
    });

    it('AbilityContextConsistency_021', 0, async (done: Function) => {
      const reconciler = new StateReconciler();
      const actual = new ContextSnapshot(ABILITY_MAIN, 'Updated', 200, 2, true);
      const merged = reconciler.merged(baseline, actual);
      expect(merged.missionLabel).assertEqual('Updated');
      expect(merged.resultCode).assertEqual(200);
      expect(merged.connectionCount).assertEqual(2);
      expect(merged.terminating).assertTrue();
      done();
    });

    it('AbilityContextConsistency_022', 0, async (done: Function) => {
      expect(BUNDLE_NAME).assertEqual('ohos.samples.stagemodel');
      expect(MODULE_ENTRY).assertEqual('entry');
      expect(ACCOUNT_ID).assertEqual(100);
      const derived = `${BUNDLE_NAME}.${MODULE_ENTRY}`;
      expect(derived).assertEqual('ohos.samples.stagemodel.entry');
      done();
    });

    it('AbilityContextConsistency_023', 0, async (done: Function) => {
      const checker = new ConsistencyChecker();
      const snapshots: ContextSnapshot[] = [
        buildBaselineSnapshot(),
        buildBaselineSnapshot(),
        buildBaselineSnapshot().withTerminating(true)
      ];
      let consistent = 0;
      for (const snapshot of snapshots) {
        if (checker.isConsistent(snapshot)) {
          consistent += 1;
        }
      }
      expect(consistent).assertEqual(3);
      done();
    });

    it('AbilityContextConsistency_024', 0, async (done: Function) => {
      const checker = new ConsistencyChecker();
      const violations = checker.check(baseline.withResultCode(1001));
      expect(violations.length).assertEqual(1);
      expect(checker.countByRule(violations, RuleKind.RESULT_CODE_RANGE)).assertEqual(1);
      const edgeLow = checker.check(baseline.withResultCode(0));
      expect(edgeLow.length).assertEqual(0);
      const edgeHigh = checker.check(baseline.withResultCode(1000));
      expect(edgeHigh.length).assertEqual(0);
      done();
    });

    it('AbilityContextConsistency_025', 0, async (done: Function) => {
      const store = new SnapshotStore();
      store.push(buildBaselineSnapshot());
      store.push(buildBaselineSnapshot().withResultCode(200));
      store.push(buildBaselineSnapshot().withTerminating(true));
      expect(store.size()).assertEqual(3);
      expect(store.distinctDigestCount()).assertEqual(3);
      expect(store.allDigestsEqual()).assertFalse();
      done();
    });

    it('AbilityContextConsistency_026', 0, async (done: Function) => {
      const original = buildBaselineSnapshot();
      const modified = original.withResultCode(777);
      expect(original.resultCode).assertEqual(RESULT_CODE);
      expect(modified.resultCode).assertEqual(777);
      expect(original.equals(modified)).assertFalse();
      expect(original.digest() === modified.digest()).assertFalse();
      done();
    });

    it('AbilityContextConsistency_027', 0, async (done: Function) => {
      const reconciler = new StateReconciler();
      expect(reconciler.reconcile(baseline, baseline.withResultCode(1))).assertEqual(1);
      expect(reconciler.reconcile(baseline, baseline.withConnectionCount(1))).assertEqual(1);
      expect(reconciler.reconcile(baseline, baseline.withTerminating(true))).assertEqual(1);
      done();
    });

    it('AbilityContextConsistency_028', 0, async (done: Function) => {
      const checker = new ConsistencyChecker();
      const valid = checker.check(baseline);
      const invalid = checker.check(baseline.withConnectionCount(-10));
      expect(valid.length).assertEqual(0);
      expect(invalid.length).assertEqual(1);
      expect(checker.countByRule(invalid, RuleKind.CONNECTION_NON_NEGATIVE)).assertEqual(1);
      done();
    });

    it('AbilityContextConsistency_029', 0, async (done: Function) => {
      const store = new SnapshotStore();
      store.push(buildBaselineSnapshot());
      store.push(buildBaselineSnapshot().withResultCode(200));
      const latest = store.latest();
      const previous = store.previous();
      expect(latest !== null && previous !== null).assertTrue();
      if (latest !== null && previous !== null) {
        expect(latest.resultCode).assertEqual(200);
        expect(previous.resultCode).assertEqual(RESULT_CODE);
        expect(latest.equals(previous)).assertFalse();
      }
      done();
    });
  });
}


