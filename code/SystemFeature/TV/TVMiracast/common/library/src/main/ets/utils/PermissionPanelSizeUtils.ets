/*
 * Copyright (C) 2026 HiHope Open Source Organization.
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

import { display, Size } from '@kit.ArkUI';
import { Log } from './Log';

const TAG = 'PermissionPanelSizeUtils';

export class PermissionPanelSizeUtils {
  private static ins: PermissionPanelSizeUtils | null = null;

  static getIns(): PermissionPanelSizeUtils {
    if (!PermissionPanelSizeUtils.ins) {
      PermissionPanelSizeUtils.ins = new PermissionPanelSizeUtils();
    }
    return PermissionPanelSizeUtils.ins;
  }

  // Scale ratio of the dialog page
  getZoomRatio(): number {
    if (this.getScreenSize().width > this.getScreenSize().height) {
      return this.getRealSize().width / this.getScreenSize().width;
    } else {
      return this.getRealSize().width / this.getScreenSize().width - 0.3;
    }
  }

  // Screen size
  getScreenSize(): Size {
    return {
      width: display.getDefaultDisplaySync().width,
      height: display.getDefaultDisplaySync().height
    }
  }

  // Actual displayed size
  getRealSize(): Size {
    if (this.getScreenSize().width > this.getScreenSize().height) {
      return this.calculatedSize(690, 590, 1920, 1080);
    } else {
      return this.calculatedSize(690, 590, 1080, 1920);
    }
  }

  // Actual panel size in portrait mode
  private calculatedSize(uxPanelWidth: number, uxPanelHeight: number,
    uxScreenWidth: number, uxScreenHeight: number): Size {
    // Aspect ratio of the design draft
    let originalProportion = uxPanelWidth / uxPanelHeight;
    Log.info(TAG, `PortraitScreen originalProportion = ${originalProportion}`);

    // Ratio of the design draft width to the dialog width
    let screenToUx = uxScreenWidth / uxPanelWidth;
    Log.info(TAG, `PortraitScreen screenToUx = ${originalProportion}`);

    // Current screen width and height
    let screenWidth = this.getScreenSize().width;
    let screenHeight = this.getScreenSize().height;
    Log.info(TAG, `PortraitScreen screenWidth = ${screenWidth},  screenHeight = ${screenHeight}`);

    // Actual size
    let actualWidth = screenWidth / screenToUx;
    let actualHeight = actualWidth / originalProportion;
    Log.info(TAG, `PortraitScreen actualWidth = ${actualWidth},  actualHeight = ${actualHeight}`);

    return {
      width: actualWidth,
      height: actualHeight
    }
  }
}
