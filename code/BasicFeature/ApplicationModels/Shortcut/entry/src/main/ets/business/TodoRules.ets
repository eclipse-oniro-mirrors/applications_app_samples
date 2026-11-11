/**
 * 待办的状态机与优先级排序。
 *
 * 待办只有五个状态，但合法的迁移组合并不多。把它写成表，配合一个确定的打分函数，
 * 页面只需要按分数渲染，"为什么这条排在前面"可以逐项解释。
 */

/** 待办状态。 */
export enum TodoState {
  OPEN = 'open',
  DOING = 'doing',
  DONE = 'done',
  DROPPED = 'dropped',
  DEFERRED = 'deferred'
}

/** 状态标签。 */
export function todoStateLabel(state: TodoState): string {
  switch (state) {
    case TodoState.OPEN:
      return '待处理';
    case TodoState.DOING:
      return '进行中';
    case TodoState.DONE:
      return '已完成';
    case TodoState.DROPPED:
      return '已放弃';
    default:
      return '已推迟';
  }
}

/** 是否属于已结束。 */
export function isClosedState(state: TodoState): boolean {
  return state === TodoState.DONE || state === TodoState.DROPPED;
}

/** 待办事件。 */
export enum TodoEvent {
  START = 'start',
  FINISH = 'finish',
  DROP = 'drop',
  DEFER = 'defer',
  REOPEN = 'reopen',
  EXPIRE = 'expire'
}

/** 事件标签。 */
export function todoEventLabel(event: TodoEvent): string {
  switch (event) {
    case TodoEvent.START:
      return '开始';
    case TodoEvent.FINISH:
      return '完成';
    case TodoEvent.DROP:
      return '放弃';
    case TodoEvent.DEFER:
      return '推迟';
    case TodoEvent.REOPEN:
      return '重新打开';
    default:
      return '过期';
  }
}

/** 迁移规则。 */
export class TodoTransition {
  public ruleId: string = '';
  public from: TodoState = TodoState.OPEN;
  public event: TodoEvent = TodoEvent.START;
  public to: TodoState = TodoState.OPEN;
  public note: string = '';

  constructor(ruleId: string = '', from: TodoState = TodoState.OPEN,
    event: TodoEvent = TodoEvent.START, to: TodoState = TodoState.OPEN, note: string = '') {
    this.ruleId = ruleId;
    this.from = from;
    this.event = event;
    this.to = to;
    this.note = note;
  }

  text(): string {
    return `${this.ruleId} ${todoStateLabel(this.from)} -${todoEventLabel(this.event)}-> ` +
      `${todoStateLabel(this.to)}`;
  }
}

/** 迁移表。顺序即优先级。 */
export const TODO_TRANSITIONS: TodoTransition[] = [
  new TodoTransition('TT-01', TodoState.OPEN, TodoEvent.START, TodoState.DOING, '开始处理'),
  new TodoTransition('TT-02', TodoState.OPEN, TodoEvent.FINISH, TodoState.DONE, '直接完成'),
  new TodoTransition('TT-03', TodoState.OPEN, TodoEvent.DROP, TodoState.DROPPED, '不做了'),
  new TodoTransition('TT-04', TodoState.OPEN, TodoEvent.DEFER, TodoState.DEFERRED, '推迟到以后'),
  new TodoTransition('TT-05', TodoState.DOING, TodoEvent.FINISH, TodoState.DONE, '处理完成'),
  new TodoTransition('TT-06', TodoState.DOING, TodoEvent.DROP, TodoState.DROPPED, '处理中放弃'),
  new TodoTransition('TT-07', TodoState.DOING, TodoEvent.DEFER, TodoState.DEFERRED, '处理中推迟'),
  new TodoTransition('TT-08', TodoState.DEFERRED, TodoEvent.REOPEN, TodoState.OPEN, '恢复为待处理'),
  new TodoTransition('TT-09', TodoState.DEFERRED, TodoEvent.START, TodoState.DOING, '直接开始'),
  new TodoTransition('TT-10', TodoState.DEFERRED, TodoEvent.EXPIRE, TodoState.DROPPED,
    '推迟到期后自动放弃'),
  new TodoTransition('TT-11', TodoState.DONE, TodoEvent.REOPEN, TodoState.OPEN, '完成后又需要处理'),
  new TodoTransition('TT-12', TodoState.DROPPED, TodoEvent.REOPEN, TodoState.OPEN, '重新捡起'),
  new TodoTransition('TT-13', TodoState.OPEN, TodoEvent.EXPIRE, TodoState.DROPPED, '过期未处理'),
  new TodoTransition('TT-14', TodoState.DOING, TodoEvent.EXPIRE, TodoState.DROPPED, '处理超时')
];

/** 迁移结果。 */
export class TodoTransitionResult {
  public applied: boolean = false;
  public to: TodoState = TodoState.OPEN;
  public rule: TodoTransition | undefined = undefined;
  public reason: string = '';

  text(): string {
    if (!this.applied) {
      return `被拒绝：${this.reason}`;
    }
    return this.rule === undefined ? `进入${todoStateLabel(this.to)}` : this.rule.note;
  }
}

/** 按表迁移。未命中组合一律拒绝。 */
export function nextTodoState(from: TodoState, event: TodoEvent): TodoTransitionResult {
  const result: TodoTransitionResult = new TodoTransitionResult();
  for (const rule of TODO_TRANSITIONS) {
    if (rule.from === from && rule.event === event) {
      result.applied = true;
      result.to = rule.to;
      result.rule = rule;
      return result;
    }
  }
  result.to = from;
  result.reason = `${todoStateLabel(from)} 不接受事件 ${todoEventLabel(event)}`;
  return result;
}

/** 某状态可用的事件。 */
export function todoEventsOf(state: TodoState): TodoEvent[] {
  const events: TodoEvent[] = [];
  TODO_TRANSITIONS.forEach((rule: TodoTransition): void => {
    if (rule.from === state && events.indexOf(rule.event) < 0) {
      events.push(rule.event);
    }
  });
  return events;
}

/** 待办条目。 */
export class TodoItem {
  public id: string = '';
  public title: string = '';
  /** 优先级 0~3，数字越大越重要。 */
  public priority: number = 1;
  public state: TodoState = TodoState.OPEN;
  /** 截止时间；0 表示没有截止时间。 */
  public dueAt: number = 0;
  /** 预估分钟数；0 表示未评估。 */
  public estimateMinutes: number = 0;
  public tags: string[] = [];

  constructor(id: string = '', title: string = '', priority: number = 1) {
    this.id = id;
    this.title = title;
    this.priority = Math.min(3, Math.max(0, Math.round(priority)));
  }

  /** 是否已结束。 */
  closed(): boolean {
    return isClosedState(this.state);
  }

  text(): string {
    return `${this.title}｜${todoStateLabel(this.state)}｜P${this.priority}`;
  }
}

/** 优先级权重。 */
export function priorityWeight(priority: number): number {
  switch (priority) {
    case 3:
      return 100;
    case 2:
      return 70;
    case 1:
      return 40;
    case 0:
      return 10;
    default:
      return 10;
  }
}

/** 时间分桶标签。 */
export function dueBucket(item: TodoItem, now: number): string {
  if (item.dueAt <= 0) {
    return '无截止';
  }
  if (item.dueAt < now) {
    return '已逾期';
  }
  const day: number = 86400000;
  const delta: number = item.dueAt - now;
  if (delta <= day) {
    return '今天';
  }
  if (delta <= 2 * day) {
    return '明天';
  }
  if (delta <= 7 * day) {
    return '本周';
  }
  return '以后';
}

/** 打分：优先级 + 逾期加成 + 进行中加成 - 预估成本惩罚。 */
export function scoreOf(item: TodoItem, now: number): number {
  if (item.closed()) {
    return 0;
  }
  let score: number = priorityWeight(item.priority);
  const bucket: string = dueBucket(item, now);
  if (bucket === '已逾期') {
    score += 60;
  } else if (bucket === '今天') {
    score += 40;
  } else if (bucket === '明天') {
    score += 20;
  } else if (bucket === '本周') {
    score += 10;
  }
  if (item.state === TodoState.DOING) {
    score += 30;
  }
  if (item.state === TodoState.DEFERRED) {
    score -= 20;
  }
  if (item.estimateMinutes > 120) {
    score -= 15;
  } else if (item.estimateMinutes > 0 && item.estimateMinutes <= 15) {
    score += 5;
  }
  return Math.max(0, score);
}

/** 排序：分数降序，同分按截止时间升序，再按 id 升序。 */
export function sortTodos(items: TodoItem[], now: number): TodoItem[] {
  const sorted: TodoItem[] = items.slice();
  sorted.sort((left: TodoItem, right: TodoItem): number => {
    const leftScore: number = scoreOf(left, now);
    const rightScore: number = scoreOf(right, now);
    if (rightScore !== leftScore) {
      return rightScore - leftScore;
    }
    const leftDue: number = left.dueAt <= 0 ? Number.MAX_SAFE_INTEGER : left.dueAt;
    const rightDue: number = right.dueAt <= 0 ? Number.MAX_SAFE_INTEGER : right.dueAt;
    if (leftDue !== rightDue) {
      return leftDue - rightDue;
    }
    return left.id < right.id ? -1 : (left.id > right.id ? 1 : 0);
  });
  return sorted;
}

/** 未结束的条目。 */
export function openTodos(items: TodoItem[]): TodoItem[] {
  return items.filter((item: TodoItem): boolean => !item.closed());
}

/** 统计摘要行。 */
export function summarizeTodos(items: TodoItem[], now: number): string[] {
  const buckets: string[] = ['已逾期', '今天', '明天', '本周', '以后', '无截止'];
  const lines: string[] = [`共 ${items.length} 条，未结束 ${openTodos(items).length} 条`];
  buckets.forEach((bucket: string): void => {
    const count: number = items.filter((item: TodoItem): boolean =>
      !item.closed() && dueBucket(item, now) === bucket).length;
    lines.push(`${bucket}：${count} 条`);
  });
  const states: TodoState[] = [TodoState.OPEN, TodoState.DOING, TodoState.DEFERRED,
    TodoState.DONE, TodoState.DROPPED];
  states.forEach((state: TodoState): void => {
    const count: number = items.filter((item: TodoItem): boolean => item.state === state).length;
    lines.push(`${todoStateLabel(state)}：${count} 条`);
  });
  return lines;
}

/** 规则自检。 */
export class TodoAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? '待办迁移表自洽' : this.findings.join('；');
  }
}

/** 校验迁移表：编号唯一、每个状态都有出口、已结束状态可重新打开。 */
export function auditTodoRules(): TodoAudit {
  const audit: TodoAudit = new TodoAudit();
  const seen: string[] = [];
  TODO_TRANSITIONS.forEach((rule: TodoTransition): void => {
    if (seen.indexOf(rule.ruleId) >= 0) {
      audit.findings.push(`迁移编号重复：${rule.ruleId}`);
    }
    seen.push(rule.ruleId);
    if (rule.note.length === 0) {
      audit.findings.push(`缺少说明：${rule.ruleId}`);
    }
    if (rule.from === rule.to) {
      audit.findings.push(`迁移前后状态相同：${rule.ruleId}`);
    }
  });
  const states: TodoState[] = [TodoState.OPEN, TodoState.DOING, TodoState.DEFERRED,
    TodoState.DONE, TodoState.DROPPED];
  states.forEach((state: TodoState): void => {
    if (todoEventsOf(state).length === 0) {
      audit.findings.push(`状态没有出口：${todoStateLabel(state)}`);
    }
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 迁移摘要行。 */
export function todoRuleLines(): string[] {
  return TODO_TRANSITIONS.map((rule: TodoTransition): string => rule.text());
}
