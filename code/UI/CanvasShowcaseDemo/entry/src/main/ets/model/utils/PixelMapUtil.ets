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
import { LogUtil } from './LogUtil';

export class PixelMapUtil {
  /** RGBA_8888 像素值打包：r/g/b/a 均为 0-255，返回无符号 32 位整数 */
  static rgba(r: number, g: number, b: number, a: number): number {
    return (((r & 0xFF) << 24) | ((g & 0xFF) << 16) | ((b & 0xFF) << 8) | (a & 0xFF)) >>> 0;
  }

  /** 棋盘格：cell 为每格边长（像素） */
  static createCheckerboard(size: number, cell: number, colorA: number, colorB: number): image.PixelMap {
    const colors: number[] = [];
    for (let y = 0; y < size; y++) {
      for (let x = 0; x < size; x++) {
        const useA: boolean = Math.floor(x / cell) % 2 === Math.floor(y / cell) % 2;
        colors.push(useA ? colorA : colorB);
      }
    }
    return PixelMapUtil.create(size, size, colors, 'checkerboard');
  }

  /** 45° 斜纹：stripe 为条纹周期（像素） */
  static createStripes(size: number, stripe: number, colorA: number, colorB: number): image.PixelMap {
    const colors: number[] = [];
    for (let y = 0; y < size; y++) {
      for (let x = 0; x < size; x++) {
        const useA: boolean = Math.floor((x + y) / stripe) % 2 === 0;
        colors.push(useA ? colorA : colorB);
      }
    }
    return PixelMapUtil.create(size, size, colors, 'stripes');
  }

  /** 圆点阵：radius 为圆点半径（像素），圆心在图案中心 */
  static createDots(size: number, radius: number, colorA: number, colorB: number): image.PixelMap {
    const colors: number[] = [];
    const cx: number = (size - 1) / 2;
    const cy: number = (size - 1) / 2;
    for (let y = 0; y < size; y++) {
      for (let x = 0; x < size; x++) {
        const dist: number = Math.sqrt((x - cx) * (x - cx) + (y - cy) * (y - cy));
        colors.push(dist <= radius ? colorA : colorB);
      }
    }
    return PixelMapUtil.create(size, size, colors, 'dots');
  }

  /** 通用像素生成器：pixelFn(x, y) 返回 RGBA_8888 像素值，自定义图案入口 */
  static generate(size: number, pixelFn: (x: number, y: number) => number, tag: string): image.PixelMap {
    const colors: number[] = [];
    for (let y = 0; y < size; y++) {
      for (let x = 0; x < size; x++) {
        colors.push(pixelFn(x, y));
      }
    }
    return PixelMapUtil.create(size, size, colors, tag);
  }

  /** 创建 PixelMap（RGBA_8888 字节流 R,G,B,A，同步 API 12+） */
  static create(width: number, height: number, colors: number[], tag: string): image.PixelMap {
    const bytes: Uint8Array = new Uint8Array(width * height * 4);
    for (let i = 0; i < colors.length; i++) {
      const c: number = colors[i];
      bytes[i * 4] = (c >>> 24) & 0xFF;
      bytes[i * 4 + 1] = (c >>> 16) & 0xFF;
      bytes[i * 4 + 2] = (c >>> 8) & 0xFF;
      bytes[i * 4 + 3] = c & 0xFF;
    }
    const opts: image.InitializationOptions = {
      size: { width: width, height: height },
      srcPixelFormat: image.PixelMapFormat.RGBA_8888
    };
    const pm: image.PixelMap = image.createPixelMapSync(bytes.buffer, opts);
    LogUtil.debug('PixelMapUtil', `生成 ${tag} 图案 ${width}x${height}（${colors.length} 像素）`);
    return pm;
  }
}
