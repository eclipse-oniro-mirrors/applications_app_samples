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


// StateRecovery 状态机：覆盖页签容器的打开/就绪/关闭状态迁移
enum StateRecoveryPhase {
  IDLE = 'idle',
  OPENING = 'opening',
  READY = 'ready',
  CLOSING = 'closing',
  CLOSED = 'closed'
}

class StateRecoveryStateRecord {
  public from: StateRecoveryPhase;
  public to: StateRecoveryPhase;
  public timestamp: number;

  public constructor(from: StateRecoveryPhase, to: StateRecoveryPhase, timestamp: number) {
    this.from = from;
    this.to = to;
    this.timestamp = timestamp;
  }
}

class StateRecoveryStateMachine {
  private current: StateRecoveryPhase = StateRecoveryPhase.IDLE;
  private history: StateRecoveryStateRecord[] = [];

  public isValid(from: StateRecoveryPhase, to: StateRecoveryPhase): boolean {
    if (from === StateRecoveryPhase.IDLE && to === StateRecoveryPhase.OPENING) {
      return true;
    }
    if (from === StateRecoveryPhase.OPENING && to === StateRecoveryPhase.READY) {
      return true;
    }
    if (from === StateRecoveryPhase.READY && to === StateRecoveryPhase.CLOSING) {
      return true;
    }
    if (from === StateRecoveryPhase.CLOSING && to === StateRecoveryPhase.CLOSED) {
      return true;
    }
    if (from === StateRecoveryPhase.CLOSED && to === StateRecoveryPhase.OPENING) {
      return true;
    }
    return false;
  }

  public transition(to: StateRecoveryPhase): boolean {
    if (!this.isValid(this.current, to)) {
      return false;
    }
    this.history.push(new StateRecoveryStateRecord(this.current, to, Date.now()));
    this.current = to;
    return true;
  }

  public getCurrent(): StateRecoveryPhase {
    return this.current;
  }

  public getHistoryLength(): number {
    return this.history.length;
  }

  public countTransitionsTo(to: StateRecoveryPhase): number {
    let count: number = 0;
    for (let i: number = 0; i < this.history.length; i++) {
      if (this.history[i].to === to) {
        count++;
      }
    }
    return count;
  }

  public reset(): void {
    this.current = StateRecoveryPhase.IDLE;
    this.history = [];
  }
}


// StateRecovery 历史记录：保存焦点/导航路径序列
class StateRecoveryHistory {
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

export default function stateRecoveryTest() {
  describe('StateRecovery_Test', () => {
    it('stateRecoveryTest_valid_transition_0', 0, async () => {
      const machine = new StateRecoveryStateMachine();
      expect(machine.getCurrent()).assertEqual(StateRecoveryPhase.IDLE);
      expect(machine.transition(StateRecoveryPhase.OPENING)).assertTrue();
      expect(machine.transition(StateRecoveryPhase.READY)).assertTrue();
      expect(machine.getCurrent()).assertEqual(StateRecoveryPhase.READY);
      expect(machine.getHistoryLength()).assertEqual(2);
    });

    it('stateRecoveryTest_invalid_transition_0', 0, async () => {
      const machine = new StateRecoveryStateMachine();
      expect(machine.transition(StateRecoveryPhase.READY)).assertFalse();
      expect(machine.getCurrent()).assertEqual(StateRecoveryPhase.IDLE);
      expect(machine.getHistoryLength()).assertEqual(0);
      expect(machine.transition(StateRecoveryPhase.OPENING)).assertTrue();
      expect(machine.transition(StateRecoveryPhase.CLOSED)).assertFalse();
    });

    it('stateRecoveryTest_full_cycle_0', 0, async () => {
      const machine = new StateRecoveryStateMachine();
      machine.transition(StateRecoveryPhase.OPENING);
      machine.transition(StateRecoveryPhase.READY);
      machine.transition(StateRecoveryPhase.CLOSING);
      machine.transition(StateRecoveryPhase.CLOSED);
      expect(machine.countTransitionsTo(StateRecoveryPhase.READY)).assertEqual(1);
      expect(machine.getHistoryLength()).assertEqual(4);
      machine.reset();
      expect(machine.getCurrent()).assertEqual(StateRecoveryPhase.IDLE);
    });

    it('stateRecoveryTest_valid_transition_1', 0, async () => {
      const machine = new StateRecoveryStateMachine();
      expect(machine.getCurrent()).assertEqual(StateRecoveryPhase.IDLE);
      expect(machine.transition(StateRecoveryPhase.OPENING)).assertTrue();
      expect(machine.transition(StateRecoveryPhase.READY)).assertTrue();
      expect(machine.getCurrent()).assertEqual(StateRecoveryPhase.READY);
      expect(machine.getHistoryLength()).assertEqual(2);
    });

    it('stateRecoveryTest_invalid_transition_1', 0, async () => {
      const machine = new StateRecoveryStateMachine();
      expect(machine.transition(StateRecoveryPhase.READY)).assertFalse();
      expect(machine.getCurrent()).assertEqual(StateRecoveryPhase.IDLE);
      expect(machine.getHistoryLength()).assertEqual(0);
      expect(machine.transition(StateRecoveryPhase.OPENING)).assertTrue();
      expect(machine.transition(StateRecoveryPhase.CLOSED)).assertFalse();
    });

    it('stateRecoveryTest_full_cycle_1', 0, async () => {
      const machine = new StateRecoveryStateMachine();
      machine.transition(StateRecoveryPhase.OPENING);
      machine.transition(StateRecoveryPhase.READY);
      machine.transition(StateRecoveryPhase.CLOSING);
      machine.transition(StateRecoveryPhase.CLOSED);
      expect(machine.countTransitionsTo(StateRecoveryPhase.READY)).assertEqual(1);
      expect(machine.getHistoryLength()).assertEqual(4);
      machine.reset();
      expect(machine.getCurrent()).assertEqual(StateRecoveryPhase.IDLE);
    });

    it('stateRecoveryTest_valid_transition_2', 0, async () => {
      const machine = new StateRecoveryStateMachine();
      expect(machine.getCurrent()).assertEqual(StateRecoveryPhase.IDLE);
      expect(machine.transition(StateRecoveryPhase.OPENING)).assertTrue();
      expect(machine.transition(StateRecoveryPhase.READY)).assertTrue();
      expect(machine.getCurrent()).assertEqual(StateRecoveryPhase.READY);
      expect(machine.getHistoryLength()).assertEqual(2);
    });

    it('stateRecoveryTest_invalid_transition_2', 0, async () => {
      const machine = new StateRecoveryStateMachine();
      expect(machine.transition(StateRecoveryPhase.READY)).assertFalse();
      expect(machine.getCurrent()).assertEqual(StateRecoveryPhase.IDLE);
      expect(machine.getHistoryLength()).assertEqual(0);
      expect(machine.transition(StateRecoveryPhase.OPENING)).assertTrue();
      expect(machine.transition(StateRecoveryPhase.CLOSED)).assertFalse();
    });

    it('stateRecoveryTest_full_cycle_2', 0, async () => {
      const machine = new StateRecoveryStateMachine();
      machine.transition(StateRecoveryPhase.OPENING);
      machine.transition(StateRecoveryPhase.READY);
      machine.transition(StateRecoveryPhase.CLOSING);
      machine.transition(StateRecoveryPhase.CLOSED);
      expect(machine.countTransitionsTo(StateRecoveryPhase.READY)).assertEqual(1);
      expect(machine.getHistoryLength()).assertEqual(4);
      machine.reset();
      expect(machine.getCurrent()).assertEqual(StateRecoveryPhase.IDLE);
    });

    it('stateRecoveryTest_append_and_access_0', 0, async () => {
      const history = new StateRecoveryHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(0);
      expect(history.last()).assertEqual(2);
      expect(history.get(1)).assertEqual(1);
      expect(history.get(99)).assertEqual(-1);
    });

    it('stateRecoveryTest_monotonic_and_includes_0', 0, async () => {
      const history = new StateRecoveryHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('stateRecoveryTest_copy_and_reset_0', 0, async () => {
      const history = new StateRecoveryHistory();
      history.append(0);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('stateRecoveryTest_append_and_access_1', 0, async () => {
      const history = new StateRecoveryHistory();
      history.append(1);
      history.append(2);
      history.append(3);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(1);
      expect(history.last()).assertEqual(3);
      expect(history.get(1)).assertEqual(2);
      expect(history.get(99)).assertEqual(-1);
    });

    it('stateRecoveryTest_monotonic_and_includes_1', 0, async () => {
      const history = new StateRecoveryHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('stateRecoveryTest_copy_and_reset_1', 0, async () => {
      const history = new StateRecoveryHistory();
      history.append(1);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('stateRecoveryTest_append_and_access_2', 0, async () => {
      const history = new StateRecoveryHistory();
      history.append(2);
      history.append(3);
      history.append(4);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(2);
      expect(history.last()).assertEqual(4);
      expect(history.get(1)).assertEqual(3);
      expect(history.get(99)).assertEqual(-1);
    });

    it('stateRecoveryTest_monotonic_and_includes_2', 0, async () => {
      const history = new StateRecoveryHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('stateRecoveryTest_copy_and_reset_2', 0, async () => {
      const history = new StateRecoveryHistory();
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
