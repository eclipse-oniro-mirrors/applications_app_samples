import { BusinessError } from '@kit.BasicServicesKit';
import { AutoStartupApi, QueryClock } from '../../../main/ets/autostart/AutoStartupRuntime';
import { AutoStartupService } from '../../../main/ets/autostart/AutoStartupService';

export class TestBusinessError extends Error implements BusinessError {
  code: number;

  constructor(code: number, message: string) {
    super(message);
    this.name = 'BusinessError';
    this.code = code;
  }
}

class PendingQuery {
  readonly promise: Promise<boolean>;
  public resolve: (value: boolean) => void = (): void => {};
  public reject: (error: BusinessError) => void = (): void => {};

  constructor() {
    this.promise = new Promise<boolean>((resolve, reject) => {
      this.resolve = resolve;
      this.reject = reject;
    });
  }
}

export class ControlledAutoStartupApi implements AutoStartupApi {
  supported: boolean = true;
  probeError: TestBusinessError | null = null;
  queryError: TestBusinessError | null = null;
  probeCalls: number = 0;
  queryCalls: number = 0;
  private requests: PendingQuery[] = [];

  isAutoStartupSupported(): boolean {
    this.probeCalls++;
    if (this.probeError !== null) {
      throw this.probeError;
    }
    return this.supported;
  }

  getAutoStartupStatusForSelf(): Promise<boolean> {
    this.queryCalls++;
    if (this.queryError !== null) {
      throw this.queryError;
    }
    const request = new PendingQuery();
    this.requests.push(request);
    return request.promise;
  }

  resolveNext(value: boolean): void {
    const request = this.requests.shift();
    if (request === undefined) {
      throw new Error('没有待完成的查询');
    }
    request.resolve(value);
  }

  rejectNext(error: BusinessError): void {
    const request = this.requests.shift();
    if (request === undefined) {
      throw new Error('没有待完成的查询');
    }
    request.reject(error);
  }

  pendingCount(): number {
    return this.requests.length;
  }

  finishPending(): void {
    while (this.requests.length > 0) {
      this.resolveNext(false);
    }
  }
}

class ScheduledCallback {
  readonly id: number;
  readonly dueAt: number;
  readonly callback: () => void;

  constructor(id: number, dueAt: number, callback: () => void) {
    this.id = id;
    this.dueAt = dueAt;
    this.callback = callback;
  }
}

export class ManualQueryClock implements QueryClock {
  private current: number = 1700000000000;
  private nextId: number = 0;
  private callbacks: ScheduledCallback[] = [];

  now(): number {
    return this.current;
  }

  setTimeout(callback: () => void, delayMillis: number): number {
    const id: number = ++this.nextId;
    const delay: number = delayMillis > 0 ? delayMillis : 0;
    this.callbacks.push(new ScheduledCallback(id, this.current + delay, callback));
    return id;
  }

  clearTimeout(id: number): void {
    const index: number = this.callbacks.findIndex((entry: ScheduledCallback): boolean => entry.id === id);
    if (index >= 0) {
      this.callbacks.splice(index, 1);
    }
  }

  advance(millis: number): void {
    if (millis < 0) {
      throw new Error('时间增量须大于或等于零');
    }
    const target: number = this.current + millis;
    while (true) {
      let selected: number = -1;
      for (let index = 0; index < this.callbacks.length; index++) {
        const entry: ScheduledCallback = this.callbacks[index];
        if (entry.dueAt <= target &&
          (selected < 0 || entry.dueAt < this.callbacks[selected].dueAt)) {
          selected = index;
        }
      }
      if (selected < 0) {
        break;
      }
      const entry: ScheduledCallback = this.callbacks.splice(selected, 1)[0];
      this.current = entry.dueAt;
      entry.callback();
    }
    this.current = target;
  }

  pendingCount(): number {
    return this.callbacks.length;
  }

  clearAll(): void {
    this.callbacks = [];
  }
}

export class AutoStartupFixture {
  readonly api: ControlledAutoStartupApi = new ControlledAutoStartupApi();
  readonly clock: ManualQueryClock = new ManualQueryClock();
  public readonly service: AutoStartupService = new AutoStartupService(this.api, this.clock);
}

export async function flushMicrotasks(): Promise<void> {
  await Promise.resolve();
  await Promise.resolve();
  await Promise.resolve();
}
