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

/** I/O-only isolation. Series ownership, execution, samples and presentation remain production code. */
import { UiTestComponent as Component, UiTestDriver as Driver, UiTestSession, ON } from './UiTestRuntime';
import { launchUiTestAbility, uiTestFailure } from './UiTestSupport';
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
  public readonly session: UiTestSession;
  public readonly platform: SeriesQaPlatform = new SeriesQaPlatform();
  public readonly service: AppService;
  public requestedCount: number = SERIES_DEFAULT_REPETITIONS;
  public ownerId: string = '';
  public historyOwners: string[] = [];
  public notice: string = '';
  private disposed: boolean = false;

  constructor(session: UiTestSession, scenario: string) {
    this.session = session;
    session.requireLive();
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
      this.session.requireLive();
      this.platform.readAdvance = 1 + index * 3;
      const repetitions = scenario === 'historyMissing' ? index === 0 ? 10 : 3 : 1;
      const mode = scenario === 'historyDifferent' && index === 1 ? 'files' : 'control';
      const accepted = this.service.startExperimentSeries('W-TEXT', mode, repetitions);
      if (!accepted.accepted) { throw new Error(accepted.message); }
      this.ownerId = accepted.ownerId;
      this.historyOwners.push(accepted.ownerId);
      await this.session.guard(this.service.whenSeriesFinished(accepted.ownerId));
      await this.session.guard(this.service.whenSaved());
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
    let failure: Error | undefined = undefined;
    try { this.service.dispose(); } catch (error) { failure = error as Error; }
    try { this.releaseRead(); } catch (error) { if (failure === undefined) { failure = error as Error; } }
    try {
      this.platform.copyReply.resolve(undefined);
    } catch (error) {
      if (failure === undefined) {
        failure = error as Error;
      }
    }
    if (failure !== undefined) { throw failure; }
  }
}

let activeFixture: SeriesUiQaFixture | undefined = undefined;

export function mountSeriesUiQa(session: UiTestSession, scenario: string): SeriesUiQaFixture {
  session.requireLive();
  if (activeFixture !== undefined) { throw new Error('Previous Series QA fixture was not released'); }
  const fixture = new SeriesUiQaFixture(session, scenario);
  activeFixture = fixture;
  session.ownCleanup((): void => { fixture.dispose(); });
  return fixture;
}

export function currentSeriesUiQa(session: UiTestSession): SeriesUiQaFixture {
  session.requireLive();
  const fixture = activeFixture;
  if (fixture === undefined || fixture.session !== session) { throw new Error('Series QA belongs to another UI session'); }
  return fixture;
}

/** Cleanup takes the caller's captured lease; it can never borrow a later fixture. */
export function releaseSeriesUiQa(session: UiTestSession): void {
  const fixture = activeFixture;
  if (fixture === undefined || fixture.session !== session) { return; }
  activeFixture = undefined;
  fixture.dispose();
}

export async function seriesQaNode(driver: Driver, id: string): Promise<Component> {
  currentSeriesUiQa(driver.session);
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

export async function launchSeriesUiQa(session: UiTestSession, scenario: string): Promise<Driver> {
  session.requireLive();
  const parameters: Record<string, Object> = {};
  parameters['testPage'] = 'SeriesUiQa'; parameters['qaScenario'] = scenario;
  const driver = await launchUiTestAbility(session, parameters);
  const ready = await driver.waitForComponent(ON.id(`series-qa-ready-${session.id}`), 3000);
  if (ready === undefined) {
    throw await uiTestFailure(driver, 'Series QA harness was not ready', 'series-qa-initialization-error');
  }
  currentSeriesUiQa(session);
  return driver;
}

export async function seriesQaUntil(fixture: SeriesUiQaFixture, condition: () => boolean): Promise<void> {
  const session = fixture.session;
  session.requireLive();
  if (condition()) { return; }
  await session.guard(new Promise<void>((resolve, reject): void => {
    let timer: number = -1;
    let subscription: number = -1;
    let settled: boolean = false;
    const finish = (failure: Error | undefined = undefined): void => {
      if (settled) { return; }
      settled = true;
      if (timer >= 0) { clearTimeout(timer); }
      fixture.service.unsubscribe(subscription);
      if (fixture.platform.onRead === changed) { fixture.platform.onRead = undefined; }
      if (failure === undefined) { resolve(); } else { reject(failure); }
    };
    const changed = (): void => {
      if (!session.isLive()) {
        finish(new Error('Series observation was cancelled with its UI session'));
      } else if (condition()) {
        finish();
      }
    };
    session.ownCleanup((): void => { finish(new Error('Series observation was cancelled with its UI session')); });
    subscription = fixture.service.subscribe(changed);
    fixture.platform.onRead = changed;
    timer = setTimeout((): void => { finish(new Error('Production series did not reach the expected state')); },
      Math.min(3000, session.remaining()));
    changed();
  }));
}
