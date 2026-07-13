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

// [Start open_popup_main]
import {
  Entry,
  Component,
  Column,
  Button,
  Text,
  NavDestination,
  Builder,
  FrameNode,
  UIContext,
  ComponentContent,
  wrapBuilder,
  PopupCommonOptions
} from '@kit.ArkUI';
import { PromptAction } from '@ohos.arkui.UIContext';
import { State } from '@ohos.arkui.stateManagement';
import { PromptActionClass } from './PopupMainPage';

const ID: int = 0;

export class Params {
  public text: string = '';
  public promptActionClass: PromptActionClass = new PromptActionClass();

  constructor(text: string, promptActionClass: PromptActionClass) {
    this.text = text;
    this.promptActionClass = promptActionClass;
  }
}

@Builder
function buildText(params: Params): void {
  Column() {
    Text(params.text)
      .fontSize(20)
      .margin({ top: 10 })
    Button('Update')
      .margin({ top: 10 })
      .width(100)
      .onClick((): void => {
        params.promptActionClass.updatePopup({
          enableArrow: false,
        });
      })
    Button('Close')
      .margin({ top: 10 })
      .width(100)
      .onClick((): void => {
        params.promptActionClass.closePopup();
      })
  }.width(130).height(150)
}

@Entry
@Component
export struct OpenPopup {
  @State message: string = 'hello';
  private uiContext: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.uiContext.getPromptAction();
  private promptActionClass: PromptActionClass = new PromptActionClass();
  private targetId: int = ID;
  // [Start content_node]
  private contentNode: ComponentContent<Params> =
    new ComponentContent<Params>(this.uiContext, wrapBuilder(buildText), new Params(this.message, this.promptActionClass));
  // [End content_node]
  // [Start private_options]
  private options: PopupCommonOptions = { enableArrow: true };

  // [End private_options]

  build(): void {
    NavDestination() {
      Column() {
        Button('openPopup')
          .margin({ top: 50, left: 100 })
          .onClick((): void => {
            // [Start frame_node]
            let frameNode: FrameNode | null = this.uiContext.getFrameNodeByUniqueId(this.getUniqueId());
            let targetId: int = frameNode?.getChild(0)?.getUniqueId() as int;
            // [End frame_node]
            if (targetId == undefined) {
              this.targetId = 0;
            } else {
              this.targetId = targetId;
            }
            this.promptActionClass.setPromptAction(this.promptAction);
            this.promptActionClass.setContentNode(this.contentNode as ComponentContent<Object>);
            this.promptActionClass.setOptions(this.options);
            this.promptActionClass.setIsPartialUpdate(false);
            this.promptActionClass.setTarget({ id: this.targetId });
            this.promptActionClass.openPopup();
          })
      }
    }
  }
}

// [End open_popup_main]