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
  public message: string = '备份格式或业务状态无效。';
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
    result.message = '恢复范围无效；仅支持笔记、阅读和表单。'; return result;
  }
  if (scope.length === 0) { result.message = '请至少选择一个恢复场景。'; return result; }
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
    result.issue = new SceneBackupIssue('workspace', SceneBackupCode.INVALID, '请粘贴完整的业务工作区备份文本。');
    return result;
  }
  if (raw.length > SCENE_WORKSPACE_LIMIT) {
    result.issue = new SceneBackupIssue('workspace', SceneBackupCode.INVALID, '备份文本超过工作区容量上限；不会截断导入。');
    return result;
  }
  // The production decoder is authoritative for fields, identities, histories and bundled book version.
  const workspace = decodeWorkspace(raw);
  if (workspace === undefined) {
    result.issue = new SceneBackupIssue('workspace', SceneBackupCode.INVALID, '备份格式、业务字段、历史关系或本地书籍版本无效。');
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
    if (local.note.title !== incoming.note.title) { fields.push('标题'); }
    if (local.note.body !== incoming.note.body) { fields.push('正文'); }
    if (local.note.selectionStart !== incoming.note.selectionStart ||
      local.note.selectionEnd !== incoming.note.selectionEnd) {
      fields.push('选区');
    }
    if (local.note.savedBody !== incoming.note.savedBody || local.note.savedTitle !== incoming.note.savedTitle ||
      local.note.savedSelectionStart !== incoming.note.savedSelectionStart ||
      local.note.savedSelectionEnd !== incoming.note.savedSelectionEnd) {
      fields.push('保存基线');
    }
  } else if (incoming.kind === 'reading') {
    if (local.reading.chapter !== incoming.reading.chapter || local.reading.anchor !== incoming.reading.anchor) {
      fields.push('章节与段落');
    }
    if (JSON.stringify(local.reading.bookmarks) !== JSON.stringify(incoming.reading.bookmarks)) { fields.push('书签'); }
  } else if (incoming.kind === 'form') {
    if (local.form.name !== incoming.form.name) { fields.push('姓名'); }
    if (local.form.phone !== incoming.form.phone) { fields.push('手机号'); }
    if (local.form.address !== incoming.form.address) { fields.push('地址'); }
    if (local.form.note !== incoming.form.note) { fields.push('备注'); }
    if (local.form.step !== incoming.form.step || local.form.savedStep !== incoming.form.savedStep) {
      fields.push('步骤');
    }
    if (local.form.agreed !== incoming.form.agreed || local.form.confirmed !== incoming.form.confirmed) {
      fields.push('确认状态');
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
      summary.identity = '未选，保留本机'; summary.restoreRevision = summary.localRevision;
      summary.restoredHistoryCount = summary.localHistoryCount; preview.scenes.push(summary); continue;
    }
    if (supplied === undefined) {
      supplied = { transferId: 'local', documentId: identity(kind), revision: 0, state: emptyScene(kind) };
      next.documents.push(supplied);
      summary.identity = '清空并建立空文档';
      summary.willClear = true;
      preview.willClearKinds.push(kind);
    } else {
      summary.incomingRevision = supplied.revision;
      if (local !== undefined && local.documentId === supplied.documentId) {
        summary.identity = '同一文档';
        if (!sameHead(local, supplied)) {
          const base: number = Math.max(local.revision, supplied.revision);
          if (base >= REVISION_LIMIT) {
            preview.code = SceneBackupCode.REVISION_LIMIT;
            preview.issues.push(new SceneBackupIssue(`documents.${kind}.revision`, SceneBackupCode.REVISION_LIMIT,
              '同一文档恢复需要生成新修订，但修订号已到上限。'));
          } else {
            const restored = JSON.parse(JSON.stringify(supplied)) as SceneDocument;
            restored.revision = base + 1; restored.transferId = 'local';
            next = stageScene(next, restored, next.active);
            supplied = restored;
          }
        }
      } else {
        summary.identity = '替换为备份文档';
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
    preview.message = '恢复将超过同身份文档的修订上限；整个工作区均未写入。';
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
    preview.issues.push(new SceneBackupIssue('workspace', SceneBackupCode.INVALID, '恢复计划超过容量或不符合现有工作区格式。'));
    preview.message = '恢复计划无法通过完整工作区校验；未写入。';
    return plan;
  }
  preview.active = memory.active;
  preview.changed = !sameBackupWorkspace(current, memory);
  preview.requiresDirtyConfirmation = preview.changed && preview.dirtyKinds.length > 0;
  preview.ok = true; preview.code = SceneBackupCode.READY;
  preview.message = preview.changed ? (selected.kinds.length === kinds.length ?
    '备份已校验；请检查差异后确认整份工作区恢复。' : '备份已校验；仅恢复所选场景，未选场景及其草稿保留。') :
    '备份与当前所选业务状态一致，无需重复写入。';
  plan.workspace = stored; plan.memory = memory;
  return plan;
}

/** A human-readable, value-free summary. Raw import/export strings are never interpolated here. */
export function sceneBackupPreviewText(preview: SceneBackupPreview): string {
  if (!preview.ok) {
    return [preview.message]
      .concat(preview.issues.map((issue: SceneBackupIssue): string => `${issue.path}：${issue.message}`)).join('\n');
  }
  const lines: string[] = [preview.message, '范围：只处理所选场景及其历史；不包含原文本学习区。'];
  lines.push(`本次恢复：${preview.selectedKinds.map((kind: string): string => sceneLabel(kind)).join('、')}。`);
  if (preview.retainedKinds.length > 0) {
    lines.push(`未选保留：${preview.retainedKinds.map((kind: string): string => sceneLabel(kind)).join('、')}。`);
  }
  preview.scenes.forEach((scene: SceneBackupSceneSummary): void => {
    if (!scene.selected) { lines.push(`${sceneLabel(scene.kind)}：未选，保留本机身份、保存基线与历史，不导入该场景。`); return; }
    lines.push(`${sceneLabel(scene.kind)}：${scene.identity}；r${scene.localRevision} → r${scene.restoreRevision}`);
    lines.push(`变化项目：${scene.changedFields.length > 0 ? scene.changedFields.join('、') : '业务字段无变化'}；` +
      `历史 ${scene.localHistoryCount} → ${scene.restoredHistoryCount} 条`);
    if (scene.willClear) { lines.push('此场景未在备份中提供，确认后将清空本机对应场景。'); }
    if (scene.incomingHasDraft) { lines.push('笔记保留未保存内容与保存基线，恢复后需继续保存或放弃。'); }
  });
  if (preview.requiresDirtyConfirmation) {
    lines.push(`将替换未保存业务状态：${preview.dirtyKinds.map((kind: string): string => sceneLabel(kind)).join('、')}。`);
  }
  if (preview.preservedDirtyKinds.length > 0) {
    lines.push('未选的未保存草稿仅留在内存，不随本次写盘：' +
      `${preview.preservedDirtyKinds.map((kind: string): string => sceneLabel(kind)).join('、')}。`);
  }
  lines.push(`仅所选场景的历史按备份替换；未选历史保留，当前业务上下文为${sceneLabel(preview.active)}。`);
  return lines.join('\n');
}
