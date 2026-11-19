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

/** Controlled persistence and SDK boundaries only; scene rules remain in production imports. */
import { Want } from '@kit.AbilityKit';
import { LearningController, ScenePositionTarget } from '../../../main/ets/learning/LearningController';
import { LearningDependencies, LearningStore } from '../../../main/ets/learning/LearningPorts';
import { SceneStorePort, SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import {
  SCENE_PAYLOAD_KEY, SCENE_STORE_KEY, SceneDocument, emptyScene
} from '../../../main/ets/learning/scene/SceneModel';
import { FakeContinueNative, FakeLearningEnvironment, ManualLearningClock } from './LearningFixtures';

export class WaveSceneStore implements SceneStorePort, LearningStore {
  private cache: Map<string, string> = new Map<string, string>();
  private disk: Map<string, string> = new Map<string, string>();
  public putCalls: number = 0;
  public flushCalls: number = 0;
  public deleteCalls: number = 0;
  constructor(raw: string = '') {
    if (raw.length > 0) { this.cache.set(SCENE_STORE_KEY, raw); this.disk.set(SCENE_STORE_KEY, raw); }
  }
  public getSync(key: string, fallback: string): Object { return this.cache.get(key) ?? fallback; }
  public putSync(key: string, value: string): void { this.putCalls++; this.cache.set(key, value); }
  public deleteSync(key: string): void { this.deleteCalls++; this.cache.delete(key); }
  public flushSync(): void { this.flushCalls++; this.disk = new Map<string, string>(this.cache); }
  public stored(): string { return this.disk.get(SCENE_STORE_KEY) ?? ''; }
}

export class WaveSceneFixture implements LearningDependencies {
  public readonly clock: ManualLearningClock = new ManualLearningClock();
  public readonly native: FakeContinueNative = new FakeContinueNative();
  public readonly environment: FakeLearningEnvironment = new FakeLearningEnvironment();
  public readonly store: WaveSceneStore;
  public readonly controller: LearningController;
  constructor(raw: string = '') {
    this.store = new WaveSceneStore(raw);
    this.controller = new LearningController(undefined, this);
  }
  public openStore(): LearningStore { return this.store; }
  public release(): void { this.controller.dispose(); this.clock.clearAll(); }
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
