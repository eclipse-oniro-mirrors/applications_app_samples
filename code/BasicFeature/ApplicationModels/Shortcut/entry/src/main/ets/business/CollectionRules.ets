/**
 * 收藏治理规则。
 *
 * 收藏列表会随时间膨胀：重复收藏、标签过多、置顶失效、长期未读。把"什么情况下
 * 该合并、该丢弃、该取消置顶"写成规则表，治理动作只按表输出，页面只负责确认，
 * 避免用户在一次点击里丢掉自己没看清的内容。
 */

/** 治理动作。 */
export enum CollectionAction {
  KEEP = 'keep',
  MERGE = 'merge',
  DROP = 'drop',
  PIN = 'pin',
  UNPIN = 'unpin',
  RETAG = 'retag',
  WARN_ONLY = 'warnOnly'
}

/** 动作标签。 */
export function actionLabel(action: CollectionAction): string {
  switch (action) {
    case CollectionAction.KEEP:
      return '保留';
    case CollectionAction.MERGE:
      return '合并';
    case CollectionAction.DROP:
      return '清理';
    case CollectionAction.PIN:
      return '置顶';
    case CollectionAction.UNPIN:
      return '取消置顶';
    case CollectionAction.RETAG:
      return '重设标签';
    default:
      return '仅提醒';
  }
}

/** 是否需要用户确认。 */
export function needsConfirm(action: CollectionAction): boolean {
  return action === CollectionAction.DROP || action === CollectionAction.MERGE;
}

/** 是否会造成条目减少。 */
export function shrinksList(action: CollectionAction): boolean {
  return action === CollectionAction.DROP || action === CollectionAction.MERGE;
}

/** 收藏条目。 */
export class CollectionItem {
  public id: string = '';
  public title: string = '';
  public summary: string = '';
  public source: string = '';
  public tags: string[] = [];
  public savedAt: number = 0;
  public pinned: boolean = false;

  constructor(id: string = '', title: string = '', summary: string = '') {
    this.id = id;
    this.title = title;
    this.summary = summary;
  }

  /** 是否有效条目。 */
  valid(): boolean {
    return this.id.length > 0 && this.title.length > 0;
  }

  /** 用于合并判定的键：来源 + 标题。 */
  mergeKey(): string {
    return `${this.source}::${this.title.trim().toLowerCase()}`;
  }

  /** 标签去重后的数量。 */
  tagCount(): number {
    const unique: string[] = [];
    this.tags.forEach((tag: string): void => {
      if (unique.indexOf(tag) < 0) {
        unique.push(tag);
      }
    });
    return unique.length;
  }

  text(): string {
    return `${this.title}｜${this.source}｜${this.tags.length} 标签｜` +
      `${this.pinned ? '已置顶' : '未置顶'}`;
  }
}

/** 规则类别。 */
export enum CollectionRuleKind {
  VALIDITY = 'validity',
  DUPLICATE = 'duplicate',
  TAG = 'tag',
  PIN = 'pin',
  AGE = 'age',
  TIME = 'time'
}

/** 规则级别。 */
export enum CollectionLevel {
  ERROR = 'error',
  WARN = 'warn'
}

/** 一条规则。 */
export class CollectionRule {
  public ruleId: string = '';
  public kind: CollectionRuleKind = CollectionRuleKind.VALIDITY;
  public action: CollectionAction = CollectionAction.KEEP;
  public level: CollectionLevel = CollectionLevel.WARN;
  /** 阈值：标签上限、置顶上限、天数为单位。 */
  public threshold: number = 0;
  public description: string = '';

  constructor(ruleId: string = '', kind: CollectionRuleKind = CollectionRuleKind.VALIDITY,
    action: CollectionAction = CollectionAction.KEEP, level: CollectionLevel = CollectionLevel.WARN,
    threshold: number = 0, description: string = '') {
    this.ruleId = ruleId;
    this.kind = kind;
    this.action = action;
    this.level = level;
    this.threshold = threshold;
    this.description = description;
  }

  text(): string {
    return `${this.ruleId} ${this.kind as string} -> ${actionLabel(this.action)}｜` +
      `${this.description}`;
  }
}

const DAY: number = 86400000;

/** 规则表。 */
export const COLLECTION_RULES: CollectionRule[] = [
  new CollectionRule('CL-01', CollectionRuleKind.VALIDITY, CollectionAction.DROP,
    CollectionLevel.ERROR, 0, '标识为空视为损坏数据，直接剔除'),
  new CollectionRule('CL-02', CollectionRuleKind.VALIDITY, CollectionAction.DROP,
    CollectionLevel.ERROR, 0, '标题为空视为无意义收藏'),
  new CollectionRule('CL-03', CollectionRuleKind.VALIDITY, CollectionAction.KEEP,
    CollectionLevel.WARN, 0, '摘要为空但标题有效，保留并提示补全'),
  new CollectionRule('CL-04', CollectionRuleKind.VALIDITY, CollectionAction.RETAG,
    CollectionLevel.WARN, 0, '来源为空，按未知来源重新打标签'),
  new CollectionRule('CL-05', CollectionRuleKind.DUPLICATE, CollectionAction.MERGE,
    CollectionLevel.WARN, 0, '同来源同标题视为重复收藏，合并为一条'),
  new CollectionRule('CL-06', CollectionRuleKind.DUPLICATE, CollectionAction.DROP,
    CollectionLevel.ERROR, 0, '标识完全重复，保留最早一条'),
  new CollectionRule('CL-07', CollectionRuleKind.TAG, CollectionAction.RETAG,
    CollectionLevel.WARN, 5, '标签超过 5 个时只保留前 5 个'),
  new CollectionRule('CL-08', CollectionRuleKind.TAG, CollectionAction.RETAG,
    CollectionLevel.WARN, 0, '标签含空串时清理空标签'),
  new CollectionRule('CL-09', CollectionRuleKind.TAG, CollectionAction.RETAG,
    CollectionLevel.WARN, 0, '标签重复时去重'),
  new CollectionRule('CL-10', CollectionRuleKind.PIN, CollectionAction.PIN,
    CollectionLevel.WARN, 0, '手工标记为置顶的条目保持置顶'),
  new CollectionRule('CL-11', CollectionRuleKind.PIN, CollectionAction.UNPIN,
    CollectionLevel.WARN, 3, '置顶条目超过 3 条时取消最早的置顶'),
  new CollectionRule('CL-12', CollectionRuleKind.PIN, CollectionAction.UNPIN,
    CollectionLevel.WARN, 0, '置顶条目已被清理时同步取消置顶'),
  new CollectionRule('CL-13', CollectionRuleKind.AGE, CollectionAction.DROP,
    CollectionLevel.WARN, 365, '超过 365 天且未置顶的收藏建议清理'),
  new CollectionRule('CL-14', CollectionRuleKind.AGE, CollectionAction.WARN_ONLY,
    CollectionLevel.WARN, 180, '超过 180 天未读给出提醒'),
  new CollectionRule('CL-15', CollectionRuleKind.AGE, CollectionAction.KEEP,
    CollectionLevel.WARN, 30, '一个月内的收藏一律保留'),
  new CollectionRule('CL-16', CollectionRuleKind.TIME, CollectionAction.KEEP,
    CollectionLevel.WARN, 0, '保存时间为 0 时按未知时间处理，不参与清理'),
  new CollectionRule('CL-17', CollectionRuleKind.TIME, CollectionAction.KEEP,
    CollectionLevel.WARN, 0, '保存时间晚于当前时间时保留并记录异常'),
  new CollectionRule('CL-18', CollectionRuleKind.DUPLICATE, CollectionAction.MERGE,
    CollectionLevel.WARN, 0, '同来源且标题仅差空白字符视为重复'),
  new CollectionRule('CL-19', CollectionRuleKind.TAG, CollectionAction.KEEP,
    CollectionLevel.WARN, 1, '仅有一个标签时不改动'),
  new CollectionRule('CL-20', CollectionRuleKind.VALIDITY, CollectionAction.KEEP,
    CollectionLevel.WARN, 0, '其余情况一律保留，不做隐式变更')
];

/** 规则编号列表。 */
export function ruleIds(): string[] {
  return COLLECTION_RULES.map((rule: CollectionRule): string => rule.ruleId);
}

/** 按编号取规则。 */
export function ruleOf(ruleId: string): CollectionRule | undefined {
  return COLLECTION_RULES.find((rule: CollectionRule): boolean => rule.ruleId === ruleId);
}

/** 按类别取规则。 */
export function rulesOfKind(kind: CollectionRuleKind): CollectionRule[] {
  return COLLECTION_RULES.filter((rule: CollectionRule): boolean => rule.kind === kind);
}

/** 治理结论。 */
export class GovernanceVerdict {
  public itemId: string = '';
  public action: CollectionAction = CollectionAction.KEEP;
  public ruleId: string = '';
  public note: string = '';
  public level: CollectionLevel = CollectionLevel.WARN;

  constructor(itemId: string = '', action: CollectionAction = CollectionAction.KEEP,
    ruleId: string = '', note: string = '', level: CollectionLevel = CollectionLevel.WARN) {
    this.itemId = itemId;
    this.action = action;
    this.ruleId = ruleId;
    this.note = note;
    this.level = level;
  }

  /** 是否需要确认。 */
  confirm(): boolean {
    return needsConfirm(this.action);
  }

  text(): string {
    return `${this.itemId}｜${actionLabel(this.action)}｜${this.ruleId}｜${this.note}`;
  }
}

/** 单条判定。existingKeys 为已出现过的合并键。 */
export function judgeItem(item: CollectionItem, now: number,
  existingKeys: string[]): GovernanceVerdict {
  if (item.id.length === 0) {
    return new GovernanceVerdict('', CollectionAction.DROP, 'CL-01', '标识为空', CollectionLevel.ERROR);
  }
  if (item.title.trim().length === 0) {
    return new GovernanceVerdict(item.id, CollectionAction.DROP, 'CL-02', '标题为空',
      CollectionLevel.ERROR);
  }
  if (existingKeys.indexOf(item.mergeKey()) >= 0) {
    return new GovernanceVerdict(item.id, CollectionAction.MERGE, 'CL-05', '同来源同标题重复',
      CollectionLevel.WARN);
  }
  if (item.tags.length > 5 || item.tagCount() !== item.tags.length) {
    return new GovernanceVerdict(item.id, CollectionAction.RETAG, 'CL-07', '标签数量或重复需重设',
      CollectionLevel.WARN);
  }
  if (item.savedAt <= 0) {
    return new GovernanceVerdict(item.id, CollectionAction.KEEP, 'CL-16', '保存时间未知，跳过清理',
      CollectionLevel.WARN);
  }
  if (item.savedAt > now + DAY) {
    return new GovernanceVerdict(item.id, CollectionAction.KEEP, 'CL-17', '保存时间异常，保留',
      CollectionLevel.WARN);
  }
  const ageDays: number = Math.floor(Math.max(0, now - item.savedAt) / DAY);
  if (ageDays > 365 && !item.pinned) {
    return new GovernanceVerdict(item.id, CollectionAction.DROP, 'CL-13', `超过 ${ageDays} 天未置顶`,
      CollectionLevel.WARN);
  }
  if (ageDays > 180) {
    return new GovernanceVerdict(item.id, CollectionAction.WARN_ONLY, 'CL-14',
      `超过 ${ageDays} 天未读`, CollectionLevel.WARN);
  }
  if (item.summary.trim().length === 0) {
    return new GovernanceVerdict(item.id, CollectionAction.KEEP, 'CL-03', '摘要为空，建议补全',
      CollectionLevel.WARN);
  }
  return new GovernanceVerdict(item.id, CollectionAction.KEEP, 'CL-20', '无需治理',
    CollectionLevel.WARN);
}

/** 治理计划。 */
export class GovernancePlan {
  public verdicts: GovernanceVerdict[] = [];

  /** 按动作统计。 */
  countOf(action: CollectionAction): number {
    return this.verdicts.filter((item: GovernanceVerdict): boolean =>
      item.action === action).length;
  }

  /** 需要确认条数。 */
  confirmCount(): number {
    return this.verdicts.filter((item: GovernanceVerdict): boolean => item.confirm()).length;
  }

  /** 治理后的预计条数。 */
  projectedTotal(): number {
    return this.verdicts.length - this.countOf(CollectionAction.DROP) -
      this.countOf(CollectionAction.MERGE);
  }

  /** 摘要文本。 */
  text(): string {
    return `共 ${this.verdicts.length} 条：保留 ${this.countOf(CollectionAction.KEEP)}、` +
      `合并 ${this.countOf(CollectionAction.MERGE)}、清理 ${this.countOf(CollectionAction.DROP)}、` +
      `重设标签 ${this.countOf(CollectionAction.RETAG)}、需确认 ${this.confirmCount()}`;
  }

  /** 逐行文本。 */
  lines(): string[] {
    return this.verdicts.map((item: GovernanceVerdict): string => item.text());
  }
}

/** 生成治理计划。先按保存时间升序，保证"保留最早一条"的语义稳定。 */
export function govern(items: CollectionItem[], now: number): GovernancePlan {
  const plan: GovernancePlan = new GovernancePlan();
  const sorted: CollectionItem[] = items.slice();
  sorted.sort((left: CollectionItem, right: CollectionItem): number => {
    if (left.savedAt !== right.savedAt) {
      return left.savedAt - right.savedAt;
    }
    return left.id < right.id ? -1 : (left.id > right.id ? 1 : 0);
  });
  const keys: string[] = [];
  const ids: string[] = [];
  sorted.forEach((item: CollectionItem): void => {
    if (ids.indexOf(item.id) >= 0) {
      plan.verdicts.push(new GovernanceVerdict(item.id, CollectionAction.DROP, 'CL-06',
        '标识重复', CollectionLevel.ERROR));
      return;
    }
    ids.push(item.id);
    const verdict: GovernanceVerdict = judgeItem(item, now, keys);
    plan.verdicts.push(verdict);
    if (verdict.action !== CollectionAction.DROP) {
      keys.push(item.mergeKey());
    }
  });
  return plan;
}

/** 置顶配额：超过上限时按保存时间从早到晚取消置顶。 */
export function pinQuota(items: CollectionItem[], limit: number): string[] {
  const pinned: CollectionItem[] = items.filter((item: CollectionItem): boolean => item.pinned);
  if (pinned.length <= limit) {
    return [];
  }
  const sorted: CollectionItem[] = pinned.slice();
  sorted.sort((left: CollectionItem, right: CollectionItem): number =>
    left.savedAt - right.savedAt);
  return sorted.slice(0, pinned.length - limit).map((item: CollectionItem): string => item.id);
}

/** 规则自检。 */
export class CollectionAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? '收藏规则表自洽' : this.findings.join('；');
  }
}

/** 校验规则表。 */
export function auditCollectionRules(): CollectionAudit {
  const audit: CollectionAudit = new CollectionAudit();
  const seen: string[] = [];
  COLLECTION_RULES.forEach((rule: CollectionRule, index: number): void => {
    if (seen.indexOf(rule.ruleId) >= 0) {
      audit.findings.push(`规则编号重复：${rule.ruleId}`);
    }
    seen.push(rule.ruleId);
    const expected: string = `CL-${(index + 1).toString().padStart(2, '0')}`;
    if (rule.ruleId !== expected) {
      audit.findings.push(`编号不连续：期望 ${expected}，实际 ${rule.ruleId}`);
    }
    if (rule.description.length === 0) {
      audit.findings.push(`缺少说明：${rule.ruleId}`);
    }
    if (rule.threshold < 0) {
      audit.findings.push(`阈值为负：${rule.ruleId}`);
    }
  });
  const kinds: CollectionRuleKind[] = [CollectionRuleKind.VALIDITY, CollectionRuleKind.DUPLICATE,
    CollectionRuleKind.TAG, CollectionRuleKind.PIN, CollectionRuleKind.AGE,
    CollectionRuleKind.TIME];
  kinds.forEach((kind: CollectionRuleKind): void => {
    if (rulesOfKind(kind).length === 0) {
      audit.findings.push(`类别无用例：${kind as string}`);
    }
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 规则摘要行。 */
export function ruleLines(): string[] {
  return COLLECTION_RULES.map((rule: CollectionRule): string => rule.text());
}
