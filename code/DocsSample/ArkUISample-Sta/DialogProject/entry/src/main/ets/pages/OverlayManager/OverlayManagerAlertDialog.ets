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

// [Start OverlayManager_Demo2]
import {
  Entry,
  Component,
  Column,
  Stack,
  StackOptions,
  Text,
  TextInput,
  TextInputController,
  NavDestination,
  Builder,
  UIContext,
  ComponentContent,
  wrapBuilder,
  Color,
  Position,
  DialogAlignment,
  AlertDialogParamWithConfirm,
  HitTestMode,
  $r
} from '@kit.ArkUI';
import { OverlayManager } from '@ohos.arkui.UIContext';

export class Params {
  public context: UIContext;
  public offset: Position;

  constructor(context: UIContext, offset: Position) {
    this.context = context;
    this.offset = offset;
  }
}

@Builder
function builderOverlay(params: Params): void {
  Column() {
    Stack() {
    }.width(50).height(50).backgroundColor(Color.Yellow).position(params.offset).borderRadius(50)
    .onClick((): void => {
      params.context.showAlertDialog(
        {
          title: 'title',
          message: 'Text',
          autoCancel: true,
          alignment: DialogAlignment.Center,
          gridCount: 3,
          confirm: {
            value: 'Button',
            action: (): void => {}
          },
          cancel: (): void => {}
        } as AlertDialogParamWithConfirm
      )
    })
  }.focusable(false).width('100%').height('100%').hitTestBehavior(HitTestMode.Transparent)
}

@Entry
@Component
export struct OverlayManagerAlertDialog {
  private uiContext: UIContext = this.getUIContext();
  private overlayNode: OverlayManager = this.uiContext.getOverlayManager();
  private overlayContent: Array<ComponentContent<Params>> = [];
  controller: TextInputController = new TextInputController();

  aboutToAppear(): void {
    let uiContext: UIContext = this.getUIContext();
    let componentContent: ComponentContent<Params> = new ComponentContent<Params>(
      this.uiContext, wrapBuilder(builderOverlay),
      new Params(uiContext, { x: 0, y: 100 })
    );
    this.overlayNode.addComponentContent(componentContent, 0);
    this.overlayContent.push(componentContent);
  }

  aboutToDisappear(): void {
    let componentContent: ComponentContent<Params> = this.overlayContent.pop() as ComponentContent<Params>;
    this.overlayNode.removeComponentContent(componentContent);
  }

  build(): void {
    // [StartExclude OverlayManager_Demo2]
    NavDestination() {
      // [EndExclude OverlayManager_Demo2]
      Column() {

      }
      .width('100%')
      .height('100%')
      // [StartExclude OverlayManager_Demo2]
    }
    .backgroundColor('#f1f2f3')
    // 请将$r('app.string.OverlayManager_alert_title')替换为实际资源文件，在本示例中该资源文件的value值为"弹出alertDialog弹窗"
    .title($r('app.string.OverlayManager_alert_title'));
    // [EndExclude OverlayManager_Demo2]
  }
}
// [End OverlayManager_Demo2]