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

import { localize, registerLocaleCatalog } from '../../common/LocaleStrings';
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
      return localize('ac_conflictpolicy_001');
    case ConflictKind.REMOTE_NEWER:
      return localize('ac_conflictpolicy_002');
    case ConflictKind.LOCAL_NEWER:
      return localize('ac_conflictpolicy_003');
    case ConflictKind.BOTH_CHANGED:
      return localize('ac_conflictpolicy_004');
    case ConflictKind.REMOTE_ONLY:
      return localize('ac_conflictpolicy_005');
    case ConflictKind.LOCAL_ONLY:
      return localize('ac_conflictpolicy_006');
    default:
      return localize('ac_conflictpolicy_007');
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
      return localize('ac_conflictpolicy_008');
    case Resolution.KEEP_REMOTE:
      return localize('ac_conflictpolicy_009');
    case Resolution.MERGE_PREFER_LOCAL:
      return localize('ac_conflictpolicy_010');
    case Resolution.MERGE_PREFER_REMOTE:
      return localize('ac_conflictpolicy_011');
    case Resolution.APPEND_REMOTE:
      return localize('ac_conflictpolicy_012');
    case Resolution.ASK_USER:
      return localize('ac_conflictpolicy_013');
    default:
      return localize('ac_conflictpolicy_014');
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
  public local: PayloadData = new PayloadData();
  public remote: PayloadData = new PayloadData();
  /** 本机是否有未提交改动。 */
  public localDirty: boolean = false;
  /** 对端是否是本次接续带来的改动。 */
  public remoteDirty: boolean = false;
  /** 是否存在对端载荷。 */
  public remotePresent: boolean = true;

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
  public ruleId: string = '';
  public kind: ConflictKind = ConflictKind.NONE;
  public localDirty: boolean = false;
  public remoteDirty: boolean = false;
  public resolution: Resolution = Resolution.KEEP_LOCAL;
  public reason: string = '';

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
  public matches(kind: ConflictKind, localDirty: boolean, remoteDirty: boolean): boolean {
    return this.kind === kind && this.localDirty === localDirty &&
      this.remoteDirty === remoteDirty;
  }

  public text(): string {
    return localize('ac_conflictpolicy_015', [this.ruleId, conflictLabel(this.kind), this.localDirty ? localize('ac_conflictpolicy_016') : localize('ac_conflictpolicy_017')]) +
      localize('ac_conflictpolicy_018', [this.remoteDirty ? localize('ac_conflictpolicy_016') : localize('ac_conflictpolicy_017'), resolutionLabel(this.resolution)]);
  }
}

/**
 * 规则表。
 *
 * 顺序即优先级：先命中先返回。脏标记组合比版本号更可信，因此排在前面。
 */
function createCONFLICT_RULES(): ConflictRule[] {
  return [
  new ConflictRule('CF-01', ConflictKind.NONE, false, false, Resolution.KEEP_LOCAL,
    localize('ac_conflictpolicy_021')),
  new ConflictRule('CF-02', ConflictKind.NONE, true, false, Resolution.KEEP_LOCAL,
    localize('ac_conflictpolicy_022')),
  new ConflictRule('CF-03', ConflictKind.NONE, false, true, Resolution.KEEP_REMOTE,
    localize('ac_conflictpolicy_023')),
  new ConflictRule('CF-04', ConflictKind.NONE, true, true, Resolution.ASK_USER,
    localize('ac_conflictpolicy_024')),
  new ConflictRule('CF-05', ConflictKind.REMOTE_ONLY, false, false, Resolution.KEEP_REMOTE,
    localize('ac_conflictpolicy_025')),
  new ConflictRule('CF-06', ConflictKind.REMOTE_ONLY, true, false, Resolution.KEEP_REMOTE,
    localize('ac_conflictpolicy_026')),
  new ConflictRule('CF-07', ConflictKind.REMOTE_ONLY, false, true, Resolution.KEEP_REMOTE,
    localize('ac_conflictpolicy_027')),
  new ConflictRule('CF-08', ConflictKind.REMOTE_ONLY, true, true, Resolution.MERGE_PREFER_REMOTE,
    localize('ac_conflictpolicy_028')),
  new ConflictRule('CF-09', ConflictKind.LOCAL_ONLY, false, false, Resolution.KEEP_LOCAL,
    localize('ac_conflictpolicy_029')),
  new ConflictRule('CF-10', ConflictKind.LOCAL_ONLY, true, false, Resolution.KEEP_LOCAL,
    localize('ac_conflictpolicy_030')),
  new ConflictRule('CF-11', ConflictKind.LOCAL_ONLY, false, true, Resolution.MERGE_PREFER_LOCAL,
    localize('ac_conflictpolicy_031')),
  new ConflictRule('CF-12', ConflictKind.LOCAL_ONLY, true, true, Resolution.MERGE_PREFER_LOCAL,
    localize('ac_conflictpolicy_032')),
  new ConflictRule('CF-13', ConflictKind.REMOTE_NEWER, false, false, Resolution.KEEP_REMOTE,
    localize('ac_conflictpolicy_033')),
  new ConflictRule('CF-14', ConflictKind.REMOTE_NEWER, true, false, Resolution.MERGE_PREFER_LOCAL,
    localize('ac_conflictpolicy_034')),
  new ConflictRule('CF-15', ConflictKind.REMOTE_NEWER, false, true, Resolution.KEEP_REMOTE,
    localize('ac_conflictpolicy_035')),
  new ConflictRule('CF-16', ConflictKind.REMOTE_NEWER, true, true, Resolution.ASK_USER,
    localize('ac_conflictpolicy_036')),
  new ConflictRule('CF-17', ConflictKind.LOCAL_NEWER, false, false, Resolution.KEEP_LOCAL,
    localize('ac_conflictpolicy_037')),
  new ConflictRule('CF-18', ConflictKind.LOCAL_NEWER, true, false, Resolution.KEEP_LOCAL,
    localize('ac_conflictpolicy_038')),
  new ConflictRule('CF-19', ConflictKind.LOCAL_NEWER, false, true, Resolution.MERGE_PREFER_REMOTE,
    localize('ac_conflictpolicy_039')),
  new ConflictRule('CF-20', ConflictKind.LOCAL_NEWER, true, true, Resolution.ASK_USER,
    localize('ac_conflictpolicy_040')),
  new ConflictRule('CF-21', ConflictKind.BOTH_CHANGED, false, false, Resolution.ASK_USER,
    localize('ac_conflictpolicy_041')),
  new ConflictRule('CF-22', ConflictKind.BOTH_CHANGED, true, false, Resolution.MERGE_PREFER_LOCAL,
    localize('ac_conflictpolicy_042')),
  new ConflictRule('CF-23', ConflictKind.BOTH_CHANGED, false, true, Resolution.MERGE_PREFER_REMOTE,
    localize('ac_conflictpolicy_043')),
  new ConflictRule('CF-24', ConflictKind.BOTH_CHANGED, true, true, Resolution.ASK_USER,
    localize('ac_conflictpolicy_044')),
  new ConflictRule('CF-25', ConflictKind.UNKNOWN, true, true, Resolution.ASK_USER,
    localize('ac_conflictpolicy_045')),
  new ConflictRule('CF-26', ConflictKind.UNKNOWN, false, true, Resolution.DISCARD_REMOTE,
    localize('ac_conflictpolicy_046')),
  new ConflictRule('CF-27', ConflictKind.UNKNOWN, true, false, Resolution.KEEP_LOCAL,
    localize('ac_conflictpolicy_047')),
  new ConflictRule('CF-28', ConflictKind.UNKNOWN, false, false, Resolution.ASK_USER,
    localize('ac_conflictpolicy_048'))
];
}

export const CONFLICT_RULES: ConflictRule[] = createCONFLICT_RULES();
registerLocaleCatalog((): void => {
  CONFLICT_RULES.splice(0, CONFLICT_RULES.length);
  createCONFLICT_RULES().forEach((item: ConflictRule): void => { CONFLICT_RULES.push(item); });
});

/** 决策结果。 */
export class ConflictDecision {
  public kind: ConflictKind = ConflictKind.NONE;
  public resolution: Resolution = Resolution.KEEP_LOCAL;
  public rule: ConflictRule | undefined = undefined;

  /** 是否命中了规则。 */
  public matched(): boolean {
    return this.rule !== undefined;
  }

  /** 一句话说明。 */
  public text(): string {
    const ruleId: string = this.rule === undefined ? localize('ac_conflictpolicy_049') : this.rule.ruleId;
    return `${conflictLabel(this.kind)} -> ${resolutionLabel(this.resolution)}（${ruleId}）`;
  }

  /** 需要用户确认。 */
  public confirm(): boolean {
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
  public data: PayloadData = new PayloadData();
  /** 实际使用的策略。 */
  public resolution: Resolution = Resolution.KEEP_LOCAL;
  /** 合并说明。 */
  public notes: string[] = [];

  public summary(): string {
    return localize('ac_conflictpolicy_050', [resolutionLabel(this.resolution), this.notes.length]);
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
      result.notes.push(localize('ac_conflictpolicy_051'));
      break;
    case Resolution.KEEP_REMOTE:
      result.data = input.remote.clone();
      result.notes.push(localize('ac_conflictpolicy_052'));
      break;
    case Resolution.DISCARD_REMOTE:
      result.data = input.local.clone();
      result.notes.push(localize('ac_conflictpolicy_053'));
      break;
    case Resolution.APPEND_REMOTE:
      result.data = input.local.clone();
      result.data.body = `${input.local.body}\n${input.remote.body}`;
      result.notes.push(localize('ac_conflictpolicy_054'));
      break;
    case Resolution.MERGE_PREFER_LOCAL:
    case Resolution.MERGE_PREFER_REMOTE: {
      const preferLocal: boolean = decision.resolution === Resolution.MERGE_PREFER_LOCAL;
      const merged: string[] = mergeLines(input.local.body, input.remote.body, preferLocal);
      result.data = preferLocal ? input.local.clone() : input.remote.clone();
      result.data.body = merged.join('\n');
      result.data.rev = Math.max(input.local.rev, input.remote.rev);
      result.data.ck = decision.kind as string;
      result.notes.push(localize('ac_conflictpolicy_055', [merged.length]));
      result.notes.push(preferLocal ? localize('ac_conflictpolicy_056') : localize('ac_conflictpolicy_057'));
      break;
    }
    default:
      result.data = input.local.clone();
      result.notes.push(localize('ac_conflictpolicy_058'));
      break;
  }
  return result;
}

/** 规则表自检。 */
export class ConflictAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  public summary(): string {
    return this.ok ? localize('ac_conflictpolicy_059') : this.findings.join('；');
  }
}

/** 校验规则表：编号唯一、每种脏组合都有覆盖、说明非空。 */
export function auditConflictRules(): ConflictAudit {
  const audit: ConflictAudit = new ConflictAudit();
  const seen: string[] = [];
  CONFLICT_RULES.forEach((rule: ConflictRule): void => {
    if (seen.indexOf(rule.ruleId) >= 0) {
      audit.findings.push(localize('ac_conflictpolicy_060', [rule.ruleId]));
    }
    seen.push(rule.ruleId);
    if (rule.reason.length === 0) {
      audit.findings.push(localize('ac_conflictpolicy_061', [rule.ruleId]));
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
          audit.findings.push(localize('ac_conflictpolicy_062', [conflictLabel(kind), localDirty, remoteDirty]));
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
