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

/** Pure payload decoding helpers shared by the learning runtime. No controller state lives here. */
import { Want } from '@kit.AbilityKit';
import { localize } from '../../common/LocaleStrings';
import { LearningStore } from './LearningPorts';
import { MAX_TEXT_LENGTH, TEXT_PAYLOAD_KEY } from './LearningTypes';
import { decodeScene, SCENE_PAYLOAD_KEY, SceneDocument } from './scene/SceneModel';
import { SceneStorePort } from './scene/SceneWorkbench';

export const MAX_JSON_LENGTH: number = 26000;
export const MAX_REVISION: number = 1000000000;

export interface CommitPlan {
  payload: TextPayload;
  documentId: string;
  revision: number;
}

export interface TextPayload {
  version: number;
  transferId: string;
  page: string;
  text: string;
  selectionStart: number;
  selectionEnd: number;
  documentId: string;
  revision: number;
  scene?: SceneDocument;
}

export interface PayloadRead {
  value: TextPayload | undefined;
  reason: string;
}

/** Concrete adapter avoids ArkTS structural class typing and retains existing injected store fixtures. */
export class SceneLearningStoreAdapter implements SceneStorePort {
  private readonly store: LearningStore | undefined;
  constructor(store: LearningStore | undefined) { this.store = store; }
  getSync(key: string, fallback: string): Object {
    if (this.store === undefined) { throw new Error('Store unavailable'); }
    return this.store.getSync(key, fallback);
  }
  putSync(key: string, value: string): void {
    if (this.store === undefined) { throw new Error('Store unavailable'); }
    this.store.putSync(key, value);
  }
  deleteSync(key: string): void {
    if (this.store === undefined) { throw new Error('Store unavailable'); }
    this.store.deleteSync(key);
  }
  flushSync(): void {
    if (this.store === undefined) { throw new Error('Store unavailable'); }
    this.store.flushSync();
  }
}

export function validUnicode(text: string): boolean {
  for (let i: number = 0; i < text.length; i++) {
    const code: number = text.charCodeAt(i);
    if (code >= 0xD800 && code <= 0xDBFF) {
      if (i + 1 >= text.length) {
        return false;
      }
      const next: number = text.charCodeAt(++i);
      if (next < 0xDC00 || next > 0xDFFF) {
        return false;
      }
    } else if (code >= 0xDC00 && code <= 0xDFFF) {
      return false;
    }
  }
  return true;
}

export function selectionBoundary(text: string, offset: number): boolean {
  if (!Number.isInteger(offset) || offset < 0 || offset > text.length) {
    return false;
  }
  if (offset > 0 && offset < text.length) {
    const code: number = text.charCodeAt(offset);
    const previous: number = text.charCodeAt(offset - 1);
    if (code >= 0xDC00 && code <= 0xDFFF && previous >= 0xD800 && previous <= 0xDBFF) {
      return false;
    }
  }
  return true;
}

export function decodePayload(raw: Object | undefined): PayloadRead {
  const rejected: PayloadRead = { value: undefined, reason: localize('ac_learningcontroller_001') };
  if (typeof raw !== 'string') {
    return rejected;
  }
  const serialized: string = raw as string;
  if (serialized.length === 0 || serialized.length > MAX_JSON_LENGTH) {
    rejected.reason = localize('ac_learningcontroller_002');
    return rejected;
  }
  let parsed: Object | null = null;
  try {
    parsed = JSON.parse(serialized) as Object;
  } catch (error) {
    rejected.reason = localize('ac_learningcontroller_003');
    return rejected;
  }
  if (parsed === null || typeof parsed !== 'object' || Array.isArray(parsed)) {
    rejected.reason = localize('ac_learningcontroller_004');
    return rejected;
  }
  const bag = parsed as Record<string, Object>;
  const version = bag['version'];
  const tag = bag['transferId'];
  const page = bag['page'];
  const text = bag['text'];
  const start = bag['selectionStart'];
  const end = bag['selectionEnd'];
  if ((version !== 1 && version !== 2) || page !== 'text' || typeof tag !== 'string' ||
    !/^[A-Za-z0-9_-]{1,96}$/.test(tag as string)) {
    rejected.reason = localize('ac_learningcontroller_005');
    return rejected;
  }
  if (typeof text !== 'string' || (text as string).length > MAX_TEXT_LENGTH || !validUnicode(text as string)) {
    rejected.reason = localize('ac_learningcontroller_006');
    return rejected;
  }
  if (typeof start !== 'number' || typeof end !== 'number' ||
    !selectionBoundary(text as string, start as number) || !selectionBoundary(text as string, end as number) ||
    (start as number) > (end as number)) {
    rejected.reason = localize('ac_learningcontroller_007');
    return rejected;
  }
  const value: TextPayload = {
    version: version as number,
    transferId: tag as string,
    page: 'text',
    text: text as string,
    selectionStart: start as number,
    selectionEnd: end as number,
    documentId: '',
    revision: 0
  };
  if (version === 2) {
    const documentId = bag['documentId'];
    const revision = bag['revision'];
    if (typeof documentId !== 'string' || !/^[A-Za-z0-9_-]{1,64}$/.test(documentId as string) ||
      typeof revision !== 'number' || !Number.isInteger(revision as number) ||
      (revision as number) < 0 || (revision as number) > MAX_REVISION) {
      rejected.reason = localize('ac_learningcontroller_008');
      return rejected;
    }
    value.documentId = documentId as string;
    value.revision = revision as number;
  }
  const accepted: PayloadRead = { value: value, reason: '' };
  return accepted;
}

export function hasPayload(value: Object | undefined): boolean {
  if (value === undefined) {
    return false;
  }
  return typeof value === 'string' && (value as string).length > 0;
}

export function readContinuation(want: Want): PayloadRead {
  const parameters = want.parameters;
  if (parameters === undefined) { return decodePayload(undefined); }
  if (hasPayload(parameters[SCENE_PAYLOAD_KEY]) && hasPayload(parameters[TEXT_PAYLOAD_KEY])) {
    return { value: undefined, reason: localize('ac_learningcontroller_009') };
  }
  if (!hasPayload(parameters[SCENE_PAYLOAD_KEY])) { return decodePayload(parameters[TEXT_PAYLOAD_KEY]); }
  const read = decodeScene(parameters[SCENE_PAYLOAD_KEY]);
  if (read.value === undefined) { return { value: undefined, reason: read.reason }; }
  const scene = read.value;
  return {
    value: {
      version: 2,
      transferId: scene.transferId,
      page: scene.state.kind,
      text: '',
      selectionStart: 0,
      selectionEnd: 0,
      documentId: scene.documentId,
      revision: scene.revision,
      scene: scene
    },
    reason: ''
  };
}
