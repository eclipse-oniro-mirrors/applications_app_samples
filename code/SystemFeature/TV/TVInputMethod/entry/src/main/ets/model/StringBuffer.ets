/**
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

export class StringBuffer {
  private mSurface: string;

  constructor() {
    this.mSurface = '';
  }

  public clear() {
    this.mSurface.slice(0);
  }

  public delete(start?: number, end?: number) {
    if (start !== undefined && start >= 0 && start <= this.mSurface.length) {
      this.mSurface = this.mSurface.substring(0, start) + (end !== undefined ? this.mSurface.substring(end) : '');
    }
  }

  public insert(pos: number, ch: string) {
    if (pos >= 0 && pos <= this.mSurface.length) {
      this.mSurface = this.mSurface.substring(0, pos) + ch + this.mSurface.substring(pos);
    }
  }

  public replace(from: number, length: number, replace: string) {
    if (from >= 0 && from + length <= this.mSurface.length) {
      this.mSurface = this.mSurface.substring(0, from) + replace + this.mSurface.substring(from + length);
    }
  }

  public charAt(pos: number): string {
    if (pos >= 0 && pos <= this.mSurface.length) {
      return this.mSurface.charAt(pos);
    }
    return '';
  }

  public substring(start: number, end?: number): string {
    return this.mSurface.substring(start, end);
  }

  public substr(from: number, length?: number): string {
    return this.mSurface.substring(from, length);
  }

  public length(): number {
    return this.mSurface.length;
  }

  public buffer(): string {
    return this.mSurface;
  }
}
