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
enum DeviceCompatibilityKind {
  LINK = 'link',
  FILE = 'file',
  OTHER = 'other',
  TEXT = 'text',
  EDIT = 'edit'
}

interface DeviceCompatibilityEntry {
  id: number;
  label: string;
  kind: DeviceCompatibilityKind;
  enabled: boolean;
}

class DeviceCompatibilityRegistry {
  private entries: Map<number, DeviceCompatibilityEntry> = new Map<number, DeviceCompatibilityEntry>();

  public register(entry: DeviceCompatibilityEntry): boolean {
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
    this.entries.forEach((entry: DeviceCompatibilityEntry) => {
      if (entry.enabled) {
        count++;
      }
    });
    return count;
  }
}
class DeviceCompatibilityMetrics {
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
enum DeviceCompatibilityErrorCode {
  OK = 0,
  EMPTY = 1,
  TOO_LONG = 2,
  INVALID = 3
}

interface DeviceCompatibilityValidationResult {
  ok: boolean;
  code: DeviceCompatibilityErrorCode;
  message: string;
}

class DeviceCompatibilityValidator {
  private maxLength: number;

  constructor(maxLength: number = 64) {
    this.maxLength = maxLength;
  }

  public validate(value: string): DeviceCompatibilityValidationResult {
    if (value.length === 0) {
      return { ok: false, code: DeviceCompatibilityErrorCode.EMPTY, message: 'empty value' };
    }
    if (value.length > this.maxLength) {
      return { ok: false, code: DeviceCompatibilityErrorCode.TOO_LONG, message: 'value too long' };
    }
    return { ok: true, code: DeviceCompatibilityErrorCode.OK, message: 'valid value' };
  }

  public isUrl(value: string): boolean {
    return value.indexOf('http://') === 0 || value.indexOf('https://') === 0;
  }

  public isEmpty(value: string): boolean {
    return value.length === 0;
  }
}
enum DeviceCompatibilityState {
  IDLE = 'idle',
  READY = 'ready',
  RUNNING = 'running',
  DONE = 'done',
  FAILED = 'failed'
}

class DeviceCompatibilityStateMachine {
  private state: DeviceCompatibilityState = DeviceCompatibilityState.IDLE;
  private transitionCount: number = 0;

  public transition(to: DeviceCompatibilityState): boolean {
    this.state = to;
    this.transitionCount++;
    return true;
  }

  public current(): DeviceCompatibilityState {
    return this.state;
  }

  public count(): number {
    return this.transitionCount;
  }

  public isTerminal(): boolean {
    return this.state === DeviceCompatibilityState.DONE || this.state === DeviceCompatibilityState.FAILED;
  }

  public reset(): void {
    this.state = DeviceCompatibilityState.IDLE;
    this.transitionCount = 0;
  }
}

export default function deviceCompatibilityTest() {
  describe('DeviceCompatibility_Test', () => {

    it('deviceCompatibilityTest_share_registry_0', 0, async () => {
      await yieldTick();
      const registry = new DeviceCompatibilityRegistry();
      expect(registry.register({ id: 0, label: 'share_0', kind: DeviceCompatibilityKind.LINK, enabled: true })).assertTrue();
      expect(registry.contains(0)).assertTrue();
      expect(registry.size()).assertEqual(1);
    });
    it('deviceCompatibilityTest_share_metrics_1', 0, async () => {
      await yieldTick();
      const metrics = new DeviceCompatibilityMetrics();
      metrics.record('link', 2);
      metrics.record('file', 3);
      expect(metrics.total()).assertEqual(5);
      expect(metrics.count('link')).assertEqual(2);
      expect(metrics.distinct()).assertEqual(2);
    });
    it('deviceCompatibilityTest_share_validate_2', 0, async () => {
      await yieldTick();
      const validator = new DeviceCompatibilityValidator(8);
      expect(validator.validate('').ok).assertFalse();
      expect(validator.validate('share').ok).assertTrue();
      expect(validator.validate('oversized').ok).assertFalse();
      expect(validator.isUrl('https://example.com/share')).assertTrue();
    });
    it('deviceCompatibilityTest_share_state_3', 0, async () => {
      await yieldTick();
      const machine = new DeviceCompatibilityStateMachine();
      machine.transition(DeviceCompatibilityState.READY);
      machine.transition(DeviceCompatibilityState.RUNNING);
      expect(machine.count()).assertEqual(2);
      expect(machine.current()).assertEqual(DeviceCompatibilityState.RUNNING);
      machine.transition(DeviceCompatibilityState.DONE);
      expect(machine.isTerminal()).assertTrue();
    });
  });
}
