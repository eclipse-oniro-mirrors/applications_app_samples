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
 * 快捷入口到页面的声明式路由表。
 *
 * 快捷方式只带一个 id 与少量参数进入应用，具体落到哪个页面、参数缺了怎么兜底、
 * 是否已过期，全部由路由表描述。页面不再各自解析 want。
 */

/** 可路由页面。 */
export enum RoutePage {
  HOME = 'home',
  NOTE = 'note',
  TODO = 'todo',
  COLLECTION = 'collection',
  DETAIL = 'detail',
  CALL_LOG = 'calls',
  RULE_CENTER = 'ruleCenter',
  UNKNOWN = 'unknown'
}

/** 参数取值类别。 */
export enum ParamKind {
  TEXT = 'text',
  NUMBER = 'number',
  BOOLEAN = 'boolean',
  ID = 'id'
}

/** 路由参数定义。 */
export class RouteParam {
  public name: string = '';
  public kind: ParamKind = ParamKind.TEXT;
  public required: boolean = false;
  public fallback: string = '';

  constructor(name: string = '', kind: ParamKind = ParamKind.TEXT, required: boolean = false,
    fallback: string = '') {
    this.name = name;
    this.kind = kind;
    this.required = required;
    this.fallback = fallback;
  }

  /** 取值是否合法。 */
  accepts(value: string): boolean {
    if (value.length === 0) {
      return !this.required;
    }
    switch (this.kind) {
      case ParamKind.NUMBER:
        return /^-?\d+$/.test(value);
      case ParamKind.BOOLEAN:
        return value === 'true' || value === 'false';
      case ParamKind.ID:
        return /^[A-Za-z0-9_.:-]+$/.test(value);
      default:
        return true;
    }
  }

  /** 归一化。 */
  coerce(value: string): string {
    return this.accepts(value) ? value : this.fallback;
  }

  text(): string {
    return `${this.name}(${this.kind as string})${this.required ? uiText("shortcut_text_0072") : uiText("shortcut_text_0632")}`;
  }
}

/** 路由条目。 */
export class RouteEntry {
  public routeId: string = '';
  public page: RoutePage = RoutePage.UNKNOWN;
  public params: RouteParam[] = [];
  /** 是否要求已登录。 */
  public requiresLogin: boolean = false;
  /** 入口有效期（毫秒）；0 表示不过期。 */
  public maxAgeMs: number = 0;
  private descriptionValue: string = '';
  get description(): string { return resourceText(this.descriptionValue); }
  set description(value: string) { this.descriptionValue = value; }

  constructor(routeId: string = '', page: RoutePage = RoutePage.UNKNOWN, params: RouteParam[] = [],
    requiresLogin: boolean = false, maxAgeMs: number = 0, description: string = '') {
    this.routeId = routeId;
    this.page = page;
    this.params = params;
    this.requiresLogin = requiresLogin;
    this.maxAgeMs = maxAgeMs;
    this.description = description;
  }

  /** 取参数定义。 */
  paramOf(name: string): RouteParam | undefined {
    return this.params.find((param: RouteParam): boolean => param.name === name);
  }

  text(): string {
    const names: string = this.params.length === 0 ? uiText("shortcut_text_0596") :
      this.params.map((param: RouteParam): string => param.name).join(',');
    return `${this.routeId} -> ${this.page as string}｜${names}｜` +
      `${this.requiresLogin ? uiText("shortcut_text_0626") : uiText("shortcut_text_0401")}`;
  }
}

/** 路由表。routeId 与 module.json5 中声明的快捷方式 id 对应。 */
export const ROUTE_TABLE: RouteEntry[] = [
  new RouteEntry('sc.note.new', RoutePage.NOTE,
    [new RouteParam('draftId', ParamKind.ID, false, ''), new RouteParam('focus', ParamKind.BOOLEAN,
      false, 'true')], false, 0, "@string/shortcut_text_0181"),
  new RouteEntry('sc.todo.today', RoutePage.TODO,
    [new RouteParam('date', ParamKind.TEXT, false, 'today'),
      new RouteParam('filter', ParamKind.TEXT, false, 'all')], false, 0, "@string/shortcut_text_0186"),
  new RouteEntry('sc.collection.saved', RoutePage.COLLECTION,
    [new RouteParam('tag', ParamKind.TEXT, false, ''), new RouteParam('sort', ParamKind.TEXT, false,
      'recent')], false, 0, "@string/shortcut_text_0187"),
  new RouteEntry('sc.detail', RoutePage.DETAIL,
    [new RouteParam('noteId', ParamKind.ID, true, '')], true, 0, "@string/shortcut_text_0188"),
  new RouteEntry('sc.calls', RoutePage.CALL_LOG,
    [new RouteParam('range', ParamKind.TEXT, false, 'week')], false, 0, "@string/shortcut_text_0183"),
  new RouteEntry('sc.rule.center', RoutePage.RULE_CENTER, [], false, 0, "@string/shortcut_text_0185"),
  new RouteEntry('sc.note.resume', RoutePage.NOTE,
    [new RouteParam('draftId', ParamKind.ID, true, '')], false, 600000,
    "@string/shortcut_text_0283"),
  new RouteEntry('sc.todo.detail', RoutePage.DETAIL,
    [new RouteParam('todoId', ParamKind.ID, true, ''),
      new RouteParam('from', ParamKind.TEXT, false, 'shortcut')], true, 1800000,
    "@string/shortcut_text_0182")
];

/** 路由 id 列表。 */
export function routeIds(): string[] {
  return ROUTE_TABLE.map((entry: RouteEntry): string => entry.routeId);
}

/** 按 id 取路由。 */
export function routeOf(routeId: string): RouteEntry | undefined {
  return ROUTE_TABLE.find((entry: RouteEntry): boolean => entry.routeId === routeId);
}

/** 取目标页面；未知路由返回 HOME，保证不会白屏。 */
export function pageOf(routeId: string): RoutePage {
  const entry: RouteEntry | undefined = routeOf(routeId);
  return entry === undefined ? RoutePage.HOME : entry.page;
}

/** 入口请求。 */
export class RouteRequest {
  public routeId: string = '';
  /** 平铺的键值对，避免依赖 Map 的序列化行为。 */
  public keys: string[] = [];
  public values: string[] = [];
  public at: number = 0;
  public loggedIn: boolean = false;

  constructor(routeId: string = '', at: number = 0) {
    this.routeId = routeId;
    this.at = at;
  }

  /** 设置参数。 */
  put(name: string, value: string): RouteRequest {
    const index: number = this.keys.indexOf(name);
    if (index >= 0) {
      this.values[index] = value;
    } else {
      this.keys.push(name);
      this.values.push(value);
    }
    return this;
  }

  /** 取参数。 */
  get(name: string): string {
    const index: number = this.keys.indexOf(name);
    return index < 0 ? '' : this.values[index];
  }

  /** 参数文本，便于日志。 */
  text(): string {
    const pairs: string[] = this.keys.map((key: string): string => `${key}=${this.get(key)}`);
    return `${this.routeId}?${pairs.join('&')}`;
  }
}

/** 解析结果。 */
export class RouteResolution {
  public ok: boolean = false;
  public page: RoutePage = RoutePage.HOME;
  public entry: RouteEntry | undefined = undefined;
  /** 归一化后的参数。 */
  public keys: string[] = [];
  public values: string[] = [];
  public missing: string[] = [];
  public issues: string[] = [];
  public expired: boolean = false;

  /** 取参数。 */
  get(name: string): string {
    const index: number = this.keys.indexOf(name);
    return index < 0 ? '' : this.values[index];
  }

  text(): string {
    if (!this.ok) {
      return uiText("shortcut_text_0577", [String(this.issues.join('；'))]);
    }
    return uiText("shortcut_text_0005", [String(this.page as string), String(this.keys.length)]) +
      `${this.expired ? uiText("shortcut_text_0654") : uiText("shortcut_text_0704")}`;
  }
}

/** 解析入口请求。 */
export function resolveRoute(request: RouteRequest): RouteResolution {
  const result: RouteResolution = new RouteResolution();
  const entry: RouteEntry | undefined = routeOf(request.routeId);
  if (entry === undefined) {
    result.issues.push(uiText("shortcut_text_0587", [String(request.routeId)]));
    result.page = RoutePage.HOME;
    return result;
  }
  result.entry = entry;
  result.page = entry.page;
  if (entry.requiresLogin && !request.loggedIn) {
    result.issues.push(uiText("shortcut_text_0628"));
    return result;
  }
  if (entry.maxAgeMs > 0 && request.at > 0) {
    const age: number = Math.max(0, Date.now() - request.at);
    result.expired = age > entry.maxAgeMs;
  }
  entry.params.forEach((param: RouteParam): void => {
    const raw: string = request.get(param.name);
    if (raw.length === 0 && param.required) {
      result.missing.push(param.name);
      result.issues.push(uiText("shortcut_text_0469", [String(param.name)]));
      return;
    }
    const value: string = param.coerce(raw);
    if (raw.length > 0 && value !== raw) {
      result.issues.push(uiText("shortcut_text_0140", [String(param.name)]));
    }
    result.keys.push(param.name);
    result.values.push(value);
  });
  // Unknown keys are warnings; decide validity before appending localized warning text.
  const parametersValid: boolean = result.missing.length === 0 && result.issues.length === 0;
  request.keys.forEach((key: string): void => {
    if (entry.paramOf(key) === undefined) {
      result.issues.push(uiText('shortcut_text_0274', [key]));
    }
  });
  result.ok = parametersValid;
  return result;
}

/** 路由自检。 */
export class RouteAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? uiText("shortcut_text_0386") : this.findings.join('；');
  }
}

/** 校验路由表：id 唯一、必填参数有兜底或明确必填、过期时间非负。 */
export function auditRoutes(): RouteAudit {
  const audit: RouteAudit = new RouteAudit();
  const seen: string[] = [];
  ROUTE_TABLE.forEach((entry: RouteEntry): void => {
    if (seen.indexOf(entry.routeId) >= 0) {
      audit.findings.push(uiText("shortcut_text_0387", [String(entry.routeId)]));
    }
    seen.push(entry.routeId);
    if (entry.page === RoutePage.UNKNOWN) {
      audit.findings.push(uiText("shortcut_text_0412", [String(entry.routeId)]));
    }
    if (entry.description.length === 0) {
      audit.findings.push(uiText("shortcut_text_0473", [String(entry.routeId)]));
    }
    if (entry.maxAgeMs < 0) {
      audit.findings.push(uiText("shortcut_text_0705", [String(entry.routeId)]));
    }
    entry.params.forEach((param: RouteParam): void => {
      if (param.name.length === 0) {
        audit.findings.push(uiText("shortcut_text_0139", [String(entry.routeId)]));
      }
      if (param.required && param.fallback.length > 0 && param.accepts(param.fallback)) {
        audit.findings.push(uiText("shortcut_text_0073", [String(entry.routeId), String(param.name)]));
      }
    });
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 路由摘要行。 */
export function routeLines(): string[] {
  return ROUTE_TABLE.map((entry: RouteEntry): string => entry.text());
}

/** 某个页面可被哪些路由命中。 */
export function routesOfPage(page: RoutePage): string[] {
  return ROUTE_TABLE.filter((entry: RouteEntry): boolean => entry.page === page)
    .map((entry: RouteEntry): string => entry.routeId);
}
