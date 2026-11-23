/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the License);
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect } from '@ohos/hypium';
import { TIMEOUT_DIALOG_RENDER, yieldTick } from '../Shared/CustomShareDriver';
enum DialogLifecycleKind {
  LINK = 'link',
  FILE = 'file',
  OTHER = 'other',
  TEXT = 'text',
  EDIT = 'edit'
}

interface DialogLifecycleEntry {
  id: number;
  label: string;
  kind: DialogLifecycleKind;
  enabled: boolean;
}

class DialogLifecycleRegistry {
  private entries: Map<number, DialogLifecycleEntry> = new Map<number, DialogLifecycleEntry>();

  public register(entry: DialogLifecycleEntry): boolean {
    if (entry.id < 0 || entry.label.length === 0) {
      return false;
    }
    this.entries.set(entry.id, entry);
    return true;
  }

  public contains(id: number): boolean {
    return this.entries.has(id);
  }

  public size(): number {
    return this.entries.size;
  }

  public enabledCount(): number {
    let count: number = 0;
    this.entries.forEach((entry: DialogLifecycleEntry) => {
      if (entry.enabled) {
        count++;
      }
    });
    return count;
  }
}
class DialogLifecycleMetrics {
  private counts: Map<string, number> = new Map<string, number>();
  private totalAmount: number = 0;

  public record(key: string, amount: number = 1): void {
    const current: number = this.counts.get(key) ?? 0;
    this.counts.set(key, current + amount);
    this.totalAmount += amount;
  }

  public count(key: string): number {
    return this.counts.get(key) ?? 0;
  }

  public total(): number {
    return this.totalAmount;
  }

  public distinct(): number {
    return this.counts.size;
  }

  public average(): number {
    if (this.counts.size === 0) {
      return 0;
    }
    return this.totalAmount / this.counts.size;
  }
}
enum DialogLifecycleErrorCode {
  OK = 0,
  EMPTY = 1,
  TOO_LONG = 2,
  INVALID = 3
}

interface DialogLifecycleValidationResult {
  ok: boolean;
  code: DialogLifecycleErrorCode;
  message: string;
}

class DialogLifecycleValidator {
  private maxLength: number;

  constructor(maxLength: number = 64) {
    this.maxLength = maxLength;
  }

  public validate(value: string): DialogLifecycleValidationResult {
    if (value.length === 0) {
      return { ok: false, code: DialogLifecycleErrorCode.EMPTY, message: 'empty value' };
    }
    if (value.length > this.maxLength) {
      return { ok: false, code: DialogLifecycleErrorCode.TOO_LONG, message: 'value too long' };
    }
    return { ok: true, code: DialogLifecycleErrorCode.OK, message: 'valid value' };
  }

  public isUrl(value: string): boolean {
    return value.indexOf('http://') === 0 || value.indexOf('https://') === 0;
  }

  public isEmpty(value: string): boolean {
    return value.length === 0;
  }
}
enum DialogLifecycleState {
  IDLE = 'idle',
  READY = 'ready',
  RUNNING = 'running',
  DONE = 'done',
  FAILED = 'failed'
}

class DialogLifecycleStateMachine {
  private state: DialogLifecycleState = DialogLifecycleState.IDLE;
  private transitionCount: number = 0;

  public transition(to: DialogLifecycleState): boolean {
    this.state = to;
    this.transitionCount++;
    return true;
  }

  public current(): DialogLifecycleState {
    return this.state;
  }

  public count(): number {
    return this.transitionCount;
  }

  public isTerminal(): boolean {
    return this.state === DialogLifecycleState.DONE || this.state === DialogLifecycleState.FAILED;
  }

  public reset(): void {
    this.state = DialogLifecycleState.IDLE;
    this.transitionCount = 0;
  }
}

export default function dialogLifecycleTest() {
  describe('DialogLifecycle_Test', () => {
    it('dialogLifecycleTest_share_registry_0', 0, async () => {
      if (0 % 25 === 0) { await yieldTick(); }
      const registry = new DialogLifecycleRegistry();
      expect(registry.register({ id: 0, label: 'share_0', kind: DialogLifecycleKind.LINK, enabled: true })).assertTrue();
      expect(registry.contains(0)).assertTrue();
      expect(registry.size()).assertEqual(1);
    });
    it('dialogLifecycleTest_share_metrics_1', 0, async () => {
      if (1 % 25 === 0) { await yieldTick(); }
      const metrics = new DialogLifecycleMetrics();
      metrics.record('link', 2);
      metrics.record('file', 3);
      expect(metrics.total()).assertEqual(5);
      expect(metrics.count('link')).assertEqual(2);
      expect(metrics.distinct()).assertEqual(2);
    });
    it('dialogLifecycleTest_share_validate_2', 0, async () => {
      if (2 % 25 === 0) { await yieldTick(); }
      const validator = new DialogLifecycleValidator(8);
      expect(validator.validate('').ok).assertFalse();
      expect(validator.validate('share').ok).assertTrue();
      expect(validator.validate('oversized').ok).assertFalse();
      expect(validator.isUrl('https://example.com/share')).assertTrue();
    });
    it('dialogLifecycleTest_share_state_3', 0, async () => {
      if (3 % 25 === 0) { await yieldTick(); }
      const machine = new DialogLifecycleStateMachine();
      machine.transition(DialogLifecycleState.READY);
      machine.transition(DialogLifecycleState.RUNNING);
      expect(machine.count()).assertEqual(2);
      expect(machine.current()).assertEqual(DialogLifecycleState.RUNNING);
      machine.transition(DialogLifecycleState.DONE);
      expect(machine.isTerminal()).assertTrue();
    });
    it('dialogLifecycleTest_share_render_budget_4', 0, async () => {
      if (4 % 25 === 0) { await yieldTick(); }
      expect(TIMEOUT_DIALOG_RENDER).assertLarger(0);
      expect(TIMEOUT_DIALOG_RENDER >= 1000).assertTrue();
      const budget: number = TIMEOUT_DIALOG_RENDER - 1000;
      expect(budget >= 0).assertTrue();
    });
    it('dialogLifecycleTest_share_registry_5', 0, async () => {
      if (5 % 25 === 0) { await yieldTick(); }
      const registry = new DialogLifecycleRegistry();
      expect(registry.register({ id: 5, label: 'share_5', kind: DialogLifecycleKind.LINK, enabled: true })).assertTrue();
      expect(registry.contains(5)).assertTrue();
      expect(registry.size()).assertEqual(1);
    });
    it('dialogLifecycleTest_share_metrics_6', 0, async () => {
      if (6 % 25 === 0) { await yieldTick(); }
      const metrics = new DialogLifecycleMetrics();
      metrics.record('link', 2);
      metrics.record('file', 3);
      expect(metrics.total()).assertEqual(5);
      expect(metrics.count('link')).assertEqual(2);
      expect(metrics.distinct()).assertEqual(2);
    });
    it('dialogLifecycleTest_share_validate_7', 0, async () => {
      if (7 % 25 === 0) { await yieldTick(); }
      const validator = new DialogLifecycleValidator(8);
      expect(validator.validate('').ok).assertFalse();
      expect(validator.validate('share').ok).assertTrue();
      expect(validator.validate('oversized').ok).assertFalse();
      expect(validator.isUrl('https://example.com/share')).assertTrue();
    });
    it('dialogLifecycleTest_share_state_8', 0, async () => {
      if (8 % 25 === 0) { await yieldTick(); }
      const machine = new DialogLifecycleStateMachine();
      machine.transition(DialogLifecycleState.READY);
      machine.transition(DialogLifecycleState.RUNNING);
      expect(machine.count()).assertEqual(2);
      expect(machine.current()).assertEqual(DialogLifecycleState.RUNNING);
      machine.transition(DialogLifecycleState.DONE);
      expect(machine.isTerminal()).assertTrue();
    });
    it('dialogLifecycleTest_share_render_budget_9', 0, async () => {
      if (9 % 25 === 0) { await yieldTick(); }
      expect(TIMEOUT_DIALOG_RENDER).assertLarger(0);
      expect(TIMEOUT_DIALOG_RENDER >= 1000).assertTrue();
      const budget: number = TIMEOUT_DIALOG_RENDER - 1000;
      expect(budget >= 0).assertTrue();
    });
    it('dialogLifecycleTest_share_registry_10', 0, async () => {
      if (10 % 25 === 0) { await yieldTick(); }
      const registry = new DialogLifecycleRegistry();
      expect(registry.register({ id: 10, label: 'share_10', kind: DialogLifecycleKind.LINK, enabled: true })).assertTrue();
      expect(registry.contains(10)).assertTrue();
      expect(registry.size()).assertEqual(1);
    });
    it('dialogLifecycleTest_share_metrics_11', 0, async () => {
      if (11 % 25 === 0) { await yieldTick(); }
      const metrics = new DialogLifecycleMetrics();
      metrics.record('link', 2);
      metrics.record('file', 3);
      expect(metrics.total()).assertEqual(5);
      expect(metrics.count('link')).assertEqual(2);
      expect(metrics.distinct()).assertEqual(2);
    });
    it('dialogLifecycleTest_share_validate_12', 0, async () => {
      if (12 % 25 === 0) { await yieldTick(); }
      const validator = new DialogLifecycleValidator(8);
      expect(validator.validate('').ok).assertFalse();
      expect(validator.validate('share').ok).assertTrue();
      expect(validator.validate('oversized').ok).assertFalse();
      expect(validator.isUrl('https://example.com/share')).assertTrue();
    });
    it('dialogLifecycleTest_share_state_13', 0, async () => {
      if (13 % 25 === 0) { await yieldTick(); }
      const machine = new DialogLifecycleStateMachine();
      machine.transition(DialogLifecycleState.READY);
      machine.transition(DialogLifecycleState.RUNNING);
      expect(machine.count()).assertEqual(2);
      expect(machine.current()).assertEqual(DialogLifecycleState.RUNNING);
      machine.transition(DialogLifecycleState.DONE);
      expect(machine.isTerminal()).assertTrue();
    });
    it('dialogLifecycleTest_share_render_budget_14', 0, async () => {
      if (14 % 25 === 0) { await yieldTick(); }
      expect(TIMEOUT_DIALOG_RENDER).assertLarger(0);
      expect(TIMEOUT_DIALOG_RENDER >= 1000).assertTrue();
      const budget: number = TIMEOUT_DIALOG_RENDER - 1000;
      expect(budget >= 0).assertTrue();
    });
    it('dialogLifecycleTest_share_registry_15', 0, async () => {
      if (15 % 25 === 0) { await yieldTick(); }
      const registry = new DialogLifecycleRegistry();
      expect(registry.register({ id: 15, label: 'share_15', kind: DialogLifecycleKind.LINK, enabled: true })).assertTrue();
      expect(registry.contains(15)).assertTrue();
      expect(registry.size()).assertEqual(1);
    });
    it('dialogLifecycleTest_share_metrics_16', 0, async () => {
      if (16 % 25 === 0) { await yieldTick(); }
      const metrics = new DialogLifecycleMetrics();
      metrics.record('link', 2);
      metrics.record('file', 3);
      expect(metrics.total()).assertEqual(5);
      expect(metrics.count('link')).assertEqual(2);
      expect(metrics.distinct()).assertEqual(2);
    });
    it('dialogLifecycleTest_share_validate_17', 0, async () => {
      if (17 % 25 === 0) { await yieldTick(); }
      const validator = new DialogLifecycleValidator(8);
      expect(validator.validate('').ok).assertFalse();
      expect(validator.validate('share').ok).assertTrue();
      expect(validator.validate('oversized').ok).assertFalse();
      expect(validator.isUrl('https://example.com/share')).assertTrue();
    });
    it('dialogLifecycleTest_share_state_18', 0, async () => {
      if (18 % 25 === 0) { await yieldTick(); }
      const machine = new DialogLifecycleStateMachine();
      machine.transition(DialogLifecycleState.READY);
      machine.transition(DialogLifecycleState.RUNNING);
      expect(machine.count()).assertEqual(2);
      expect(machine.current()).assertEqual(DialogLifecycleState.RUNNING);
      machine.transition(DialogLifecycleState.DONE);
      expect(machine.isTerminal()).assertTrue();
    });
    it('dialogLifecycleTest_share_render_budget_19', 0, async () => {
      if (19 % 25 === 0) { await yieldTick(); }
      expect(TIMEOUT_DIALOG_RENDER).assertLarger(0);
      expect(TIMEOUT_DIALOG_RENDER >= 1000).assertTrue();
      const budget: number = TIMEOUT_DIALOG_RENDER - 1000;
      expect(budget >= 0).assertTrue();
    });
    it('dialogLifecycleTest_share_registry_20', 0, async () => {
      if (20 % 25 === 0) { await yieldTick(); }
      const registry = new DialogLifecycleRegistry();
      expect(registry.register({ id: 20, label: 'share_20', kind: DialogLifecycleKind.LINK, enabled: true })).assertTrue();
      expect(registry.contains(20)).assertTrue();
      expect(registry.size()).assertEqual(1);
    });
  });
}
