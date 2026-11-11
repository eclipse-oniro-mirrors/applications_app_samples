/**
 * 待办的截止、延期与重复规则。
 *
 * 待办示例原来只有"完成/未完成"两个状态。真实用起来至少要回答四个问题：
 * 什么时候到期、过期多久算逾期、延期一次之后还逾期吗、重复任务下一次是什么时候。
 *
 * 本模块刻意不引入系统通知与后台准点提醒：所有判断都在应用内按当前时间计算，
 * 页面打开时展示结论，不在后台唤醒。这样既不会虚构系统能力，
 * 也能保证同一份数据在任何时刻都能算出同一个结果。
 */

/** 优先级。 */
export enum Priority {
  HIGH = '高',
  NORMAL = '普通',
  LOW = '低'
}

/** 重复方式。 */
export enum RepeatKind {
  NONE = '不重复',
  DAILY = '每天',
  WEEKDAY = '工作日',
  WEEKLY = '每周',
  MONTHLY = '每月'
}

/** 逾期判定。 */
export enum DueState {
  NO_DUE = '无截止',
  FUTURE = '未到期',
  DUE_SOON = '即将到期',
  OVERDUE = '已逾期',
  DONE = '已完成'
}

/** 一条到期规则。 */
export class DueRule {
  public code: string = '';
  public condition: string = '';
  public state: DueState = DueState.NO_DUE;
  public note: string = '';

  constructor(code: string = '', condition: string = '', state: DueState = DueState.NO_DUE,
    note: string = '') {
    this.code = code;
    this.condition = condition;
    this.state = state;
    this.note = note;
  }

  describe(): string {
    return `${this.code}｜${this.condition} → ${this.state as string}｜${this.note}`;
  }
}

/** 即将到期的窗口：24 小时。 */
export const DUE_SOON_MS: number = 24 * 60 * 60 * 1000;

/**
 * 到期规则表。
 *
 * 顺序即判定顺序：已完成优先于一切，其余按剩余时间由近到远。
 */
export const DUE_RULES: DueRule[] = [
  new DueRule('DU-01', '已完成', DueState.DONE, '完成态不再提示逾期'),
  new DueRule('DU-02', '没有截止时间', DueState.NO_DUE, '无截止的待办不参与逾期排序'),
  new DueRule('DU-03', '截止时间早于当前时间', DueState.OVERDUE, '逾期按绝对值展示天数'),
  new DueRule('DU-04', '截止时间在 24 小时内', DueState.DUE_SOON, '进入即将到期分组'),
  new DueRule('DU-05', '截止时间晚于 24 小时', DueState.FUTURE, '正常展示'),
  new DueRule('DU-06', '延期后仍未到期', DueState.FUTURE, '延期只是一次新的截止时间'),
  new DueRule('DU-07', '延期后仍逾期', DueState.OVERDUE, '延期不掩盖已发生的逾期'),
  new DueRule('DU-08', '重复任务本次已完成', DueState.DONE, '本次完成，下一次按重复规则生成'),
  new DueRule('DU-09', '重复任务落入例外日期', DueState.NO_DUE, '例外日跳过，顺延到下一个有效日'),
  new DueRule('DU-10', '已完成但被重新打开', DueState.FUTURE, '重新打开后按当前时间重算')
];

/** 一个待办的到期信息。 */
export class TodoDue {
  /** 截止时间；0 表示无截止。 */
  public dueAt: number = 0;
  public priority: Priority = Priority.NORMAL;
  /** 已完成。 */
  public done: boolean = false;
  /** 重复方式。 */
  public repeat: RepeatKind = RepeatKind.NONE;
  /** 最近一次延期时间；0 表示未延期。 */
  public deferredAt: number = 0;
  /** 例外日期（本地日期键，形如 2024-05-01）。 */
  public exceptions: string[] = [];

  constructor(dueAt: number = 0, priority: Priority = Priority.NORMAL) {
    this.dueAt = dueAt;
    this.priority = priority;
  }

  /** 是否无截止。 */
  undated(): boolean {
    return this.dueAt <= 0;
  }
}

/** 本地日期键：把毫秒时间戳截断到天。 */
export function dateKeyOf(millis: number): string {
  const date: Date = new Date(millis);
  const month: number = date.getMonth() + 1;
  const day: number = date.getDate();
  const monthText: string = month < 10 ? `0${month}` : `${month}`;
  const dayText: string = day < 10 ? `0${day}` : `${day}`;
  return `${date.getFullYear()}-${monthText}-${dayText}`;
}

/** 判定到期状态。 */
export function dueStateOf(due: TodoDue, now: number): DueState {
  if (due.done) {
    return DueState.DONE;
  }
  if (due.undated()) {
    return DueState.NO_DUE;
  }
  const remain: number = due.dueAt - now;
  if (remain < 0) {
    return DueState.OVERDUE;
  }
  if (remain <= DUE_SOON_MS) {
    return DueState.DUE_SOON;
  }
  return DueState.FUTURE;
}

/** 逾期天数；未逾期返回 0。 */
export function overdueDays(due: TodoDue, now: number): number {
  if (dueStateOf(due, now) !== DueState.OVERDUE) {
    return 0;
  }
  return Math.floor((now - due.dueAt) / 86400000);
}

/** 延期若干天：只改截止时间，不改优先级。 */
export function defer(due: TodoDue, days: number, now: number): boolean {
  if (days <= 0 || due.undated()) {
    return false;
  }
  due.dueAt = due.dueAt + days * 86400000;
  due.deferredAt = now;
  return true;
}

/** 优先级排序权重。 */
export function priorityWeight(priority: Priority): number {
  if (priority === Priority.HIGH) {
    return 0;
  }
  if (priority === Priority.LOW) {
    return 2;
  }
  return 1;
}

/**
 * 计算下一次到期时间。
 *
 * 只在应用内按日历推进；落入例外日时继续顺延，最多推进 366 次，
 * 避免例外日把某个重复方式填满后陷入死循环。
 */
export function nextOccurrence(due: TodoDue, from: number): number {
  if (due.repeat === RepeatKind.NONE) {
    return 0;
  }
  let candidate: number = from;
  for (let guard = 0; guard < 366; guard++) {
    const next: number = advanceOnce(candidate, due.repeat);
    if (next <= candidate) {
      return 0;
    }
    candidate = next;
    if (due.exceptions.indexOf(dateKeyOf(candidate)) < 0) {
      return candidate;
    }
  }
  return 0;
}

function advanceOnce(from: number, repeat: RepeatKind): number {
  const date: Date = new Date(from);
  if (repeat === RepeatKind.DAILY) {
    return from + 86400000;
  }
  if (repeat === RepeatKind.WEEKLY) {
    return from + 7 * 86400000;
  }
  if (repeat === RepeatKind.MONTHLY) {
    const year: number = date.getFullYear();
    const month: number = date.getMonth() + 1;
    const day: number = date.getDate();
    const target: Date = new Date(year, month, day);
    return target.getTime();
  }
  if (repeat === RepeatKind.WEEKDAY) {
    let cursor: number = from + 86400000;
    for (let guard = 0; guard < 7; guard++) {
      const weekday: number = new Date(cursor).getDay();
      if (weekday !== 0 && weekday !== 6) {
        return cursor;
      }
      cursor += 86400000;
    }
    return 0;
  }
  return 0;
}

/** 把一批待办按到期状态分组。 */
export class DueBuckets {
  public overdue: TodoDue[] = [];
  public soon: TodoDue[] = [];
  public future: TodoDue[] = [];
  public undated: TodoDue[] = [];
  public done: TodoDue[] = [];

  /** 总数。 */
  size(): number {
    return this.overdue.length + this.soon.length + this.future.length + this.undated.length + this.done.length;
  }

  describe(): string {
    return `逾期 ${this.overdue.length}｜即将到期 ${this.soon.length}｜未到期 ${this.future.length}｜` +
      `无截止 ${this.undated.length}｜已完成 ${this.done.length}`;
  }
}

/** 分组。 */
export function bucketize(items: TodoDue[], now: number): DueBuckets {
  const buckets: DueBuckets = new DueBuckets();
  items.forEach((item: TodoDue): void => {
    const state: DueState = dueStateOf(item, now);
    if (state === DueState.DONE) {
      buckets.done.push(item);
    } else if (state === DueState.OVERDUE) {
      buckets.overdue.push(item);
    } else if (state === DueState.DUE_SOON) {
      buckets.soon.push(item);
    } else if (state === DueState.NO_DUE) {
      buckets.undated.push(item);
    } else {
      buckets.future.push(item);
    }
  });
  return buckets;
}

/** 规则表展示行。 */
export function dueLines(): string[] {
  return DUE_RULES.map((rule: DueRule): string => rule.describe());
}

/** 一句话摘要。 */
export function dueSummary(items: TodoDue[], now: number): string {
  if (items.length === 0) {
    return '暂无待办';
  }
  return bucketize(items, now).describe();
}

/** 重复方式展示。 */
export function repeatText(repeat: RepeatKind, due: TodoDue, now: number): string {
  if (repeat === RepeatKind.NONE) {
    return '不重复';
  }
  const next: number = nextOccurrence(due, now);
  return next <= 0 ? `${repeat as string}（下次未定）` : `${repeat as string}（下次 ${dateKeyOf(next)}）`;
}
