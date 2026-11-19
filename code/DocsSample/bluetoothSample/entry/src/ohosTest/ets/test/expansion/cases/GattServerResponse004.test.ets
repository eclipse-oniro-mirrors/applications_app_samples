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
 * @tc.number BT_SERVER_004
 * @tc.name EXP_BT_SERVER_004
 * @tc.desc Real GATT server with module-before-import external SDK bootstrap; actual registered request callback produces exact responses and error boundaries. Scenario BT_SERVER_004: {"registerServer":true,"throwAt":"on"}
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
      sdk.throwAt = 'server.on connectionStateChange';
      manager.registerServer();
      expect(JSON.stringify(sdk.calls)).assertEqual(
        '["server.on connectionStateChange","server.addService","prompt.showToast"]'
      );
      expect(sdk.toasts[0].message).assertEqual('registerServer success');
      expect(sdk.services.length).assertEqual(1);
      expect(sdk.services[0].serviceUuid).assertEqual('00001810-0000-1000-8000-00805F9B34FB');
      expect(sdk.services[0].isPrimary).assertEqual(true);
      expect(sdk.services[0].characteristics.length).assertEqual(1);
      const char = sdk.services[0].characteristics[0];
      expect(char.serviceUuid).assertEqual('00001810-0000-1000-8000-00805F9B34FB');
      expect(char.characteristicUuid).assertEqual('00001820-0000-1000-8000-00805F9B34FB');
      expect(Array.from(new Uint8Array(char.characteristicValue)).join(',')).assertEqual('21,22');
      expect(char.descriptors.length).assertEqual(2);
      expect(char.descriptors[0].descriptorUuid).assertEqual('00002902-0000-1000-8000-00805F9B34FB');
      expect(char.descriptors[1].descriptorUuid).assertEqual('00002903-0000-1000-8000-00805F9B34FB');
      expect(Array.from(new Uint8Array(char.descriptors[0].descriptorValue)).join(',')).assertEqual('0,0');
      expect(Array.from(new Uint8Array(char.descriptors[1].descriptorValue)).join(',')).assertEqual('31,32');
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
