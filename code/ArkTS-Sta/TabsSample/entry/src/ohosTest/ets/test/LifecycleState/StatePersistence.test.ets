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


// StatePersistence 状态机：覆盖页签容器的打开/就绪/关闭状态迁移
enum StatePersistencePhase {
  IDLE = 'idle',
  OPENING = 'opening',
  READY = 'ready',
  CLOSING = 'closing',
  CLOSED = 'closed'
}

class StatePersistenceStateRecord {
  public from: StatePersistencePhase;
  public to: StatePersistencePhase;
  public timestamp: number;

  public constructor(from: StatePersistencePhase, to: StatePersistencePhase, timestamp: number) {
    this.from = from;
    this.to = to;
    this.timestamp = timestamp;
  }
}

class StatePersistenceStateMachine {
  private current: StatePersistencePhase = StatePersistencePhase.IDLE;
  private history: StatePersistenceStateRecord[] = [];

  public isValid(from: StatePersistencePhase, to: StatePersistencePhase): boolean {
    if (from === StatePersistencePhase.IDLE && to === StatePersistencePhase.OPENING) {
      return true;
    }
    if (from === StatePersistencePhase.OPENING && to === StatePersistencePhase.READY) {
      return true;
    }
    if (from === StatePersistencePhase.READY && to === StatePersistencePhase.CLOSING) {
      return true;
    }
    if (from === StatePersistencePhase.CLOSING && to === StatePersistencePhase.CLOSED) {
      return true;
    }
    if (from === StatePersistencePhase.CLOSED && to === StatePersistencePhase.OPENING) {
      return true;
    }
    return false;
  }

  public transition(to: StatePersistencePhase): boolean {
    if (!this.isValid(this.current, to)) {
      return false;
    }
    this.history.push(new StatePersistenceStateRecord(this.current, to, Date.now()));
    this.current = to;
    return true;
  }

  public getCurrent(): StatePersistencePhase {
    return this.current;
  }

  public getHistoryLength(): number {
    return this.history.length;
  }

  public countTransitionsTo(to: StatePersistencePhase): number {
    let count: number = 0;
    for (let i: number = 0; i < this.history.length; i++) {
      if (this.history[i].to === to) {
        count++;
      }
    }
    return count;
  }

  public reset(): void {
    this.current = StatePersistencePhase.IDLE;
    this.history = [];
  }
}


// StatePersistence 历史记录：保存焦点/导航路径序列
class StatePersistenceHistory {
  private items: number[] = [];

  public append(value: number): void {
    this.items.push(value);
  }

  public get(index: number): number {
    if (index < 0 || index >= this.items.length) {
      return -1;
    }
    return this.items[index];
  }

  public length(): number {
    return this.items.length;
  }

  public first(): number {
    return this.items.length === 0 ? -1 : this.items[0];
  }

  public last(): number {
    return this.items.length === 0 ? -1 : this.items[this.items.length - 1];
  }

  public includes(value: number): boolean {
    return this.items.indexOf(value) >= 0;
  }

  public isMonotonicIncreasing(): boolean {
    for (let i: number = 1; i < this.items.length; i++) {
      if (this.items[i] < this.items[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public toArray(): number[] {
    const copy: number[] = [];
    for (let i: number = 0; i < this.items.length; i++) {
      copy.push(this.items[i]);
    }
    return copy;
  }

  public reset(): void {
    this.items = [];
  }
}

export default function statePersistenceTest() {
  describe('StatePersistence_Test', () => {
    it('statePersistenceTest_valid_transition_0', 0, async () => {
      const machine = new StatePersistenceStateMachine();
      expect(machine.getCurrent()).assertEqual(StatePersistencePhase.IDLE);
      expect(machine.transition(StatePersistencePhase.OPENING)).assertTrue();
      expect(machine.transition(StatePersistencePhase.READY)).assertTrue();
      expect(machine.getCurrent()).assertEqual(StatePersistencePhase.READY);
      expect(machine.getHistoryLength()).assertEqual(2);
    });

    it('statePersistenceTest_invalid_transition_0', 0, async () => {
      const machine = new StatePersistenceStateMachine();
      expect(machine.transition(StatePersistencePhase.READY)).assertFalse();
      expect(machine.getCurrent()).assertEqual(StatePersistencePhase.IDLE);
      expect(machine.getHistoryLength()).assertEqual(0);
      expect(machine.transition(StatePersistencePhase.OPENING)).assertTrue();
      expect(machine.transition(StatePersistencePhase.CLOSED)).assertFalse();
    });

    it('statePersistenceTest_full_cycle_0', 0, async () => {
      const machine = new StatePersistenceStateMachine();
      machine.transition(StatePersistencePhase.OPENING);
      machine.transition(StatePersistencePhase.READY);
      machine.transition(StatePersistencePhase.CLOSING);
      machine.transition(StatePersistencePhase.CLOSED);
      expect(machine.countTransitionsTo(StatePersistencePhase.READY)).assertEqual(1);
      expect(machine.getHistoryLength()).assertEqual(4);
      machine.reset();
      expect(machine.getCurrent()).assertEqual(StatePersistencePhase.IDLE);
    });

    it('statePersistenceTest_valid_transition_1', 0, async () => {
      const machine = new StatePersistenceStateMachine();
      expect(machine.getCurrent()).assertEqual(StatePersistencePhase.IDLE);
      expect(machine.transition(StatePersistencePhase.OPENING)).assertTrue();
      expect(machine.transition(StatePersistencePhase.READY)).assertTrue();
      expect(machine.getCurrent()).assertEqual(StatePersistencePhase.READY);
      expect(machine.getHistoryLength()).assertEqual(2);
    });

    it('statePersistenceTest_invalid_transition_1', 0, async () => {
      const machine = new StatePersistenceStateMachine();
      expect(machine.transition(StatePersistencePhase.READY)).assertFalse();
      expect(machine.getCurrent()).assertEqual(StatePersistencePhase.IDLE);
      expect(machine.getHistoryLength()).assertEqual(0);
      expect(machine.transition(StatePersistencePhase.OPENING)).assertTrue();
      expect(machine.transition(StatePersistencePhase.CLOSED)).assertFalse();
    });

    it('statePersistenceTest_full_cycle_1', 0, async () => {
      const machine = new StatePersistenceStateMachine();
      machine.transition(StatePersistencePhase.OPENING);
      machine.transition(StatePersistencePhase.READY);
      machine.transition(StatePersistencePhase.CLOSING);
      machine.transition(StatePersistencePhase.CLOSED);
      expect(machine.countTransitionsTo(StatePersistencePhase.READY)).assertEqual(1);
      expect(machine.getHistoryLength()).assertEqual(4);
      machine.reset();
      expect(machine.getCurrent()).assertEqual(StatePersistencePhase.IDLE);
    });

    it('statePersistenceTest_valid_transition_2', 0, async () => {
      const machine = new StatePersistenceStateMachine();
      expect(machine.getCurrent()).assertEqual(StatePersistencePhase.IDLE);
      expect(machine.transition(StatePersistencePhase.OPENING)).assertTrue();
      expect(machine.transition(StatePersistencePhase.READY)).assertTrue();
      expect(machine.getCurrent()).assertEqual(StatePersistencePhase.READY);
      expect(machine.getHistoryLength()).assertEqual(2);
    });

    it('statePersistenceTest_invalid_transition_2', 0, async () => {
      const machine = new StatePersistenceStateMachine();
      expect(machine.transition(StatePersistencePhase.READY)).assertFalse();
      expect(machine.getCurrent()).assertEqual(StatePersistencePhase.IDLE);
      expect(machine.getHistoryLength()).assertEqual(0);
      expect(machine.transition(StatePersistencePhase.OPENING)).assertTrue();
      expect(machine.transition(StatePersistencePhase.CLOSED)).assertFalse();
    });

    it('statePersistenceTest_full_cycle_2', 0, async () => {
      const machine = new StatePersistenceStateMachine();
      machine.transition(StatePersistencePhase.OPENING);
      machine.transition(StatePersistencePhase.READY);
      machine.transition(StatePersistencePhase.CLOSING);
      machine.transition(StatePersistencePhase.CLOSED);
      expect(machine.countTransitionsTo(StatePersistencePhase.READY)).assertEqual(1);
      expect(machine.getHistoryLength()).assertEqual(4);
      machine.reset();
      expect(machine.getCurrent()).assertEqual(StatePersistencePhase.IDLE);
    });

    it('statePersistenceTest_append_and_access_0', 0, async () => {
      const history = new StatePersistenceHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(0);
      expect(history.last()).assertEqual(2);
      expect(history.get(1)).assertEqual(1);
      expect(history.get(99)).assertEqual(-1);
    });

    it('statePersistenceTest_monotonic_and_includes_0', 0, async () => {
      const history = new StatePersistenceHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('statePersistenceTest_copy_and_reset_0', 0, async () => {
      const history = new StatePersistenceHistory();
      history.append(0);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('statePersistenceTest_append_and_access_1', 0, async () => {
      const history = new StatePersistenceHistory();
      history.append(1);
      history.append(2);
      history.append(3);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(1);
      expect(history.last()).assertEqual(3);
      expect(history.get(1)).assertEqual(2);
      expect(history.get(99)).assertEqual(-1);
    });

    it('statePersistenceTest_monotonic_and_includes_1', 0, async () => {
      const history = new StatePersistenceHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('statePersistenceTest_copy_and_reset_1', 0, async () => {
      const history = new StatePersistenceHistory();
      history.append(1);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('statePersistenceTest_append_and_access_2', 0, async () => {
      const history = new StatePersistenceHistory();
      history.append(2);
      history.append(3);
      history.append(4);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(2);
      expect(history.last()).assertEqual(4);
      expect(history.get(1)).assertEqual(3);
      expect(history.get(99)).assertEqual(-1);
    });

    it('statePersistenceTest_monotonic_and_includes_2', 0, async () => {
      const history = new StatePersistenceHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('statePersistenceTest_copy_and_reset_2', 0, async () => {
      const history = new StatePersistenceHistory();
      history.append(2);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

  });
}
