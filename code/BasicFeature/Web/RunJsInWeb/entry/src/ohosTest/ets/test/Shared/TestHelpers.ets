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

/**
 * Shared analysis helpers for the RunJsInWeb suites.
 *
 * Each class is defined once here and imported by the suites that need it,
 * replacing the per-file copies that were generated earlier.
 */


// Shared analysis helpers used by multiple suites. Defining them once here
// removes the copies that previously existed in every generated test file.


export class LayoutMetricsCollector {
  private widths: number[] = [];
  private heights: number[] = [];
  private visibleCount: number = 0;

  public add(width: number, height: number, visible: boolean): void {
    this.widths.push(width);
    this.heights.push(height);
    if (visible) {
      this.visibleCount++;
    }
  }

  public totalWidth(): number {
    let total: number = 0;
    for (let i = 0; i < this.widths.length; i++) {
      total += this.widths[i];
    }
    return total;
  }

  public totalHeight(): number {
    let total: number = 0;
    for (let i = 0; i < this.heights.length; i++) {
      total += this.heights[i];
    }
    return total;
  }

  public count(): number {
    return this.widths.length;
  }

  public visible(): number {
    return this.visibleCount;
  }

  public averageWidth(): number {
    if (this.widths.length === 0) {
      return 0;
    }
    return this.totalWidth() / this.widths.length;
  }

  public clear(): void {
    this.widths = [];
    this.heights = [];
    this.visibleCount = 0;
  }
}



export class UrlInspector {
  private readonly raw: string;
  private scheme: string = '';
  private host: string = '';
  private path: string = '';

  constructor(raw: string) {
    this.raw = raw;
    this.parse();
  }

  private parse(): void {
    const schemeEnd: number = this.raw.indexOf('://');
    if (schemeEnd < 0) {
      this.path = this.raw;
      return;
    }
    this.scheme = this.raw.substring(0, schemeEnd);
    const rest: string = this.raw.substring(schemeEnd + 3);
    const slash: number = rest.indexOf('/');
    if (slash < 0) {
      this.host = rest;
    } else {
      this.host = rest.substring(0, slash);
      this.path = rest.substring(slash);
    }
  }

  public getScheme(): string {
    return this.scheme;
  }

  public getHost(): string {
    return this.host;
  }

  public getPath(): string {
    return this.path;
  }

  public isHttps(): boolean {
    return this.scheme === 'https';
  }

  public isInjection(): boolean {
    return this.scheme === 'javascript';
  }

  public isGithubPages(): boolean {
    return this.host.endsWith('.github.io');
  }

  public hasQuery(): boolean {
    return this.path.indexOf('?') >= 0;
  }

  public isValid(): boolean {
    return this.raw.length > 0 && (this.isHttps() || this.isInjection());
  }
}


export class EventBus {
  private handlers: Map<string, number> = new Map<string, number>();
  private emitted: string[] = [];

  public on(event: string): void {
    const current: number = this.handlers.get(event) ?? 0;
    this.handlers.set(event, current + 1);
  }

  public off(event: string): void {
    const current: number = this.handlers.get(event) ?? 0;
    if (current <= 1) {
      this.handlers.delete(event);
    } else {
      this.handlers.set(event, current - 1);
    }
  }

  public emit(event: string): boolean {
    const current: number = this.handlers.get(event) ?? 0;
    if (current === 0) {
      return false;
    }
    this.emitted.push(event);
    return true;
  }

  public listenerCount(event: string): number {
    return this.handlers.get(event) ?? 0;
  }

  public emittedCount(): number {
    return this.emitted.length;
  }

  public emittedEvents(): string[] {
    return [...this.emitted];
  }

  public clear(): void {
    this.handlers = new Map<string, number>();
    this.emitted = [];
  }
}

export class KeySequenceMatcher {
  private readonly target: number[];
  private readonly buffer: number[] = [];

  constructor(target: number[]) {
    this.target = [...target];
  }

  public feed(key: number): void {
    this.buffer.push(key);
    if (this.buffer.length > this.target.length) {
      this.buffer.shift();
    }
  }

  public matched(): boolean {
    if (this.buffer.length !== this.target.length) {
      return false;
    }
    for (let i = 0; i < this.target.length; i++) {
      if (this.buffer[i] !== this.target[i]) {
        return false;
      }
    }
    return true;
  }

  public lastKey(): number {
    if (this.buffer.length === 0) {
      return -1;
    }
    return this.buffer[this.buffer.length - 1];
  }

  public size(): number {
    return this.buffer.length;
  }

  public expectedSize(): number {
    return this.target.length;
  }

  public reset(): void {
    this.buffer.length = 0;
  }
}

export class ErrorClassifier {
  public static readonly NETWORK: string = 'network';
  public static readonly SCRIPT: string = 'script';
  public static readonly TIMEOUT: string = 'timeout';
  public static readonly PERMISSION: string = 'permission';
  public static readonly UNKNOWN: string = 'unknown';

  public static classify(message: string): string {
    const lower: string = message.toLowerCase();
    if (lower.indexOf('timeout') >= 0 || lower.indexOf('deadline') >= 0) {
      return ErrorClassifier.TIMEOUT;
    }
    if (lower.indexOf('network') >= 0 || lower.indexOf('socket') >= 0 || lower.indexOf('dns') >= 0) {
      return ErrorClassifier.NETWORK;
    }
    if (lower.indexOf('permission') >= 0 || lower.indexOf('denied') >= 0) {
      return ErrorClassifier.PERMISSION;
    }
    if (lower.indexOf('script') >= 0 || lower.indexOf('syntax') >= 0) {
      return ErrorClassifier.SCRIPT;
    }
    return ErrorClassifier.UNKNOWN;
  }

  public static isRecoverable(category: string): boolean {
    return category === ErrorClassifier.NETWORK || category === ErrorClassifier.TIMEOUT;
  }

  public static code(category: string): number {
    if (category === ErrorClassifier.NETWORK) {
      return 1001;
    }
    if (category === ErrorClassifier.TIMEOUT) {
      return 1002;
    }
    if (category === ErrorClassifier.SCRIPT) {
      return 1003;
    }
    if (category === ErrorClassifier.PERMISSION) {
      return 1004;
    }
    return 1099;
  }
}

export class GestureClassifier {
  public static readonly TAP: string = 'tap';
  public static readonly LONG_PRESS: string = 'long_press';
  public static readonly SWIPE: string = 'swipe';

  private readonly longPressMs: number;
  private readonly moveTolerance: number;

  constructor(longPressMs: number = 500, moveTolerance: number = 20) {
    this.longPressMs = longPressMs;
    this.moveTolerance = moveTolerance;
  }

  public classify(durationMs: number, distance: number): string {
    if (distance > this.moveTolerance) {
      return GestureClassifier.SWIPE;
    }
    if (durationMs >= this.longPressMs) {
      return GestureClassifier.LONG_PRESS;
    }
    return GestureClassifier.TAP;
  }

  public isLongPress(durationMs: number, distance: number): boolean {
    return this.classify(durationMs, distance) === GestureClassifier.LONG_PRESS;
  }

  public isTap(durationMs: number, distance: number): boolean {
    return this.classify(durationMs, distance) === GestureClassifier.TAP;
  }

  public repeatCount(durationMs: number, intervalMs: number): number {
    if (intervalMs <= 0) {
      return 0;
    }
    return Math.floor(durationMs / intervalMs);
  }
}


export class SnapshotStore {
  private snapshots: Map<string, string> = new Map<string, string>();
  private order: string[] = [];

  public save(name: string, value: string): void {
    if (!this.snapshots.has(name)) {
      this.order.push(name);
    }
    this.snapshots.set(name, value);
  }

  public restore(name: string): string {
    const value: string | undefined = this.snapshots.get(name);
    return value === undefined ? '' : value;
  }

  public has(name: string): boolean {
    return this.snapshots.has(name);
  }

  public names(): string[] {
    return [...this.order];
  }

  public size(): number {
    return this.order.length;
  }

  public remove(name: string): boolean {
    if (!this.snapshots.has(name)) {
      return false;
    }
    this.snapshots.delete(name);
    const index: number = this.order.indexOf(name);
    if (index >= 0) {
      this.order.splice(index, 1);
    }
    return true;
  }

  public clear(): void {
    this.snapshots = new Map<string, string>();
    this.order = [];
  }
}

export class ThemeResolver {
  private palette: Map<string, string> = new Map<string, string>();

  constructor() {
    this.palette.set('light_background', '#FFFFFF');
    this.palette.set('dark_background', '#000000');
    this.palette.set('control_red', '#FF0000');
    this.palette.set('web_orange', '#FFA500');
  }

  public resolve(name: string): string {
    const value: string | undefined = this.palette.get(name);
    return value === undefined ? '#000000' : value;
  }

  public has(name: string): boolean {
    return this.palette.has(name);
  }

  public isDark(name: string): boolean {
    const value: string = this.resolve(name);
    return value === '#000000' || value === '#111111';
  }

  public brightness(hex: string): number {
    if (hex.length !== 7 || hex.charAt(0) !== '#') {
      return 0;
    }
    const red: number = parseInt(hex.substring(1, 3), 16);
    const green: number = parseInt(hex.substring(3, 5), 16);
    const blue: number = parseInt(hex.substring(5, 7), 16);
    return (red * 299 + green * 587 + blue * 114) / 1000;
  }

  public count(): number {
    return this.palette.size;
  }
}
