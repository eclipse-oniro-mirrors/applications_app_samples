/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [open_ukey_auth_dialog_ets]
import { certificateManagerDialog } from '@kit.DeviceCertificateKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';

@Entry
@Component
struct UkeyAuthDialogPage {
  private context: common.Context = getContext(this) as common.Context;
  /* keyUri为证书凭据的唯一标识符，在第一步中已记录了keyUri，此处仅为示例 */
  private keyUri: string = 'testKeyAlias';

  build() {
    Column() {
      Button($r('app.string.open_ukey_auth_dialog'))
        .onClick(() => {
          this.openUkeyAuthDialog();
        })
    }
    .width('100%')
    .height('100%')
  }

  private openUkeyAuthDialog(): void {
    let ukeyAuthRequest: certificateManagerDialog.UkeyAuthRequest = { keyUri: this.keyUri };
    try {
      certificateManagerDialog.openUkeyAuthDialog(this.context, ukeyAuthRequest)
        .then(() => {
          console.info('Succeeded in opening ukey authorization dialog.');
        }).catch((err: BusinessError) => {
          console.error(`Failed to open ukey authorization dialog. Code: ${err.code}, message: ${err.message}`);
        });
    } catch (err) {
      let error = err as BusinessError;
      console.error(`Failed to open ukey authorization dialog. Code: ${error.code}, message: ${error.message}`);
    }
  }
}
// [open_ukey_auth_dialog_ets]
