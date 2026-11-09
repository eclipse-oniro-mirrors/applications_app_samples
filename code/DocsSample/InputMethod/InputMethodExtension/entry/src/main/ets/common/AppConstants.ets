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
 * 全局常量：日志域、输入法扩展信息上限、键盘面板尺寸与输入缓冲上限。
 * 这里只放"纯数据"，不引用任何 SDK 类型，保证 model/utils 里的纯函数可以在本地单测直接跑。
 */

/** 日志域。0xF811 为示例工程统一使用的日志域，按域过滤即可只看本示例的日志 */
export const HILOG_DOMAIN: number = 0xF811;
export const HILOG_TAG: string = 'InputMethodExt';

/** 页面事件日志的容量上限与一屏展示条数 */
export const LOG_STORE_CAPACITY: number = 200;
export const PAGE_LOG_LIMIT: number = 20;
export const HOME_LOG_LIMIT: number = 30;

export class StorageKeys {
  public static readonly APP_LOGS: string = 'appLogs';
  public static readonly KEYBOARD_TEXT: string = 'keyboardText';
}

/**
 * 扩展信息总长度上限：文档写明"信息总长度不超过 32KB"。
 * 页面上同时提供"压线"和"超限 1 字节"两组数据，让限额判定能被直接观测。
 */
export const EXTRA_CONFIG_MAX_BYTES: number = 32 * 1024;

/** 示例键值对用到的键名 */
export const KEY_THEME_COLOR: string = 'theme.color';
export const KEY_INPUT_HABIT: string = 'input.habit';
export const KEY_VOICE_ENABLED: string = 'voice.enabled';
export const KEY_CANDIDATE_LIMIT: string = 'candidate.limit';

/** 异步接口的等待上限：超时只代表页面不再等，底层调用可能仍在进行 */
export const API_TIMEOUT_MS: number = 8000;

/** 单条日志在页面上截断的长度 */
export const LOG_PREVIEW_LENGTH: number = 160;

/** 键盘面板尺寸（vp） */
export const KEYBOARD_ROW_HEIGHT: number = 46;
export const KEYBOARD_GAP: number = 5;
export const KEYBOARD_PADDING: number = 8;
export const CANDIDATE_BAR_HEIGHT: number = 40;

/** 键盘输入缓冲上限：演示页里防止无限追加 */
export const KEYBOARD_BUFFER_LIMIT: number = 64;

/** 输入法切换列表的模式项数量：图标资源有限，固定两项 */
export const LIST_PATTERN_COUNT: number = 2;
