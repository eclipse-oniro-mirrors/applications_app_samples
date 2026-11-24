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
 */// State snapshot returned by the lifecycle state machine.
export interface SnapshotResult {
  valid: boolean;
  state: string;
  historyLength: number;
}

// Lifecycle state machine mirroring EmbeddedUIExtAbility callback ordering.
export class LifecycleStateMachine {
  private state: string = 'idle';
  private history: string[] = [];

  public current(): string {
    return this.state;
  }

  public canTransition(event: string): boolean {
    if (this.state === 'idle') {
      return event === 'onCreate';
    }
    if (this.state === 'created') {
      return event === 'onForeground' || event === 'onDestroy';
    }
    if (this.state === 'foreground') {
      return event === 'onBackground' || event === 'onDestroy';
    }
    if (this.state === 'background') {
      return event === 'onForeground' || event === 'onDestroy';
    }
    return false;
  }

  public transition(event: string): boolean {
    if (!this.canTransition(event)) {
      return false;
    }
    this.history.push(event);
    if (event === 'onCreate') {
      this.state = 'created';
    } else if (event === 'onForeground') {
      this.state = 'foreground';
    } else if (event === 'onBackground') {
      this.state = 'background';
    } else if (event === 'onDestroy') {
      this.state = 'destroyed';
    }
    return true;
  }

  public getHistory(): string[] {
    return [...this.history];
  }

  public historyLength(): number {
    return this.history.length;
  }

  public reset(): void {
    this.state = 'idle';
    this.history = [];
  }

  public snapshot(): SnapshotResult {
    const result: SnapshotResult = {
      valid: this.state.length > 0,
      state: this.state,
      historyLength: this.history.length
    };
    return result;
  }
}

export interface SessionRecord {
  id: string;
  state: string;
  payload: string;
}

// Session registry mirroring UIExtensionContentSession lifecycle tracking.
export class SessionRegistry {
  private sessions: Map<string, SessionRecord> = new Map<string, SessionRecord>();

  public register(id: string, state: string, payload: string): boolean {
    if (id.length === 0) {
      return false;
    }
    const record: SessionRecord = { id: id, state: state, payload: payload };
    this.sessions.set(id, record);
    return true;
  }

  public get(id: string): SessionRecord | null {
    const record: SessionRecord | undefined = this.sessions.get(id);
    if (record === undefined) {
      return null;
    }
    return record;
  }

  public updateState(id: string, state: string): boolean {
    const record: SessionRecord | undefined = this.sessions.get(id);
    if (record === undefined) {
      return false;
    }
    const updated: SessionRecord = { id: record.id, state: state, payload: record.payload };
    this.sessions.set(id, updated);
    return true;
  }

  public remove(id: string): boolean {
    return this.sessions.delete(id);
  }

  public size(): number {
    return this.sessions.size;
  }

  public list(): SessionRecord[] {
    const result: SessionRecord[] = [];
    this.sessions.forEach((value: SessionRecord) => {
      result.push(value);
    });
    return result;
  }

  public clear(): void {
    this.sessions.clear();
  }
}

export interface ConfigEntry {
  key: string;
  value: string;
}

// Configuration profile mirroring module.json5 embedded extension entries.
export class ConfigProfile {
  private entries: Map<string, string> = new Map<string, string>();

  public set(key: string, value: string): void {
    this.entries.set(key, value);
  }

  public get(key: string, fallback: string): string {
    const value: string | undefined = this.entries.get(key);
    if (value === undefined) {
      return fallback;
    }
    return value;
  }

  public has(key: string): boolean {
    return this.entries.has(key);
  }

  public keys(): string[] {
    const result: string[] = [];
    this.entries.forEach((value: string, key: string) => {
      result.push(key);
    });
    return result;
  }

  public size(): number {
    return this.entries.size;
  }

  public toRecord(): Record<string, string> {
    const record: Record<string, string> = {};
    this.entries.forEach((value: string, key: string) => {
      record[key] = value;
    });
    return record;
  }

  public clear(): void {
    this.entries.clear();
  }
}
export interface TimingSample {
  label: string;
  durationMs: number;
}

// Timing meter for render and session latency budgets.
export class TimingMeter {
  private samples: TimingSample[] = [];

  public record(label: string, durationMs: number): void {
    const sample: TimingSample = { label: label, durationMs: durationMs };
    this.samples.push(sample);
  }

  public count(): number {
    return this.samples.length;
  }

  public max(): number {
    let result: number = 0;
    this.samples.forEach((sample: TimingSample) => {
      if (sample.durationMs > result) {
        result = sample.durationMs;
      }
    });
    return result;
  }

  public average(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let total: number = 0;
    this.samples.forEach((sample: TimingSample) => {
      total += sample.durationMs;
    });
    return total / this.samples.length;
  }

  public withinBudget(budgetMs: number): boolean {
    return this.max() <= budgetMs;
  }

  public clear(): void {
    this.samples = [];
  }
}

export interface JournalEntry {
  name: string;
  payload: string;
  sequence: number;
}

// Event journal for page_show common events and lifecycle callbacks.
export class EventJournal {
  private entries: JournalEntry[] = [];
  private sequence: number = 0;

  public append(name: string, payload: string): void {
    this.sequence++;
    const entry: JournalEntry = { name: name, payload: payload, sequence: this.sequence };
    this.entries.push(entry);
  }

  public count(): number {
    return this.entries.length;
  }

  public names(): string[] {
    const result: string[] = [];
    this.entries.forEach((entry: JournalEntry) => {
      result.push(entry.name);
    });
    return result;
  }

  public contains(name: string): boolean {
    let found: boolean = false;
    this.entries.forEach((entry: JournalEntry) => {
      if (entry.name === name) {
        found = true;
      }
    });
    return found;
  }

  public last(): JournalEntry | null {
    if (this.entries.length === 0) {
      return null;
    }
    return this.entries[this.entries.length - 1];
  }

  public clear(): void {
    this.entries = [];
    this.sequence = 0;
  }
}

export interface PayloadShape {
  bundleName: string;
  abilityName: string;
  sessionId: string;
}

// Payload codec used to validate Want and LocalStorage transfer objects.
export class PayloadCodec {
  public encode(payload: PayloadShape): string {
    return JSON.stringify(payload);
  }

  public decode(text: string): PayloadShape | null {
    try {
      const parsed: PayloadShape = JSON.parse(text) as PayloadShape;
      if (parsed === null || parsed === undefined) {
        return null;
      }
      return parsed;
    } catch (error) {
      return null;
    }
  }

  public roundTripOk(payload: PayloadShape): boolean {
    const text: string = this.encode(payload);
    const restored: PayloadShape | null = this.decode(text);
    if (restored === null) {
      return false;
    }
    return restored.bundleName === payload.bundleName && restored.abilityName === payload.abilityName &&
      restored.sessionId === payload.sessionId;
  }
}

export interface ProbeResult {
  passed: number;
  failed: number;
  score: number;
}

// Health probe used by stability and recovery suites.
export class HealthProbe {
  private passed: number = 0;
  private failed: number = 0;

  public pass(): void {
    this.passed++;
  }

  public fail(): void {
    this.failed++;
  }

  public score(): number {
    const total: number = this.passed + this.failed;
    if (total === 0) {
      return 100;
    }
    return Math.round((this.passed / total) * 100);
  }

  public result(): ProbeResult {
    const result: ProbeResult = { passed: this.passed, failed: this.failed, score: this.score() };
    return result;
  }

  public reset(): void {
    this.passed = 0;
    this.failed = 0;
  }
}

// Value validator shared by validation suites.
export class ValueValidator {
  public static isNonEmptyString(value: string): boolean {
    return value.length > 0;
  }

  public static isValidBundleName(value: string): boolean {
    if (value.length === 0) {
      return false;
    }
    const firstCode: number = value.charCodeAt(0);
    const firstIsLetter: boolean = (firstCode >= 65 && firstCode <= 90) || (firstCode >= 97 && firstCode <= 122);
    if (!firstIsLetter) {
      return false;
    }
    for (let i = 1; i < value.length; i++) {
      const code: number = value.charCodeAt(i);
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      const isDigit: boolean = code >= 48 && code <= 57;
      const isAllowed: boolean = isUpper || isLower || isDigit || code === 95 || code === 46;
      if (!isAllowed) {
        return false;
      }
    }
    return true;
  }

  public static isValidSessionId(value: number): boolean {
    return value > 0;
  }

  public static isInRange(value: number, min: number, max: number): boolean {
    return value >= min && value <= max;
  }

  public static isWithinLength(value: string, max: number): boolean {
    return value.length <= max;
  }
}

// Business constants mirrored from the embedded UI extension sample.
export class ExtensionConstants {
  public static readonly BUNDLE_NAME: string = 'com.samples.embeddeduiextensionability';
  public static readonly ABILITY_NAME: string = 'EmbeddedUIExtAbility';
  public static readonly ENTRY_ABILITY: string = 'EntryAbility';
  public static readonly PAGE_SHOW_EVENT: string = 'page_show';
  public static readonly PROVIDER_MESSAGE: string = 'EmbeddedUIExtensionAbility provider';
  public static readonly CONSUMER_MESSAGE: string = 'EmbeddedUIExtAbility User';
  public static readonly LOG_TAG: string = '[Sample_EmbeddedUIExtensionAbility]';
  public static readonly MAIN_PAGE: string = 'pages/Index';
  public static readonly EXTENSION_PAGE: string = 'pages/extension';
}
// Focus path model recording navigation sequences in the embedded page.
export class FocusPathModel {
  private indices: number[] = [];

  public append(index: number): void {
    this.indices.push(index);
  }

  public path(): number[] {
    return [...this.indices];
  }

  public length(): number {
    return this.indices.length;
  }

  public first(): number {
    if (this.indices.length === 0) {
      return -1;
    }
    return this.indices[0];
  }

  public last(): number {
    if (this.indices.length === 0) {
      return -1;
    }
    return this.indices[this.indices.length - 1];
  }

  public isMonotonic(): boolean {
    for (let i = 1; i < this.indices.length; i++) {
      if (this.indices[i] < this.indices[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public reset(): void {
    this.indices = [];
  }
}

// Retry policy used when session creation or page loading transiently fails.
export class RetryPolicy {
  private maxAttempts: number;

  constructor(maxAttempts: number) {
    this.maxAttempts = maxAttempts;
  }

  public getMaxAttempts(): number {
    return this.maxAttempts;
  }

  public shouldRetry(attempt: number): boolean {
    return attempt >= 0 && attempt <= this.maxAttempts;
  }

  public nextDelay(attempt: number): number {
    return attempt * 100;
  }
}

// Bounded queue used to cap pending session and event records.
export class BoundedQueue {
  private items: number[] = [];
  private limit: number;

  constructor(limit: number) {
    this.limit = limit;
  }

  public capacity(): number {
    return this.limit;
  }

  public push(value: number): boolean {
    if (this.items.length >= this.limit) {
      return false;
    }
    this.items.push(value);
    return true;
  }

  public pop(): number {
    if (this.items.length === 0) {
      return -1;
    }
    const value: number | undefined = this.items.shift();
    if (value === undefined) {
      return -1;
    }
    return value;
  }

  public size(): number {
    return this.items.length;
  }

  public isFull(): boolean {
    return this.items.length >= this.limit;
  }

  public clear(): void {
    this.items = [];
  }
}

// Key sequence helper used by remote control navigation suites.
export class KeySequence {
  private keys: number[] = [];

  public append(key: number): void {
    this.keys.push(key);
  }

  public keysList(): number[] {
    return [...this.keys];
  }

  public count(): number {
    return this.keys.length;
  }

  public last(): number {
    if (this.keys.length === 0) {
      return -1;
    }
    return this.keys[this.keys.length - 1];
  }

  public contains(key: number): boolean {
    return this.keys.indexOf(key) >= 0;
  }

  public clear(): void {
    this.keys = [];
  }
}

// UI snapshot model used to compare component and text counts across frames.
export class UiSnapshotModel {
  private componentCount: number = 0;
  private textCount: number = 0;
  private focusIndex: number = -1;

  public capture(componentCount: number, textCount: number, focusIndex: number): UiSnapshotModel {
    this.componentCount = componentCount;
    this.textCount = textCount;
    this.focusIndex = focusIndex;
    return this;
  }

  public getComponentCount(): number {
    return this.componentCount;
  }

  public getTextCount(): number {
    return this.textCount;
  }

  public getFocusIndex(): number {
    return this.focusIndex;
  }

  public isStableComparedTo(other: UiSnapshotModel, tolerance: number): boolean {
    return Math.abs(this.componentCount - other.getComponentCount()) <= tolerance;
  }
}

// Resource ledger tracks sessions, windows and content handles.
export class ResourceLedger {
  private active: Map<string, number> = new Map<string, number>();
  private total: number = 0;

  public acquire(name: string): void {
    this.total++;
    const current: number | undefined = this.active.get(name);
    if (current === undefined) {
      this.active.set(name, 1);
    } else {
      this.active.set(name, current + 1);
    }
  }

  public release(name: string): boolean {
    const current: number | undefined = this.active.get(name);
    if (current === undefined || current <= 0) {
      return false;
    }
    if (current === 1) {
      this.active.delete(name);
    } else {
      this.active.set(name, current - 1);
    }
    return true;
  }

  public activeCount(): number {
    let count: number = 0;
    this.active.forEach((value: number) => {
      count += value;
    });
    return count;
  }

  public totalAcquired(): number {
    return this.total;
  }

  public reset(): void {
    this.active = new Map<string, number>();
    this.total = 0;
  }
}

export interface ExtensionDescriptor {
  name: string;
  type: string;
  exported: boolean;
  description: string;
}

// Registry for embedded UI extension descriptors declared in module.json5.
export class ExtensionDescriptorRegistry {
  private descriptors: Map<string, ExtensionDescriptor> = new Map<string, ExtensionDescriptor>();

  public register(descriptor: ExtensionDescriptor): boolean {
    if (descriptor.name.length === 0) {
      return false;
    }
    this.descriptors.set(descriptor.name, descriptor);
    return true;
  }

  public get(name: string): ExtensionDescriptor | null {
    const descriptor: ExtensionDescriptor | undefined = this.descriptors.get(name);
    if (descriptor === undefined) {
      return null;
    }
    return descriptor;
  }

  public names(): string[] {
    const result: string[] = [];
    this.descriptors.forEach((value: ExtensionDescriptor, key: string) => {
      result.push(key);
    });
    return result;
  }

  public size(): number {
    return this.descriptors.size;
  }

  public clear(): void {
    this.descriptors.clear();
  }
}

export interface ExtensionSummary {
  name: string;
  abilityName: string;
  pagePath: string;
  message: string;
}

// Builder for the embedded extension page summary.
export class ExtensionSummaryBuilder {
  private name: string = '';
  private abilityName: string = '';
  private pagePath: string = '';
  private message: string = '';

  public setName(name: string): ExtensionSummaryBuilder {
    this.name = name;
    return this;
  }

  public setAbility(abilityName: string): ExtensionSummaryBuilder {
    this.abilityName = abilityName;
    return this;
  }

  public setPage(pagePath: string): ExtensionSummaryBuilder {
    this.pagePath = pagePath;
    return this;
  }

  public setMessage(message: string): ExtensionSummaryBuilder {
    this.message = message;
    return this;
  }

  public build(): ExtensionSummary {
    const summary: ExtensionSummary = {
      name: this.name,
      abilityName: this.abilityName,
      pagePath: this.pagePath,
      message: this.message
    };
    return summary;
  }
}
