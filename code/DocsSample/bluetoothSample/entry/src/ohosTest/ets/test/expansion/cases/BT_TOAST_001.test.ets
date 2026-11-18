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
import { ToastReport } from '../../../../../main/ets/common/ToastReport';
import { ble, access } from '@kit.ConnectivityKit';
import { promptAction } from '@kit.ArkUI';


/**
 * @tc.number BT_TOAST_001
 * @tc.name EXP_BT_TOAST_001
 * @tc.desc Real ToastReport forwards exact message plus duration=2000, default mode and bottom=80 to external promptAction. Scenario BT_TOAST_001: {"showResult":""}
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const sdk = new BluetoothSdk();
    let primaryFailed1: boolean = false;
    try {
      const manager = new ToastReport();
      manager.showResult('');
      expect(sdk.toasts.length).assertEqual(1);
      expect(sdk.toasts[0].message).assertEqual('');
      expect(sdk.toasts[0].duration).assertEqual(2000);
      expect(sdk.toasts[0].showMode).assertEqual(promptAction.ToastShowMode.DEFAULT);
      expect(sdk.toasts[0].bottom).assertEqual(80);
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
