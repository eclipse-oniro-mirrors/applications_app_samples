/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { drawing } from '@kit.ArkGraphics2D';
import { image } from '@kit.ImageKit';

/**
 * Offscreen drawing target: a pixel map plus the canvas bound to it.
 */
export interface OffscreenTarget {
  pixelMap: image.PixelMap;
  canvas: drawing.Canvas;
  width: number;
  height: number;
}

/**
 * Create an editable RGBA_8888 pixel map filled with transparent pixels.
 *
 * @param { number } width - Pixel map width in px.
 * @param { number } height - Pixel map height in px.
 * @returns { Promise<image.PixelMap> } Created pixel map.
 */
export async function createOffscreenPixelMap(width: number, height: number): Promise<image.PixelMap> {
  const bufferSize: number = width * height * 4;
  const color: ArrayBuffer = new ArrayBuffer(bufferSize);
  const size: image.Size = { width: width, height: height };
  const options: image.InitializationOptions = {
    editable: true,
    pixelFormat: image.PixelMapFormat.RGBA_8888,
    size: size
  };
  const pixelMap: image.PixelMap = await image.createPixelMap(color, options);
  return pixelMap;
}

/**
 * Create an offscreen canvas bound to a newly created pixel map.
 *
 * @param { number } width - Canvas width in px.
 * @param { number } height - Canvas height in px.
 * @returns { Promise<drawing.Canvas> } Canvas that draws into the pixel map.
 */
export async function createOffscreenCanvas(width: number, height: number): Promise<drawing.Canvas> {
  const pixelMap: image.PixelMap = await createOffscreenPixelMap(width, height);
  const canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
  return canvas;
}

/**
 * Create an offscreen canvas together with its pixel map, so the caller can display it.
 *
 * @param { number } width - Canvas width in px.
 * @param { number } height - Canvas height in px.
 * @returns { Promise<OffscreenTarget> } Canvas, pixel map and size.
 */
export async function createOffscreenTarget(width: number, height: number): Promise<OffscreenTarget> {
  const pixelMap: image.PixelMap = await createOffscreenPixelMap(width, height);
  const target: OffscreenTarget = {
    pixelMap: pixelMap,
    canvas: new drawing.Canvas(pixelMap),
    width: width,
    height: height
  };
  return target;
}
