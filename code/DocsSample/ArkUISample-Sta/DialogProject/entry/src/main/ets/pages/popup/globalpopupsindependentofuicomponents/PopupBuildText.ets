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
  Text,
  NavDestination,
  Builder,
  FrameNode,
  UIContext,
  ComponentContent,
  wrapBuilder,
  Color,
  FontWeight,
  BlurStyle,
  BarStyle,
  AppStorage,
  $r
} from '@kit.ArkUI';
import { PromptAction } from '@ohos.arkui.UIContext';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Popup,
  PopupIconOptions,
  PopupTextOptions,
  PopupButtonOptions } from '@ohos.arkui.advanced.Popup'
const DOMAIN: int = 0xFF00;

export class Params {
  private text: string = '';

  constructor(text: string) {
    this.text = text;
  }
}

let message: Params = new Params('hello');
let uiContext: UIContext = AppStorage.get<UIContext>('UIContext') as UIContext;

// [Start build_text]
@Builder
export function buildText(params: Params): void {
  Popup({
    // 类型设置图标内容。
    icon: {
      // 请将$r('app.media.app_icon')替换为实际资源文件
      image: $r('app.media.app_icon'),
      width: 32,
      height: 32,
      fillColor: Color.White,
      borderRadius: 10
    } as PopupIconOptions,
    // 设置文字内容。
    title: {
      text: `This is a Popup title 1`,
      fontSize: 20,
      fontColor: Color.Black,
      fontWeight: FontWeight.Normal
    } as PopupTextOptions,
    // 设置文字内容。
    message: {
      text: `This is a Popup message 1`,
      fontSize: 15,
      fontColor: Color.Black
    } as PopupTextOptions,
    // 设置按钮内容。
    buttons: [{
      text: 'confirm',
      action: (): void => {
        hilog.info(DOMAIN, 'popupBuildText', 'confirm button click');
      },
      fontSize: 15,
      fontColor: Color.Black,
    },
      {
        text: 'cancel',
        action: (): void => {
          hilog.info(DOMAIN, 'popupBuildText', 'cancel button click');
        },
        fontSize: 15,
        fontColor: Color.Black
      },] as [PopupButtonOptions | undefined, PopupButtonOptions | undefined]
  });
}

let contentNode: ComponentContent<Params> =
  new ComponentContent<Params>(uiContext, wrapBuilder(buildText), message);

// [End build_text]

@Entry
@Component
struct BuildTextExample {
  promptAction: PromptAction = this.getUIContext().getPromptAction();
  private contentNode: ComponentContent<Object> | null = null;
  private uiContext: UIContext = this.getUIContext();

  public openPopup(): void {
    let frameNode: FrameNode | null = this.uiContext.getFrameNodeByUniqueId(this.getUniqueId());
    let targetId: int = frameNode?.getChild(0)?.getUniqueId() as int;
    // [Start open_popup]
    this.promptAction.openPopup(this.contentNode as ComponentContent<Object>, { id: targetId }, {
      enableArrow: true
    })
      .then(() => {
        hilog.info(DOMAIN, 'popupBuildText', 'openPopup success');
      })
      .catch((err) => {
        hilog.error(DOMAIN, 'popupBuildText', 'openPopup error: %{public}s', err);
      });
    // [End open_popup]
  }

  public updatePopup(): void {
    // [Start update_popup]
    this.promptAction.updatePopup(this.contentNode as ComponentContent<Object>, {
      enableArrow: false
    }, true)
      .then(() => {
        hilog.info(DOMAIN, 'popupBuildText', 'updatePopup success');
      })
      .catch((err) => {
        hilog.error(DOMAIN, 'popupBuildText', 'updatePopup error: %{public}s', err);
      });
    // [End update_popup]
  }

  public closePopup(): void {
    // [Start close_popup]
    this.promptAction.closePopup(this.contentNode as ComponentContent<Object>)
      .then(() => {
        hilog.info(DOMAIN, 'popupBuildText', 'closePopup success');
      })
      .catch((err) => {
        hilog.error(DOMAIN, 'popupBuildText', 'closePopup error: %{public}s', err);
      });
    // [End close_popup]
  }

  build(): void {
    NavDestination() {
    }
    .backgroundColor('#f1f3f5')
    .title('', {
      backgroundBlurStyle: BlurStyle.COMPONENT_THICK,
      barStyle: BarStyle.STACK
    })
    // 请将$r('app.string.popup')替换为实际资源文件，在本示例中该资源文件的value值为"气泡提示"
    .title($r('app.string.popup'))
  }
}