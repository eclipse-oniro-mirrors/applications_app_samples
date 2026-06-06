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

// [Start creat_symbol_glyph]
import {
  $r,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  NavDestination,
  SymbolGlyph,
  SymbolRenderingStrategy
} from '@kit.ArkUI';
// [StartExclude creat_symbol_glyph]
import { ComponentCard } from '../../common/Card';

@Entry
@Component
export struct CreatSymbolGlyph {
  build(): void {
    NavDestination() {
      Column({ space: 12 } as ColumnOptions) {
        ComponentCard({ title: $r('app.string.CreatSymbolGlyph_title') }) {
          // [EndExclude creat_symbol_glyph]
          SymbolGlyph($r('sys.symbol.ohos_folder_badge_plus'))
            .fontSize(96)
            .renderingStrategy(SymbolRenderingStrategy.SINGLE)
            .fontColor([Color.Black, Color.Green, Color.White])
          // [End creat_symbol_glyph]
        }
      }
      .width('100%')
      .height('100%')
      .padding({ left: 12, right: 12 })
    }
    .backgroundColor('#f1f2f3')
    .title($r('app.string.CreatSymbolGlyph_title'))
  }
}
