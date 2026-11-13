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

/** Native UI uses production controller/workbench; only persistence and continuation I/O are isolated. */
import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { UiTestDriver as Driver, UiTestComponent as Component, UiTestSession, ON } from './UiTestRuntime';
import { KeyCode } from '@kit.InputKit';
import { pasteboard } from '@kit.BasicServicesKit';
import { BUNDLE, testInfo } from './TestLog';
import { LearningController } from '../../../main/ets/learning/LearningController';
import { LearningDependencies, LearningStore } from '../../../main/ets/learning/LearningPorts';
import { SceneBackupClipboard, SceneBackupClipboardPort } from '../../../main/ets/learning/scene/SceneBackupClipboard';
import { FakeContinueNative, FakeLearningEnvironment, ManualLearningClock } from './LearningFixtures';
import { WaveSceneFixture, WaveSceneStore } from './ContinuationWaveOneFixtures';

export class BackupQaClipboard implements SceneBackupClipboardPort {
  public texts: string[] = [];
  public fail: boolean = false;
  public hold: boolean = false;
  private acknowledge: (() => void) | undefined = undefined;
  public async writeLocalText(text: string): Promise<void> {
    this.texts.push(text);
    if (this.hold) { await new Promise<void>((resolve): void => { this.acknowledge = resolve; }); }
    if (this.fail) { throw new Error('qa-private-clipboard-error ' + text); }
  }
  public release(): void {
    const acknowledge = this.acknowledge; this.acknowledge = undefined;
    if (acknowledge !== undefined) { acknowledge(); }
  }
}

export class WorkspaceQaStore extends WaveSceneStore {
  public failNextFlush: boolean = false;
  public flushSync(): void {
    if (this.failNextFlush) {
      this.failNextFlush = false;
      throw new Error('QA scene flush failed before effect');
    }
    super.flushSync();
  }
}

export class WorkspaceBackupUiQaFixture implements LearningDependencies {
  public readonly clock: ManualLearningClock = new ManualLearningClock();
  public readonly native: FakeContinueNative = new FakeContinueNative();
  public readonly environment: FakeLearningEnvironment = new FakeLearningEnvironment();
  public readonly store: WorkspaceQaStore;
  public readonly clipboard: BackupQaClipboard = new BackupQaClipboard();
  public readonly controller: LearningController;
  public readonly incomingRaw: string;
  public readonly baseline: string;
  public readonly baselineFlushes: number;
  public readonly scenario: string;
  public readonly owner: common.UIAbilityContext;
  public readonly session: UiTestSession;
  private released: boolean = false;
  private scrollOffsetProbe: (() => number) | undefined = undefined;

  constructor(scenario: string, owner: common.UIAbilityContext, session: UiTestSession) {
    this.scenario = scenario;
    this.owner = owner;
    this.session = session;
    this.store = new WorkspaceQaStore(scenario === 'frozen' ? '{' : '');
    this.clipboard.hold = scenario === 'copyPending';
    this.clipboard.fail = scenario === 'copyFailure';
    this.controller = new LearningController(undefined, this, new SceneBackupClipboard(this.clipboard));
    if (scenario !== 'frozen') {
      const work = this.controller.sceneWorkbench;
      if (!work.editNote('本机标题', '本机原正文', 0, 3) || !work.saveNote()) {
        throw new Error('Could not prepare real local note');
      }
      if (scenario === 'dirty' || scenario === 'scopeSelectedDirty') {
        work.editNote('本机草稿标题', '本机未保存正文', 0, 2);
      }
      if (scenario === 'scopePreserve') {
        if (!work.gotoParagraph(0, 1) || !work.saveReading() ||
          !work.setFormField('name', '本机已保存姓名') || !work.saveForm()) {
          throw new Error('Could not prepare saved reading/form baselines');
        }
        if (!work.gotoParagraph(2, 1) || !work.setFormField('name', '本机未保存姓名')) {
          throw new Error('Could not prepare independent unselected edits');
        }
      }
    }
    const donor = new WaveSceneFixture();
    try {
      const work = donor.controller.sceneWorkbench;
      if (!work.editNote('导入私密标题', 'qa-private-backup-body', 0, 2) || !work.saveNote()) {
        throw new Error('Could not prepare real donor workspace');
      }
      if (!work.open('reading') || !work.gotoParagraph(1, 1) || !work.saveReading()) {
        throw new Error('Could not prepare real donor reading progress');
      }
      const exported = donor.controller.sceneBackupSnapshot();
      if (!exported.ok) { throw new Error(exported.message); }
      this.incomingRaw = exported.raw;
    } finally { donor.release(); }
    this.baseline = this.store.stored();
    this.baselineFlushes = this.store.flushCalls;
    if (scenario === 'writeFailure') { this.store.failNextFlush = true; }
  }

  public openStore(): LearningStore { return this.store; }
  public attachScrollOffsetProbe(probe: () => number): void {
    this.session.requireLive();
    if (this.released || (this.scrollOffsetProbe !== undefined && this.scrollOffsetProbe !== probe)) {
      throw new Error('Another backup harness owns the scroll probe');
    }
    this.scrollOffsetProbe = probe;
  }
  public detachScrollOffsetProbe(probe: () => number): void {
    if (this.scrollOffsetProbe === probe) { this.scrollOffsetProbe = undefined; }
  }
  public readScrollOffset(): number {
    this.session.requireLive();
    const probe = this.scrollOffsetProbe;
    if (this.released || probe === undefined) { throw new Error('Owned backup scroll probe is not mounted'); }
    return probe();
  }
  public release(): void {
    if (this.released) { return; }
    this.released = true;
    this.scrollOffsetProbe = undefined;
    try { this.controller.dispose(); } catch (error) { this.session.failCleanup('backup.controller'); }
    try { this.clipboard.release(); } catch (error) { this.session.failCleanup('backup.clipboard'); }
    try { this.clock.clearAll(); } catch (error) { this.session.failCleanup('backup.clock'); }
  }
}

let activeFixture: WorkspaceBackupUiQaFixture | undefined = undefined;

export function mountWorkspaceBackupUiQa(scenario: string, owner: common.UIAbilityContext,
  session: UiTestSession): WorkspaceBackupUiQaFixture {
  session.requireLive();
  if (activeFixture !== undefined) { throw new Error('Another backup UI fixture is still owned'); }
  const fixture = new WorkspaceBackupUiQaFixture(scenario, owner, session);
  activeFixture = fixture;
  return fixture;
}

export function currentWorkspaceBackupUiQa(sessionId: string = ''): WorkspaceBackupUiQaFixture {
  const fixture = activeFixture;
  if (fixture === undefined || (sessionId.length > 0 && fixture.session.id !== sessionId)) {
    throw new Error('Workspace backup QA harness did not mount for this session');
  }
  fixture.session.requireLive();
  return fixture;
}

export function failWorkspaceBackupUiQaInitialization(sessionId: string, phase: string): void {
  const fixture = activeFixture;
  if (fixture !== undefined && fixture.session.id === sessionId) { fixture.session.failInitialization(phase); }
}

export function releaseWorkspaceBackupUiQa(fixture: WorkspaceBackupUiQaFixture): void {
  if (activeFixture === fixture) { activeFixture = undefined; }
  fixture.release();
}

function requireBackupInputSession(driver: Driver, fixture: WorkspaceBackupUiQaFixture): void {
  driver.session.requireLive();
  if (activeFixture !== fixture || fixture.session !== driver.session || !driver.session.owns(fixture.owner)) {
    throw new Error('Backup input session ended; remaining actions cancelled');
  }
}

export async function backupQaNode(driver: Driver, id: string): Promise<Component> {
  const fixture = currentWorkspaceBackupUiQa(driver.session.id);
  let component = await driver.session.guard(driver.findComponent(ON.id(id)));
  if (component === undefined) {
    const scroll = await driver.session.guard(driver.findComponent(ON.id(`backup-qa-scroll-${driver.session.id}`)));
    if (scroll !== undefined) { component = await driver.session.guard(scroll.scrollSearch(ON.id(id), component)); }
  }
  if (component === undefined) {
    component = await driver.session.guard(driver.waitForComponent(ON.id(id), 1500));
  }
  requireBackupInputSession(driver, fixture);
  if (component === undefined) { throw new Error(`Missing backup control: ${id}`); }
  return component;
}

export async function backupQaText(driver: Driver, id: string): Promise<string> {
  const fixture = currentWorkspaceBackupUiQa(driver.session.id);
  const node = await driver.session.guard(backupQaNode(driver, id));
  const text = await driver.session.guard(node.getText());
  requireBackupInputSession(driver, fixture);
  return text;
}

export async function backupQaClick(driver: Driver, id: string): Promise<void> {
  const fixture = currentWorkspaceBackupUiQa(driver.session.id);
  driver.session.enterPhase(`backup.click:${id}`);
  const node = await driver.session.guard(backupQaNode(driver, id));
  requireBackupInputSession(driver, fixture);
  await driver.session.guard(node.click());
  // Native node reads/dialog disappearance below verify the result; global animation idle is not required.
  await driver.session.pause(50);
  requireBackupInputSession(driver, fixture);
}

function requireBackupInputValue(observed: string, expected: string, phase: string): void {
  if (observed === expected) { return; }
  let difference: number = 0;
  const commonLength: number = Math.min(observed.length, expected.length);
  while (difference < commonLength && observed.charCodeAt(difference) === expected.charCodeAt(difference)) {
    difference++;
  }
  throw new Error(`Backup input mismatch ${phase}: requested=${expected.length}, observed=${observed.length}, ` +
    `firstDifference=${difference}, expectedUnit=${expected.charCodeAt(difference)}, ` +
    `observedUnit=${observed.charCodeAt(difference)}`);
}

async function readBackupInput(driver: Driver, fixture: WorkspaceBackupUiQaFixture,
  currentInput: Component | undefined = undefined): Promise<string> {
  requireBackupInputSession(driver, fixture);
  // Clearing and pasting keep this same mounted TextArea; property reads need no new lookup.
  const input = currentInput === undefined ?
    await driver.session.guard(backupQaNode(driver, 'ACBackupImportText')) : currentInput;
  const text = await driver.session.guard(input.getText());
  requireBackupInputSession(driver, fixture);
  return text;
}

async function requireBackupInputHost(driver: Driver, fixture: WorkspaceBackupUiQaFixture,
  phase: string, verifyRoot: boolean = false): Promise<void> {
  requireBackupInputSession(driver, fixture);
  const top = await driver.session.call(() => abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility(),
    'AbilityDelegator.getCurrentTopAbility');
  requireBackupInputSession(driver, fixture);
  if (top === undefined || top === null || top.context.abilityInfo.bundleName !== BUNDLE ||
    top.context.abilityInfo.moduleName !== 'entry_test' || top.context.abilityInfo.name !== 'FeatureQaAbility') {
    throw new Error(`Backup QA ability is not the active host: ${phase}`);
  }
  driver.session.verifyOwnedForeground(top.context);
  // The exact fixture/session and active host are still checked at every input boundary.
  // This immutable root was verified on launch; do not pay another lookup for each key step.
  if (!verifyRoot) { return; }
  const root = await driver.session.guard(driver.findComponent(ON.id(`backup-qa-scroll-${driver.session.id}`)));
  requireBackupInputSession(driver, fixture);
  testInfo(`[AC_QA_HOST] ${phase} ability=FeatureQaAbility root=${root !== undefined}`);
  if (root === undefined) { throw new Error(`Backup QA root disappeared: ${phase}`); }
}

async function backupInputKeys(driver: Driver, fixture: WorkspaceBackupUiQaFixture, key: number): Promise<void> {
  requireBackupInputSession(driver, fixture);
  await driver.session.guard(driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, key));
  requireBackupInputSession(driver, fixture);
}

export async function backupQaInput(driver: Driver, text: string): Promise<void> {
  const fixture = currentWorkspaceBackupUiQa(driver.session.id);
  driver.session.enterPhase('backup.input');
  await driver.session.guard(requireBackupInputHost(driver, fixture, 'beforeInput'));
  const input = await driver.session.guard(backupQaNode(driver, 'ACBackupImportText'));
  await driver.session.guard(input.click());
  await driver.session.guard(backupInputKeys(driver, fixture, KeyCode.KEYCODE_A));
  await driver.session.guard(driver.triggerKey(KeyCode.KEYCODE_DEL));
  requireBackupInputValue(await driver.session.guard(readBackupInput(driver, fixture, input)), '', 'afterClear');
  if (text.length > 0) {
    const data = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, text);
    const property = data.getProperty();
    property.shareOption = pasteboard.ShareOption.LOCALDEVICE;
    data.setProperty(property);
    requireBackupInputSession(driver, fixture);
    await driver.session.call((): Promise<void> => pasteboard.getSystemPasteboard().setData(data), 'Pasteboard.setData');
    await driver.session.guard(requireBackupInputHost(driver, fixture, 'beforePaste'));
    await driver.session.guard(backupInputKeys(driver, fixture, KeyCode.KEYCODE_V));
    requireBackupInputValue(await driver.session.guard(readBackupInput(driver, fixture, input)), text, 'afterPaste');
  }
  // Hide the IME explicitly: Back could navigate away, while leaving it open covers Preview
  // and routes the outer Scroll gesture to the keyboard or the TextArea's internal scroll container.
  await driver.session.guard(driver.hideTextInput());
  // Native node reads/dialog disappearance below verify the result; global animation idle is not required.
  await driver.session.pause(50);
  await driver.session.guard(requireBackupInputHost(driver, fixture, 'afterInput'));
  requireBackupInputValue(await driver.session.guard(readBackupInput(driver, fixture)), text, 'afterInput');
}

export async function backupQaDialog(driver: Driver, label: string,
  title: string = '恢复本地业务工作区？'): Promise<void> {
  const fixture = currentWorkspaceBackupUiQa(driver.session.id);
  const dialogTitle = await driver.session.guard(driver.waitForComponent(ON.text(title), 2000));
  if (dialogTitle === undefined) { throw new Error(`Missing backup dialog: ${title}`); }
  const button = await driver.session.guard(driver.waitForComponent(ON.text(label).isAfter(ON.text(title)), 2000));
  if (button === undefined) { throw new Error(`Missing backup confirmation: ${label}`); }
  requireBackupInputSession(driver, fixture);
  await driver.session.guard(button.click());
  requireBackupInputSession(driver, fixture);
  const restoring: boolean = title === '恢复本地业务工作区？' && label === '确认';
  if (restoring) {
    testInfo(`[AC_QA_CONFIRM] clickReturned ` +
      `noteLength=${fixture.controller.sceneSnapshot('note').noteBody.length} ` +
      `storedSame=${fixture.store.stored() === fixture.baseline} ` +
      `flushDelta=${fixture.store.flushCalls - fixture.baselineFlushes}`);
  }
  const deadline: number = Date.now() + Math.min(2000, driver.session.remaining());
  while (true) {
    const remaining = await driver.session.guard(driver.findComponent(ON.text(title)));
    requireBackupInputSession(driver, fixture);
    if (remaining === undefined) { break; }
    if (Date.now() >= deadline) { throw new Error(`Backup dialog did not close after click: ${title}`); }
    await driver.session.pause(50);
  }
  // Native node reads/dialog disappearance below verify the result; global animation idle is not required.
  await driver.session.pause(50);
  requireBackupInputSession(driver, fixture);
  if (restoring) {
    testInfo(`[AC_QA_CONFIRM] dialogClosed ` +
      `noteLength=${fixture.controller.sceneSnapshot('note').noteBody.length} ` +
      `storedSame=${fixture.store.stored() === fixture.baseline} ` +
      `flushDelta=${fixture.store.flushCalls - fixture.baselineFlushes}`);
  }
}

export async function launchWorkspaceBackupUiQa(session: UiTestSession, scenario: string): Promise<Driver> {
  session.enterPhase('backup.launch');
  if (activeFixture !== undefined) { throw new Error('Previous backup UI fixture is still owned'); }
  const driver = session.createDriver();
  await session.guard(driver.wakeUpDisplay());
  const parameters: Record<string, Object> = {};
  parameters['testPage'] = 'WorkspaceBackupUiQa';
  parameters['qaScenario'] = scenario;
  await session.guard(session.startAbility(BUNDLE, 'FeatureQaAbility', parameters));
  const ready = await session.guard(driver.waitForComponent(ON.id(`backup-qa-ready-${session.id}`), 3000));
  if (ready === undefined) { throw new Error('Workspace backup QA page not ready'); }
  const fixture = currentWorkspaceBackupUiQa(session.id);
  if (fixture.scenario !== scenario) { throw new Error('Workspace backup QA selected the wrong scenario'); }
  driver.observeScrollOffset((): number => {
    requireBackupInputSession(driver, fixture);
    return fixture.readScrollOffset();
  });
  await session.guard(requireBackupInputHost(driver, fixture, 'afterLaunch', true));
  // The nonce header can render before business layout. Wait for the real collapsed entry,
  // without clicking it or changing the initial panel state.
  const toggle = await session.guard(driver.waitForComponent(ON.id('ACBackupPanelToggle'), 3000));
  requireBackupInputSession(driver, fixture);
  if (toggle === undefined) { throw new Error('Workspace backup QA entry control is not visible'); }
  return driver;
}

export async function finishWorkspaceBackupUiQa(session: UiTestSession): Promise<void> {
  await session.close();
}
