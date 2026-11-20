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


// SessionManagement 状态机：覆盖页签容器的打开/就绪/关闭状态迁移
enum SessionManagementPhase {
  IDLE = 'idle',
  OPENING = 'opening',
  READY = 'ready',
  CLOSING = 'closing',
  CLOSED = 'closed'
}

class SessionManagementStateRecord {
  public from: SessionManagementPhase;
  public to: SessionManagementPhase;
  public timestamp: number;

  public constructor(from: SessionManagementPhase, to: SessionManagementPhase, timestamp: number) {
    this.from = from;
    this.to = to;
    this.timestamp = timestamp;
  }
}

class SessionManagementStateMachine {
  private current: SessionManagementPhase = SessionManagementPhase.IDLE;
  private history: SessionManagementStateRecord[] = [];

  public isValid(from: SessionManagementPhase, to: SessionManagementPhase): boolean {
    if (from === SessionManagementPhase.IDLE && to === SessionManagementPhase.OPENING) {
      return true;
    }
    if (from === SessionManagementPhase.OPENING && to === SessionManagementPhase.READY) {
      return true;
    }
    if (from === SessionManagementPhase.READY && to === SessionManagementPhase.CLOSING) {
      return true;
    }
    if (from === SessionManagementPhase.CLOSING && to === SessionManagementPhase.CLOSED) {
      return true;
    }
    if (from === SessionManagementPhase.CLOSED && to === SessionManagementPhase.OPENING) {
      return true;
    }
    return false;
  }

  public transition(to: SessionManagementPhase): boolean {
    if (!this.isValid(this.current, to)) {
      return false;
    }
    this.history.push(new SessionManagementStateRecord(this.current, to, Date.now()));
    this.current = to;
    return true;
  }

  public getCurrent(): SessionManagementPhase {
    return this.current;
  }

  public getHistoryLength(): number {
    return this.history.length;
  }

  public countTransitionsTo(to: SessionManagementPhase): number {
    let count: number = 0;
    for (let i: number = 0; i < this.history.length; i++) {
      if (this.history[i].to === to) {
        count++;
      }
    }
    return count;
  }

  public reset(): void {
    this.current = SessionManagementPhase.IDLE;
    this.history = [];
  }
}


// SessionManagement 历史记录：保存焦点/导航路径序列
class SessionManagementHistory {
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


// SessionManagement 配置表：模拟 STYLE_CONFIGURATION 的键值读取
class SessionManagementConfig {
  private entries: Map<string, number> = new Map<string, number>();

  public set(key: string, value: number): void {
    this.entries.set(key, value);
  }

  public get(key: string, defaultValue: number): number {
    const value: number | undefined = this.entries.get(key);
    return value === undefined ? defaultValue : value;
  }

  public has(key: string): boolean {
    return this.entries.has(key);
  }

  public keys(): string[] {
    const result: string[] = [];
    this.entries.forEach((value: number, key: string) => {
      result.push(key);
    });
    return result;
  }

  public keyCount(): number {
    return this.entries.size;
  }

  public clear(): void {
    this.entries = new Map<string, number>();
  }
}

export default function sessionManagementTest() {
  describe('SessionManagement_Test', () => {
    it('sessionManagementTest_valid_transition_0', 0, async () => {
      const machine = new SessionManagementStateMachine();
      expect(machine.getCurrent()).assertEqual(SessionManagementPhase.IDLE);
      expect(machine.transition(SessionManagementPhase.OPENING)).assertTrue();
      expect(machine.transition(SessionManagementPhase.READY)).assertTrue();
      expect(machine.getCurrent()).assertEqual(SessionManagementPhase.READY);
      expect(machine.getHistoryLength()).assertEqual(2);
    });

    it('sessionManagementTest_invalid_transition_0', 0, async () => {
      const machine = new SessionManagementStateMachine();
      expect(machine.transition(SessionManagementPhase.READY)).assertFalse();
      expect(machine.getCurrent()).assertEqual(SessionManagementPhase.IDLE);
      expect(machine.getHistoryLength()).assertEqual(0);
      expect(machine.transition(SessionManagementPhase.OPENING)).assertTrue();
      expect(machine.transition(SessionManagementPhase.CLOSED)).assertFalse();
    });

    it('sessionManagementTest_full_cycle_0', 0, async () => {
      const machine = new SessionManagementStateMachine();
      machine.transition(SessionManagementPhase.OPENING);
      machine.transition(SessionManagementPhase.READY);
      machine.transition(SessionManagementPhase.CLOSING);
      machine.transition(SessionManagementPhase.CLOSED);
      expect(machine.countTransitionsTo(SessionManagementPhase.READY)).assertEqual(1);
      expect(machine.getHistoryLength()).assertEqual(4);
      machine.reset();
      expect(machine.getCurrent()).assertEqual(SessionManagementPhase.IDLE);
    });

    it('sessionManagementTest_valid_transition_1', 0, async () => {
      const machine = new SessionManagementStateMachine();
      expect(machine.getCurrent()).assertEqual(SessionManagementPhase.IDLE);
      expect(machine.transition(SessionManagementPhase.OPENING)).assertTrue();
      expect(machine.transition(SessionManagementPhase.READY)).assertTrue();
      expect(machine.getCurrent()).assertEqual(SessionManagementPhase.READY);
      expect(machine.getHistoryLength()).assertEqual(2);
    });

    it('sessionManagementTest_invalid_transition_1', 0, async () => {
      const machine = new SessionManagementStateMachine();
      expect(machine.transition(SessionManagementPhase.READY)).assertFalse();
      expect(machine.getCurrent()).assertEqual(SessionManagementPhase.IDLE);
      expect(machine.getHistoryLength()).assertEqual(0);
      expect(machine.transition(SessionManagementPhase.OPENING)).assertTrue();
      expect(machine.transition(SessionManagementPhase.CLOSED)).assertFalse();
    });

    it('sessionManagementTest_full_cycle_1', 0, async () => {
      const machine = new SessionManagementStateMachine();
      machine.transition(SessionManagementPhase.OPENING);
      machine.transition(SessionManagementPhase.READY);
      machine.transition(SessionManagementPhase.CLOSING);
      machine.transition(SessionManagementPhase.CLOSED);
      expect(machine.countTransitionsTo(SessionManagementPhase.READY)).assertEqual(1);
      expect(machine.getHistoryLength()).assertEqual(4);
      machine.reset();
      expect(machine.getCurrent()).assertEqual(SessionManagementPhase.IDLE);
    });

    it('sessionManagementTest_valid_transition_2', 0, async () => {
      const machine = new SessionManagementStateMachine();
      expect(machine.getCurrent()).assertEqual(SessionManagementPhase.IDLE);
      expect(machine.transition(SessionManagementPhase.OPENING)).assertTrue();
      expect(machine.transition(SessionManagementPhase.READY)).assertTrue();
      expect(machine.getCurrent()).assertEqual(SessionManagementPhase.READY);
      expect(machine.getHistoryLength()).assertEqual(2);
    });

    it('sessionManagementTest_invalid_transition_2', 0, async () => {
      const machine = new SessionManagementStateMachine();
      expect(machine.transition(SessionManagementPhase.READY)).assertFalse();
      expect(machine.getCurrent()).assertEqual(SessionManagementPhase.IDLE);
      expect(machine.getHistoryLength()).assertEqual(0);
      expect(machine.transition(SessionManagementPhase.OPENING)).assertTrue();
      expect(machine.transition(SessionManagementPhase.CLOSED)).assertFalse();
    });

    it('sessionManagementTest_full_cycle_2', 0, async () => {
      const machine = new SessionManagementStateMachine();
      machine.transition(SessionManagementPhase.OPENING);
      machine.transition(SessionManagementPhase.READY);
      machine.transition(SessionManagementPhase.CLOSING);
      machine.transition(SessionManagementPhase.CLOSED);
      expect(machine.countTransitionsTo(SessionManagementPhase.READY)).assertEqual(1);
      expect(machine.getHistoryLength()).assertEqual(4);
      machine.reset();
      expect(machine.getCurrent()).assertEqual(SessionManagementPhase.IDLE);
    });

    it('sessionManagementTest_append_and_access_0', 0, async () => {
      const history = new SessionManagementHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(0);
      expect(history.last()).assertEqual(2);
      expect(history.get(1)).assertEqual(1);
      expect(history.get(99)).assertEqual(-1);
    });

    it('sessionManagementTest_monotonic_and_includes_0', 0, async () => {
      const history = new SessionManagementHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('sessionManagementTest_copy_and_reset_0', 0, async () => {
      const history = new SessionManagementHistory();
      history.append(0);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('sessionManagementTest_append_and_access_1', 0, async () => {
      const history = new SessionManagementHistory();
      history.append(1);
      history.append(2);
      history.append(3);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(1);
      expect(history.last()).assertEqual(3);
      expect(history.get(1)).assertEqual(2);
      expect(history.get(99)).assertEqual(-1);
    });

    it('sessionManagementTest_monotonic_and_includes_1', 0, async () => {
      const history = new SessionManagementHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('sessionManagementTest_copy_and_reset_1', 0, async () => {
      const history = new SessionManagementHistory();
      history.append(1);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('sessionManagementTest_append_and_access_2', 0, async () => {
      const history = new SessionManagementHistory();
      history.append(2);
      history.append(3);
      history.append(4);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(2);
      expect(history.last()).assertEqual(4);
      expect(history.get(1)).assertEqual(3);
      expect(history.get(99)).assertEqual(-1);
    });

    it('sessionManagementTest_monotonic_and_includes_2', 0, async () => {
      const history = new SessionManagementHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('sessionManagementTest_copy_and_reset_2', 0, async () => {
      const history = new SessionManagementHistory();
      history.append(2);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('sessionManagementTest_set_get_0', 0, async () => {
      const config = new SessionManagementConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 3)).assertEqual(3);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('sessionManagementTest_keys_and_clear_0', 0, async () => {
      const config = new SessionManagementConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('sessionManagementTest_default_fallback_0', 0, async () => {
      const config = new SessionManagementConfig();
      expect(config.get('UNKNOWN', 0)).assertEqual(0);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 1);
      expect(config.get('UNKNOWN', 0)).assertEqual(1);
    });

    it('sessionManagementTest_set_get_1', 0, async () => {
      const config = new SessionManagementConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 4)).assertEqual(4);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('sessionManagementTest_keys_and_clear_1', 0, async () => {
      const config = new SessionManagementConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('sessionManagementTest_default_fallback_1', 0, async () => {
      const config = new SessionManagementConfig();
      expect(config.get('UNKNOWN', 1)).assertEqual(1);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 2);
      expect(config.get('UNKNOWN', 0)).assertEqual(2);
    });

    it('sessionManagementTest_set_get_2', 0, async () => {
      const config = new SessionManagementConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 5)).assertEqual(5);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('sessionManagementTest_keys_and_clear_2', 0, async () => {
      const config = new SessionManagementConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('sessionManagementTest_default_fallback_2', 0, async () => {
      const config = new SessionManagementConfig();
      expect(config.get('UNKNOWN', 2)).assertEqual(2);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 3);
      expect(config.get('UNKNOWN', 0)).assertEqual(3);
    });

  });
}
