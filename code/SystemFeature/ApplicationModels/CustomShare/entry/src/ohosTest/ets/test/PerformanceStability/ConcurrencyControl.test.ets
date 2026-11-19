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
enum ConcurrencyControlKind {
  LINK = 'link',
  FILE = 'file',
  OTHER = 'other',
  TEXT = 'text',
  EDIT = 'edit'
}

interface ConcurrencyControlEntry {
  id: number;
  label: string;
  kind: ConcurrencyControlKind;
  enabled: boolean;
}

class ConcurrencyControlRegistry {
  private entries: Map<number, ConcurrencyControlEntry> = new Map<number, ConcurrencyControlEntry>();

  public register(entry: ConcurrencyControlEntry): boolean {
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
    this.entries.forEach((entry: ConcurrencyControlEntry) => {
      if (entry.enabled) {
        count++;
      }
    });
    return count;
  }
}
class ConcurrencyControlMetrics {
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
enum ConcurrencyControlErrorCode {
  OK = 0,
  EMPTY = 1,
  TOO_LONG = 2,
  INVALID = 3
}

interface ConcurrencyControlValidationResult {
  ok: boolean;
  code: ConcurrencyControlErrorCode;
  message: string;
}

class ConcurrencyControlValidator {
  private maxLength: number;

  constructor(maxLength: number = 64) {
    this.maxLength = maxLength;
  }

  public validate(value: string): ConcurrencyControlValidationResult {
    if (value.length === 0) {
      return { ok: false, code: ConcurrencyControlErrorCode.EMPTY, message: 'empty value' };
    }
    if (value.length > this.maxLength) {
      return { ok: false, code: ConcurrencyControlErrorCode.TOO_LONG, message: 'value too long' };
    }
    return { ok: true, code: ConcurrencyControlErrorCode.OK, message: 'valid value' };
  }

  public isUrl(value: string): boolean {
    return value.indexOf('http://') === 0 || value.indexOf('https://') === 0;
  }

  public isEmpty(value: string): boolean {
    return value.length === 0;
  }
}
enum ConcurrencyControlState {
  IDLE = 'idle',
  READY = 'ready',
  RUNNING = 'running',
  DONE = 'done',
  FAILED = 'failed'
}

class ConcurrencyControlStateMachine {
  private state: ConcurrencyControlState = ConcurrencyControlState.IDLE;
  private transitionCount: number = 0;

  public transition(to: ConcurrencyControlState): boolean {
    this.state = to;
    this.transitionCount++;
    return true;
  }

  public current(): ConcurrencyControlState {
    return this.state;
  }

  public count(): number {
    return this.transitionCount;
  }

  public isTerminal(): boolean {
    return this.state === ConcurrencyControlState.DONE || this.state === ConcurrencyControlState.FAILED;
  }

  public reset(): void {
    this.state = ConcurrencyControlState.IDLE;
    this.transitionCount = 0;
  }
}
class ConcurrencyControlMap0 {
  private values: Map<string, number> = new Map<string, number>();

  public add(key: string, value: number): boolean {
    if (key.length === 0) {
      return false;
    }
    this.values.set(key, value);
    return true;
  }

  public get(key: string): number {
    return this.values.get(key) ?? 0;
  }

  public size(): number {
    return this.values.size;
  }

  public total(): number {
    let sum: number = 0;
    this.values.forEach((value: number) => {
      sum += value;
    });
    return sum;
  }
}
class ConcurrencyControlQueue1 {
  private items: string[] = [];

  public push(item: string): void {
    this.items.push(item);
  }

  public shift(): string {
    if (this.items.length === 0) {
      return '';
    }
    return this.items.shift() ?? '';
  }

  public peek(): string {
    if (this.items.length === 0) {
      return '';
    }
    return this.items[0];
  }

  public size(): number {
    return this.items.length;
  }

  public isEmpty(): boolean {
    return this.items.length === 0;
  }
}
class ConcurrencyControlCheck2 {
  private limit: number;

  constructor(limit: number = 10) {
    this.limit = limit;
  }

  public within(value: number): boolean {
    return value >= 0 && value <= this.limit;
  }

  public nonEmpty(value: string): boolean {
    return value.length > 0;
  }

  public rate(valid: number, total: number): number {
    if (total === 0) {
      return 0;
    }
    return valid / total;
  }
}
class ConcurrencyControlTrack3 {
  private seen: string[] = [];

  public mark(key: string): boolean {
    if (this.seen.indexOf(key) >= 0) {
      return false;
    }
    this.seen.push(key);
    return true;
  }

  public has(key: string): boolean {
    return this.seen.indexOf(key) >= 0;
  }

  public size(): number {
    return this.seen.length;
  }

  public reset(): void {
    this.seen = [];
  }
}

export default function concurrencyControlTest() {
  describe('ConcurrencyControl_Test', () => {

    it('concurrencyControlTest_share_registry_0', 0, async () => {
      await yieldTick();
      const registry = new ConcurrencyControlRegistry();
      expect(registry.register({ id: 0, label: 'share_0', kind: ConcurrencyControlKind.LINK, enabled: true })).assertTrue();
      expect(registry.contains(0)).assertTrue();
      expect(registry.size()).assertEqual(1);
    });
    it('concurrencyControlTest_share_metrics_1', 0, async () => {
      await yieldTick();
      const metrics = new ConcurrencyControlMetrics();
      metrics.record('link', 2);
      metrics.record('file', 3);
      expect(metrics.total()).assertEqual(5);
      expect(metrics.count('link')).assertEqual(2);
      expect(metrics.distinct()).assertEqual(2);
    });
    it('concurrencyControlTest_share_validate_2', 0, async () => {
      await yieldTick();
      const validator = new ConcurrencyControlValidator(8);
      expect(validator.validate('').ok).assertFalse();
      expect(validator.validate('share').ok).assertTrue();
      expect(validator.validate('oversized').ok).assertFalse();
      expect(validator.isUrl('https://example.com/share')).assertTrue();
    });
    it('concurrencyControlTest_share_state_3', 0, async () => {
      await yieldTick();
      const machine = new ConcurrencyControlStateMachine();
      machine.transition(ConcurrencyControlState.READY);
      machine.transition(ConcurrencyControlState.RUNNING);
      expect(machine.count()).assertEqual(2);
      expect(machine.current()).assertEqual(ConcurrencyControlState.RUNNING);
      machine.transition(ConcurrencyControlState.DONE);
      expect(machine.isTerminal()).assertTrue();
    });
  });
}
