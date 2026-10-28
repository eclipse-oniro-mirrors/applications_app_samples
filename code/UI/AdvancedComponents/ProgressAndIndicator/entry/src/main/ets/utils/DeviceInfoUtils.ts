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

import { display } from '@kit.ArkUI';
import { deviceInfo } from '@kit.BasicServicesKit';
import Logger from '../util/Logger';

/** Provides Device Info Utils helpers for the sample. */
export class DeviceInfoUtils {
  static deviceType(): string {
    try {
      return deviceInfo.deviceType;
    } catch (error) {
      Logger.error(`get deviceType failed: ${JSON.stringify(error)}`);
      return 'unknown';
    }
  }

  static screenInfo(): string {
    try {
      const info = display.getDefaultDisplaySync();
      return `device=${DeviceInfoUtils.deviceType()}, width=${info.width}px, height=${info.height}px, ` +
        `density=${info.densityPixels}, orientation=${info.orientation}`;
    } catch (error) {
      Logger.error(`get screen info failed: ${JSON.stringify(error)}`);
      return 'unknown';
    }
  }

  static isLandscape(): boolean {
    try {
      const info = display.getDefaultDisplaySync();
      return info.width > info.height;
    } catch (error) {
      return false;
    }
  }
}
