'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { GlobalStaticSnapshot, Params } from '../view/GlobalScreenshot';
import { image } from '@kit.ImageKit';
import { Entry, Component, State } from '@kit.ArkUI';
import { Column, Image, Button, ColumnOptions } from '@kit.ArkUI';
import { ImageFit } from '@kit.ArkUI';
import { $r } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  idx: int = 0; // 绱㈠紩鍊硷紝榛樿鍊间负0
  items: Params[] = [];
  @State pixmap: image.PixelMap | undefined = undefined;

  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      this.items.push(new Params(`item${i}`));
    }
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      // 璇峰皢$r('app.media.startIcon')鏇挎崲涓哄疄闄呰祫婧愭枃浠?
      Image(this.pixmap ? this.pixmap : $r('app.media.startIcon')).width(300).height(300).objectFit(ImageFit.Auto);
      Button('click to get snapshot')
        .onClick(async () => {
          this.pixmap = await GlobalStaticSnapshot.getAwardSnapshot(this.getUIContext(), this.items[this.idx]);
          this.idx = (this.idx + 1) % 10;
        });
    }
    .height('100%')
    .width('100%')
  }
}
