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
import { BluetoothSdk } from '../fixtures/BluetoothSdk';
import { BleScanManager } from '../../../../../main/ets/bluetoothService/BluetoothScan';
import { ble, access } from '@kit.ConnectivityKit';
import { promptAction } from '@kit.ArkUI';


/**
 * @tc.number BT_SCAN_ERRORS_004
 * @tc.name EXP_BT_SCAN_ERRORS_004
 * @tc.desc Controlled synchronous external error takes the real scan catch branch and prevents later SDK calls. Scenario BT_SCAN_ERRORS_004: {"method":"stopScan","externalThrowStage":"ble.stopBLEScan","error":{"code":123,"message":"controlled"}}
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sdk = new BluetoothSdk();
    let primaryFailed1: boolean = false;
    try {
      const manager = new BleScanManager();
      sdk.throwAt = 'ble.stopBLEScan';
      manager.stopScan();
      expect(JSON.stringify(sdk.calls)).assertEqual('["ble.off","ble.stopBLEScan","prompt.showToast"]');
      expect(sdk.toasts.length).assertEqual(1);
      expect(sdk.toasts[0].message).assertEqual('stopBleScan fail');
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
