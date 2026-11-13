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
 * 示例工程对外可见的常量。页面、能力封装与测试都从这里取值，
 * 避免同一个字面量在多处各写一份后互相漂移。
 */
export const LOG_DOMAIN: number = 0xF811;
export const LOG_PREFIX: string = '[Sample_AbilityFeature]';

/** 首页 Ability 的名称，隐式启动无匹配时弹窗里展示的就是它所在应用的名称。 */
export const ENTRY_ABILITY_NAME: string = 'EntryAbility';
/** 被 StartOptions 启动的 Ability。 */
export const NEW_ABILITY_NAME: string = 'NewAbility';

/** Toast 展示时长，单位毫秒。 */
export const TOAST_DURATION: number = 3000;
/** 示例在 5 个沙箱目录里创建的占位文件名。 */
export const SAMPLE_FILE_NAME: string = '/test.txt';

export const LANGUAGE_ZH_CN: string = 'zh-cn';
export const LANGUAGE_EN_US: string = 'en-us';

/** 隐式启动使用 action + type 组合，当前设备上没有应用声明匹配，因此命中数为 0。 */
export const VIEW_DATA_ACTION: string = 'ohos.want.action.viewData';
export const TEXT_PLAIN_TYPE: string = 'text/plain';
export const ZERO_MATCH_URI: string = 'filePath';

/** StartOptions 里写死的窗口位置与大小，与 README 中的说明保持一致。 */
export const START_OPTIONS_DISPLAY_ID: number = 0;
export const START_OPTIONS_WINDOW_LEFT: number = 50;
export const START_OPTIONS_WINDOW_TOP: number = 100;
export const START_OPTIONS_WINDOW_WIDTH: number = 300;
export const START_OPTIONS_WINDOW_HEIGHT: number = 400;
