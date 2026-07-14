/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

interface ToolBarItemType {
  id: string;
  label: string;
  iconActive: Resource;
  iconInactive?: Resource;
  iconActiveColors: ResourceColor[];
  iconInActiveColors: ResourceColor[];
  isActive: boolean;
  onClick?: (isActive: boolean) => void;
}

@Observed
export class ToolBarItem {
  @Track public id: string;
  @Track public label: string;
  @Track public iconActive: Resource;
  @Track public iconInactive?: Resource;
  @Track public iconActiveColors?: ResourceColor[];
  @Track public iconInActiveColors?: ResourceColor[];
  @Track public isActive: boolean;
  public onClick: (isActive: boolean) => void;

  constructor(item: ToolBarItemType) {
    this.id = item.id;
    this.label = item.label;
    this.iconActive = item.iconActive;
    this.iconInactive = item.iconInactive;
    this.iconActiveColors = item.iconActiveColors;
    this.iconInActiveColors = item.iconInActiveColors;
    this.isActive = item.isActive ?? false;
    this.onClick = item.onClick ?? ((isActive: boolean = false) => {
    });
  }
}

@Component
export struct CustomToolBarItem {
  @ObjectLink toolBarItem: ToolBarItem;

  build() {
    Column() {
      Row() {
        SymbolGlyph(this.toolBarItem.iconInactive && !this.toolBarItem.isActive ?
          this.toolBarItem.iconInactive :
          this.toolBarItem.iconActive)
          .fontSize(24)
          .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR)
          .fontColor(
            this.toolBarItem.isActive ?
              this.toolBarItem.iconActiveColors :
              this.toolBarItem.iconInActiveColors
          )
      }
      .width(24)
      .height(24)
      .margin({ bottom: 4 })

      Text(this.toolBarItem.label)
        .fontColor(Color.White)
        .fontSize(10)
    }
    .layoutWeight(1)
    .height('100%')
    .padding(8)
    .onClick(() => {
      this.toolBarItem.isActive = !this.toolBarItem.isActive;
      this.toolBarItem.onClick(this.toolBarItem.isActive);
    })
  }
}