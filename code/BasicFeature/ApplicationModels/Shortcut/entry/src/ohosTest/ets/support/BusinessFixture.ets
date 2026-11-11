import { common } from '@kit.AbilityKit';
import { BusinessStorage, BusinessWriteError } from '../../../main/ets/business/BusinessStorage';
import { BusinessStore } from '../../../main/ets/business/BusinessStore';
import { CaseScope, Cleanup, getTestContext } from './CaseScope';

export class MemoryBusinessStorage implements BusinessStorage {
  public value: string = '';
  public readCount: number = 0;
  public writeCount: number = 0;
  public failNextWrite: boolean = false;

  async read(_context: common.ApplicationContext): Promise<string> {
    this.readCount += 1;
    return this.value;
  }

  async reload(context: common.ApplicationContext): Promise<string> { return this.read(context); }

  async write(value: string): Promise<void> {
    this.writeCount += 1;
    if (this.failNextWrite) {
      this.failNextWrite = false;
      throw new BusinessWriteError('模拟写入失败', false);
    }
    this.value = value;
  }
}

export class FixedBusinessClock {
  private time: number;
  public now: () => number = () => this.time;

  constructor(year: number = 2026, month: number = 11, day: number = 2) {
    this.time = new Date(year, month - 1, day, 12, 0, 0).getTime();
  }

  setDate(year: number, month: number, day: number): void {
    this.time = new Date(year, month - 1, day, 12, 0, 0).getTime();
  }
}

export async function startBusiness(scope: CaseScope, storage: MemoryBusinessStorage,
  clock: FixedBusinessClock): Promise<BusinessStore> {
  const store: BusinessStore = new BusinessStore(storage, clock.now);
  scope.cleanup(() => store.dispose());
  store.initialize(getTestContext());
  await scope.until(() => !store.snapshot().loading, (changed: () => void): Cleanup => {
    store.subscribe(changed);
    return () => store.unsubscribe(changed);
  });
  if (!store.snapshot().ready) {
    throw new Error(store.errorText());
  }
  return store;
}
