/** Input data and deterministic I/O only; production code performs all validation and statistics. */
import { ExperimentRecord, ExperimentStage } from '../../../main/ets/core/ExperimentLedger';
import { FLOW_KEYS } from '../../../main/ets/core/FlowMetrics';
import { ExecutorClock } from '../../../main/ets/core/SafeExecutor';
import { FakePlatform, fixtureError } from './FakePlatform';

/** Explicit nominal clock type; all timing behavior remains the existing FakePlatform implementation. */
export class WaveExecutorClock extends FakePlatform implements ExecutorClock {}

export class WaveReply<T> {
  public readonly promise: Promise<T>;
  private resolveValue: ((value: T) => void) | undefined = undefined;
  private rejectValue: ((error: Error) => void) | undefined = undefined;

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

  reject(error: Error): void {
    const action = this.rejectValue;
    this.resolveValue = undefined;
    this.rejectValue = undefined;
    action?.(error);
  }
}

export function waveRecord(id: string, elapsed: number = 10): ExperimentRecord {
  const record = new ExperimentRecord();
  record.id = id;
  record.workloadId = 'W-TEXT';
  record.workloadLabel = '读取示例文本';
  record.startedAt = 1700000001000;
  record.endedAt = 1700000001600;
  record.beforeBytes = 32;
  record.afterBytes = 32;
  record.digestBefore = 'abcdef12';
  record.digestAfter = 'abcdef12';
  record.integrity = '一致';
  record.condition = JSON.stringify(['fixture-board · fixture-os', '1.0.fixture', true]);
  record.asset = 'sample.txt';
  record.stages = FLOW_KEYS.map((key: string): ExperimentStage =>
    new ExperimentStage(key, key, '成功', elapsed, ''));
  return record;
}

export function waveBag(record: ExperimentRecord): Record<string, Object> {
  return JSON.parse(JSON.stringify(record)) as Record<string, Object>;
}

export async function waveDrain(): Promise<void> {
  for (let index = 0; index < 40; index++) { await Promise.resolve(); }
}

export function waveRequired(record: ExperimentRecord | undefined): ExperimentRecord {
  if (record === undefined) { throw new Error('Expected an accepted production run'); }
  return record;
}

/** Defer a selected resource read without adding any application behavior. */
export class WaveResourcePlatform extends FakePlatform {
  public readonly reply: WaveReply<Uint8Array> = new WaveReply<Uint8Array>();
  public deferAt: number = 1;
  public rejectReadAt: number = 0;
  public rejectConfigAt: number = 0;
  public names: string[] = [];

  readResource(name: string = 'sample.txt'): Promise<Uint8Array> {
    this.resourceCalls++;
    this.names.push(name);
    if (this.resourceCalls === this.rejectReadAt) {
      return Promise.reject(fixtureError(171001, 'controlled reread failure'));
    }
    if (this.resourceCalls === this.deferAt) { return this.reply.promise; }
    return Promise.resolve(new Uint8Array(this.resource));
  }

  readConfig(): string {
    if (this.configCalls + 1 === this.rejectConfigAt) {
      this.configCalls++;
      throw fixtureError(171002, 'controlled config reread failure');
    }
    return super.readConfig();
  }
}
