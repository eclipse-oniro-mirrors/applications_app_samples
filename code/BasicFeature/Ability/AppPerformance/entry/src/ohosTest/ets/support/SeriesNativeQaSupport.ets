import { common } from '@kit.AbilityKit';
import { preferences } from '@kit.ArkData';
import { systemDateTime } from '@kit.BasicServicesKit';
import { util } from '@kit.ArkTS';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { AppService, StoredState } from '../../../main/ets/core/AppService';
import { AppStateStore, NativeStateStore } from '../../../main/ets/core/AppPlatform';
import { ExperimentSeriesState } from '../../../main/ets/core/ExperimentSeries';
import { FakePlatform } from './FakePlatform';

let seriesNativeNamespaceSerial: number = 0;

function assertSeriesNativeNamespace(namespace: string): void {
  if (!/^ap_series_native_qa_[0-9]+_[0-9]+$/.test(namespace)) {
    throw new Error('Refusing a non-QA performance namespace');
  }
}

export function seriesNativeDocument(raw: string): StoredState { return JSON.parse(raw) as StoredState; }

export function requiredNativeSeries(service: AppService): ExperimentSeriesState {
  const state: ExperimentSeriesState | undefined = service.seriesState();
  if (state === undefined) { throw new Error('Expected a restored or accepted series'); }
  return state;
}

/** Observes only snapshots AFTER a successful real SDK flush. Optional failure is an acknowledgement injection. */
export class NativeSeriesCommitStore implements AppStateStore {
  public readonly images: string[] = [];
  public failAfterRecordCount: number = -1;
  public failed: boolean = false;
  public writes: number = 0;
  public onCommitted: ((document: StoredState) => void) | undefined = undefined;
  private adapter: NativeStateStore;

  constructor(context: common.Context, namespace: string) {
    assertSeriesNativeNamespace(namespace);
    this.adapter = new NativeStateStore(context, namespace);
  }

  read(): string { return this.adapter.read(); }

  async write(raw: string): Promise<void> {
    this.writes++;
    await this.adapter.write(raw);
    this.images.push(raw);
    const document: StoredState = seriesNativeDocument(raw);
    const observe = this.onCommitted;
    if (observe !== undefined) { observe(document); }
    const series: ExperimentSeriesState | undefined = document.series;
    if (!this.failed && series !== undefined && series.recordIds.length === this.failAfterRecordCount) {
      this.failed = true;
      throw new Error('QA lost acknowledgement AFTER a successful native series flush');
    }
  }
}

/**
 * Native resources, uptime and persistence; optimizer/config environment remains controlled and no clipboard is read.
 */
export class NativeSeriesPlatform extends FakePlatform {
  private nativeStore: AppStateStore;
  private context: common.Context;

  constructor(context: common.ApplicationContext, store: AppStateStore) {
    super();
    this.context = context.createModuleContext('entry');
    this.nativeStore = store;
  }

  openStore(): AppStateStore { return this.nativeStore; }
  now(): number { return systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false); }
  wallNow(): number { return Date.now(); }
  randomId(): string { return util.generateRandomUUID(); }
  readResource(name: string = 'sample.txt'): Promise<Uint8Array> {
    this.resourceCalls++;
    return this.context.resourceManager.getRawFileContent(name);
  }
}

export class SeriesNativeSession {
  public readonly store: NativeSeriesCommitStore;
  public readonly platform: NativeSeriesPlatform;
  public readonly service: AppService;
  constructor(context: common.ApplicationContext, namespace: string) {
    this.store = new NativeSeriesCommitStore(context, namespace);
    this.platform = new NativeSeriesPlatform(context, this.store);
    this.service = AppService.fromPlatform(this.platform);
  }
}

export class SeriesNativeQaFixture {
  public readonly context: common.ApplicationContext;
  public readonly namespace: string;
  private sessions: SeriesNativeSession[] = [];

  constructor(context: common.ApplicationContext, namespace: string) {
    assertSeriesNativeNamespace(namespace);
    this.context = context;
    this.namespace = namespace;
  }

  open(): SeriesNativeSession {
    const session: SeriesNativeSession = new SeriesNativeSession(this.context, this.namespace);
    this.sessions.push(session);
    return session;
  }

  async release(): Promise<void> {
    for (const session of this.sessions) {
      const state: ExperimentSeriesState | undefined = session.service.seriesState();
      if (state !== undefined) {
        session.service.cancelExperimentSeries(state.ownerId);
        session.platform.releaseFile();
        await session.service.whenSeriesFinished(state.ownerId);
      }
      session.service.dispose();
      await session.service.whenSaved();
    }
    this.sessions = [];
  }

  async reopen(): Promise<SeriesNativeSession> {
    await this.release();
    await preferences.removePreferencesFromCache(this.context, this.namespace);
    return this.open();
  }

  raw(): string { return new NativeStateStore(this.context, this.namespace).read(); }

  async seed(raw: string): Promise<void> {
    await this.release();
    await preferences.removePreferencesFromCache(this.context, this.namespace);
    await new NativeStateStore(this.context, this.namespace).write(raw);
    await preferences.removePreferencesFromCache(this.context, this.namespace);
  }

  async close(): Promise<void> {
    try { await this.release(); } finally { await preferences.deletePreferences(this.context, this.namespace); }
  }
}

export async function withSeriesNativeQa(body: (fixture: SeriesNativeQaFixture) => Promise<void>): Promise<void> {
  const context: common.ApplicationContext = abilityDelegatorRegistry.getAbilityDelegator()
    .getAppContext().getApplicationContext();
  const fixture: SeriesNativeQaFixture = new SeriesNativeQaFixture(context,
    `ap_series_native_qa_${Date.now()}_${++seriesNativeNamespaceSerial}`);
  try { await body(fixture); } finally { await fixture.close(); }
}
