/**
 * 笔记回收站与保存基线。
 *
 * 笔记业务真正的风险不在"写不进去"，而在"把别人的新内容盖掉"。用户在三处编辑同一篇笔记：
 * 本机、接续过来的对端、以及上次保存时留下的基线。只有同时知道这三者的修订号，
 * 才能判断"这次保存是安全的覆盖"还是"会丢掉对端改动"。
 *
 * 本模块把保存判定与回收站规则分开写：
 *   - 保存判定只看三个修订号，结果只有"直接保存/另存分支/需确认"三种；
 *   - 回收站只负责保留、恢复与清理，不参与内容判断。
 */

/** 保存判定。 */
export enum SaveOutcome {
  SAFE = '可直接保存',
  BRANCH = '另存为新分支',
  CONFIRM = '需用户确认',
  BLOCKED = '保存被阻止'
}

/** 一条保存规则。 */
export class SaveRule {
  public code: string = '';
  public condition: string = '';
  public outcome: SaveOutcome = SaveOutcome.SAFE;
  public note: string = '';

  constructor(code: string = '', condition: string = '', outcome: SaveOutcome = SaveOutcome.SAFE,
    note: string = '') {
    this.code = code;
    this.condition = condition;
    this.outcome = outcome;
    this.note = note;
  }

  describe(): string {
    return `${this.code}｜${this.condition} → ${this.outcome as string}｜${this.note}`;
  }
}

/**
 * 保存规则表。
 *
 * 修订号语义：local 是本机当前修订，remote 是对端/磁盘当前修订，baseline 是上次成功保存的修订。
 * 三者相等表示无变化；local > baseline 且 local == remote 表示双方改成了同一版本。
 */
export const SAVE_RULES: SaveRule[] = [
  new SaveRule('SV-01', '三方修订号相同', SaveOutcome.SAFE, '没有新变化，保存不改变内容'),
  new SaveRule('SV-02', '只有本机前进', SaveOutcome.SAFE, '常规保存'),
  new SaveRule('SV-03', '只有对端前进', SaveOutcome.CONFIRM, '本机内容已过期，保存会覆盖对端'),
  new SaveRule('SV-04', '双方都前进且修订号相同', SaveOutcome.SAFE, '收敛到同一版本'),
  new SaveRule('SV-05', '双方都前进且修订号不同', SaveOutcome.BRANCH, '另存为新分支，两侧都保留'),
  new SaveRule('SV-06', '对端修订号低于基线', SaveOutcome.CONFIRM, '对端可能回滚过，保存前需确认'),
  new SaveRule('SV-07', '本机无修订号', SaveOutcome.BLOCKED, '缺少本机修订号，不允许写入'),
  new SaveRule('SV-08', '存在未结束的接续恢复', SaveOutcome.BLOCKED, '恢复在途时写入会产生不确定结果'),
  new SaveRule('SV-09', '笔记已在回收站', SaveOutcome.BLOCKED, '回收站内笔记不可直接保存'),
  new SaveRule('SV-10', '上次写入结果不确定', SaveOutcome.CONFIRM, '需先读回磁盘再决定')
];

/** 保存判定输入。 */
export class SaveInput {
  public baselineRevision: number = 0;
  public localRevision: number = 0;
  public remoteRevision: number = 0;
  /** 是否有未结束的恢复。 */
  public recoveryActive: boolean = false;
  /** 是否在回收站。 */
  public trashed: boolean = false;
  /** 上次写入是否不确定。 */
  public writeUncertain: boolean = false;
}

/** 保存判定结果。 */
export class SaveDecision {
  public code: string = '';
  public outcome: SaveOutcome = SaveOutcome.SAFE;
  public message: string = '';

  constructor(code: string = '', outcome: SaveOutcome = SaveOutcome.SAFE, message: string = '') {
    this.code = code;
    this.outcome = outcome;
    this.message = message;
  }

  /** 是否允许继续写入。 */
  writable(): boolean {
    return this.outcome === SaveOutcome.SAFE;
  }

  describe(): string {
    return `${this.code}｜${this.outcome as string}｜${this.message}`;
  }
}

function ruleOf(code: string): SaveRule | undefined {
  return SAVE_RULES.find((rule: SaveRule): boolean => rule.code === code);
}

function decisionOf(code: string): SaveDecision {
  const rule = ruleOf(code);
  if (rule === undefined) {
    return new SaveDecision('SV-01', SaveOutcome.SAFE, '');
  }
  return new SaveDecision(rule.code, rule.outcome, rule.note);
}

/**
 * 判定一次保存。
 *
 * 前置阻断优先（恢复在途、回收站、无修订号），然后按三方修订号关系判定。
 * 阻断类不返回"需确认"，因为确认也无法保证写入结果。
 */
export function decideSave(input: SaveInput): SaveDecision {
  if (input.recoveryActive) {
    return decisionOf('SV-08');
  }
  if (input.trashed) {
    return decisionOf('SV-09');
  }
  if (input.localRevision <= 0) {
    return decisionOf('SV-07');
  }
  if (input.writeUncertain) {
    return decisionOf('SV-10');
  }
  const localAhead: boolean = input.localRevision > input.baselineRevision;
  const remoteAhead: boolean = input.remoteRevision > input.baselineRevision;
  if (input.remoteRevision < input.baselineRevision) {
    return decisionOf('SV-06');
  }
  if (!localAhead && !remoteAhead) {
    return decisionOf('SV-01');
  }
  if (localAhead && !remoteAhead) {
    return decisionOf('SV-02');
  }
  if (!localAhead && remoteAhead) {
    return decisionOf('SV-03');
  }
  if (input.localRevision === input.remoteRevision) {
    return decisionOf('SV-04');
  }
  return decisionOf('SV-05');
}

/** 回收站状态。 */
export enum TrashState {
  ACTIVE = '正常',
  TRASHED = '回收站',
  PURGED = '已清除'
}

/** 回收站条目。 */
export class TrashEntry {
  public noteId: string = '';
  public title: string = '';
  public state: TrashState = TrashState.TRASHED;
  /** 进入回收站的时间。 */
  public trashedAt: number = 0;
  /** 进入回收站时的修订号。 */
  public revision: number = 0;
  /** 删除来源说明。 */
  public origin: string = '';

  constructor(noteId: string = '', title: string = '') {
    this.noteId = noteId;
    this.title = title;
  }

  /** 是否还在保留期内。 */
  restorable(now: number, retentionMillis: number): boolean {
    return this.state === TrashState.TRASHED && now - this.trashedAt <= retentionMillis;
  }

  describe(): string {
    return `${this.title}｜${this.state as string}｜修订 ${this.revision}｜` +
      `来源 ${this.origin.length === 0 ? '未记录' : this.origin}`;
  }
}

/** 保留天数。 */
export const TRASH_RETENTION_DAYS: number = 30;

/** 回收站。 */
export class TrashBin {
  private entries: TrashEntry[] = [];

  /** 移入回收站。 */
  trash(noteId: string, title: string, revision: number, now: number, origin: string): boolean {
    if (noteId.length === 0) {
      return false;
    }
    const existing = this.entries.find((entry: TrashEntry): boolean => entry.noteId === noteId);
    if (existing !== undefined) {
      existing.state = TrashState.TRASHED;
      existing.trashedAt = now;
      existing.revision = revision;
      existing.origin = origin;
      return true;
    }
    const entry: TrashEntry = new TrashEntry(noteId, title);
    entry.revision = revision;
    entry.trashedAt = now;
    entry.origin = origin;
    this.entries.push(entry);
    return true;
  }

  /** 恢复；超出保留期时拒绝。 */
  restore(noteId: string, now: number): boolean {
    const found = this.entries.find((entry: TrashEntry): boolean => entry.noteId === noteId);
    if (found === undefined || found.state !== TrashState.TRASHED) {
      return false;
    }
    if (!found.restorable(now, TRASH_RETENTION_DAYS * 86400000)) {
      return false;
    }
    found.state = TrashState.ACTIVE;
    return true;
  }

  /** 彻底清除；只能清除已在回收站且已过期的条目。 */
  purge(now: number): TrashEntry[] {
    const removed: TrashEntry[] = [];
    this.entries.forEach((entry: TrashEntry): void => {
      if (entry.state !== TrashState.TRASHED) {
        return;
      }
      if (now - entry.trashedAt <= TRASH_RETENTION_DAYS * 86400000) {
        return;
      }
      entry.state = TrashState.PURGED;
      removed.push(entry);
    });
    return removed;
  }

  /** 回收站内的条目。 */
  trashed(): TrashEntry[] {
    return this.entries.filter((entry: TrashEntry): boolean => entry.state === TrashState.TRASHED);
  }

  /** 条目总数（含已清除）。 */
  size(): number {
    return this.entries.length;
  }

  /** 查找。 */
  entryOf(noteId: string): TrashEntry | undefined {
    return this.entries.find((entry: TrashEntry): boolean => entry.noteId === noteId);
  }

  /** 是否在回收站。 */
  inTrash(noteId: string): boolean {
    const found = this.entryOf(noteId);
    return found !== undefined && found.state === TrashState.TRASHED;
  }
}

/** 规则表展示行。 */
export function saveLines(): string[] {
  return SAVE_RULES.map((rule: SaveRule): string => rule.describe());
}

/** 回收站展示行。 */
export function trashLines(bin: TrashBin, now: number): string[] {
  const lines: string[] = [];
  const items: TrashEntry[] = bin.trashed();
  if (items.length === 0) {
    lines.push('回收站为空');
    return lines;
  }
  lines.push(`回收站 ${items.length} 项｜保留 ${TRASH_RETENTION_DAYS} 天`);
  items.forEach((entry: TrashEntry): void => {
    const days: number = Math.floor((now - entry.trashedAt) / 86400000);
    const state: string = entry.restorable(now, TRASH_RETENTION_DAYS * 86400000) ? `可恢复（已存 ${days} 天）` : '已过期';
    lines.push(`${entry.describe()}｜${state}`);
  });
  return lines;
}

/** 一句话保存建议。 */
export function saveAdvice(decision: SaveDecision): string {
  if (decision.writable()) {
    return '可以保存';
  }
  if (decision.outcome === SaveOutcome.BRANCH) {
    return '建议另存为新分支，保留两侧内容';
  }
  return decision.message;
}
