/** Pending centralized validation. Controlled I/O for real backup code; no backup rules are reimplemented. */
import { LearningController } from '../../../main/ets/learning/LearningController';
import { LearningDependencies, LearningStore } from '../../../main/ets/learning/LearningPorts';
import { SceneStorePort, SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import { SceneBackupClipboard, SceneBackupClipboardPort } from '../../../main/ets/learning/scene/SceneBackupClipboard';
import { SCENE_STORE_KEY, SceneDocument, SceneWorkspace, emptyScene, emptyWorkspace, encodeWorkspace, stageScene } from '../../../main/ets/learning/scene/SceneModel';
import { FakeContinueNative, FakeLearningEnvironment, ManualLearningClock } from './LearningFixtures';
import { waveNote, waveReading } from './ContinuationWaveOneFixtures';

export class BackupStore implements LearningStore, SceneStorePort {
  private cache: Map<string, Object> = new Map<string, Object>();
  private disk: Map<string, Object> = new Map<string, Object>();
  putCalls: number = 0;
  flushCalls: number = 0;
  deleteCalls: number = 0;
  writtenKeys: string[] = [];
  failPutCalls: number[] = [];
  failFlushCalls: number[] = [];
  failDeleteCalls: number[] = [];
  failSceneRead: boolean = false;
  onFlush: (() => void) | undefined = undefined;
  constructor(raw: Object | undefined = undefined) {
    if (raw !== undefined) { this.cache.set(SCENE_STORE_KEY, raw); this.disk.set(SCENE_STORE_KEY, raw); }
  }
  getSync(key: string, fallback: string): Object {
    if (key === SCENE_STORE_KEY && this.failSceneRead) { throw new Error('controlled scene read failure'); }
    return this.cache.get(key) ?? fallback;
  }
  putSync(key: string, value: string): void {
    this.putCalls++; this.writtenKeys.push(key); this.cache.set(key, value);
    if (this.failPutCalls.indexOf(this.putCalls) >= 0) { throw new Error('controlled put failure after cache mutation'); }
  }
  deleteSync(key: string): void {
    this.deleteCalls++; this.writtenKeys.push(key);
    if (this.failDeleteCalls.indexOf(this.deleteCalls) >= 0) { throw new Error('controlled delete failure'); }
    this.cache.delete(key);
  }
  flushSync(): void {
    this.flushCalls++; const observe = this.onFlush;
    if (observe !== undefined) { observe(); }
    if (this.failFlushCalls.indexOf(this.flushCalls) >= 0) { throw new Error('controlled flush failure'); }
    this.disk = new Map<string, Object>(this.cache);
  }
  stored(key: string = SCENE_STORE_KEY): Object { return this.disk.get(key) ?? ''; }
}

export class BackupFixture implements LearningDependencies {
  readonly clock: ManualLearningClock = new ManualLearningClock();
  readonly native: FakeContinueNative = new FakeContinueNative();
  readonly environment: FakeLearningEnvironment = new FakeLearningEnvironment();
  readonly store: BackupStore;
  readonly controller: LearningController;
  constructor(raw: Object | undefined = undefined, clipboard?: SceneBackupClipboard) {
    this.store = new BackupStore(raw); this.controller = new LearningController(undefined, this, clipboard);
  }
  openStore(): LearningStore { return this.store; }
  release(): void { this.controller.dispose(); this.clock.clearAll(); }
}

/** User data fixture, built only from the production document factories and staging function. */
export function backupRoot(body: string = '备份笔记正文', revision: number = 3): SceneWorkspace {
  let root = stageScene(emptyWorkspace(), waveNote('backup-note', revision, body), 'note');
  root = stageScene(root, waveReading('backup-reading', 2, 1, 2), 'reading');
  const state = emptyScene('form');
  state.form.name = '备份用户'; state.form.phone = '13800138000'; state.form.address = '备份地址';
  state.form.note = '备份备注'; state.form.agreed = true; state.form.step = 1; state.form.savedStep = 1;
  const form: SceneDocument = { transferId: 'local', documentId: 'backup-form', revision: 4, state: state };
  return stageScene(root, form, 'note');
}

export function backupRaw(body: string = '备份笔记正文', revision: number = 3): string { return encodeWorkspace(backupRoot(body, revision)); }

export function reopenedBackup(store: BackupStore): SceneWorkbench { return new SceneWorkbench(new BackupStore(store.stored())); }

export class BackupClipboardReply {
  readonly promise: Promise<void>;
  private resolve: (() => void) | undefined = undefined;
  private reject: ((error: Error) => void) | undefined = undefined;
  constructor() {
    this.promise = new Promise<void>((resolve, reject) => {
      this.resolve = resolve; this.reject = (error: Error): void => { reject(error); };
    });
  }
  succeed(): void { const resolve = this.resolve; if (resolve !== undefined) { resolve(); } }
  fail(message: string = 'controlled private body'): void {
    const reject = this.reject; if (reject !== undefined) { reject(new Error(message)); }
  }
}

export class BackupClipboardPort implements SceneBackupClipboardPort {
  writes: string[] = [];
  replies: BackupClipboardReply[] = [];
  throwBeforePromise: boolean = false;
  writeLocalText(text: string): Promise<void> {
    this.writes.push(text);
    if (this.throwBeforePromise) { throw new Error('private clipboard platform message'); }
    const reply = new BackupClipboardReply(); this.replies.push(reply); return reply.promise;
  }
}
