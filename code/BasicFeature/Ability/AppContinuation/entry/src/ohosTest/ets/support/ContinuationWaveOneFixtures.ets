/** Controlled persistence and SDK boundaries only; scene rules remain in production imports. */
import { Want } from '@kit.AbilityKit';
import { LearningController, ScenePositionTarget } from '../../../main/ets/learning/LearningController';
import { LearningDependencies, LearningStore } from '../../../main/ets/learning/LearningPorts';
import { SceneStorePort, SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import { SCENE_PAYLOAD_KEY, SCENE_STORE_KEY, SceneDocument, emptyScene } from '../../../main/ets/learning/scene/SceneModel';
import { FakeContinueNative, FakeLearningEnvironment, ManualLearningClock } from './LearningFixtures';

export class WaveSceneStore implements SceneStorePort, LearningStore {
  private cache: Map<string, string> = new Map<string, string>();
  private disk: Map<string, string> = new Map<string, string>();
  putCalls: number = 0;
  flushCalls: number = 0;
  deleteCalls: number = 0;
  constructor(raw: string = '') {
    if (raw.length > 0) { this.cache.set(SCENE_STORE_KEY, raw); this.disk.set(SCENE_STORE_KEY, raw); }
  }
  getSync(key: string, fallback: string): Object { return this.cache.get(key) ?? fallback; }
  putSync(key: string, value: string): void { this.putCalls++; this.cache.set(key, value); }
  deleteSync(key: string): void { this.deleteCalls++; this.cache.delete(key); }
  flushSync(): void { this.flushCalls++; this.disk = new Map<string, string>(this.cache); }
  stored(): string { return this.disk.get(SCENE_STORE_KEY) ?? ''; }
}

export class WaveSceneFixture implements LearningDependencies {
  readonly clock: ManualLearningClock = new ManualLearningClock();
  readonly native: FakeContinueNative = new FakeContinueNative();
  readonly environment: FakeLearningEnvironment = new FakeLearningEnvironment();
  readonly store: WaveSceneStore;
  readonly controller: LearningController;
  constructor(raw: string = '') {
    this.store = new WaveSceneStore(raw);
    this.controller = new LearningController(undefined, this);
  }
  openStore(): LearningStore { return this.store; }
  release(): void { this.controller.dispose(); this.clock.clearAll(); }
}

export function waveNote(id: string, revision: number, body: string = '保存正文'): SceneDocument {
  const state = emptyScene('note');
  state.note.title = '保存标题'; state.note.savedTitle = '保存标题';
  state.note.body = body; state.note.savedBody = body;
  state.note.selectionStart = 0; state.note.selectionEnd = body.length;
  state.note.savedSelectionStart = 0; state.note.savedSelectionEnd = body.length;
  return { transferId: 'wave-note', documentId: id, revision: revision, state: state };
}

export function waveReading(id: string, revision: number, chapter: number = 0, anchor: number = 0): SceneDocument {
  const state = emptyScene('reading'); state.reading.chapter = chapter; state.reading.anchor = anchor;
  return { transferId: 'wave-reading', documentId: id, revision: revision, state: state };
}

export function fillWaveForm(work: SceneWorkbench): void {
  work.setFormField('name', '接续用户'); work.setFormField('phone', '13800138000');
  work.setFormField('address', '测试地址一号'); work.setFormField('note', '保留备注');
  work.gotoFormStep(2); work.setFormAgreed(true);
}

export function waveWant(raw: string): Want {
  const parameters: Record<string, Object> = {};
  parameters[SCENE_PAYLOAD_KEY] = raw;
  return { parameters: parameters } as Want;
}

export function waveTarget(fixture: WaveSceneFixture): ScenePositionTarget {
  const target = fixture.controller.positionTarget();
  if (target === undefined) { throw new Error('Expected a pending production scene candidate'); }
  return target;
}
