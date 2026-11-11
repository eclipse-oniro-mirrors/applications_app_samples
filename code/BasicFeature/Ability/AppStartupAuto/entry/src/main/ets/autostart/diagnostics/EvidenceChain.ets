/**
 * 结论的证据链。
 *
 * 页面给出"支持/不支持/需要权限"这类结论时，必须能回答"依据是什么"。
 * 这里把每个结论需要的证据写成链：证据有类别与权重，缺失必需要素时结论不成立，
 * 只缺可选要素时降低置信度而不是直接否定。
 */

/** 证据类别。 */
export enum EvidenceKind {
  CAPABILITY_RULE = 'capabilityRule',
  ERROR_CODE = 'errorCode',
  HISTORY_SAMPLE = 'historySample',
  DEVICE_INFO = 'deviceInfo',
  SCHEMA_AUDIT = 'schemaAudit',
  SLO_RESULT = 'sloResult',
  USER_ACTION = 'userAction'
}

/** 类别标签。 */
export function kindLabel(kind: EvidenceKind): string {
  switch (kind) {
    case EvidenceKind.CAPABILITY_RULE:
      return '能力规则';
    case EvidenceKind.ERROR_CODE:
      return '错误码';
    case EvidenceKind.HISTORY_SAMPLE:
      return '历史样本';
    case EvidenceKind.DEVICE_INFO:
      return '设备信息';
    case EvidenceKind.SCHEMA_AUDIT:
      return '格式审计';
    case EvidenceKind.SLO_RESULT:
      return '体验目标';
    default:
      return '用户操作';
  }
}

/** 一条证据定义。 */
export class Evidence {
  public evidenceId: string = '';
  public kind: EvidenceKind = EvidenceKind.CAPABILITY_RULE;
  public label: string = '';
  /** 权重，用于计算置信度。 */
  public weight: number = 10;

  constructor(evidenceId: string = '', kind: EvidenceKind = EvidenceKind.CAPABILITY_RULE,
    label: string = '', weight: number = 10) {
    this.evidenceId = evidenceId;
    this.kind = kind;
    this.label = label;
    this.weight = weight;
  }

  text(): string {
    return `${this.evidenceId}｜${kindLabel(this.kind)}｜${this.label}｜权重 ${this.weight}`;
  }
}

/** 证据目录。 */
export const EVIDENCE_CATALOG: Evidence[] = [
  new Evidence('EV-01', EvidenceKind.CAPABILITY_RULE, '命中能力矩阵规则', 20),
  new Evidence('EV-02', EvidenceKind.CAPABILITY_RULE, '规则给出确定性不支持', 20),
  new Evidence('EV-03', EvidenceKind.ERROR_CODE, '错误码 801', 15),
  new Evidence('EV-04', EvidenceKind.ERROR_CODE, '错误码 202', 20),
  new Evidence('EV-05', EvidenceKind.ERROR_CODE, '错误码 201', 15),
  new Evidence('EV-06', EvidenceKind.ERROR_CODE, '错误码 16000050', 10),
  new Evidence('EV-07', EvidenceKind.HISTORY_SAMPLE, '至少一条成功样本', 15),
  new Evidence('EV-08', EvidenceKind.HISTORY_SAMPLE, '至少一条失败样本', 10),
  new Evidence('EV-09', EvidenceKind.HISTORY_SAMPLE, '历史记录为空', 5),
  new Evidence('EV-10', EvidenceKind.DEVICE_INFO, '设备形态已识别', 10),
  new Evidence('EV-11', EvidenceKind.DEVICE_INFO, '系统版本已识别', 10),
  new Evidence('EV-12', EvidenceKind.DEVICE_INFO, 'API 等级低于 9', 20),
  new Evidence('EV-13', EvidenceKind.SCHEMA_AUDIT, '字段目录自洽', 10),
  new Evidence('EV-14', EvidenceKind.SCHEMA_AUDIT, '存在解析告警', 5),
  new Evidence('EV-15', EvidenceKind.SLO_RESULT, '体验目标全部达成', 10),
  new Evidence('EV-16', EvidenceKind.SLO_RESULT, '存在必达项未达成', 10),
  new Evidence('EV-17', EvidenceKind.USER_ACTION, '用户已授予权限', 15),
  new Evidence('EV-18', EvidenceKind.USER_ACTION, '用户未授予权限', 15),
  new Evidence('EV-19', EvidenceKind.USER_ACTION, '设置入口不可用', 10),
  new Evidence('EV-20', EvidenceKind.CAPABILITY_RULE, '规则判定为未知', 10)
];

/** 证据编号列表。 */
export function evidenceIds(): string[] {
  return EVIDENCE_CATALOG.map((item: Evidence): string => item.evidenceId);
}

/** 按编号取证据。 */
export function evidenceOf(evidenceId: string): Evidence | undefined {
  return EVIDENCE_CATALOG.find((item: Evidence): boolean => item.evidenceId === evidenceId);
}

/** 按类别取证据。 */
export function evidencesOfKind(kind: EvidenceKind): Evidence[] {
  return EVIDENCE_CATALOG.filter((item: Evidence): boolean => item.kind === kind);
}

/** 结论键。 */
export enum Conclusion {
  SUPPORTED = 'supported',
  NEED_PERMISSION = 'needPermission',
  UNSUPPORTED = 'unsupported',
  UNKNOWN = 'unknown',
  FAILED = 'failed',
  TIMEOUT = 'timeout'
}

/** 结论标签。 */
export function conclusionLabel(conclusion: Conclusion): string {
  switch (conclusion) {
    case Conclusion.SUPPORTED:
      return '支持';
    case Conclusion.NEED_PERMISSION:
      return '需要授权';
    case Conclusion.UNSUPPORTED:
      return '不支持';
    case Conclusion.UNKNOWN:
      return '未知';
    case Conclusion.FAILED:
      return '调用失败';
    default:
      return '超时';
  }
}

/** 一条链规则：某结论必须与可选证据。 */
export class ChainRule {
  public ruleId: string = '';
  public conclusion: Conclusion = Conclusion.SUPPORTED;
  public required: string[] = [];
  public optional: string[] = [];
  public description: string = '';

  constructor(ruleId: string = '', conclusion: Conclusion = Conclusion.SUPPORTED,
    required: string[] = [], optional: string[] = [], description: string = '') {
    this.ruleId = ruleId;
    this.conclusion = conclusion;
    this.required = required;
    this.optional = optional;
    this.description = description;
  }

  text(): string {
    return `${this.ruleId} ${conclusionLabel(this.conclusion)}｜必需 ${this.required.length}｜` +
      `可选 ${this.optional.length}`;
  }
}

/** 链规则表。 */
export const CHAIN_RULES: ChainRule[] = [
  new ChainRule('EC-01', Conclusion.SUPPORTED, ['EV-01', 'EV-10', 'EV-11'], ['EV-07'],
    '支持结论需要能力规则与设备信息，成功样本可提高置信度'),
  new ChainRule('EC-02', Conclusion.SUPPORTED, ['EV-01', 'EV-07'], ['EV-15'],
    '有成功样本时结论更稳'),
  new ChainRule('EC-03', Conclusion.NEED_PERMISSION, ['EV-05', 'EV-18'], ['EV-17'],
    '需要授权结论必须有权限错误码与未授权状态'),
  new ChainRule('EC-04', Conclusion.NEED_PERMISSION, ['EV-01', 'EV-18'], ['EV-19'],
    '规则判定需权限且用户未授权'),
  new ChainRule('EC-05', Conclusion.UNSUPPORTED, ['EV-02'], ['EV-04', 'EV-03'],
    '确定性不支持至少需要规则或专用错误码'),
  new ChainRule('EC-06', Conclusion.UNSUPPORTED, ['EV-04'], ['EV-02'],
    '错误码 202 单独即可判定不支持'),
  new ChainRule('EC-07', Conclusion.UNSUPPORTED, ['EV-12'], ['EV-03'],
    'API 低于 9 直接判定不支持'),
  new ChainRule('EC-08', Conclusion.UNKNOWN, ['EV-20'], ['EV-13', 'EV-14'],
    '未知结论需要规则声明未知，并附格式审计'),
  new ChainRule('EC-09', Conclusion.UNKNOWN, ['EV-09'], ['EV-20'],
    '无历史样本时只能给出未知'),
  new ChainRule('EC-10', Conclusion.FAILED, ['EV-06'], ['EV-08', 'EV-16'],
    '内部错误需要错误码与失败样本'),
  new ChainRule('EC-11', Conclusion.FAILED, ['EV-08'], ['EV-06'],
    '失败样本可作为主证据'),
  new ChainRule('EC-12', Conclusion.TIMEOUT, ['EV-08'], ['EV-15'],
    '超时需要失败样本与体验目标结果'),
  new ChainRule('EC-13', Conclusion.SUPPORTED, ['EV-10', 'EV-11'], ['EV-01'],
    '仅设备信息不足以判定支持，需补规则'),
  new ChainRule('EC-14', Conclusion.UNSUPPORTED, ['EV-02', 'EV-03'], ['EV-04'],
    '规则不支持与错误码同时出现时置信度最高'),
  new ChainRule('EC-15', Conclusion.NEED_PERMISSION, ['EV-05'], ['EV-01', 'EV-17'],
    '仅有权限错误码即可提示授权'),
  new ChainRule('EC-16', Conclusion.UNKNOWN, ['EV-13'], ['EV-14'],
    '格式审计只能支撑未知结论'),
  new ChainRule('EC-17', Conclusion.FAILED, ['EV-16'], ['EV-06', 'EV-08'],
    '必达体验目标未达成可作为失败证据'),
  new ChainRule('EC-18', Conclusion.SUPPORTED, ['EV-01', 'EV-17'], ['EV-07', 'EV-10'],
    '授权完成且规则支持时给出支持结论')
];

/** 链规则编号。 */
export function chainIds(): string[] {
  return CHAIN_RULES.map((rule: ChainRule): string => rule.ruleId);
}

/** 按结论取规则。 */
export function chainsOf(conclusion: Conclusion): ChainRule[] {
  return CHAIN_RULES.filter((rule: ChainRule): boolean => rule.conclusion === conclusion);
}

/** 单条链的评估结果。 */
export class ChainResult {
  public ruleId: string = '';
  public conclusion: Conclusion = Conclusion.UNKNOWN;
  /** 缺失的必需证据。 */
  public missing: string[] = [];
  /** 命中的可选证据。 */
  public optionalHits: string[] = [];
  /** 置信度 0~100。 */
  public confidence: number = 0;

  /** 链是否成立。 */
  established(): boolean {
    return this.missing.length === 0;
  }

  text(): string {
    const state: string = this.established() ? '成立' : `缺少 ${this.missing.join(',')}`;
    return `${this.ruleId} ${conclusionLabel(this.conclusion)}｜${state}｜置信度 ${this.confidence}%`;
  }
}

/** 计算置信度：必需证据全中为 100，可选证据按权重加分，上限 100。 */
export function evaluateChain(rule: ChainRule, provided: string[]): ChainResult {
  const result: ChainResult = new ChainResult();
  result.ruleId = rule.ruleId;
  result.conclusion = rule.conclusion;
  rule.required.forEach((id: string): void => {
    if (provided.indexOf(id) < 0) {
      result.missing.push(id);
    }
  });
  rule.optional.forEach((id: string): void => {
    if (provided.indexOf(id) >= 0) {
      result.optionalHits.push(id);
    }
  });
  if (result.missing.length > 0) {
    result.confidence = 0;
    return result;
  }
  let base: number = 100;
  if (result.optionalHits.length > 0) {
    base = 100;
  }
  const missingOptional: number = rule.optional.length - result.optionalHits.length;
  const penalty: number = missingOptional * 5;
  result.confidence = Math.max(60, Math.min(base, 100 - penalty));
  return result;
}

/** 对某个结论评估全部相关链，取置信度最高且成立的一条。 */
export function bestChain(conclusion: Conclusion, provided: string[]): ChainResult | undefined {
  let best: ChainResult | undefined = undefined;
  chainsOf(conclusion).forEach((rule: ChainRule): void => {
    const current: ChainResult = evaluateChain(rule, provided);
    if (!current.established()) {
      return;
    }
    if (best === undefined || current.confidence > best.confidence) {
      best = current;
    }
  });
  return best;
}

/** 全部结论的可行链数。 */
export function feasibleCounts(provided: string[]): number[] {
  const conclusions: Conclusion[] = [Conclusion.SUPPORTED, Conclusion.NEED_PERMISSION,
    Conclusion.UNSUPPORTED, Conclusion.UNKNOWN, Conclusion.FAILED, Conclusion.TIMEOUT];
  return conclusions.map((conclusion: Conclusion): number =>
    chainsOf(conclusion).filter((rule: ChainRule): boolean =>
      evaluateChain(rule, provided).established()).length);
}

/** 证据链自检。 */
export class ChainAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? '证据链自洽' : this.findings.join('；');
  }
}

/** 校验链：编号唯一、引用的证据都存在、每个结论至少一条链。 */
export function auditChains(): ChainAudit {
  const audit: ChainAudit = new ChainAudit();
  const known: string[] = evidenceIds();
  const seen: string[] = [];
  CHAIN_RULES.forEach((rule: ChainRule, index: number): void => {
    if (seen.indexOf(rule.ruleId) >= 0) {
      audit.findings.push(`规则编号重复：${rule.ruleId}`);
    }
    seen.push(rule.ruleId);
    const expected: string = `EC-${(index + 1).toString().padStart(2, '0')}`;
    if (rule.ruleId !== expected) {
      audit.findings.push(`编号不连续：期望 ${expected}，实际 ${rule.ruleId}`);
    }
    if (rule.required.length === 0) {
      audit.findings.push(`缺少必需证据：${rule.ruleId}`);
    }
    rule.required.forEach((id: string): void => {
      if (known.indexOf(id) < 0) {
        audit.findings.push(`必需证据不存在：${rule.ruleId}.${id}`);
      }
    });
    rule.optional.forEach((id: string): void => {
      if (known.indexOf(id) < 0) {
        audit.findings.push(`可选证据不存在：${rule.ruleId}.${id}`);
      }
      if (rule.required.indexOf(id) >= 0) {
        audit.findings.push(`证据重复归类：${rule.ruleId}.${id}`);
      }
    });
    if (rule.description.length === 0) {
      audit.findings.push(`缺少说明：${rule.ruleId}`);
    }
  });
  const conclusions: Conclusion[] = [Conclusion.SUPPORTED, Conclusion.NEED_PERMISSION,
    Conclusion.UNSUPPORTED, Conclusion.UNKNOWN, Conclusion.FAILED, Conclusion.TIMEOUT];
  conclusions.forEach((conclusion: Conclusion): void => {
    if (chainsOf(conclusion).length === 0) {
      audit.findings.push(`结论缺少证据链：${conclusionLabel(conclusion)}`);
    }
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 证据摘要行。 */
export function evidenceLines(): string[] {
  return EVIDENCE_CATALOG.map((item: Evidence): string => item.text());
}

/** 链规则摘要行。 */
export function chainLines(): string[] {
  return CHAIN_RULES.map((rule: ChainRule): string => rule.text());
}

/** 类别分布行。 */
export function kindLines(): string[] {
  const kinds: EvidenceKind[] = [EvidenceKind.CAPABILITY_RULE, EvidenceKind.ERROR_CODE,
    EvidenceKind.HISTORY_SAMPLE, EvidenceKind.DEVICE_INFO, EvidenceKind.SCHEMA_AUDIT,
    EvidenceKind.SLO_RESULT, EvidenceKind.USER_ACTION];
  return kinds.map((kind: EvidenceKind): string =>
    `${kindLabel(kind)}：${evidencesOfKind(kind).length} 条`);
}
