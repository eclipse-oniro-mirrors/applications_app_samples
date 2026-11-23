'use static';

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

import { DataChangeListener } from '@ohos.arkui.component';
import { CustomDataType } from '../../../../main/ets/pages/SecondaryLinkage/DataType';
import {
  daysInMonth,
  firstWeekday,
  isLeapYear,
  normalizeMonth,
  expectedGrid,
  monthLabel,
  clamp,
  WEEK_LABELS,
} from './Support';
import { DataOperation } from '@ohos.arkui.component';

/**
 * Recorded data source event. The recorder keeps a stable textual form so
 * traces can be compared between runs and fingerprinted for equality.
 */
export class ChangeEvent {
  public kind: string;
  public first: int;
  public second: int;

  constructor(kind: string, first: int, second: int) {
    this.kind = kind;
    this.first = first;
    this.second = second;
  }

  public describe(): string {
    if (this.kind === 'move') {
      return 'move:' + this.first.toString() + ':' + this.second.toString();
    }
    if (this.kind === 'reload') {
      return 'reload';
    }
    return this.kind + ':' + this.first.toString();
  }
}

/**
 * DataChangeListener implementation used by every data source suite. It only
 * records callbacks, it never renders anything and never touches a device.
 */
export class EventRecorder implements DataChangeListener {
  public events: ChangeEvent[] = [];

  public onDatasetChange(dataOperations: DataOperation[]): void {
    this.events.push(new ChangeEvent('dataset', dataOperations.length, -1));
  }

  public onDataReloaded(): void {
    this.events.push(new ChangeEvent('reload', -1, -1));
  }

  public onDataAdd(index: int): void {
    this.events.push(new ChangeEvent('add', index.toInt(), -1));
  }

  public onDataChange(index: int): void {
    this.events.push(new ChangeEvent('change', index.toInt(), -1));
  }

  public onDataDelete(index: int): void {
    this.events.push(new ChangeEvent('delete', index.toInt(), -1));
  }

  public onDataMove(from: int, to: int): void {
    this.events.push(new ChangeEvent('move', from.toInt(), to.toInt()));
  }

  public onDataAdded(index: number): void {
    this.onDataAdd(index.toInt());
  }

  public onDataChanged(index: number): void {
    this.onDataChange(index.toInt());
  }

  public onDataDeleted(index: number): void {
    this.onDataDelete(index.toInt());
  }

  public onDataMoved(from: number, to: number): void {
    this.onDataMove(from.toInt(), to.toInt());
  }

  public size(): int {
    return this.events.length;
  }

  public last(): string {
    if (this.events.length === 0) {
      return '';
    }
    return this.events[this.events.length - 1].describe();
  }

  public trace(): string {
    let text: string = '';
    for (let index = 0; index < this.events.length; index++) {
      if (index > 0) {
        text = text + '|';
      }
      text = text + this.events[index].describe();
    }
    return text;
  }

  public countOf(kind: string): int {
    let total: int = 0;
    for (let index = 0; index < this.events.length; index++) {
      if (this.events[index].kind === kind) {
        total = total + 1;
      }
    }
    return total;
  }

  public reset(): void {
    this.events = [];
  }
}

/** Structural facts about one produced calendar grid. */
export class GridFacts {
  public length: int = 0;
  public leading: int = 0;
  public trailing: int = 0;
  public days: int = 0;
  public rows: int = 0;
  public endsOnSaturday: boolean = false;
  public startsOnWeekday: int = 0;
}

/** Pure inspector over a grid value list; nothing here calls the page code. */
export class GridInspector {
  public static facts(values: int[]): GridFacts {
    const facts: GridFacts = new GridFacts();
    facts.length = values.length;
    let leading: int = 0;
    while (leading < values.length && values[leading] === 0) {
      leading = leading + 1;
    }
    let trailing: int = 0;
    let cursor: int = values.length - 1;
    while (cursor >= 0 && values[cursor] === 0) {
      trailing = trailing + 1;
      cursor = cursor - 1;
    }
    facts.leading = leading;
    facts.trailing = trailing;
    facts.days = values.length - leading - trailing;
    facts.rows = Math.floor(values.length / 7).toInt();
    facts.endsOnSaturday = values.length > 0 && values.length % 7 === 0;
    facts.startsOnWeekday = leading;
    return facts;
  }

  public static minValue(values: int[]): int {
    let minimum: int = values.length === 0 ? 0 : values[0];
    for (let index = 1; index < values.length; index++) {
      if (values[index] < minimum) {
        minimum = values[index];
      }
    }
    return minimum;
  }

  public static maxValue(values: int[]): int {
    let maximum: int = values.length === 0 ? 0 : values[0];
    for (let index = 1; index < values.length; index++) {
      if (values[index] > maximum) {
        maximum = values[index];
      }
    }
    return maximum;
  }

  /** Slot index that displays the supplied day number, or -1 when hidden. */
  public static slotOfDay(values: int[], day: int): int {
    if (day <= 0) {
      return -1;
    }
    for (let index = 0; index < values.length; index++) {
      if (values[index] === day) {
        return index;
      }
    }
    return -1;
  }

  /** Weekday of a day inside a month, derived from the grid itself. */
  public static isRealDay(values: int[], slot: int): boolean {
    return slot >= 0 && slot < values.length && values[slot] > 0;
  }

  public static weekdayOfDay(values: int[], day: int): int {
    const slot: int = GridInspector.slotOfDay(values, day);
    if (slot < 0) {
      return -1;
    }
    return slot % 7;
  }

  /** Verifies that leading placeholders equal the weekday of day one. */
  public static leadingMatchesWeekday(values: int[]): boolean {
    const facts: GridFacts = GridInspector.facts(values);
    return facts.leading === facts.startsOnWeekday && facts.leading >= 0 && facts.leading <= 6;
  }

  /** Groups a grid into rows of seven entries for layout checks. */
  public static rowsOf(values: int[]): int[][] {
    const result: int[][] = [];
    for (let start = 0; start < values.length; start = start + 7) {
      const row: int[] = [];
      for (let offset = 0; offset < 7; offset++) {
        const index: int = start + offset;
        row.push(index < values.length ? values[index] : -1);
      }
      result.push(row);
    }
    return result;
  }
}

/** Typed factory for cascade list entries used by the data source suites. */
export function makeDataEntry(desc: string, tag: string): CustomDataType {
  const entry: CustomDataType = { desc: desc, tag: tag };
  return entry;
}

/** One month entry of the calendar list, mirroring the page data shape. */
export class PanelMonth {
  public label: string;
  public num: int;
  public days: int[];
  public year: int;

  constructor(label: string, num: int, days: int[], year: int) {
    this.label = label;
    this.num = num;
    this.days = days;
    this.year = year;
  }
}

/** Builds consecutive month panels starting at the supplied month. */
export class PanelBuilder {
  public static build(month: int, year: int, count: int): PanelMonth[] {
    const panels: PanelMonth[] = [];
    let cursorMonth: int = month;
    let cursorYear: int = year;
    for (let index = 0; index < count; index++) {
      panels.push(
        new PanelMonth(
          monthLabel(cursorMonth, cursorYear),
          cursorMonth,
          expectedGrid(cursorMonth, cursorYear),
          cursorYear,
        ),
      );
      cursorMonth = cursorMonth + 1;
      if (cursorMonth > 12) {
        cursorMonth = 1;
        cursorYear = cursorYear + 1;
      }
    }
    return panels;
  }

  /** Month following the supplied pair, rolling into the next year. */
  public static nextMonth(month: int, year: int): int {
    const pair: int[] = normalizeMonth(month + 1, year);
    return pair[1];
  }

  public static nextYear(month: int, year: int): int {
    const pair: int[] = normalizeMonth(month + 1, year);
    return pair[0];
  }
}

/**
 * Selection rules extracted from the calendar panel: a day can be chosen when
 * it is not in the past relative to the currently displayed month and year.
 */
export class SelectionGuard {
  public static canSelect(
    day: int,
    panelMonth: int,
    panelYear: int,
    currentDay: int,
    currentMonth: int,
    currentYear: int,
  ): boolean {
    if (panelYear > currentYear) {
      return day > 0;
    }
    if (panelYear < currentYear) {
      return false;
    }
    if (panelMonth > currentMonth) {
      return day > 0;
    }
    if (panelMonth < currentMonth) {
      return false;
    }
    return day >= currentDay;
  }

  /** Weekday assigned to a chosen cell, computed from the grid position. */
  public static weekdayFromGrid(grid: int[], day: int): int {
    const slot: int = GridInspector.slotOfDay(grid, day);
    if (slot < 0) {
      return -1;
    }
    return slot % 7;
  }
}

/** Projection of one calendar cell to the visual flags the view uses. */
export class CellStyle {
  public visible: boolean = false;
  public dimmed: boolean = false;
  public highlighted: boolean = false;
  public selectable: boolean = false;
  public label: string = '';
}

export class CellProjector {
  public static project(
    day: int,
    panelMonth: int,
    panelYear: int,
    currentDay: int,
    currentMonth: int,
    currentYear: int,
  ): CellStyle {
    const style: CellStyle = new CellStyle();
    style.label = day.toString();
    style.visible = day !== 0;
    style.highlighted = day === currentDay && panelMonth === currentMonth && panelYear === currentYear;
    style.dimmed = day > 0 && day < currentDay && panelMonth === currentMonth && panelYear === currentYear;
    style.selectable = SelectionGuard.canSelect(day, panelMonth, panelYear, currentDay, currentMonth, currentYear);
    return style;
  }
}

/** Week header entry with the weekend emphasis flag. */
export class WeekHeaderEntry {
  public label: string;
  public emphasized: boolean;

  constructor(label: string, emphasized: boolean) {
    this.label = label;
    this.emphasized = emphasized;
  }
}

export class WeekHeader {
  public static entries(): WeekHeaderEntry[] {
    const result: WeekHeaderEntry[] = [];
    for (let index = 0; index < WEEK_LABELS.length; index++) {
      const emphasized: boolean = index === 0 || index === 6;
      result.push(new WeekHeaderEntry(WEEK_LABELS[index], emphasized));
    }
    return result;
  }
}

/** Retry budget model shared by the recovery oriented suites. */
export class RetryBudget {
  public attempts: int = 0;
  public maxAttempts: int;
  public succeeded: boolean = false;

  constructor(maxAttempts: int) {
    this.maxAttempts = maxAttempts;
  }

  public attempt(worker: () => boolean): boolean {
    while (this.attempts < this.maxAttempts) {
      this.attempts = this.attempts + 1;
      if (worker()) {
        this.succeeded = true;
        return true;
      }
    }
    return false;
  }

  public exhausted(): boolean {
    return !this.succeeded && this.attempts >= this.maxAttempts;
  }
}

/** Deterministic pseudo random stream, no platform dependency. */
export class StableRandom {
  private state: int;

  constructor(seed: int) {
    this.state = seed === 0 ? (2463534242).toInt() : seed;
  }

  public next(): int {
    let value: int = this.state;
    value = value ^ (value << 13);
    value = value ^ (value >> 17);
    value = value ^ (value << 5);
    this.state = value;
    return Math.abs(value);
  }

  public nextInRange(low: int, high: int): int {
    const span: int = high - low + 1;
    return low + (this.next() % span);
  }
}

/** Energy accounting model used by the performance suites. */
export class EnergyLedger {
  public milliwattSeconds: double = 0;

  public charge(cost: double): void {
    this.milliwattSeconds = this.milliwattSeconds + cost;
  }

  public chargeOperation(count: int, unitCost: double): void {
    this.charge(count * unitCost);
  }

  public average(count: int): double {
    if (count <= 0) {
      return 0;
    }
    return this.milliwattSeconds / count;
  }
}

/** Simple monotonic clock wrapper in milliseconds. */
export class Stopwatch {
  private started: double = 0;
  private stopped: double = 0;
  private running: boolean = false;

  public start(): void {
    this.started = new Date().getTime();
    this.running = true;
  }

  public stop(): double {
    this.stopped = new Date().getTime();
    this.running = false;
    return this.elapsed();
  }

  public elapsed(): double {
    if (!this.running && this.stopped > 0) {
      return this.stopped - this.started;
    }
    return new Date().getTime() - this.started;
  }

  public isRunning(): boolean {
    return this.running;
  }
}

/** Calendar math helpers used directly by suites that need short forms. */
export class CalendarMath {
  public static totalFor(month: int, year: int): int {
    const pair: int[] = normalizeMonth(month, year);
    return daysInMonth(pair[1], pair[0]);
  }

  public static leadFor(month: int, year: int): int {
    const pair: int[] = normalizeMonth(month, year);
    return firstWeekday(pair[1], pair[0]);
  }

  public static leap(year: int): boolean {
    return isLeapYear(year);
  }

  public static bounded(value: int): int {
    return clamp(value, 0, 6);
  }
}
