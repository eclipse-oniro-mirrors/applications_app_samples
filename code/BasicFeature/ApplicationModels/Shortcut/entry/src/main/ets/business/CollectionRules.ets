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

import { uiText, resourceText } from '../i18n/Strings';
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
      return uiText("shortcut_text_0056");
    case CollectionAction.MERGE:
      return uiText("shortcut_text_0264");
    case CollectionAction.DROP:
      return uiText("shortcut_text_0439");
    case CollectionAction.PIN:
      return uiText("shortcut_text_0759");
    case CollectionAction.UNPIN:
      return uiText("shortcut_text_0456");
    case CollectionAction.RETAG:
      return uiText("shortcut_text_0769");
    default:
      return uiText("shortcut_text_0338");
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
    return uiText("shortcut_text_0026", [String(this.title), String(this.source), String(this.tags.length)]) +
      `${this.pinned ? uiText("shortcut_text_0689") : uiText("shortcut_text_0590")}`;
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
  private descriptionValue: string = '';
  get description(): string { return resourceText(this.descriptionValue); }
  set description(value: string) { this.descriptionValue = value; }

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
    CollectionLevel.ERROR, 0, "@string/shortcut_text_0118"),
  new CollectionRule('CL-02', CollectionRuleKind.VALIDITY, CollectionAction.DROP,
    CollectionLevel.ERROR, 0, "@string/shortcut_text_0125"),
  new CollectionRule('CL-03', CollectionRuleKind.VALIDITY, CollectionAction.KEEP,
    CollectionLevel.WARN, 0, "@string/shortcut_text_0726"),
  new CollectionRule('CL-04', CollectionRuleKind.VALIDITY, CollectionAction.RETAG,
    CollectionLevel.WARN, 0, "@string/shortcut_text_0374"),
  new CollectionRule('CL-05', CollectionRuleKind.DUPLICATE, CollectionAction.MERGE,
    CollectionLevel.WARN, 0, "@string/shortcut_text_0555"),
  new CollectionRule('CL-06', CollectionRuleKind.DUPLICATE, CollectionAction.DROP,
    CollectionLevel.ERROR, 0, "@string/shortcut_text_0116"),
  new CollectionRule('CL-07', CollectionRuleKind.TAG, CollectionAction.RETAG,
    CollectionLevel.WARN, 5, "@string/shortcut_text_0096"),
  new CollectionRule('CL-08', CollectionRuleKind.TAG, CollectionAction.RETAG,
    CollectionLevel.WARN, 0, "@string/shortcut_text_0098"),
  new CollectionRule('CL-09', CollectionRuleKind.TAG, CollectionAction.RETAG,
    CollectionLevel.WARN, 0, "@string/shortcut_text_0113"),
  new CollectionRule('CL-10', CollectionRuleKind.PIN, CollectionAction.PIN,
    CollectionLevel.WARN, 0, "@string/shortcut_text_0527"),
  new CollectionRule('CL-11', CollectionRuleKind.PIN, CollectionAction.UNPIN,
    CollectionLevel.WARN, 3, "@string/shortcut_text_0761"),
  new CollectionRule('CL-12', CollectionRuleKind.PIN, CollectionAction.UNPIN,
    CollectionLevel.WARN, 0, "@string/shortcut_text_0762"),
  new CollectionRule('CL-13', CollectionRuleKind.AGE, CollectionAction.DROP,
    CollectionLevel.WARN, 365, "@string/shortcut_text_0156"),
  new CollectionRule('CL-14', CollectionRuleKind.AGE, CollectionAction.WARN_ONLY,
    CollectionLevel.WARN, 180, "@string/shortcut_text_0155"),
  new CollectionRule('CL-15', CollectionRuleKind.AGE, CollectionAction.KEEP,
    CollectionLevel.WARN, 30, "@string/shortcut_text_0643"),
  new CollectionRule('CL-16', CollectionRuleKind.TIME, CollectionAction.KEEP,
    CollectionLevel.WARN, 0, "@string/shortcut_text_0051"),
  new CollectionRule('CL-17', CollectionRuleKind.TIME, CollectionAction.KEEP,
    CollectionLevel.WARN, 0, "@string/shortcut_text_0050"),
  new CollectionRule('CL-18', CollectionRuleKind.DUPLICATE, CollectionAction.MERGE,
    CollectionLevel.WARN, 0, "@string/shortcut_text_0554"),
  new CollectionRule('CL-19', CollectionRuleKind.TAG, CollectionAction.KEEP,
    CollectionLevel.WARN, 1, "@string/shortcut_text_0339"),
  new CollectionRule('CL-20', CollectionRuleKind.VALIDITY, CollectionAction.KEEP,
    CollectionLevel.WARN, 0, "@string/shortcut_text_0431")
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
    return new GovernanceVerdict('', CollectionAction.DROP, 'CL-01', uiText("shortcut_text_0117"), CollectionLevel.ERROR);
  }
  if (item.title.trim().length === 0) {
    return new GovernanceVerdict(item.id, CollectionAction.DROP, 'CL-02', uiText("shortcut_text_0124"),
      CollectionLevel.ERROR);
  }
  if (existingKeys.indexOf(item.mergeKey()) >= 0) {
    return new GovernanceVerdict(item.id, CollectionAction.MERGE, 'CL-05', uiText("shortcut_text_0556"),
      CollectionLevel.WARN);
  }
  if (item.tags.length > 5 || item.tagCount() !== item.tags.length) {
    return new GovernanceVerdict(item.id, CollectionAction.RETAG, 'CL-07', uiText("shortcut_text_0104"),
      CollectionLevel.WARN);
  }
  if (item.savedAt <= 0) {
    return new GovernanceVerdict(item.id, CollectionAction.KEEP, 'CL-16', uiText("shortcut_text_0052"),
      CollectionLevel.WARN);
  }
  if (item.savedAt > now + DAY) {
    return new GovernanceVerdict(item.id, CollectionAction.KEEP, 'CL-17', uiText("shortcut_text_0053"),
      CollectionLevel.WARN);
  }
  const ageDays: number = Math.floor(Math.max(0, now - item.savedAt) / DAY);
  if (ageDays > 365 && !item.pinned) {
    return new GovernanceVerdict(item.id, CollectionAction.DROP, 'CL-13', uiText("shortcut_text_0154", [String(ageDays)]),
      CollectionLevel.WARN);
  }
  if (ageDays > 180) {
    return new GovernanceVerdict(item.id, CollectionAction.WARN_ONLY, 'CL-14',
      uiText("shortcut_text_0153", [String(ageDays)]), CollectionLevel.WARN);
  }
  if (item.summary.trim().length === 0) {
    return new GovernanceVerdict(item.id, CollectionAction.KEEP, 'CL-03', uiText("shortcut_text_0725"),
      CollectionLevel.WARN);
  }
  return new GovernanceVerdict(item.id, CollectionAction.KEEP, 'CL-20', uiText("shortcut_text_0602"),
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
    return uiText("shortcut_text_0252", [String(this.verdicts.length), String(this.countOf(CollectionAction.KEEP))]) +
      uiText("shortcut_text_0265", [String(this.countOf(CollectionAction.MERGE)), String(this.countOf(CollectionAction.DROP))]) +
      uiText("shortcut_text_0770", [String(this.countOf(CollectionAction.RETAG)), String(this.confirmCount())]);
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
        uiText("shortcut_text_0119"), CollectionLevel.ERROR));
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
    return this.ok ? uiText("shortcut_text_0518") : this.findings.join('；');
  }
}

/** 校验规则表。 */
export function auditCollectionRules(): CollectionAudit {
  const audit: CollectionAudit = new CollectionAudit();
  const seen: string[] = [];
  COLLECTION_RULES.forEach((rule: CollectionRule, index: number): void => {
    if (seen.indexOf(rule.ruleId) >= 0) {
      audit.findings.push(uiText("shortcut_text_0256", [String(rule.ruleId)]));
    }
    seen.push(rule.ruleId);
    const expected: string = `CL-${(index + 1).toString().padStart(2, '0')}`;
    if (rule.ruleId !== expected) {
      audit.findings.push(uiText("shortcut_text_0075", [String(expected), String(rule.ruleId)]));
    }
    if (rule.description.length === 0) {
      audit.findings.push(uiText("shortcut_text_0473", [String(rule.ruleId)]));
    }
    if (rule.threshold < 0) {
      audit.findings.push(uiText("shortcut_text_0712", [String(rule.ruleId)]));
    }
  });
  const kinds: CollectionRuleKind[] = [CollectionRuleKind.VALIDITY, CollectionRuleKind.DUPLICATE,
    CollectionRuleKind.TAG, CollectionRuleKind.PIN, CollectionRuleKind.AGE,
    CollectionRuleKind.TIME];
  kinds.forEach((kind: CollectionRuleKind): void => {
    if (rulesOfKind(kind).length === 0) {
      audit.findings.push(uiText("shortcut_text_0376", [String(kind as string)]));
    }
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 规则摘要行。 */
export function ruleLines(): string[] {
  return COLLECTION_RULES.map((rule: CollectionRule): string => rule.text());
}
