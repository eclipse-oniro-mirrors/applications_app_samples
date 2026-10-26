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

import { CommonConstants as Const } from '../../common/CommonConstants';

@Component
export struct PlayerSurface {
  controller: XComponentController = new XComponentController();
  @Prop sourceWidth: number = 0;
  @Prop sourceHeight: number = 0;
  @Prop sourceRotation: number = 0;
  @Prop transformType: number = 0;
  @Prop displayMode: number = 0;
  @State private viewportWidth: number = 0;
  @State private viewportHeight: number = 0;
  onAreaChanged: (oldArea: Area, newArea: Area) => void = (_oldArea: Area, _newArea: Area): void => {};

  private surfaceSize(horizontal: boolean): number | string {
    if (this.displayMode !== 1 || this.sourceWidth <= 0 || this.sourceHeight <= 0 ||
      this.viewportWidth <= 0 || this.viewportHeight <= 0) {
      return '100%';
    }
    const rotation: number = ((this.sourceRotation % 360) + 360) % 360;
    const sourceQuarterTurn: boolean = rotation === 90 || rotation === 270;
    // NativeWindow 的旋转/翻转组合中，以下六种包含一次 90/270 度旋转。
    const transformQuarterTurn: boolean = this.transformType === 1 || this.transformType === 3 ||
      this.transformType === 6 || this.transformType === 7 || this.transformType === 10 ||
      this.transformType === 11;
    const swap: boolean = sourceQuarterTurn !== transformQuarterTurn;
    const imageWidth: number = swap ? this.sourceHeight : this.sourceWidth;
    const imageHeight: number = swap ? this.sourceWidth : this.sourceHeight;
    const factor: number = Math.max(this.viewportWidth / imageWidth, this.viewportHeight / imageHeight);
    return (horizontal ? imageWidth : imageHeight) * factor;
  }

  build() {
    Stack({ alignContent: Alignment.Center }) {
    XComponent({
      id: 'player',
      type: 0,
      libraryname: 'player',
      controller: this.controller
    })
      .height(this.surfaceSize(false))
      .width(this.surfaceSize(true))
    }
    .width(Const.FULL_SIZE)
    .height(Const.FULL_SIZE)
    .clip(true)
    .onAreaChange((oldArea: Area, newArea: Area): void => {
      this.viewportWidth = parseFloat(String(newArea.width));
      this.viewportHeight = parseFloat(String(newArea.height));
      this.onAreaChanged(oldArea, newArea);
    })
  }
}
