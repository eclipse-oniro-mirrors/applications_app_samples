import { common } from '@kit.AbilityKit';
import { BusinessStorage, BusinessWriteError, PreferencesBusinessStorage } from './BusinessStorage';
import { DiffResult, diffLines } from './TextDiff';
import { RecycleBatchAction, RecycleBatchPreview, RecycleBatchResult, RecycleBatchRow,
  copyRecycleBatchPreview, copyRecycleBatchResult } from './RecycleBatch';
import { MAX_ACTIVE_NOTES, MAX_RECYCLED_NOTES, MAX_WORKSPACE_HISTORY, MAX_WORKSPACE_BYTES,
  TrashCleanupResult, TrashEditDecision, isTrashExpired, validTrashToken, workspaceUtf8Bytes
} from './NoteRecyclePolicy';

export class NoteItem {
  public id: string;
  public title: string;
  public body: string;
  public createdAt: number;
  public revision: string;
  public branchOf: string;

  constructor(id: string = '', title: string = '', body: string = '', createdAt: number = 0,
    revision: string = '', branchOf: string = '') {
    this.id = id;
    this.title = title;
    this.body = body;
    this.createdAt = createdAt;
    this.revision = revision;
    this.branchOf = branchOf;
  }
}

export class RecycledNote {
  public trashId: string = '';
  public note: NoteItem = new NoteItem();
  public deletedAt: number = 0;
  public history: NoteRevision[] = [];
}

export class NoteConflict {
  public noteId: string = '';
  public expectedRevision: string = '';
  public currentRevision: string = '';
  public targetAvailable: boolean = false;
  public currentTitle: string = '';
  public currentBody: string = '';
  public baseTitle: string = '';
  public baseBody: string = '';
  public draftTitle: string = '';
  public draftBody: string = '';
  public currentToDraft: DiffResult = new DiffResult();
  public baseToCurrent: DiffResult = new DiffResult();
}

export class TodoItem {
  public id: string;
  public title: string;
  public done: boolean;

  constructor(id: string = '', title: string = '', done: boolean = false) {
    this.id = id;
    this.title = title;
    this.done = done;
  }
}

export class NoteRevision {
  public revisionId: string;
  public noteId: string;
  public title: string;
  public body: string;
  public savedAt: number;
  public action: string;

  constructor(revisionId: string = '', noteId: string = '', title: string = '', body: string = '',
    savedAt: number = 0, action: string = 'edit') {
    this.revisionId = revisionId;
    this.noteId = noteId;
    this.title = title;
    this.body = body;
    this.savedAt = savedAt;
    this.action = action;
  }
}

export class TodoDay {
  public date: string;
  public items: TodoItem[];

  constructor(date: string = '', items: TodoItem[] = []) {
    this.date = date;
    this.items = items;
  }
}

export class StoredData {
  public version: number = 2;
  public notes: NoteItem[] = [];
  public recycleBin: RecycledNote[] = [];
  public recycleSequence: number = 0;
  public draftTitle: string = '';
  public draftBody: string = '';
  public todoDays: TodoDay[] = [];
  public noteHistory: NoteRevision[] = [];
  public favorites: string[] = [];
  /** 正在编辑的既有便签与编辑缓冲：可选字段，旧存档缺失时按“没有编辑草稿”处理。 */
  public editNoteId: string = '';
  public editBaseRevision: string = '';
  public editBaseTitle: string = '';
  public editBaseBody: string = '';
  public editTitle: string = '';
  public editBody: string = '';
}

class RecycleBatchPlan {
  public preview: RecycleBatchPreview = new RecycleBatchPreview();
  public ids: string[] = [];
  public canonical: string = '';
}

export class CollectionItem {
  public id: string;
  public title: string;
  public category: string;
  public content: string;

  constructor(id: string = '', title: string = '', category: string = '', content: string = '') {
    this.id = id;
    this.title = title;
    this.category = category;
    this.content = content;
  }
}

const COLLECTIONS: CollectionItem[] = [
  new CollectionItem('planning', '每日计划清单', '效率',
    '1. 写下今天最重要的一件事。\n2. 为任务留出完整时间。\n3. 完成后勾选今日待办。\n4. 下班前整理明日计划。'),
  new CollectionItem('meeting', '会议记录模板', '工作',
    '会议主题：\n会议时间：\n参会人员：\n\n讨论事项：\n\n已定结论：\n\n后续行动：负责人 / 截止日期'),
  new CollectionItem('reading', '阅读摘录模板', '阅读',
    '书名 / 文章：\n作者：\n阅读日期：\n\n重点摘录：\n\n我的想法：\n\n下一步行动：')
];

export class TodoDateSummary {
  public date: string;
  public total: number;
  public done: number;

  constructor(date: string = '', total: number = 0, done: number = 0) {
    this.date = date;
    this.total = total;
    this.done = done;
  }
}

export class BusinessSnapshot {
  public ready: boolean = false;
  public loading: boolean = false;
  public busy: boolean = false;
  public message: string = '';
  public error: string = '';
  public draftTitle: string = '';
  public draftBody: string = '';
  public draftDirty: boolean = false;
  public draftKept: boolean = false;
  public editingNoteId: string = '';
  public editBaseRevision: string = '';
  public editDraftPersisted: boolean = false;
  public noteConflict: NoteConflict | undefined = undefined;
  public recycledNotes: RecycledNote[] = [];
  public expiredTrashCount: number = 0;
  public observedAt: number = 0;
  public workspaceBytes: number = 0;
  public recycleBatchPreview: RecycleBatchPreview | undefined = undefined;
  public lastRecycleBatchResult: RecycleBatchResult = new RecycleBatchResult();
  public storageRecoveryRequired: boolean = false;
  public noteQuery: string = '';
  public notes: NoteItem[] = [];
  public visibleNotes: NoteItem[] = [];
  public todoDate: string = '';
  public todoFilter: string = '全部';
  public todoFollowToday: boolean = true;
  public availableDates: string[] = [];
  public dateSummaries: TodoDateSummary[] = [];
  public todos: TodoItem[] = [];
  public visibleTodos: TodoItem[] = [];
  public collectionQuery: string = '';
  public collectionCategory: string = '全部';
  public favoritesOnly: boolean = false;
  public favoriteIds: string[] = [];
  public collections: CollectionItem[] = [];
  public visibleCollections: CollectionItem[] = [];
}

/** UI selection/editor checkpoint: route errors restore transient context, never undo a successful save. */
export class BusinessEntryContext {
  public todoDate: string = '';
  public todoFilter: string = '全部';
  public favoritesOnly: boolean = false;
  public collectionQuery: string = '';
  public collectionCategory: string = '全部';
  public editingNoteId: string = '';
  public draftTitle: string = '';
  public draftBody: string = '';
  public dirty: boolean = false;
  public editBaseRevision: string = '';
  public editBaseTitle: string = '';
  public editBaseBody: string = '';
  public todoFollowToday: boolean = true;
}

export function localDateKey(time: number = Date.now()): string {
  const date: Date = new Date(time);
  return `${date.getFullYear()}-${two(date.getMonth() + 1)}-${two(date.getDate())}`;
}

function two(value: number): string {
  return value.toString().padStart(2, '0');
}

/** 严格校验 YYYY-MM-DD，并拒绝 2026-02-30 这类被 Date 归一化的日期。 */
export function validDateKey(value: string): boolean {
  if (!/^\d{4}-\d{2}-\d{2}$/.test(value)) {
    return false;
  }
  const parsed: number = Date.parse(`${value}T00:00:00`);
  if (!Number.isFinite(parsed)) {
    return false;
  }
  return localDateKey(parsed) === value;
}

function copyNote(value: NoteItem): NoteItem {
  return new NoteItem(value.id, value.title, value.body, value.createdAt,
    value.revision === undefined ? '' : value.revision, value.branchOf === undefined ? '' : value.branchOf);
}

function copyTodo(value: TodoItem): TodoItem {
  return new TodoItem(value.id, value.title, value.done);
}

function copyRecycled(value: RecycledNote): RecycledNote {
  const result: RecycledNote = new RecycledNote();
  result.trashId = value.trashId;
  result.note = copyNote(value.note);
  result.deletedAt = value.deletedAt;
  result.history = value.history.map((revision: NoteRevision) => new NoteRevision(revision.revisionId,
    revision.noteId, revision.title, revision.body, revision.savedAt, revision.action));
  return result;
}

function copyData(value: StoredData): StoredData {
  const result: StoredData = new StoredData();
  result.notes = value.notes.map((item: NoteItem) => copyNote(item));
  result.recycleBin = value.version === 2 ? value.recycleBin.map((item: RecycledNote) => copyRecycled(item)) : [];
  result.recycleSequence = value.version === 2 ? value.recycleSequence : 0;
  result.draftTitle = value.draftTitle;
  result.draftBody = value.draftBody;
  result.todoDays = value.todoDays.map((day: TodoDay) =>
    new TodoDay(day.date, day.items.map((item: TodoItem) => copyTodo(item))));
  const history: NoteRevision[] | undefined = value.noteHistory;
  result.noteHistory = history === undefined ? [] : history.map((item: NoteRevision) =>
    new NoteRevision(item.revisionId, item.noteId, item.title, item.body, item.savedAt, item.action));
  result.favorites = value.favorites === undefined ? [] : value.favorites.slice();
  result.editNoteId = value.editNoteId === undefined ? '' : value.editNoteId;
  result.editBaseRevision = typeof value.editBaseRevision === 'string' ? value.editBaseRevision : '';
  result.editBaseTitle = typeof value.editBaseTitle === 'string' ? value.editBaseTitle : '';
  result.editBaseBody = typeof value.editBaseBody === 'string' ? value.editBaseBody : '';
  result.editTitle = typeof value.editTitle === 'string' ? value.editTitle : '';
  result.editBody = typeof value.editBody === 'string' ? value.editBody : '';
  return result;
}

function clearStoredEdit(data: StoredData): void {
  data.editNoteId = '';
  data.editBaseRevision = '';
  data.editBaseTitle = '';
  data.editBaseBody = '';
  data.editTitle = '';
  data.editBody = '';
}

function dailySamples(date: string): TodoItem[] {
  return [
    new TodoItem(`${date}-plan`, '整理今日计划'),
    new TodoItem(`${date}-focus`, '完成一项重要任务'),
    new TodoItem(`${date}-review`, '回顾今日进度')
  ];
}

function ensureDay(data: StoredData, date: string): void {
  if (data.todoDays.find((day: TodoDay) => day.date === date) === undefined) {
    data.todoDays.push(new TodoDay(date, dailySamples(date)));
  }
}

function validData(value: StoredData): boolean {
  if (value === null || typeof value !== 'object' || (value.version !== 1 && value.version !== 2) ||
    typeof value.draftTitle !== 'string' || typeof value.draftBody !== 'string' ||
    value.draftTitle.length > 60 || value.draftBody.length > 4000 ||
    !Array.isArray(value.notes) || value.notes.length > MAX_ACTIVE_NOTES || !Array.isArray(value.todoDays)) {
    return false;
  }
  const noteIds: string[] = [];
  for (const note of value.notes) {
    if (note === null || typeof note !== 'object' || typeof note.id !== 'string' || note.id.length === 0 ||
      noteIds.includes(note.id) || typeof note.title !== 'string' || typeof note.body !== 'string' ||
      note.title.length > 60 || note.body.length > 4000 || typeof note.createdAt !== 'number' ||
      !Number.isFinite(note.createdAt)) {
      return false;
    }
    noteIds.push(note.id);
  }
  const dates: string[] = [];
  for (const day of value.todoDays) {
    if (day === null || typeof day !== 'object' || typeof day.date !== 'string' ||
      !validDateKey(day.date) || dates.includes(day.date) ||
      !Array.isArray(day.items) || day.items.length < 1 || day.items.length > 20) {
      return false;
    }
    dates.push(day.date);
    const todoIds: string[] = [];
    for (const item of day.items) {
      if (item === null || typeof item !== 'object' || typeof item.id !== 'string' ||
        item.id.length === 0 || todoIds.includes(item.id) || typeof item.title !== 'string' ||
        typeof item.done !== 'boolean') {
        return false;
      }
      todoIds.push(item.id);
    }
  }
  const history = value.noteHistory;
  if (history !== undefined) {
    if (!Array.isArray(history) || history.length > MAX_WORKSPACE_HISTORY) {
      return false;
    }
    const revisionIds: string[] = [];
    for (const revision of history) {
      if (revision === null || typeof revision !== 'object' || typeof revision.revisionId !== 'string' ||
        revision.revisionId.length === 0 || revisionIds.includes(revision.revisionId) ||
        typeof revision.noteId !== 'string' || !noteIds.includes(revision.noteId) ||
        typeof revision.title !== 'string' || revision.title.length > 60 ||
        typeof revision.body !== 'string' || revision.body.length > 4000 ||
        typeof revision.savedAt !== 'number' || !Number.isFinite(revision.savedAt) ||
        (revision.action !== 'create' && revision.action !== 'edit' && revision.action !== 'restore')) {
        return false;
      }
      revisionIds.push(revision.revisionId);
    }
  }
  const favorites = value.favorites;
  if (favorites !== undefined) {
    if (!Array.isArray(favorites) || favorites.length > 100) {
      return false;
    }
    const seen: string[] = [];
    for (const id of favorites) {
      if (typeof id !== 'string' || seen.includes(id) ||
        !COLLECTIONS.some((item: CollectionItem): boolean => item.id === id)) {
        return false;
      }
      seen.push(id);
    }
  }
  if (!validEditDraft(value, noteIds)) { return false; }
  return validRecycleData(value, noteIds);
}

function validStoredNote(note: NoteItem): boolean {
  return note !== null && typeof note === 'object' && typeof note.id === 'string' && note.id.length > 0 &&
    typeof note.title === 'string' && note.title.length <= 60 && typeof note.body === 'string' &&
    note.body.length <= 4000 && typeof note.createdAt === 'number' && Number.isFinite(note.createdAt);
}

function validRecycleData(value: StoredData, activeIds: string[]): boolean {
  if (value.version === 1) {
    return value.recycleBin === undefined || (Array.isArray(value.recycleBin) && value.recycleBin.length === 0);
  }
  if (!Array.isArray(value.recycleBin) || value.recycleBin.length > MAX_RECYCLED_NOTES ||
    !Number.isSafeInteger(value.recycleSequence) || value.recycleSequence < 0 ||
    !Array.isArray(value.noteHistory) || !Array.isArray(value.favorites) ||
    typeof value.editNoteId !== 'string' || typeof value.editBaseRevision !== 'string' ||
    typeof value.editBaseTitle !== 'string' || typeof value.editBaseBody !== 'string' ||
    typeof value.editTitle !== 'string' || typeof value.editBody !== 'string' ||
    value.editTitle.length > 60 || value.editBody.length > 4000 ||
    value.editBaseTitle.length > 60 || value.editBaseBody.length > 4000) { return false; }
  const noteIds: string[] = activeIds.slice();
  const trashIds: string[] = [];
  const revisionIds: string[] = value.noteHistory.map((revision: NoteRevision): string => revision.revisionId);
  let historyCount: number = revisionIds.length;
  for (const entry of value.recycleBin) {
    if (entry === null || typeof entry !== 'object' || typeof entry.trashId !== 'string' ||
      !validTrashToken(entry.trashId, value.recycleSequence) || trashIds.includes(entry.trashId) ||
      !validStoredNote(entry.note) || noteIds.includes(entry.note.id) ||
      typeof entry.deletedAt !== 'number' || !Number.isFinite(entry.deletedAt) || entry.deletedAt < 0 ||
      !Array.isArray(entry.history)) { return false; }
    trashIds.push(entry.trashId);
    noteIds.push(entry.note.id);
    for (const revision of entry.history) {
      if (revision === null || typeof revision !== 'object' || typeof revision.revisionId !== 'string' ||
        revision.revisionId.length === 0 || revisionIds.includes(revision.revisionId) ||
        revision.noteId !== entry.note.id || typeof revision.title !== 'string' || revision.title.length > 60 ||
        typeof revision.body !== 'string' || revision.body.length > 4000 ||
        typeof revision.savedAt !== 'number' || !Number.isFinite(revision.savedAt) ||
        (revision.action !== 'create' && revision.action !== 'edit' && revision.action !== 'restore')) { return false; }
      revisionIds.push(revision.revisionId);
      historyCount++;
      if (historyCount > MAX_WORKSPACE_HISTORY) { return false; }
    }
  }
  return true;
}

/** Decode without writing. Legacy v1 may be read beyond the new write budget, never truncated. */
export function decodeBusinessDocument(raw: string): StoredData {
  if (typeof raw !== 'string') { throw new Error('存储格式错误'); }
  if (raw.length === 0) { return new StoredData(); }
  const parsed: StoredData = JSON.parse(raw) as StoredData;
  if (!validData(parsed)) { throw new Error('存储格式错误'); }
  if (parsed.version === 2 && (raw.length > MAX_WORKSPACE_BYTES ||
    workspaceUtf8Bytes(raw) > MAX_WORKSPACE_BYTES)) {
    throw new Error('存档超过空间预算');
  }
  return copyData(parsed);
}

function trimWorkspaceHistory(data: StoredData): void {
  let all: NoteRevision[] = data.noteHistory.slice();
  for (const entry of data.recycleBin) { all = all.concat(entry.history); }
  if (all.length <= MAX_WORKSPACE_HISTORY) { return; }
  const order: NoteRevision[] = all.slice();
  all.sort((left: NoteRevision, right: NoteRevision): number =>
    right.savedAt - left.savedAt || order.indexOf(left) - order.indexOf(right));
  const retained: string[] = all.slice(0, MAX_WORKSPACE_HISTORY).map((revision: NoteRevision): string =>
    revision.revisionId);
  data.noteHistory = data.noteHistory.filter((revision: NoteRevision): boolean =>
    retained.includes(revision.revisionId));
  for (const entry of data.recycleBin) {
    entry.history = entry.history.filter((revision: NoteRevision): boolean => retained.includes(revision.revisionId));
  }
}

/** 编辑草稿校验：可选字段，但一旦存在就必须自洽且指向已存在的便签。 */
function validEditDraft(value: StoredData, noteIds: string[]): boolean {
  const noteId = value.editNoteId;
  const baseRevision = value.editBaseRevision;
  const title = value.editTitle;
  const body = value.editBody;
  if (noteId === undefined || noteId === '') {
    return true;
  }
  if (typeof noteId !== 'string' || !noteIds.includes(noteId)) {
    return false;
  }
  if (baseRevision !== undefined && typeof baseRevision !== 'string') {
    return false;
  }
  if (typeof title !== 'string' || typeof body !== 'string' || title.length > 60 || body.length > 4000) {
    return false;
  }
  return true;
}

export interface NavigationBusiness {
  snapshot(): BusinessSnapshot;
  subscribe(listener: () => void): void;
  unsubscribe(listener: () => void): void;
  hasUnsavedNoteWork(): boolean;
  persistForLeave(): Promise<boolean>;
  discardForLeave(): Promise<boolean>;
  errorText(): string;
  openNote(): void;
  entryContext(): BusinessEntryContext;
  restoreEntryContext(context: BusinessEntryContext): void;
  applyEntryFilter(filter: string): void;
}

export class BusinessStore implements NavigationBusiness {
  private static nextInstance: number = 0;
  private instanceId: number = 0;
  private rootRevision: number = 0;
  private recyclePreviewSequence: number = 0;
  private recyclePlan: RecycleBatchPlan | undefined = undefined;
  private lastRecycleBatchResult: RecycleBatchResult = new RecycleBatchResult();
  private context: common.ApplicationContext | undefined = undefined;
  private storage: BusinessStorage;
  private now: () => number;
  private data: StoredData = new StoredData();
  private listeners: Array<() => void> = [];
  private ready: boolean = false;
  private loading: boolean = false;
  private busy: boolean = false;
  private message: string = '';
  private error: string = '';
  private draftTitle: string = '';
  private draftBody: string = '';
  private dirty: boolean = false;
  private todoDate: string;
  private todoFilter: string = '全部';
  private followToday: boolean = true;
  private todoSequence: number = 0;
  private generation: number = 0;
  private noteSequence: number = 0;
  private revisionSequence: number = 0;
  private editingNoteId: string = '';
  private editBaseRevision: string = '';
  private noteQuery: string = '';
  private collectionQuery: string = '';
  private collectionCategory: string = '全部';
  private favoritesOnly: boolean = false;
  private recoveryRequired: boolean = false;
  private pendingData: StoredData | undefined = undefined;
  private pendingApply: (() => void) | undefined = undefined;
  private pendingMessage: string = '';
  private pendingBefore: string = '';
  private pendingWrites: Promise<void> = Promise.resolve();
  private durableCanonical: string = JSON.stringify(new StoredData());
  private storedBytes: number = 0;

  constructor(storage: BusinessStorage = new PreferencesBusinessStorage(), now: () => number = () => Date.now()) {
    this.instanceId = ++BusinessStore.nextInstance;
    this.storage = storage;
    this.now = now;
    this.todoDate = localDateKey(this.now());
  }

  initialize(context: common.ApplicationContext): void {
    this.context = context;
    if (this.ready || this.loading) {
      return;
    }
    void this.load(context);
  }

  dispose(): void {
    this.generation += 1;
    this.listeners = [];
    this.context = undefined;
    this.data = new StoredData();
    this.durableCanonical = JSON.stringify(this.data);
    this.storedBytes = 0;
    this.recyclePlan = undefined;
    this.lastRecycleBatchResult = new RecycleBatchResult();
    this.ready = false;
    this.loading = false;
    this.busy = false;
    this.draftTitle = '';
    this.draftBody = '';
    this.dirty = false;
    this.editingNoteId = '';
    this.editBaseRevision = '';
    this.todoFilter = '全部';
    this.followToday = true;
    this.favoritesOnly = false;
    this.clearPendingRecovery();
    this.noteQuery = '';
    this.collectionQuery = '';
    this.collectionCategory = '全部';
    this.message = '';
    this.error = '';
  }

  retry(): void {
    const context: common.ApplicationContext | undefined = this.context;
    if (context !== undefined) {
      this.initialize(context);
    }
  }

  subscribe(listener: () => void): void {
    if (!this.listeners.includes(listener)) {
      this.listeners.push(listener);
    }
  }

  unsubscribe(listener: () => void): void {
    this.listeners = this.listeners.filter((item: () => void) => item !== listener);
  }

  snapshot(): BusinessSnapshot {
    const result: BusinessSnapshot = new BusinessSnapshot();
    result.ready = this.ready;
    result.loading = this.loading;
    result.busy = this.busy;
    result.message = this.message;
    result.error = this.error;
    result.storageRecoveryRequired = this.recoveryRequired;
    result.observedAt = this.now();
    result.recycledNotes = this.data.recycleBin.map((entry: RecycledNote) => copyRecycled(entry));
    result.recycledNotes.sort((left: RecycledNote, right: RecycledNote): number =>
      right.deletedAt - left.deletedAt || right.trashId.localeCompare(left.trashId));
    result.expiredTrashCount = result.recycledNotes.filter((entry: RecycledNote): boolean =>
      isTrashExpired(entry.deletedAt, result.observedAt)).length;
    result.workspaceBytes = this.storedBytes;
    const recyclePlan: RecycleBatchPlan | undefined = this.recyclePlan;
    if (recyclePlan !== undefined) { result.recycleBatchPreview = copyRecycleBatchPreview(recyclePlan.preview); }
    result.lastRecycleBatchResult = copyRecycleBatchResult(this.lastRecycleBatchResult);
    result.draftTitle = this.draftTitle;
    result.draftBody = this.draftBody;
    result.draftDirty = this.dirty;
    result.draftKept = this.data.draftTitle.length > 0 || this.data.draftBody.length > 0;
    result.editingNoteId = this.editingNoteId;
    result.editBaseRevision = this.editBaseRevision;
    result.editDraftPersisted = this.data.editNoteId !== undefined && this.data.editNoteId.length > 0;
    result.noteQuery = this.noteQuery;
    result.notes = this.data.notes.map((item: NoteItem) => copyNote(item));
    const noteQuery: string = this.noteQuery.trim().toLowerCase();
    result.visibleNotes = result.notes.filter((item: NoteItem): boolean =>
      noteQuery.length === 0 || item.title.toLowerCase().includes(noteQuery) ||
      item.body.toLowerCase().includes(noteQuery));
    result.todoDate = this.todoDate;
    result.todoFilter = this.todoFilter;
    result.todoFollowToday = this.followToday;
    result.availableDates = this.availableDates();
    result.dateSummaries = this.dateSummaries();
    const day: TodoDay | undefined = this.data.todoDays.find((item: TodoDay) => item.date === this.todoDate);
    result.todos = day === undefined ? [] : day.items.map((item: TodoItem) => copyTodo(item));
    result.visibleTodos = result.todos.filter((item: TodoItem): boolean =>
      this.todoFilter === '全部' || (this.todoFilter === '已完成' ? item.done : !item.done));
    result.collectionQuery = this.collectionQuery;
    result.collectionCategory = this.collectionCategory;
    result.favoritesOnly = this.favoritesOnly;
    result.favoriteIds = this.data.favorites.slice();
    result.collections = COLLECTIONS.map((item: CollectionItem) =>
      new CollectionItem(item.id, item.title, item.category, item.content));
    const collectionQuery: string = this.collectionQuery.trim().toLowerCase();
    result.visibleCollections = result.collections.filter((item: CollectionItem): boolean =>
      (!this.favoritesOnly || this.data.favorites.indexOf(item.id) >= 0) &&
      (this.collectionCategory === '全部' || item.category === this.collectionCategory) &&
      (collectionQuery.length === 0 || item.title.toLowerCase().includes(collectionQuery) ||
        item.content.toLowerCase().includes(collectionQuery)));
    return result;
  }

  entryContext(): BusinessEntryContext {
    const context: BusinessEntryContext = new BusinessEntryContext();
    context.todoDate = this.todoDate;
    context.todoFilter = this.todoFilter;
    context.todoFollowToday = this.followToday;
    context.editBaseRevision = this.editBaseRevision;
    context.favoritesOnly = this.favoritesOnly;
    context.collectionQuery = this.collectionQuery;
    context.collectionCategory = this.collectionCategory;
    context.editingNoteId = this.editingNoteId;
    context.draftTitle = this.draftTitle;
    context.draftBody = this.draftBody;
    context.dirty = this.dirty;
    return context;
  }

  restoreEntryContext(context: BusinessEntryContext): void {
    this.todoDate = context.todoDate;
    this.todoFilter = context.todoFilter;
    this.followToday = context.todoFollowToday;
    this.editBaseRevision = context.editBaseRevision;
    this.favoritesOnly = context.favoritesOnly;
    this.collectionQuery = context.collectionQuery;
    this.collectionCategory = context.collectionCategory;
    this.editingNoteId = context.editingNoteId;
    this.draftTitle = context.draftTitle;
    this.draftBody = context.draftBody;
    this.dirty = context.dirty;
    this.notify();
  }

  applyEntryFilter(filter: string): void {
    if (filter === 'todayOpen') {
      this.todoDate = localDateKey(this.now());
      this.followToday = true;
      ensureDay(this.data, this.todoDate);
      this.todoFilter = '未完成';
    } else if (filter === 'saved') {
      this.favoritesOnly = true;
      this.collectionQuery = '';
      this.collectionCategory = '全部';
    }
    this.notify();
  }

  setNoteQuery(value: string): void {
    this.noteQuery = value.slice(0, 40);
    this.notify();
  }

  setCollectionQuery(value: string): void {
    this.collectionQuery = value.slice(0, 40);
    this.notify();
  }

  setCollectionCategory(value: string): void {
    this.collectionCategory = value;
    this.notify();
  }

  setFavoritesOnly(value: boolean): void {
    this.favoritesOnly = value;
    this.notify();
  }

  async toggleFavorite(id: string): Promise<boolean> {
    if (!this.ready || this.busy || this.recoveryRequired) {
      return false;
    }
    if (!COLLECTIONS.some((item: CollectionItem): boolean => item.id === id)) {
      return this.reject('收藏内容不存在');
    }
    const next: StoredData = copyData(this.data);
    const index: number = next.favorites.indexOf(id);
    if (index >= 0) {
      next.favorites = next.favorites.filter((item: string) => item !== id);
    } else {
      next.favorites.push(id);
    }
    const added: boolean = index < 0;
    return this.commit(next, added ? '已收藏' : '已取消收藏', () => {});
  }

  historyFor(noteId: string): NoteRevision[] {
    return this.data.noteHistory.filter((item: NoteRevision): boolean => item.noteId === noteId)
      .map((item: NoteRevision): NoteRevision => new NoteRevision(item.revisionId, item.noteId,
        item.title, item.body, item.savedAt, item.action));
  }

  hasDraftChanges(): boolean {
    return this.dirty;
  }

  errorText(): string {
    return this.error;
  }

  openNote(): void {
    if (!this.dirty && this.editingNoteId.length === 0) {
      this.editingNoteId = '';
      this.draftTitle = this.data.draftTitle;
      this.draftBody = this.data.draftBody;
    }
    this.message = '';
    this.notify();
  }

  beginEditNote(id: string): void {
    if (!this.ready || this.busy || this.recoveryRequired) {
      return;
    }
    if (this.dirty) {
      this.error = '请先处理当前未保存内容';
      this.notify();
      return;
    }
    const note: NoteItem | undefined = this.data.notes.find((item: NoteItem) => item.id === id);
    if (note === undefined) {
      this.error = '便签已删除';
      this.notify();
      return;
    }
    this.editingNoteId = id;
    this.editBaseRevision = this.latestRevisionId(id);
    this.draftTitle = note.title;
    this.draftBody = note.body;
    this.dirty = false;
    this.message = '正在编辑便签';
    this.error = '';
    this.notify();
  }

  /** 该便签最近一次修订的编号；没有历史时为空串，表示基于当前正文。 */
  private latestRevisionId(noteId: string): string {
    const hit: NoteRevision | undefined = this.data.noteHistory.find((item: NoteRevision): boolean =>
      item.noteId === noteId);
    return hit === undefined ? '' : hit.revisionId;
  }

  /** 保留编辑草稿：把正在编辑的便签、基线修订和编辑缓冲写入存档，重开后可继续。 */
  async keepEditDraft(): Promise<boolean> {
    if (this.recoveryRequired) { return this.reject('请先核对存储结果'); }
    if (this.editingNoteId.length === 0) {
      return this.reject('当前不在编辑状态');
    }
    if (!this.dirty) {
      const original: NoteItem | undefined = this.data.notes.find((item: NoteItem) => item.id === this.editingNoteId);
      if (this.data.editNoteId === this.editingNoteId && original !== undefined &&
        this.draftTitle === original.title && this.draftBody === original.body) {
        const next: StoredData = copyData(this.data);
        clearStoredEdit(next);
        return this.commit(next, '没有需要保留的修改', () => {});
      }
      this.message = '没有需要保留的修改';
      this.notify();
      return true;
    }
    const next: StoredData = copyData(this.data);
    next.editNoteId = this.editingNoteId;
    next.editBaseRevision = this.editBaseRevision;
    next.editTitle = this.draftTitle;
    next.editBody = this.draftBody;
    return this.commit(next, '编辑草稿已保留', () => {
      this.dirty = false;
    });
  }

  cancelEdit(): void {
    if (!this.ready || this.busy || this.recoveryRequired) {
      return;
    }
    void this.discardEditing('已取消编辑');
  }

  /** Clear durable and in-memory editing together; failed writes keep a retryable editor. */
  private async discardEditing(message: string): Promise<boolean> {
    const applyDiscard = (): void => {
      this.editingNoteId = '';
      this.editBaseRevision = '';
      this.draftTitle = this.data.draftTitle;
      this.draftBody = this.data.draftBody;
      this.dirty = false;
    };
    if (this.data.editNoteId !== undefined && this.data.editNoteId.length > 0) {
      const next: StoredData = copyData(this.data);
      clearStoredEdit(next);
      return this.commit(next, message, applyDiscard);
    }
    applyDiscard();
    this.message = message;
    this.error = '';
    this.notify();
    return true;
  }

  /** True when leaving the note page would lose either a draft or edits to an existing note. */
  hasUnsavedNoteWork(): boolean {
    return this.dirty || this.recoveryRequired;
  }

  /**
   * Leave confirmation action: editing saves the existing note, a new draft is kept as a draft.
   * Both paths return false on storage failure so navigation can stay on the page.
   */
  async persistForLeave(): Promise<boolean> {
    if (this.recoveryRequired) { return this.reject('请先核对存储结果'); }
    if (!this.dirty) {
      return true;
    }
    if (this.editingNoteId.length > 0) {
      return this.saveNote();
    }
    return this.keepDraft();
  }

  /** Discard edits for an existing note, or drop a new draft, without touching the stored note. */
  async discardForLeave(): Promise<boolean> {
    if (!this.ready || this.busy || this.recoveryRequired) {
      return false;
    }
    if (this.editingNoteId.length > 0) {
      return this.discardEditing('已放弃编辑修改');
    }
    return this.discardDraft();
  }

  setDraftTitle(value: string): void {
    if (!this.ready || this.busy || this.recoveryRequired) {
      return;
    }
    this.draftTitle = value.slice(0, 60);
    this.updateDraft();
  }

  setDraftBody(value: string): void {
    if (!this.ready || this.busy || this.recoveryRequired) {
      return;
    }
    this.draftBody = value.slice(0, 4000);
    this.updateDraft();
  }

  async keepDraft(): Promise<boolean> {
    if (this.recoveryRequired) { return this.reject('请先核对存储结果'); }
    if (this.editingNoteId.length > 0) {
      return this.reject('请先保存或取消编辑');
    }
    if (!this.dirty) {
      return true;
    }
    const next: StoredData = copyData(this.data);
    next.draftTitle = this.draftTitle;
    next.draftBody = this.draftBody;
    return this.commit(next, '草稿已保留', () => {
      this.dirty = false;
    });
  }

  async discardDraft(): Promise<boolean> {
    if (this.recoveryRequired) { return this.reject('请先核对存储结果'); }
    if (!this.ready) {
      return this.reject(this.loading ? '正在读取' : '存储不可用，请重试');
    }
    if (this.busy) { return this.reject('正在保存，请稍候'); }
    // 编辑既有便签时“清空”只改本次编辑缓冲，不得删除另行保留的新便签草稿或已保存正文。
    if (this.editingNoteId.length > 0) {
      this.draftTitle = '';
      this.draftBody = '';
      this.updateDraft();
      this.message = '已清空编辑内容';
      this.notify();
      return true;
    }
    const next: StoredData = copyData(this.data);
    next.draftTitle = '';
    next.draftBody = '';
    return this.commit(next, '草稿已清空', () => {
      this.draftTitle = '';
      this.draftBody = '';
      this.dirty = false;
    });
  }

  async saveNote(): Promise<boolean> {
    if (this.recoveryRequired) { return this.reject('请先核对存储结果'); }
    const title: string = this.draftTitle.trim();
    const body: string = this.draftBody.trim();
    if (title.length === 0 && body.length === 0) {
      return this.reject('请输入标题或内容');
    }
    if (this.editingNoteId.length > 0) {
      return this.updateEditingNote(title, body);
    }
    if (this.data.notes.length >= MAX_ACTIVE_NOTES) {
      return this.reject('便签已满，请先删除');
    }
    const next: StoredData = copyData(this.data);
    const createdAt: number = this.now();
    let noteId: string;
    do {
      this.noteSequence += 1;
      noteId = `${createdAt}-${this.noteSequence}`;
    } while (next.notes.some((item: NoteItem) => item.id === noteId) ||
      next.recycleBin.some((entry: RecycledNote) => entry.note.id === noteId));
    const noteTitle: string = title.length > 0 ? title : body.split('\n')[0].slice(0, 24);
    const note: NoteItem = new NoteItem(noteId, noteTitle, body, createdAt);
    next.notes.unshift(note);
    this.pushRevision(next, note, 'create', createdAt);
    next.draftTitle = '';
    next.draftBody = '';
    return this.commit(next, '便签已保存', () => {
      this.draftTitle = '';
      this.draftBody = '';
      this.dirty = false;
      this.editingNoteId = '';
    });
  }

  private async updateEditingNote(title: string, body: string): Promise<boolean> {
    const id: string = this.editingNoteId;
    const index: number = this.data.notes.findIndex((item: NoteItem) => item.id === id);
    if (index < 0) {
      return this.reject('便签已删除');
    }
    const current: NoteItem = this.data.notes[index];
    if (current.title === title && current.body === body) {
      const applyUnchanged = (): void => {
        this.draftTitle = current.title;
        this.draftBody = current.body;
        this.dirty = false;
      };
      if (this.data.editNoteId === id) {
        const unchanged: StoredData = copyData(this.data);
        clearStoredEdit(unchanged);
        return this.commit(unchanged, '内容未变化', applyUnchanged);
      }
      applyUnchanged();
      this.message = '内容未变化';
      this.notify();
      return true;
    }
    const next: StoredData = copyData(this.data);
    const target: NoteItem = next.notes[index];
    this.pushRevision(next, target, 'edit', this.now());
    target.title = title.length > 0 ? title : body.split('\n')[0].slice(0, 24);
    target.body = body;
    clearStoredEdit(next);
    return this.commit(next, '便签已更新', () => {
      this.draftTitle = next.draftTitle;
      this.draftBody = next.draftBody;
      this.dirty = false;
      this.editingNoteId = '';
      this.editBaseRevision = '';
    });
  }

  async restoreRevision(noteId: string, revisionId: string): Promise<boolean> {
    if (this.recoveryRequired) { return this.reject('请先核对存储结果'); }
    const note: NoteItem | undefined = this.data.notes.find((item: NoteItem) => item.id === noteId);
    if (note === undefined) {
      return this.reject('便签已删除');
    }
    const revision: NoteRevision | undefined = this.data.noteHistory.find((item: NoteRevision): boolean =>
      item.noteId === noteId && item.revisionId === revisionId);
    if (revision === undefined) {
      return this.reject('历史版本不存在');
    }
    if (note.title === revision.title && note.body === revision.body) {
      this.message = '已是该历史版本';
      this.notify();
      return true;
    }
    const next: StoredData = copyData(this.data);
    const target: NoteItem | undefined = next.notes.find((item: NoteItem) => item.id === noteId);
    if (target === undefined) {
      return this.reject('便签已删除');
    }
    this.pushRevision(next, target, 'restore', this.now());
    target.title = revision.title;
    target.body = revision.body;
    if (next.editNoteId === noteId) { clearStoredEdit(next); }
    return this.commit(next, '已恢复到历史版本', () => {
      if (this.editingNoteId === noteId) {
        this.draftTitle = revision.title;
        this.draftBody = revision.body;
        this.editBaseRevision = this.latestRevisionId(noteId);
        this.dirty = false;
      }
    });
  }

  private pushRevision(data: StoredData, note: NoteItem, action: string, at: number): void {
    let revisionId: string;
    do {
      this.revisionSequence += 1;
      revisionId = `${at}-r${this.revisionSequence}`;
    } while (data.noteHistory.some((item: NoteRevision) => item.revisionId === revisionId) ||
      data.recycleBin.some((entry: RecycledNote): boolean =>
        entry.history.some((item: NoteRevision): boolean => item.revisionId === revisionId)));
    data.noteHistory.unshift(new NoteRevision(revisionId, note.id, note.title, note.body, at, action));
    trimWorkspaceHistory(data);
  }

  /** Source-compatible entry; deletion intentionally becomes recoverable, never implicit hard delete. */
  async deleteNote(id: string): Promise<boolean> {
    return this.moveNoteToTrash(id);
  }

  requiresTrashEditDecision(id: string): boolean {
    return (this.editingNoteId === id && this.dirty) || this.data.editNoteId === id;
  }

  async moveNoteToTrash(id: string,
    decision: TrashEditDecision = TrashEditDecision.REQUIRE_DECISION): Promise<boolean> {
    if (!this.canWriteBusiness()) { return false; }
    if (decision === TrashEditDecision.CANCEL) { return this.reject('已取消移入回收站'); }
    const note: NoteItem | undefined = this.data.notes.find((item: NoteItem): boolean => item.id === id);
    if (note === undefined) { return this.reject('便签已删除'); }
    if (this.data.recycleBin.length >= MAX_RECYCLED_NOTES) { return this.reject('回收站已满，请先清理'); }
    if (this.data.recycleSequence >= Number.MAX_SAFE_INTEGER) { return this.reject('回收站编号已达上限'); }
    if (decision !== TrashEditDecision.REQUIRE_DECISION && decision !== TrashEditDecision.KEEP_CHANGES &&
      decision !== TrashEditDecision.DISCARD_CHANGES) { return this.reject('编辑处理方式无效'); }
    const hasEditing: boolean = this.requiresTrashEditDecision(id);
    if (hasEditing && decision === TrashEditDecision.REQUIRE_DECISION) {
      return this.reject('请先选择保留或放弃目标便签的编辑');
    }
    const deletedAt: number = this.now();
    if (!Number.isFinite(deletedAt) || deletedAt < 0) { return this.reject('当前时间无效'); }
    const next: StoredData = copyData(this.data);
    const source: NoteItem | undefined = next.notes.find((item: NoteItem): boolean => item.id === id);
    if (source === undefined) { return this.reject('便签已删除'); }
    if (hasEditing && decision === TrashEditDecision.KEEP_CHANGES) {
      const title: string = (this.editingNoteId === id ? this.draftTitle : next.editTitle).trim();
      const body: string = (this.editingNoteId === id ? this.draftBody : next.editBody).trim();
      if (title.length === 0 && body.length === 0) { return this.reject('请输入标题或内容'); }
      const resolvedTitle: string = title.length > 0 ? title : body.split('\n')[0].slice(0, 24);
      if (source.title !== resolvedTitle || source.body !== body) {
        this.pushRevision(next, source, 'edit', deletedAt);
        source.title = resolvedTitle;
        source.body = body;
      }
    }
    const entry: RecycledNote = new RecycledNote();
    next.recycleSequence++;
    entry.trashId = `trash-${next.recycleSequence}`;
    entry.note = copyNote(source);
    entry.deletedAt = deletedAt;
    entry.history = next.noteHistory.filter((revision: NoteRevision): boolean => revision.noteId === id);
    next.recycleBin.unshift(entry);
    next.notes = next.notes.filter((item: NoteItem): boolean => item.id !== id);
    next.noteHistory = next.noteHistory.filter((revision: NoteRevision): boolean => revision.noteId !== id);
    if (next.editNoteId === id) { clearStoredEdit(next); }
    return this.commit(next, '已移入回收站', () => {
      if (this.editingNoteId === id) {
        this.editingNoteId = '';
        this.editBaseRevision = '';
        this.draftTitle = next.draftTitle;
        this.draftBody = next.draftBody;
        this.dirty = false;
      }
    });
  }

  async restoreTrashedNote(trashId: string): Promise<boolean> {
    if (!this.canWriteBusiness()) { return false; }
    const entry: RecycledNote | undefined = this.data.recycleBin.find((item: RecycledNote): boolean =>
      item.trashId === trashId);
    if (entry === undefined) { return this.reject('回收项已变化，请重新查看'); }
    if (!Number.isFinite(this.now())) { return this.reject('当前时间无效'); }
    if (isTrashExpired(entry.deletedAt, this.now())) { return this.reject('已超过30天保留期，不能恢复'); }
    if (this.data.notes.length >= MAX_ACTIVE_NOTES) { return this.reject('便签已满，请先释放名额'); }
    if (this.data.notes.some((note: NoteItem): boolean => note.id === entry.note.id)) {
      return this.reject('便签标识冲突，未覆盖现有内容');
    }
    const next: StoredData = copyData(this.data);
    next.notes.unshift(copyNote(entry.note));
    next.noteHistory = entry.history.map((revision: NoteRevision): NoteRevision => new NoteRevision(
      revision.revisionId, revision.noteId, revision.title, revision.body, revision.savedAt, revision.action))
      .concat(next.noteHistory);
    next.recycleBin = next.recycleBin.filter((item: RecycledNote): boolean => item.trashId !== trashId);
    return this.commit(next, '便签已恢复；如搜索未显示，请清空搜索', () => {});
  }

  async purgeTrashedNote(trashId: string): Promise<boolean> {
    if (!this.canWriteBusiness()) { return false; }
    if (!this.data.recycleBin.some((entry: RecycledNote): boolean => entry.trashId === trashId)) {
      return this.reject('回收项已变化，请重新查看');
    }
    const next: StoredData = copyData(this.data);
    next.recycleBin = next.recycleBin.filter((entry: RecycledNote): boolean => entry.trashId !== trashId);
    return this.commit(next, '已永久删除，无法恢复', () => {});
  }

  async purgeExpiredNotes(): Promise<TrashCleanupResult> {
    if (!this.canWriteBusiness()) { return new TrashCleanupResult(false, 0, this.error); }
    const now: number = this.now();
    if (!Number.isFinite(now) || now < 0) {
      this.reject('当前时间无效');
      return new TrashCleanupResult(false, 0, this.error);
    }
    const expired: RecycledNote[] = this.data.recycleBin.filter((entry: RecycledNote): boolean =>
      isTrashExpired(entry.deletedAt, now));
    if (expired.length === 0) {
      this.message = '没有已过期回收项';
      this.error = '';
      this.notify();
      return new TrashCleanupResult(true, 0, this.message);
    }
    const next: StoredData = copyData(this.data);
    next.recycleBin = next.recycleBin.filter((entry: RecycledNote): boolean => !isTrashExpired(entry.deletedAt, now));
    const message: string = `已清理${expired.length}项过期便签`;
    const success: boolean = await this.commit(next, message, () => {});
    return new TrashCleanupResult(success, success ? expired.length : 0, success ? message : this.error);
  }

  /** Preview is session-only and performs no Preferences write. */
  previewRecycleBatch(ids: string[], action: RecycleBatchAction): RecycleBatchPreview {
    this.recyclePlan = undefined;
    const preview: RecycleBatchPreview = this.buildRecycleBatchPreview(ids, action);
    if (this.recyclePreviewSequence >= Number.MAX_SAFE_INTEGER) {
      preview.errors.push('预览编号已达上限');
      preview.eligible = false;
      this.notify();
      return copyRecycleBatchPreview(preview);
    }
    if (this.ready && !this.busy && !this.recoveryRequired) {
      this.recyclePreviewSequence++;
      preview.token = `recycle-${this.instanceId}-${this.generation}-${this.recyclePreviewSequence}`;
      const plan: RecycleBatchPlan = new RecycleBatchPlan();
      plan.preview = preview;
      plan.ids = ids.slice();
      plan.canonical = JSON.stringify(this.data);
      this.recyclePlan = plan;
    }
    this.notify();
    return copyRecycleBatchPreview(preview);
  }

  cancelRecycleBatchPreview(token: string): void {
    const plan: RecycleBatchPlan | undefined = this.recyclePlan;
    if (plan === undefined || plan.preview.token !== token) { return; }
    this.recyclePlan = undefined;
    this.message = '已取消批量预览';
    this.notify();
  }

  async applyRecycleBatch(token: string): Promise<RecycleBatchResult> {
    const plan: RecycleBatchPlan | undefined = this.recyclePlan;
    if (plan === undefined || token.length === 0 || plan.preview.token !== token) {
      return this.rejectRecycleBatch(token, RecycleBatchAction.RESTORE, '预览已失效，请重新预览');
    }
    this.recyclePlan = undefined; // Consume before any await, including a rejected attempt.
    if (!this.canWriteBusiness()) { return this.rejectRecycleBatch(token, plan.preview.action, this.error); }
    if (plan.preview.epoch !== this.generation || plan.preview.rootRevision !== this.rootRevision ||
      plan.canonical !== JSON.stringify(this.data)) {
      return this.rejectRecycleBatch(token, plan.preview.action, '数据已变化，请重新预览');
    }
    const fresh: RecycleBatchPreview = this.buildRecycleBatchPreview(plan.ids, plan.preview.action);
    if (!plan.preview.eligible || !fresh.eligible) {
      const reasons: string[] = fresh.errors.length > 0 ? fresh.errors : plan.preview.errors;
      const message: string = reasons.length > 0 ? reasons.join('；') : '所选条目不可整体处理，请重新预览';
      return this.rejectRecycleBatch(token, plan.preview.action, message);
    }
    const next: StoredData | undefined = this.makeRecycleBatchCandidate(plan.ids, plan.preview.action);
    if (next === undefined) { return this.rejectRecycleBatch(token, plan.preview.action, '所选条目已变化，未执行'); }
    const confirmed: RecycleBatchResult = new RecycleBatchResult();
    confirmed.token = token;
    confirmed.action = plan.preview.action;
    confirmed.success = true;
    confirmed.affected = plan.ids.length;
    confirmed.message = plan.preview.action === RecycleBatchAction.RESTORE ?
      `已批量恢复${plan.ids.length}项便签` : `已批量永久删除${plan.ids.length}项便签`;
    const generation: number = this.generation;
    const success: boolean = await this.commit(next, confirmed.message, () => {
      this.lastRecycleBatchResult = copyRecycleBatchResult(confirmed);
    });
    if (generation !== this.generation) {
      const stale: RecycleBatchResult = new RecycleBatchResult();
      stale.token = token;
      stale.action = plan.preview.action;
      stale.message = '会话已变化，旧操作不更新当前页面';
      return stale;
    }
    if (success) { return copyRecycleBatchResult(confirmed); }
    return this.rejectRecycleBatch(token, plan.preview.action, this.error);
  }

  private rejectRecycleBatch(token: string, action: RecycleBatchAction, message: string): RecycleBatchResult {
    const result: RecycleBatchResult = new RecycleBatchResult();
    result.token = token;
    result.action = action;
    result.requiresRecovery = this.recoveryRequired;
    result.message = message;
    this.lastRecycleBatchResult = copyRecycleBatchResult(result);
    this.reject(message);
    return result;
  }

  private buildRecycleBatchPreview(ids: string[], action: RecycleBatchAction): RecycleBatchPreview {
    const preview: RecycleBatchPreview = new RecycleBatchPreview();
    preview.action = action;
    preview.epoch = this.generation;
    preview.rootRevision = this.rootRevision;
    preview.observedAt = this.now();
    preview.selectedCount = ids.length;
    preview.availableSlots = Math.max(0, MAX_ACTIVE_NOTES - this.data.notes.length);
    preview.resultingActiveCount = this.data.notes.length;
    preview.resultingTrashCount = this.data.recycleBin.length;
    preview.resultingHistoryCount = this.workspaceHistoryCount(this.data);
    if (!this.ready) { preview.errors.push('存储尚未就绪'); }
    if (this.busy) { preview.errors.push('正在保存，请稍候'); }
    if (this.recoveryRequired) { preview.errors.push('请先核对存储结果'); }
    if (!Number.isFinite(preview.observedAt) || preview.observedAt < 0) { preview.errors.push('当前时间无效'); }
    if (action !== RecycleBatchAction.RESTORE && action !== RecycleBatchAction.PURGE) { preview.errors.push('批量操作无效'); }
    if (ids.length === 0 || ids.length > MAX_RECYCLED_NOTES) { preview.errors.push('请选择1至50个回收项'); }
    const seen: string[] = [];
    for (const id of ids) {
      const row: RecycleBatchRow = new RecycleBatchRow();
      row.trashId = id;
      if (seen.includes(id)) { preview.errors.push('选择含重复回收标识'); }
      seen.push(id);
      const entry: RecycledNote | undefined = this.data.recycleBin.find((item: RecycledNote): boolean =>
        item.trashId === id);
      if (entry === undefined) { row.reason = '条目不存在或已变化'; } else {
        row.noteId = entry.note.id;
        row.title = entry.note.title;
        row.deletedAt = entry.deletedAt;
        row.historyCount = entry.history.length;
        if (action === RecycleBatchAction.RESTORE && isTrashExpired(entry.deletedAt, preview.observedAt)) {
          row.reason = '超过30天保留期';
        } else if (action === RecycleBatchAction.RESTORE &&
          this.data.notes.some((note: NoteItem): boolean => note.id === entry.note.id)) {
          row.reason = '便签标识冲突';
        } else { row.eligible = true; }
      }
      if (!row.eligible) { preview.errors.push(`${id}：${row.reason}`); }
      preview.rows.push(row);
    }
    if (action === RecycleBatchAction.RESTORE && ids.length > preview.availableSlots) {
      preview.errors.push(`活动便签名额不足：需要${ids.length}，可用${preview.availableSlots}`);
    }
    if (preview.errors.length === 0) {
      const candidate: StoredData | undefined = this.makeRecycleBatchCandidate(ids, action);
      if (candidate === undefined) { preview.errors.push('所选条目已变化'); } else {
        preview.resultingBytes = workspaceUtf8Bytes(JSON.stringify(candidate));
        preview.resultingActiveCount = candidate.notes.length;
        preview.resultingTrashCount = candidate.recycleBin.length;
        preview.resultingHistoryCount = this.workspaceHistoryCount(candidate);
        if (!validData(candidate)) { preview.errors.push('候选存档不一致'); }
        if (preview.resultingBytes > MAX_WORKSPACE_BYTES) { preview.errors.push('候选存档超过8MiB空间预算'); }
      }
    }
    preview.eligible = preview.errors.length === 0;
    return preview;
  }

  private workspaceHistoryCount(data: StoredData): number {
    let count: number = data.noteHistory.length;
    for (const entry of data.recycleBin) { count += entry.history.length; }
    return count;
  }

  private makeRecycleBatchCandidate(ids: string[], action: RecycleBatchAction): StoredData | undefined {
    const next: StoredData = copyData(this.data);
    const selected: RecycledNote[] = [];
    for (const id of ids) {
      const entry: RecycledNote | undefined = next.recycleBin.find((item: RecycledNote): boolean =>
        item.trashId === id);
      if (entry === undefined) { return undefined; }
      selected.push(entry);
    }
    if (action === RecycleBatchAction.RESTORE) {
      next.notes = selected.map((entry: RecycledNote): NoteItem => copyNote(entry.note)).concat(next.notes);
      let restoredHistory: NoteRevision[] = [];
      for (const entry of selected) { restoredHistory = restoredHistory.concat(entry.history); }
      next.noteHistory = restoredHistory.concat(next.noteHistory);
    }
    next.recycleBin = next.recycleBin.filter((entry: RecycledNote): boolean => !ids.includes(entry.trashId));
    return next;
  }

  private canWriteBusiness(): boolean {
    if (!this.ready) { return this.reject(this.loading ? '正在读取' : '存储不可用，请重试'); }
    if (this.busy) { return this.reject('正在保存，请稍候'); }
    if (this.recoveryRequired) { return this.reject('请先核对存储结果'); }
    return true;
  }

  async refreshTodos(): Promise<boolean> {
    if (!this.ready) {
      this.retry();
      return false;
    }
    const date: string = localDateKey(this.now());
    const next: StoredData = copyData(this.data);
    ensureDay(next, date);
    return this.commit(next, '待办已刷新', () => {
      this.todoDate = date;
      this.followToday = true;
    });
  }

  /** 历史日期列表：已落盘日期加今天，倒序。 */
  availableDates(): string[] {
    const today: string = localDateKey(this.now());
    const dates: string[] = [today];
    this.data.todoDays.forEach((day: TodoDay): void => {
      if (dates.indexOf(day.date) < 0) {
        dates.push(day.date);
      }
    });
    dates.sort((left: string, right: string): number => left < right ? 1 : (left > right ? -1 : 0));
    return dates;
  }

  /** 每个日期的完成统计，供日期条展示。 */
  dateSummaries(): TodoDateSummary[] {
    return this.availableDates().map((date: string): TodoDateSummary => {
      const day: TodoDay | undefined = this.data.todoDays.find((item: TodoDay): boolean =>
        item.date === date);
      const items: TodoItem[] = day === undefined ? [] : day.items;
      return new TodoDateSummary(date, items.length,
        items.filter((item: TodoItem): boolean => item.done).length);
    });
  }

  /** 切换查看日期：只改变视图，不写存储；非法或未来日期被拒绝。 */
  selectTodoDate(date: string): boolean {
    if (!this.ready || this.busy || this.recoveryRequired) {
      return false;
    }
    if (!validDateKey(date) || date > localDateKey(this.now())) {
      return this.reject('日期无效');
    }
    this.todoDate = date;
    this.followToday = date === localDateKey(this.now());
    this.message = this.followToday ? '已回到今天' : `正在查看 ${date} 的待办`;
    this.error = '';
    this.notify();
    return true;
  }

  /** 相对当前查看日期前后移动一天；越界返回 false。 */
  shiftTodoDate(offset: number): boolean {
    const step: number = offset === 0 ? 0 : (offset < 0 ? -1 : 1);
    if (step === 0) {
      return this.selectTodoDate(localDateKey(this.now()));
    }
    const current: number = Date.parse(`${this.todoDate}T00:00:00`);
    if (!Number.isFinite(current)) {
      return false;
    }
    return this.selectTodoDate(localDateKey(current + step * 86400000));
  }

  /** 写操作绑定当前查看日期；仅“跟随今天”模式在跨日后自动刷新。 */
  private async rolloverIfNeeded(): Promise<boolean> {
    const today: string = localDateKey(this.now());
    if (!this.followToday || today === this.todoDate) {
      return true;
    }
    await this.refreshTodos();
    return false;
  }

  async setTodoDone(id: string, done: boolean): Promise<boolean> {
    if (!await this.rolloverIfNeeded()) {
      return this.reject('日期已更新，请重新选择');
    }
    const next: StoredData = copyData(this.data);
    const day: TodoDay | undefined = next.todoDays.find((item: TodoDay) => item.date === this.todoDate);
    const todo: TodoItem | undefined = day?.items.find((item: TodoItem) => item.id === id);
    if (todo === undefined) {
      return this.reject('待办已更新，请刷新');
    }
    if (todo.done === done) {
      return true;
    }
    todo.done = done;
    return this.commit(next, done ? '已完成' : '已恢复待办', () => {});
  }

  setTodoFilter(filter: string): void {
    if (filter !== '全部' && filter !== '未完成' && filter !== '已完成') {
      return;
    }
    this.todoFilter = filter;
    this.notify();
  }

  private ensureTodoDay(data: StoredData, date: string): TodoDay {
    const found: TodoDay | undefined = data.todoDays.find((item: TodoDay) => item.date === date);
    if (found !== undefined) {
      return found;
    }
    const created: TodoDay = new TodoDay(date, []);
    data.todoDays.push(created);
    return created;
  }

  private nextTodoId(data: StoredData, date: string): string {
    let candidate: string;
    do {
      this.todoSequence += 1;
      candidate = `${date}-task-${this.todoSequence}`;
    } while (data.todoDays.some((day: TodoDay): boolean =>
      day.items.some((item: TodoItem): boolean => item.id === candidate)));
    return candidate;
  }

  async addTodo(title: string): Promise<boolean> {
    const text: string = title.trim();
    if (text.length === 0) {
      return this.reject('请输入待办内容');
    }
    if (text.length > 60) {
      return this.reject('待办最多 60 个字符');
    }
    if (!await this.rolloverIfNeeded()) {
      return this.reject('日期已更新，请重新选择');
    }
    const date: string = this.todoDate;
    const next: StoredData = copyData(this.data);
    const day: TodoDay = this.ensureTodoDay(next, date);
    if (day.items.length >= 20) {
      return this.reject('当日待办已满，请先删除');
    }
    day.items.push(new TodoItem(this.nextTodoId(next, date), text, false));
    return this.commit(next, '待办已添加', () => {});
  }

  async updateTodo(id: string, title: string): Promise<boolean> {
    const text: string = title.trim();
    if (text.length === 0) {
      return this.reject('请输入待办内容');
    }
    if (text.length > 60) {
      return this.reject('待办最多 60 个字符');
    }
    if (!await this.rolloverIfNeeded()) {
      return this.reject('日期已更新，请重新选择');
    }
    const next: StoredData = copyData(this.data);
    const day: TodoDay | undefined = next.todoDays.find((item: TodoDay) => item.date === this.todoDate);
    const todo: TodoItem | undefined = day?.items.find((item: TodoItem) => item.id === id);
    if (todo === undefined) {
      return this.reject('待办已更新，请刷新');
    }
    if (todo.title === text) {
      this.message = '内容未变化';
      this.notify();
      return true;
    }
    todo.title = text;
    return this.commit(next, '待办已更新', () => {});
  }

  async deleteTodo(id: string): Promise<boolean> {
    if (!await this.rolloverIfNeeded()) {
      return this.reject('日期已更新，请重新选择');
    }
    const next: StoredData = copyData(this.data);
    const day: TodoDay | undefined = next.todoDays.find((item: TodoDay) => item.date === this.todoDate);
    const todo: TodoItem | undefined = day?.items.find((item: TodoItem) => item.id === id);
    if (day === undefined || todo === undefined) {
      return this.reject('待办已更新，请刷新');
    }
    if (day.items.length <= 1) {
      return this.reject('至少保留一项待办');
    }
    day.items = day.items.filter((item: TodoItem) => item.id !== id);
    return this.commit(next, '待办已删除', () => {});
  }

  async resetToday(): Promise<boolean> {
    if (!this.ready) { return this.reject(this.loading ? '正在读取' : '存储不可用，请重试'); }
    if (this.busy) { return this.reject('正在保存，请稍候'); }
    const next: StoredData = copyData(this.data);
    next.todoDays = next.todoDays.filter((item: TodoDay) => item.date !== this.todoDate);
    next.todoDays.push(new TodoDay(this.todoDate, dailySamples(this.todoDate)));
    return this.commit(next, '已恢复当日样例', () => {});
  }

  private async load(context: common.ApplicationContext): Promise<void> {
    const generation: number = this.generation;
    this.loading = true;
    this.error = '';
    this.notify();
    try {
      await this.pendingWrites;
      if (generation !== this.generation) { return; }
      const raw: string = await this.storage.read(context);
      const loaded: StoredData = decodeBusinessDocument(raw);
      if (generation !== this.generation) {
        return;
      }
      this.durableCanonical = JSON.stringify(loaded);
      this.storedBytes = workspaceUtf8Bytes(raw);
      this.todoDate = localDateKey(this.now());
      ensureDay(loaded, this.todoDate);
      this.data = loaded;
      this.recycleRootChanged();
      this.draftTitle = loaded.draftTitle;
      this.draftBody = loaded.draftBody;
      this.dirty = false;
      // 恢复上次保留的编辑草稿：便签仍存在时才恢复，避免指向已删除对象。
      const resumeId: string = loaded.editNoteId === undefined ? '' : loaded.editNoteId;
      if (resumeId.length > 0) {
        const note: NoteItem | undefined = loaded.notes.find((item: NoteItem): boolean =>
          item.id === resumeId);
        if (note !== undefined) {
          this.editingNoteId = resumeId;
          this.editBaseRevision = loaded.editBaseRevision === undefined ? '' : loaded.editBaseRevision;
          this.draftTitle = loaded.editTitle;
          this.draftBody = loaded.editBody;
          this.dirty = loaded.editTitle !== note.title || loaded.editBody !== note.body;
        }
      }
      this.ready = true;
      this.error = '';
    } catch {
      if (generation === this.generation) {
        this.error = '读取失败，请重试';
      }
    } finally {
      if (generation === this.generation) {
        this.loading = false;
        this.notify();
      }
    }
  }

  private async commit(next: StoredData, message: string, apply: () => void): Promise<boolean> {
    if (!this.canWriteBusiness()) { return false; }
    next.version = 2;
    const raw: string = JSON.stringify(next);
    if (raw.length > MAX_WORKSPACE_BYTES || workspaceUtf8Bytes(raw) > MAX_WORKSPACE_BYTES) {
      return this.reject('存档超过8MiB空间预算，未修改原数据');
    }
    if (!validData(next)) { return this.reject('候选存档不一致，未写入'); }
    const generation: number = this.generation;
    this.busy = true;
    this.error = '';
    this.message = '';
    this.notify();
    try {
      const writing: Promise<void> = this.storage.write(raw);
      this.pendingWrites = writing.then((): void => {}, (): void => {});
      await writing;
      if (generation !== this.generation) { return false; }
      this.data = next;
      this.recycleRootChanged();
      this.durableCanonical = JSON.stringify(copyData(next));
      this.storedBytes = workspaceUtf8Bytes(raw);
      apply();
      this.message = message;
      return true;
    } catch (error) {
      if (generation === this.generation) {
        const knownBeforeEffect: boolean = error instanceof BusinessWriteError && !error.uncertain;
        this.error = knownBeforeEffect ? '保存失败，请重试' : '写入结果未确认，请先重新读取核对';
        if (!knownBeforeEffect) {
          this.recoveryRequired = true;
          this.recyclePlan = undefined;
          this.pendingData = copyData(next);
          this.pendingApply = apply;
          this.pendingMessage = message;
          this.pendingBefore = this.durableCanonical;
        }
      }
      return false;
    } finally {
      if (generation === this.generation) { this.busy = false; this.notify(); }
    }
  }

  async whenStorageIdle(): Promise<void> { await this.pendingWrites; }

  /** Reconcile an uncertain write against a fresh native read; never blindly replay it. */
  async recoverStorage(): Promise<boolean> {
    if (!this.recoveryRequired) { return this.ready; }
    const context: common.ApplicationContext | undefined = this.context;
    const pending: StoredData | undefined = this.pendingData;
    if (context === undefined || pending === undefined || this.busy) { return false; }
    const generation: number = this.generation;
    this.busy = true;
    this.notify();
    try {
      await this.pendingWrites;
      if (generation !== this.generation) { return false; }
      const raw: string = await this.storage.reload(context);
      const loaded: StoredData = decodeBusinessDocument(raw);
      if (generation !== this.generation) { return false; }
      const canonical: string = JSON.stringify(loaded);
      if (canonical === JSON.stringify(copyData(pending))) {
        const apply: (() => void) | undefined = this.pendingApply;
        const message: string = this.pendingMessage;
        this.data = loaded;
        this.recycleRootChanged();
        this.durableCanonical = canonical;
        this.storedBytes = workspaceUtf8Bytes(raw);
        if (apply !== undefined) { apply(); }
        this.clearPendingRecovery();
        this.error = '';
        this.message = `${message}（已重新读取确认）`;
        return true;
      }
      if (canonical === this.pendingBefore) {
        this.recycleRootChanged();
        this.durableCanonical = canonical;
        this.clearPendingRecovery();
        this.error = '';
        this.message = '上次写入未生效，可重新操作';
        if (this.lastRecycleBatchResult.requiresRecovery) {
          this.lastRecycleBatchResult.requiresRecovery = false;
          this.lastRecycleBatchResult.message = this.message;
        }
        return true;
      }
      this.error = '存储出现其它更改，未覆盖；请保留当前编辑并核对';
      return false;
    } catch (_) {
      if (generation === this.generation) { this.error = '重新读取失败，仍禁止重复写入'; }
      return false;
    } finally {
      if (generation === this.generation) { this.busy = false; this.notify(); }
    }
  }

  private recycleRootChanged(): void {
    this.rootRevision++;
    this.recyclePlan = undefined;
  }

  private clearPendingRecovery(): void {
    this.recoveryRequired = false;
    this.pendingData = undefined;
    this.pendingApply = undefined;
    this.pendingMessage = '';
    this.pendingBefore = '';
  }

  private updateDraft(): void {
    const original: NoteItem | undefined = this.data.notes.find((item: NoteItem) => item.id === this.editingNoteId);
    const title: string = original === undefined ? this.data.draftTitle : original.title;
    const body: string = original === undefined ? this.data.draftBody : original.body;
    this.dirty = this.draftTitle !== title || this.draftBody !== body;
    this.error = '';
    this.message = '';
    this.notify();
  }

  private reject(message: string): boolean {
    this.error = message;
    this.message = '';
    this.notify();
    return false;
  }

  private notify(): void {
    this.listeners.forEach((listener: () => void) => listener());
  }
}

export const businessStore: BusinessStore = new BusinessStore();
