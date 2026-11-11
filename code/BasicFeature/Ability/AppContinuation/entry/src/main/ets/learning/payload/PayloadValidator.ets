/**
 * 载荷校验。
 *
 * 编解码只保证"能解出来"，不保证"内容合理"。本模块把字段级规则与跨字段规则
 * 分成两张表：字段级只看单个取值，跨字段看字段之间的关系。校验结果分级，
 * 错误阻断落盘，告警只记录，避免因为一个可选字段缺失就整体失败。
 */

import { PayloadData, encodePayload, matchesDigest, utf8Length } from './PayloadCodec';
import { PAYLOAD_LIMIT } from './PayloadSchema';

/** 校验级别。 */
export enum ValidationLevel {
  ERROR = 'error',
  WARN = 'warn'
}

/** 级别标签。 */
export function levelLabel(level: ValidationLevel): string {
  return level === ValidationLevel.ERROR ? '错误' : '告警';
}

/** 字段级检查方式。 */
export enum CheckKind {
  REQUIRED = 'required',
  PATTERN = 'pattern',
  NUMERIC_MIN = 'numericMin',
  NUMERIC_MAX = 'numericMax',
  LENGTH_MAX = 'lengthMax',
  ENUM = 'enum'
}

/** 一条字段规则。 */
export class FieldRule {
  public ruleId: string = '';
  public field: string = '';
  public kind: CheckKind = CheckKind.REQUIRED;
  /** 参数：正则文本、数值下限/上限、长度上限或枚举取值串。 */
  public param: string = '';
  public level: ValidationLevel = ValidationLevel.ERROR;
  public message: string = '';

  constructor(ruleId: string = '', field: string = '', kind: CheckKind = CheckKind.REQUIRED,
    param: string = '', level: ValidationLevel = ValidationLevel.ERROR, message: string = '') {
    this.ruleId = ruleId;
    this.field = field;
    this.kind = kind;
    this.param = param;
    this.level = level;
    this.message = message;
  }

  public text(): string {
    return `${this.ruleId} ${this.field} ${this.kind as string}(${this.param}) ${levelLabel(this.level)}`;
  }
}

/** 取字段取值。 */
export function valueOfField(data: PayloadData, field: string): string {
  switch (field) {
    case 'doc':
      return data.doc;
    case 'rev':
      return data.rev.toString();
    case 'title':
      return data.title;
    case 'body':
      return data.body;
    case 'cs':
      return data.cs.toString();
    case 'ce':
      return data.ce.toString();
    case 'dev':
      return data.dev;
    case 'at':
      return data.at.toString();
    case 'app':
      return data.app;
    case 'ck':
      return data.ck;
    case 'sig':
      return data.sig;
    default:
      return '';
  }
}

/** 字段规则表。 */
export const FIELD_RULES: FieldRule[] = [
  new FieldRule('VF-01', 'doc', CheckKind.REQUIRED, '', ValidationLevel.ERROR,
    '文档标识不能为空'),
  new FieldRule('VF-02', 'doc', CheckKind.PATTERN, '^[A-Za-z0-9_.:-]+$', ValidationLevel.ERROR,
    '文档标识只能包含字母、数字与 . _ : -'),
  new FieldRule('VF-03', 'doc', CheckKind.LENGTH_MAX, '64', ValidationLevel.ERROR,
    '文档标识不超过 64 字符'),
  new FieldRule('VF-04', 'rev', CheckKind.NUMERIC_MIN, '0', ValidationLevel.ERROR,
    '修订号不能为负'),
  new FieldRule('VF-05', 'rev', CheckKind.NUMERIC_MAX, '999999999', ValidationLevel.WARN,
    '修订号过大，可能来自异常数据'),
  new FieldRule('VF-06', 'title', CheckKind.LENGTH_MAX, '64', ValidationLevel.WARN,
    '标题超过 64 字符将被截断'),
  new FieldRule('VF-07', 'body', CheckKind.LENGTH_MAX, '4096', ValidationLevel.ERROR,
    '正文超过 4096 字符'),
  new FieldRule('VF-08', 'cs', CheckKind.NUMERIC_MIN, '0', ValidationLevel.ERROR,
    '选区起点不能为负'),
  new FieldRule('VF-09', 'ce', CheckKind.NUMERIC_MIN, '0', ValidationLevel.ERROR,
    '选区终点不能为负'),
  new FieldRule('VF-10', 'dev', CheckKind.REQUIRED, '', ValidationLevel.WARN,
    '来源设备为空，跨设备排查会缺少线索'),
  new FieldRule('VF-11', 'dev', CheckKind.PATTERN, '^[A-Za-z0-9_.:-]+$', ValidationLevel.WARN,
    '来源设备标识含非法字符'),
  new FieldRule('VF-12', 'at', CheckKind.NUMERIC_MIN, '0', ValidationLevel.ERROR,
    '写入时间不能为负'),
  new FieldRule('VF-13', 'app', CheckKind.LENGTH_MAX, '32', ValidationLevel.WARN,
    '应用版本号超过 32 字符'),
  new FieldRule('VF-14', 'ck', CheckKind.ENUM, 'none|remoteNewer|localNewer|bothChanged|unknown',
    ValidationLevel.ERROR, '冲突标记取值非法'),
  new FieldRule('VF-15', 'sig', CheckKind.LENGTH_MAX, '8', ValidationLevel.WARN,
    '校验摘要长度异常'),
  new FieldRule('VF-16', 'body', CheckKind.LENGTH_MAX, '1024', ValidationLevel.WARN,
    '正文超过 1024 字符，部分设备可能拒绝接收')
];

/** 跨字段规则。 */
export class CrossRule {
  public ruleId: string = '';
  public description: string = '';
  public level: ValidationLevel = ValidationLevel.ERROR;

  constructor(ruleId: string = '', description: string = '',
    level: ValidationLevel = ValidationLevel.ERROR) {
    this.ruleId = ruleId;
    this.description = description;
    this.level = level;
  }

  public text(): string {
    return `${this.ruleId} ${levelLabel(this.level)}：${this.description}`;
  }
}

/** 跨字段规则表。判定逻辑在 crossViolations 中集中实现。 */
export const CROSS_RULES: CrossRule[] = [
  new CrossRule('VX-01', '选区终点不得小于起点', ValidationLevel.ERROR),
  new CrossRule('VX-02', '选区终点不得超过正文长度', ValidationLevel.ERROR),
  new CrossRule('VX-03', '选区起点不得超过正文长度', ValidationLevel.ERROR),
  new CrossRule('VX-04', '正文非空时修订号应大于 0', ValidationLevel.WARN),
  new CrossRule('VX-05', '正文非空时应带校验摘要', ValidationLevel.WARN),
  new CrossRule('VX-06', '有校验摘要时应与内容一致', ValidationLevel.WARN),
  new CrossRule('VX-07', '写入时间不应晚于当前时间 5 分钟', ValidationLevel.WARN),
  new CrossRule('VX-08', '编码后字符数不得超过载荷上限', ValidationLevel.ERROR),
  new CrossRule('VX-09', '编码后字节数超过上限两倍时提示', ValidationLevel.WARN)
];

/** 单条违规。 */
export class Violation {
  public ruleId: string = '';
  public field: string = '';
  public level: ValidationLevel = ValidationLevel.ERROR;
  public message: string = '';

  constructor(ruleId: string = '', field: string = '', level: ValidationLevel = ValidationLevel.ERROR,
    message: string = '') {
    this.ruleId = ruleId;
    this.field = field;
    this.level = level;
    this.message = message;
  }

  public text(): string {
    return `${this.ruleId} ${levelLabel(this.level)}｜${this.field}｜${this.message}`;
  }
}

/** 单条字段规则是否通过。 */
export function passesFieldRule(rule: FieldRule, data: PayloadData): boolean {
  const value: string = valueOfField(data, rule.field);
  switch (rule.kind) {
    case CheckKind.REQUIRED:
      return value.length > 0;
    case CheckKind.PATTERN:
      return new RegExp(rule.param).test(value);
    case CheckKind.NUMERIC_MIN:
      return Number(value) >= Number(rule.param);
    case CheckKind.NUMERIC_MAX:
      return Number(value) <= Number(rule.param);
    case CheckKind.LENGTH_MAX:
      return value.length <= Number(rule.param);
    case CheckKind.ENUM:
      return rule.param.split('|').indexOf(value) >= 0;
    default:
      return true;
  }
}

/** 校验全部字段规则。 */
export function checkFields(data: PayloadData): Violation[] {
  const violations: Violation[] = [];
  FIELD_RULES.forEach((rule: FieldRule): void => {
    if (!passesFieldRule(rule, data)) {
      violations.push(new Violation(rule.ruleId, rule.field, rule.level, rule.message));
    }
  });
  return violations;
}

/** 校验全部跨字段规则。now 用于判断时间是否超前。 */
export function checkCross(data: PayloadData, now: number): Violation[] {
  const violations: Violation[] = [];
  if (data.ce < data.cs) {
    violations.push(new Violation('VX-01', 'ce', ValidationLevel.ERROR, CROSS_RULES[0].description));
  }
  if (data.ce > data.body.length) {
    violations.push(new Violation('VX-02', 'ce', ValidationLevel.ERROR, CROSS_RULES[1].description));
  }
  if (data.cs > data.body.length) {
    violations.push(new Violation('VX-03', 'cs', ValidationLevel.ERROR, CROSS_RULES[2].description));
  }
  if (!data.bodyEmpty() && data.rev <= 0) {
    violations.push(new Violation('VX-04', 'rev', ValidationLevel.WARN, CROSS_RULES[3].description));
  }
  if (!data.bodyEmpty() && data.sig.length === 0) {
    violations.push(new Violation('VX-05', 'sig', ValidationLevel.WARN, CROSS_RULES[4].description));
  }
  if (data.sig.length > 0 && !matchesDigest(data)) {
    violations.push(new Violation('VX-06', 'sig', ValidationLevel.WARN, CROSS_RULES[5].description));
  }
  if (data.at > 0 && now > 0 && data.at > now + 300000) {
    violations.push(new Violation('VX-07', 'at', ValidationLevel.WARN, CROSS_RULES[6].description));
  }
  const encoded: string = encodePayload(data);
  if (encoded.length > PAYLOAD_LIMIT) {
    violations.push(new Violation('VX-08', 'raw', ValidationLevel.ERROR, CROSS_RULES[7].description));
  }
  if (utf8Length(encoded) > PAYLOAD_LIMIT * 2) {
    violations.push(new Violation('VX-09', 'raw', ValidationLevel.WARN, CROSS_RULES[8].description));
  }
  return violations;
}

/** 校验结果。 */
export class ValidationResult {
  public violations: Violation[] = [];

  /** 是否存在阻断级问题。 */
  public hasError(): boolean {
    return this.violations.some((item: Violation): boolean =>
      item.level === ValidationLevel.ERROR);
  }

  /** 是否只有告警。 */
  public warnOnly(): boolean {
    return !this.hasError() && this.violations.length > 0;
  }

  /** 是否完全通过。 */
  public clean(): boolean {
    return this.violations.length === 0;
  }

  /** 错误条数。 */
  public errors(): number {
    return this.violations.filter((item: Violation): boolean =>
      item.level === ValidationLevel.ERROR).length;
  }

  /** 告警条数。 */
  public warnings(): number {
    return this.violations.filter((item: Violation): boolean =>
      item.level === ValidationLevel.WARN).length;
  }

  /** 违规规则编号，去重。 */
  public ruleIds(): string[] {
    const ids: string[] = [];
    this.violations.forEach((item: Violation): void => {
      if (ids.indexOf(item.ruleId) < 0) {
        ids.push(item.ruleId);
      }
    });
    return ids;
  }

  /** 一句话结论。 */
  public headline(): string {
    if (this.clean()) {
      return '校验通过';
    }
    if (this.hasError()) {
      return `${this.errors()} 项错误，${this.warnings()} 项告警`;
    }
    return `${this.warnings()} 项告警`;
  }

  /** 逐行文本。 */
  public text(): string {
    const lines: string[] = [this.headline()];
    this.violations.forEach((item: Violation): void => {
      lines.push(item.text());
    });
    return lines.join('\n');
  }
}

/** 完整校验。 */
export function validate(data: PayloadData, now: number): ValidationResult {
  const result: ValidationResult = new ValidationResult();
  checkFields(data).forEach((item: Violation): void => {
    result.violations.push(item);
  });
  checkCross(data, now).forEach((item: Violation): void => {
    result.violations.push(item);
  });
  return result;
}

/** 只跑字段级校验。 */
export function validateFields(data: PayloadData): ValidationResult {
  const result: ValidationResult = new ValidationResult();
  checkFields(data).forEach((item: Violation): void => {
    result.violations.push(item);
  });
  return result;
}

/** 规则表自检。 */
export class ValidatorAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  public summary(): string {
    return this.ok ? '校验规则表自洽' : this.findings.join('；');
  }
}

/** 校验规则表：编号唯一、字段名有效、参数可解析。 */
export function auditValidator(): ValidatorAudit {
  const audit: ValidatorAudit = new ValidatorAudit();
  const seen: string[] = [];
  const probe: PayloadData = new PayloadData('probe-doc', 1);
  probe.title = 'probe-title';
  probe.body = 'probe';
  probe.ce = 5;
  probe.dev = 'probe';
  probe.at = 1700000000000;
  probe.app = '1.0.0';
  FIELD_RULES.forEach((rule: FieldRule): void => {
    if (seen.indexOf(rule.ruleId) >= 0) {
      audit.findings.push(`规则编号重复：${rule.ruleId}`);
    }
    seen.push(rule.ruleId);
    if (rule.message.length === 0) {
      audit.findings.push(`缺少提示：${rule.ruleId}`);
    }
    if (valueOfField(probe, rule.field).length === 0 && rule.field !== 'sig') {
      audit.findings.push(`字段名无法取值：${rule.ruleId}`);
    }
    if (rule.kind === CheckKind.PATTERN) {
      try {
        new RegExp(rule.param);
      } catch (error) {
        audit.findings.push(`正则非法：${rule.ruleId}`);
      }
    }
    if (rule.kind === CheckKind.ENUM && rule.param.indexOf('|') < 0) {
      audit.findings.push(`枚举取值不足：${rule.ruleId}`);
    }
  });
  CROSS_RULES.forEach((rule: CrossRule): void => {
    if (seen.indexOf(rule.ruleId) >= 0) {
      audit.findings.push(`规则编号重复：${rule.ruleId}`);
    }
    seen.push(rule.ruleId);
    if (rule.description.length === 0) {
      audit.findings.push(`缺少说明：${rule.ruleId}`);
    }
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 字段规则摘要行。 */
export function fieldRuleLines(): string[] {
  return FIELD_RULES.map((rule: FieldRule): string => rule.text());
}

/** 跨字段规则摘要行。 */
export function crossRuleLines(): string[] {
  return CROSS_RULES.map((rule: CrossRule): string => rule.text());
}
