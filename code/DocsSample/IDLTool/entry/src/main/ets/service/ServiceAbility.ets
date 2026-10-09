/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start idl_ts_service_ability]
import { Want } from '@kit.AbilityKit';
import { rpc } from '@kit.IPCKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import IdlTestImp from '../IIdlTestServiceTs/IdlTestImp';

const DOMAIN = 0x0000;
const TAG = 'ServiceAbility';

class ServiceAbility {
  onStart(want: Want): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'ServiceAbility onStart');
  }
  onStop(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'ServiceAbility onStop');
  }
  onCommand(want: Want, restart: boolean, startId: number): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'ServiceAbility onCommand');
  }
  onConnect(want: Want): rpc.RemoteObject {
    hilog.info(DOMAIN, TAG, '%{public}s', 'ServiceAbility onConnect');
    try {
      hilog.info(DOMAIN, TAG, 'ServiceAbility want type: %{public}s', typeof(want));
      hilog.info(DOMAIN, TAG, 'ServiceAbility want: %{public}s', JSON.stringify(want));
      hilog.info(DOMAIN, TAG, 'ServiceAbility want name: %{public}s', want.bundleName);
    } catch(err) {
      hilog.error(DOMAIN, TAG, 'ServiceAbility error: %{public}s', JSON.stringify(err));
    }
    hilog.info(DOMAIN, TAG, '%{public}s', 'ServiceAbility onConnect end');
    return new IdlTestImp('connect') as rpc.RemoteObject;
  }
  onDisconnect(want: Want): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'ServiceAbility onDisconnect');
    try {
      hilog.info(DOMAIN, TAG, 'ServiceAbility want: %{public}s', JSON.stringify(want));
    } catch(err) {
      hilog.error(DOMAIN, TAG, 'ServiceAbility error: %{public}s', JSON.stringify(err));
    }
  }
}

export default new ServiceAbility();
// [End idl_ts_service_ability]
