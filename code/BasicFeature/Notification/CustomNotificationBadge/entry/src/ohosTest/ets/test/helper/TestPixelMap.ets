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

const PIXEL_WIDTH: number = 1;
const PIXEL_HEIGHT: number = 1;
const RGBA_BYTE_SIZE: number = 4;

/**
 * 构造 width x height 的 RGBA PixelMap。
 * 不依赖任何图片资源解码，保证图片类通知内容的用例在任意设备上结果一致。
 */
export function createTestPixelMapSized(width: number, height: number): image.PixelMap {
    let buffer: ArrayBuffer = new ArrayBuffer(width * height * RGBA_BYTE_SIZE);
    let options: image.InitializationOptions = {
        size: { width: width, height: height },
        srcPixelFormat: image.PixelMapFormat.RGBA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888
    };
    return image.createPixelMapSync(buffer, options);
}

/**
 * 构造 1x1 的 RGBA PixelMap。
 */
export function createTestPixelMap(): image.PixelMap {
    return createTestPixelMapSized(PIXEL_WIDTH, PIXEL_HEIGHT);
}

/**
 * 构造 count 个重复字符的字符串，用于长度/边界类输入。
 */
export function buildRepeatedText(count: number): string {
    let result: string = '';
    for (let i = 0; i < count; i++) {
        result += 'L';
    }
    return result;
}
