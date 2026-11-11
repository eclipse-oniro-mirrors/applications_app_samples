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
 * 入口意图解析。
 *
 * 快捷方式、深链、通知、小组件、进程恢复都会带着参数进入应用。此前各入口自己解析，
 * 导致"同一个页面在不同入口下参数缺失行为不一致"。这里把入口来源、URI 前缀、
 * 必填参数与目标路由写成规则表，解析结果统一交给路由表使用。
 */

/** 入口来源。 */
export enum EntrySource {
  SHORTCUT = 'shortcut',
  DEEPLINK = 'deeplink',
  NOTIFICATION = 'notification',
  WIDGET = 'widget',
  RESUME = 'resume',
  UNKNOWN = 'unknown'
}

/** 来源标签。 */
export function sourceLabel(source: EntrySource): string {
  switch (source) {
    case EntrySource.SHORTCUT:
      return uiText("shortcut_text_0787");
    case EntrySource.DEEPLINK:
      return uiText("shortcut_text_0505");
    case EntrySource.NOTIFICATION:
      return uiText("shortcut_text_0550");
    case EntrySource.WIDGET:
      return uiText("shortcut_text_0611");
    case EntrySource.RESUME:
      return uiText("shortcut_text_0342");
    default:
      return uiText("shortcut_text_0584");
  }
}

/** 一条入口规则。 */
export class EntryRule {
  public ruleId: string = '';
  public source: EntrySource = EntrySource.SHORTCUT;
  /** URI 前缀；空串表示不限制。 */
  public prefix: string = '';
  /** 目标路由编号，需存在于路由表中。 */
  public routeId: string = '';
  /** 必需的查询参数名。 */
  public requiredKeys: string[] = [];
  /** 优先级，数值越大越先匹配。 */
  public priority: number = 0;
  /** 是否需要已登录。 */
  public requiresLogin: boolean = false;
  private descriptionValue: string = '';
  get description(): string { return resourceText(this.descriptionValue); }
  set description(value: string) { this.descriptionValue = value; }

  constructor(ruleId: string = '', source: EntrySource = EntrySource.SHORTCUT,
    prefix: string = '', routeId: string = '', requiredKeys: string[] = [], priority: number = 0,
    requiresLogin: boolean = false, description: string = '') {
    this.ruleId = ruleId;
    this.source = source;
    this.prefix = prefix;
    this.routeId = routeId;
    this.requiredKeys = requiredKeys;
    this.priority = priority;
    this.requiresLogin = requiresLogin;
    this.description = description;
  }

  /** URI 是否匹配前缀。 */
  matchesUri(uri: string): boolean {
    if (this.prefix.length === 0) {
      return true;
    }
    return uri.indexOf(this.prefix) === 0;
  }

  text(): string {
    return `${this.ruleId} ${sourceLabel(this.source)}｜${this.prefix.length > 0 ? this.prefix : '*'}` +
      uiText("shortcut_text_0001", [String(this.routeId), String(this.priority)]);
  }
}

/** 规则表。 */
export const ENTRY_RULES: EntryRule[] = [
  new EntryRule('IN-01', EntrySource.SHORTCUT, 'shortcut://note/new', 'sc.note.new', [],
    90, false, "@string/shortcut_text_0087"),
  new EntryRule('IN-02', EntrySource.SHORTCUT, 'shortcut://todo/today', 'sc.todo.today', [],
    90, false, "@string/shortcut_text_0336"),
  new EntryRule('IN-03', EntrySource.SHORTCUT, 'shortcut://collection/saved', 'sc.collection.saved',
    [], 90, false, "@string/shortcut_text_0519"),
  new EntryRule('IN-04', EntrySource.SHORTCUT, 'shortcut://detail', 'sc.detail', ['noteId'],
    90, true, "@string/shortcut_text_0609"),
  new EntryRule('IN-05', EntrySource.DEEPLINK, 'app://note', 'sc.note.new', [], 80, false,
    "@string/shortcut_text_0506"),
  new EntryRule('IN-06', EntrySource.DEEPLINK, 'app://todo', 'sc.todo.today', [], 80, false,
    "@string/shortcut_text_0507"),
  new EntryRule('IN-07', EntrySource.DEEPLINK, 'app://detail', 'sc.detail', ['noteId'], 80, true,
    "@string/shortcut_text_0510"),
  new EntryRule('IN-08', EntrySource.DEEPLINK, 'app://calls', 'sc.calls', [], 80, false,
    "@string/shortcut_text_0508"),
  new EntryRule('IN-09', EntrySource.DEEPLINK, 'app://rule', 'sc.rule.center', [], 80, false,
    "@string/shortcut_text_0509"),
  new EntryRule('IN-10', EntrySource.NOTIFICATION, 'notify://todo', 'sc.todo.detail', ['todoId'],
    70, true, "@string/shortcut_text_0553"),
  new EntryRule('IN-11', EntrySource.NOTIFICATION, 'notify://calls', 'sc.calls', [], 70,
    false, "@string/shortcut_text_0551"),
  new EntryRule('IN-12', EntrySource.NOTIFICATION, 'notify://collection', 'sc.collection.saved',
    [], 70, false, "@string/shortcut_text_0552"),
  new EntryRule('IN-13', EntrySource.WIDGET, 'widget://note', 'sc.note.new', [], 60, false,
    "@string/shortcut_text_0614"),
  new EntryRule('IN-14', EntrySource.WIDGET, 'widget://todo', 'sc.todo.today', [], 60, false,
    "@string/shortcut_text_0612"),
  new EntryRule('IN-15', EntrySource.WIDGET, 'widget://collection', 'sc.collection.saved', [], 60,
    false, "@string/shortcut_text_0613"),
  new EntryRule('IN-16', EntrySource.RESUME, 'resume://note', 'sc.note.resume', ['draftId'], 50,
    false, "@string/shortcut_text_0284"),
  new EntryRule('IN-17', EntrySource.RESUME, 'resume://detail', 'sc.detail', ['noteId'], 50, true,
    "@string/shortcut_text_0288"),
  new EntryRule('IN-18', EntrySource.SHORTCUT, '', 'sc.rule.center', [], 10, false,
    "@string/shortcut_text_0578"),
  new EntryRule('IN-19', EntrySource.DEEPLINK, '', 'sc.calls', [], 10, false,
    "@string/shortcut_text_0579"),
  new EntryRule('IN-20', EntrySource.UNKNOWN, '', 'sc.rule.center', [], 0, false,
    "@string/shortcut_text_0586")
];

/** 规则编号列表。 */
export function ruleIds(): string[] {
  return ENTRY_RULES.map((rule: EntryRule): string => rule.ruleId);
}

/** 按编号取规则。 */
export function ruleOf(ruleId: string): EntryRule | undefined {
  return ENTRY_RULES.find((rule: EntryRule): boolean => rule.ruleId === ruleId);
}

/** 按来源取规则。 */
export function rulesOf(source: EntrySource): EntryRule[] {
  return ENTRY_RULES.filter((rule: EntryRule): boolean => rule.source === source);
}

/** 一条入口请求。 */
export class EntryRequest {
  public source: EntrySource = EntrySource.UNKNOWN;
  public uri: string = '';
  public keys: string[] = [];
  public values: string[] = [];
  public loggedIn: boolean = false;

  constructor(source: EntrySource = EntrySource.UNKNOWN, uri: string = '') {
    this.source = source;
    this.uri = uri;
  }

  /** 设置参数。 */
  put(key: string, value: string): EntryRequest {
    const index: number = this.keys.indexOf(key);
    if (index >= 0) {
      this.values[index] = value;
    } else {
      this.keys.push(key);
      this.values.push(value);
    }
    return this;
  }

  /** 取参数。 */
  get(key: string): string {
    const index: number = this.keys.indexOf(key);
    return index < 0 ? '' : this.values[index];
  }

  text(): string {
    const pairs: string[] = this.keys.map((key: string): string => `${key}=${this.get(key)}`);
    return `${this.source as string}:${this.uri}?${pairs.join('&')}`;
  }
}

/** 从 URI 中抽出查询参数。 */
export function parseUri(uri: string): EntryRequest {
  const request: EntryRequest = new EntryRequest(EntrySource.UNKNOWN, uri);
  const index: number = uri.indexOf('?');
  if (index < 0) {
    request.uri = uri;
    return request;
  }
  request.uri = uri.slice(0, index);
  const query: string = uri.slice(index + 1);
  query.split('&').forEach((pair: string): void => {
    if (pair.length === 0) {
      return;
    }
    const eq: number = pair.indexOf('=');
    if (eq <= 0) {
      return;
    }
    request.put(pair.slice(0, eq), decodeURIComponent(pair.slice(eq + 1)));
  });
  return request;
}

/** 解析结果。 */
export class EntryPlan {
  public source: EntrySource = EntrySource.UNKNOWN;
  public routeId: string = '';
  public matchedRuleId: string = '';
  /** 是否使用了兜底规则。 */
  public fallback: boolean = false;
  public missing: string[] = [];
  public issues: string[] = [];

  /** 是否可直接进入。 */
  ok(): boolean {
    return this.issues.length === 0 && this.missing.length === 0 && this.routeId.length > 0;
  }

  text(): string {
    if (this.routeId.length === 0) {
      return uiText("shortcut_text_0577", [String(this.issues.join('；'))]);
    }
    const state: string = this.ok() ? uiText("shortcut_text_0359") : uiText("shortcut_text_0625");
    return uiText("shortcut_text_0028", [String(this.routeId), String(state), String(this.matchedRuleId)]) +
      `${this.fallback ? uiText("shortcut_text_0220") : uiText("shortcut_text_0346")}`;
  }
}

/** 按优先级排序规则。 */
function orderedRules(source: EntrySource): EntryRule[] {
  const list: EntryRule[] = ENTRY_RULES.filter((rule: EntryRule): boolean =>
    rule.source === source);
  list.sort((left: EntryRule, right: EntryRule): number => right.priority - left.priority);
  return list;
}

/** 解析入口请求。 */
export function resolveEntry(request: EntryRequest): EntryPlan {
  const plan: EntryPlan = new EntryPlan();
  plan.source = request.source;
  const rules: EntryRule[] = orderedRules(request.source);
  let matched: EntryRule | undefined = undefined;
  for (const rule of rules) {
    if (rule.matchesUri(request.uri)) {
      matched = rule;
      break;
    }
  }
  if (matched === undefined) {
    plan.issues.push(uiText("shortcut_text_0373", [String(sourceLabel(request.source))]));
    return plan;
  }
  plan.routeId = matched.routeId;
  plan.matchedRuleId = matched.ruleId;
  plan.fallback = matched.priority <= 10;
  if (matched.requiresLogin && !request.loggedIn) {
    plan.issues.push(uiText("shortcut_text_0628"));
  }
  matched.requiredKeys.forEach((key: string): void => {
    const value: string = request.get(key);
    if (value.length === 0) {
      plan.missing.push(key);
      plan.issues.push(uiText("shortcut_text_0471", [String(key)]));
    }
  });
  request.keys.forEach((key: string): void => {
    if (matched !== undefined && matched.requiredKeys.indexOf(key) >= 0) {
      return;
    }
    if (key.length > 0 && matched !== undefined && matched.requiredKeys.length === 0) {
      plan.issues.push(uiText("shortcut_text_0272", [String(key)]));
    }
  });
  return plan;
}

/** 各来源可用规则数。 */
export function sourceCounts(): number[] {
  const sources: EntrySource[] = [EntrySource.SHORTCUT, EntrySource.DEEPLINK,
    EntrySource.NOTIFICATION, EntrySource.WIDGET, EntrySource.RESUME, EntrySource.UNKNOWN];
  return sources.map((source: EntrySource): number => rulesOf(source).length);
}

/** 入口自检。 */
export class EntryAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? uiText("shortcut_text_0488") : this.findings.join('；');
  }
}

/** 校验规则表：编号连续、优先级非负、每条来源都有兜底、带必填参数的规则需登录或明确标注。 */
export function auditEntry(): EntryAudit {
  const audit: EntryAudit = new EntryAudit();
  ENTRY_RULES.forEach((rule: EntryRule, index: number): void => {
    const expected: string = `IN-${(index + 1).toString().padStart(2, '0')}`;
    if (rule.ruleId !== expected) {
      audit.findings.push(uiText("shortcut_text_0075", [String(expected), String(rule.ruleId)]));
    }
    if (rule.routeId.length === 0) {
      audit.findings.push(uiText("shortcut_text_0472", [String(rule.ruleId)]));
    }
    if (rule.priority < 0) {
      audit.findings.push(uiText("shortcut_text_0702", [String(rule.ruleId)]));
    }
    if (rule.description.length === 0) {
      audit.findings.push(uiText("shortcut_text_0473", [String(rule.ruleId)]));
    }
    if (rule.requiredKeys.length > 0 && rule.priority <= 10) {
      audit.findings.push(uiText("shortcut_text_0221", [String(rule.ruleId)]));
    }
  });
  const sources: EntrySource[] = [EntrySource.SHORTCUT, EntrySource.DEEPLINK,
    EntrySource.NOTIFICATION, EntrySource.WIDGET, EntrySource.RESUME, EntrySource.UNKNOWN];
  sources.forEach((source: EntrySource): void => {
    if (rulesOf(source).length === 0) {
      audit.findings.push(uiText("shortcut_text_0375", [String(sourceLabel(source))]));
    }
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 规则摘要行。 */
export function ruleLines(): string[] {
  return ENTRY_RULES.map((rule: EntryRule): string => rule.text());
}

/** 来源分布行。 */
export function sourceLines(): string[] {
  const sources: EntrySource[] = [EntrySource.SHORTCUT, EntrySource.DEEPLINK,
    EntrySource.NOTIFICATION, EntrySource.WIDGET, EntrySource.RESUME, EntrySource.UNKNOWN];
  return sources.map((source: EntrySource): string =>
    uiText("shortcut_text_0018", [String(sourceLabel(source)), String(rulesOf(source).length)]));
}
