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

import { expect } from '@ohos/hypium';
import { constant } from '@kit.ConnectivityKit';
import { GattClientManager } from '../../../../../main/ets/bluetoothService/GattClientManager';

/**
 * @tc.number BT_CLIENT_STOP_001
 * @tc.name EXP_BT_CLIENT_STOP_001
 * @tc.desc Missing GATT client guards stopConnect even in connected state and preserves all public state.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const manager = new GattClientManager();
    manager.connectState = constant.ProfileConnectionState.STATE_CONNECTED;
    const originalToastReport = manager.toastReport;

    expect(manager.gattClient).assertUndefined();
    expect(manager.connectState).assertEqual(2);

    // No client is created: the real method must return before device operations or ToastReport.
    manager.stopConnect();

    expect(manager.connectState).assertEqual(2);
    expect(manager.gattClient).assertUndefined();
    expect(manager.device).assertUndefined();
    expect(manager.myServiceUuid).assertEqual('00001810-0000-1000-8000-00805F9B34FB');
    expect(manager.myCharacteristicUuid).assertEqual('00001820-0000-1000-8000-00805F9B34FB');
    expect(manager.myDescriptorUuid).assertEqual('00002902-0000-1000-8000-00805F9B34FB');
    expect(manager.myCharacteristicValue).assertEqual('');
    expect(manager.myDescriptorValue).assertEqual('');
    expect(manager.serviceResult).assertEqual('');
    expect(manager.found).assertFalse();
    expect(manager.toastReport).assertEqual(originalToastReport);
  };

export default runExpansionCase;
