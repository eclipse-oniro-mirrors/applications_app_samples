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

import { promptAction } from '@kit.ArkUI';

// Duration in milliseconds of the short toast, kept aligned with the platform short duration.
const SHORT_DURATION: number = 1500;
// Duration in milliseconds of the long toast, kept aligned with the platform long duration.
const LONG_DURATION: number = 3000;
// Fallback log message used when the toast itself throws.
const TOAST_FAILED: string = 'show toast failed';

/**
 * Toast helper that never throws into the caller.
 * A failed toast is only written to the console because the utilities package must not depend on Logger.
 * The class is intentionally stateless so it can be used from any page or service.
 */
export class ToastUtils {
  /**
   * Shows a toast for the short duration.
   * @param message Text shown to the user.
   */
  static showShort(message: string): void {
    // Delegate to the shared implementation with the short duration.
    ToastUtils.show(message, SHORT_DURATION);
  }

  /**
   * Shows a toast for the long duration.
   * @param message Text shown to the user.
   */
  static showLong(message: string): void {
    // Delegate to the shared implementation with the long duration.
    ToastUtils.show(message, LONG_DURATION);
  }

  /**
   * Shows a toast for an explicit duration.
   * @param message Text shown to the user.
   * @param duration Duration in milliseconds.
   */
  static show(message: string, duration: number): void {
    try {
      // Build the show toast options with an explicit type for the object literal.
      const options: promptAction.ShowToastOptions = { message: message, duration: duration };
      // Hand the request over to the UI framework.
      promptAction.showToast(options);
    } catch (error) {
      // A toast failure must never break the caller flow, so it is only logged.
      console.error(TOAST_FAILED + ': ' + JSON.stringify(error));
    }
  }
}
