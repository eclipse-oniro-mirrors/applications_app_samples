/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Context } from '@kit.AbilityKit';
import { image } from '@kit.ImageKit';

export interface Result<T> {
  errCode: number,
  data: T
}

export interface FormatInfo {
  oeid: string,
  name: string,
  description: string,
  fileExtensions: string[],
  icon: image.PixelMap,
}

export interface CEProxy {
  getName(): string;
  getPath(): string;
  getSnapshotPath(): string;
  getSnapshotUri(): string | undefined;
  getSnapshot(): image.PixelMap | undefined;
  isAlive(): boolean;
  doEdit(): number;
  refresh(): number;
  setOnUpdate(cb: (proxy: CEProxy) => void): void;
  setOnError(cb: (proxy: CEProxy, errCode: number) => void): void;
  destroy(): void;
}

export const queryAll: (locale: string) => Result<FormatInfo[]>;
export const query: (oeid: string, locale: string) => Result<FormatInfo>;
export const createByOEid: (ctx: Context, oeid: string, sandboxPath: string) => Result<CEProxy>;
export const createFromLocal: (ctx: Context, srcPath: string, sandboxPath: string, fileUri: string, isLinking?: boolean) => Result<CEProxy>;
export const createDormant: (ctx: Context, name: string, path: string, snapshotPath: string) => Result<CEProxy>;
export const receiveContext: (ctx: Context) => void;