/** Test-only asynchronous and storage controls for retained performance features. */
import { AppStateStore } from '../../../main/ets/core/AppPlatform';
import { FakePlatform, MemoryStore, FixtureError, fixtureError } from './FakePlatform';

class DeferredReply<T> {
  public readonly promise: Promise<T>;
  private resolveValue: ((value: T) => void) | undefined = undefined;
  private rejectValue: ((error: FixtureError) => void) | undefined = undefined;

  constructor() {
    this.promise = new Promise<T>((resolve, reject): void => {
      this.resolveValue = resolve;
      this.rejectValue = reject;
    });
  }

  resolve(value: T): void {
    const action = this.resolveValue;
    this.resolveValue = undefined;
    this.rejectValue = undefined;
    action?.(value);
  }

  reject(error: FixtureError): void {
    const action = this.rejectValue;
    this.resolveValue = undefined;
    this.rejectValue = undefined;
    action?.(error);
  }
}

export class CopyPlatform extends FakePlatform {
  private replies: DeferredReply<void>[] = [];

  copyText(value: string): Promise<void> {
    this.calls.push('copyText');
    this.copiedTexts.push(value);
    const reply = new DeferredReply<void>();
    this.replies.push(reply);
    return reply.promise;
  }

  resolveAt(index: number): void {
    this.replies[index].resolve(undefined);
  }

  finishAll(): void {
    this.replies.forEach((reply: DeferredReply<void>): void => reply.resolve(undefined));
  }
}

export class ResourcePlatform extends FakePlatform {
  private reply: DeferredReply<Uint8Array> | undefined = undefined;

  readResource(): Promise<Uint8Array> {
    this.resourceCalls++;
    this.reply = new DeferredReply<Uint8Array>();
    return this.reply.promise;
  }

  releaseResource(bytes: Uint8Array): void {
    this.reply?.resolve(bytes);
    this.reply = undefined;
  }
}

export class RejectionPlatform extends FakePlatform {
  public failure: FixtureError | null | undefined = undefined;

  evictFiles(targets: string[]): Promise<void> {
    this.fileCalls.push(targets.slice());
    return Promise.reject<void>(this.failure);
  }
}

export class MissingStorePlatform extends FakePlatform {
  openStore(): AppStateStore {
    throw fixtureError(15500000, 'fixture open failure');
  }
}

export class SerialStore extends MemoryStore {
  private complete: ((fail: boolean) => void) | undefined = undefined;

  write(value: string): Promise<void> {
    this.writeCalls.push(value);
    return new Promise<void>((resolve, reject): void => {
      this.complete = (fail: boolean): void => {
        if (fail) {
          reject(fixtureError(15500000, 'fixture delayed write failure'));
        } else {
          this.value = value;
          resolve();
        }
      };
    });
  }

  release(fail: boolean = false): void {
    const complete = this.complete;
    this.complete = undefined;
    if (complete === undefined) {
      throw new Error('No queued store write');
    }
    complete(fail);
  }
}

export async function flushCoverageMicrotasks(): Promise<void> {
  for (let index = 0; index < 8; index++) {
    await Promise.resolve();
  }
}
