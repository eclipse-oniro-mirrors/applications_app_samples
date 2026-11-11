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

import { localize, legacyLabel, registerLocaleCatalog } from '../../common/LocaleStrings';
/**
 * 恢复失败后的继续操作。
 *
 * 接续链路有四种典型失败，处置方式完全不同，混在一起就会给出错误建议：
 *   - 目标页面不存在：用户可能装了旧版，此时回滚到本机缓存比"重试接续"更有用；
 *   - 内容版本已变化：对端比本地新，强行写入会覆盖用户的新改动；
 *   - 写入结果不确定：写调用超时，磁盘上可能已经写了一半，必须先读回再决定；
 *   - 旧回执迟到：上一次接续的回执在新会话里才到达，不能据此改写当前内容。
 *
 * 这里把失败类型、可执行动作与用户可见文案写在同一张表里，
 * 页面只按判定给出按钮，不自行拼建议。
 */

/** 失败类型。取值是稳定标识，显示经 legacyLabel 映射。 */
export enum RecoveryCase {
  TARGET_MISSING = 'targetMissing',
  VERSION_CHANGED = 'versionChanged',
  WRITE_UNCERTAIN = 'writeUncertain',
  STALE_RECEIPT = 'staleReceipt',
  NONE = 'none'
}

/** 可执行动作。取值是稳定标识，显示经 legacyLabel 映射。 */
export enum RecoveryAction {
  RETRY = 'retry',
  ROLLBACK = 'rollback',
  KEEP_LOCAL = 'keepLocal',
  EXPORT_THEN_RESET = 'exportThenReset',
  ASK_USER = 'askUser',
  NONE = 'none'
}

/** 一条恢复规则。 */
export class RecoveryRule {
  public code: string = '';
  public failure: RecoveryCase = RecoveryCase.NONE;
  public action: RecoveryAction = RecoveryAction.NONE;
  /** 该动作是否可能丢失数据。 */
  public lossy: boolean = false;
  /** 是否必须先读回磁盘。 */
  public mustReread: boolean = false;
  public userText: string = '';

  constructor(code: string = '', failure: RecoveryCase = RecoveryCase.NONE,
    action: RecoveryAction = RecoveryAction.NONE, lossy: boolean = false,
    mustReread: boolean = false, userText: string = '') {
    this.code = code;
    this.failure = failure;
    this.action = action;
    this.lossy = lossy;
    this.mustReread = mustReread;
    this.userText = userText;
  }

  public describe(): string {
    return `${this.code}｜${legacyLabel(this.failure as string)} → ${legacyLabel(this.action as string)}｜` +
      `${this.lossy ? localize('ac_recoveryplan_012') : localize('ac_recoveryplan_013')}${this.mustReread ? localize('ac_recoveryplan_014') : ''}`;
  }
}

/**
 * 恢复规则表。
 *
 * 原则：凡是"可能已经写进去了"的情况，一律先读回再决定，不允许直接重试写入。
 */
function createRECOVERY_RULES(): RecoveryRule[] {
  return [
  new RecoveryRule('RC-01', RecoveryCase.TARGET_MISSING, RecoveryAction.ROLLBACK, false, false,
    localize('ac_recoveryplan_015')),
  new RecoveryRule('RC-02', RecoveryCase.TARGET_MISSING, RecoveryAction.EXPORT_THEN_RESET, true, false,
    localize('ac_recoveryplan_016')),
  new RecoveryRule('RC-03', RecoveryCase.VERSION_CHANGED, RecoveryAction.KEEP_LOCAL, false, false,
    localize('ac_recoveryplan_017')),
  new RecoveryRule('RC-04', RecoveryCase.VERSION_CHANGED, RecoveryAction.ASK_USER, false, false,
    localize('ac_recoveryplan_018')),
  new RecoveryRule('RC-05', RecoveryCase.WRITE_UNCERTAIN, RecoveryAction.RETRY, false, true,
    localize('ac_recoveryplan_019')),
  new RecoveryRule('RC-06', RecoveryCase.WRITE_UNCERTAIN, RecoveryAction.ASK_USER, true, true,
    localize('ac_recoveryplan_020')),
  new RecoveryRule('RC-07', RecoveryCase.STALE_RECEIPT, RecoveryAction.NONE, false, false,
    localize('ac_recoveryplan_021')),
  new RecoveryRule('RC-08', RecoveryCase.STALE_RECEIPT, RecoveryAction.ASK_USER, false, false,
    localize('ac_recoveryplan_022')),
  new RecoveryRule('RC-09', RecoveryCase.NONE, RecoveryAction.NONE, false, false, ''),
  new RecoveryRule('RC-10', RecoveryCase.TARGET_MISSING, RecoveryAction.RETRY, false, false,
    localize('ac_recoveryplan_023')),
  new RecoveryRule('RC-11', RecoveryCase.WRITE_UNCERTAIN, RecoveryAction.EXPORT_THEN_RESET, true, true,
    localize('ac_recoveryplan_024')),
  new RecoveryRule('RC-12', RecoveryCase.VERSION_CHANGED, RecoveryAction.RETRY, false, true,
    localize('ac_recoveryplan_025'))
];
}

export const RECOVERY_RULES: RecoveryRule[] = createRECOVERY_RULES();
registerLocaleCatalog((): void => {
  RECOVERY_RULES.splice(0, RECOVERY_RULES.length);
  createRECOVERY_RULES().forEach((item: RecoveryRule): void => { RECOVERY_RULES.push(item); });
});

function rulesOf(failure: RecoveryCase): RecoveryRule[] {
  return RECOVERY_RULES.filter((rule: RecoveryRule): boolean => rule.failure === failure);
}

/** 一次恢复决策的输入。 */
export class RecoveryInput {
  public failure: RecoveryCase = RecoveryCase.NONE;
  /** 本机是否有可回滚缓存。 */
  public hasLocalCache: boolean = false;
  /** 对端修订号是否高于本地。 */
  public remoteNewer: boolean = false;
  /** 本机是否也有未保存改动。 */
  public localDirty: boolean = false;
  /** 读回磁盘是否成功。 */
  public rereadOk: boolean = true;
  /** 是否已重试过。 */
  public retried: boolean = false;
  /** 回执修订号是否高于本地。 */
  public receiptHigher: boolean = false;
}

/** 决策结果。 */
export class RecoveryDecision {
  public code: string = '';
  public action: RecoveryAction = RecoveryAction.NONE;
  public lossy: boolean = false;
  public mustReread: boolean = false;
  public userText: string = '';

  constructor(code: string = '', action: RecoveryAction = RecoveryAction.NONE,
    lossy: boolean = false, mustReread: boolean = false, userText: string = '') {
    this.code = code;
    this.action = action;
    this.lossy = lossy;
    this.mustReread = mustReread;
    this.userText = userText;
  }

  /** 是否有可执行的下一步。 */
  public actionable(): boolean {
    return this.action !== RecoveryAction.NONE;
  }

  public describe(): string {
    return this.actionable() ? `${this.code}｜${legacyLabel(this.action as string)}｜${this.userText}` :
      localize('ac_recoveryplan_026', [this.code]);
  }
}

function pick(code: string): RecoveryDecision {
  const rule = RECOVERY_RULES.find((item: RecoveryRule): boolean => item.code === code);
  if (rule === undefined) {
    return new RecoveryDecision('RC-09', RecoveryAction.NONE, false, false, '');
  }
  return new RecoveryDecision(rule.code, rule.action, rule.lossy, rule.mustReread, rule.userText);
}

/**
 * 判定恢复动作。
 *
 * 每个失败类型内部按"信息量从少到多"选择最保守的一条：
 * 有缓存就先回滚，没有缓存才导出重置；能读回就不猜，读不回才交用户。
 */
export function planRecovery(input: RecoveryInput): RecoveryDecision {
  switch (input.failure) {
    case RecoveryCase.TARGET_MISSING: {
      if (input.hasLocalCache) {
        return pick('RC-01');
      }
      if (!input.retried) {
        return pick('RC-10');
      }
      return pick('RC-02');
    }
    case RecoveryCase.VERSION_CHANGED: {
      if (input.localDirty) {
        return input.retried ? pick('RC-03') : pick('RC-04');
      }
      return input.remoteNewer ? pick('RC-03') : pick('RC-12');
    }
    case RecoveryCase.WRITE_UNCERTAIN: {
      if (!input.rereadOk) {
        return pick('RC-06');
      }
      if (input.localDirty) {
        return pick('RC-11');
      }
      return pick('RC-05');
    }
    case RecoveryCase.STALE_RECEIPT: {
      return input.receiptHigher ? pick('RC-08') : pick('RC-07');
    }
    default:
      return pick('RC-09');
  }
}

/** 该失败类型是否必须读回。 */
export function requiresReread(failure: RecoveryCase): boolean {
  return rulesOf(failure).some((rule: RecoveryRule): boolean => rule.mustReread);
}

/** 该失败类型存在可能丢数据的动作。 */
export function hasLossyAction(failure: RecoveryCase): boolean {
  return rulesOf(failure).some((rule: RecoveryRule): boolean => rule.lossy);
}

/** 规则表展示行。 */
export function recoveryLines(): string[] {
  return RECOVERY_RULES.map((rule: RecoveryRule): string => rule.describe());
}

/** 某失败类型可执行的动作清单。 */
export function actionsOf(failure: RecoveryCase): RecoveryAction[] {
  const actions: RecoveryAction[] = [];
  rulesOf(failure).forEach((rule: RecoveryRule): void => {
    if (actions.indexOf(rule.action) < 0) {
      actions.push(rule.action);
    }
  });
  return actions;
}

/** 一句话摘要。 */
export function recoverySummary(decision: RecoveryDecision): string {
  if (!decision.actionable()) {
    return localize('ac_recoveryplan_027');
  }
  const risk: string = decision.lossy ? localize('ac_recoveryplan_028') : '';
  return `${legacyLabel(decision.action as string)}${risk}：${decision.userText}`;
}
