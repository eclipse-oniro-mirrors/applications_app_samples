'use static'
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
// [Start Common_WindowUtils]
// common/WindowUtils.ets
import { display, window } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIContext } from '@ohos.arkui.UIContext';

const DOMAIN = 0x0000;

export class WindowUIContextUtils {
  public static activeUIContext: UIContext | undefined;

  static registerWindowCallback(windowClass: window.Window): void {
    try {
      windowClass.onWindowEvent((event: window.WindowEventType): void => {
        if (event === window.WindowEventType.WINDOW_ACTIVE) {
          try {
            let uiContext = windowClass.getUIContext();
            WindowUIContextUtils.activeUIContext = uiContext;
          } catch (exception) {
            hilog.error(DOMAIN, 'testTag', `Can't get UIContext, ${exception}`);
          }
        }
      });
    } catch (exception) {
      hilog.error(DOMAIN, 'testTag', `Failed to register callback. Cause: ${exception}`);
    }
  }

  static unregisterWindowCallback(windowClass: window.Window): void {
    windowClass.offWindowEvent();
  }

  static setActiveUIContext(uiContext: UIContext): void {
    WindowUIContextUtils.activeUIContext = uiContext;
  }

  static vp2px(vpValue: number, uiContext?: UIContext): number {
    let currentContext = uiContext ?? WindowUIContextUtils.activeUIContext;
    if (!currentContext || !currentContext.isAvailable()) {
      try {
        let displayClass = display.getDefaultDisplaySync();
        let density = displayClass.densityPixels;
        return vpValue * density;
      } catch (exception) {
        hilog.error(DOMAIN, 'testTag', `Can't get default display, ${exception}`);
        return vpValue;
      }
    }

    return (currentContext as UIContext).vp2px(vpValue);
  }
}

// [End Common_WindowUtils]
