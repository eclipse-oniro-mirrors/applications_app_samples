/** Ability-owned business workspace. No SDK continuation listener or system-result shortcut lives here. */
import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';
import {
  FORM_STEPS, FormDraft, ReadingBookmark, READING_CHAPTERS, REVISION_LIMIT, SCENE_STORE_KEY,
  SceneDocument, SceneState, SceneWorkspace, copyScene, decodeScene, decodeWorkspace, emptyScene,
  emptyWorkspace, encodeScene, encodeWorkspace, findScene, formIssues, selectionBoundary, stageScene,
  stepIssues, validFormStep, validReadingPosition, validUnicode
} from './SceneModel';
import {
  SceneBackupCode, SceneBackupExport, SceneBackupPlan, SceneBackupPreview, SceneBackupRestoreResult,
  normalizeSceneBackupScope, planSceneBackup, readSceneBackup
} from './SceneWorkspaceBackupModel';

export interface SceneStorePort {
  getSync(key: string, defaultValue: string): Object;
  putSync(key: string, value: string): void;
  deleteSync(key: string): void;
  flushSync(): void;
}

export class PreferencesSceneStore implements SceneStorePort {
  private readonly store: preferences.Preferences;
  constructor(context: common.Context, namespace: string = 'continuation_scene_workspace_v1') {
    if (!/^[A-Za-z0-9_-]{1,80}$/.test(namespace)) { throw new Error('Invalid scene Preferences namespace'); }
    this.store = preferences.getPreferencesSync(context, { name: namespace });
  }
  public getSync(key: string, defaultValue: string): Object { return this.store.getSync(key, defaultValue); }
  public putSync(key: string, value: string): void { this.store.putSync(key, value); }
  public deleteSync(key: string): void { this.store.deleteSync(key); }
  public flushSync(): void { this.store.flushSync(); }
}

export class SceneSnapshot {
  public ready: boolean = false;
  public editable: boolean = true;
  public storageFrozen: boolean = false;
  public active: string = 'note';
  public noteTitle: string = '';
  public noteBody: string = '';
  public noteSavedBody: string = '';
  public noteSelectionStart: number = 0;
  public noteSelectionEnd: number = 0;
  public noteDirty: boolean = false;
  public readingChapter: number = 0;
  public readingAnchor: number = 0;
  public readingChapterTitle: string = '';
  public readingParagraph: string = '';
  public readingParagraphCount: number = 0;
  public readingDirty: boolean = false;
  public bookmarks: ReadingBookmark[] = [];
  public formStep: number = 0;
  public formStepLabel: string = '';
  public formName: string = '';
  public formPhone: string = '';
  public formAddress: string = '';
  public formNote: string = '';
  public formAgreed: boolean = false;
  public formConfirmed: boolean = false;
  public formIssues: string[] = [];
  public formStepIssues: string[] = [];
  public formDirty: boolean = false;
  public documentId: string = '';
  public revision: number = 0;
  public historyCount: number = 0;
  public notice: string = '';
  public error: string = '';
  public text(): string {
    return this.active === 'reading' ?
      `阅读 r${this.revision}｜第 ${this.readingChapter + 1} 章 第 ${this.readingAnchor + 1} 段` :
      this.active === 'form' ? `表单 r${this.revision}｜${this.formStepLabel}｜${this.formDirty ? '未保存' : '已保留草稿'}` :
        `笔记 r${this.revision}｜${this.noteDirty ? '有未保存修改' : '已保存'}`;
  }
}

function cloneDocument(value: SceneDocument): SceneDocument {
  return JSON.parse(JSON.stringify(value)) as SceneDocument;
}
function cloneWorkspace(value: SceneWorkspace): SceneWorkspace {
  return JSON.parse(JSON.stringify(value)) as SceneWorkspace;
}

let backupWorkbenchSerial: number = 0;

export class SceneWorkbench {
  private readonly store: SceneStorePort;
  private workspace: SceneWorkspace = emptyWorkspace();
  private durable: SceneWorkspace = emptyWorkspace();
  private durableRaw: string | undefined = undefined;
  private readonly listeners: Set<() => void> = new Set<() => void>();
  private locked: boolean = false;
  private frozen: boolean = false;
  private notice: string = '';
  private error: string = '';
  private serial: number = 0;
  private disposed: boolean = false;
  private readonly backupOwner: number = ++backupWorkbenchSerial;
  private backupEpoch: number = 0;
  private backupBusy: boolean = false;
  private backupResumeAllowed: boolean = false;
  private pendingBackup: SceneBackupPlan | undefined = undefined;

  constructor(store: SceneStorePort) {
    this.store = store;
    try {
      const raw = store.getSync(SCENE_STORE_KEY, '');
      if (typeof raw !== 'string') {
        this.frozen = true;
        this.error = '场景存档类型无效，已冻结写入';
      } else if (raw.length > 0) {
        this.durableRaw = raw;
        const decoded = decodeWorkspace(raw);
        if (decoded === undefined) {
          this.frozen = true;
          this.error = '场景存档损坏，保留原值并冻结写入';
        } else {
          this.workspace = decoded;
          this.durable = cloneWorkspace(decoded);
        }
      }
    } catch (error) { this.frozen = true; this.error = '场景存储读取失败，磁盘状态未知，已冻结写入'; }
    ['note', 'reading', 'form'].forEach((kind: string): void => { this.ensureDocument(kind); });
    if (this.workspace.active === 'text') { this.workspace.active = 'note'; }
  }

  public subscribe(listener: () => void): () => void {
    if (!this.disposed) { this.listeners.add(listener); }
    return (): void => { this.listeners.delete(listener); };
  }
  private publish(): void {
    this.backupEpoch++;
    this.pendingBackup = undefined;
    if (this.backupResumeAllowed && !this.hasDirtyWork()) { this.backupResumeAllowed = false; }
    if (this.disposed) { return; }
    this.listeners.forEach((listener: () => void): void => { try { listener(); } catch (error) {} });
  }
  public setLocked(value: boolean): void { this.locked = value; this.publish(); }
  public dispose(): void {
    this.disposed = true; this.listeners.clear(); this.locked = true;
    this.backupEpoch++; this.pendingBackup = undefined;
  }
  private editable(): boolean { return !this.disposed && !this.locked && !this.backupBusy; }
  private reject(message: string): boolean { this.error = message; this.publish(); return false; }
  private fresh(prefix: string): string {
    return `${prefix}-${Date.now()}-${++this.serial}-${Math.floor(Math.random() * 1000000000)}`;
  }
  private ensureDocument(kind: string): SceneDocument {
    const existing = findScene(this.workspace, kind);
    if (existing !== undefined) { return existing; }
    const value: SceneDocument = {
      transferId: 'local', documentId: this.fresh(`doc-${kind}`), revision: 0, state: emptyScene(kind)
    };
    this.workspace.documents.push(value);
    return value;
  }
  public document(kind: string = ''): SceneDocument {
    return cloneDocument(this.ensureDocument(kind.length > 0 ? kind : this.workspace.active));
  }
  private isDirty(kind: string): boolean {
    const current = this.ensureDocument(kind);
    const saved = findScene(this.durable, kind);
    const note = current.state.note;
    if (kind === 'note') {
      return note.body !== note.savedBody || note.title !== note.savedTitle ||
        note.selectionStart !== note.savedSelectionStart || note.selectionEnd !== note.savedSelectionEnd;
    }
    return saved === undefined ? JSON.stringify(current.state) !== JSON.stringify(emptyScene(kind)) :
      JSON.stringify(current.state) !== JSON.stringify(saved.state);
  }
  public hasDirtyWork(): boolean {
    return ['note', 'reading', 'form'].some((kind: string): boolean => this.isDirty(kind));
  }

  /** Validate the entire staged root before touching the cache; compensate any put/flush failure. */
  private write(next: SceneWorkspace): boolean {
    if (this.frozen || this.disposed) { return this.reject('场景存储已冻结；请重新进入 Ability 检查存档'); }
    const raw = encodeWorkspace(next);
    if (decodeWorkspace(raw) === undefined) { return this.reject('待保存的场景工作区校验失败或容量超限'); }
    try {
      this.store.putSync(SCENE_STORE_KEY, raw);
      this.store.flushSync();
      this.durableRaw = raw;
      this.durable = cloneWorkspace(next);
      this.error = '';
      return true;
    } catch (error) {
      try {
        if (this.durableRaw === undefined) {
          this.store.deleteSync(SCENE_STORE_KEY);
        } else {
          this.store.putSync(SCENE_STORE_KEY, this.durableRaw);
        }
        this.store.flushSync();
        this.error = '场景保存失败，已补偿回原存档；编辑、修订与历史保持原样';
      } catch (rollbackError) {
        this.frozen = true;
        this.error = '场景保存及补偿失败，磁盘状态未知；已冻结后续写入，当前编辑保留';
      }
      return false;
    }
  }

  /** Stage from the durable head, not the edited object, so history contains the real previous version. */
  private persistDocument(document: SceneDocument): boolean {
    const next = stageScene(this.durable, document, document.state.kind);
    if (!this.write(next)) { this.publish(); return false; }
    const retained = this.workspace.documents
      .filter((item: SceneDocument): boolean => item.state.kind !== document.state.kind);
    this.workspace = cloneWorkspace(next);
    retained.forEach((item: SceneDocument): void => {
      this.workspace.documents = this.workspace.documents
        .filter((value: SceneDocument): boolean => value.state.kind !== item.state.kind);
      this.workspace.documents.push(item);
    });
    this.workspace.active = document.state.kind;
    this.notice = `已持久化 ${document.state.kind} r${document.revision}`;
    this.publish();
    return true;
  }
  private save(kind: string, confirmNote: boolean = false, confirmForm: boolean = false): boolean {
    if (!this.editable()) { return false; }
    const next = this.document(kind);
    if (next.revision >= REVISION_LIMIT) { return this.reject('修订号已到上限，请另存为新文档'); }
    if (confirmNote) {
      next.state.note.savedBody = next.state.note.body; next.state.note.savedTitle = next.state.note.title;
      next.state.note.savedSelectionStart = next.state.note.selectionStart;
      next.state.note.savedSelectionEnd = next.state.note.selectionEnd;
    }
    if (kind === 'form') { next.state.form.savedStep = next.state.form.step; next.state.form.confirmed = confirmForm; }
    next.revision += 1;
    next.transferId = 'local';
    return this.persistDocument(next);
  }

  public snapshot(preview?: SceneDocument): SceneSnapshot {
    const document = preview === undefined ? this.document() : cloneDocument(preview);
    const value = new SceneSnapshot();
    value.ready = true; value.editable = this.editable(); value.storageFrozen = this.frozen;
    value.active = document.state.kind; value.documentId = document.documentId; value.revision = document.revision;
    value.historyCount = this.workspace.history.length;
    const note = document.state.note;
    value.noteTitle = note.title; value.noteBody = note.body; value.noteSavedBody = note.savedBody;
    value.noteSelectionStart = note.selectionStart;
    value.noteSelectionEnd = note.selectionEnd;
    value.noteDirty = preview === undefined ? this.isDirty('note') : note.body !== note.savedBody ||
      note.title !== note.savedTitle || note.selectionStart !== note.savedSelectionStart ||
      note.selectionEnd !== note.savedSelectionEnd;
    const reading = document.state.reading;
    value.readingChapter = reading.chapter; value.readingAnchor = reading.anchor; value.bookmarks = reading.bookmarks;
    value.readingChapterTitle = READING_CHAPTERS[reading.chapter].title;
    value.readingParagraph = READING_CHAPTERS[reading.chapter].paragraphs[reading.anchor];
    value.readingParagraphCount = READING_CHAPTERS[reading.chapter].paragraphs.length;
    value.readingDirty = this.isDirty('reading');
    const form = document.state.form;
    value.formStep = form.step; value.formStepLabel = FORM_STEPS[form.step]; value.formName = form.name;
    value.formPhone = form.phone; value.formAddress = form.address; value.formNote = form.note;
    value.formAgreed = form.agreed; value.formConfirmed = form.confirmed;
    value.formIssues = formIssues(form);
    value.formStepIssues = stepIssues(form, form.step);
    value.formDirty = this.isDirty('form');
    value.notice = this.notice; value.error = this.error;
    return value;
  }
  public open(kind: string, preserveBackupDrafts: boolean = false): boolean {
    if (!this.editable()) { return false; }
    if (['note', 'reading', 'form'].indexOf(kind) < 0) { return this.reject('未知场景'); }
    if (kind !== this.workspace.active && this.hasDirtyWork() && !(preserveBackupDrafts && this.backupResumeAllowed)) {
      return this.reject('有未保存修改，请先保存或放弃后切换');
    }
    this.workspace.active = kind; this.error = ''; this.publish(); return true;
  }
  public editNote(title: string, body: string, start: number, end: number): boolean {
    if (!this.editable()) { return false; }
    if (title.length > 80 || body.length > 4096 || !validUnicode(title) || !validUnicode(body) ||
      !selectionBoundary(body, start) || !selectionBoundary(body, end) || start > end) {
      return this.reject('标题、正文或选区无效');
    }
    const note = this.ensureDocument('note').state.note;
    note.title = title; note.body = body; note.selectionStart = start; note.selectionEnd = end;
    this.error = ''; this.publish(); return true;
  }
  public saveNote(): boolean { return this.save('note', true); }
  public discardNote(): void {
    if (!this.editable()) { return; }
    const note = this.ensureDocument('note').state.note;
    note.title = note.savedTitle; note.body = note.savedBody;
    note.selectionStart = note.savedSelectionStart; note.selectionEnd = note.savedSelectionEnd;
    this.error = ''; this.publish();
  }
  public gotoParagraph(chapter: number, anchor: number): boolean {
    if (!this.editable()) { return false; }
    if (!validReadingPosition(chapter, anchor)) { return this.reject('章节或段落不存在'); }
    const reading = this.ensureDocument('reading').state.reading;
    reading.chapter = chapter; reading.anchor = anchor; this.error = ''; this.publish(); return true;
  }
  public nextParagraph(): boolean {
    const reading = this.document('reading').state.reading;
    return this.gotoParagraph(reading.chapter, reading.anchor + 1);
  }
  public previousParagraph(): boolean {
    const reading = this.document('reading').state.reading;
    return this.gotoParagraph(reading.chapter, reading.anchor - 1);
  }
  public addBookmark(): boolean {
    if (!this.editable()) { return false; }
    const reading = this.ensureDocument('reading').state.reading;
    if (reading.bookmarks.length >= 20 || reading.bookmarks.some((item: ReadingBookmark): boolean =>
      item.chapter === reading.chapter && item.anchor === reading.anchor)) { return this.reject('书签重复或已达上限'); }
    reading.bookmarks.push({ chapter: reading.chapter, anchor: reading.anchor });
    this.error = ''; this.publish(); return true;
  }
  public removeBookmark(index: number): boolean {
    if (!this.editable()) { return false; }
    const bookmarks = this.ensureDocument('reading').state.reading.bookmarks;
    if (!Number.isInteger(index) || index < 0 || index >= bookmarks.length) { return this.reject('书签不存在'); }
    bookmarks.splice(index, 1); this.error = ''; this.publish(); return true;
  }
  public saveReading(): boolean { return this.save('reading'); }
  public setFormField(field: string, value: string): boolean {
    if (!this.editable()) { return false; }
    const limits: Map<string, number> = new Map<string, number>();
    limits.set('name', 40);
    limits.set('phone', 20);
    limits.set('address', 100);
    limits.set('note', 200);
    const limit: number | undefined = limits.get(field);
    if (limit === undefined || value.length > limit || !validUnicode(value)) { return this.reject('字段名、长度或Unicode无效'); }
    const form = this.ensureDocument('form').state.form;
    if (field === 'name') {
      form.name = value;
    } else if (field === 'phone') {
      form.phone = value;
    } else if (field === 'address') {
      form.address = value;
    } else {
      form.note = value;
    }
    form.confirmed = false; this.error = ''; this.publish(); return true;
  }
  public gotoFormStep(step: number): boolean {
    if (!this.editable()) { return false; }
    if (!validFormStep(step)) { return this.reject('步骤不存在'); }
    const form = this.ensureDocument('form').state.form;
    for (let previous: number = 0; previous < step; previous++) {
      const issues = stepIssues(form, previous);
      if (issues.length > 0) { return this.reject(issues.join('；')); }
    }
    form.step = step; this.error = ''; this.publish(); return true;
  }
  public nextFormStep(): boolean { return this.gotoFormStep(this.document('form').state.form.step + 1); }
  public previousFormStep(): boolean { return this.gotoFormStep(this.document('form').state.form.step - 1); }
  public setFormAgreed(value: boolean): boolean {
    if (!this.editable()) { return false; }
    const form = this.ensureDocument('form').state.form; form.agreed = value; form.confirmed = false;
    this.error = ''; this.publish(); return true;
  }
  /** Draft schema permits partial values; completion is a separate whole-form validation. */
  public saveForm(): boolean { return this.save('form'); }
  public confirmForm(): boolean {
    if (formIssues(this.document('form').state.form).length > 0) { return this.reject('整表校验尚未通过，不能确认完成'); }
    return this.save('form', false, true);
  }
  public payloadOf(kind: string = ''): string {
    const document = this.document(kind);
    document.transferId = this.fresh('transfer');
    const raw = encodeScene(document);
    if (decodeScene(raw).value === undefined) { throw new Error('Scene payload rejected by production schema'); }
    return raw;
  }
  public conflictReason(incoming: SceneDocument): string {
    const local = this.document(incoming.state.kind);
    if (this.hasDirtyWork()) { return '本机有未保存业务状态；请选择接续版本或保留本机。'; }
    if (local.documentId === incoming.documentId && incoming.revision <= local.revision &&
      JSON.stringify(local.state) !== JSON.stringify(incoming.state)) { return '同文档旧修订或同号不同状态，需明确选择。'; }
    return '';
  }
  /** Called only by LearningController after its candidate/quick/window/business-position gates. */
  public commitIncoming(incoming: SceneDocument, accepted: boolean): boolean {
    if (this.disposed || this.backupBusy) { return false; }
    const next = cloneDocument(incoming);
    const local = this.document(incoming.state.kind);
    if (accepted) {
      const base = local.documentId === next.documentId ? Math.max(local.revision, next.revision) : next.revision;
      if (base >= REVISION_LIMIT) { return this.reject('接受冲突将超过修订上限；未写入'); }
      next.revision = base + 1;
    }
    return this.persistDocument(next);
  }
  public historyLines(kind: string = ''): string[] {
    return this.historyDocuments(kind)
      .map((item: SceneDocument): string => `${item.state.kind} r${item.revision}｜${item.documentId}`);
  }
  public historyDocuments(kind: string = ''): SceneDocument[] {
    return this.workspace.history
      .filter((item: SceneDocument): boolean => kind.length === 0 || item.state.kind === kind)
      .map((item: SceneDocument): SceneDocument => cloneDocument(item));
  }
  public restoreHistory(index: number, kind: string = ''): boolean {
    if (!this.editable()) { return false; }
    const history = this.historyDocuments(kind);
    if (!Number.isInteger(index) || index < 0 || index >= history.length) { return this.reject('历史不存在'); }
    const next = history[index];
    const current = this.document(next.state.kind);
    if (current.documentId !== next.documentId || current.revision >= REVISION_LIMIT) {
      return this.reject('历史身份不匹配或修订已达上限');
    }
    next.revision = current.revision + 1; next.transferId = 'local'; return this.persistDocument(next);
  }
  /** Export a coherent copy of current editing state; never save or normalize a user's draft. */
  public backupSnapshot(): SceneBackupExport {
    const exported = new SceneBackupExport();
    if (!this.editable()) { exported.message = '当前业务正在恢复或已释放，暂不能生成备份。'; return exported; }
    try {
      const raw = encodeWorkspace(cloneWorkspace(this.workspace));
      if (readSceneBackup(raw).workspace === undefined) {
        exported.message = '当前内存工作区无法通过正式格式校验，未生成不完整备份。';
        return exported;
      }
      exported.ok = true; exported.raw = raw; exported.chars = raw.length; exported.epoch = this.backupEpoch;
      exported.documentCount = this.workspace.documents.length; exported.historyCount = this.workspace.history.length;
      exported.containsDirty = this.hasDirtyWork(); exported.frozen = this.frozen;
      exported.message = this.frozen ? '已生成当前内存救援副本；原存档仍冻结，未修复或覆盖磁盘。' :
        '已生成当前业务备份，包含未保存内容与历史；原文本学习区不在备份范围。';
    } catch (error) { exported.message = '无法生成完整业务备份；当前编辑未改变。'; }
    return exported;
  }

  public isBackupCurrent(epoch: number): boolean { return this.editable() && epoch === this.backupEpoch; }
  public canResumeBackupDrafts(): boolean { return this.editable() && this.backupResumeAllowed; }
  public cancelBackupPreview(): void { this.pendingBackup = undefined; }

  /** Pure preview: any previous token is invalidated, including when the new input is invalid. */
  public previewBackup(raw: string, scope?: string[]): SceneBackupPreview {
    this.pendingBackup = undefined;
    const rejected = new SceneBackupPreview();
    if (!this.editable()) {
      rejected.code = SceneBackupCode.BLOCKED; rejected.message = '当前业务正在恢复或已释放，暂不能预览恢复。';
      return rejected;
    }
    if (this.frozen) {
      rejected.code = SceneBackupCode.FROZEN; rejected.message = '场景存储已冻结；可导出内存救援副本，不能导入写入。';
      return rejected;
    }
    const read = readSceneBackup(raw);
    if (read.workspace === undefined) {
      if (read.issue !== undefined) { rejected.issues.push(read.issue); }
      return rejected;
    }
    const dirty = ['note', 'reading', 'form'].filter((kind: string): boolean => this.isDirty(kind));
    const plan = planSceneBackup(cloneWorkspace(this.workspace), read.workspace, dirty,
      (kind: string): string => this.fresh(`doc-backup-${kind}`), scope, cloneWorkspace(this.durable));
    if (!plan.preview.ok) { return JSON.parse(JSON.stringify(plan.preview)) as SceneBackupPreview; }
    plan.preview.epoch = this.backupEpoch;
    plan.preview.token = `backup-preview-${this.backupOwner}-${++this.serial}-${this.backupEpoch}`;
    this.pendingBackup = plan;
    // The root to commit stays private; the page cannot mutate it through its returned preview.
    return JSON.parse(JSON.stringify(plan.preview)) as SceneBackupPreview;
  }

  /** A single compensated scene-root transaction. The legacy text Preferences is not touched. */
  public restoreBackup(token: string, confirmDirty: boolean, scope?: string[]): SceneBackupRestoreResult {
    if (!this.editable()) { return new SceneBackupRestoreResult(SceneBackupCode.BLOCKED, '当前业务正在恢复或已释放，不能执行本地恢复。'); }
    if (this.frozen) { return new SceneBackupRestoreResult(SceneBackupCode.FROZEN, '场景存储已冻结；当前编辑保留，未继续写入。'); }
    const selected = normalizeSceneBackupScope(scope);
    if (!selected.ok) {
      this.pendingBackup = undefined;
      return new SceneBackupRestoreResult(SceneBackupCode.INVALID, selected.message);
    }
    const plan = this.pendingBackup;
    if (plan === undefined || plan.workspace === undefined || plan.memory === undefined ||
      plan.preview.token !== token || plan.preview.epoch !== this.backupEpoch) {
      return new SceneBackupRestoreResult(SceneBackupCode.STALE, '恢复预览已过期，请重新校验并预览。');
    }
    if (selected.kinds.join(',') !== plan.preview.selectedKinds.join(',')) {
      this.pendingBackup = undefined;
      return new SceneBackupRestoreResult(SceneBackupCode.STALE, '恢复范围已变化，请按新范围重新预览。');
    }
    if (plan.preview.requiresDirtyConfirmation && !confirmDirty) {
      return new SceneBackupRestoreResult(SceneBackupCode.DIRTY_REQUIRED, '请明确确认替换未保存业务修改后再恢复。');
    }
    this.pendingBackup = undefined;
    if (!plan.preview.changed) {
      return new SceneBackupRestoreResult(SceneBackupCode.UNCHANGED, '业务工作区未变化，无需重复恢复。');
    }
    this.backupBusy = true;
    const next = cloneWorkspace(plan.workspace);
    let saved: boolean = false;
    try {
      saved = this.write(next);
    } finally {
      this.backupBusy = false;
    }
    if (!saved) {
      this.publish();
      return new SceneBackupRestoreResult(
        this.frozen ? SceneBackupCode.FROZEN : SceneBackupCode.WRITE_FAILED, this.error);
    }
    this.workspace = cloneWorkspace(plan.memory);
    this.backupResumeAllowed = selected.kinds.length < 3 && this.hasDirtyWork();
    this.notice = selected.kinds.length === 3 ? '本地业务工作区已恢复。' : '所选业务场景已恢复；未选场景保留。';
    this.publish();
    return new SceneBackupRestoreResult(SceneBackupCode.RESTORED, this.notice, true);
  }

  public resetWorkspace(): boolean {
    if (!this.editable()) { return false; }
    const next = emptyWorkspace();
    if (!this.write(next)) { this.publish(); return false; }
    this.workspace = cloneWorkspace(next);
    ['note', 'reading', 'form'].forEach((kind: string): void => { this.ensureDocument(kind); });
    this.workspace.active = 'note'; this.publish(); return true;
  }
}
