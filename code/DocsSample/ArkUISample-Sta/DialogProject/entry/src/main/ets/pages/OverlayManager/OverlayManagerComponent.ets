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

// [Start OverlayManager_Demo]
import {
  Entry,
  Component,
  Column,
  Button,
  NavDestination,
  Builder,
  UIContext,
  ComponentContent,
  wrapBuilder,
  Position,
  Text,
  FontWeight,
  ColumnOptions,
  $r
} from '@kit.ArkUI';
import { OverlayManager } from '@ohos.arkui.UIContext';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { State, StorageLink } from '@ohos.arkui.stateManagement';

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
function builderText(params: Params): void {
  Column() {
    Text(params.text)
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
  }.offset(params.offset)
}

@Entry
@Component
export struct OverlayManagerComponent {
  @State message: string = 'ComponentContent';
  private uiContext: UIContext = this.getUIContext();
  private overlayNode: OverlayManager = this.uiContext.getOverlayManager();
  @StorageLink('contentArray') contentArray: Array<ComponentContent<Params>> = [];
  @StorageLink('componentContentIndex') componentContentIndex: int = 0;
  @StorageLink('arrayIndex') arrayIndex: int = 0;
  @StorageLink('componentOffset') componentOffset: Position = { x: 0, y: 30 };

  build(): void {
    // [StartExclude OverlayManager_Demo]
    NavDestination() {
      // [EndExclude OverlayManager_Demo]
      Column({ space: 10 } as ColumnOptions) {
        Button('Increment componentContentIndex:' + this.componentContentIndex)
          .onClick((): void => {
            ++this.componentContentIndex;
          })
        Button('Decrement componentContentIndex:' + this.componentContentIndex)
          .onClick((): void => {
            --this.componentContentIndex;
          })
        Button('Add ComponentContent:' + this.contentArray.length)
          .onClick((): void => {
            let componentContent: ComponentContent<Params> = new ComponentContent<Params>(
              this.uiContext, wrapBuilder(builderText),
              new Params(this.message + (this.contentArray.length), this.componentOffset)
            )
            this.contentArray.push(componentContent);
            this.overlayNode.addComponentContent(componentContent, this.componentContentIndex);
          })
        Button('Increment arrayIndex:' + this.arrayIndex)
          .onClick((): void => {
            ++this.arrayIndex;
          })
        Button('Decrement arrayIndex:' + this.arrayIndex)
          .onClick((): void => {
            --this.arrayIndex;
          })
        Button('Delete ComponentContent:' + this.arrayIndex)
          .onClick((): void => {
            if (this.arrayIndex >= 0 && this.arrayIndex < this.contentArray.length) {
              let componentContent: Array<ComponentContent<Params>> = this.contentArray.splice(this.arrayIndex, 1);
              this.overlayNode.removeComponentContent(componentContent.pop() as ComponentContent<Params>);
            } else {
              hilog.info(DOMAIN, TAG, '%{public}s', 'arrayIndex error');
            }
          })
        Button('Show ComponentContent:' + this.arrayIndex)
          .onClick((): void => {
            if (this.arrayIndex >= 0 && this.arrayIndex < this.contentArray.length) {
              let componentContent: ComponentContent<Params> = this.contentArray[this.arrayIndex];
              this.overlayNode.showComponentContent(componentContent);
            } else {
              hilog.info(DOMAIN, TAG, '%{public}s', 'arrayIndex error');
            }
          })
        Button('Hide ComponentContent:' + this.arrayIndex)
          .onClick((): void => {
            if (this.arrayIndex >= 0 && this.arrayIndex < this.contentArray.length) {
              let componentContent: ComponentContent<Params> = this.contentArray[this.arrayIndex];
              this.overlayNode.hideComponentContent(componentContent);
            } else {
              hilog.info(DOMAIN, TAG, '%{public}s', 'arrayIndex error');
            }
          })
        Button('Show All ComponentContent')
          .onClick((): void => {
            this.overlayNode.showAllComponentContents();
          })
        Button('Hide All ComponentContent')
          .onClick((): void => {
            this.overlayNode.hideAllComponentContents();
          })

        Button('Go')
          .onClick((): void => {
            this.getUIContext().getRouter().pushUrl({
              url: 'pages/Second'
            })
          })
      }
      .width('100%')
      .height('100%')
      // [StartExclude OverlayManager_Demo]
    }
    .backgroundColor('#f1f2f3')
    // 请将$r('app.string.OverlayManager_component_title')替换为实际资源文件，在本示例中该资源文件的value值为"设置浮层"
    .title($r('app.string.OverlayManager_component_title'))
    // [EndExclude OverlayManager_Demo]
  }
}
// [End OverlayManager_Demo]