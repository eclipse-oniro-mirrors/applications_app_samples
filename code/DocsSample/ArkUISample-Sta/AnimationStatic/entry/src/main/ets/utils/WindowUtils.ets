'use static'
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

// [Start navigation_window_utils]
// [Start bind_sheet_window_utils]
// WindowUtils.ets
// 窗口信息
import window from '@ohos.window';

export class WindowUtils {
  public static window: window.Window | undefined = undefined;
  public static windowWidthPx: int = 0;
  public static windowHeightPx: int = 0;
  public static topAvoidAreaHeightPx: int = 0;
  public static navigationIndicatorHeightPx: int = 0;
}

// [End bind_sheet_window_utils]
// [End navigation_window_utils]
