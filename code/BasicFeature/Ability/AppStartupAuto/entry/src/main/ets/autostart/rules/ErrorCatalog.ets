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
  code: string = '';
  /** 通用名称，用于日志。 */
  name: string = '';
  /** 面向用户的一句话。 */
  message: string = '';
  owner: ErrorOwner = ErrorOwner.APP;
  retry: RetryAdvice = RetryAdvice.NO_RETRY;
  /** 是否属于"能力不支持"，与"调用失败"分开统计。 */
  unsupported: boolean = false;
  /** 是否应引导去系统设置。 */
  settingsGuidance: boolean = false;
  /** 排查建议，面向开发者。 */
  hint: string = '';

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
export const ERROR_CATALOG: ErrorEntry[] = [
  new ErrorEntry('0', 'OK', '操作成功。', ErrorOwner.APP, RetryAdvice.NO_RETRY, false, false,
    '调用返回成功不代表系统已实际生效，仍需回读状态确认。'),
  new ErrorEntry('201', 'PERMISSION_DENIED', '缺少所需权限，无法继续。', ErrorOwner.USER,
    RetryAdvice.RETRY_AFTER_ACTION, false, true,
    '权限校验失败；确认 ohos.permission 声明已生效且用户已授予。'),
  new ErrorEntry('202', 'NOT_SYSTEM_APP', '当前应用不是系统应用。', ErrorOwner.SYSTEM,
    RetryAdvice.NO_RETRY, true, false,
    '该接口仅对系统应用开放，三方应用应改用公开接口或引导用户手动设置。'),
  new ErrorEntry('401', 'PARAMETER_ERROR', '请求参数不合法。', ErrorOwner.APP,
    RetryAdvice.RETRY_SAME, false, false,
    '检查入参类型、取值范围与必填项，不要重试同样的非法参数。'),
  new ErrorEntry('801', 'CAPABILITY_NOT_SUPPORTED', '当前设备不支持该能力。', ErrorOwner.SYSTEM,
    RetryAdvice.NO_RETRY, true, false,
    '设备能力缺失，属于不支持而非失败；不应展示"重试"按钮。'),
  new ErrorEntry('16000001', 'INVALID_PARAMETER', '参数无效。', ErrorOwner.APP,
    RetryAdvice.RETRY_SAME, false, false,
    'Ability 层参数校验失败；核对 want、bundleName 与请求码。'),
  new ErrorEntry('16000011', 'CONTEXT_INVALID', '上下文已失效。', ErrorOwner.APP,
    RetryAdvice.RETRY_AFTER_ACTION, false, false,
    'Ability 已销毁或上下文未初始化，需在有效生命周期内重新发起。'),
  new ErrorEntry('16000050', 'INTERNAL_ERROR', '系统内部错误。', ErrorOwner.SYSTEM,
    RetryAdvice.RETRY_LATER, false, false,
    '内部错误通常可重试一次；连续失败应记录日志并停止重试。'),
  new ErrorEntry('16000053', 'NOT_TOP_ABILITY', '目标不是前台 Ability。', ErrorOwner.APP,
    RetryAdvice.RETRY_AFTER_ACTION, false, false,
    '跳转设置页需在可见状态下发起。'),
  new ErrorEntry('16000060', 'ABILITY_NOT_FOUND', '未找到目标 Ability。', ErrorOwner.SYSTEM,
    RetryAdvice.NO_RETRY, true, false,
    '系统设置页不存在或名称不匹配，应保留手动指引。'),
  new ErrorEntry('401001', 'TEXT_TOO_LONG', '文本超出上限。', ErrorOwner.APP,
    RetryAdvice.NO_RETRY, false, false,
    '错误信息写入前必须截断，避免二次失败。'),
  new ErrorEntry('401002', 'FIELD_EMPTY', '必填字段为空。', ErrorOwner.APP,
    RetryAdvice.NO_RETRY, false, false,
    '空值不应进入持久化层。'),
  new ErrorEntry('STORAGE_READ', 'STORAGE_READ_FAILED', '读取本地记录失败。', ErrorOwner.APP,
    RetryAdvice.RETRY_AFTER_ACTION, false, false,
    '存档损坏时应保留空列表并提示，不要写入覆盖。'),
  new ErrorEntry('STORAGE_WRITE', 'STORAGE_WRITE_FAILED', '写入本地记录失败。', ErrorOwner.APP,
    RetryAdvice.RETRY_LATER, false, false,
    '写入失败不得改变内存中的既有记录。'),
  new ErrorEntry('TIMEOUT', 'QUERY_TIMEOUT', '查询超时。', ErrorOwner.ENVIRONMENT,
    RetryAdvice.RETRY_LATER, false, false,
    '超时是可重试状态，不等于不支持；记录应标记 timeout 而非 failure。'),
  new ErrorEntry('UNKNOWN', 'UNKNOWN', '未知结果。', ErrorOwner.APP,
    RetryAdvice.RETRY_LATER, false, false,
    '未知结果不计入成功或失败，单独统计。')
];

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
  unsupported: number = 0;
  failed: number = 0;
  timeout: number = 0;
  succeeded: number = 0;
  public unknown: number = 0;

  total(): number {
    return this.unsupported + this.failed + this.timeout + this.succeeded + this.unknown;
  }

  summary(): string {
    return `成功 ${this.succeeded}｜失败 ${this.failed}｜不支持 ${this.unsupported}｜` +
      `超时 ${this.timeout}｜未知 ${this.unknown}`;
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
