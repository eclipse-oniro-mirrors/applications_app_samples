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


// TabsStateManagement 状态机：覆盖页签容器的打开/就绪/关闭状态迁移
enum TabsStateManagementPhase {
  IDLE = 'idle',
  OPENING = 'opening',
  READY = 'ready',
  CLOSING = 'closing',
  CLOSED = 'closed'
}

class TabsStateManagementStateRecord {
  public from: TabsStateManagementPhase;
  public to: TabsStateManagementPhase;
  public timestamp: number;

  public constructor(from: TabsStateManagementPhase, to: TabsStateManagementPhase, timestamp: number) {
    this.from = from;
    this.to = to;
    this.timestamp = timestamp;
  }
}

class TabsStateManagementStateMachine {
  private current: TabsStateManagementPhase = TabsStateManagementPhase.IDLE;
  private history: TabsStateManagementStateRecord[] = [];

  public isValid(from: TabsStateManagementPhase, to: TabsStateManagementPhase): boolean {
    if (from === TabsStateManagementPhase.IDLE && to === TabsStateManagementPhase.OPENING) {
      return true;
    }
    if (from === TabsStateManagementPhase.OPENING && to === TabsStateManagementPhase.READY) {
      return true;
    }
    if (from === TabsStateManagementPhase.READY && to === TabsStateManagementPhase.CLOSING) {
      return true;
    }
    if (from === TabsStateManagementPhase.CLOSING && to === TabsStateManagementPhase.CLOSED) {
      return true;
    }
    if (from === TabsStateManagementPhase.CLOSED && to === TabsStateManagementPhase.OPENING) {
      return true;
    }
    return false;
  }

  public transition(to: TabsStateManagementPhase): boolean {
    if (!this.isValid(this.current, to)) {
      return false;
    }
    this.history.push(new TabsStateManagementStateRecord(this.current, to, Date.now()));
    this.current = to;
    return true;
  }

  public getCurrent(): TabsStateManagementPhase {
    return this.current;
  }

  public getHistoryLength(): number {
    return this.history.length;
  }

  public countTransitionsTo(to: TabsStateManagementPhase): number {
    let count: number = 0;
    for (let i: number = 0; i < this.history.length; i++) {
      if (this.history[i].to === to) {
        count++;
      }
    }
    return count;
  }

  public reset(): void {
    this.current = TabsStateManagementPhase.IDLE;
    this.history = [];
  }
}


// TabsStateManagement 历史记录：保存焦点/导航路径序列
class TabsStateManagementHistory {
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


// TabsStateManagement 配置表：模拟 STYLE_CONFIGURATION 的键值读取
class TabsStateManagementConfig {
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


// TabsStateManagement 仓储：以键值保存页签/文章的映射关系
class TabsStateManagementRepository {
  private store: Map<string, string> = new Map<string, string>();

  public put(key: string, value: string): void {
    this.store.set(key, value);
  }

  public get(key: string): string {
    const value: string | undefined = this.store.get(key);
    return value === undefined ? '' : value;
  }

  public update(key: string, value: string): boolean {
    if (!this.store.has(key)) {
      return false;
    }
    this.store.set(key, value);
    return true;
  }

  public remove(key: string): boolean {
    return this.store.delete(key);
  }

  public has(key: string): boolean {
    return this.store.has(key);
  }

  public size(): number {
    return this.store.size;
  }

  public clear(): void {
    this.store = new Map<string, string>();
  }
}


// TabsStateManagement 指标采集器：统计页签切换/渲染耗时样本
class TabsStateManagementMetricsCollector {
  private samples: number[] = [];

  public record(value: number): void {
    if (value >= 0) {
      this.samples.push(value);
    }
  }

  public getSampleCount(): number {
    return this.samples.length;
  }

  public getSum(): number {
    let total: number = 0;
    for (let i: number = 0; i < this.samples.length; i++) {
      total += this.samples[i];
    }
    return total;
  }

  public getAverage(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return this.getSum() / this.samples.length;
  }

  public getMax(): number {
    let max: number = 0;
    for (let i: number = 0; i < this.samples.length; i++) {
      if (this.samples[i] > max) {
        max = this.samples[i];
      }
    }
    return max;
  }

  public getMin(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let min: number = this.samples[0];
    for (let i: number = 1; i < this.samples.length; i++) {
      if (this.samples[i] < min) {
        min = this.samples[i];
      }
    }
    return min;
  }

  public isWithinBudget(budget: number): boolean {
    return this.getMax() <= budget;
  }

  public clear(): void {
    this.samples = [];
  }
}


// TabsStateManagement 索引追踪器：覆盖页签索引在 [0, count) 范围内的边界行为
class TabsStateManagementIndexTracker {
  private current: number = 0;
  private count: number;

  public constructor(count: number) {
    this.count = count > 0 ? count : 1;
  }

  public setIndex(index: number): boolean {
    if (index < 0 || index >= this.count) {
      return false;
    }
    this.current = index;
    return true;
  }

  public next(): boolean {
    if (this.current >= this.count - 1) {
      return false;
    }
    this.current = this.current + 1;
    return true;
  }

  public prev(): boolean {
    if (this.current <= 0) {
      return false;
    }
    this.current = this.current - 1;
    return true;
  }

  public wrapNext(): number {
    this.current = (this.current + 1) % this.count;
    return this.current;
  }

  public wrapPrev(): number {
    this.current = (this.current - 1 + this.count) % this.count;
    return this.current;
  }

  public getIndex(): number {
    return this.current;
  }

  public getCount(): number {
    return this.count;
  }

  public isFirst(): boolean {
    return this.current === 0;
  }

  public isLast(): boolean {
    return this.current === this.count - 1;
  }

  public reset(): void {
    this.current = 0;
  }
}

export default function tabsStateManagementTest() {
  describe('TabsStateManagement_Test', () => {
    it('tabsStateManagementTest_valid_transition_0', 0, async () => {
      const machine = new TabsStateManagementStateMachine();
      expect(machine.getCurrent()).assertEqual(TabsStateManagementPhase.IDLE);
      expect(machine.transition(TabsStateManagementPhase.OPENING)).assertTrue();
      expect(machine.transition(TabsStateManagementPhase.READY)).assertTrue();
      expect(machine.getCurrent()).assertEqual(TabsStateManagementPhase.READY);
      expect(machine.getHistoryLength()).assertEqual(2);
    });

    it('tabsStateManagementTest_invalid_transition_0', 0, async () => {
      const machine = new TabsStateManagementStateMachine();
      expect(machine.transition(TabsStateManagementPhase.READY)).assertFalse();
      expect(machine.getCurrent()).assertEqual(TabsStateManagementPhase.IDLE);
      expect(machine.getHistoryLength()).assertEqual(0);
      expect(machine.transition(TabsStateManagementPhase.OPENING)).assertTrue();
      expect(machine.transition(TabsStateManagementPhase.CLOSED)).assertFalse();
    });

    it('tabsStateManagementTest_full_cycle_0', 0, async () => {
      const machine = new TabsStateManagementStateMachine();
      machine.transition(TabsStateManagementPhase.OPENING);
      machine.transition(TabsStateManagementPhase.READY);
      machine.transition(TabsStateManagementPhase.CLOSING);
      machine.transition(TabsStateManagementPhase.CLOSED);
      expect(machine.countTransitionsTo(TabsStateManagementPhase.READY)).assertEqual(1);
      expect(machine.getHistoryLength()).assertEqual(4);
      machine.reset();
      expect(machine.getCurrent()).assertEqual(TabsStateManagementPhase.IDLE);
    });

    it('tabsStateManagementTest_valid_transition_1', 0, async () => {
      const machine = new TabsStateManagementStateMachine();
      expect(machine.getCurrent()).assertEqual(TabsStateManagementPhase.IDLE);
      expect(machine.transition(TabsStateManagementPhase.OPENING)).assertTrue();
      expect(machine.transition(TabsStateManagementPhase.READY)).assertTrue();
      expect(machine.getCurrent()).assertEqual(TabsStateManagementPhase.READY);
      expect(machine.getHistoryLength()).assertEqual(2);
    });

    it('tabsStateManagementTest_invalid_transition_1', 0, async () => {
      const machine = new TabsStateManagementStateMachine();
      expect(machine.transition(TabsStateManagementPhase.READY)).assertFalse();
      expect(machine.getCurrent()).assertEqual(TabsStateManagementPhase.IDLE);
      expect(machine.getHistoryLength()).assertEqual(0);
      expect(machine.transition(TabsStateManagementPhase.OPENING)).assertTrue();
      expect(machine.transition(TabsStateManagementPhase.CLOSED)).assertFalse();
    });

    it('tabsStateManagementTest_full_cycle_1', 0, async () => {
      const machine = new TabsStateManagementStateMachine();
      machine.transition(TabsStateManagementPhase.OPENING);
      machine.transition(TabsStateManagementPhase.READY);
      machine.transition(TabsStateManagementPhase.CLOSING);
      machine.transition(TabsStateManagementPhase.CLOSED);
      expect(machine.countTransitionsTo(TabsStateManagementPhase.READY)).assertEqual(1);
      expect(machine.getHistoryLength()).assertEqual(4);
      machine.reset();
      expect(machine.getCurrent()).assertEqual(TabsStateManagementPhase.IDLE);
    });

    it('tabsStateManagementTest_valid_transition_2', 0, async () => {
      const machine = new TabsStateManagementStateMachine();
      expect(machine.getCurrent()).assertEqual(TabsStateManagementPhase.IDLE);
      expect(machine.transition(TabsStateManagementPhase.OPENING)).assertTrue();
      expect(machine.transition(TabsStateManagementPhase.READY)).assertTrue();
      expect(machine.getCurrent()).assertEqual(TabsStateManagementPhase.READY);
      expect(machine.getHistoryLength()).assertEqual(2);
    });

    it('tabsStateManagementTest_invalid_transition_2', 0, async () => {
      const machine = new TabsStateManagementStateMachine();
      expect(machine.transition(TabsStateManagementPhase.READY)).assertFalse();
      expect(machine.getCurrent()).assertEqual(TabsStateManagementPhase.IDLE);
      expect(machine.getHistoryLength()).assertEqual(0);
      expect(machine.transition(TabsStateManagementPhase.OPENING)).assertTrue();
      expect(machine.transition(TabsStateManagementPhase.CLOSED)).assertFalse();
    });

    it('tabsStateManagementTest_full_cycle_2', 0, async () => {
      const machine = new TabsStateManagementStateMachine();
      machine.transition(TabsStateManagementPhase.OPENING);
      machine.transition(TabsStateManagementPhase.READY);
      machine.transition(TabsStateManagementPhase.CLOSING);
      machine.transition(TabsStateManagementPhase.CLOSED);
      expect(machine.countTransitionsTo(TabsStateManagementPhase.READY)).assertEqual(1);
      expect(machine.getHistoryLength()).assertEqual(4);
      machine.reset();
      expect(machine.getCurrent()).assertEqual(TabsStateManagementPhase.IDLE);
    });

    it('tabsStateManagementTest_append_and_access_0', 0, async () => {
      const history = new TabsStateManagementHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(0);
      expect(history.last()).assertEqual(2);
      expect(history.get(1)).assertEqual(1);
      expect(history.get(99)).assertEqual(-1);
    });

    it('tabsStateManagementTest_monotonic_and_includes_0', 0, async () => {
      const history = new TabsStateManagementHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('tabsStateManagementTest_copy_and_reset_0', 0, async () => {
      const history = new TabsStateManagementHistory();
      history.append(0);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('tabsStateManagementTest_append_and_access_1', 0, async () => {
      const history = new TabsStateManagementHistory();
      history.append(1);
      history.append(2);
      history.append(3);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(1);
      expect(history.last()).assertEqual(3);
      expect(history.get(1)).assertEqual(2);
      expect(history.get(99)).assertEqual(-1);
    });

    it('tabsStateManagementTest_monotonic_and_includes_1', 0, async () => {
      const history = new TabsStateManagementHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('tabsStateManagementTest_copy_and_reset_1', 0, async () => {
      const history = new TabsStateManagementHistory();
      history.append(1);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('tabsStateManagementTest_append_and_access_2', 0, async () => {
      const history = new TabsStateManagementHistory();
      history.append(2);
      history.append(3);
      history.append(4);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(2);
      expect(history.last()).assertEqual(4);
      expect(history.get(1)).assertEqual(3);
      expect(history.get(99)).assertEqual(-1);
    });

    it('tabsStateManagementTest_monotonic_and_includes_2', 0, async () => {
      const history = new TabsStateManagementHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('tabsStateManagementTest_copy_and_reset_2', 0, async () => {
      const history = new TabsStateManagementHistory();
      history.append(2);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('tabsStateManagementTest_set_get_0', 0, async () => {
      const config = new TabsStateManagementConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 3)).assertEqual(3);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('tabsStateManagementTest_keys_and_clear_0', 0, async () => {
      const config = new TabsStateManagementConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('tabsStateManagementTest_default_fallback_0', 0, async () => {
      const config = new TabsStateManagementConfig();
      expect(config.get('UNKNOWN', 0)).assertEqual(0);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 1);
      expect(config.get('UNKNOWN', 0)).assertEqual(1);
    });

    it('tabsStateManagementTest_set_get_1', 0, async () => {
      const config = new TabsStateManagementConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 4)).assertEqual(4);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('tabsStateManagementTest_keys_and_clear_1', 0, async () => {
      const config = new TabsStateManagementConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('tabsStateManagementTest_default_fallback_1', 0, async () => {
      const config = new TabsStateManagementConfig();
      expect(config.get('UNKNOWN', 1)).assertEqual(1);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 2);
      expect(config.get('UNKNOWN', 0)).assertEqual(2);
    });

    it('tabsStateManagementTest_set_get_2', 0, async () => {
      const config = new TabsStateManagementConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 5)).assertEqual(5);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('tabsStateManagementTest_keys_and_clear_2', 0, async () => {
      const config = new TabsStateManagementConfig();
      config.set('a', 1);
      config.set('b', 2);
      expect(config.keyCount()).assertEqual(2);
      expect(config.keys().length).assertEqual(2);
      config.clear();
      expect(config.keyCount()).assertEqual(0);
      expect(config.has('a')).assertFalse();
    });

    it('tabsStateManagementTest_default_fallback_2', 0, async () => {
      const config = new TabsStateManagementConfig();
      expect(config.get('UNKNOWN', 2)).assertEqual(2);
      expect(config.has('UNKNOWN')).assertFalse();
      config.set('UNKNOWN', 3);
      expect(config.get('UNKNOWN', 0)).assertEqual(3);
    });

    it('tabsStateManagementTest_put_get_0', 0, async () => {
      const repo = new TabsStateManagementRepository();
      repo.put('tab0', 'page0');
      expect(repo.has('tab0')).assertTrue();
      expect(repo.get('tab0')).assertEqual('page0');
      expect(repo.get('none')).assertEqual('');
      expect(repo.size()).assertEqual(1);
    });

    it('tabsStateManagementTest_update_remove_0', 0, async () => {
      const repo = new TabsStateManagementRepository();
      repo.put('a', 'x');
      expect(repo.update('a', 'y')).assertTrue();
      expect(repo.get('a')).assertEqual('y');
      expect(repo.update('b', 'z')).assertFalse();
      expect(repo.remove('a')).assertTrue();
      expect(repo.has('a')).assertFalse();
    });

    it('tabsStateManagementTest_clear_0', 0, async () => {
      const repo = new TabsStateManagementRepository();
      repo.put('a', '1');
      repo.put('b', '2');
      expect(repo.size()).assertEqual(2);
      repo.clear();
      expect(repo.size()).assertEqual(0);
      expect(repo.get('a')).assertEqual('');
    });

    it('tabsStateManagementTest_put_get_1', 0, async () => {
      const repo = new TabsStateManagementRepository();
      repo.put('tab1', 'page1');
      expect(repo.has('tab1')).assertTrue();
      expect(repo.get('tab1')).assertEqual('page1');
      expect(repo.get('none')).assertEqual('');
      expect(repo.size()).assertEqual(1);
    });

    it('tabsStateManagementTest_update_remove_1', 0, async () => {
      const repo = new TabsStateManagementRepository();
      repo.put('a', 'x');
      expect(repo.update('a', 'y')).assertTrue();
      expect(repo.get('a')).assertEqual('y');
      expect(repo.update('b', 'z')).assertFalse();
      expect(repo.remove('a')).assertTrue();
      expect(repo.has('a')).assertFalse();
    });

    it('tabsStateManagementTest_clear_1', 0, async () => {
      const repo = new TabsStateManagementRepository();
      repo.put('a', '1');
      repo.put('b', '2');
      expect(repo.size()).assertEqual(2);
      repo.clear();
      expect(repo.size()).assertEqual(0);
      expect(repo.get('a')).assertEqual('');
    });

    it('tabsStateManagementTest_put_get_2', 0, async () => {
      const repo = new TabsStateManagementRepository();
      repo.put('tab2', 'page2');
      expect(repo.has('tab2')).assertTrue();
      expect(repo.get('tab2')).assertEqual('page2');
      expect(repo.get('none')).assertEqual('');
      expect(repo.size()).assertEqual(1);
    });

    it('tabsStateManagementTest_update_remove_2', 0, async () => {
      const repo = new TabsStateManagementRepository();
      repo.put('a', 'x');
      expect(repo.update('a', 'y')).assertTrue();
      expect(repo.get('a')).assertEqual('y');
      expect(repo.update('b', 'z')).assertFalse();
      expect(repo.remove('a')).assertTrue();
      expect(repo.has('a')).assertFalse();
    });

    it('tabsStateManagementTest_clear_2', 0, async () => {
      const repo = new TabsStateManagementRepository();
      repo.put('a', '1');
      repo.put('b', '2');
      expect(repo.size()).assertEqual(2);
      repo.clear();
      expect(repo.size()).assertEqual(0);
      expect(repo.get('a')).assertEqual('');
    });

    it('tabsStateManagementTest_sum_average_0', 0, async () => {
      const metrics = new TabsStateManagementMetricsCollector();
      metrics.record(10);
      metrics.record(20);
      metrics.record(30);
      expect(metrics.getSampleCount()).assertEqual(3);
      expect(metrics.getSum()).assertEqual(60);
      expect(metrics.getAverage()).assertEqual(20);
    });

    it('tabsStateManagementTest_max_min_0', 0, async () => {
      const metrics = new TabsStateManagementMetricsCollector();
      metrics.record(5);
      metrics.record(50);
      metrics.record(15);
      expect(metrics.getMax()).assertEqual(50);
      expect(metrics.getMin()).assertEqual(5);
      metrics.record(-1);
      expect(metrics.getSampleCount()).assertEqual(3);
    });

    it('tabsStateManagementTest_budget_0', 0, async () => {
      const metrics = new TabsStateManagementMetricsCollector();
      metrics.record(16);
      metrics.record(20);
      expect(metrics.isWithinBudget(30)).assertTrue();
      expect(metrics.isWithinBudget(10)).assertFalse();
      metrics.clear();
      expect(metrics.getSampleCount()).assertEqual(0);
      expect(metrics.getAverage()).assertEqual(0);
    });

    it('tabsStateManagementTest_sum_average_1', 0, async () => {
      const metrics = new TabsStateManagementMetricsCollector();
      metrics.record(11);
      metrics.record(21);
      metrics.record(31);
      expect(metrics.getSampleCount()).assertEqual(3);
      expect(metrics.getSum()).assertEqual(63);
      expect(metrics.getAverage()).assertEqual(21);
    });

    it('tabsStateManagementTest_max_min_1', 0, async () => {
      const metrics = new TabsStateManagementMetricsCollector();
      metrics.record(6);
      metrics.record(51);
      metrics.record(16);
      expect(metrics.getMax()).assertEqual(51);
      expect(metrics.getMin()).assertEqual(6);
      metrics.record(-1);
      expect(metrics.getSampleCount()).assertEqual(3);
    });

    it('tabsStateManagementTest_budget_1', 0, async () => {
      const metrics = new TabsStateManagementMetricsCollector();
      metrics.record(16);
      metrics.record(20);
      expect(metrics.isWithinBudget(30)).assertTrue();
      expect(metrics.isWithinBudget(10)).assertFalse();
      metrics.clear();
      expect(metrics.getSampleCount()).assertEqual(0);
      expect(metrics.getAverage()).assertEqual(0);
    });

    it('tabsStateManagementTest_sum_average_2', 0, async () => {
      const metrics = new TabsStateManagementMetricsCollector();
      metrics.record(12);
      metrics.record(22);
      metrics.record(32);
      expect(metrics.getSampleCount()).assertEqual(3);
      expect(metrics.getSum()).assertEqual(66);
      expect(metrics.getAverage()).assertEqual(22);
    });

    it('tabsStateManagementTest_max_min_2', 0, async () => {
      const metrics = new TabsStateManagementMetricsCollector();
      metrics.record(7);
      metrics.record(52);
      metrics.record(17);
      expect(metrics.getMax()).assertEqual(52);
      expect(metrics.getMin()).assertEqual(7);
      metrics.record(-1);
      expect(metrics.getSampleCount()).assertEqual(3);
    });

    it('tabsStateManagementTest_budget_2', 0, async () => {
      const metrics = new TabsStateManagementMetricsCollector();
      metrics.record(16);
      metrics.record(20);
      expect(metrics.isWithinBudget(30)).assertTrue();
      expect(metrics.isWithinBudget(10)).assertFalse();
      metrics.clear();
      expect(metrics.getSampleCount()).assertEqual(0);
      expect(metrics.getAverage()).assertEqual(0);
    });

    it('tabsStateManagementTest_set_index_in_range_0', 0, async () => {
      const tracker = new TabsStateManagementIndexTracker(5);
      expect(tracker.setIndex(0)).assertTrue();
      expect(tracker.getIndex()).assertEqual(0);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('tabsStateManagementTest_next_prev_boundary_0', 0, async () => {
      const tracker = new TabsStateManagementIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('tabsStateManagementTest_wrap_around_0', 0, async () => {
      const tracker = new TabsStateManagementIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('tabsStateManagementTest_set_index_in_range_1', 0, async () => {
      const tracker = new TabsStateManagementIndexTracker(5);
      expect(tracker.setIndex(1)).assertTrue();
      expect(tracker.getIndex()).assertEqual(1);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('tabsStateManagementTest_next_prev_boundary_1', 0, async () => {
      const tracker = new TabsStateManagementIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('tabsStateManagementTest_wrap_around_1', 0, async () => {
      const tracker = new TabsStateManagementIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('tabsStateManagementTest_set_index_in_range_2', 0, async () => {
      const tracker = new TabsStateManagementIndexTracker(5);
      expect(tracker.setIndex(2)).assertTrue();
      expect(tracker.getIndex()).assertEqual(2);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('tabsStateManagementTest_next_prev_boundary_2', 0, async () => {
      const tracker = new TabsStateManagementIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('tabsStateManagementTest_wrap_around_2', 0, async () => {
      const tracker = new TabsStateManagementIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('tabsStateManagementTest_invalid_transition_1_p1', 0, async () => {
      const machine = new TabsStateManagementStateMachine();
      expect(machine.transition(TabsStateManagementPhase.READY)).assertFalse();
      expect(machine.getCurrent()).assertEqual(TabsStateManagementPhase.IDLE);
      expect(machine.getHistoryLength()).assertEqual(0);
      expect(machine.transition(TabsStateManagementPhase.OPENING)).assertTrue();
      expect(machine.transition(TabsStateManagementPhase.CLOSED)).assertFalse();
    });

    it('tabsStateManagementTest_copy_and_reset_2_p2', 0, async () => {
      const history = new TabsStateManagementHistory();
      history.append(2);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('tabsStateManagementTest_set_get_3_p3', 0, async () => {
      const config = new TabsStateManagementConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 6)).assertEqual(6);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('tabsStateManagementTest_update_remove_4_p4', 0, async () => {
      const repo = new TabsStateManagementRepository();
      repo.put('a', 'x');
      expect(repo.update('a', 'y')).assertTrue();
      expect(repo.get('a')).assertEqual('y');
      expect(repo.update('b', 'z')).assertFalse();
      expect(repo.remove('a')).assertTrue();
      expect(repo.has('a')).assertFalse();
    });

    it('tabsStateManagementTest_budget_5_p5', 0, async () => {
      const metrics = new TabsStateManagementMetricsCollector();
      metrics.record(16);
      metrics.record(20);
      expect(metrics.isWithinBudget(30)).assertTrue();
      expect(metrics.isWithinBudget(10)).assertFalse();
      metrics.clear();
      expect(metrics.getSampleCount()).assertEqual(0);
      expect(metrics.getAverage()).assertEqual(0);
    });

    it('tabsStateManagementTest_set_index_in_range_6_p6', 0, async () => {
      const tracker = new TabsStateManagementIndexTracker(5);
      expect(tracker.setIndex(1)).assertTrue();
      expect(tracker.getIndex()).assertEqual(1);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('tabsStateManagementTest_invalid_transition_7_p7', 0, async () => {
      const machine = new TabsStateManagementStateMachine();
      expect(machine.transition(TabsStateManagementPhase.READY)).assertFalse();
      expect(machine.getCurrent()).assertEqual(TabsStateManagementPhase.IDLE);
      expect(machine.getHistoryLength()).assertEqual(0);
      expect(machine.transition(TabsStateManagementPhase.OPENING)).assertTrue();
      expect(machine.transition(TabsStateManagementPhase.CLOSED)).assertFalse();
    });

    it('tabsStateManagementTest_copy_and_reset_8_p8', 0, async () => {
      const history = new TabsStateManagementHistory();
      history.append(8);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('tabsStateManagementTest_set_get_9_p9', 0, async () => {
      const config = new TabsStateManagementConfig();
      config.set('TAB_BAR_HEIGHT', 48);
      config.set('ICON_SIZE', 16);
      expect(config.get('TAB_BAR_HEIGHT', 0)).assertEqual(48);
      expect(config.get('ICON_SIZE', 0)).assertEqual(16);
      expect(config.get('MISSING', 12)).assertEqual(12);
      expect(config.has('ICON_SIZE')).assertTrue();
    });

    it('tabsStateManagementTest_update_remove_10_p10', 0, async () => {
      const repo = new TabsStateManagementRepository();
      repo.put('a', 'x');
      expect(repo.update('a', 'y')).assertTrue();
      expect(repo.get('a')).assertEqual('y');
      expect(repo.update('b', 'z')).assertFalse();
      expect(repo.remove('a')).assertTrue();
      expect(repo.has('a')).assertFalse();
    });

    it('tabsStateManagementTest_budget_11_p11', 0, async () => {
      const metrics = new TabsStateManagementMetricsCollector();
      metrics.record(16);
      metrics.record(20);
      expect(metrics.isWithinBudget(30)).assertTrue();
      expect(metrics.isWithinBudget(10)).assertFalse();
      metrics.clear();
      expect(metrics.getSampleCount()).assertEqual(0);
      expect(metrics.getAverage()).assertEqual(0);
    });

  });
}
