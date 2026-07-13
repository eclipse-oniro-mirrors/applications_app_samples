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

// [Start navigation_level_dialog]
import {
  Component,
  Column,
  Row,
  Text,
  Button,
  Blank,
  NavDestination,
  NavPathStack,
  NavPathInfo,
  NavDestinationContext,
  Builder,
  FrameNode,
  UIContext,
  Stack,
  StackOptions,
  Alignment,
  FontWeight
} from '@kit.ArkUI';
import { LevelMode, ImmersiveMode } from '@ohos.promptAction';
import { State } from '@ohos.arkui.stateManagement';

let customDialogId: int = 0;

@Builder
function customDialogBuilder(uiContext: UIContext, stack: NavPathStack | undefined): void {
  Column() {
    Text('Custom dialog Message').fontSize(20).height(100)
    Row() {
      Button('Next').onClick((): void => {
        // 在弹窗内部进行路由跳转。
        if (stack) {
          stack.pushPath(new NavPathInfo('Custom_ROUTE_PREFIX/PageLevelDialogInNavigationPageTwo', undefined))
        }
      })
      Blank().width(50)
      Button('Close').onClick((): void => {
        uiContext.getPromptAction().closeCustomDialog(customDialogId);
      })
    }
  }.padding(20)
}

@Component
export struct PageLevelDialogInNavigation {
  @State info: string = '';
  private stack: NavPathStack | undefined = undefined;
  private uiContext: UIContext = this.getUIContext();
  @State message: string = 'Hello World';

  @Builder
  customDialogComponent(): void {
    customDialogBuilder(this.uiContext, this.stack);
  }

  build(): void {
    NavDestination() {
      Stack({ alignContent: Alignment.Center } as StackOptions) {
        Column() {
          Text(this.message).id('test_text')
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
            .onClick((): void => {
              const node: FrameNode | null = this.getUIContext().getFrameNodeById('test_text') || null;
              this.uiContext.getPromptAction().openCustomDialog({
                builder: (): void => {
                  this.customDialogComponent();
                },
                levelMode: LevelMode.EMBEDDED, // 启用页面级弹出框
                levelUniqueId: node?.getUniqueId(), // 设置页面级弹出框所在页面的任意节点ID
                immersiveMode: ImmersiveMode.EXTEND, // 设置页面级弹出框蒙层的显示模式
              }).then((dialogId: int): void => {
                customDialogId = dialogId;
              })
            })
        }
        .width('100%')
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('PageOne')
    .onReady((ctx: NavDestinationContext): void => {
      this.stack = ctx.pathStack;
    })
  }
}

@Component
export struct PageLevelDialogInNavigationTestTwo {
  @State message: string = 'Back';
  private stack: NavPathStack | undefined = undefined;

  build(): void {
    NavDestination() {
      Stack({ alignContent: Alignment.Center } as StackOptions) {
        Column() {
          Button(this.message)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .onClick((): void => {
              if (this.stack) {
                this.stack!.pop()
              }
            })
        }
        .width('100%')
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('PageTwo')
    .onReady((ctx: NavDestinationContext): void => {
      this.stack = ctx.pathStack;
    })
  }
}
// [End navigation_level_dialog]