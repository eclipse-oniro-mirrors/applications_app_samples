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
import Logger from '../util/Logger';

/** Provides Device Utils helpers for the sample. */
export class DeviceUtils {
  static isFoldable(): boolean {
    try {
      return display.isFoldable();
    } catch (error) {
      Logger.error(`isFoldable failed: ${JSON.stringify(error)}`);
      return false;
    }
  }

  static foldStatus(): display.FoldStatus {
    try {
      return display.getFoldStatus();
    } catch (error) {
      Logger.error(`getFoldStatus failed: ${JSON.stringify(error)}`);
      return display.FoldStatus.FOLD_STATUS_UNKNOWN;
    }
  }

  static foldStatusName(status: display.FoldStatus): string {
    switch (status) {
      case display.FoldStatus.FOLD_STATUS_EXPANDED:
        return 'expanded';
      case display.FoldStatus.FOLD_STATUS_FOLDED:
        return 'folded';
      case display.FoldStatus.FOLD_STATUS_HALF_FOLDED:
        return 'half-folded';
      default:
        return 'unknown';
    }
  }

  static registerFoldListener(callback: Callback<display.FoldStatus>): void {
    try {
      display.on('foldStatusChange', callback);
      Logger.info('foldStatusChange listener registered');
    } catch (error) {
      Logger.error(`register fold listener failed: ${JSON.stringify(error)}`);
    }
  }

  static unregisterFoldListener(callback: Callback<display.FoldStatus>): void {
    try {
      display.off('foldStatusChange', callback);
      Logger.info('foldStatusChange listener unregistered');
    } catch (error) {
      Logger.error(`unregister fold listener failed: ${JSON.stringify(error)}`);
    }
  }
}
