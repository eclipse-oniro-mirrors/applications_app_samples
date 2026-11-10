/**
 * 接续冲突判定与合并策略。
 *
 * 同一文档可能在本机与对端同时被修改，接续时需要给出确定性的处理结果。
 * 这里把"什么情况用哪种策略"写成可枚举的规则表，合并动作由策略派生，
 * 不在页面里临时判断。
 */

import { PayloadData } from './PayloadCodec';

/** 冲突类型。 */
export enum ConflictKind {
  NONE = 'none',
  REMOTE_NEWER = 'remoteNewer',
  LOCAL_NEWER = 'localNewer',
  BOTH_CHANGED = 'bothChanged',
  REMOTE_ONLY = 'remoteOnly',
  LOCAL_ONLY = 'localOnly',
  UNKNOWN = 'unknown'
}

/** 冲突类型标签。 */
export function conflictLabel(kind: ConflictKind): string {
  switch (kind) {
    case ConflictKind.NONE:
      return '无冲突';
    case ConflictKind.REMOTE_NEWER:
      return '对端更新';
    case ConflictKind.LOCAL_NEWER:
      return '本机更新';
    case ConflictKind.BOTH_CHANGED:
      return '两端都改过';
    case ConflictKind.REMOTE_ONLY:
      return '仅对端有内容';
    case ConflictKind.LOCAL_ONLY:
      return '仅本机有内容';
    default:
      return '无法判断';
  }
}

/** 处理策略。 */
export enum Resolution {
  KEEP_LOCAL = 'keepLocal',
  KEEP_REMOTE = 'keepRemote',
  MERGE_PREFER_LOCAL = 'mergePreferLocal',
  MERGE_PREFER_REMOTE = 'mergePreferRemote',
  APPEND_REMOTE = 'appendRemote',
  ASK_USER = 'askUser',
  DISCARD_REMOTE = 'discardRemote'
}

/** 策略标签。 */
export function resolutionLabel(resolution: Resolution): string {
  switch (resolution) {
    case Resolution.KEEP_LOCAL:
      return '保留本机';
    case Resolution.KEEP_REMOTE:
      return '采用对端';
    case Resolution.MERGE_PREFER_LOCAL:
      return '合并并偏向本机';
    case Resolution.MERGE_PREFER_REMOTE:
      return '合并并偏向对端';
    case Resolution.APPEND_REMOTE:
      return '追加对端内容';
    case Resolution.ASK_USER:
      return '询问用户';
    default:
      return '丢弃对端';
  }
}

/** 是否需要用户确认。 */
export function needsConfirmation(resolution: Resolution): boolean {
  return resolution === Resolution.ASK_USER || resolution === Resolution.MERGE_PREFER_LOCAL ||
    resolution === Resolution.MERGE_PREFER_REMOTE;
}

/** 是否会造成内容丢失。 */
export function losesContent(resolution: Resolution): boolean {
  return resolution === Resolution.DISCARD_REMOTE || resolution === Resolution.KEEP_REMOTE ||
    resolution === Resolution.KEEP_LOCAL;
}

/** 冲突判断输入。 */
export class ConflictInput {
  local: PayloadData = new PayloadData();
  remote: PayloadData = new PayloadData();
  /** 本机是否有未提交改动。 */
  localDirty: boolean = false;
  /** 对端是否是本次接续带来的改动。 */
  remoteDirty: boolean = false;
  /** 是否存在对端载荷。 */
  remotePresent: boolean = true;

  constructor(local: PayloadData = new PayloadData(), remote: PayloadData = new PayloadData()) {
    this.local = local;
    this.remote = remote;
  }
}

/** 冲突类型判定。 */
export function classify(input: ConflictInput): ConflictKind {
  if (!input.remotePresent) {
    return ConflictKind.NONE;
  }
  const localEmpty: boolean = input.local.bodyEmpty() && input.local.doc.length === 0;
  const remoteEmpty: boolean = input.remote.bodyEmpty() && input.remote.doc.length === 0;
  if (localEmpty && remoteEmpty) {
    return ConflictKind.NONE;
  }
  if (localEmpty) {
    return ConflictKind.REMOTE_ONLY;
  }
  if (remoteEmpty) {
    return ConflictKind.LOCAL_ONLY;
  }
  if (input.local.doc.length > 0 && input.remote.doc.length > 0 &&
    input.local.doc !== input.remote.doc) {
    return ConflictKind.UNKNOWN;
  }
  if (input.localDirty && input.remoteDirty) {
    return ConflictKind.BOTH_CHANGED;
  }
  if (input.remote.rev > input.local.rev) {
    return ConflictKind.REMOTE_NEWER;
  }
  if (input.remote.rev < input.local.rev) {
    return ConflictKind.LOCAL_NEWER;
  }
  if (input.remote.body !== input.local.body) {
    return ConflictKind.BOTH_CHANGED;
  }
  return ConflictKind.NONE;
}

/** 单条冲突规则。 */
export class ConflictRule {
  ruleId: string = '';
  kind: ConflictKind = ConflictKind.NONE;
  localDirty: boolean = false;
  remoteDirty: boolean = false;
  resolution: Resolution = Resolution.KEEP_LOCAL;
  reason: string = '';

  constructor(ruleId: string = '', kind: ConflictKind = ConflictKind.NONE,
    localDirty: boolean = false, remoteDirty: boolean = false,
    resolution: Resolution = Resolution.KEEP_LOCAL, reason: string = '') {
    this.ruleId = ruleId;
    this.kind = kind;
    this.localDirty = localDirty;
    this.remoteDirty = remoteDirty;
    this.resolution = resolution;
    this.reason = reason;
  }

  /** 是否命中。上下两档 dirty 用布尔精确匹配。 */
  matches(kind: ConflictKind, localDirty: boolean, remoteDirty: boolean): boolean {
    return this.kind === kind && this.localDirty === localDirty &&
      this.remoteDirty === remoteDirty;
  }

  text(): string {
    return `${this.ruleId} ${conflictLabel(this.kind)}｜本地${this.localDirty ? '脏' : '净'}` +
      `｜远端${this.remoteDirty ? '脏' : '净'} -> ${resolutionLabel(this.resolution)}`;
  }
}

/**
 * 规则表。
 *
 * 顺序即优先级：先命中先返回。脏标记组合比版本号更可信，因此排在前面。
 */
export const CONFLICT_RULES: ConflictRule[] = [
  new ConflictRule('CF-01', ConflictKind.NONE, false, false, Resolution.KEEP_LOCAL,
    '两端一致，保持本机内容不变'),
  new ConflictRule('CF-02', ConflictKind.NONE, true, false, Resolution.KEEP_LOCAL,
    '本机有未提交改动，对端无变化，保留本机'),
  new ConflictRule('CF-03', ConflictKind.NONE, false, true, Resolution.KEEP_REMOTE,
    '对端带来新内容，采用对端'),
  new ConflictRule('CF-04', ConflictKind.NONE, true, true, Resolution.ASK_USER,
    '两端都标记改动但内容一致，交给用户确认'),
  new ConflictRule('CF-05', ConflictKind.REMOTE_ONLY, false, false, Resolution.KEEP_REMOTE,
    '本机为空，直接采用对端'),
  new ConflictRule('CF-06', ConflictKind.REMOTE_ONLY, true, false, Resolution.KEEP_REMOTE,
    '本机被清空但对端有内容，采用对端'),
  new ConflictRule('CF-07', ConflictKind.REMOTE_ONLY, false, true, Resolution.KEEP_REMOTE,
    '本机为空且对端有新内容，采用对端'),
  new ConflictRule('CF-08', ConflictKind.REMOTE_ONLY, true, true, Resolution.MERGE_PREFER_REMOTE,
    '两端都有改动且本机为空，合并并偏向对端'),
  new ConflictRule('CF-09', ConflictKind.LOCAL_ONLY, false, false, Resolution.KEEP_LOCAL,
    '对端为空，保留本机'),
  new ConflictRule('CF-10', ConflictKind.LOCAL_ONLY, true, false, Resolution.KEEP_LOCAL,
    '对端为空且本机有改动，保留本机'),
  new ConflictRule('CF-11', ConflictKind.LOCAL_ONLY, false, true, Resolution.MERGE_PREFER_LOCAL,
    '对端送来空载荷，合并并偏向本机'),
  new ConflictRule('CF-12', ConflictKind.LOCAL_ONLY, true, true, Resolution.MERGE_PREFER_LOCAL,
    '两端都标记改动但对端为空，合并并偏向本机'),
  new ConflictRule('CF-13', ConflictKind.REMOTE_NEWER, false, false, Resolution.KEEP_REMOTE,
    '对端修订号更高且本机无改动，采用对端'),
  new ConflictRule('CF-14', ConflictKind.REMOTE_NEWER, true, false, Resolution.MERGE_PREFER_LOCAL,
    '对端修订号更高但本机有未提交改动，合并并偏向本机'),
  new ConflictRule('CF-15', ConflictKind.REMOTE_NEWER, false, true, Resolution.KEEP_REMOTE,
    '对端修订号更高且确实是新改动，采用对端'),
  new ConflictRule('CF-16', ConflictKind.REMOTE_NEWER, true, true, Resolution.ASK_USER,
    '两端都有改动且对端修订号更高，交给用户确认'),
  new ConflictRule('CF-17', ConflictKind.LOCAL_NEWER, false, false, Resolution.KEEP_LOCAL,
    '本机修订号更高，保留本机'),
  new ConflictRule('CF-18', ConflictKind.LOCAL_NEWER, true, false, Resolution.KEEP_LOCAL,
    '本机修订号更高且有改动，保留本机'),
  new ConflictRule('CF-19', ConflictKind.LOCAL_NEWER, false, true, Resolution.MERGE_PREFER_REMOTE,
    '本机修订号更高但对端带来新改动，合并并偏向对端'),
  new ConflictRule('CF-20', ConflictKind.LOCAL_NEWER, true, true, Resolution.ASK_USER,
    '两端都改过且本机修订号更高，交给用户确认'),
  new ConflictRule('CF-21', ConflictKind.BOTH_CHANGED, false, false, Resolution.ASK_USER,
    '内容不同但都没有改动标记，交给用户确认'),
  new ConflictRule('CF-22', ConflictKind.BOTH_CHANGED, true, false, Resolution.MERGE_PREFER_LOCAL,
    '仅本机改动，合并并偏向本机'),
  new ConflictRule('CF-23', ConflictKind.BOTH_CHANGED, false, true, Resolution.MERGE_PREFER_REMOTE,
    '仅对端改动，合并并偏向对端'),
  new ConflictRule('CF-24', ConflictKind.BOTH_CHANGED, true, true, Resolution.ASK_USER,
    '两端都改过，必须确认'),
  new ConflictRule('CF-25', ConflictKind.UNKNOWN, true, true, Resolution.ASK_USER,
    '文档标识不一致且两端都改过，交给用户确认'),
  new ConflictRule('CF-26', ConflictKind.UNKNOWN, false, true, Resolution.DISCARD_REMOTE,
    '文档标识不一致，丢弃对端以免覆盖本机'),
  new ConflictRule('CF-27', ConflictKind.UNKNOWN, true, false, Resolution.KEEP_LOCAL,
    '文档标识不一致但本机有改动，保留本机'),
  new ConflictRule('CF-28', ConflictKind.UNKNOWN, false, false, Resolution.ASK_USER,
    '文档标识不一致，交给用户确认')
];

/** 决策结果。 */
export class ConflictDecision {
  kind: ConflictKind = ConflictKind.NONE;
  resolution: Resolution = Resolution.KEEP_LOCAL;
  rule: ConflictRule | undefined = undefined;

  /** 是否命中了规则。 */
  matched(): boolean {
    return this.rule !== undefined;
  }

  /** 一句话说明。 */
  text(): string {
    const ruleId: string = this.rule === undefined ? '未命中规则' : this.rule.ruleId;
    return `${conflictLabel(this.kind)} -> ${resolutionLabel(this.resolution)}（${ruleId}）`;
  }

  /** 需要用户确认。 */
  confirm(): boolean {
    return needsConfirmation(this.resolution);
  }
}

/** 按规则表决策。未命中时回退到"询问用户"，绝不静默覆盖。 */
export function decide(input: ConflictInput): ConflictDecision {
  const decision: ConflictDecision = new ConflictDecision();
  decision.kind = classify(input);
  for (const rule of CONFLICT_RULES) {
    if (rule.matches(decision.kind, input.localDirty, input.remoteDirty)) {
      decision.rule = rule;
      decision.resolution = rule.resolution;
      return decision;
    }
  }
  decision.resolution = Resolution.ASK_USER;
  return decision;
}

/** 合并结果。 */
export class MergeResult {
  data: PayloadData = new PayloadData();
  /** 实际使用的策略。 */
  resolution: Resolution = Resolution.KEEP_LOCAL;
  /** 合并说明。 */
  notes: string[] = [];

  summary(): string {
    return `${resolutionLabel(this.resolution)}｜${this.notes.length} 条说明`;
  }
}

/** 按行合并：去重后按"本机在前、对端在后"拼接。 */
function mergeLines(local: string, remote: string, preferLocal: boolean): string[] {
  const localLines: string[] = local.split('\n').filter((line: string): boolean =>
    line.trim().length > 0);
  const remoteLines: string[] = remote.split('\n').filter((line: string): boolean =>
    line.trim().length > 0);
  const merged: string[] = [];
  const push = (line: string): void => {
    if (merged.indexOf(line) < 0) {
      merged.push(line);
    }
  };
  if (preferLocal) {
    localLines.forEach(push);
    remoteLines.forEach(push);
  } else {
    remoteLines.forEach(push);
    localLines.forEach(push);
  }
  return merged;
}

/** 执行合并。 */
export function applyResolution(input: ConflictInput, decision: ConflictDecision): MergeResult {
  const result: MergeResult = new MergeResult();
  result.resolution = decision.resolution;
  switch (decision.resolution) {
    case Resolution.KEEP_LOCAL:
      result.data = input.local.clone();
      result.notes.push('保留本机内容');
      break;
    case Resolution.KEEP_REMOTE:
      result.data = input.remote.clone();
      result.notes.push('采用对端内容');
      break;
    case Resolution.DISCARD_REMOTE:
      result.data = input.local.clone();
      result.notes.push('对端内容已丢弃');
      break;
    case Resolution.APPEND_REMOTE:
      result.data = input.local.clone();
      result.data.body = `${input.local.body}\n${input.remote.body}`;
      result.notes.push('对端内容追加在末尾');
      break;
    case Resolution.MERGE_PREFER_LOCAL:
    case Resolution.MERGE_PREFER_REMOTE: {
      const preferLocal: boolean = decision.resolution === Resolution.MERGE_PREFER_LOCAL;
      const merged: string[] = mergeLines(input.local.body, input.remote.body, preferLocal);
      result.data = preferLocal ? input.local.clone() : input.remote.clone();
      result.data.body = merged.join('\n');
      result.data.rev = Math.max(input.local.rev, input.remote.rev);
      result.data.ck = decision.kind as string;
      result.notes.push(`合并去重后 ${merged.length} 行`);
      result.notes.push(preferLocal ? '本机在前' : '对端在前');
      break;
    }
    default:
      result.data = input.local.clone();
      result.notes.push('等待用户选择，暂保留本机');
      break;
  }
  return result;
}

/** 规则表自检。 */
export class ConflictAudit {
  ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? '冲突规则表自洽' : this.findings.join('；');
  }
}

/** 校验规则表：编号唯一、每种脏组合都有覆盖、说明非空。 */
export function auditConflictRules(): ConflictAudit {
  const audit: ConflictAudit = new ConflictAudit();
  const seen: string[] = [];
  CONFLICT_RULES.forEach((rule: ConflictRule): void => {
    if (seen.indexOf(rule.ruleId) >= 0) {
      audit.findings.push(`规则编号重复：${rule.ruleId}`);
    }
    seen.push(rule.ruleId);
    if (rule.reason.length === 0) {
      audit.findings.push(`缺少说明：${rule.ruleId}`);
    }
  });
  const kinds: ConflictKind[] = [ConflictKind.NONE, ConflictKind.REMOTE_ONLY,
    ConflictKind.LOCAL_ONLY, ConflictKind.REMOTE_NEWER, ConflictKind.LOCAL_NEWER,
    ConflictKind.BOTH_CHANGED, ConflictKind.UNKNOWN];
  kinds.forEach((kind: ConflictKind): void => {
    [false, true].forEach((localDirty: boolean): void => {
      [false, true].forEach((remoteDirty: boolean): void => {
        const hit: ConflictRule | undefined = CONFLICT_RULES.find((rule: ConflictRule): boolean =>
          rule.matches(kind, localDirty, remoteDirty));
        if (hit === undefined) {
          audit.findings.push(`缺少组合：${conflictLabel(kind)}/${localDirty}/${remoteDirty}`);
        }
      });
    });
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 规则摘要行。 */
export function conflictRuleLines(): string[] {
  return CONFLICT_RULES.map((rule: ConflictRule): string => rule.text());
}
