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

export interface ExecutorClock {
  setTimeout(action: () => void, delay: number): number;
  clearTimeout(id: number): void;
}

export class WaitResult<T> {
  public status: string = 'error';
  public value: T | undefined = undefined;
  public error: Error | undefined = undefined;
}

/** Local timeout/cancel never cancels SDK work. Unsettled work quarantines all new runs. */
export class SafeExecutor {
  private serial: number = 0;
  private owner: number = 0;
  private pending: number = 0;
  private cancelWait: (() => void) | undefined = undefined;
  private stopped: string = '';
  private readonly clock: ExecutorClock;
  private readonly changed: () => void;

  constructor(clock: ExecutorClock, changed: () => void) {
    this.clock = clock;
    this.changed = changed;
  }

  acquire(): number {
    if (this.busy()) { return 0; }
    this.owner = ++this.serial;
    this.stopped = '';
    return this.owner;
  }

  busy(): boolean { return this.owner !== 0 || this.pending > 0; }
  quarantined(): boolean { return this.pending > 0 && (this.owner === 0 || this.stopped.length > 0); }
  reason(): string { return this.stopped; }

  cancel(): void {
    if (this.owner === 0) { return; }
    this.stopped = 'cancelled';
    this.cancelWait?.();
    this.changed();
  }

  release(token: number): void {
    if (this.owner === token) { this.owner = 0; this.changed(); }
  }

  async wait<T>(token: number, action: () => Promise<T>, timeoutMs: number = 10000): Promise<WaitResult<T>> {
    const result = new WaitResult<T>();
    if (token === 0 || token !== this.owner || this.stopped.length > 0) {
      result.status = this.stopped || 'cancelled'; return result;
    }
    this.pending++;
    return new Promise<WaitResult<T>>((resolve): void => {
      let ended: boolean = false;
      let timer: number = -1;
      const finish = (status: string, value: T | undefined = undefined,
        error: Error | undefined = undefined): void => {
        if (ended) { return; }
        ended = true;
        if (timer >= 0) { this.clock.clearTimeout(timer); }
        this.cancelWait = undefined;
        result.status = status; result.value = value; result.error = error;
        resolve(result);
      };
      this.cancelWait = (): void => { finish('cancelled'); };
      timer = this.clock.setTimeout((): void => {
        this.stopped = 'timeout'; finish('timeout'); this.changed();
      }, timeoutMs);
      const settled = (): void => { this.pending--; this.changed(); };
      try {
        action().then((value: T): void => { settled(); finish('success', value); },
          (error: Error): void => { settled(); finish('error', undefined, error); });
      } catch (error) { settled(); finish('error', undefined, error as Error); }
    });
  }
}
