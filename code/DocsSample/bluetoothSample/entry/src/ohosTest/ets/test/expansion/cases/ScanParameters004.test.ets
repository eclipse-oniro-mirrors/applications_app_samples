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
 * @tc.number BT_SCAN_PARAM_004
 * @tc.name EXP_BT_SCAN_PARAM_004
 * @tc.desc Real scan parameter conversion reaches the external startBLEScan filter/options without production replacement. Scenario BT_SCAN_PARAM_004: {"setScanParameter":[" 2 ","0x10","x",""],"then":"startScan"}
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sdk = new BluetoothSdk();
    let primaryFailed1: boolean = false;
    try {
      const manager = new BleScanManager();
      manager.setScanParameter(' 2 ','0x10','x','');
      manager.startScan();
      const options = sdk.options;
      expect(options !== undefined).assertTrue();
      if (options === undefined) {
        throw new Error('startBLEScan options missing');
      }
      expect(sdk.filters.length).assertEqual(1);
      expect(options.interval).assertEqual(2);
      expect(sdk.filters[0].manufactureId).assertEqual(16);
      expect(sdk.filters[0].name).assertEqual('x');
      expect(sdk.filters[0].deviceId).assertUndefined();
      expect(Array.from(new Uint8Array(sdk.filters[0].manufactureDataMask as ArrayBuffer)).join(',')).assertEqual(
        '255,255,255,255'
      );
      expect(options.dutyMode).assertEqual(ble.ScanDuty.SCAN_MODE_LOW_POWER);
      expect(options.matchMode).assertEqual(ble.MatchMode.MATCH_MODE_AGGRESSIVE);
      expect(JSON.stringify(sdk.calls)).assertEqual('["ble.on","ble.startBLEScan","prompt.showToast"]');
      expect(sdk.toasts[0].message).assertEqual('startBleScan success');
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
