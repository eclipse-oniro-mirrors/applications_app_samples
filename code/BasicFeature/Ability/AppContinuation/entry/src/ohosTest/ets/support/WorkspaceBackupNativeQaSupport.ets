import { common } from '@kit.AbilityKit';
import { preferences } from '@kit.ArkData';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { LearningController } from '../../../main/ets/learning/LearningController';
import { LearningDependencies, LearningStore, PlatformLearningStore } from '../../../main/ets/learning/LearningPorts';
import { PreferencesSceneStore, SceneStorePort, SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import { SCENE_STORE_KEY, SceneWorkspace, decodeWorkspace } from '../../../main/ets/learning/scene/SceneModel';
import { FakeContinueNative, FakeLearningEnvironment, ManualLearningClock } from './LearningFixtures';

let workspaceNativeSerial: number = 0;

/** Only the acknowledgement is injected; all successful operations delegate to the production SDK adapter. */
export class NativeSceneAcknowledgementFault implements SceneStorePort {
  public puts: number = 0;
  public flushes: number = 0;
  public afterFlushFailures: number = 0;
  public rejectPut: number = -1;
  private adapter: PreferencesSceneStore;
  constructor(adapter: PreferencesSceneStore) { this.adapter = adapter; }
  public getSync(key: string, fallback: string): Object { return this.adapter.getSync(key, fallback); }
  public putSync(key: string, value: string): void {
    this.puts++;
    if (this.puts === this.rejectPut) { throw new Error('QA injected failure before compensation put'); }
    this.adapter.putSync(key, value);
  }
  public deleteSync(key: string): void { this.adapter.deleteSync(key); }
  public flushSync(): void {
    this.flushes++;
    this.adapter.flushSync();
    if (this.afterFlushFailures > 0) {
      this.afterFlushFailures--;
      throw new Error('QA lost acknowledgement AFTER a successful real flushSync');
    }
  }
}

class NativeWorkspaceDependencies implements LearningDependencies {
  public readonly clock: ManualLearningClock = new ManualLearningClock();
  public readonly native: FakeContinueNative = new FakeContinueNative();
  public readonly environment: FakeLearningEnvironment = new FakeLearningEnvironment();
  private store: PlatformLearningStore;
  constructor(store: PlatformLearningStore) { this.store = store; }
  public openStore(): LearningStore { return this.store; }
}

export class WorkspaceBackupNativeQaFixture {
  public readonly context: common.ApplicationContext;
  public readonly sceneNamespace: string;
  public readonly textNamespace: string;
  private workbenches: SceneWorkbench[] = [];
  private controllers: LearningController[] = [];
  private dependencies: NativeWorkspaceDependencies[] = [];

  constructor(context: common.ApplicationContext, base: string) {
    if (!/^ac_workspace_native_qa_[0-9]+_[0-9]+$/.test(base)) {
      throw new Error('Refusing a non-QA scene/text namespace');
    }
    this.context = context;
    this.sceneNamespace = `${base}_scene`;
    this.textNamespace = `${base}_text`;
  }

  public adapter(): PreferencesSceneStore { return new PreferencesSceneStore(this.context, this.sceneNamespace); }

  public workbench(port: SceneStorePort = this.adapter()): SceneWorkbench {
    const work: SceneWorkbench = new SceneWorkbench(port);
    this.workbenches.push(work);
    return work;
  }

  public controller(port: SceneStorePort = this.adapter()): LearningController {
    const dependencies: NativeWorkspaceDependencies = new NativeWorkspaceDependencies(
      new PlatformLearningStore(this.context, this.textNamespace));
    this.dependencies.push(dependencies);
    const controller: LearningController = new LearningController(undefined, dependencies, undefined, port);
    this.controllers.push(controller);
    return controller;
  }

  public dispose(): void {
    this.controllers.forEach((controller: LearningController): void => { controller.dispose(); });
    this.workbenches.forEach((work: SceneWorkbench): void => { work.dispose(); });
    this.dependencies.forEach((dependencies: NativeWorkspaceDependencies): void => { dependencies.clock.clearAll(); });
    this.controllers = [];
    this.workbenches = [];
    this.dependencies = [];
  }

  public async invalidate(): Promise<void> {
    this.dispose();
    await preferences.removePreferencesFromCache(this.context, this.sceneNamespace);
    await preferences.removePreferencesFromCache(this.context, this.textNamespace);
  }

  public async reopen(): Promise<SceneWorkbench> { await this.invalidate(); return this.workbench(); }

  public async reopenController(): Promise<LearningController> { await this.invalidate(); return this.controller(); }

  public raw(): string {
    const store: preferences.Preferences = preferences.getPreferencesSync(this.context, { name: this.sceneNamespace });
    const raw: preferences.ValueType = store.getSync(SCENE_STORE_KEY, '');
    if (typeof raw !== 'string') { throw new Error('QA scene key is not a string'); }
    return raw;
  }

  public workspace(): SceneWorkspace {
    const workspace: SceneWorkspace | undefined = decodeWorkspace(this.raw());
    if (workspace === undefined) { throw new Error('QA scene root did not decode'); }
    return workspace;
  }

  public allText(): string {
    return JSON.stringify(preferences.getPreferencesSync(this.context, { name: this.textNamespace }).getAllSync());
  }

  public async seed(value: preferences.ValueType): Promise<void> {
    await this.invalidate();
    const store: preferences.Preferences = preferences.getPreferencesSync(this.context, { name: this.sceneNamespace });
    store.putSync(SCENE_STORE_KEY, value);
    store.flushSync();
    await preferences.removePreferencesFromCache(this.context, this.sceneNamespace);
  }

  public populate(work: SceneWorkbench, label: string): string {
    if (!work.open('note') || !work.editNote(label, `${label}😀\n真实正文`, 0, 2) || !work.saveNote()) {
      throw new Error('Failed to persist the QA note');
    }
    if (!work.open('reading') || !work.gotoParagraph(1, 2) || !work.addBookmark() || !work.saveReading()) {
      throw new Error('Failed to persist the QA reading position');
    }
    if (!work.open('form') || !work.setFormField('name', `${label}姓名`) ||
      !work.setFormField('address', `${label}地址`) || !work.saveForm()) {
      throw new Error('Failed to persist the QA form draft');
    }
    return work.backupSnapshot().raw;
  }

  public async close(): Promise<void> {
    this.dispose();
    try {
      await preferences.deletePreferences(this.context, this.sceneNamespace);
    } finally {
      await preferences.deletePreferences(this.context, this.textNamespace);
    }
  }
}

export async function nativeSceneBackup(label: string): Promise<string> {
  const snapshots: string[] = [];
  await withWorkspaceBackupNativeQa(async (fixture: WorkspaceBackupNativeQaFixture): Promise<void> => {
    snapshots.push(fixture.populate(fixture.workbench(), label));
  });
  return snapshots[0];
}

export async function withWorkspaceBackupNativeQa(
  body: (fixture: WorkspaceBackupNativeQaFixture) => Promise<void>): Promise<void> {
  const context: common.ApplicationContext = abilityDelegatorRegistry.getAbilityDelegator()
    .getAppContext().getApplicationContext();
  const fixture: WorkspaceBackupNativeQaFixture = new WorkspaceBackupNativeQaFixture(context,
    `ac_workspace_native_qa_${Date.now()}_${++workspaceNativeSerial}`);
  try { await body(fixture); } finally { await fixture.close(); }
}
