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

/** Only the persistence boundary is fake; all note/history/recycle transitions use BusinessStore. */
import { common } from '@kit.AbilityKit';
import { UiTestSession, UiTestDriver as Driver, UiTestComponent as Component, ON } from './UiTestRuntime';
import { BusinessStore } from '../../../main/ets/business/BusinessStore';
import { RecycleBatchPreview } from '../../../main/ets/business/RecycleBatch';
import { BusinessStorage, BusinessWriteError } from '../../../main/ets/business/BusinessStorage';
import { MAX_ACTIVE_NOTES, NOTE_RECYCLE_RETENTION_MS } from '../../../main/ets/business/NoteRecyclePolicy';
import { uiText } from '../../../main/ets/i18n/Strings';
import { useModelBaselineStrings } from './TestStrings';
import { logInfo } from '../../../main/ets/services/Logger';
import { BUNDLE } from './CaseScope';

const SHARED_FIXTURE_NAME: string = `${BUNDLE}_SharedRecycleUiFixture_0000`;

export class RecycleQaSignal {
  public readonly promise: Promise<void>;
  private complete: (() => void) | undefined = undefined;
  constructor() { this.promise = new Promise<void>((resolve): void => { this.complete = resolve; }); }
  release(): void {
    const complete = this.complete; this.complete = undefined;
    if (complete !== undefined) { complete(); }
  }
}

export class RecycleQaMemory implements BusinessStorage {
  public value: string = '';
  public writes: number = 0;
  public reloads: number = 0;
  public failRead: boolean = false;
  public failNext: boolean = false;
  public uncertain: boolean = false;
  public applyBeforeFailure: boolean = false;
  public hold: RecycleQaSignal | undefined = undefined;
  async read(_context: common.ApplicationContext): Promise<string> {
    if (this.failRead) { throw new Error('QA read failure'); }
    return this.value;
  }
  async reload(context: common.ApplicationContext): Promise<string> { this.reloads++; return this.read(context); }
  async write(value: string): Promise<void> {
    this.writes++;
    const hold = this.hold; this.hold = undefined;
    if (hold !== undefined) { await hold.promise; }
    if (this.failNext) {
      this.failNext = false;
      if (this.applyBeforeFailure) { this.value = value; }
      throw new BusinessWriteError('QA controlled write failure', this.uncertain);
    }
    this.value = value;
  }
}

export async function recycleQaUntil(store: BusinessStore, condition: () => boolean): Promise<void> {
  if (condition()) { return; }
  await new Promise<void>((resolve, reject): void => {
    let timer: number = -1;
    const changed = (): void => {
      if (condition()) { clearTimeout(timer); store.unsubscribe(changed); resolve(); }
    };
    timer = setTimeout((): void => {
      store.unsubscribe(changed);
      reject(new Error('Recycle store did not settle'));
    }, 3000);
    store.subscribe(changed);
    changed();
  });
}

export class RecycleUiQaFixture {
  public readonly session: UiTestSession;
  public readonly storage: RecycleQaMemory = new RecycleQaMemory();
  public readonly store: BusinessStore;
  private time: number = new Date(2026, 10, 6, 12).getTime();
  public gate: RecycleQaSignal | undefined = undefined;
  public trashId: string = '';
  public recentTrashId: string = '';
  public trashIds: string[] = [];
  public noteId: string = '';
  public baseline: string = '';
  public baselineWrites: number = 0;
  private disposed: boolean = false;

  constructor(session: UiTestSession) { this.session = session; this.store = new BusinessStore(this.storage, (): number => this.time); }

  async initialize(context: common.ApplicationContext, scenario: string): Promise<void> {
    if (scenario === 'readFailure') { this.storage.failRead = true; }
    this.store.initialize(context);
    await recycleQaUntil(this.store, (): boolean => !this.store.snapshot().loading);
    if (scenario !== 'empty' && scenario !== 'readFailure') {
      if (scenario === 'mixedExpiry' || scenario === 'batchExpired') { this.time -= NOTE_RECYCLE_RETENTION_MS + 100; }
      this.store.setDraftTitle('待恢复的便签');
      this.store.setDraftBody('qa-recycle-private-body');
      if (!await this.store.saveNote()) { throw new Error(this.store.errorText()); }
      this.noteId = this.store.snapshot().notes[0].id;
      if (!await this.store.moveNoteToTrash(this.noteId)) { throw new Error(this.store.errorText()); }
      this.trashId = this.store.snapshot().recycledNotes[0].trashId;
      if (scenario === 'mixedExpiry') {
        this.time += NOTE_RECYCLE_RETENTION_MS + 100;
        this.store.setDraftTitle('仍在保留期的便签'); this.store.setDraftBody('recent-note-body');
        if (!await this.store.saveNote()) { throw new Error(this.store.errorText()); }
        const noteId = this.store.snapshot().notes[0].id;
        if (!await this.store.moveNoteToTrash(noteId)) { throw new Error(this.store.errorText()); }
        this.recentTrashId = this.store.snapshot().recycledNotes[0].trashId;
      }
    }
    if (scenario === 'batchExpired') { this.time += NOTE_RECYCLE_RETENTION_MS + 100; }
    if (scenario.startsWith('batch')) {
      for (let index: number = 0; index < 2; index++) {
        this.store.setDraftTitle(`额外的批量回收对象 ${index}`);
        this.store.setDraftBody(`batch-retained-body-${index}`);
        if (!await this.store.saveNote()) { throw new Error(this.store.errorText()); }
        const noteId = this.store.snapshot().notes[0].id;
        if (!await this.store.moveNoteToTrash(noteId)) { throw new Error(this.store.errorText()); }
      }
    }
    this.trashIds = this.store.snapshot().recycledNotes.map((entry): string => entry.trashId);
    if (scenario === 'capacity' || scenario === 'batchCapacity') {
      const activeCount = scenario === 'capacity' ? MAX_ACTIVE_NOTES : MAX_ACTIVE_NOTES - 2;
      for (let index: number = 0; index < activeCount; index++) {
        this.store.setDraftTitle(`占用名额的便签 ${index}`);
        this.store.setDraftBody(`capacity-note-${index}`);
        if (!await this.store.saveNote()) { throw new Error(this.store.errorText()); }
      }
    }
    this.baseline = this.storage.value;
    this.baselineWrites = this.storage.writes;
    if (scenario === 'pending' || scenario === 'batchPending') {
      this.gate = new RecycleQaSignal(); this.storage.hold = this.gate;
    }
    if (scenario === 'writeFailure' || scenario === 'uncertainApplied' || scenario === 'batchWriteFailure' ||
      scenario === 'batchUnknown') {
      this.storage.failNext = true;
      this.storage.uncertain = scenario === 'uncertainApplied' || scenario === 'batchUnknown';
      this.storage.applyBeforeFailure = this.storage.uncertain;
    }
  }

  expireRetainedItems(): void { this.time += NOTE_RECYCLE_RETENTION_MS + 1; }
  release(): void { const gate = this.gate; if (gate !== undefined) { gate.release(); } }
  dispose(): void { if (!this.disposed) { this.disposed = true; this.release(); this.store.dispose(); } }
}

/** Capture only this exact Context and this session's fixture; runtime owns the single close path. */
export class RecycleUiQaAbilitySession {
  public readonly runtime: UiTestSession;
  private readonly context: common.UIAbilityContext;
  private fixture: RecycleUiQaFixture | undefined = undefined;

  constructor(context: common.UIAbilityContext, runtime: UiTestSession) {
    this.context = context;
    this.runtime = runtime;
  }
  bindFixture(fixture: RecycleUiQaFixture): void {
    this.runtime.requireLive();
    if (fixture.session !== this.runtime) { throw new Error('Recycle fixture belongs to another session'); }
    if (this.fixture !== undefined && this.fixture !== fixture) {
      throw new Error('Recycle QA owner already has a different fixture; replacement rejected');
    }
    this.fixture = fixture;
  }
  hasFixture(): boolean { return this.fixture !== undefined; }
  ownsFixture(fixture: RecycleUiQaFixture): boolean {
    return this.fixture === fixture && fixture.session === this.runtime;
  }
  takeFixture(): RecycleUiQaFixture | undefined {
    const fixture = this.fixture;
    this.fixture = undefined;
    return fixture;
  }
  forgetFixture(fixture: RecycleUiQaFixture): void {
    if (this.fixture === fixture) { this.fixture = undefined; }
  }
  markDestroyed(): void { this.runtime.markDestroyed(this.context); }
  close(): Promise<void> { return this.runtime.close(); }
}

let activeQaAbility: RecycleUiQaAbilitySession | undefined = undefined;
export function attachRecycleUiQaAbility(context: common.UIAbilityContext,
  runtime: UiTestSession): RecycleUiQaAbilitySession {
  runtime.requireLive();
  const session = new RecycleUiQaAbilitySession(context, runtime);
  activeQaAbility = session;
  return session;
}
export function detachRecycleUiQaAbility(session: RecycleUiQaAbilitySession): void {
  // A late old destroy must not detach the new owner or acknowledge its Context.
  if (activeQaAbility === session) { activeQaAbility = undefined; }
  // FeatureQaAbility acknowledges the saved exact Context only after all cleanup, in its final finally.
}
export function recycleUiQaOwner(id: string): RecycleUiQaAbilitySession {
  const owner = activeQaAbility;
  if (owner === undefined || owner.runtime.id !== id) { throw new Error('Recycle QA session nonce is not owned'); }
  owner.runtime.requireLive();
  return owner;
}

let activeFixture: RecycleUiQaFixture | undefined = undefined;
export async function mountRecycleUiQa(context: common.ApplicationContext, scenario: string,
  owner: RecycleUiQaAbilitySession): Promise<RecycleUiQaFixture> {
  const session = owner.runtime;
  session.requireLive();
  if (activeQaAbility !== owner) { throw new Error('Recycle QA owner changed before fixture creation'); }
  if (activeFixture !== undefined || owner.hasFixture()) {
    throw new Error('Recycle QA fixture is already mounted; duplicate mount rejected');
  }
  const fixture = new RecycleUiQaFixture(session);
  owner.bindFixture(fixture);
  activeFixture = fixture;
  try {
    await session.guard(fixture.initialize(context, scenario));
    return fixture;
  } catch (error) {
    try { fixture.dispose(); } catch (_) { session.failCleanup('fixture-initialize-dispose'); }
    owner.forgetFixture(fixture);
    if (activeFixture === fixture) { activeFixture = undefined; }
    throw error as Error;
  }
}
export function currentRecycleUiQa(session: UiTestSession): RecycleUiQaFixture {
  session.requireLive();
  const fixture = activeFixture;
  if (fixture === undefined || fixture.session !== session) { throw new Error('Recycle QA fixture is not owned by this case'); }
  return fixture;
}
export function recycleQaPreview(fixture: RecycleUiQaFixture): RecycleBatchPreview {
  fixture.session.requireLive();
  const preview = fixture.store.snapshot().recycleBatchPreview;
  if (preview === undefined) { throw new Error('Production batch preview was not generated'); }
  return preview;
}
async function requireRecycleQaRoot(driver: Driver): Promise<void> {
  // Launch validates the nonce-bearing native root once. Later calls keep exact local
  // fixture/session/owner checks instead of repeating a root snapshot and geometry RPCs.
  const session = driver.session;
  const fixture = currentRecycleUiQa(session);
  const owner = recycleUiQaOwner(session.id);
  if (owner.runtime !== session || !owner.ownsFixture(fixture)) {
    throw new Error('Recycle QA fixture does not belong to the exact active owner');
  }
  await session.requireOwnedForeground();
  if (currentRecycleUiQa(session) !== fixture || activeQaAbility !== owner || !owner.ownsFixture(fixture)) {
    throw new Error('Recycle QA owner or fixture changed during foreground verification');
  }
}
export async function recycleQaNode(driver: Driver, id: string): Promise<Component> {
  await requireRecycleQaRoot(driver);
  let component = await driver.findComponent(ON.id(id));
  if (component === undefined) {
    const scroll = await driver.findComponent(ON.id('note-trash-list'));
    if (scroll !== undefined) { component = await scroll.scrollSearch(ON.id(id)); }
  }
  if (component === undefined) { component = await driver.waitForComponent(ON.id(id), 1500); }
  if (component === undefined) { throw new Error(`Missing recycle control: ${id}`); }
  driver.session.requireLive();
  return component;
}
export async function recycleQaText(driver: Driver, id: string): Promise<string> {
  const deadline = Date.now() + Math.min(1000, driver.session.remaining());
  let actual: string = '';
  while (true) {
    actual = await (await recycleQaNode(driver, id)).getText();
    if (actual.length > 0 || Date.now() >= deadline) { return actual; }
    await driver.session.pause(50);
  }
}
export async function recycleQaClick(driver: Driver, id: string): Promise<void> {
  driver.session.enterPhase(`recycle.click:${id}`);
  await (await recycleQaNode(driver, id)).click();
}
export async function recycleQaDialog(driver: Driver, label: string,
  title: string = uiText('shortcut_text_0699')): Promise<void> {
  await requireRecycleQaRoot(driver);
  const dialogTitle = await driver.waitForComponent(ON.text(title), 1500);
  if (dialogTitle === undefined) { throw new Error(`Missing recycle dialog: ${title}`); }
  const button = await driver.waitForComponent(ON.text(label).isAfter(ON.text(title)), 1500);
  if (button === undefined) { throw new Error(`Missing recycle confirmation: ${label}`); }
  driver.session.enterPhase('recycle.dialog.click');
  await button.click();
}
export async function launchRecycleUiQa(scenario: string, session: UiTestSession): Promise<Driver> {
  session.requireLive();
  logInfo(`${SHARED_FIXTURE_NAME} native-ui launch`);
  const parameters: Record<string, Object> = {};
  parameters['testPage'] = 'RecycleUiQa'; parameters['qaScenario'] = scenario;
  await session.startAbility(BUNDLE, 'FeatureQaAbility', parameters);
  const driver = session.createDriver();
  const ready = await driver.waitForComponent(ON.id(`recycle-qa-ready-${session.id}`), 1500);
  if (ready === undefined) { throw new Error('Owned recycle QA page not ready'); }
  recycleUiQaOwner(session.id);
  const root = await driver.findComponent(ON.id(`recycle-qa-root-${session.id}`));
  if (root === undefined) { throw new Error('Owned recycle QA root is not present'); }
  await requireRecycleQaRoot(driver);
  return driver;
}
/** Called only with the exact owner captured by Ability.onDestroy; never terminate a foreground query. */
export function finishRecycleUiQa(owner: RecycleUiQaAbilitySession): void {
  const session = owner.runtime;
  const fixture = owner.takeFixture();
  try {
    if (fixture !== undefined) { fixture.dispose(); }
  } catch (_) { session.failCleanup('fixture-dispose'); }
  if (activeFixture === fixture) { activeFixture = undefined; }
  try {
    // An old late destroy cannot overwrite the locale of a newer Ability/session.
    if (activeQaAbility === owner) { useModelBaselineStrings(); }
  } catch (_) { session.failCleanup('resource-restore'); }
  logInfo(`${SHARED_FIXTURE_NAME} native-ui-cleanup`);
}
