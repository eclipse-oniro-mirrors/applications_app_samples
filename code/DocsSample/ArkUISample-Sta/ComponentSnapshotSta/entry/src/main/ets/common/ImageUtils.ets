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

import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from './Logger';
import { UIContext } from '@kit.ArkUI';
import { AppStorage } from '@kit.ArkUI';

const uiContext: UIContext | undefined = AppStorage.get('uiContext');
const TAG = 'ImageUtilsLogTag';

export class ImageUtils {
  // [Start get_snapshot_area]
  /**
   * Read the screenshot PixelMap object into the buffer area
   * @param {PixelMap} pixelMap - Screenshot PixelMap
   * @param {int[]} scrollYOffsets - Component scrolls an array of y-axis offsets
   * @param {int} listWidth - List component width
   * @param {int} listHeight - List component height
   * @returns {image.PositionArea} Picture buffer area
   */
  static async getSnapshotArea(pixelMap: image.PixelMap, scrollYOffsets: int[], listWidth: int,
    listHeight: int): Promise<image.PositionArea>{
    // Gets the number of bytes per line of image pixels.
    let stride = pixelMap.getBytesNumberPerRow();
    // Get the total number of bytes of image pixels.
    let bytesNumber = pixelMap.getPixelBytesNumber();
    let buffer: ArrayBuffer = new ArrayBuffer(bytesNumber);
    // 	Region size, read based on region.   PositionArea represents the data within the specified area of the image.
    let len = scrollYOffsets.length;

    // Except for the first screenshot, you don't need to crop it, and you need to crop the new parts
    if (scrollYOffsets.length >= 2) {
      // Realistic roll distance
      let realScrollHeight = scrollYOffsets[len-1] - scrollYOffsets[len-2];
      if (listHeight - realScrollHeight > 0) {
        let yVal: int = Math.round(uiContext!.vp2px(listHeight - realScrollHeight)) as int;
        let hVal: int = Math.round(uiContext!.vp2px(realScrollHeight)) as int;
        let wVal: int = Math.round(uiContext!.vp2px(listWidth)) as int;
        let cropRegion: image.Region = {
          x: 0,
          y: yVal,
          size: {
            height: hVal,
            width: wVal
          } as image.Size
        } as image.Region;
        // Crop roll area
        await pixelMap.crop(cropRegion);
      }
    }

    let area: image.PositionArea = {
      pixels: buffer,
      offset: 0,
      stride: stride,
      region: {
        size: {
          width: 0,
          height: 0
        } as image.Size,
        x: 0,
        y: 0
      }
    } as image.PositionArea;

    try {
      let imgInfo = pixelMap.getImageInfoSync();
      // Region size, read based on region. PositionArea represents the data within the specified area of the image.
      area = {
        pixels: buffer,
        offset: 0,
        stride: stride,
        region: {
          size: {
            width: imgInfo.size.width,
            height: imgInfo.size.height
          } as image.Size,
          x: 0,
          y: 0
        }
      } as image.PositionArea;
      // Write data to a specified area
      pixelMap.readPixelsSync(area);
    } catch (err) {
      let error = err as BusinessError;
      Logger.error(TAG, `getSnapshotArea err, code: ${error.code}, message: ${error.message}`);
    }
    return area;
  }
  // [End get_snapshot_area]

  // [Start merge_image]
  static async mergeImage(areaArray: image.PositionArea[], lastOffsetY: int, listWidth: int,
    listHeight: int): Promise<image.PixelMap> {
    // 创建一个长截图位图对象
    let wVal: int = Math.round(uiContext!.vp2px(listWidth)) as int;
    let hVal: int = Math.round(uiContext!.vp2px(lastOffsetY + listHeight)) as int;
    let opts: image.InitializationOptions = {
      editable: true,
      pixelFormat: image.PixelMapFormat.RGBA_8888,
      size: {
        width: wVal,
        height: hVal
      } as image.Size
    } as image.InitializationOptions;
    let longPixelMap = image.createPixelMapSync(opts);
    let imgPosition: int = 0;

    for (let i = 0; i < areaArray.length; i++) {
      let readArea = areaArray[i];
      let area: image.PositionArea = {
        pixels: readArea.pixels,
        offset: 0,
        stride: readArea.stride,
        region: {
          size: {
            width: readArea.region.size.width,
            height: readArea.region.size.height
          } as image.Size,
          x: 0,
          y: imgPosition
        }
      } as image.PositionArea;
      imgPosition += readArea.region.size.height;
      try {
        longPixelMap.writePixelsSync(area);
      } catch (err) {
        let error = err as BusinessError;
        Logger.error(TAG, `writePixelsSync err, code: ${error.code}, message: ${error.message}`);
      }
    }
    return longPixelMap;
  }

  // [End merge_image]
}
