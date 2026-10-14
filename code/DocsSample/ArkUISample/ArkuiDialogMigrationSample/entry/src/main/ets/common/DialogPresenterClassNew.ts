/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

// [Start dialog_presenter_class_new]
// DialogPresenterClassNew.ets
import { BusinessError } from '@kit.BasicServicesKit';
import { ComponentContent, dialog, DialogResult, UIContext } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN = 0x0000;

export class DialogPresenterClassNew {
  static ctx: UIContext;
  static contentNode: ComponentContent<Object>;
  static options: dialog.DialogBaseOptions;

  static setContext(context: UIContext) {
    DialogPresenterClassNew.ctx = context;
  }

  static setContentNode(node: ComponentContent<Object>) {
    DialogPresenterClassNew.contentNode = node;
  }

  static setOptions(options: dialog.DialogBaseOptions) {
    DialogPresenterClassNew.options = options;
  }

  // 打开弹窗
  static openDialog() {
    if (DialogPresenterClassNew.contentNode !== null) {
      // [Start dialog_presenter_class_open_custom_dialog]
      DialogPresenterClassNew.ctx.getDialogPresenter()?.present(this.contentNode, DialogPresenterClassNew.options)
        .then((result: DialogResult) => {
          hilog.info(DOMAIN, 'testTag', 'testTag', 'OpenCustomDialog complete.');
        }).catch((error: BusinessError) => {
        let message = (error as BusinessError).message;
        let code = (error as BusinessError).code;
        hilog.error(DOMAIN, 'testTag', 'testTag', `OpenCustomDialog args error code is ${code}, message is ${message}`);
      })
      // [End dialog_presenter_class_open_custom_dialog]
    }
  }

  // 关闭弹窗
  static closeDialog() {
    if (DialogPresenterClassNew.contentNode !== null) {
      DialogPresenterClassNew.ctx.getDialogPresenter()?.dismiss(this.contentNode)
        .then(() => {
          hilog.info(DOMAIN, 'testTag', 'testTag', 'CloseCustomDialog complete.');
        })
        .catch((error: BusinessError) => {
          let message = (error as BusinessError).message;
          let code = (error as BusinessError).code;
          hilog.error(DOMAIN, 'testTag', 'testTag', `CloseCustomDialog args error code is ${code}, message is ${message}`);
        })
    }
  }

  // 更新弹窗
  static updateDialog(options: dialog.DialogBaseOptions) {
    if (DialogPresenterClassNew.contentNode !== null) {
      // [Start dialog_presenter_class_update_options]
      DialogPresenterClassNew.ctx.getDialogPresenter()?.update(this.contentNode, options)
        .then(() => {
          hilog.info(DOMAIN, 'testTag', 'testTag', 'UpdateCustomDialog complete.');
        })
        .catch((error: BusinessError) => {
          let message = (error as BusinessError).message;
          let code = (error as BusinessError).code;
          hilog.error(DOMAIN, 'testTag', 'testTag', `UpdateCustomDialog args error code is ${code}, message is ${message}`);
        })
      // [End dialog_presenter_class_update_options]
    }
  }
}
// [End dialog_presenter_class_new]