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

/** Configuration snapshot the pages react to on a configuration change. */
export class ConfigSnapshot {
  public orientation: string;
  public colorMode: string;
  public fontScale: double;
  public language: string;

  constructor(orientation: string, colorMode: string, fontScale: double, language: string) {
    this.orientation = orientation;
    this.colorMode = colorMode;
    this.fontScale = fontScale;
    this.language = language;
  }

  public describe(): string {
    return this.orientation + '/' + this.colorMode + '/' + this.fontScale.toFixed(2) + '/' + this.language;
  }

  public isValid(): boolean {
    const orientationOk: boolean = this.orientation === 'portrait' || this.orientation === 'landscape';
    const modeOk: boolean = this.colorMode === 'light' || this.colorMode === 'dark';
    const scaleOk: boolean = this.fontScale >= 0.85 && this.fontScale <= 3.2;
    return orientationOk && modeOk && scaleOk;
  }
}

/** Panel state machine for the calendar drop down and the details page. */
export class PanelMachine {
  public state: string = 'closed';
  public static readonly STATES: string[] = ['closed', 'opening', 'open', 'closing', 'failed'];

  public static canTransition(from: string, to: string): boolean {
    if (from === 'closed') {
      return to === 'opening';
    }
    if (from === 'opening') {
      return to === 'open' || to === 'failed';
    }
    if (from === 'open') {
      return to === 'closing';
    }
    if (from === 'closing') {
      return to === 'closed';
    }
    if (from === 'failed') {
      return to === 'opening' || to === 'closed';
    }
    return false;
  }

  public transition(to: string): boolean {
    if (!PanelMachine.canTransition(this.state, to)) {
      return false;
    }
    this.state = to;
    return true;
  }

  public open(): void {
    this.transition('opening');
    this.transition('open');
  }

  public close(): void {
    this.transition('closing');
    this.transition('closed');
  }
}

/** Session store with the four lifecycle states used by the entry ability. */
export class SessionStore {
  public state: string = 'created';
  public static readonly ORDER: string[] = ['created', 'foreground', 'background', 'destroyed'];

  public static canMove(from: string, to: string): boolean {
    if (from === 'created') {
      return to === 'foreground' || to === 'destroyed';
    }
    if (from === 'foreground') {
      return to === 'background' || to === 'destroyed';
    }
    if (from === 'background') {
      return to === 'foreground' || to === 'destroyed';
    }
    return false;
  }

  public move(to: string): boolean {
    if (!SessionStore.canMove(this.state, to)) {
      return false;
    }
    this.state = to;
    return true;
  }

  public rank(): int {
    for (let index = 0; index < SessionStore.ORDER.length; index++) {
      if (SessionStore.ORDER[index] === this.state) {
        return index;
      }
    }
    return -1;
  }
}

/** Key value snapshot used by the persistence and recovery suites. */
export class Snapshot {
  public fields: string[] = [];

  public put(key: string, value: string): void {
    this.fields.push(key + '=' + value);
  }

  public encode(): string {
    let text: string = '';
    for (let index = 0; index < this.fields.length; index++) {
      if (index > 0) {
        text = text + ';';
      }
      text = text + this.fields[index];
    }
    return text;
  }

  public static decode(text: string): Snapshot {
    const snapshot: Snapshot = new Snapshot();
    if (text.length === 0) {
      return snapshot;
    }
    let start: int = 0;
    for (let index = 0; index <= text.length; index++) {
      if (index === text.length || text.charAt(index).toString() === ';') {
        snapshot.fields.push(text.substring(start, index));
        start = index + 1;
      }
    }
    return snapshot;
  }

  public get(key: string): string {
    for (let index = 0; index < this.fields.length; index++) {
      const field: string = this.fields[index];
      if (field.startsWith(key + '=')) {
        return field.substring(key.length + 1);
      }
    }
    return '';
  }
}

/** Fixed capacity resource pool with leak accounting. */
export class ResourcePool {
  public capacity: int;
  public inUse: int = 0;
  public highWater: int = 0;

  constructor(capacity: int) {
    this.capacity = capacity;
  }

  public acquire(): boolean {
    if (this.inUse >= this.capacity) {
      return false;
    }
    this.inUse = this.inUse + 1;
    if (this.inUse > this.highWater) {
      this.highWater = this.inUse;
    }
    return true;
  }

  public release(count: int): int {
    this.inUse = this.inUse - count;
    if (this.inUse < 0) {
      this.inUse = 0;
    }
    return this.inUse;
  }

  public leaked(): int {
    return this.inUse;
  }

  public saturated(): boolean {
    return this.inUse === this.capacity;
  }
}

/** Offline queue that drains in order once connectivity returns. */
export class OfflineQueue {
  public pending: string[] = [];

  public enqueue(action: string): int {
    this.pending.push(action);
    return this.pending.length;
  }

  public drain(online: boolean): string[] {
    const drained: string[] = [];
    if (!online) {
      return drained;
    }
    while (this.pending.length > 0) {
      drained.push(this.pending[0]);
      this.pending.splice(0, 1);
    }
    return drained;
  }

  public size(): int {
    return this.pending.length;
  }
}

/** Classifies failures so suites can assert recovery behaviour. */
export class ErrorClassifier {
  public static classify(code: int): string {
    if (code >= 200 && code < 300) {
      return 'ok';
    }
    if (code >= 400 && code < 500) {
      return 'client';
    }
    if (code >= 500 && code < 600) {
      return 'server';
    }
    if (code === 0) {
      return 'network';
    }
    return 'unknown';
  }

  public static recoverable(kind: string): boolean {
    return kind === 'network' || kind === 'server';
  }

  public static backoffDelay(attempt: int, base: int): int {
    if (attempt <= 0) {
      return base;
    }
    const factor: number = Math.pow(2, attempt);
    const capped: number = base * factor;
    return capped > 8000 ? 8000 : capped.toInt();
  }
}
