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

import {
  Entry,
  Component,
  Column,
  Row,
  Button,
  NavDestination,
  Builder,
  FrameNode,
  Menu,
  MenuItem,
  UIContext,
  ComponentContent,
  wrapBuilder,
  Placement,
  MenuOptions,
  $r
} from '@kit.ArkUI';
import { PromptAction } from '@ohos.arkui.UIContext';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: int = 0x0000;

@Builder
export function buildText(): void {
  Menu() {
    MenuItem({ startIcon: $r('app.media.app_icon') }).width(32).height(32).borderRadius(10)
    MenuItem({ content: 'This is a Popup title 1' })
    MenuItem({ content: 'This is a Popup title 2' })
    MenuItem({ content: 'confirm' }).onClick((): void => {
      hilog.error(DOMAIN, 'openMenuWithTargetIdString', 'confirm button click');
    })
    MenuItem({ content: 'cancel' }).onClick((): void => {
      hilog.info(DOMAIN, 'openMenuWithTargetIdString', 'cancel button click');
    })
  }
}

@Entry
@Component
export struct OpenMenuWithTargetIdString {
  private uiContext: UIContext = this.getUIContext();
  private promptAction: PromptAction = this.uiContext.getPromptAction();
  private contentNode: ComponentContent<Object> =
    new ComponentContent<Object>(this.getUIContext(), wrapBuilder(buildText));
  private options: MenuOptions = { enableArrow: true, placement: Placement.Bottom } as MenuOptions;
  private targetIdString: string = 'button';
  private componentId: int = 0;

  // [Start openMenuWithTargetIdString]
  build(): void {
    NavDestination() {
      Column() {
        Row() {
          Button('button1')
            .id(this.targetIdString)
        }

        Row() {
          Button('button2')
            .id(this.targetIdString)
        }

        Button('openMenu')
          .onClick((): void => {
            let frameNode: FrameNode | null = this.uiContext.getFrameNodeByUniqueId(this.getUniqueId());
            let componentId: int = frameNode?.getChild(1)?.getChild(0)?.getChild(1)?.getUniqueId() as int;
            if (componentId == undefined) {
              this.componentId = 0;
            } else {
              this.componentId = componentId;
            }
            this.promptAction.openMenu(this.contentNode, { id: this.targetIdString, componentId: this.componentId }, {
              enableArrow: true
            })
              .then(() => {
                hilog.info(DOMAIN, 'openMenuWithTargetIdString', 'openMenu success');
              })
              .catch((err) => {
                hilog.error(DOMAIN, 'openMenuWithTargetIdString', 'openMenu error: %{public}s', err);
              });
          })
      }
    }
  }
  // [End openMenuWithTargetIdString]
}