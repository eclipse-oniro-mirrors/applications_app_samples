'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file or copy of the License.
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@kit.BasicServicesKit';
import hilog from '@ohos.hilog';
import remoteDeviceModel from '../model/RemoteDeviceModel';

class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', 'EntryAbility onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', 'EntryAbility onWindowStageCreate');
    try {
      windowStage.loadContent('pages/Index', (err: BusinessError | null): void => {
        hilog.info(0x0000, 'testTag', 'loadContent entering');
        if (err) {
          hilog.error(0x0000, 'testTag', 'loadContent error: ' + JSON.stringify(err));
          return;
        }
        hilog.info(0x0000, 'testTag', 'loadContent ok');
      });
    } catch (e) {
      hilog.error(0x0000, 'testTag', 'loadContent catch error：-----------' + JSON.stringify(e));
    }
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag', 'EntryAbility onDestroy');
    remoteDeviceModel.unregisterDeviceListCallback();
    return undefined;
  }
}