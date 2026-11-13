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

/** Test I/O ports only. All archive validation, filtering, planning and persistence sequencing are production. */
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { ON, UiTestComponent, UiTestDriver, UiTestSession } from './UiTestRuntime';
import { BUNDLE } from './TestLog';
import { QueryOutcome, QueryRecord, RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';
import { ArchiveClipboardPort, ArchiveDocument, ArchiveFailure, ArchiveStorage,
  StartupArchiveRepository } from '../../../main/ets/autostart/archive/StartupArchive';
import { DAY_MS } from '../../../main/ets/autostart/archive/ArchiveIndex';
import { defaultRetentionPolicy } from '../../../main/ets/autostart/archive/RetentionPolicy';

export class ArchiveQaSignal {
  public readonly promise: Promise<void>;
  private complete: (() => void) | undefined = undefined;
  constructor() {
    this.promise = new Promise<void>((resolve): void => { this.complete = resolve; });
  }
  release(): void {
    const complete = this.complete;
    this.complete = undefined;
    if (complete !== undefined) { complete(); }
  }
}

export class ArchiveQaMemory implements ArchiveStorage {
  public document: ArchiveDocument = new ArchiveDocument();
  public writes: number = 0;
  public failLoad: boolean = false;
  public failNext: boolean = false;
  public hold: ArchiveQaSignal | undefined = undefined;
  async load(): Promise<ArchiveDocument> {
    if (this.failLoad) { throw new ArchiveFailure('QA_READ'); }
    return this.document.clone();
  }
  async commit(revision: number, document: ArchiveDocument): Promise<void> {
    this.writes++;
    const hold = this.hold;
    this.hold = undefined;
    if (hold !== undefined) { await hold.promise; }
    if (this.failNext) { this.failNext = false; throw new ArchiveFailure('QA_WRITE'); }
    if (this.document.revision !== revision) { throw new ArchiveFailure('STALE'); }
    this.document = document.clone();
  }
  async close(): Promise<void> {}
}

export class ArchiveQaClipboard implements ArchiveClipboardPort {
  public texts: string[] = [];
  public fail: boolean = false;
  public hold: ArchiveQaSignal | undefined = undefined;
  async writeText(text: string): Promise<void> {
    this.texts.push(text);
    const hold = this.hold;
    this.hold = undefined;
    if (hold !== undefined) { await hold.promise; }
    if (this.fail) { throw new Error('QA clipboard rejection'); }
  }
}

export class ArchiveUiQaFixture {
  public readonly now: number = new Date(2026, 10, 6, 12).getTime();
  public readonly storage: ArchiveQaMemory = new ArchiveQaMemory();
  public readonly clipboard: ArchiveQaClipboard = new ArchiveQaClipboard();
  public readonly repository: StartupArchiveRepository = new StartupArchiveRepository((): number => this.now);
  public liveRecords: QueryRecord[] = [];
  public gate: ArchiveQaSignal | undefined = undefined;
  public readonly session: UiTestSession;
  public readonly context: common.UIAbilityContext;
  private disposal: Promise<void> | undefined = undefined;

  constructor(session: UiTestSession, context: common.UIAbilityContext) {
    this.session = session;
    this.context = context;
  }

  async initialize(scenario: string): Promise<void> {
    this.session.requireLive();
    if (scenario === 'readFailure') { this.storage.failLoad = true; }
    await this.repository.attach(this.storage);
    this.session.requireLive();
    if (scenario !== 'empty' && scenario !== 'readFailure') {
      this.liveRecords = [this.record(101, QueryOutcome.SUCCESS, RefreshSource.MANUAL),
        this.record(102, QueryOutcome.FAILURE, RefreshSource.FOREGROUND)];
    }
    if (scenario === 'cleanup' || scenario === 'staleCleanup') {
      const old = this.record(103, QueryOutcome.SUCCESS, RefreshSource.INITIAL);
      old.timestamp = this.now - (defaultRetentionPolicy().maxDays + 5) * DAY_MS;
      await this.repository.save([old, this.liveRecords[0]]);
    } else if (scenario === 'seeded' || scenario === 'copyPending' || scenario === 'copyFailure') {
      await this.repository.save(this.liveRecords);
    }
    this.session.requireLive();
    if (scenario === 'writeFailure') { this.storage.failNext = true; }
    if (scenario === 'pending') {
      this.gate = new ArchiveQaSignal(); this.storage.hold = this.gate;
    }
    if (scenario === 'copyPending') {
      this.gate = new ArchiveQaSignal(); this.clipboard.hold = this.gate;
    }
    if (scenario === 'copyFailure') { this.clipboard.fail = true; }
  }

  record(id: number, outcome: QueryOutcome, source: RefreshSource): QueryRecord {
    const row = new QueryRecord();
    row.id = id; row.timestamp = this.now - id; row.outcome = outcome; row.source = source;
    row.result = outcome === QueryOutcome.SUCCESS ? '已启用' : '查询失败';
    row.supportResult = '支持'; row.statusResult = outcome === QueryOutcome.SUCCESS ? '已启用' : '调用失败';
    row.durationMillis = 17;
    row.errorCode = outcome === QueryOutcome.FAILURE ? '16000050' : '';
    row.errorMessage = outcome === QueryOutcome.FAILURE ? 'qa-private-error-detail' : '';
    return row;
  }

  release(): void {
    const gate = this.gate;
    if (gate !== undefined) { gate.release(); }
  }
  dispose(): Promise<void> {
    if (this.disposal === undefined) {
      this.release();
      this.disposal = this.repository.close();
    }
    return this.disposal;
  }
}

let activeFixture: ArchiveUiQaFixture | undefined = undefined;

export function archiveQaErrorCode(error: Error): number {
  const code = (error as BusinessError).code;
  return typeof code === 'number' && Number.isFinite(code) ? code : 0;
}

/** The Ability owns initialization/disposal; mounting never replaces a previous owner. */
export function mountArchiveUiQa(session: UiTestSession, context: common.UIAbilityContext): ArchiveUiQaFixture {
  session.requireLive();
  if (activeFixture !== undefined) { throw new Error('Previous Archive QA fixture has not been disposed'); }
  const fixture = new ArchiveUiQaFixture(session, context);
  activeFixture = fixture;
  return fixture;
}

export function currentArchiveUiQa(session?: UiTestSession): ArchiveUiQaFixture {
  const fixture = activeFixture;
  if (fixture === undefined || (session !== undefined && fixture.session !== session)) {
    throw new Error('Archive QA fixture does not belong to this session');
  }
  fixture.session.requireLive();
  return fixture;
}

export function bindArchiveUiQa(sessionId: string): ArchiveUiQaFixture {
  const fixture = currentArchiveUiQa();
  if (fixture.session.id !== sessionId) { throw new Error('Archive QA page belongs to another session'); }
  return fixture;
}

export function failArchiveUiQaInitialization(sessionId: string, phase: string, code: number): void {
  const fixture = activeFixture;
  if (fixture !== undefined && fixture.session.id === sessionId) {
    try { fixture.session.requireLive(); } catch (_) { return; }
    fixture.session.failInitialization(phase, code);
  }
}

export async function disposeArchiveUiQa(fixture: ArchiveUiQaFixture): Promise<void> {
  try { await fixture.dispose(); }
  finally { if (activeFixture === fixture) { activeFixture = undefined; } }
}

async function archiveQaIdle(driver: UiTestDriver): Promise<void> {
  while (!await driver.waitForIdle(50, 250)) { await driver.session.pause(30); }
}

export async function archiveQaNode(driver: UiTestDriver, id: string): Promise<UiTestComponent> {
  await archiveQaIdle(driver);
  let component = await driver.findComponent(ON.id(id));
  if (component === undefined) {
    const scroll = await driver.findComponent(ON.id('archive-qa-scroll'));
    if (scroll !== undefined) { component = await scroll.scrollSearch(ON.id(id)); }
  }
  if (component === undefined) { component = await driver.waitForComponent(ON.id(id), driver.session.remaining()); }
  if (component === undefined) { throw new Error(`Missing archive control: ${id}`); }
  return component;
}

/** Expected and displayed strings come from the same owned Ability resource context. */
export function archiveQaExpected(key: string, args: string[] = []): string {
  const context = currentArchiveUiQa().context;
  const template: string = context.resourceManager.getStringByNameSync(key);
  return template.replace(/\{(\d+)\}/g, (match: string, index: string): string => {
    const position = Number(index);
    return position < args.length ? args[position] : match;
  });
}

export async function archiveQaText(driver: UiTestDriver, id: string): Promise<string> {
  return (await archiveQaNode(driver, id)).getText();
}
export async function archiveQaClick(driver: UiTestDriver, id: string): Promise<void> {
  await (await archiveQaNode(driver, id)).click();
}
export async function archiveQaInput(driver: UiTestDriver, id: string, text: string): Promise<void> {
  await (await archiveQaNode(driver, id)).inputText(text);
  await archiveQaIdle(driver);
}

export async function launchArchiveUiQa(session: UiTestSession, scenario: string): Promise<UiTestDriver> {
  const driver = session.createDriver();
  await driver.wakeUpDisplay();
  const parameters: Record<string, Object> = {};
  parameters['testPage'] = 'ArchiveUiQa'; parameters['qaScenario'] = scenario;
  await session.startAbility(BUNDLE, 'FeatureQaAbility', parameters);
  const ready = await driver.waitForComponent(ON.id(`archive-qa-ready-${session.id}`), session.remaining());
  if (ready === undefined) { throw new Error('Owned Archive QA page did not become ready within the case budget'); }
  return driver;
}
