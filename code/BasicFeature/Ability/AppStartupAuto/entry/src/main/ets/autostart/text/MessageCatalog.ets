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

import { formatResource, localText, registerTextRefresh } from './LocalizedText';

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
  public key: MessageKey = MessageKey.APP_TITLE;
  /** 默认文案。 */
  public text: string = '';
  /** 允许的最大长度，超出会被截断并记录。 */
  public maxLength: number = 64;
  /** 是否为面向用户的正式文案（false 表示内部提示）。 */
  public userFacing: boolean = true;

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
function createMESSAGES(): MessageEntry[] {
  return [
  new MessageEntry(MessageKey.APP_TITLE, localText('startup_text_0718'), 16),
  new MessageEntry(MessageKey.STATUS_ON, localText('startup_text_0719'), 24),
  new MessageEntry(MessageKey.STATUS_OFF, localText('startup_text_0720'), 24),
  new MessageEntry(MessageKey.STATUS_UNKNOWN, localText('startup_text_0721'), 32),
  new MessageEntry(MessageKey.QUERY_FAILED, localText('startup_text_0722'), 32),
  new MessageEntry(MessageKey.UNSUPPORTED, localText('startup_text_0723'), 40),
  new MessageEntry(MessageKey.NEED_SETTINGS, localText('startup_text_0724'), 32),
  new MessageEntry(MessageKey.NEED_PERMISSION, localText('startup_text_0725'), 32),
  new MessageEntry(MessageKey.EXPORT_EMPTY, localText('startup_text_0726'), 24),
  new MessageEntry(MessageKey.EXPORT_DONE, localText('startup_text_0727'), 24),
  new MessageEntry(MessageKey.HISTORY_EMPTY, localText('startup_text_0728'), 24),
  new MessageEntry(MessageKey.SELF_CHECK_DONE, localText('startup_text_0729'), 24),
  new MessageEntry(MessageKey.GUIDANCE_TITLE, localText('startup_text_0730'), 16),
  new MessageEntry(MessageKey.ONBOARDING_TITLE, localText('startup_text_0731'), 16),
  new MessageEntry(MessageKey.REMINDER_TITLE, localText('startup_text_0732'), 16)
];
}
export const MESSAGES: MessageEntry[] = createMESSAGES();
registerTextRefresh((): void => {
  MESSAGES.splice(0, MESSAGES.length);
  createMESSAGES().forEach((item: MessageEntry): void => { MESSAGES.push(item); });
});

/** 模板文案：用 {name} 占位。 */
export class TemplateEntry {
  public key: string = '';
  public template: string = '';
  /** 占位符名称列表，按出现顺序。 */
  public placeholders: string[] = [];

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
function createTEMPLATES(): TemplateEntry[] {
  return [
  new TemplateEntry('historyCount', localText('startup_text_0733')),
  new TemplateEntry('capabilitySummary', '{verdict}（API {api}，{form}）'),
  new TemplateEntry('permissionAsk', localText('startup_text_0734')),
  new TemplateEntry('reminderWait', localText('startup_text_0735')),
  new TemplateEntry('exportSummary', localText('startup_text_0736')),
  new TemplateEntry('onboardingProgress', localText('startup_text_0737')),
  new TemplateEntry('checkResult', localText('startup_text_0738'))
];
}
export const TEMPLATES: TemplateEntry[] = createTEMPLATES();
registerTextRefresh((): void => {
  TEMPLATES.splice(0, TEMPLATES.length);
  createTEMPLATES().forEach((item: TemplateEntry): void => { TEMPLATES.push(item); });
});

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
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    if (this.ok) {
      return localText('startup_text_0739');
    }
    return this.findings.join('；');
  }
}

export function auditMessages(): MessageAudit {
  const audit: MessageAudit = new MessageAudit();
  const seen: string[] = [];
  MESSAGES.forEach((entry: MessageEntry): void => {
    if (seen.indexOf(entry.key) >= 0) {
      audit.findings.push(formatResource('startup_format_c7d0d7a0f3e9', [String(entry.key as string)]));
    }
    seen.push(entry.key);
    if (entry.text.length === 0) {
      audit.findings.push(formatResource('startup_format_776c349a3174', [String(entry.key as string)]));
    }
    if (entry.maxLength <= 0) {
      audit.findings.push(formatResource('startup_format_d6c1777f81e2', [String(entry.key as string)]));
    }
    if (entry.overflow()) {
      audit.findings.push(formatResource('startup_format_8fe38e8fdb7d', [String(entry.key as string)]));
    }
  });
  TEMPLATES.forEach((entry: TemplateEntry): void => {
    if (entry.template.length === 0) {
      audit.findings.push(formatResource('startup_format_3c6f74b8ebe9', [String(entry.key)]));
    }
    const openCount: number = entry.template.split('{').length - 1;
    const closeCount: number = entry.template.split('}').length - 1;
    if (openCount !== closeCount) {
      audit.findings.push(formatResource('startup_format_7e26987afdaa', [String(entry.key)]));
    }
    if (entry.placeholders.length !== openCount) {
      audit.findings.push(formatResource('startup_format_a9d5643f0d1f', [String(entry.key)]));
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
    formatResource('startup_format_7547051850cf', [String(entry.key), String(entry.template), String(entry.placeholders.length)]));
}

/** 面向用户文案总数。 */
export function userFacingCount(): number {
  return MESSAGES.filter((entry: MessageEntry): boolean => entry.userFacing).length;
}
