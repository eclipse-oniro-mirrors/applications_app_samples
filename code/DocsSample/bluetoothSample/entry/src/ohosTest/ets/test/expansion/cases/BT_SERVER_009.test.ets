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

import { rethrowCaught } from '../fixtures/SdkInterop';
import { runCleanup } from '../fixtures/Cleanup';
import { expect } from '@ohos/hypium';
import { GattServerManager } from '../fixtures/ServerSubject';
import { ServerSdk } from '../fixtures/ServerSdk';
import { ble } from '@kit.ConnectivityKit';

/**
 * @tc.number BT_SERVER_009
 * @tc.name EXP_BT_SERVER_009
 * @tc.desc Real GATT server with module-before-import external SDK bootstrap; actual registered request callback produces exact responses and error boundaries. Scenario BT_SERVER_009: {"method":"onDescriptorRead","event":{"deviceId":"peer-A","transId":17,"offset":0,"needRsp":true,"value":[9,8]}}
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sdk = new ServerSdk();
    let primaryFailed1: boolean = false;
    try {
      const manager = new GattServerManager();
      expect(manager.gattServer === sdk.server).assertTrue();
      expect(JSON.stringify(sdk.calls)).assertEqual('["ble.createGattServer"]');
      sdk.calls = [];
      manager.onDescriptorRead();
      const request: ble.DescriptorReadRequest = {
        deviceId: 'peer-A',
        transId: 17,
        offset: 0,
        serviceUuid: 'S',
        characteristicUuid: 'C',
        descriptorUuid: 'D'
      };
      sdk.emitDescriptorRead(request);
      expect(JSON.stringify(sdk.calls)).assertEqual('["server.on descriptorRead","server.sendResponse"]');
      expect(sdk.responses.length).assertEqual(1);
      const response = sdk.responses[0];
      expect(response.deviceId).assertEqual('peer-A');
      expect(response.transId).assertEqual(17);
      expect(response.offset).assertEqual(0);
      expect(response.status).assertEqual(0);
      expect(Array.from(new Uint8Array(response.value)).join(',')).assertEqual('31,32');
      expect(sdk.toasts.length).assertEqual(0);
    } catch (primaryError) {
      primaryFailed1 = true;
      rethrowCaught(primaryError);
    } finally {
      runCleanup((): void => {
        sdk.dispose();
      }, primaryFailed1);
    }
  };

export default runExpansionCase;
