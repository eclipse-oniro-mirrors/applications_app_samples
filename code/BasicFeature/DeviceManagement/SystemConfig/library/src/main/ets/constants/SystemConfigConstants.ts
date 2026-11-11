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
 * 系统配置示例常量定义。
 * 包含日志、权限、API 相关的全局常量。
 */
export class SystemConfigConstants {
  /** 日志标签 */
  static readonly TAG: string = '[Sample_SystemConfig]';
  /** 日志域 */
  static readonly DOMAIN: number = 0xFF00;
  /** 应用 bundleName */
  static readonly BUNDLE_NAME: string = 'com.samples.systemconfig';
  /** hiTraceMeter 域标识 */
  static readonly TRACE_DOMAIN: number = 0xFF00;
  /** hiAppEvent 域标识 */
  static readonly EVENT_DOMAIN: number = 0xFF00;
  /** hiAppEvent 事件组名称 */
  static readonly EVENT_GROUP: string = 'systemConfigEvent';
  /** 默认渠道号（模拟器环境返回值） */
  static readonly DEFAULT_CHANNEL_ID: string = 'default';
  /** 免打扰权限 */
  static readonly PERMISSION_DND: string = 'ohos.permission.GET_DONOTDISTURB_STATE';
  /** 错误码 - 权限拒绝 */
  static readonly ERROR_PERMISSION_DENIED: number = 201;
  /** 错误码 - 内部错误 */
  static readonly ERROR_INTERNAL: number = 35200001;
  /** 最大日志条目数 */
  static readonly MAX_LOG_ENTRIES: number = 200;
  /** 最大重试次数 */
  static readonly MAX_RETRY_COUNT: number = 3;
  /** 操作超时时间（毫秒） */
  static readonly OPERATION_TIMEOUT_MS: number = 10000;
  /** 状态刷新间隔（毫秒） */
  static readonly REFRESH_INTERVAL_MS: number = 5000;
}
