/** Test I/O ports only. All archive validation, filtering, planning and persistence sequencing are production. */
import { Component, Driver, ON, abilityDelegatorRegistry } from '@kit.TestKit';
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

  async initialize(scenario: string): Promise<void> {
    if (scenario === 'readFailure') { this.storage.failLoad = true; }
    await this.repository.attach(this.storage);
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
  async dispose(): Promise<void> { this.release(); await this.repository.close(); }
}

let activeFixture: ArchiveUiQaFixture | undefined = undefined;
export async function mountArchiveUiQa(scenario: string): Promise<ArchiveUiQaFixture> {
  const old = activeFixture;
  if (old !== undefined) { await old.dispose(); }
  const fixture = new ArchiveUiQaFixture();
  activeFixture = fixture;
  await fixture.initialize(scenario);
  return fixture;
}
export function currentArchiveUiQa(): ArchiveUiQaFixture {
  const fixture = activeFixture;
  if (fixture === undefined) { throw new Error('Archive QA harness did not mount'); }
  return fixture;
}

export async function archiveQaNode(driver: Driver, id: string): Promise<Component> {
  if (!await driver.waitForIdle(100, 2000)) { throw new Error(`Archive UI not idle: ${id}`); }
  let component = await driver.findComponent(ON.id(id));
  if (component === undefined || component === null) {
    const scroll = await driver.findComponent(ON.id('archive-qa-scroll'));
    if (scroll !== undefined && scroll !== null) { component = await scroll.scrollSearch(ON.id(id)); }
  }
  if (component === undefined || component === null) { component = await driver.waitForComponent(ON.id(id), 3000); }
  if (component === undefined || component === null) { throw new Error(`Missing archive control: ${id}`); }
  return component;
}
export async function archiveQaText(driver: Driver, id: string): Promise<string> {
  return (await archiveQaNode(driver, id)).getText();
}
export async function archiveQaClick(driver: Driver, id: string): Promise<void> {
  await archiveQaNode(driver, id);
  if (!await driver.waitForIdle(100, 2000)) { throw new Error(`Archive UI not idle: ${id}`); }
  await (await archiveQaNode(driver, id)).click();
}
export async function archiveQaInput(driver: Driver, id: string, text: string): Promise<void> {
  await (await archiveQaNode(driver, id)).inputText(text);
  await driver.pressBack();
  if (!await driver.waitForIdle(100, 2000)) { throw new Error('Archive input did not settle'); }
}
export async function launchArchiveUiQa(scenario: string): Promise<Driver> {
  const parameters: Record<string, Object> = {};
  parameters['testPage'] = 'ArchiveUiQa'; parameters['qaScenario'] = scenario;
  await abilityDelegatorRegistry.getAbilityDelegator().startAbility({
    bundleName: 'com.example.appstartupauto', moduleName: 'entry_test', abilityName: 'FeatureQaAbility',
    parameters: parameters
  });
  const driver = Driver.create();
  if (driver === undefined || driver === null) {
    throw new Error('UiTest Driver.create() returned null; native IPC initialization failed. ' +
      'Check deferred Runner imports and device UiTest logs.');
  }
  const ready = await driver.waitForComponent(ON.id('archive-qa-ready'), 3000);
  if (ready === undefined || ready === null) { throw new Error('Archive QA page not ready'); }
  return driver;
}
export async function finishArchiveUiQa(): Promise<void> {
  const fixture = activeFixture; activeFixture = undefined;
  if (fixture !== undefined) { await fixture.dispose(); }
  const top = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
  if (top.context.abilityInfo.name === 'FeatureQaAbility') { await top.context.terminateSelf(); }
}
