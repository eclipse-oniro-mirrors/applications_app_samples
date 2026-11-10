/** Native UI uses production controller/workbench; only persistence and continuation I/O are isolated. */
import { Component, Driver, ON, abilityDelegatorRegistry } from '@kit.TestKit';
import { KeyCode } from '@kit.InputKit';
import { pasteboard } from '@kit.BasicServicesKit';
import { LearningController } from '../../../main/ets/learning/LearningController';
import { LearningDependencies, LearningStore } from '../../../main/ets/learning/LearningPorts';
import { SceneBackupClipboard, SceneBackupClipboardPort } from '../../../main/ets/learning/scene/SceneBackupClipboard';
import { FakeContinueNative, FakeLearningEnvironment, ManualLearningClock } from './LearningFixtures';
import { WaveSceneFixture, WaveSceneStore } from './ContinuationWaveOneFixtures';

export class BackupQaClipboard implements SceneBackupClipboardPort {
  texts: string[] = [];
  fail: boolean = false;
  hold: boolean = false;
  private acknowledge: (() => void) | undefined = undefined;
  async writeLocalText(text: string): Promise<void> {
    this.texts.push(text);
    if (this.hold) { await new Promise<void>((resolve): void => { this.acknowledge = resolve; }); }
    if (this.fail) { throw new Error('qa-private-clipboard-error ' + text); }
  }
  release(): void {
    const acknowledge = this.acknowledge; this.acknowledge = undefined;
    if (acknowledge !== undefined) { acknowledge(); }
  }
}

export class WorkspaceQaStore extends WaveSceneStore {
  failNextFlush: boolean = false;
  flushSync(): void {
    if (this.failNextFlush) {
      this.failNextFlush = false;
      throw new Error('QA scene flush failed before effect');
    }
    super.flushSync();
  }
}

export class WorkspaceBackupUiQaFixture implements LearningDependencies {
  readonly clock: ManualLearningClock = new ManualLearningClock();
  readonly native: FakeContinueNative = new FakeContinueNative();
  readonly environment: FakeLearningEnvironment = new FakeLearningEnvironment();
  readonly store: WorkspaceQaStore;
  readonly clipboard: BackupQaClipboard = new BackupQaClipboard();
  readonly controller: LearningController;
  readonly incomingRaw: string;
  readonly baseline: string;
  readonly baselineFlushes: number;

  constructor(scenario: string) {
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

  openStore(): LearningStore { return this.store; }
  release(): void { this.controller.dispose(); this.clipboard.release(); this.clock.clearAll(); }
}

let activeFixture: WorkspaceBackupUiQaFixture | undefined = undefined;
export function mountWorkspaceBackupUiQa(scenario: string): WorkspaceBackupUiQaFixture {
  const previous = activeFixture;
  if (previous !== undefined) { previous.release(); }
  const fixture = new WorkspaceBackupUiQaFixture(scenario);
  activeFixture = fixture;
  return fixture;
}
export function currentWorkspaceBackupUiQa(): WorkspaceBackupUiQaFixture {
  const fixture = activeFixture;
  if (fixture === undefined) { throw new Error('Workspace backup QA harness did not mount'); }
  return fixture;
}

export async function backupQaNode(driver: Driver, id: string): Promise<Component> {
  if (!await driver.waitForIdle(100, 2000)) { throw new Error(`Backup UI not idle: ${id}`); }
  let component = await driver.findComponent(ON.id(id));
  if (component === undefined || component === null) {
    const scroll = await driver.findComponent(ON.id('backup-qa-scroll'));
    if (scroll !== undefined && scroll !== null) { component = await scroll.scrollSearch(ON.id(id)); }
  }
  if (component === undefined || component === null) { component = await driver.waitForComponent(ON.id(id), 3000); }
  if (component === undefined || component === null) { throw new Error(`Missing backup control: ${id}`); }
  return component;
}
export async function backupQaText(driver: Driver, id: string): Promise<string> {
  return (await backupQaNode(driver, id)).getText();
}
export async function backupQaClick(driver: Driver, id: string): Promise<void> {
  await backupQaNode(driver, id);
  if (!await driver.waitForIdle(100, 2000)) { throw new Error(`Backup UI not idle: ${id}`); }
  await (await backupQaNode(driver, id)).click();
}
function requireBackupInputSession(session: WorkspaceBackupUiQaFixture): void {
  if (activeFixture !== session) { throw new Error('Backup input session ended; remaining actions cancelled'); }
}
function requireBackupInputValue(observed: string, expected: string, phase: string): void {
  if (observed === expected) { return; }
  let difference: number = 0;
  const commonLength: number = Math.min(observed.length, expected.length);
  while (difference < commonLength && observed.charCodeAt(difference) === expected.charCodeAt(difference)) { difference++; }
  throw new Error(`Backup input mismatch ${phase}: requested=${expected.length}, observed=${observed.length}, firstDifference=${difference}, expectedUnit=${expected.charCodeAt(difference)}, observedUnit=${observed.charCodeAt(difference)}`);
}
async function readBackupInput(driver: Driver, session: WorkspaceBackupUiQaFixture): Promise<string> {
  requireBackupInputSession(session);
  const input = await backupQaNode(driver, 'ACBackupImportText');
  requireBackupInputSession(session);
  const text = await input.getText();
  requireBackupInputSession(session);
  return text;
}
async function requireBackupInputHost(driver: Driver, session: WorkspaceBackupUiQaFixture, phase: string): Promise<void> {
  requireBackupInputSession(session);
  const top = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
  requireBackupInputSession(session);
  if (top === undefined || top === null || top.context.abilityInfo.name !== 'FeatureQaAbility') {
    throw new Error(`Backup QA ability is not the active host: ${phase}`);
  }
  const root = await driver.findComponent(ON.id('backup-qa-scroll'));
  const marker = await driver.findComponent(ON.id('backup-qa-ready'));
  requireBackupInputSession(session);
  console.info(`[AC_QA_HOST] ${phase} ability=FeatureQaAbility root=${root !== undefined && root !== null} readyVisible=${marker !== undefined && marker !== null}`);
  if (root === undefined || root === null) { throw new Error(`Backup QA root disappeared: ${phase}`); }
}
async function backupInputKeys(driver: Driver, session: WorkspaceBackupUiQaFixture, key: number): Promise<void> {
  requireBackupInputSession(session);
  await driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, key);
  requireBackupInputSession(session);
}
export async function backupQaInput(driver: Driver, text: string): Promise<void> {
  const session = activeFixture;
  if (session === undefined) { throw new Error('Backup input requires a mounted isolated fixture'); }
  await requireBackupInputHost(driver, session, 'beforeInput');
  const input = await backupQaNode(driver, 'ACBackupImportText');
  requireBackupInputSession(session);
  await input.click();
  requireBackupInputSession(session);
  // Select-all/delete clears the whole multiline field rather than the SDK's clicked-line End/backspace path.
  await backupInputKeys(driver, session, KeyCode.KEYCODE_A);
  await driver.triggerKey(KeyCode.KEYCODE_DEL);
  requireBackupInputSession(session);
  requireBackupInputValue(await readBackupInput(driver, session), '', 'afterClear');
  if (text.length > 0) {
    // Only explicit synthetic QA input is written. Never read existing system clipboard data or clear unknown data.
    // The fresh PasteData object's properties are local metadata, not a system clipboard read.
    const data = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, text);
    const property = data.getProperty();
    property.shareOption = pasteboard.ShareOption.LOCALDEVICE;
    data.setProperty(property);
    requireBackupInputSession(session);
    await pasteboard.getSystemPasteboard().setData(data);
    requireBackupInputSession(session);
    await requireBackupInputHost(driver, session, 'beforePaste');
    await backupInputKeys(driver, session, KeyCode.KEYCODE_V);
    requireBackupInputValue(await readBackupInput(driver, session), text, 'afterPaste');
  }
  await requireBackupInputHost(driver, session, 'beforeBack');
  requireBackupInputSession(session);
  await driver.pressBack();
  requireBackupInputSession(session);
  if (!await driver.waitForIdle(100, 2000)) { throw new Error('Backup input did not settle'); }
  await requireBackupInputHost(driver, session, 'afterBack');
  requireBackupInputValue(await readBackupInput(driver, session), text, 'afterBack');
}
export async function backupQaDialog(driver: Driver, label: string,
  title: string = '恢复本地业务工作区？'): Promise<void> {
  const dialogTitle = await driver.waitForComponent(ON.text(title), 3000);
  if (dialogTitle === undefined || dialogTitle === null) { throw new Error(`Missing backup dialog: ${title}`); }
  const button = await driver.waitForComponent(ON.text(label).isAfter(ON.text(title)), 3000);
  if (button === undefined || button === null) { throw new Error(`Missing backup confirmation: ${label}`); }
  const session = currentWorkspaceBackupUiQa();
  await button.click();
  requireBackupInputSession(session);
  const restoring: boolean = title === '恢复本地业务工作区？' && label === '确认';
  if (restoring) {
    // Synchronous observation before any extra await: native click delivery is not callback completion.
    console.info(`[AC_QA_CONFIRM] clickReturned noteLength=${session.controller.sceneSnapshot('note').noteBody.length} storedSame=${session.store.stored() === session.baseline} flushDelta=${session.store.flushCalls - session.baselineFlushes}`);
  }
  const deadline: number = Date.now() + 3000;
  while (true) {
    requireBackupInputSession(session);
    if (!await driver.waitForIdle(100, 2000)) { throw new Error(`Backup dialog UI did not settle: ${title}`); }
    requireBackupInputSession(session);
    const remaining = await driver.findComponent(ON.text(title));
    requireBackupInputSession(session);
    if (remaining === undefined || remaining === null) { break; }
    if (Date.now() >= deadline) { throw new Error(`Backup dialog did not close after click: ${title}`); }
  }
  // The public dialog promise callback runs as the overlay closes; wait for that real UI turn, not a model value.
  if (!await driver.waitForIdle(100, 2000)) { throw new Error(`Backup dialog close did not settle: ${title}`); }
  requireBackupInputSession(session);
  if (restoring) {
    console.info(`[AC_QA_CONFIRM] dialogClosed noteLength=${session.controller.sceneSnapshot('note').noteBody.length} storedSame=${session.store.stored() === session.baseline} flushDelta=${session.store.flushCalls - session.baselineFlushes}`);
  }
}
export async function launchWorkspaceBackupUiQa(scenario: string): Promise<Driver> {
  const driver = Driver.create();
  if (driver === undefined || driver === null) {
    throw new Error('UiTest Driver.create() returned null; native IPC initialization failed. Check deferred Runner imports and device UiTest logs.');
  }
  // Normal test-display wake only; never change the board's power policy or screen-off timeout.
  await driver.wakeUpDisplay();
  const parameters: Record<string, Object> = {};
  parameters['testPage'] = 'WorkspaceBackupUiQa'; parameters['qaScenario'] = scenario;
  await abilityDelegatorRegistry.getAbilityDelegator().startAbility({
    bundleName: 'com.example.appcontinuation', moduleName: 'entry_test', abilityName: 'FeatureQaAbility',
    parameters: parameters
  });
  const ready = await driver.waitForComponent(ON.id('backup-qa-ready'), 3000);
  if (ready === undefined || ready === null) { throw new Error('Workspace backup QA page not ready'); }
  return driver;
}
export async function finishWorkspaceBackupUiQa(): Promise<void> {
  const fixture = activeFixture; activeFixture = undefined;
  if (fixture !== undefined) { fixture.release(); }
  const top = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
  if (top.context.abilityInfo.name === 'FeatureQaAbility') { await top.context.terminateSelf(); }
}
