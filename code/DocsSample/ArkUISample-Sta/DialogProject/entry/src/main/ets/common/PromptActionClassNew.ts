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

// [Start prompt_action_class_new]
// PromptActionClassNew.ets
import { ComponentContent, promptAction, UIContext } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0x0000;

export class PromptActionClassNew {
  static ctx: UIContext;
  static contentNode: ComponentContent<Object>;
  static options: promptAction.BaseDialogOptions;
  static dialogController: promptAction.CommonController = new promptAction.DialogController();

  static setContext(context: UIContext): void {
    PromptActionClassNew.ctx = context;
  }

  static setContentNode(node: ComponentContent<Object>): void {
    PromptActionClassNew.contentNode = node;
  }

  static setOptions(options: promptAction.BaseDialogOptions): void {
    PromptActionClassNew.options = options;
  }

  // 打开弹窗
  static openDialog(): void {
    if (PromptActionClassNew.contentNode !== null) {
      // [Start prompt_action_class_open_custom_dialog]
      PromptActionClassNew.ctx.getPromptAction().openCustomDialogWithController(PromptActionClassNew.contentNode, PromptActionClassNew.dialogController, PromptActionClassNew.options)
        .then(() => {
          hilog.info(DOMAIN, 'testTag', 'OpenCustomDialog complete.');
        })
        .catch((err) => {
          hilog.error(DOMAIN, 'testTag', 'OpenCustomDialog args error: %{public}s', err);
        })
      // [End prompt_action_class_open_custom_dialog]
    }
  }

  // 关闭弹窗
  static closeDialog(): void {
    if (PromptActionClassNew.contentNode !== null) {
      PromptActionClassNew.ctx.getPromptAction().closeCustomDialog(PromptActionClassNew.contentNode)
        .then(() => {
          hilog.info(DOMAIN, 'testTag', 'CloseCustomDialog complete.');
        })
        .catch((err) => {
          hilog.error(DOMAIN, 'testTag', 'CloseCustomDialog args error: %{public}s', err);
        })
    }
  }

  // [StartExclude prompt_action_class_new]
  static closeDialogAndDispose(): void {
    // [Start prompt_action_class_close_custom_dialog]
    PromptActionClassNew.ctx.getPromptAction().closeCustomDialog(PromptActionClassNew.contentNode)
      .then(() => {
        hilog.info(DOMAIN, 'testTag', 'CloseCustomDialog complete.g complete.');
        if (PromptActionClassNew.contentNode !== null) {
          PromptActionClassNew.contentNode.dispose();   // 释放contentNode
        }
      })
      .catch((err) => {
        hilog.error(DOMAIN, 'testTag', 'CloseCustomDialog args error: %{public}s', err);
      })
    // [End prompt_action_class_close_custom_dialog]
  }
  // [EndExclude prompt_action_class_new]

  // 更新弹窗
  static updateDialog(options: promptAction.BaseDialogOptions): void {
    if (PromptActionClassNew.contentNode !== null) {
      // [Start prompt_action_class_update_options]
      PromptActionClassNew.ctx.getPromptAction().updateCustomDialog(PromptActionClassNew.contentNode, options)
        .then(() => {
          hilog.info(DOMAIN, 'testTag', 'UpdateCustomDialog complete.');
        })
        .catch((err) => {
          hilog.error(DOMAIN, 'testTag', 'UpdateCustomDialog args error: %{public}s', err);
        })
      // [End prompt_action_class_update_options]
    }
  }
}
// [End prompt_action_class_new]