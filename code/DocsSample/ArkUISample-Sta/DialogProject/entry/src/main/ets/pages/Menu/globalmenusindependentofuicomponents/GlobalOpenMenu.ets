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
  Button,
  NavDestination,
  Builder,
  FrameNode,
  UIContext,
  ComponentContent,
  wrapBuilder,
  Color,
  FontWeight,
  Placement,
  AppStorage,
  MenuOptions,
  $r
} from '@kit.ArkUI';
import { PromptAction } from '@ohos.arkui.UIContext';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Popup,
  PopupIconOptions,
  PopupTextOptions,
  PopupButtonOptions } from '@ohos.arkui.advanced.Popup'

const TAG: string = '[Sample_dialogproject]';
const DOMAIN: int = 0xFF00;

export class Params {
  public message: string = '';

  constructor(message: string) {
    this.message = message;
  }
}

let message: Params = new Params('hello');
let uiContext: UIContext = AppStorage.get<UIContext>('UIContext') as UIContext;

// [Start build_text]
@Builder
export function buildText(params: Params): void {
  Popup({
    // 类型设置图标内容
    icon: {
      // 请将$r('app.media.app_icon')替换为实际资源文件
      image: $r('app.media.app_icon'),
      width: 32,
      height: 32,
      fillColor: Color.White,
      borderRadius: 10
    } as PopupIconOptions,
    // 设置文字内容
    title: {
      text: `This is a Popup title 1`,
      fontSize: 20,
      fontColor: Color.Black,
      fontWeight: FontWeight.Normal
    } as PopupTextOptions,
    // 设置文字内容
    message: {
      text: `This is a Popup message 1`,
      fontSize: 15,
      fontColor: Color.Black
    } as PopupTextOptions,
    // 设置按钮内容
    buttons: [{
      text: 'confirm',
      action: (): void => {
        hilog.info(DOMAIN, 'globalOpenMenu', 'confirm button click');
      },
      fontSize: 15,
      fontColor: Color.Black,
    },
      {
        text: 'cancel',
        action: (): void => {
          hilog.info(DOMAIN, 'globalOpenMenu', 'cancel button click');
        },
        fontSize: 15,
        fontColor: Color.Black
      },] as [PopupButtonOptions | undefined, PopupButtonOptions | undefined]
  })
}

let contentNode: ComponentContent<Params> =
  new ComponentContent<Params>(uiContext, wrapBuilder(buildText), message);

// [End build_text]

@Entry
@Component
export struct OpenPopup {
  message: Params = new Params('hello');
  private uiContext: UIContext = this.getUIContext();
  public promptAction: PromptAction = this.uiContext.getPromptAction();
  // [Start content_node]
  private contentNode: ComponentContent<Params> =
    new ComponentContent<Params>(this.getUIContext(), wrapBuilder(buildText), this.message);
  // [End content_node]
  // [Start menu_options]
  private options: MenuOptions = { enableArrow: true, placement: Placement.Bottom } as MenuOptions;

  // [End menu_options]

  openMenu(): void {
    let frameNode: FrameNode | null = this.uiContext.getFrameNodeByUniqueId(this.getUniqueId());
    let targetId: int = frameNode?.getChild(0)?.getUniqueId() as int;
    // [Start open_menu]
    this.getUIContext().getPromptAction()
      .openMenu(this.contentNode, { id: targetId }, {
        enableArrow: true
      })
      .then(() => {
        hilog.info(DOMAIN, 'globalOpenMenu', 'openMenu success');
      })
      .catch((err) => {
        hilog.error(DOMAIN, 'globalOpenMenu', 'openMenu error: %{public}s', err);
      });
    // [End open_menu]
  }

  updateMenu(): void {
    // [Start update_menu]
    this.getUIContext().getPromptAction()
      .updateMenu(this.contentNode, {
        enableArrow: false
      }, true)
      .then(() => {
        hilog.info(DOMAIN, 'globalOpenMenu', 'updateMenu success');
      })
      .catch((err) => {
        hilog.error(DOMAIN, 'globalOpenMenu', 'updateMenu error: %{public}s', err);
      });
    // [End update_menu]
  }

  closeMenu(): void {
    // [Start close_menu]
    this.getUIContext().getPromptAction()
      .closeMenu(this.contentNode)
      .then(() => {
        hilog.info(DOMAIN, 'globalOpenMenu', 'closeMenu success');
      })
      .catch((err) => {
        hilog.error(DOMAIN, 'globalOpenMenu', 'closeMenu error: %{public}s', err);
      });
    // [End close_menu]
  }

  build(): void {
    NavDestination() {
      Column() {
        Button('openMenu')
          .margin({ top: 50, left: 100 })
          .onClick((): void => {
            // [Start frame_node]
            let frameNode: FrameNode | null = this.getUIContext().getFrameNodeByUniqueId(this.getUniqueId());
            let targetId: int = frameNode?.getChild(0)?.getUniqueId() as int;
            // [End frame_node]
            this.openMenu();
          })
      }
    }
  }
}