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
 * 自启查询与设置过程中的错误解释表。
 *
 * 系统返回的错误码只有数字，页面需要"是什么、能不能重试、去哪处理"。本表是
 * 唯一映射来源，诊断页、引导页和历史记录都从这里取，避免三处各自翻译。
 */

/** 错误归属：决定由谁处理。 */
export enum ErrorOwner {
  USER = 'user',
  APP = 'app',
  SYSTEM = 'system',
  ENVIRONMENT = 'environment'
}

/** 可重试性。 */
export enum RetryAdvice {
  NO_RETRY = 'noRetry',
  RETRY_SAME = 'retrySame',
  RETRY_AFTER_ACTION = 'retryAfterAction',
  RETRY_LATER = 'retryLater'
}

export class ErrorEntry {
  public code: string = '';
  /** 通用名称，用于日志。 */
  public name: string = '';
  /** 面向用户的一句话。 */
  public message: string = '';
  public owner: ErrorOwner = ErrorOwner.APP;
  public retry: RetryAdvice = RetryAdvice.NO_RETRY;
  /** 是否属于"能力不支持"，与"调用失败"分开统计。 */
  public unsupported: boolean = false;
  /** 是否应引导去系统设置。 */
  public settingsGuidance: boolean = false;
  /** 排查建议，面向开发者。 */
  public hint: string = '';

  constructor(code: string = '', name: string = '', message: string = '',
    owner: ErrorOwner = ErrorOwner.APP, retry: RetryAdvice = RetryAdvice.NO_RETRY,
    unsupported: boolean = false, settingsGuidance: boolean = false, hint: string = '') {
    this.code = code;
    this.name = name;
    this.message = message;
    this.owner = owner;
    this.retry = retry;
    this.unsupported = unsupported;
    this.settingsGuidance = settingsGuidance;
    this.hint = hint;
  }
}

/** OpenHarmony 通用错误码。本示例不编造自启专属错误码。 */
function createERROR_CATALOG(): ErrorEntry[] {
  return [
  new ErrorEntry('0', 'OK', localText('startup_text_0685'), ErrorOwner.APP, RetryAdvice.NO_RETRY, false, false,
    localText('startup_text_0686')),
  new ErrorEntry('201', 'PERMISSION_DENIED', localText('startup_text_0687'), ErrorOwner.USER,
    RetryAdvice.RETRY_AFTER_ACTION, false, true,
    localText('startup_text_0688')),
  new ErrorEntry('202', 'NOT_SYSTEM_APP', localText('startup_text_0689'), ErrorOwner.SYSTEM,
    RetryAdvice.NO_RETRY, true, false,
    localText('startup_text_0690')),
  new ErrorEntry('401', 'PARAMETER_ERROR', localText('startup_text_0691'), ErrorOwner.APP,
    RetryAdvice.RETRY_SAME, false, false,
    localText('startup_text_0692')),
  new ErrorEntry('801', 'CAPABILITY_NOT_SUPPORTED', localText('startup_text_0693'), ErrorOwner.SYSTEM,
    RetryAdvice.NO_RETRY, true, false,
    localText('startup_text_0694')),
  new ErrorEntry('16000001', 'INVALID_PARAMETER', localText('startup_text_0695'), ErrorOwner.APP,
    RetryAdvice.RETRY_SAME, false, false,
    localText('startup_text_0696')),
  new ErrorEntry('16000011', 'CONTEXT_INVALID', localText('startup_text_0697'), ErrorOwner.APP,
    RetryAdvice.RETRY_AFTER_ACTION, false, false,
    localText('startup_text_0698')),
  new ErrorEntry('16000050', 'INTERNAL_ERROR', localText('startup_text_0699'), ErrorOwner.SYSTEM,
    RetryAdvice.RETRY_LATER, false, false,
    localText('startup_text_0700')),
  new ErrorEntry('16000053', 'NOT_TOP_ABILITY', localText('startup_text_0701'), ErrorOwner.APP,
    RetryAdvice.RETRY_AFTER_ACTION, false, false,
    localText('startup_text_0702')),
  new ErrorEntry('16000060', 'ABILITY_NOT_FOUND', localText('startup_text_0703'), ErrorOwner.SYSTEM,
    RetryAdvice.NO_RETRY, true, false,
    localText('startup_text_0704')),
  new ErrorEntry('401001', 'TEXT_TOO_LONG', localText('startup_text_0705'), ErrorOwner.APP,
    RetryAdvice.NO_RETRY, false, false,
    localText('startup_text_0706')),
  new ErrorEntry('401002', 'FIELD_EMPTY', localText('startup_text_0707'), ErrorOwner.APP,
    RetryAdvice.NO_RETRY, false, false,
    localText('startup_text_0708')),
  new ErrorEntry('STORAGE_READ', 'STORAGE_READ_FAILED', localText('startup_text_0709'), ErrorOwner.APP,
    RetryAdvice.RETRY_AFTER_ACTION, false, false,
    localText('startup_text_0710')),
  new ErrorEntry('STORAGE_WRITE', 'STORAGE_WRITE_FAILED', localText('startup_text_0711'), ErrorOwner.APP,
    RetryAdvice.RETRY_LATER, false, false,
    localText('startup_text_0712')),
  new ErrorEntry('TIMEOUT', 'QUERY_TIMEOUT', localText('startup_text_0713'), ErrorOwner.ENVIRONMENT,
    RetryAdvice.RETRY_LATER, false, false,
    localText('startup_text_0714')),
  new ErrorEntry('UNKNOWN', 'UNKNOWN', localText('startup_text_0715'), ErrorOwner.APP,
    RetryAdvice.RETRY_LATER, false, false,
    localText('startup_text_0716'))
];
}
export const ERROR_CATALOG: ErrorEntry[] = createERROR_CATALOG();
registerTextRefresh((): void => {
  ERROR_CATALOG.splice(0, ERROR_CATALOG.length);
  createERROR_CATALOG().forEach((item: ErrorEntry): void => { ERROR_CATALOG.push(item); });
});

/** 查表；未知码返回 UNKNOWN 条目而不是抛错。 */
export function describeError(code: string): ErrorEntry {
  const normalized: string = code.trim().toUpperCase();
  for (const entry of ERROR_CATALOG) {
    if (entry.code.toUpperCase() === normalized) {
      return entry;
    }
  }
  return ERROR_CATALOG[ERROR_CATALOG.length - 1];
}

/** 是否属于能力不支持。 */
export function isUnsupportedCode(code: string): boolean {
  return describeError(code).unsupported;
}

/** 是否需要引导去系统设置。 */
export function needsSettingsForError(code: string): boolean {
  return describeError(code).settingsGuidance;
}

/** 是否允许自动重试。 */
export function allowsAutoRetry(code: string): boolean {
  const entry: ErrorEntry = describeError(code);
  return entry.retry === RetryAdvice.RETRY_SAME || entry.retry === RetryAdvice.RETRY_LATER;
}

/** 重试前需要用户先完成动作的错误。 */
export function requiresUserActionFirst(code: string): boolean {
  return describeError(code).retry === RetryAdvice.RETRY_AFTER_ACTION;
}

/** 面向用户的可读文本；空码返回空串，避免页面出现"错误 0"。 */
export function userMessageOf(code: string): string {
  const trimmed: string = code.trim();
  if (trimmed.length === 0 || trimmed === '0') {
    return '';
  }
  return describeError(trimmed).message;
}

/** 面向日志的单行描述。 */
export function logLineOf(code: string, detail: string): string {
  const entry: ErrorEntry = describeError(code);
  const suffix: string = detail.trim().length === 0 ? '' : `｜${detail.trim()}`;
  return `${entry.code}/${entry.name}/${entry.owner as string}${suffix}`;
}

/** 按归属分组，供诊断页分区展示。 */
export function groupByOwner(codes: string[]): Map<ErrorOwner, string[]> {
  const grouped: Map<ErrorOwner, string[]> = new Map<ErrorOwner, string[]>();
  grouped.set(ErrorOwner.USER, []);
  grouped.set(ErrorOwner.APP, []);
  grouped.set(ErrorOwner.SYSTEM, []);
  grouped.set(ErrorOwner.ENVIRONMENT, []);
  codes.forEach((code: string): void => {
    const entry: ErrorEntry = describeError(code);
    const bucket: string[] | undefined = grouped.get(entry.owner);
    if (bucket !== undefined && bucket.indexOf(code) < 0) {
      bucket.push(code);
    }
  });
  return grouped;
}

/** 统计一段记录里"不支持""失败""超时"各多少，避免混为一谈。 */
export class ErrorTally {
  public unsupported: number = 0;
  public failed: number = 0;
  public timeout: number = 0;
  public succeeded: number = 0;
  public unknown: number = 0;

  total(): number {
    return this.unsupported + this.failed + this.timeout + this.succeeded + this.unknown;
  }

  summary(): string {
    return formatResource('startup_format_448e841d4196', [String(this.succeeded), String(this.failed), String(this.unsupported)]) +
      formatResource('startup_format_206a2001625d', [String(this.timeout), String(this.unknown)]);
  }
}

export function tallyCodes(codes: string[]): ErrorTally {
  const tally: ErrorTally = new ErrorTally();
  codes.forEach((code: string): void => {
    const trimmed: string = code.trim().toUpperCase();
    if (trimmed.length === 0 || trimmed === '0') {
      tally.succeeded++;
      return;
    }
    if (trimmed === 'TIMEOUT') {
      tally.timeout++;
      return;
    }
    const entry: ErrorEntry = describeError(trimmed);
    if (entry.unsupported) {
      tally.unsupported++;
    } else if (entry.code === 'UNKNOWN') {
      tally.unknown++;
    } else {
      tally.failed++;
    }
  });
  return tally;
}
