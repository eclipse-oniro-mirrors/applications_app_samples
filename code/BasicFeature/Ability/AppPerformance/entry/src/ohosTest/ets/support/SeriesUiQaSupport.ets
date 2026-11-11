/** I/O-only isolation. Series ownership, execution, samples and presentation remain production code. */
import { Component, Driver, ON } from '@kit.TestKit';
import { currentUiTestAbility, launchUiTestAbility, uiTestFailure } from './UiTestSupport';
import { AppService } from '../../../main/ets/core/AppService';
import { SeriesPanelView, buildSeriesPanelView } from '../../../main/ets/core/SeriesPresentation';
import { SERIES_DEFAULT_REPETITIONS } from '../../../main/ets/core/ExperimentSeries';
import { SeriesHistoryController } from '../../../main/ets/core/SeriesHistoryController';
import { SeriesHistoryView } from '../../../main/ets/core/SeriesHistoryPresentation';
import { WaveReply, WaveResourcePlatform } from './PerformanceWaveOneFixtures';

export class SeriesQaPlatform extends WaveResourcePlatform {
  public onRead: (() => void) | undefined = undefined;
  public readAdvance: number = 0;
  public copyHold: boolean = false;
  public readonly copyReply: WaveReply<void> = new WaveReply<void>();
  readResource(name: string = 'sample.txt'): Promise<Uint8Array> {
    const result = super.readResource(name);
    const notify = this.onRead;
    if (notify !== undefined) { notify(); }
    if (this.readAdvance === 0) { return result; }
    return result.then((bytes: Uint8Array): Uint8Array => { this.advance(this.readAdvance); return bytes; });
  }
  async copyText(text: string): Promise<void> {
    await super.copyText(text);
    if (this.copyHold) { await this.copyReply.promise; }
  }
}

export class SeriesUiQaFixture {
  public readonly platform: SeriesQaPlatform = new SeriesQaPlatform();
  public readonly service: AppService;
  public requestedCount: number = SERIES_DEFAULT_REPETITIONS;
  public ownerId: string = '';
  public historyOwners: string[] = [];
  public notice: string = '';
  private disposed: boolean = false;

  constructor(scenario: string) {
    this.platform.deferAt = scenario === 'complete' || scenario === 'saveFailure' || scenario.startsWith('history') ?
      0 : scenario === 'conditionChange' ? 3 : 1;
    if (scenario === 'resourceFailure') {
      this.platform.deferAt = 0;
      this.platform.rejectReadAt = 1;
    }
    this.service = AppService.fromPlatform(this.platform);
    this.service.refreshTargets();
    this.service.checkConfig();
    if (scenario === 'saveFailure') {
      this.platform.store.writeFailure = true;
    }
  }

  async initialize(scenario: string): Promise<void> {
    if (!scenario.startsWith('history')) { return; }
    // These are real serial production runs with controlled I/O latency, never appended fixture records.
    const count = scenario === 'historyMissing' ? 10 : 2;
    for (let index: number = 0; index < count; index++) {
      this.platform.readAdvance = 1 + index * 3;
      const repetitions = scenario === 'historyMissing' ? index === 0 ? 10 : 3 : 1;
      const mode = scenario === 'historyDifferent' && index === 1 ? 'files' : 'control';
      const accepted = this.service.startExperimentSeries('W-TEXT', mode, repetitions);
      if (!accepted.accepted) { throw new Error(accepted.message); }
      this.ownerId = accepted.ownerId;
      this.historyOwners.push(accepted.ownerId);
      await this.service.whenSeriesFinished(accepted.ownerId);
      await this.service.whenSaved();
      const records = this.service.seriesRecords(accepted.ownerId);
      if (records.length !== repetitions || !records.every((record): boolean => record.complete())) {
        throw new Error('Could not prepare complete production history runs');
      }
    }
    this.platform.readAdvance = 0;
    this.platform.copyHold = scenario === 'historyCopyPending';
    if (scenario === 'historyCopyFailure') { this.platform.copyErrorCode = 171100; }
  }

  view(): SeriesPanelView {
    const state = this.service.seriesState();
    const records = state === undefined ? [] : this.service.seriesRecords(state.ownerId);
    return buildSeriesPanelView(state, records, this.requestedCount,
      this.service.isExperimentBusy(), this.service.isQuarantined(), this.notice);
  }

  start(): void {
    const result = this.service.startExperimentSeries('W-TEXT', 'control', this.requestedCount);
    this.ownerId = result.ownerId;
    this.notice = result.message;
  }

  stop(): void {
    this.service.stopExperimentSeries(this.ownerId);
  }

  cancel(): void {
    this.service.cancelExperimentSeries(this.ownerId);
  }

  async copy(): Promise<void> {
    // FakePlatform.copyText only captures bytes in memory, never accesses the user clipboard.
    await this.service.copySeriesAnalysisReport(this.ownerId);
  }

  releaseRead(): void {
    this.platform.reply.resolve(new Uint8Array(this.platform.resource));
  }

  dispose(): void {
    if (this.disposed) { return; }
    this.disposed = true;
    this.service.dispose();
    this.releaseRead();
    this.platform.copyReply.resolve(undefined);
  }
}

let activeFixture: SeriesUiQaFixture | undefined = undefined;

export function mountSeriesUiQa(scenario: string): SeriesUiQaFixture {
  const old = activeFixture;
  if (old !== undefined) { old.dispose(); }
  const fixture = new SeriesUiQaFixture(scenario);
  activeFixture = fixture;
  return fixture;
}

export function currentSeriesUiQa(): SeriesUiQaFixture {
  const fixture = activeFixture;
  if (fixture === undefined) { throw new Error('Series QA harness did not mount'); }
  return fixture;
}

export async function seriesQaNode(driver: Driver, id: string): Promise<Component> {
  if (!await driver.waitForIdle(100, 2000)) { throw await uiTestFailure(driver, `Series UI not idle: ${id}`); }
  let component = await driver.findComponent(ON.id(id));
  if (component === undefined || component === null) {
    const scroll = await driver.findComponent(ON.id('series-qa-scroll'));
    if (scroll !== undefined && scroll !== null) {
      component = await scroll.scrollSearch(ON.id(id));
    }
  }
  if (component === undefined || component === null) {
    component = await driver.waitForComponent(ON.id(id), 3000);
  }
  if (component === undefined || component === null) {
    throw await uiTestFailure(driver, `Missing production control: ${id}`, 'series-qa-initialization-error');
  }
  return component;
}

export async function seriesQaText(driver: Driver, id: string): Promise<string> {
  return (await seriesQaNode(driver, id)).getText();
}

export async function seriesQaClick(driver: Driver, id: string): Promise<void> {
  await seriesQaNode(driver, id);
  if (!await driver.waitForIdle(100, 2000)) { throw await uiTestFailure(driver, `Series UI not idle: ${id}`); }
  await (await seriesQaNode(driver, id)).click();
}

export async function launchSeriesUiQa(scenario: string): Promise<Driver> {
  await finishSeriesUiQa();
  const parameters: Record<string, Object> = {};
  parameters['testPage'] = 'SeriesUiQa'; parameters['qaScenario'] = scenario;
  const driver = await launchUiTestAbility(parameters);
  const ready = await driver.waitForComponent(ON.id('series-qa-ready'), 3000);
  if (ready === undefined || ready === null) {
    throw await uiTestFailure(driver, 'Series QA harness was not ready', 'series-qa-initialization-error');
  }
  if (currentUiTestAbility() === undefined) {
    throw new Error('Series QA Ability lifecycle ownership was not registered');
  }
  return driver;
}

export async function seriesQaUntil(fixture: SeriesUiQaFixture, condition: () => boolean): Promise<void> {
  if (condition()) { return; }
  await new Promise<void>((resolve, reject): void => {
    let timer: number = -1;
    let subscription: number = -1;
    const changed = (): void => {
      if (condition()) {
        clearTimeout(timer); fixture.service.unsubscribe(subscription); fixture.platform.onRead = undefined; resolve();
      }
    };
    subscription = fixture.service.subscribe(changed);
    fixture.platform.onRead = changed;
    timer = setTimeout((): void => {
      fixture.service.unsubscribe(subscription); fixture.platform.onRead = undefined;
      reject(new Error('Production series did not reach the expected state'));
    }, 3000);
    changed();
  });
}

export async function finishSeriesUiQa(): Promise<void> {
  const fixture = activeFixture;
  activeFixture = undefined;
  const session = currentUiTestAbility();
  try {
    if (fixture !== undefined) {
      fixture.dispose();
      await fixture.service.whenSeriesFinished(fixture.ownerId);
      await fixture.service.whenSaved();
    }
  } finally {
    // Finish destroying the owned page before a later case can start another one.
    // If creation never happened or onDestroy already ran, there is nothing to close.
    if (session !== undefined) { await session.close(); }
  }
}
