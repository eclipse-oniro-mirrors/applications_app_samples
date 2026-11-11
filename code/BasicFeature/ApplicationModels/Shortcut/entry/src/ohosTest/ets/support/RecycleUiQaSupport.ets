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
import { Component, Driver, ON, abilityDelegatorRegistry } from '@kit.TestKit';
import { BusinessStore } from '../../../main/ets/business/BusinessStore';
import { RecycleBatchPreview } from '../../../main/ets/business/RecycleBatch';
import { BusinessStorage, BusinessWriteError } from '../../../main/ets/business/BusinessStorage';
import { MAX_ACTIVE_NOTES, NOTE_RECYCLE_RETENTION_MS } from '../../../main/ets/business/NoteRecyclePolicy';
import { uiText } from '../../../main/ets/i18n/Strings';
import { useModelBaselineStrings } from './TestStrings';
import { logInfo, logWarning } from '../../../main/ets/services/Logger';

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

  constructor() { this.store = new BusinessStore(this.storage, (): number => this.time); }

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

/** Own the test Ability directly; a foreground query is not a lifecycle guarantee. */
export class RecycleUiQaAbilitySession {
  private readonly context: common.UIAbilityContext;
  private readonly destroyedSignal: RecycleQaSignal = new RecycleQaSignal();
  private destroyed: boolean = false;

  constructor(context: common.UIAbilityContext) { this.context = context; }

  markDestroyed(): void {
    this.destroyed = true;
    this.destroyedSignal.release();
  }

  async close(): Promise<void> {
    if (this.destroyed) { return; }
    await new Promise<void>((resolve, reject): void => {
      let settled: boolean = false;
      let timer: number = -1;
      const finish = (error: Error | undefined = undefined): void => {
        if (settled) { return; }
        settled = true;
        if (timer >= 0) { clearTimeout(timer); }
        if (error === undefined) { resolve(); } else { reject(error); }
      };
      timer = setTimeout((): void => {
        finish(new Error('Recycle QA Ability did not reach onDestroy during cleanup'));
      }, 3000);
      this.destroyedSignal.promise.then((): void => { finish(); });
      try {
        this.context.terminateSelf().catch((error: Error): void => {
          if (this.destroyed) { finish(); } else { finish(error); }
        });
      } catch (error) {
        if (this.destroyed) { finish(); } else { finish(error as Error); }
      }
    });
  }
}

let activeQaAbility: RecycleUiQaAbilitySession | undefined = undefined;
export function attachRecycleUiQaAbility(context: common.UIAbilityContext): RecycleUiQaAbilitySession {
  const session = new RecycleUiQaAbilitySession(context);
  activeQaAbility = session;
  return session;
}
export function detachRecycleUiQaAbility(session: RecycleUiQaAbilitySession): void {
  session.markDestroyed();
  // A late destroy callback must not clear a newer test Ability's ownership.
  if (activeQaAbility === session) { activeQaAbility = undefined; }
}

let activeFixture: RecycleUiQaFixture | undefined = undefined;
export async function mountRecycleUiQa(context: common.ApplicationContext,
  scenario: string): Promise<RecycleUiQaFixture> {
  const previous = activeFixture;
  if (previous !== undefined) { previous.dispose(); }
  const fixture = new RecycleUiQaFixture(); activeFixture = fixture;
  await fixture.initialize(context, scenario);
  return fixture;
}
export function currentRecycleUiQa(): RecycleUiQaFixture {
  const fixture = activeFixture;
  if (fixture === undefined) { throw new Error('Recycle QA harness did not mount'); }
  return fixture;
}
export function recycleQaPreview(fixture: RecycleUiQaFixture): RecycleBatchPreview {
  const preview = fixture.store.snapshot().recycleBatchPreview;
  if (preview === undefined) { throw new Error('Production batch preview was not generated'); }
  return preview;
}
export async function recycleQaNode(driver: Driver, id: string): Promise<Component> {
  if (!await driver.waitForIdle(100, 2000)) { throw new Error(`Recycle UI not idle: ${id}`); }
  let component = await driver.findComponent(ON.id(id));
  if (component === undefined || component === null) {
    const scroll = await driver.findComponent(ON.id('note-trash-list'));
    if (scroll !== undefined && scroll !== null) { component = await scroll.scrollSearch(ON.id(id)); }
  }
  if (component === undefined || component === null) { component = await driver.waitForComponent(ON.id(id), 3000); }
  if (component === undefined || component === null) { throw new Error(`Missing recycle control: ${id}`); }
  return component;
}
export async function recycleQaText(driver: Driver, id: string): Promise<string> {
  return (await recycleQaNode(driver, id)).getText();
}
export async function recycleQaClick(driver: Driver, id: string): Promise<void> {
  await recycleQaNode(driver, id);
  if (!await driver.waitForIdle(100, 2000)) { throw new Error(`Recycle UI not idle: ${id}`); }
  await (await recycleQaNode(driver, id)).click();
}
export async function recycleQaDialog(driver: Driver, label: string,
  title: string = uiText('shortcut_text_0699')): Promise<void> {
  const dialogTitle = await driver.waitForComponent(ON.text(title), 3000);
  if (dialogTitle === undefined || dialogTitle === null) { throw new Error(`Missing recycle dialog: ${title}`); }
  // Relative selection avoids the identically labelled production button behind the modal.
  const button = await driver.waitForComponent(ON.text(label).isAfter(ON.text(title)), 3000);
  if (button === undefined || button === null) { throw new Error(`Missing recycle confirmation: ${label}`); }
  await button.click();
}
export async function launchRecycleUiQa(scenario: string): Promise<Driver> {
  logInfo('Native UI QA begin');
  // Do not reuse a previous case's Ability if its cleanup was interrupted.
  if (activeQaAbility !== undefined) { await finishRecycleUiQa(); }
  const parameters: Record<string, Object> = {};
  parameters['testPage'] = 'RecycleUiQa'; parameters['qaScenario'] = scenario;
  await abilityDelegatorRegistry.getAbilityDelegator().startAbility({
    bundleName: 'com.example.shortcut', moduleName: 'entry_test', abilityName: 'FeatureQaAbility',
    parameters: parameters
  });
  const driver = Driver.create();
  if (driver === undefined || driver === null) {
    throw new Error('UiTest Driver.create() returned null; native IPC initialization failed. ' +
      'Check deferred Runner imports and device UiTest logs.');
  }
  const ready = await driver.waitForComponent(ON.id('recycle-qa-ready'), 3000);
  if (ready === undefined || ready === null) { throw new Error('Recycle QA page not ready'); }
  if (activeQaAbility === undefined) { throw new Error('Recycle QA Ability lifecycle ownership was not registered'); }
  return driver;
}
export async function finishRecycleUiQa(): Promise<void> {
  const fixture = activeFixture; activeFixture = undefined;
  const session = activeQaAbility;
  try {
    if (fixture !== undefined) { fixture.dispose(); }
  } finally {
    // No owned Ability means launch failed before creation, or onDestroy already ran.
    // Never query or terminate whichever unrelated Ability happens to be on top.
    try {
      if (session !== undefined) { await session.close(); }
    } catch (error) {
      logWarning('Native UI QA cleanup failure');
      throw error;
    } finally {
      useModelBaselineStrings();
      logInfo('Native UI QA end');
    }
  }
}
