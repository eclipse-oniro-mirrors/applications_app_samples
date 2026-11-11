/** Controllable I/O for the actual AppService pipeline; never creates production samples. */
import { AppService } from '../../../main/ets/core/AppService';
import { ExperimentSeriesState } from '../../../main/ets/core/ExperimentSeries';
import { FakePlatform, MemoryStore, fixtureError } from './FakePlatform';
import { WaveReply } from './PerformanceWaveOneFixtures';

export class SeriesIoPlatform extends FakePlatform {
  public readonly readReply: WaveReply<Uint8Array> = new WaveReply<Uint8Array>();
  public pauseReadAt: number = 0;
  public failReadAt: number = 0;
  public changeFromRead: number = 0;
  public resourceNames: string[] = [];
  public readDurations: number[] = [];

  readResource(name: string = 'sample.txt'): Promise<Uint8Array> {
    this.resourceCalls++;
    this.resourceNames.push(name);
    if (this.resourceCalls === this.failReadAt) {
      return Promise.reject(fixtureError(182001, 'controlled series read failure'));
    }
    if (this.resourceCalls === this.pauseReadAt) { return this.readReply.promise; }
    return Promise.resolve(this.changeFromRead > 0 && this.resourceCalls >= this.changeFromRead ?
      new Uint8Array([65, 66, 68]) : new Uint8Array(this.resource));
  }

  releaseRead(): void { this.readReply.resolve(new Uint8Array(this.resource)); }
}

export class SeriesCopyPlatform extends SeriesIoPlatform {
  private replies: WaveReply<void>[] = [];

  copyText(value: string): Promise<void> {
    this.calls.push('copyText'); this.copiedTexts.push(value);
    const reply = new WaveReply<void>(); this.replies.push(reply);
    return reply.promise;
  }

  resolveCopy(index: number): void { this.replies[index].resolve(undefined); }
  rejectCopy(index: number): void {
    this.replies[index].reject(fixtureError(182088, 'controlled copy rejection') as Error);
  }
  finishCopies(): void { this.replies.forEach((reply: WaveReply<void>): void => { reply.resolve(undefined); }); }
}

export function snapshotSeries(value: string): Record<string, Object> | undefined {
  const data = JSON.parse(value) as Record<string, Object>;
  const series = data['series'];
  return series !== undefined && series !== null && typeof series === 'object' ?
    series as Record<string, Object> : undefined;
}

export function snapshotRecordCount(value: string): number {
  const series = snapshotSeries(value);
  if (series === undefined || !Array.isArray(series['recordIds'])) { return -1; }
  return (series['recordIds'] as Object[]).length;
}

/** Pause/fail an identified real snapshot rather than depending on incidental write call counts. */
export class SeriesStore extends MemoryStore {
  public pauseOnCommittedCount: number = -1;
  public failOnCommittedCount: number = -1;
  public failNextWrite: boolean = false;
  public paused: boolean = false;
  public failedOnce: boolean = false;
  private readonly writeReply: WaveReply<void> = new WaveReply<void>();

  write(value: string): Promise<void> {
    this.writeCalls.push(value);
    if (this.writeFailure || this.failNextWrite) {
      this.failNextWrite = false;
      return Promise.reject(fixtureError(15500000, 'controlled series store failure'));
    }
    const count = snapshotRecordCount(value);
    if (!this.failedOnce && this.failOnCommittedCount >= 0 && count === this.failOnCommittedCount) {
      this.failedOnce = true;
      return Promise.reject(fixtureError(15500000, 'controlled committed snapshot failure'));
    }
    if (!this.paused && this.pauseOnCommittedCount >= 0 && count === this.pauseOnCommittedCount) {
      this.paused = true;
      return this.writeReply.promise.then((): void => { this.value = value; });
    }
    this.value = value;
    return Promise.resolve();
  }

  releaseWrite(fail: boolean = false): void {
    if (fail) {
      this.writeReply.reject(fixtureError(15500000, 'controlled delayed save failure') as Error);
    } else {
      this.writeReply.resolve(undefined);
    }
  }
}

export function requiredSeries(service: AppService): ExperimentSeriesState {
  const state = service.seriesState();
  if (state === undefined) { throw new Error('Missing accepted series state'); }
  return state;
}

export async function waitSeries(predicate: () => boolean, reason: string): Promise<void> {
  for (let attempt = 0; attempt < 400; attempt++) {
    if (predicate()) { return; }
    await Promise.resolve();
  }
  throw new Error(`Series fixture did not reach ${reason}`);
}

export async function finishSeriesFixture(service: AppService, platform: SeriesIoPlatform,
  ownerId: string, store: SeriesStore | undefined = undefined): Promise<void> {
  service.cancelExperimentSeries(ownerId);
  platform.releaseRead(); platform.releaseFile();
  if (store !== undefined) { store.releaseWrite(); }
  await service.whenSeriesFinished(ownerId);
  await drainSeries();
  service.dispose();
}

export async function drainSeries(): Promise<void> {
  for (let attempt = 0; attempt < 160; attempt++) { await Promise.resolve(); }
}
