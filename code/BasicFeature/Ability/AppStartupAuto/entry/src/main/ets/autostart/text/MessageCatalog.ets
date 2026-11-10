/**
 * 文案目录。
 *
 * 页面上的提示语集中在两张表里：一是固定文案，二是带占位符的模板。
 * 集中管理的好处是同一个概念只有一种说法，长度也能被统一约束。
 * 这不是完整的多语言方案，只解决"同一句提示不要在三处写法不同"。
 */

/** 文案键。 */
export enum MessageKey {
  APP_TITLE = 'appTitle',
  STATUS_ON = 'statusOn',
  STATUS_OFF = 'statusOff',
  STATUS_UNKNOWN = 'statusUnknown',
  QUERY_FAILED = 'queryFailed',
  UNSUPPORTED = 'unsupported',
  NEED_SETTINGS = 'needSettings',
  NEED_PERMISSION = 'needPermission',
  EXPORT_EMPTY = 'exportEmpty',
  EXPORT_DONE = 'exportDone',
  HISTORY_EMPTY = 'historyEmpty',
  SELF_CHECK_DONE = 'selfCheckDone',
  GUIDANCE_TITLE = 'guidanceTitle',
  ONBOARDING_TITLE = 'onboardingTitle',
  REMINDER_TITLE = 'reminderTitle'
}

/** 单条文案。 */
export class MessageEntry {
  key: MessageKey = MessageKey.APP_TITLE;
  /** 默认文案。 */
  text: string = '';
  /** 允许的最大长度，超出会被截断并记录。 */
  maxLength: number = 64;
  /** 是否为面向用户的正式文案（false 表示内部提示）。 */
  userFacing: boolean = true;

  constructor(key: MessageKey = MessageKey.APP_TITLE, text: string = '',
    maxLength: number = 64, userFacing: boolean = true) {
    this.key = key;
    this.text = text;
    this.maxLength = maxLength;
    this.userFacing = userFacing;
  }

  /** 截断后的文本。 */
  clipped(): string {
    if (this.text.length <= this.maxLength) {
      return this.text;
    }
    return `${this.text.slice(0, Math.max(0, this.maxLength - 1))}…`;
  }

  /** 是否超长。 */
  overflow(): boolean {
    return this.text.length > this.maxLength;
  }

  describe(): string {
    return `${this.key as string}（${this.text.length}/${this.maxLength}）：${this.clipped()}`;
  }
}

/** 固定文案表。 */
export const MESSAGES: MessageEntry[] = [
  new MessageEntry(MessageKey.APP_TITLE, '开机自启', 16),
  new MessageEntry(MessageKey.STATUS_ON, '已开启开机自启', 24),
  new MessageEntry(MessageKey.STATUS_OFF, '未开启开机自启', 24),
  new MessageEntry(MessageKey.STATUS_UNKNOWN, '暂时无法确定当前状态', 32),
  new MessageEntry(MessageKey.QUERY_FAILED, '查询失败，可重试一次', 32),
  new MessageEntry(MessageKey.UNSUPPORTED, '当前设备或系统不支持该能力', 40),
  new MessageEntry(MessageKey.NEED_SETTINGS, '请前往系统设置中修改', 32),
  new MessageEntry(MessageKey.NEED_PERMISSION, '需要授予权限后才能继续', 32),
  new MessageEntry(MessageKey.EXPORT_EMPTY, '没有可导出的记录', 24),
  new MessageEntry(MessageKey.EXPORT_DONE, '已生成导出内容', 24),
  new MessageEntry(MessageKey.HISTORY_EMPTY, '还没有查询记录', 24),
  new MessageEntry(MessageKey.SELF_CHECK_DONE, '自检已完成', 24),
  new MessageEntry(MessageKey.GUIDANCE_TITLE, '设置指引', 16),
  new MessageEntry(MessageKey.ONBOARDING_TITLE, '使用引导', 16),
  new MessageEntry(MessageKey.REMINDER_TITLE, '开启提醒', 16)
];

/** 模板文案：用 {name} 占位。 */
export class TemplateEntry {
  key: string = '';
  template: string = '';
  /** 占位符名称列表，按出现顺序。 */
  placeholders: string[] = [];

  constructor(key: string = '', template: string = '') {
    this.key = key;
    this.template = template;
    this.placeholders = extractPlaceholders(template);
  }

  /** 渲染：缺失的占位符保留原样，便于发现遗漏。 */
  render(values: Map<string, string>): string {
    let output: string = this.template;
    this.placeholders.forEach((name: string): void => {
      const value: string | undefined = values.get(name);
      if (value !== undefined) {
        output = output.split(`{${name}}`).join(value);
      }
    });
    return output;
  }

  /** 是否所有占位符都已提供。 */
  complete(values: Map<string, string>): boolean {
    for (const name of this.placeholders) {
      if (values.get(name) === undefined) {
        return false;
      }
    }
    return true;
  }
}

/** 解析占位符名称。 */
export function extractPlaceholders(template: string): string[] {
  const names: string[] = [];
  let cursor: number = template.indexOf('{');
  while (cursor >= 0) {
    const end: number = template.indexOf('}', cursor + 1);
    if (end < 0) {
      break;
    }
    const name: string = template.slice(cursor + 1, end).trim();
    if (name.length > 0 && names.indexOf(name) < 0) {
      names.push(name);
    }
    cursor = template.indexOf('{', end + 1);
  }
  return names;
}

/** 模板表。 */
export const TEMPLATES: TemplateEntry[] = [
  new TemplateEntry('historyCount', '共 {count} 条记录，最近一次在 {time}'),
  new TemplateEntry('capabilitySummary', '{verdict}（API {api}，{form}）'),
  new TemplateEntry('permissionAsk', '已申请 {asked} 次，最多 {max} 次'),
  new TemplateEntry('reminderWait', '距离下次可提醒还有 {minutes} 分钟'),
  new TemplateEntry('exportSummary', '{format} 格式，{rows} 行，{size} 字节'),
  new TemplateEntry('onboardingProgress', '第 {current} 步，共 {total} 步（{percent}%）'),
  new TemplateEntry('checkResult', '{passed} 项通过，{warned} 项提醒，{failed} 项不通过')
];

/** 取固定文案；未知键返回空条目而不是抛错。 */
export function messageOf(key: MessageKey): MessageEntry {
  for (const entry of MESSAGES) {
    if (entry.key === key) {
      return entry;
    }
  }
  return new MessageEntry(key, '', 32, false);
}

/** 取固定文案的文本。 */
export function textOf(key: MessageKey): string {
  return messageOf(key).clipped();
}

/** 取模板；未知键返回空模板。 */
export function templateOf(key: string): TemplateEntry {
  for (const entry of TEMPLATES) {
    if (entry.key === key) {
      return entry;
    }
  }
  return new TemplateEntry(key, '');
}

/** 便捷渲染：传入成对的值。 */
export function renderTemplate(key: string, values: Map<string, string>): string {
  return templateOf(key).render(values);
}

/** 构造值表的便捷方法，避免调用方反复 new Map。 */
export function valuesOf(pairs: string[][]): Map<string, string> {
  const map: Map<string, string> = new Map<string, string>();
  pairs.forEach((pair: string[]): void => {
    if (pair.length === 2) {
      map.set(pair[0], pair[1]);
    }
  });
  return map;
}

/** 文案自检：键唯一、非空、模板占位符可闭合。 */
export class MessageAudit {
  ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    if (this.ok) {
      return '文案表自洽';
    }
    return this.findings.join('；');
  }
}

export function auditMessages(): MessageAudit {
  const audit: MessageAudit = new MessageAudit();
  const seen: string[] = [];
  MESSAGES.forEach((entry: MessageEntry): void => {
    if (seen.indexOf(entry.key) >= 0) {
      audit.findings.push(`文案键重复：${entry.key as string}`);
    }
    seen.push(entry.key);
    if (entry.text.length === 0) {
      audit.findings.push(`文案为空：${entry.key as string}`);
    }
    if (entry.maxLength <= 0) {
      audit.findings.push(`长度上限非法：${entry.key as string}`);
    }
    if (entry.overflow()) {
      audit.findings.push(`文案超长：${entry.key as string}`);
    }
  });
  TEMPLATES.forEach((entry: TemplateEntry): void => {
    if (entry.template.length === 0) {
      audit.findings.push(`模板为空：${entry.key}`);
    }
    const openCount: number = entry.template.split('{').length - 1;
    const closeCount: number = entry.template.split('}').length - 1;
    if (openCount !== closeCount) {
      audit.findings.push(`占位符不闭合：${entry.key}`);
    }
    if (entry.placeholders.length !== openCount) {
      audit.findings.push(`占位符解析不一致：${entry.key}`);
    }
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 文案目录摘要行。 */
export function messageLines(): string[] {
  const lines: string[] = [];
  MESSAGES.forEach((entry: MessageEntry): void => {
    lines.push(entry.describe());
  });
  return lines;
}

/** 模板摘要行。 */
export function templateLines(): string[] {
  return TEMPLATES.map((entry: TemplateEntry): string =>
    `${entry.key}：${entry.template}（${entry.placeholders.length} 个占位符）`);
}

/** 面向用户文案总数。 */
export function userFacingCount(): number {
  return MESSAGES.filter((entry: MessageEntry): boolean => entry.userFacing).length;
}
