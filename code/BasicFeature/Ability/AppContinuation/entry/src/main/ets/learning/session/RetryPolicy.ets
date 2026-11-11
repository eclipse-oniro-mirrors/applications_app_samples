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
 * 接续失败的重试策略。
 *
 * 失败原因不同，重试方式必须不同：权限问题重试没有意义，网络抖动必须退避，
 * 版本过低只能提示升级。把原因到策略的映射写成表，退避计算做成纯函数，
 * 页面只展示"下一次何时重试、为什么"。
 */

/** 失败原因。 */
export enum RetryReason {
  NETWORK = 'network',
  TIMEOUT = 'timeout',
  PERMISSION = 'permission',
  VERSION = 'version',
  DEVICE_BUSY = 'deviceBusy',
  STORAGE = 'storage',
  PAYLOAD = 'payload',
  UNKNOWN = 'unknown'
}

/** 原因标签。 */
export function reasonLabel(reason: RetryReason): string {
  switch (reason) {
    case RetryReason.NETWORK:
      return localize('ac_retrypolicy_001');
    case RetryReason.TIMEOUT:
      return localize('ac_retrypolicy_002');
    case RetryReason.PERMISSION:
      return localize('ac_retrypolicy_003');
    case RetryReason.VERSION:
      return localize('ac_retrypolicy_004');
    case RetryReason.DEVICE_BUSY:
      return localize('ac_retrypolicy_005');
    case RetryReason.STORAGE:
      return localize('ac_retrypolicy_006');
    case RetryReason.PAYLOAD:
      return localize('ac_retrypolicy_007');
    default:
      return localize('ac_retrypolicy_008');
  }
}

/** 退避方式。 */
export enum Backoff {
  NONE = 'none',
  FIXED = 'fixed',
  LINEAR = 'linear',
  EXPONENTIAL = 'exponential'
}

/** 退避标签。 */
export function backoffLabel(backoff: Backoff): string {
  switch (backoff) {
    case Backoff.NONE:
      return localize('ac_retrypolicy_009');
    case Backoff.FIXED:
      return localize('ac_retrypolicy_010');
    case Backoff.LINEAR:
      return localize('ac_retrypolicy_011');
    default:
      return localize('ac_retrypolicy_012');
  }
}

/** 重试规则。 */
export class RetryRule {
  public ruleId: string = '';
  public reason: RetryReason = RetryReason.UNKNOWN;
  public backoff: Backoff = Backoff.NONE;
  /** 首次延迟（毫秒）。 */
  public baseDelayMs: number = 0;
  /** 最大尝试次数，含首次。 */
  public maxAttempts: number = 1;
  /** 延迟上限（毫秒）。 */
  public capMs: number = 0;
  /** 是否需要用户先操作再重试。 */
  public requiresAction: boolean = false;
  public description: string = '';

  constructor(ruleId: string = '', reason: RetryReason = RetryReason.UNKNOWN,
    backoff: Backoff = Backoff.NONE, baseDelayMs: number = 0, maxAttempts: number = 1,
    capMs: number = 0, requiresAction: boolean = false, description: string = '') {
    this.ruleId = ruleId;
    this.reason = reason;
    this.backoff = backoff;
    this.baseDelayMs = baseDelayMs;
    this.maxAttempts = maxAttempts;
    this.capMs = capMs;
    this.requiresAction = requiresAction;
    this.description = description;
  }

  /** 是否允许重试。 */
  public retryable(): boolean {
    return this.backoff !== Backoff.NONE && this.maxAttempts > 1;
  }

  public text(): string {
    return `${this.ruleId} ${reasonLabel(this.reason)}｜${backoffLabel(this.backoff)}｜` +
      localize('ac_retrypolicy_013', [this.maxAttempts, this.baseDelayMs]);
  }
}

/** 规则表。 */
function createRETRY_RULES(): RetryRule[] {
  return [
  new RetryRule('RR-01', RetryReason.NETWORK, Backoff.EXPONENTIAL, 200, 4, 4000, false,
    localize('ac_retrypolicy_014')),
  new RetryRule('RR-02', RetryReason.NETWORK, Backoff.FIXED, 500, 2, 500, false,
    localize('ac_retrypolicy_015')),
  new RetryRule('RR-03', RetryReason.TIMEOUT, Backoff.LINEAR, 300, 3, 2000, false,
    localize('ac_retrypolicy_016')),
  new RetryRule('RR-04', RetryReason.TIMEOUT, Backoff.NONE, 0, 1, 0, false,
    localize('ac_retrypolicy_017')),
  new RetryRule('RR-05', RetryReason.PERMISSION, Backoff.NONE, 0, 1, 0, true,
    localize('ac_retrypolicy_018')),
  new RetryRule('RR-06', RetryReason.VERSION, Backoff.NONE, 0, 1, 0, true,
    localize('ac_retrypolicy_019')),
  new RetryRule('RR-07', RetryReason.DEVICE_BUSY, Backoff.FIXED, 800, 3, 800, false,
    localize('ac_retrypolicy_020')),
  new RetryRule('RR-08', RetryReason.DEVICE_BUSY, Backoff.LINEAR, 400, 2, 1200, false,
    localize('ac_retrypolicy_021')),
  new RetryRule('RR-09', RetryReason.STORAGE, Backoff.FIXED, 1000, 2, 1000, false,
    localize('ac_retrypolicy_022')),
  new RetryRule('RR-10', RetryReason.STORAGE, Backoff.NONE, 0, 1, 0, true,
    localize('ac_retrypolicy_023')),
  new RetryRule('RR-11', RetryReason.PAYLOAD, Backoff.NONE, 0, 1, 0, true,
    localize('ac_retrypolicy_024')),
  new RetryRule('RR-12', RetryReason.UNKNOWN, Backoff.LINEAR, 500, 2, 1000, false,
    localize('ac_retrypolicy_025')),
  new RetryRule('RR-13', RetryReason.NETWORK, Backoff.EXPONENTIAL, 100, 5, 3200, false,
    localize('ac_retrypolicy_026')),
  new RetryRule('RR-14', RetryReason.TIMEOUT, Backoff.EXPONENTIAL, 250, 4, 2000, false,
    localize('ac_retrypolicy_027')),
  new RetryRule('RR-15', RetryReason.DEVICE_BUSY, Backoff.EXPONENTIAL, 600, 3, 2400, false,
    localize('ac_retrypolicy_028')),
  new RetryRule('RR-16', RetryReason.STORAGE, Backoff.LINEAR, 300, 3, 900, false,
    localize('ac_retrypolicy_029')),
  new RetryRule('RR-17', RetryReason.UNKNOWN, Backoff.NONE, 0, 1, 0, true,
    localize('ac_retrypolicy_030')),
  new RetryRule('RR-18', RetryReason.VERSION, Backoff.NONE, 0, 1, 0, false,
    localize('ac_retrypolicy_031')),
  new RetryRule('RR-19', RetryReason.PERMISSION, Backoff.FIXED, 1500, 2, 1500, true,
    localize('ac_retrypolicy_032')),
  new RetryRule('RR-20', RetryReason.PAYLOAD, Backoff.NONE, 0, 1, 0, false,
    localize('ac_retrypolicy_033'))
];
}

export const RETRY_RULES: RetryRule[] = createRETRY_RULES();
registerLocaleCatalog((): void => {
  RETRY_RULES.splice(0, RETRY_RULES.length);
  createRETRY_RULES().forEach((item: RetryRule): void => { RETRY_RULES.push(item); });
});

/** 规则编号。 */
export function ruleIds(): string[] {
  return RETRY_RULES.map((rule: RetryRule): string => rule.ruleId);
}

/** 按编号取规则。 */
export function ruleOf(ruleId: string): RetryRule | undefined {
  return RETRY_RULES.find((rule: RetryRule): boolean => rule.ruleId === ruleId);
}

/** 按原因取全部规则。 */
export function rulesOf(reason: RetryReason): RetryRule[] {
  return RETRY_RULES.filter((rule: RetryRule): boolean => rule.reason === reason);
}

/** 取默认规则：首个命中该原因的规则。 */
export function defaultRule(reason: RetryReason): RetryRule {
  const hit: RetryRule | undefined = rulesOf(reason)[0];
  if (hit !== undefined) {
    return hit;
  }
  return new RetryRule('RR-00', RetryReason.UNKNOWN, Backoff.NONE, 0, 1, 0, false, localize('ac_retrypolicy_034'));
}

/**
 * 计算第 attempt 次重试前的等待时间（attempt 从 1 开始）。
 *
 * 返回 0 表示不重试。所有结果都受 capMs 限制。
 */
export function delayOf(rule: RetryRule, attempt: number): number {
  if (!rule.retryable() || attempt < 1 || attempt >= rule.maxAttempts) {
    return 0;
  }
  let delay: number = 0;
  switch (rule.backoff) {
    case Backoff.FIXED:
      delay = rule.baseDelayMs;
      break;
    case Backoff.LINEAR:
      delay = rule.baseDelayMs * attempt;
      break;
    case Backoff.EXPONENTIAL:
      delay = rule.baseDelayMs * Math.pow(2, attempt - 1);
      break;
    default:
      return 0;
  }
  if (rule.capMs > 0 && delay > rule.capMs) {
    return rule.capMs;
  }
  return Math.max(0, Math.round(delay));
}

/** 总等待时间：从第 1 次重试累加到上限。 */
export function totalWait(rule: RetryRule): number {
  let total: number = 0;
  for (let attempt = 1; attempt < rule.maxAttempts; attempt++) {
    total += delayOf(rule, attempt);
  }
  return total;
}

/** 单次尝试记录。 */
export class AttemptRecord {
  public attempt: number = 0;
  public reason: RetryReason = RetryReason.UNKNOWN;
  public waitedMs: number = 0;
  public succeeded: boolean = false;

  constructor(attempt: number = 0, reason: RetryReason = RetryReason.UNKNOWN,
    waitedMs: number = 0, succeeded: boolean = false) {
    this.attempt = attempt;
    this.reason = reason;
    this.waitedMs = waitedMs;
    this.succeeded = succeeded;
  }

  public text(): string {
    return localize('ac_retrypolicy_035', [this.attempt, reasonLabel(this.reason), this.waitedMs]) +
      `${this.succeeded ? localize('ac_index_098') : localize('ac_index_023')}`;
  }
}

/** 重试轨迹。 */
export class RetryTrace {
  public records: AttemptRecord[] = [];
  public rule: RetryRule = new RetryRule();

  /** 总尝试次数。 */
  public attempts(): number {
    return this.records.length;
  }

  /** 总等待。 */
  public waited(): number {
    return this.records.reduce((sum: number, item: AttemptRecord): number =>
      sum + Math.max(0, item.waitedMs), 0);
  }

  /** 是否最终成功。 */
  public succeeded(): boolean {
    return this.records.length > 0 && this.records[this.records.length - 1].succeeded;
  }

  /** 是否已用尽次数。 */
  public exhausted(): boolean {
    return !this.succeeded() && this.attempts() >= this.rule.maxAttempts;
  }

  /** 追加一次尝试。 */
  public push(reason: RetryReason, waitedMs: number, succeeded: boolean): void {
    this.records.push(new AttemptRecord(this.records.length + 1, reason, waitedMs, succeeded));
  }

  /** 摘要文本。 */
  public text(): string {
    const state: string = this.succeeded() ? localize('ac_retrypolicy_038') : (this.exhausted() ? localize('ac_retrypolicy_039') : localize('ac_retrypolicy_040'));
    return localize('ac_retrypolicy_041', [this.rule.ruleId, state, this.attempts(), this.waited()]);
  }

  /** 逐行文本。 */
  public lines(): string[] {
    return this.records.map((item: AttemptRecord): string => item.text());
  }
}

/** 按规则模拟一次重试过程：第 failUntil 次之前都失败。 */
export function simulate(rule: RetryRule, failUntil: number): RetryTrace {
  const trace: RetryTrace = new RetryTrace();
  trace.rule = rule;
  const limit: number = Math.max(1, rule.maxAttempts);
  for (let attempt = 1; attempt <= limit; attempt++) {
    const waited: number = attempt === 1 ? 0 : delayOf(rule, attempt - 1);
    const succeeded: boolean = attempt >= failUntil;
    trace.push(rule.reason, waited, succeeded);
    if (succeeded) {
      break;
    }
    if (!rule.retryable()) {
      break;
    }
  }
  return trace;
}

/** 规则自检。 */
export class RetryAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  public summary(): string {
    return this.ok ? localize('ac_retrypolicy_042') : this.findings.join('；');
  }
}

/** 校验规则：编号连续、退避与次数一致、上限不小于首次延迟。 */
export function auditRetryRules(): RetryAudit {
  const audit: RetryAudit = new RetryAudit();
  const ids: string[] = ruleIds();
  RETRY_RULES.forEach((rule: RetryRule, index: number): void => {
    const expected: string = `RR-${(index + 1).toString().padStart(2, '0')}`;
    if (rule.ruleId !== expected) {
      audit.findings.push(localize('ac_scenariocatalog_147', [expected, rule.ruleId]));
    }
    if (rule.backoff === Backoff.NONE && rule.maxAttempts !== 1) {
      audit.findings.push(localize('ac_retrypolicy_044', [rule.ruleId]));
    }
    if (rule.backoff !== Backoff.NONE && rule.baseDelayMs <= 0) {
      audit.findings.push(localize('ac_retrypolicy_045', [rule.ruleId]));
    }
    if (rule.capMs > 0 && rule.capMs < rule.baseDelayMs) {
      audit.findings.push(localize('ac_retrypolicy_046', [rule.ruleId]));
    }
    if (rule.description.length === 0) {
      audit.findings.push(localize('ac_conflictpolicy_061', [rule.ruleId]));
    }
    if (ids.indexOf(rule.ruleId) < 0) {
      audit.findings.push(localize('ac_retrypolicy_048', [rule.ruleId]));
    }
  });
  const reasons: RetryReason[] = [RetryReason.NETWORK, RetryReason.TIMEOUT,
    RetryReason.PERMISSION, RetryReason.VERSION, RetryReason.DEVICE_BUSY,
    RetryReason.STORAGE, RetryReason.PAYLOAD, RetryReason.UNKNOWN];
  reasons.forEach((reason: RetryReason): void => {
    if (rulesOf(reason).length === 0) {
      audit.findings.push(localize('ac_retrypolicy_049', [reasonLabel(reason)]));
    }
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 规则摘要行。 */
export function ruleLines(): string[] {
  return RETRY_RULES.map((rule: RetryRule): string => rule.text());
}

/** 原因分布行。 */
export function reasonLines(): string[] {
  const reasons: RetryReason[] = [RetryReason.NETWORK, RetryReason.TIMEOUT,
    RetryReason.PERMISSION, RetryReason.VERSION, RetryReason.DEVICE_BUSY,
    RetryReason.STORAGE, RetryReason.PAYLOAD, RetryReason.UNKNOWN];
  return reasons.map((reason: RetryReason): string => {
    const rules: RetryRule[] = rulesOf(reason);
    const retryable: number = rules.filter((rule: RetryRule): boolean => rule.retryable()).length;
    return localize('ac_retrypolicy_050', [reasonLabel(reason), rules.length, retryable]);
  });
}
