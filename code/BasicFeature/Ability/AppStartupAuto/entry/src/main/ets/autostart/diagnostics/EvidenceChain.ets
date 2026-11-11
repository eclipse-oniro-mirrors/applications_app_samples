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
      return localText('startup_text_0229');
    case EvidenceKind.ERROR_CODE:
      return localText('startup_text_0230');
    case EvidenceKind.HISTORY_SAMPLE:
      return localText('startup_text_0231');
    case EvidenceKind.DEVICE_INFO:
      return localText('startup_text_0232');
    case EvidenceKind.SCHEMA_AUDIT:
      return localText('startup_text_0233');
    case EvidenceKind.SLO_RESULT:
      return localText('startup_text_0234');
    default:
      return localText('startup_text_0235');
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
    return formatResource('startup_format_ffabbad46b71', [String(this.evidenceId), String(kindLabel(this.kind)), String(this.label), String(this.weight)]);
  }
}

/** 证据目录。 */
function createEVIDENCE_CATALOG(): Evidence[] {
  return [
  new Evidence('EV-01', EvidenceKind.CAPABILITY_RULE, localText('startup_text_0237'), 20),
  new Evidence('EV-02', EvidenceKind.CAPABILITY_RULE, localText('startup_text_0238'), 20),
  new Evidence('EV-03', EvidenceKind.ERROR_CODE, localText('startup_text_0239'), 15),
  new Evidence('EV-04', EvidenceKind.ERROR_CODE, localText('startup_text_0240'), 20),
  new Evidence('EV-05', EvidenceKind.ERROR_CODE, localText('startup_text_0241'), 15),
  new Evidence('EV-06', EvidenceKind.ERROR_CODE, localText('startup_text_0242'), 10),
  new Evidence('EV-07', EvidenceKind.HISTORY_SAMPLE, localText('startup_text_0243'), 15),
  new Evidence('EV-08', EvidenceKind.HISTORY_SAMPLE, localText('startup_text_0244'), 10),
  new Evidence('EV-09', EvidenceKind.HISTORY_SAMPLE, localText('startup_text_0245'), 5),
  new Evidence('EV-10', EvidenceKind.DEVICE_INFO, localText('startup_text_0246'), 10),
  new Evidence('EV-11', EvidenceKind.DEVICE_INFO, localText('startup_text_0247'), 10),
  new Evidence('EV-12', EvidenceKind.DEVICE_INFO, localText('startup_text_0248'), 20),
  new Evidence('EV-13', EvidenceKind.SCHEMA_AUDIT, localText('startup_text_0249'), 10),
  new Evidence('EV-14', EvidenceKind.SCHEMA_AUDIT, localText('startup_text_0250'), 5),
  new Evidence('EV-15', EvidenceKind.SLO_RESULT, localText('startup_text_0251'), 10),
  new Evidence('EV-16', EvidenceKind.SLO_RESULT, localText('startup_text_0252'), 10),
  new Evidence('EV-17', EvidenceKind.USER_ACTION, localText('startup_text_0253'), 15),
  new Evidence('EV-18', EvidenceKind.USER_ACTION, localText('startup_text_0254'), 15),
  new Evidence('EV-19', EvidenceKind.USER_ACTION, localText('startup_text_0255'), 10),
  new Evidence('EV-20', EvidenceKind.CAPABILITY_RULE, localText('startup_text_0256'), 10)
];
}
export const EVIDENCE_CATALOG: Evidence[] = createEVIDENCE_CATALOG();
registerTextRefresh((): void => {
  EVIDENCE_CATALOG.splice(0, EVIDENCE_CATALOG.length);
  createEVIDENCE_CATALOG().forEach((item: Evidence): void => { EVIDENCE_CATALOG.push(item); });
});

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
      return localText('startup_text_0257');
    case Conclusion.NEED_PERMISSION:
      return localText('startup_text_0258');
    case Conclusion.UNSUPPORTED:
      return localText('startup_text_0003');
    case Conclusion.UNKNOWN:
      return localText('startup_text_0005');
    case Conclusion.FAILED:
      return localText('startup_text_0259');
    default:
      return localText('startup_text_0004');
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
    return formatResource('startup_format_321ea355c0bc', [String(this.ruleId), String(conclusionLabel(this.conclusion)), String(this.required.length)]) +
      formatResource('startup_format_87fca9c8d4da', [String(this.optional.length)]);
  }
}

/** 链规则表。 */
function createCHAIN_RULES(): ChainRule[] {
  return [
  new ChainRule('EC-01', Conclusion.SUPPORTED, ['EV-01', 'EV-10', 'EV-11'], ['EV-07'],
    localText('startup_text_0262')),
  new ChainRule('EC-02', Conclusion.SUPPORTED, ['EV-01', 'EV-07'], ['EV-15'],
    localText('startup_text_0263')),
  new ChainRule('EC-03', Conclusion.NEED_PERMISSION, ['EV-05', 'EV-18'], ['EV-17'],
    localText('startup_text_0264')),
  new ChainRule('EC-04', Conclusion.NEED_PERMISSION, ['EV-01', 'EV-18'], ['EV-19'],
    localText('startup_text_0265')),
  new ChainRule('EC-05', Conclusion.UNSUPPORTED, ['EV-02'], ['EV-04', 'EV-03'],
    localText('startup_text_0266')),
  new ChainRule('EC-06', Conclusion.UNSUPPORTED, ['EV-04'], ['EV-02'],
    localText('startup_text_0267')),
  new ChainRule('EC-07', Conclusion.UNSUPPORTED, ['EV-12'], ['EV-03'],
    localText('startup_text_0268')),
  new ChainRule('EC-08', Conclusion.UNKNOWN, ['EV-20'], ['EV-13', 'EV-14'],
    localText('startup_text_0269')),
  new ChainRule('EC-09', Conclusion.UNKNOWN, ['EV-09'], ['EV-20'],
    localText('startup_text_0270')),
  new ChainRule('EC-10', Conclusion.FAILED, ['EV-06'], ['EV-08', 'EV-16'],
    localText('startup_text_0271')),
  new ChainRule('EC-11', Conclusion.FAILED, ['EV-08'], ['EV-06'],
    localText('startup_text_0272')),
  new ChainRule('EC-12', Conclusion.TIMEOUT, ['EV-08'], ['EV-15'],
    localText('startup_text_0273')),
  new ChainRule('EC-13', Conclusion.SUPPORTED, ['EV-10', 'EV-11'], ['EV-01'],
    localText('startup_text_0274')),
  new ChainRule('EC-14', Conclusion.UNSUPPORTED, ['EV-02', 'EV-03'], ['EV-04'],
    localText('startup_text_0275')),
  new ChainRule('EC-15', Conclusion.NEED_PERMISSION, ['EV-05'], ['EV-01', 'EV-17'],
    localText('startup_text_0276')),
  new ChainRule('EC-16', Conclusion.UNKNOWN, ['EV-13'], ['EV-14'],
    localText('startup_text_0277')),
  new ChainRule('EC-17', Conclusion.FAILED, ['EV-16'], ['EV-06', 'EV-08'],
    localText('startup_text_0278')),
  new ChainRule('EC-18', Conclusion.SUPPORTED, ['EV-01', 'EV-17'], ['EV-07', 'EV-10'],
    localText('startup_text_0279'))
];
}
export const CHAIN_RULES: ChainRule[] = createCHAIN_RULES();
registerTextRefresh((): void => {
  CHAIN_RULES.splice(0, CHAIN_RULES.length);
  createCHAIN_RULES().forEach((item: ChainRule): void => { CHAIN_RULES.push(item); });
});

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
    const state: string = this.established() ? localText('startup_text_0280') : formatResource('startup_format_160909d76e1e', [String(this.missing.join(','))]);
    return formatResource('startup_format_3b39889b9d5a', [String(this.ruleId), String(conclusionLabel(this.conclusion)), String(state), String(this.confidence)]);
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
    return this.ok ? localText('startup_text_0283') : this.findings.join('；');
  }
}

/** 校验链：编号唯一、引用的证据都存在、每个结论至少一条链。 */
export function auditChains(): ChainAudit {
  const audit: ChainAudit = new ChainAudit();
  const known: string[] = evidenceIds();
  const seen: string[] = [];
  CHAIN_RULES.forEach((rule: ChainRule, index: number): void => {
    if (seen.indexOf(rule.ruleId) >= 0) {
      audit.findings.push(formatResource('startup_format_6101256e6fa0', [String(rule.ruleId)]));
    }
    seen.push(rule.ruleId);
    const expected: string = `EC-${(index + 1).toString().padStart(2, '0')}`;
    if (rule.ruleId !== expected) {
      audit.findings.push(formatResource('startup_format_6d97c27e58d7', [String(expected), String(rule.ruleId)]));
    }
    if (rule.required.length === 0) {
      audit.findings.push(formatResource('startup_format_15bb22ea4ee5', [String(rule.ruleId)]));
    }
    rule.required.forEach((id: string): void => {
      if (known.indexOf(id) < 0) {
        audit.findings.push(formatResource('startup_format_156c0ae5433c', [String(rule.ruleId), String(id)]));
      }
    });
    rule.optional.forEach((id: string): void => {
      if (known.indexOf(id) < 0) {
        audit.findings.push(formatResource('startup_format_7618fbd73324', [String(rule.ruleId), String(id)]));
      }
      if (rule.required.indexOf(id) >= 0) {
        audit.findings.push(formatResource('startup_format_fd45f3b16c0e', [String(rule.ruleId), String(id)]));
      }
    });
    if (rule.description.length === 0) {
      audit.findings.push(formatResource('startup_format_b3d5698e1ce2', [String(rule.ruleId)]));
    }
  });
  const conclusions: Conclusion[] = [Conclusion.SUPPORTED, Conclusion.NEED_PERMISSION,
    Conclusion.UNSUPPORTED, Conclusion.UNKNOWN, Conclusion.FAILED, Conclusion.TIMEOUT];
  conclusions.forEach((conclusion: Conclusion): void => {
    if (chainsOf(conclusion).length === 0) {
      audit.findings.push(formatResource('startup_format_cb7bf9935b55', [String(conclusionLabel(conclusion))]));
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
    formatResource('startup_format_22ba0b71e4be', [String(kindLabel(kind)), String(evidencesOfKind(kind).length)]));
}
