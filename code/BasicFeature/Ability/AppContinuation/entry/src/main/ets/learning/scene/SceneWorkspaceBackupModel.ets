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

import { localize } from '../../common/LocaleStrings';
/** Local backup planning over the existing scene workspace JSON. No alternate wire format or storage lives here. */
import {
  REVISION_LIMIT, SCENE_WORKSPACE_LIMIT, SceneDocument, SceneState, SceneWorkspace,
  decodeWorkspace, emptyScene, encodeWorkspace, findScene, sceneLabel, stageScene
} from './SceneModel';

export enum SceneBackupCode {
  READY = 'READY',
  INVALID = 'INVALID',
  BLOCKED = 'BLOCKED',
  FROZEN = 'FROZEN',
  STALE = 'STALE',
  DIRTY_REQUIRED = 'DIRTY_REQUIRED',
  REVISION_LIMIT = 'REVISION_LIMIT',
  RESTORED = 'RESTORED',
  UNCHANGED = 'UNCHANGED',
  WRITE_FAILED = 'WRITE_FAILED'
}

export class SceneBackupIssue {
  public path: string;
  public code: SceneBackupCode;
  public message: string;
  constructor(path: string, code: SceneBackupCode, message: string) {
    this.path = path; this.code = code; this.message = message;
  }
}

export class SceneBackupExport {
  public ok: boolean = false;
  public raw: string = '';
  public epoch: number = -1;
  public chars: number = 0;
  public documentCount: number = 0;
  public historyCount: number = 0;
  public containsDirty: boolean = false;
  public frozen: boolean = false;
  public message: string = '';
}

export class SceneBackupSceneSummary {
  public kind: string = '';
  public selected: boolean = true;
  public identity: string = '';
  public localRevision: number = 0;
  public incomingRevision: number = 0;
  public restoreRevision: number = 0;
  public localHistoryCount: number = 0;
  public incomingHistoryCount: number = 0;
  public restoredHistoryCount: number = 0;
  public willClear: boolean = false;
  public incomingHasDraft: boolean = false;
  public changedFields: string[] = [];
}

/** This public view deliberately excludes document ids, text, names, phone numbers and addresses. */
export class SceneBackupPreview {
  public ok: boolean = false;
  public code: SceneBackupCode = SceneBackupCode.INVALID;
  public token: string = '';
  public epoch: number = -1;
  public changed: boolean = false;
  public requiresDirtyConfirmation: boolean = false;
  public selectedKinds: string[] = [];
  public retainedKinds: string[] = [];
  public dirtyKinds: string[] = [];
  public preservedDirtyKinds: string[] = [];
  public willClearKinds: string[] = [];
  public active: string = 'note';
  public scenes: SceneBackupSceneSummary[] = [];
  public issues: SceneBackupIssue[] = [];
  public message: string = localize('ac_sceneworkspacebackupmodel_001');
}

export class SceneBackupRestoreResult {
  public ok: boolean;
  public changed: boolean;
  public code: SceneBackupCode;
  public message: string;
  constructor(code: SceneBackupCode, message: string, changed: boolean = false) {
    this.code = code; this.message = message; this.changed = changed;
    this.ok = code === SceneBackupCode.RESTORED || code === SceneBackupCode.UNCHANGED;
  }
}

export class SceneBackupRead {
  public workspace: SceneWorkspace | undefined = undefined;
  public issue: SceneBackupIssue | undefined = undefined;
}

/** Internal plan is held by the workbench; callers receive only a copied SceneBackupPreview. */
export class SceneBackupPlan {
  public workspace: SceneWorkspace | undefined = undefined;
  public memory: SceneWorkspace | undefined = undefined;
  public preview: SceneBackupPreview = new SceneBackupPreview();
}

export class SceneBackupScope {
  public ok: boolean = false;
  public kinds: string[] = [];
  public message: string = '';
}

/** Scope lists the scenes selected in the local UI; it is not a workspace wire-protocol field. */
export function normalizeSceneBackupScope(scope?: string[]): SceneBackupScope {
  const result = new SceneBackupScope(); const kinds: string[] = ['note', 'reading', 'form'];
  if (scope === undefined) { result.ok = true; result.kinds = kinds; return result; }
  if (!Array.isArray(scope) || scope.some((kind: string): boolean => kinds.indexOf(kind) < 0)) {
    result.message = localize('ac_sceneworkspacebackupmodel_002'); return result;
  }
  if (scope.length === 0) { result.message = localize('ac_sceneworkspacebackup_005'); return result; }
  result.ok = true; result.kinds = kinds.filter((kind: string): boolean => scope.indexOf(kind) >= 0);
  return result;
}

export type SceneBackupIdentityFactory = (kind: string) => string;

interface ComparableDocument {
  kind: string;
  documentId: string;
  revision: number;
  state: SceneState;
}

interface ComparableWorkspace {
  active: string;
  documents: string[];
  history: string[];
}

export function readSceneBackup(raw: Object | undefined): SceneBackupRead {
  const result = new SceneBackupRead();
  if (typeof raw !== 'string' || raw.length === 0) {
    result.issue = new SceneBackupIssue('workspace', SceneBackupCode.INVALID, localize('ac_sceneworkspacebackupmodel_004'));
    return result;
  }
  if (raw.length > SCENE_WORKSPACE_LIMIT) {
    result.issue = new SceneBackupIssue('workspace', SceneBackupCode.INVALID, localize('ac_sceneworkspacebackupmodel_005'));
    return result;
  }
  // The production decoder is authoritative for fields, identities, histories and bundled book version.
  const workspace = decodeWorkspace(raw);
  if (workspace === undefined) {
    result.issue = new SceneBackupIssue('workspace', SceneBackupCode.INVALID, localize('ac_sceneworkspacebackupmodel_006'));
    return result;
  }
  result.workspace = workspace;
  return result;
}

export function noteHasBackupDraft(state: SceneState): boolean {
  const note = state.note;
  return note.body !== note.savedBody || note.title !== note.savedTitle ||
    note.selectionStart !== note.savedSelectionStart || note.selectionEnd !== note.savedSelectionEnd;
}

function comparableDocument(document: SceneDocument): string {
  const value: ComparableDocument = { kind: document.state.kind, documentId: document.documentId,
    revision: document.revision, state: document.state };
  return JSON.stringify(value);
}

/** Transfer tags describe SDK deliveries, not a local backup identity. Head array order is not business data. */
export function sameBackupWorkspace(left: SceneWorkspace, right: SceneWorkspace): boolean {
  const a: ComparableWorkspace = { active: left.active,
    documents: left.documents.slice().sort((first: SceneDocument, second: SceneDocument): number =>
      first.state.kind.localeCompare(second.state.kind))
      .map((document: SceneDocument): string => comparableDocument(document)),
    history: left.history.map((document: SceneDocument): string => comparableDocument(document)) };
  const b: ComparableWorkspace = { active: right.active,
    documents: right.documents.slice().sort((first: SceneDocument, second: SceneDocument): number =>
      first.state.kind.localeCompare(second.state.kind))
      .map((document: SceneDocument): string => comparableDocument(document)),
    history: right.history.map((document: SceneDocument): string => comparableDocument(document)) };
  return JSON.stringify(a) === JSON.stringify(b);
}

export function sceneBackupChangedFields(local: SceneState, incoming: SceneState): string[] {
  const fields: string[] = [];
  if (incoming.kind === 'note') {
    if (local.note.title !== incoming.note.title) { fields.push(localize('ac_index_115')); }
    if (local.note.body !== incoming.note.body) { fields.push(localize('ac_index_119')); }
    if (local.note.selectionStart !== incoming.note.selectionStart ||
      local.note.selectionEnd !== incoming.note.selectionEnd) {
      fields.push(localize('ac_sceneworkspacebackupmodel_009'));
    }
    if (local.note.savedBody !== incoming.note.savedBody || local.note.savedTitle !== incoming.note.savedTitle ||
      local.note.savedSelectionStart !== incoming.note.savedSelectionStart ||
      local.note.savedSelectionEnd !== incoming.note.savedSelectionEnd) {
      fields.push(localize('ac_sceneworkspacebackupmodel_010'));
    }
  } else if (incoming.kind === 'reading') {
    if (local.reading.chapter !== incoming.reading.chapter || local.reading.anchor !== incoming.reading.anchor) {
      fields.push(localize('ac_sceneworkspacebackupmodel_011'));
    }
    if (JSON.stringify(local.reading.bookmarks) !== JSON.stringify(incoming.reading.bookmarks)) { fields.push(localize('ac_sceneworkspacebackupmodel_012')); }
  } else if (incoming.kind === 'form') {
    if (local.form.name !== incoming.form.name) { fields.push(localize('ac_formscenepage_004')); }
    if (local.form.phone !== incoming.form.phone) { fields.push(localize('ac_formscenepage_005')); }
    if (local.form.address !== incoming.form.address) { fields.push(localize('ac_formscenepage_006')); }
    if (local.form.note !== incoming.form.note) { fields.push(localize('ac_index_112')); }
    if (local.form.step !== incoming.form.step || local.form.savedStep !== incoming.form.savedStep) {
      fields.push(localize('ac_sceneworkspacebackupmodel_017'));
    }
    if (local.form.agreed !== incoming.form.agreed || local.form.confirmed !== incoming.form.confirmed) {
      fields.push(localize('ac_sceneworkspacebackupmodel_018'));
    }
  }
  return fields;
}

function historyCount(workspace: SceneWorkspace, kind: string): number {
  return workspace.history.filter((document: SceneDocument): boolean => document.state.kind === kind).length;
}

function sameHead(left: SceneDocument, right: SceneDocument): boolean {
  return left.documentId === right.documentId && left.revision === right.revision &&
    JSON.stringify(left.state) === JSON.stringify(right.state);
}

function replaceBackupKind(target: SceneWorkspace, planned: SceneWorkspace, kind: string): void {
  const document = findScene(planned, kind);
  if (document === undefined) { return; }
  target.documents = target.documents.filter((item: SceneDocument): boolean => item.state.kind !== kind);
  target.documents.push(JSON.parse(JSON.stringify(document)) as SceneDocument);
  const rows = planned.history.filter((item: SceneDocument): boolean => item.state.kind === kind);
  const previous = target.history.filter((item: SceneDocument): boolean => item.state.kind === kind);
  if (JSON.stringify(rows.map((item: SceneDocument): string => comparableDocument(item))) !==
    JSON.stringify(previous.map((item: SceneDocument): string => comparableDocument(item)))) {
    target.history = target.history.filter((item: SceneDocument): boolean => item.state.kind !== kind)
      .concat(rows.map((item: SceneDocument): SceneDocument => JSON.parse(JSON.stringify(item)) as SceneDocument));
  }
}

/** One complete transaction, with durable and volatile roots separated when only some scenes are selected. */
export function planSceneBackup(current: SceneWorkspace, incoming: SceneWorkspace, dirtyKinds: string[],
  identity: SceneBackupIdentityFactory, scope?: string[], durable?: SceneWorkspace): SceneBackupPlan {
  const plan = new SceneBackupPlan();
  let next = JSON.parse(JSON.stringify(incoming)) as SceneWorkspace;
  const preview = plan.preview;
  const selected = normalizeSceneBackupScope(scope);
  if (!selected.ok) {
    preview.message = selected.message;
    preview.issues.push(new SceneBackupIssue('scope', SceneBackupCode.INVALID, selected.message)); return plan;
  }
  const kinds: string[] = ['note', 'reading', 'form'];
  preview.selectedKinds = selected.kinds.slice();
  preview.retainedKinds = kinds.filter((kind: string): boolean => selected.kinds.indexOf(kind) < 0);
  preview.dirtyKinds = dirtyKinds.filter((kind: string): boolean => selected.kinds.indexOf(kind) >= 0);
  preview.preservedDirtyKinds = dirtyKinds.filter((kind: string): boolean => selected.kinds.indexOf(kind) < 0);
  for (const kind of kinds) {
    const local = findScene(current, kind);
    let supplied = findScene(next, kind);
    const summary = new SceneBackupSceneSummary();
    summary.kind = kind; summary.selected = selected.kinds.indexOf(kind) >= 0;
    summary.localRevision = local === undefined ? 0 : local.revision;
    summary.localHistoryCount = historyCount(current, kind);
    summary.incomingHistoryCount = historyCount(incoming, kind);
    if (!summary.selected) {
      summary.identity = localize('ac_sceneworkspacebackupmodel_019'); summary.restoreRevision = summary.localRevision;
      summary.restoredHistoryCount = summary.localHistoryCount; preview.scenes.push(summary); continue;
    }
    if (supplied === undefined) {
      supplied = { transferId: 'local', documentId: identity(kind), revision: 0, state: emptyScene(kind) };
      next.documents.push(supplied);
      summary.identity = localize('ac_sceneworkspacebackupmodel_020');
      summary.willClear = true;
      preview.willClearKinds.push(kind);
    } else {
      summary.incomingRevision = supplied.revision;
      if (local !== undefined && local.documentId === supplied.documentId) {
        summary.identity = localize('ac_sceneworkspacebackupmodel_021');
        if (!sameHead(local, supplied)) {
          const base: number = Math.max(local.revision, supplied.revision);
          if (base >= REVISION_LIMIT) {
            preview.code = SceneBackupCode.REVISION_LIMIT;
            preview.issues.push(new SceneBackupIssue(`documents.${kind}.revision`, SceneBackupCode.REVISION_LIMIT,
              localize('ac_sceneworkspacebackupmodel_022')));
          } else {
            const restored = JSON.parse(JSON.stringify(supplied)) as SceneDocument;
            restored.revision = base + 1; restored.transferId = 'local';
            next = stageScene(next, restored, next.active);
            supplied = restored;
          }
        }
      } else {
        summary.identity = localize('ac_sceneworkspacebackupmodel_023');
        supplied.transferId = 'local';
      }
    }
    summary.restoreRevision = supplied.revision;
    summary.restoredHistoryCount = historyCount(next, kind);
    summary.incomingHasDraft = kind === 'note' && noteHasBackupDraft(supplied.state);
    summary.changedFields = sceneBackupChangedFields(
      local === undefined ? emptyScene(kind) : local.state, supplied.state);
    preview.scenes.push(summary);
  }
  if (preview.issues.length > 0) {
    preview.message = localize('ac_sceneworkspacebackupmodel_024');
    return plan;
  }
  let memory: SceneWorkspace;
  let stored: SceneWorkspace;
  if (selected.kinds.length === kinds.length) {
    // Preserve the existing full-root semantics, including access to an imported dirty note.
    const note = findScene(next, 'note');
    if (note !== undefined && noteHasBackupDraft(note.state)) {
      next.active = 'note';
    } else if (next.active === 'text') {
      next.active = 'note';
    }
    memory = next; stored = JSON.parse(JSON.stringify(next)) as SceneWorkspace;
  } else {
    // Unselected current edits must never leak into this write. Keep their durable and memory heads separate.
    memory = JSON.parse(JSON.stringify(current)) as SceneWorkspace;
    stored = JSON.parse(JSON.stringify(durable === undefined ? current : durable)) as SceneWorkspace;
    selected.kinds.forEach((kind: string): void => {
      replaceBackupKind(memory, next, kind); replaceBackupKind(stored, next, kind);
    });
    // Active context is local for a partial operation; imported active does not steal an unselected page.
    memory.active = current.active;
  }
  if (decodeWorkspace(encodeWorkspace(stored)) === undefined ||
    decodeWorkspace(encodeWorkspace(memory)) === undefined) {
    preview.issues.push(new SceneBackupIssue('workspace', SceneBackupCode.INVALID, localize('ac_sceneworkspacebackupmodel_025')));
    preview.message = localize('ac_sceneworkspacebackupmodel_026');
    return plan;
  }
  preview.active = memory.active;
  preview.changed = !sameBackupWorkspace(current, memory);
  preview.requiresDirtyConfirmation = preview.changed && preview.dirtyKinds.length > 0;
  preview.ok = true; preview.code = SceneBackupCode.READY;
  preview.message = preview.changed ? (selected.kinds.length === kinds.length ?
    localize('ac_sceneworkspacebackupmodel_027') : localize('ac_sceneworkspacebackupmodel_028')) :
    localize('ac_sceneworkspacebackupmodel_029');
  plan.workspace = stored; plan.memory = memory;
  return plan;
}

/** A human-readable, value-free summary. Raw import/export strings are never interpolated here. */
export function sceneBackupPreviewText(preview: SceneBackupPreview): string {
  if (!preview.ok) {
    return [preview.message]
      .concat(preview.issues.map((issue: SceneBackupIssue): string => `${issue.path}：${issue.message}`)).join('\n');
  }
  const lines: string[] = [preview.message, localize('ac_sceneworkspacebackupmodel_030')];
  lines.push(localize('ac_sceneworkspacebackupmodel_031', [preview.selectedKinds.map((kind: string): string => sceneLabel(kind)).join('、')]));
  if (preview.retainedKinds.length > 0) {
    lines.push(localize('ac_sceneworkspacebackupmodel_032', [preview.retainedKinds.map((kind: string): string => sceneLabel(kind)).join('、')]));
  }
  preview.scenes.forEach((scene: SceneBackupSceneSummary): void => {
    if (!scene.selected) { lines.push(localize('ac_sceneworkspacebackupmodel_033', [sceneLabel(scene.kind)])); return; }
    lines.push(`${sceneLabel(scene.kind)}：${scene.identity}；r${scene.localRevision} → r${scene.restoreRevision}`);
    lines.push(localize('ac_sceneworkspacebackupmodel_034', [scene.changedFields.length > 0 ? scene.changedFields.join('、') : localize('ac_sceneworkspacebackupmodel_035')]) +
      localize('ac_sceneworkspacebackupmodel_036', [scene.localHistoryCount, scene.restoredHistoryCount]));
    if (scene.willClear) { lines.push(localize('ac_sceneworkspacebackupmodel_037')); }
    if (scene.incomingHasDraft) { lines.push(localize('ac_sceneworkspacebackupmodel_038')); }
  });
  if (preview.requiresDirtyConfirmation) {
    lines.push(localize('ac_sceneworkspacebackupmodel_039', [preview.dirtyKinds.map((kind: string): string => sceneLabel(kind)).join('、')]));
  }
  if (preview.preservedDirtyKinds.length > 0) {
    lines.push(localize('ac_sceneworkspacebackupmodel_040') +
      `${preview.preservedDirtyKinds.map((kind: string): string => sceneLabel(kind)).join('、')}。`);
  }
  lines.push(localize('ac_sceneworkspacebackupmodel_041', [sceneLabel(preview.active)]));
  return lines.join('\n');
}
