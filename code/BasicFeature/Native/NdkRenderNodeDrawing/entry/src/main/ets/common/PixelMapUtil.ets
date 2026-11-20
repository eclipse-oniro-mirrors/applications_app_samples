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
import { resourceManager } from '@kit.LocalizationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from './Logger';

// 从 rawfile 解码图片，使用完毕后由调用方 release。
export async function loadPixelMap(resourceMgr: resourceManager.ResourceManager,
  fileName: string): Promise<image.PixelMap | undefined> {
  try {
    const fileData: Uint8Array = await resourceMgr.getRawFileContent(fileName);
    const buffer: ArrayBuffer = fileData.buffer.slice(0);
    const imageSource: image.ImageSource = image.createImageSource(buffer);
    const pixelMap: image.PixelMap = await imageSource.createPixelMap();
    await imageSource.release();
    Logger.info('load pixel map success: ' + fileName);
    return pixelMap;
  } catch (err) {
    const error: BusinessError = err as BusinessError;
    Logger.error('load pixel map failed, code=' + error.code + ' message=' + error.message);
    return undefined;
  }
}

// 释放 PixelMap，忽略重复释放导致的异常。
export async function releasePixelMap(pixelMap: image.PixelMap | undefined): Promise<void> {
  if (pixelMap === undefined || pixelMap.isReleased()) {
    return;
  }
  try {
    await pixelMap.release();
  } catch (err) {
    const error: BusinessError = err as BusinessError;
    Logger.error('release pixel map failed, code=' + error.code + ' message=' + error.message);
  }
}
