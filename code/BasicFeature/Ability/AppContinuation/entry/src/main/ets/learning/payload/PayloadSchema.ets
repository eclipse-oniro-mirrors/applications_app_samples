/**
 * 接续载荷的字段目录与行内编码格式。
 *
 * 系统接续只传递一个字符串载荷，载荷内部结构由应用自己约定。这里把字段表、
 * 版本号与转义规则固定下来：写入端按字段表拼装，读取端按同一张表还原，
 * 任何字段增删都必须升版本并补一条迁移说明。
 */

/** 字段取值类别。 */
export enum PayloadKind {
  TEXT = 'text',
  MULTILINE = 'multiline',
  INTEGER = 'integer',
  IDENTIFIER = 'identifier',
  ENUM = 'enum'
}

/** 当前载荷版本。 */
export const PAYLOAD_VERSION: number = 3;

/** 载荷总长度上限，与系统对字符串载荷的常见约束保持同量级。 */
export const PAYLOAD_LIMIT: number = 8192;

/** 正文字段上限。 */
export const BODY_LIMIT: number = 4096;

/** 键值分隔符。 */
export const PAIR_SEPARATOR: string = '&';
/** 键与值分隔符。 */
export const VALUE_SEPARATOR: string = '=';

/** 需要转义的字符及其替换。 */
export class EscapeRule {
  public raw: string = '';
  public encoded: string = '';

  constructor(raw: string = '', encoded: string = '') {
    this.raw = raw;
    this.encoded = encoded;
  }
}

/** 转义表。顺序有意义：先处理百分号，避免二次转义。 */
export const ESCAPE_RULES: EscapeRule[] = [
  new EscapeRule('%', '%25'),
  new EscapeRule('&', '%26'),
  new EscapeRule('=', '%3D'),
  new EscapeRule('\r', '%0D'),
  new EscapeRule('\n', '%0A'),
  new EscapeRule('\t', '%09')
];

/** 单字段定义。 */
export class PayloadField {
  public name: string = '';
  public label: string = '';
  public kind: PayloadKind = PayloadKind.TEXT;
  public required: boolean = false;
  public since: number = 1;
  public maxLength: number = 0;
  public fallback: string = '';
  public enumValues: string[] = [];

  constructor(name: string = '', label: string = '', kind: PayloadKind = PayloadKind.TEXT,
    required: boolean = false, since: number = 1, maxLength: number = 0,
    fallback: string = '', enumValues: string[] = []) {
    this.name = name;
    this.label = label;
    this.kind = kind;
    this.required = required;
    this.since = since;
    this.maxLength = maxLength;
    this.fallback = fallback;
    this.enumValues = enumValues;
  }

  /** 取值是否合法。空串在非必填字段上合法。 */
  public accepts(value: string): boolean {
    if (value.length === 0) {
      return !this.required;
    }
    if (this.maxLength > 0 && value.length > this.maxLength) {
      return false;
    }
    switch (this.kind) {
      case PayloadKind.INTEGER:
        return /^-?\d+$/.test(value);
      case PayloadKind.IDENTIFIER:
        return /^[A-Za-z0-9_.:-]+$/.test(value);
      case PayloadKind.ENUM:
        return this.enumValues.indexOf(value) >= 0;
      default:
        return true;
    }
  }

  /** 归一化：非法时返回兜底值，超长时截断。 */
  public coerce(value: string): string {
    if (this.maxLength > 0 && value.length > this.maxLength) {
      return value.slice(0, this.maxLength);
    }
    return this.accepts(value) ? value : this.fallback;
  }

  /** 该字段在指定版本是否存在。 */
  public existsIn(version: number): boolean {
    return version >= this.since;
  }

  /** 说明文本。 */
  public describe(): string {
    return `${this.name}(${this.label}) v${this.since} ${this.required ? '必填' : '选填'}`;
  }
}

const CONFLICT_KINDS: string[] = ['none', 'remoteNewer', 'localNewer', 'bothChanged', 'unknown'];

/** 字段目录。顺序即编码顺序。 */
export const PAYLOAD_FIELDS: PayloadField[] = [
  new PayloadField('v', '载荷版本', PayloadKind.INTEGER, true, 1, 4, '1'),
  new PayloadField('doc', '文档标识', PayloadKind.IDENTIFIER, true, 1, 64, ''),
  new PayloadField('rev', '修订号', PayloadKind.INTEGER, true, 1, 12, '0'),
  new PayloadField('title', '标题', PayloadKind.TEXT, false, 1, 64, '未命名'),
  new PayloadField('body', '正文', PayloadKind.MULTILINE, false, 1, BODY_LIMIT, ''),
  new PayloadField('cs', '选区起点', PayloadKind.INTEGER, false, 2, 12, '0'),
  new PayloadField('ce', '选区终点', PayloadKind.INTEGER, false, 2, 12, '0'),
  new PayloadField('dev', '来源设备', PayloadKind.IDENTIFIER, false, 2, 64, 'unknown'),
  new PayloadField('at', '写入时间', PayloadKind.INTEGER, false, 2, 20, '0'),
  new PayloadField('app', '应用版本', PayloadKind.TEXT, false, 3, 32, ''),
  new PayloadField('ck', '冲突标记', PayloadKind.ENUM, false, 3, 16, 'none', CONFLICT_KINDS),
  new PayloadField('sig', '校验摘要', PayloadKind.IDENTIFIER, false, 3, 32, '')
];

/** 字段名列表。 */
export function fieldNames(): string[] {
  return PAYLOAD_FIELDS.map((field: PayloadField): string => field.name);
}

/** 按名字取字段。 */
export function fieldOf(name: string): PayloadField | undefined {
  return PAYLOAD_FIELDS.find((field: PayloadField): boolean => field.name === name);
}

/** 指定版本应有的字段。 */
export function fieldsAt(version: number): PayloadField[] {
  return PAYLOAD_FIELDS.filter((field: PayloadField): boolean => field.since <= version);
}

/** 转义单个值。 */
export function escapeValue(value: string): string {
  let result: string = value;
  ESCAPE_RULES.forEach((rule: EscapeRule): void => {
    result = result.split(rule.raw).join(rule.encoded);
  });
  return result;
}

/** 还原单个值。逆序处理，保证百分号最后还原。 */
export function unescapeValue(value: string): string {
  let result: string = value;
  for (let index = ESCAPE_RULES.length - 1; index >= 0; index--) {
    const rule: EscapeRule = ESCAPE_RULES[index];
    result = result.split(rule.encoded).join(rule.raw);
  }
  return result;
}

/** 版本迁移说明。 */
export class PayloadMigration {
  public from: number = 0;
  public to: number = 0;
  public description: string = '';

  constructor(from: number = 0, to: number = 0, description: string = '') {
    this.from = from;
    this.to = to;
    this.description = description;
  }

  /** 迁移文本。 */
  public text(): string {
    return `v${this.from} -> v${this.to}：${this.description}`;
  }
}

/** 版本迁移链。 */
export const PAYLOAD_MIGRATIONS: PayloadMigration[] = [
  new PayloadMigration(1, 2, '补齐选区、来源设备与写入时间'),
  new PayloadMigration(2, 3, '补齐应用版本、冲突标记与校验摘要')
];

/** 从指定版本升到当前版本需要几步。 */
export function migrationChain(version: number): PayloadMigration[] {
  const chain: PayloadMigration[] = [];
  let current: number = version;
  const guard: number = PAYLOAD_MIGRATIONS.length + 1;
  for (let round = 0; round < guard && current < PAYLOAD_VERSION; round++) {
    const step: PayloadMigration | undefined =
      PAYLOAD_MIGRATIONS.find((item: PayloadMigration): boolean => item.from === current);
    if (step === undefined) {
      break;
    }
    chain.push(step);
    current = step.to;
  }
  return chain;
}

/** 字段目录自检结论。 */
export class PayloadAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  public summary(): string {
    return this.ok ? '载荷字段目录自洽' : this.findings.join('；');
  }
}

/** 自检：字段唯一、版本连续、必填有兜底、枚举有取值。 */
export function auditPayloadSchema(): PayloadAudit {
  const audit: PayloadAudit = new PayloadAudit();
  const seen: string[] = [];
  PAYLOAD_FIELDS.forEach((field: PayloadField): void => {
    if (seen.indexOf(field.name) >= 0) {
      audit.findings.push(`字段重名：${field.name}`);
    }
    seen.push(field.name);
    if (field.since < 1 || field.since > PAYLOAD_VERSION) {
      audit.findings.push(`字段版本越界：${field.name}`);
    }
    if (field.kind === PayloadKind.ENUM && field.enumValues.length === 0) {
      audit.findings.push(`枚举缺少取值：${field.name}`);
    }
    if (field.kind === PayloadKind.ENUM && field.fallback.length > 0 &&
      field.enumValues.indexOf(field.fallback) < 0) {
      audit.findings.push(`枚举兜底不在取值内：${field.name}`);
    }
    if (field.kind === PayloadKind.INTEGER && field.fallback.length > 0 &&
      !/^-?\d+$/.test(field.fallback)) {
      audit.findings.push(`整型兜底非法：${field.name}`);
    }
  });
  let expected: number = 1;
  PAYLOAD_MIGRATIONS.forEach((step: PayloadMigration): void => {
    if (step.from !== expected) {
      audit.findings.push(`迁移链断裂：期望 v${expected}，实际 v${step.from}`);
    }
    expected = step.to;
  });
  if (expected !== PAYLOAD_VERSION) {
    audit.findings.push(`迁移链未覆盖当前版本：止于 v${expected}`);
  }
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 版本说明行，诊断页展示。 */
export function schemaVersionLines(): string[] {
  const lines: string[] = [`当前载荷版本 v${PAYLOAD_VERSION}，共 ${PAYLOAD_FIELDS.length} 个字段`];
  PAYLOAD_MIGRATIONS.forEach((step: PayloadMigration): void => {
    lines.push(step.text());
  });
  return lines;
}
