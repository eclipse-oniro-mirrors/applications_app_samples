/**
 * 入口意图解析。
 *
 * 快捷方式、深链、通知、小组件、进程恢复都会带着参数进入应用。此前各入口自己解析，
 * 导致"同一个页面在不同入口下参数缺失行为不一致"。这里把入口来源、URI 前缀、
 * 必填参数与目标路由写成规则表，解析结果统一交给路由表使用。
 */

/** 入口来源。 */
export enum IntentSource {
  SHORTCUT = 'shortcut',
  DEEPLINK = 'deeplink',
  NOTIFICATION = 'notification',
  WIDGET = 'widget',
  RESUME = 'resume',
  UNKNOWN = 'unknown'
}

/** 来源标签。 */
export function sourceLabel(source: IntentSource): string {
  switch (source) {
    case IntentSource.SHORTCUT:
      return '桌面快捷方式';
    case IntentSource.DEEPLINK:
      return '深链';
    case IntentSource.NOTIFICATION:
      return '通知';
    case IntentSource.WIDGET:
      return '小组件';
    case IntentSource.RESUME:
      return '进程恢复';
    default:
      return '未知来源';
  }
}

/** 一条入口规则。 */
export class IntentRule {
  public ruleId: string = '';
  public source: IntentSource = IntentSource.SHORTCUT;
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
  public description: string = '';

  constructor(ruleId: string = '', source: IntentSource = IntentSource.SHORTCUT,
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
      ` -> ${this.routeId}｜优先级 ${this.priority}`;
  }
}

/** 规则表。 */
export const INTENT_RULES: IntentRule[] = [
  new IntentRule('IN-01', IntentSource.SHORTCUT, 'shortcut://note/new', 'sc.note.new', [],
    90, false, '便签新建快捷方式'),
  new IntentRule('IN-02', IntentSource.SHORTCUT, 'shortcut://todo/today', 'sc.todo.today', [],
    90, false, '今日待办快捷方式'),
  new IntentRule('IN-03', IntentSource.SHORTCUT, 'shortcut://collection/saved', 'sc.collection.saved',
    [], 90, false, '收藏列表快捷方式'),
  new IntentRule('IN-04', IntentSource.SHORTCUT, 'shortcut://detail', 'sc.detail', ['noteId'],
    90, true, '详情快捷方式必须带 noteId'),
  new IntentRule('IN-05', IntentSource.DEEPLINK, 'app://note', 'sc.note.new', [], 80, false,
    '深链打开便签'),
  new IntentRule('IN-06', IntentSource.DEEPLINK, 'app://todo', 'sc.todo.today', [], 80, false,
    '深链打开待办'),
  new IntentRule('IN-07', IntentSource.DEEPLINK, 'app://detail', 'sc.detail', ['noteId'], 80, true,
    '深链详情需登录且带标识'),
  new IntentRule('IN-08', IntentSource.DEEPLINK, 'app://activity', 'sc.activity', [], 80, false,
    '深链打开调用记录'),
  new IntentRule('IN-09', IntentSource.DEEPLINK, 'app://rule', 'sc.rule.center', [], 80, false,
    '深链打开规则中心'),
  new IntentRule('IN-10', IntentSource.NOTIFICATION, 'notify://todo', 'sc.todo.detail', ['todoId'],
    70, true, '通知点击进入待办详情'),
  new IntentRule('IN-11', IntentSource.NOTIFICATION, 'notify://activity', 'sc.activity', [], 70,
    false, '通知点击查看记录'),
  new IntentRule('IN-12', IntentSource.NOTIFICATION, 'notify://collection', 'sc.collection.saved',
    [], 70, false, '通知点击查看收藏'),
  new IntentRule('IN-13', IntentSource.WIDGET, 'widget://note', 'sc.note.new', [], 60, false,
    '小组件新建便签'),
  new IntentRule('IN-14', IntentSource.WIDGET, 'widget://todo', 'sc.todo.today', [], 60, false,
    '小组件查看待办'),
  new IntentRule('IN-15', IntentSource.WIDGET, 'widget://collection', 'sc.collection.saved', [], 60,
    false, '小组件查看收藏'),
  new IntentRule('IN-16', IntentSource.RESUME, 'resume://note', 'sc.note.resume', ['draftId'], 50,
    false, '恢复上次草稿需带草稿标识'),
  new IntentRule('IN-17', IntentSource.RESUME, 'resume://detail', 'sc.detail', ['noteId'], 50, true,
    '恢复详情页'),
  new IntentRule('IN-18', IntentSource.SHORTCUT, '', 'sc.rule.center', [], 10, false,
    '未识别快捷方式回落到规则中心'),
  new IntentRule('IN-19', IntentSource.DEEPLINK, '', 'sc.activity', [], 10, false,
    '未识别深链回落到调用记录'),
  new IntentRule('IN-20', IntentSource.UNKNOWN, '', 'sc.rule.center', [], 0, false,
    '未知来源统一回落到规则中心')
];

/** 规则编号列表。 */
export function ruleIds(): string[] {
  return INTENT_RULES.map((rule: IntentRule): string => rule.ruleId);
}

/** 按编号取规则。 */
export function ruleOf(ruleId: string): IntentRule | undefined {
  return INTENT_RULES.find((rule: IntentRule): boolean => rule.ruleId === ruleId);
}

/** 按来源取规则。 */
export function rulesOf(source: IntentSource): IntentRule[] {
  return INTENT_RULES.filter((rule: IntentRule): boolean => rule.source === source);
}

/** 一条入口请求。 */
export class IntentRequest {
  public source: IntentSource = IntentSource.UNKNOWN;
  public uri: string = '';
  public keys: string[] = [];
  public values: string[] = [];
  public loggedIn: boolean = false;

  constructor(source: IntentSource = IntentSource.UNKNOWN, uri: string = '') {
    this.source = source;
    this.uri = uri;
  }

  /** 设置参数。 */
  put(key: string, value: string): IntentRequest {
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
export function parseUri(uri: string): IntentRequest {
  const request: IntentRequest = new IntentRequest(IntentSource.UNKNOWN, uri);
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
export class IntentPlan {
  public source: IntentSource = IntentSource.UNKNOWN;
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
      return `未解析：${this.issues.join('；')}`;
    }
    const state: string = this.ok() ? '可进入' : '需处理';
    return `${this.routeId}｜${state}｜规则 ${this.matchedRuleId}｜` +
      `${this.fallback ? '兜底' : '精确'}`;
  }
}

/** 按优先级排序规则。 */
function orderedRules(source: IntentSource): IntentRule[] {
  const list: IntentRule[] = INTENT_RULES.filter((rule: IntentRule): boolean =>
    rule.source === source);
  list.sort((left: IntentRule, right: IntentRule): number => right.priority - left.priority);
  return list;
}

/** 解析入口请求。 */
export function resolveIntent(request: IntentRequest): IntentPlan {
  const plan: IntentPlan = new IntentPlan();
  plan.source = request.source;
  const rules: IntentRule[] = orderedRules(request.source);
  let matched: IntentRule | undefined = undefined;
  for (const rule of rules) {
    if (rule.matchesUri(request.uri)) {
      matched = rule;
      break;
    }
  }
  if (matched === undefined) {
    plan.issues.push(`来源 ${sourceLabel(request.source)} 没有匹配规则`);
    return plan;
  }
  plan.routeId = matched.routeId;
  plan.matchedRuleId = matched.ruleId;
  plan.fallback = matched.priority <= 10;
  if (matched.requiresLogin && !request.loggedIn) {
    plan.issues.push('需要登录后才能进入');
  }
  matched.requiredKeys.forEach((key: string): void => {
    const value: string = request.get(key);
    if (value.length === 0) {
      plan.missing.push(key);
      plan.issues.push(`缺少参数：${key}`);
    }
  });
  request.keys.forEach((key: string): void => {
    if (matched !== undefined && matched.requiredKeys.indexOf(key) >= 0) {
      return;
    }
    if (key.length > 0 && matched !== undefined && matched.requiredKeys.length === 0) {
      plan.issues.push(`忽略多余参数：${key}`);
    }
  });
  return plan;
}

/** 各来源可用规则数。 */
export function sourceCounts(): number[] {
  const sources: IntentSource[] = [IntentSource.SHORTCUT, IntentSource.DEEPLINK,
    IntentSource.NOTIFICATION, IntentSource.WIDGET, IntentSource.RESUME, IntentSource.UNKNOWN];
  return sources.map((source: IntentSource): number => rulesOf(source).length);
}

/** 入口自检。 */
export class IntentAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? '入口规则表自洽' : this.findings.join('；');
  }
}

/** 校验规则表：编号连续、优先级非负、每条来源都有兜底、带必填参数的规则需登录或明确标注。 */
export function auditIntent(): IntentAudit {
  const audit: IntentAudit = new IntentAudit();
  INTENT_RULES.forEach((rule: IntentRule, index: number): void => {
    const expected: string = `IN-${(index + 1).toString().padStart(2, '0')}`;
    if (rule.ruleId !== expected) {
      audit.findings.push(`编号不连续：期望 ${expected}，实际 ${rule.ruleId}`);
    }
    if (rule.routeId.length === 0) {
      audit.findings.push(`缺少目标路由：${rule.ruleId}`);
    }
    if (rule.priority < 0) {
      audit.findings.push(`优先级为负：${rule.ruleId}`);
    }
    if (rule.description.length === 0) {
      audit.findings.push(`缺少说明：${rule.ruleId}`);
    }
    if (rule.requiredKeys.length > 0 && rule.priority <= 10) {
      audit.findings.push(`兜底规则不应要求参数：${rule.ruleId}`);
    }
  });
  const sources: IntentSource[] = [IntentSource.SHORTCUT, IntentSource.DEEPLINK,
    IntentSource.NOTIFICATION, IntentSource.WIDGET, IntentSource.RESUME, IntentSource.UNKNOWN];
  sources.forEach((source: IntentSource): void => {
    if (rulesOf(source).length === 0) {
      audit.findings.push(`来源无规则：${sourceLabel(source)}`);
    }
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 规则摘要行。 */
export function ruleLines(): string[] {
  return INTENT_RULES.map((rule: IntentRule): string => rule.text());
}

/** 来源分布行。 */
export function sourceLines(): string[] {
  const sources: IntentSource[] = [IntentSource.SHORTCUT, IntentSource.DEEPLINK,
    IntentSource.NOTIFICATION, IntentSource.WIDGET, IntentSource.RESUME, IntentSource.UNKNOWN];
  return sources.map((source: IntentSource): string =>
    `${sourceLabel(source)}：${rulesOf(source).length} 条规则`);
}
