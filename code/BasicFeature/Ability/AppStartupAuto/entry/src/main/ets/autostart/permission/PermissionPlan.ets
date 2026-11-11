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
      return '已授权';
    case PermissionState.DENIED:
      return '已拒绝';
    case PermissionState.DENIED_PERMANENTLY:
      return '已永久拒绝';
    case PermissionState.NOT_REQUIRED:
      return '无需授权';
    default:
      return '未知';
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
    return `${this.ruleId}｜API ${this.minApi}~${this.maxApi}｜最多 ${this.maxAsks} 次｜` +
      `${this.policy as string}`;
  }
}

/** 规则表：低版本只弹一次，高版本允许在应用内申请。 */
export const PERMISSION_RULES: PermissionRule[] = [
  new PermissionRule('PM-0001', 0, 8, 0, RequestPolicy.NO_REQUEST,
    '当前系统版本不支持自启相关权限', 'API 9 起才有对应权限项'),
  new PermissionRule('PM-0002', 9, 11, 1, RequestPolicy.ASK_ONCE_THEN_SETTINGS,
    '仅允许申请一次，被拒后请前往系统设置开启', '低版本仅支持一次系统弹窗'),
  new PermissionRule('PM-0003', 12, 17, 2, RequestPolicy.ASK_IN_APP,
    '可以再次申请，被永久拒绝后需前往系统设置', '12 起允许两次申请'),
  new PermissionRule('PM-0004', 18, 26, 3, RequestPolicy.ASK_IN_APP,
    '可以多次申请，但每次申请都应说明用途', '18 起申请次数放宽'),
  new PermissionRule('PM-0005', 27, 999, 0, RequestPolicy.SETTINGS_ONLY,
    '该版本未验证，请直接前往系统设置', '高于已验证版本，不做自动申请')
];

/** 按当前上下文给出申请结论。 */
export function planPermission(context: PermissionContext): PermissionDecision {
  const decision: PermissionDecision = new PermissionDecision();
  if (context.state === PermissionState.GRANTED) {
    decision.state = PermissionState.GRANTED;
    decision.policy = RequestPolicy.NO_REQUEST;
    decision.message = '已获得授权，无需再次申请';
    decision.hint = '授权状态正常';
    decision.ruleId = 'PM-GRANTED';
    return decision;
  }
  if (context.state === PermissionState.NOT_REQUIRED) {
    decision.state = PermissionState.NOT_REQUIRED;
    decision.policy = RequestPolicy.NO_REQUEST;
    decision.message = '当前设备与版本无需额外授权';
    decision.hint = '能力矩阵判定为无需权限';
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
    decision.message = '已被永久拒绝，只能前往系统设置手动开启';
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
    decision.message = '系统未提供权限弹窗，请前往系统设置';
    decision.hint = 'systemDialogAvailable 为 false';
    return decision;
  }
  if (context.askedTimes >= rule.maxAsks) {
    decision.canAsk = false;
    decision.needsSettings = true;
    decision.message = `已申请 ${context.askedTimes} 次，请前往系统设置开启`;
    return decision;
  }
  if (context.askedThisSession && rule.policy === RequestPolicy.ASK_ONCE_THEN_SETTINGS) {
    decision.canAsk = false;
    decision.needsSettings = true;
    decision.message = '本次会话已申请过，请前往系统设置';
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
      return '权限规则表自洽';
    }
    return this.findings.join('；');
  }
}

export function auditPermissionRules(): PermissionAudit {
  const audit: PermissionAudit = new PermissionAudit();
  const seen: string[] = [];
  PERMISSION_RULES.forEach((rule: PermissionRule): void => {
    if (seen.indexOf(rule.ruleId) >= 0) {
      audit.findings.push(`规则重复：${rule.ruleId}`);
    }
    seen.push(rule.ruleId);
    if (rule.maxApi < rule.minApi) {
      audit.findings.push(`区间非法：${rule.ruleId}`);
    }
    if (rule.message.length === 0 || rule.hint.length === 0) {
      audit.findings.push(`缺少文案：${rule.ruleId}`);
    }
    if (rule.policy === RequestPolicy.ASK_IN_APP && rule.maxAsks <= 0) {
      audit.findings.push(`申请策略与次数冲突：${rule.ruleId}`);
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
      audit.findings.push(`API ${api} 无规则覆盖`);
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
