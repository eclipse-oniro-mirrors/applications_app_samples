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
 * @tc.number BT_CLIENT_CONNECT_003
 * @tc.name EXP_BT_CLIENT_CONNECT_003
 * @tc.desc Reject a connection request in state 2 without creating a client or assigning a device.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const manager = new GattClientManager();
    manager.connectState = constant.ProfileConnectionState.STATE_CONNECTED;
    expect(manager.connectState).assertEqual(2);
    expect(manager.device).assertUndefined();
    expect(manager.gattClient).assertUndefined();

    // The real non-disconnected-state guard returns before any Bluetooth device operation.
    manager.startConnect('A');

    expect(manager.connectState).assertEqual(2);
    expect(manager.device).assertUndefined();
    expect(manager.gattClient).assertUndefined();
  };

export default runExpansionCase;
