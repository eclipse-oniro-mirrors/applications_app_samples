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
 * 分布式链路探测结果与错误码映射。
 * linkEnhance 与 proxyChannelManager 在 d.ts 里各自声明了一组错误码，
 * 这里把它们统一翻译成页面可展示的状态；全部为纯函数，可脱离设备做本地单测。
 * 状态名与提示语存于 string.json，函数返回当前语言下的文本。
 */

import { text, text1 } from '../common/StringResource';

export enum ProbeStatus {
  IDLE = 0,
  READY = 1,
  PERMISSION_DENIED = 2,
  CAPABILITY_UNSUPPORTED = 3,
  UNPAIRED = 4,
  BR_DISABLED = 5,
  DUPLICATE_NAME = 6,
  LIMIT_EXCEEDED = 7,
  NOT_READY = 8,
  INVALID_PARAM = 9,
  CHANNEL_INVALID = 10,
  RESTRICTED = 11,
  DATA_TOO_LONG = 12,
  SEND_FAILED = 13,
  INTERNAL = 14,
  FAILED = 15
}

/** 通用错误码 */
export const ERROR_CODE_PERMISSION_DENIED: number = 201;
export const ERROR_CODE_INVALID_PARAM: number = 401;
export const ERROR_CODE_CAPABILITY_UNSUPPORTED: number = 801;

/** linkEnhance 的专属错误码（js-apis-link-enhance.md） */
export const ERROR_CODE_CONNECT_TIMEOUT: number = 32390200;
export const ERROR_CODE_SERVER_NOT_STARTED: number = 32390201;
export const ERROR_CODE_LINK_SERVER_LIMIT: number = 32390202;
export const ERROR_CODE_LINK_DUPLICATE_NAME: number = 32390203;
export const ERROR_CODE_LINK_CONNECTION_LIMIT: number = 32390204;
export const ERROR_CODE_LINK_NOT_READY: number = 32390205;
export const ERROR_CODE_LINK_INVALID_PARAM: number = 32390206;
export const ERROR_CODE_LINK_INTERNAL: number = 32390300;

/** proxyChannelManager 的专属错误码（js-apis-proxyChannelManager.md） */
export const ERROR_CODE_BR_DISABLED: number = 32390001;
export const ERROR_CODE_NOT_PAIRED: number = 32390002;
export const ERROR_CODE_CHANNEL_INVALID: number = 32390004;
export const ERROR_CODE_CHANNEL_PARAM: number = 32390006;
export const ERROR_CODE_CHANNEL_INTERNAL: number = 32390100;
export const ERROR_CODE_CALL_RESTRICTED: number = 32390101;
export const ERROR_CODE_OPERATION_FAILED: number = 32390102;
export const ERROR_CODE_DATA_TOO_LONG: number = 32390103;
export const ERROR_CODE_SEND_FAILED: number = 32390104;

/** ChannelState 的四个取值（0 不可用、1 恢复、2 软件异常、3 未配对） */
export const CHANNEL_STATE_WAIT_RESUME: number = 0;
export const CHANNEL_STATE_RESUME: number = 1;
export const CHANNEL_STATE_SOFTWARE_FAILED: number = 2;
export const CHANNEL_STATE_BR_NO_PAIRED: number = 3;

/** LinkType 目前只有经典蓝牙一种取值 */
export const LINK_TYPE_BR: number = 0;

/** AbilityConstant.CollaborateResult 的两个取值 */
export const COLLABORATE_ACCEPT: number = 0;
export const COLLABORATE_REJECT: number = 1;

export function classifyErrorCode(code: number): ProbeStatus {
  switch (code) {
    case ERROR_CODE_PERMISSION_DENIED:
      return ProbeStatus.PERMISSION_DENIED;
    case ERROR_CODE_INVALID_PARAM:
    case ERROR_CODE_LINK_INVALID_PARAM:
    case ERROR_CODE_CHANNEL_PARAM:
      return ProbeStatus.INVALID_PARAM;
    case ERROR_CODE_CAPABILITY_UNSUPPORTED:
      return ProbeStatus.CAPABILITY_UNSUPPORTED;
    case ERROR_CODE_LINK_SERVER_LIMIT:
    case ERROR_CODE_LINK_CONNECTION_LIMIT:
      return ProbeStatus.LIMIT_EXCEEDED;
    case ERROR_CODE_CONNECT_TIMEOUT:
      return ProbeStatus.FAILED;
    case ERROR_CODE_SERVER_NOT_STARTED:
      return ProbeStatus.NOT_READY;
    case ERROR_CODE_LINK_DUPLICATE_NAME:
      return ProbeStatus.DUPLICATE_NAME;
    case ERROR_CODE_LINK_NOT_READY:
      return ProbeStatus.NOT_READY;
    case ERROR_CODE_LINK_INTERNAL:
    case ERROR_CODE_CHANNEL_INTERNAL:
      return ProbeStatus.INTERNAL;
    case ERROR_CODE_BR_DISABLED:
      return ProbeStatus.BR_DISABLED;
    case ERROR_CODE_NOT_PAIRED:
      return ProbeStatus.UNPAIRED;
    case ERROR_CODE_CHANNEL_INVALID:
      return ProbeStatus.CHANNEL_INVALID;
    case ERROR_CODE_CALL_RESTRICTED:
      return ProbeStatus.RESTRICTED;
    case ERROR_CODE_DATA_TOO_LONG:
      return ProbeStatus.DATA_TOO_LONG;
    case ERROR_CODE_SEND_FAILED:
      return ProbeStatus.SEND_FAILED;
    case ERROR_CODE_OPERATION_FAILED:
      return ProbeStatus.FAILED;
    default:
      return code > 0 ? ProbeStatus.FAILED : ProbeStatus.IDLE;
  }
}

export function probeStatusName(status: ProbeStatus): string {
  switch (status) {
    case ProbeStatus.READY:
      return text('probe_status_ready');
    case ProbeStatus.PERMISSION_DENIED:
      return text('probe_status_permission_denied');
    case ProbeStatus.CAPABILITY_UNSUPPORTED:
      return text('probe_status_unsupported');
    case ProbeStatus.UNPAIRED:
      return text('probe_status_unpaired');
    case ProbeStatus.BR_DISABLED:
      return text('probe_status_br_disabled');
    case ProbeStatus.DUPLICATE_NAME:
      return text('probe_status_duplicate_name');
    case ProbeStatus.LIMIT_EXCEEDED:
      return text('probe_status_limit_exceeded');
    case ProbeStatus.NOT_READY:
      return text('probe_status_not_ready');
    case ProbeStatus.INVALID_PARAM:
      return text('probe_status_invalid_param');
    case ProbeStatus.CHANNEL_INVALID:
      return text('probe_status_channel_invalid');
    case ProbeStatus.RESTRICTED:
      return text('probe_status_restricted');
    case ProbeStatus.DATA_TOO_LONG:
      return text('probe_status_data_too_long');
    case ProbeStatus.SEND_FAILED:
      return text('probe_status_send_failed');
    case ProbeStatus.INTERNAL:
      return text('probe_status_internal');
    case ProbeStatus.FAILED:
      return text('probe_status_failed');
    default:
      return text('probe_status_idle');
  }
}

export function probeStatusHint(status: ProbeStatus): string {
  switch (status) {
    case ProbeStatus.READY:
      return text('probe_hint_ready');
    case ProbeStatus.PERMISSION_DENIED:
      return text('probe_hint_permission_denied');
    case ProbeStatus.CAPABILITY_UNSUPPORTED:
      return text('probe_hint_unsupported');
    case ProbeStatus.UNPAIRED:
      return text('probe_hint_unpaired');
    case ProbeStatus.BR_DISABLED:
      return text('probe_hint_br_disabled');
    case ProbeStatus.DUPLICATE_NAME:
      return text('probe_hint_duplicate_name');
    case ProbeStatus.LIMIT_EXCEEDED:
      return text('probe_hint_limit_exceeded');
    case ProbeStatus.NOT_READY:
      return text('probe_hint_not_ready');
    case ProbeStatus.INVALID_PARAM:
      return text('probe_hint_invalid_param');
    case ProbeStatus.CHANNEL_INVALID:
      return text('probe_hint_channel_invalid');
    case ProbeStatus.RESTRICTED:
      return text('probe_hint_restricted');
    case ProbeStatus.DATA_TOO_LONG:
      return text('probe_hint_data_too_long');
    case ProbeStatus.SEND_FAILED:
      return text('probe_hint_send_failed');
    case ProbeStatus.INTERNAL:
      return text('probe_hint_internal');
    default:
      return text('probe_hint_default');
  }
}

/** 0 表示调用正常返回；其余非零都按失败处理 */
export function isSuccessCode(code: number): boolean {
  return code === 0;
}

export function isReadyStatus(status: ProbeStatus): boolean {
  return status === ProbeStatus.READY;
}

export function channelStateName(state: number): string {
  switch (state) {
    case CHANNEL_STATE_WAIT_RESUME:
      return text('channel_state_wait_resume');
    case CHANNEL_STATE_RESUME:
      return text('channel_state_resume');
    case CHANNEL_STATE_SOFTWARE_FAILED:
      return text('channel_state_software_failed');
    case CHANNEL_STATE_BR_NO_PAIRED:
      return text('channel_state_br_no_paired');
    default:
      return text('channel_state_unknown');
  }
}

export function isChannelUsable(state: number): boolean {
  return state === CHANNEL_STATE_RESUME;
}

export function collaborateResultName(code: number): string {
  if (code === COLLABORATE_ACCEPT) {
    return text('collab_result_accept');
  }
  if (code === COLLABORATE_REJECT) {
    return text('collab_result_reject');
  }
  return text1('collab_result_unknown', `${code}`);
}
