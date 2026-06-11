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

// [Start OverlayManager_Demo3]
import {
  ComponentContent,
  wrapBuilder,
  LevelOrder,
  NavDestination,
  Column,
  FontWeight,
  ColumnOptions,
  Row,
  Button,
  Stack,
  StackOptions,
  Text,
  Alignment,
  Position,
  Entry,
  Component,
  Builder,
  $r
} from '@kit.ArkUI';
import { OverlayManager, UIContext } from '@ohos.arkui.UIContext';
import { StorageLink } from '@ohos.arkui.stateManagement';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_dialogproject]';
const DOMAIN: int = 0xFF00;

export class Params {
  public text: string = '';
  public offset: Position;

  constructor(text: string, offset: Position) {
    this.text = text;
    this.offset = offset;
  }
}

@Builder
function builderTopText(params: Params): void {
  Column() {
    Stack({ alignContent: Alignment.Top } as StackOptions) {
      Text(params.text)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
    }
    .width(300)
    .height(200)
    .padding(5)
    .backgroundColor('#F7F7F7')
  }
  .offset(params.offset)
}

@Builder
function builderNormalText(params: Params): void {
  Column() {
    Stack({ alignContent: Alignment.Top } as StackOptions) {
      Text(params.text)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
    }
    .width(300)
    .height(400)
    .padding(5)
    .backgroundColor('#D5D5D5')
  }
  .offset(params.offset)
}

@Entry
@Component
export struct OverlayManagerWithOrder {
  private ctx: UIContext = this.getUIContext();
  private overlayManager: OverlayManager = this.ctx.getOverlayManager();
  @StorageLink('contentArray') contentArray: Array<ComponentContent<Params>> = [];
  @StorageLink('componentContentIndex') componentContentIndex: int = 0;
  @StorageLink('arrayIndex') arrayIndex: int = 0;
  @StorageLink('componentOffset') componentOffset: Position = { x: 0, y: 80 };

  build(): void {
    // [StartExclude OverlayManager_Demo3]
    NavDestination() {
      // [EndExclude OverlayManager_Demo3]
      Row() {
        Column({ space: 5 } as ColumnOptions) {
          Button('Open Top-Level Dialog Box')
            .onClick(() => {
              let componentContent: ComponentContent<Params> = new ComponentContent<Params>(
                this.ctx, wrapBuilder(builderTopText),
                new Params('I am a top-level dialog box', this.componentOffset)
              );
              this.contentArray.push(componentContent);
              this.overlayManager.addComponentContentWithOrder(componentContent, LevelOrder.clamp(100000));
            })
          Button('Open Normal Dialog Box')
            .onClick(() => {
              let componentContent: ComponentContent<Params> = new ComponentContent<Params>(
                this.ctx, wrapBuilder(builderNormalText),
                new Params('I am a normal dialog box', this.componentOffset)
              );
              this.contentArray.push(componentContent);
              this.overlayManager.addComponentContentWithOrder(componentContent, LevelOrder.clamp(0));
            })
          Button('Remove Dialog Box')
            .onClick(() => {
              if (this.arrayIndex >= 0 && this.arrayIndex < this.contentArray.length) {
                let componentContent: Array<ComponentContent<Params>> = this.contentArray.splice(this.arrayIndex, 1);
                this.overlayManager.removeComponentContent(componentContent.pop() as ComponentContent<Params>);
              } else {
                hilog.info(DOMAIN, TAG, 'arrayIndex error');
              }
            })
        }
        .width('100%')
      }
      // [StartExclude OverlayManager_Demo3]
    }
    .backgroundColor('#f1f2f3')
    // 请将$r('app.string.OverlayManager_withOrder_title')替换为实际资源文件，在本示例中该资源文件的value值为"新增指定节点addComponentContentWithOrder"
    .title($r('app.string.OverlayManager_withOrder_title'))
    // [EndExclude OverlayManager_Demo3]
  }
}
// [End OverlayManager_Demo3]