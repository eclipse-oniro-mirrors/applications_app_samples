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

// [Start main_page]
import {
  ComponentContent,
  PopupCommonOptions
} from '@kit.ArkUI';
import { PromptAction, TargetInfo } from '@ohos.arkui.UIContext';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: int = 0xFF00;

export class PromptActionClass {
  private promptAction: PromptAction | null = null;
  private contentNode: ComponentContent<Object> | null = null;
  private options: PopupCommonOptions | null = null;
  private target: TargetInfo | null = null;
  private isPartialUpdate: boolean = false;

  public setPromptAction(promptAction: PromptAction): void {
    this.promptAction = promptAction;
  }

  public setContentNode(node: ComponentContent<Object>): void {
    this.contentNode = node;
  }

  public setTarget(target: TargetInfo): void {
    this.target = target;
  }

  public setOptions(options: PopupCommonOptions): void {
    this.options = options;
  }

  public setIsPartialUpdate(isPartialUpdate: boolean): void {
    this.isPartialUpdate = isPartialUpdate;
  }

  public openPopup(): void {
    if (this.promptAction != null) {
      this.promptAction!.openPopup(this.contentNode as ComponentContent<Object>, this.target as TargetInfo, this.options as PopupCommonOptions)
        .then(() => {
          hilog.info(DOMAIN, 'popupMainPage', 'openPopup success');
        })
        .catch((err) => {
          hilog.error(DOMAIN, 'popupMainPage', 'openPopup error: %{public}s', err);
        });
    }
  }

  public closePopup(): void {
    if (this.promptAction != null) {
      this.promptAction!.closePopup(this.contentNode as ComponentContent<Object>)
        .then(() => {
          hilog.info(DOMAIN, 'popupMainPage', 'closePopup success');
        })
        .catch((err) => {
          hilog.error(DOMAIN, 'popupMainPage', 'closePopup error: %{public}s', err);
        });
    }
  }

  public updatePopup(options: PopupCommonOptions): void {
    if (this.promptAction != null) {
      this.promptAction!.updatePopup(this.contentNode as ComponentContent<Object>, options, this.isPartialUpdate)
        .then(() => {
          hilog.info(DOMAIN, 'popupMainPage', 'updatePopup success');
        })
        .catch((err) => {
          hilog.error(DOMAIN, 'popupMainPage', 'updatePopup error: %{public}s', err);
        });
    }
  }
}

// [End main_page]