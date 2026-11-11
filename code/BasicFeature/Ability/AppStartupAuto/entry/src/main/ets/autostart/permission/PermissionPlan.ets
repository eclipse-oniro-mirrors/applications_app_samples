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

import { formatResource, localText, registerTextRefresh } from '../text/LocalizedText';

/**
 * 权限申请编排。
 *
 * 自启相关权限在不同系统版本上的申请方式和可申请次数不同。这里把"何时申请、
 * 被拒后怎么降级、什么时候不该再弹窗"写成规则，页面只读结论。
 * 示例不伪造权限结果：全部结论都来自调用方传入的授权状态。
 */

/** 权限状态。 */
export enum PermissionState {
  UNKNOWN = 'unknown',
  GRANTED = 'granted',
  DENIED = 'denied',
  DENIED_PERMANENTLY = 'deniedPermanently',
  NOT_REQUIRED = 'notRequired'
}

/** 状态标签。 */
export function permissionLabel(state: PermissionState): string {
  switch (state) {
    case PermissionState.GRANTED:
      return localText('startup_text_0575');
    case PermissionState.DENIED:
      return localText('startup_text_0576');
    case PermissionState.DENIED_PERMANENTLY:
      return localText('startup_text_0577');
    case PermissionState.NOT_REQUIRED:
      return localText('startup_text_0578');
    default:
      return localText('startup_text_0005');
  }
}

/** 申请策略。 */
export enum RequestPolicy {
  ASK_IN_APP = 'askInApp',
  ASK_ONCE_THEN_SETTINGS = 'askOnceThenSettings',
  SETTINGS_ONLY = 'settingsOnly',
  NO_REQUEST = 'noRequest'
}

/** 一次申请的上下文。 */
export class PermissionContext {
  public apiLevel: number = 0;
  /** 已申请次数。 */
  public askedTimes: number = 0;
  public state: PermissionState = PermissionState.UNKNOWN;
  /** 本会话内是否已经弹过窗。 */
  public askedThisSession: boolean = false;
  /** 系统是否会弹出权限对话框。 */
  public systemDialogAvailable: boolean = true;

  constructor(apiLevel: number = 0, askedTimes: number = 0,
    state: PermissionState = PermissionState.UNKNOWN) {
    this.apiLevel = apiLevel;
    this.askedTimes = askedTimes;
    this.state = state;
  }

  clone(): PermissionContext {
    const copy: PermissionContext = new PermissionContext(this.apiLevel, this.askedTimes,
      this.state);
    copy.askedThisSession = this.askedThisSession;
    copy.systemDialogAvailable = this.systemDialogAvailable;
    return copy;
  }
}

/** 申请结论。 */
export class PermissionDecision {
  public policy: RequestPolicy = RequestPolicy.NO_REQUEST;
  public state: PermissionState = PermissionState.UNKNOWN;
  /** 是否可以立即发起申请。 */
  public canAsk: boolean = false;
  /** 是否应改为引导去系统设置。 */
  public needsSettings: boolean = false;
  /** 面向用户的说明。 */
  public message: string = '';
  /** 面向开发者的排查建议。 */
  public hint: string = '';
  /** 命中的规则编号，便于诊断。 */
  public ruleId: string = '';

  text(): string {
    return `${permissionLabel(this.state)}｜${this.policy as string}｜${this.message}`;
  }
}

/** 一条申请规则。 */
export class PermissionRule {
  public ruleId: string = '';
  public minApi: number = 0;
  public maxApi: number = 999;
  public maxAsks: number = 2;
  public policy: RequestPolicy = RequestPolicy.ASK_IN_APP;
  public message: string = '';
  public hint: string = '';

  constructor(ruleId: string = '', minApi: number = 0, maxApi: number = 999,
    maxAsks: number = 2, policy: RequestPolicy = RequestPolicy.ASK_IN_APP,
    message: string = '', hint: string = '') {
    this.ruleId = ruleId;
    this.minApi = minApi;
    this.maxApi = maxApi;
    this.maxAsks = maxAsks;
    this.policy = policy;
    this.message = message;
    this.hint = hint;
  }

  matches(context: PermissionContext): boolean {
    return context.apiLevel >= this.minApi && context.apiLevel <= this.maxApi;
  }

  text(): string {
    return formatResource('startup_format_b1724131f5c6', [String(this.ruleId), String(this.minApi), String(this.maxApi), String(this.maxAsks)]) +
      `${this.policy as string}`;
  }
}

/** 规则表：低版本只弹一次，高版本允许在应用内申请。 */
function createPERMISSION_RULES(): PermissionRule[] {
  return [
  new PermissionRule('PM-0001', 0, 8, 0, RequestPolicy.NO_REQUEST,
    localText('startup_text_0580'), localText('startup_text_0581')),
  new PermissionRule('PM-0002', 9, 11, 1, RequestPolicy.ASK_ONCE_THEN_SETTINGS,
    localText('startup_text_0582'), localText('startup_text_0583')),
  new PermissionRule('PM-0003', 12, 17, 2, RequestPolicy.ASK_IN_APP,
    localText('startup_text_0584'), localText('startup_text_0585')),
  new PermissionRule('PM-0004', 18, 26, 3, RequestPolicy.ASK_IN_APP,
    localText('startup_text_0586'), localText('startup_text_0587')),
  new PermissionRule('PM-0005', 27, 999, 0, RequestPolicy.SETTINGS_ONLY,
    localText('startup_text_0588'), localText('startup_text_0589'))
];
}
export const PERMISSION_RULES: PermissionRule[] = createPERMISSION_RULES();
registerTextRefresh((): void => {
  PERMISSION_RULES.splice(0, PERMISSION_RULES.length);
  createPERMISSION_RULES().forEach((item: PermissionRule): void => { PERMISSION_RULES.push(item); });
});

/** 按当前上下文给出申请结论。 */
export function planPermission(context: PermissionContext): PermissionDecision {
  const decision: PermissionDecision = new PermissionDecision();
  if (context.state === PermissionState.GRANTED) {
    decision.state = PermissionState.GRANTED;
    decision.policy = RequestPolicy.NO_REQUEST;
    decision.message = localText('startup_text_0590');
    decision.hint = localText('startup_text_0591');
    decision.ruleId = 'PM-GRANTED';
    return decision;
  }
  if (context.state === PermissionState.NOT_REQUIRED) {
    decision.state = PermissionState.NOT_REQUIRED;
    decision.policy = RequestPolicy.NO_REQUEST;
    decision.message = localText('startup_text_0592');
    decision.hint = localText('startup_text_0593');
    decision.ruleId = 'PM-NOT-REQUIRED';
    return decision;
  }
  let rule: PermissionRule = PERMISSION_RULES[0];
  for (const candidate of PERMISSION_RULES) {
    if (candidate.matches(context)) {
      rule = candidate;
      break;
    }
  }
  decision.ruleId = rule.ruleId;
  decision.policy = rule.policy;
  decision.state = context.state;
  decision.hint = rule.hint;
  if (context.state === PermissionState.DENIED_PERMANENTLY) {
    decision.state = PermissionState.DENIED_PERMANENTLY;
    decision.canAsk = false;
    decision.needsSettings = true;
    decision.message = localText('startup_text_0594');
    return decision;
  }
  if (rule.policy === RequestPolicy.NO_REQUEST) {
    decision.canAsk = false;
    decision.needsSettings = false;
    decision.message = rule.message;
    return decision;
  }
  if (rule.policy === RequestPolicy.SETTINGS_ONLY) {
    decision.canAsk = false;
    decision.needsSettings = true;
    decision.message = rule.message;
    return decision;
  }
  if (!context.systemDialogAvailable) {
    decision.canAsk = false;
    decision.needsSettings = true;
    decision.message = localText('startup_text_0595');
    decision.hint = localText('startup_text_0596');
    return decision;
  }
  if (context.askedTimes >= rule.maxAsks) {
    decision.canAsk = false;
    decision.needsSettings = true;
    decision.message = formatResource('startup_format_94488c103af8', [String(context.askedTimes)]);
    return decision;
  }
  if (context.askedThisSession && rule.policy === RequestPolicy.ASK_ONCE_THEN_SETTINGS) {
    decision.canAsk = false;
    decision.needsSettings = true;
    decision.message = localText('startup_text_0599');
    return decision;
  }
  decision.canAsk = true;
  decision.needsSettings = false;
  decision.message = rule.message;
  return decision;
}

/** 申请一次后的新状态：不改写真实授权结果，只推进计数。 */
export function afterAsk(context: PermissionContext,
  granted: boolean): PermissionContext {
  const next: PermissionContext = context.clone();
  next.askedTimes = context.askedTimes + 1;
  next.askedThisSession = true;
  next.state = granted ? PermissionState.GRANTED : PermissionState.DENIED;
  return next;
}

/** 用户选择"不再询问"后的状态。 */
export function afterDontAskAgain(context: PermissionContext): PermissionContext {
  const next: PermissionContext = context.clone();
  next.state = PermissionState.DENIED_PERMANENTLY;
  next.askedThisSession = true;
  return next;
}

/** 规则表自检：编号唯一、区间连续、说明非空。 */
export class PermissionAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    if (this.ok) {
      return localText('startup_text_0600');
    }
    return this.findings.join('；');
  }
}

export function auditPermissionRules(): PermissionAudit {
  const audit: PermissionAudit = new PermissionAudit();
  const seen: string[] = [];
  PERMISSION_RULES.forEach((rule: PermissionRule): void => {
    if (seen.indexOf(rule.ruleId) >= 0) {
      audit.findings.push(formatResource('startup_format_0b1a69c1018e', [String(rule.ruleId)]));
    }
    seen.push(rule.ruleId);
    if (rule.maxApi < rule.minApi) {
      audit.findings.push(formatResource('startup_format_94cc653b44b9', [String(rule.ruleId)]));
    }
    if (rule.message.length === 0 || rule.hint.length === 0) {
      audit.findings.push(formatResource('startup_format_16333e169681', [String(rule.ruleId)]));
    }
    if (rule.policy === RequestPolicy.ASK_IN_APP && rule.maxAsks <= 0) {
      audit.findings.push(formatResource('startup_format_4435339e60fa', [String(rule.ruleId)]));
    }
  });
  for (let api = 0; api <= 30; api++) {
    let hit: boolean = false;
    PERMISSION_RULES.forEach((rule: PermissionRule): void => {
      if (api >= rule.minApi && api <= rule.maxApi) {
        hit = true;
      }
    });
    if (!hit) {
      audit.findings.push(formatResource('startup_format_b82568a32a62', [String(api)]));
    }
  }
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 规则摘要行。 */
export function permissionLines(): string[] {
  return PERMISSION_RULES.map((rule: PermissionRule): string => rule.text());
}

/** 某 API 段上的策略序列，供矩阵展示。 */
export function policySeries(): string[] {
  const series: string[] = [];
  for (let api = 8; api <= 28; api++) {
    const decision: PermissionDecision = planPermission(
      new PermissionContext(api, 0, PermissionState.DENIED));
    series.push(`${api}:${decision.policy as string}`);
  }
  return series;
}
