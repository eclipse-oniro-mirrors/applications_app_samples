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

@Observed
export class SubtitleStyleModel {
  public visible: boolean = true;
  public sizeIndex: number = 1;
  public colorIndex: number = 0;
  public backgroundIndex: number = 1;
  public positionIndex: number = 0;

  fontSize(): string {
    const sizes: string[] = ['16fp', '18fp', '22fp'];
    return sizes[this.sizeIndex] ?? sizes[1];
  }

  fontColor(): string {
    const colors: string[] = ['#FFFFFF', '#FFEB3B', '#80DEEA'];
    return colors[this.colorIndex] ?? colors[0];
  }

  backgroundColor(): string {
    const colors: string[] = ['#00000000', '#99000000', '#E6000000'];
    return colors[this.backgroundIndex] ?? colors[1];
  }

  reset(): void {
    this.visible = true;
    this.sizeIndex = 1;
    this.colorIndex = 0;
    this.backgroundIndex = 1;
    this.positionIndex = 0;
  }
}
