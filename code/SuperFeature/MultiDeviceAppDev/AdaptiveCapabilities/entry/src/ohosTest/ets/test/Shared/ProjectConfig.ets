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

// 被测应用标识：与 AppScope/app.json5 的 bundleName 及主 module 的 mainElement 一致
export const TARGET_BUNDLE: string = 'ohos.samples.AdaptiveCapabilities';

export const TARGET_ABILITY: string = 'MainAbility';

// 项目标识：用于 hilog 打点，便于在多套件日志中区分来源
export const PROJECT_NAME: string = 'AdaptiveCapabilities';

// 断点阈值：与工程 BreakpointSystem 的 breakpoints 数组一致（设计值，单位 vp）
export const THRESHOLD_SM: number = 320;

export const THRESHOLD_MD: number = 600;

export const THRESHOLD_LG: number = 840;

// 分栏导航栏宽度占比：与工程 Index.ets 中 0.4 * windowWidth 一致
export const NAVBAR_RATIO: number = 0.4;

// 分栏模式临界宽度：宽于该值启用 Split 模式
export const SPLIT_MODE_MIN_WIDTH: number = 600;
