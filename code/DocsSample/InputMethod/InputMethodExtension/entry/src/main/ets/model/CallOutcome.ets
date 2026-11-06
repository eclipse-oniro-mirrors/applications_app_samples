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

/**
 * 一次 API 调用的结果，以及错误码到"问题类别"的映射。
 *
 * 为什么单独建模：输入法框架的接口失败时不一定抛异常——createPanel 在非输入法
 * 进程里抛 12800004，而部分能力在能力未声明时返回 undefined。只判断 try/catch
 * 会让失败被当成成功，所以用 status 把三种情况分开：抛异常、返回 undefined、正常返回。
 * 0 始终只代表成功。
 */

/** 问题类别。页面据此选颜色，用例据此挑断言分支 */
export enum ApiStatus {
  OK = 'ok',
  /** 入参不合法：401 */
  INVALID_INPUT = 'invalid',
  /** 设备或系统不支持该能力：801、501 */
  UNSUPPORTED = 'unsupported',
  /** 调用身份不符：12800004 非输入法应用、12800013 输入法未启用 */
  INPUT_METHOD = 'inputMethod',
  /** 接口返回了 undefined 却没有任何错误——最需要警惕的一类 */
  EMPTY_RESULT = 'empty',
  /** 其余失败：12800008、12800010、12800014 以及本地兜底码 */
  INTERNAL = 'internal'
}

/** d.ts 里登记的错误码 */
export const ERROR_CODE_INVALID_PARAM: number = 401;
export const ERROR_CODE_UNSUPPORTED: number = 501;
export const ERROR_CODE_SYSCAP: number = 801;
/** 调用者不是输入法应用：createPanel 等接口只对输入法扩展进程开放 */
export const ERROR_CODE_NOT_INPUT_METHOD: number = 12800004;
/** 输入法框架未就绪或未被启用 */
export const ERROR_CODE_INPUT_METHOD_NOT_ENABLED: number = 12800013;

/** 本地占位码：接口抛出的对象里取不到数值错误码 */
export const ERROR_CODE_LOCAL_UNEXPECTED_THROW: number = -1;
/** 本地占位码：同步接口返回 undefined（既无返回值也无异常） */
export const ERROR_CODE_LOCAL_EMPTY_RESULT: number = -2;
/** 本地占位码：异步接口在等待上限内没有回调 */
export const ERROR_CODE_LOCAL_TIMEOUT: number = -3;

export function classifyErrorCode(code: number): ApiStatus {
  if (code === 0) {
    return ApiStatus.OK;
  }
  switch (code) {
    case ERROR_CODE_INVALID_PARAM:
      return ApiStatus.INVALID_INPUT;
    case ERROR_CODE_SYSCAP:
    case ERROR_CODE_UNSUPPORTED:
      return ApiStatus.UNSUPPORTED;
    case ERROR_CODE_NOT_INPUT_METHOD:
    case ERROR_CODE_INPUT_METHOD_NOT_ENABLED:
      return ApiStatus.INPUT_METHOD;
    case ERROR_CODE_LOCAL_EMPTY_RESULT:
      return ApiStatus.EMPTY_RESULT;
    default:
      return ApiStatus.INTERNAL;
  }
}

export function apiStatusName(status: ApiStatus): string {
  switch (status) {
    case ApiStatus.OK:
      return '成功';
    case ApiStatus.INVALID_INPUT:
      return '入参无效';
    case ApiStatus.UNSUPPORTED:
      return '能力不支持';
    case ApiStatus.INPUT_METHOD:
      return '输入法身份不符';
    case ApiStatus.EMPTY_RESULT:
      return '无返回结果';
    default:
      return '内部错误';
  }
}

/** 统一的结果对象：页面只渲染 describe()，用例只断言 status 与 code */
export class CallOutcome {
  public api: string;
  public status: ApiStatus;
  public code: number;
  public summary: string;
  public detail: string;
  public durationMs: number;

  constructor(api: string, status: ApiStatus, code: number, summary: string,
              detail: string, durationMs: number) {
    this.api = api;
    this.status = status;
    this.code = code;
    this.summary = summary;
    this.detail = detail;
    this.durationMs = durationMs;
  }

  isOk(): boolean {
    return this.status === ApiStatus.OK;
  }

  /** 形如「buildExtraConfig → 成功：4 个键，共 118 字节」 */
  describe(): string {
    const head = `${this.api} → ${apiStatusName(this.status)}`;
    const body = this.summary.length > 0 ? `${head}：${this.summary}` : head;
    if (this.code === 0) {
      return body;
    }
    return `${body}（${this.code}）`;
  }

  /** 详细说明放在第二行，页面用小字展示，避免主行过长 */
  describeDetail(): string {
    return this.detail;
  }
}

export function okOutcome(api: string, summary: string, detail: string, durationMs: number): CallOutcome {
  return new CallOutcome(api, ApiStatus.OK, 0, summary, detail, durationMs);
}

export function failedOutcome(api: string, status: ApiStatus, code: number, summary: string,
                              detail: string, durationMs: number): CallOutcome {
  return new CallOutcome(api, status, code, summary, detail, durationMs);
}

/** 同步接口返回 undefined：必须与成功区分开，code 用本地占位码而不是 0 */
export function emptyOutcome(api: string, detail: string, durationMs: number): CallOutcome {
  return new CallOutcome(api, ApiStatus.EMPTY_RESULT, ERROR_CODE_LOCAL_EMPTY_RESULT,
    '接口返回 undefined 且未抛异常', detail, durationMs);
}

/** 本地入参校验不通过：不打到设备上，直接给出原因 */
export function invalidOutcome(api: string, detail: string): CallOutcome {
  return new CallOutcome(api, ApiStatus.INVALID_INPUT, ERROR_CODE_INVALID_PARAM,
    '本地校验未通过', detail, 0);
}
