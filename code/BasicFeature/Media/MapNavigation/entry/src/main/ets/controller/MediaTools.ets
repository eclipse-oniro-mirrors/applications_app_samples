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

import { image } from '@kit.ImageKit';
// [Start media_tools]
import { Logger } from '../utils/Logger';

// [StartExclude media_tools]

const TAG = 'MediaTools';

// [EndExclude media_tools]
export class MediaTools {
  static async getPixelMapFromFile(id: string, path: string): Promise<image.PixelMap> {
    Logger.info(TAG, 'getPixelMapFromFile id:' + id + ', path:' + path);
    return await image.createImageSource(path).createPixelMap();
  }

  /**
   * @param {string} value - Data value
   * @return {string} - If the date is less than two digits, add 0
   */
  private static fill(value: number): string {
    return value.toString().padStart(2, '0');
  }

  // Convert bytes to seconds
  static getMsFromByteLength(byteLength: number): number {
    return 1000 * (byteLength / 16000 * 2 * (16 / 8));
  }
}

// [End media_tools]