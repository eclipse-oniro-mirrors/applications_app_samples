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

// PromptActionClass.ts
// [Start open_close_update_custom_dialog]
import { ComponentContent, UIContext, promptAction } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0x0000;

export class PromptActionClass {
  static ctx: UIContext;
  static contentNode: ComponentContent<Object>;
  static options: promptAction.BaseDialogOptions;

  static setContext(context: UIContext): void {
    PromptActionClass.ctx = context;
  }

  static setContentNode(node: ComponentContent<Object>): void {
    PromptActionClass.contentNode = node;
  }

  static setOptions(options: promptAction.BaseDialogOptions): void {
    PromptActionClass.options = options;
  }

  // [Start call_open_custom_dialog]
  static openDialog(): void {
    if (PromptActionClass.contentNode !== null) {
      PromptActionClass.ctx.getPromptAction().openCustomDialog(PromptActionClass.contentNode, PromptActionClass.options)
        .then(() => {
          hilog.info(DOMAIN, 'testTag', 'OpenCustomDialog complete.');
        })
        .catch((error) => {
          hilog.error(DOMAIN, 'testTag', 'OpenCustomDialog args error: %{public}s', error);
        })
    }
  }
  // [End call_open_custom_dialog]

  // [Start call_close_custom_dialog]
  static closeDialog(): void {
    if (PromptActionClass.contentNode !== null) {
      PromptActionClass.ctx.getPromptAction().closeCustomDialog(PromptActionClass.contentNode)
        .then(() => {
          hilog.info(DOMAIN, 'testTag', 'CloseCustomDialog complete.');
        })
        .catch((error) => {
          hilog.error(DOMAIN, 'testTag', 'CloseCustomDialog args error: %{public}s', error);
        })
    }
  }
  // [End call_close_custom_dialog]

  // [Start update_custom_dialog_property]
  static updateDialog(options: promptAction.BaseDialogOptions): void {
    if (PromptActionClass.contentNode !== null) {
      PromptActionClass.ctx.getPromptAction().updateCustomDialog(PromptActionClass.contentNode, options)
        .then(() => {
          hilog.info(DOMAIN, 'testTag', 'UpdateCustomDialog complete.');
        })
        .catch((error) => {
          hilog.error(DOMAIN, 'testTag', 'UpdateCustomDialog args error: %{public}s', error);
        })
    }
  }
  // [End update_custom_dialog_property]
}
// [End open_close_update_custom_dialog]