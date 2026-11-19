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
 * @tc.number BT_CLIENT_CONNECT_004
 * @tc.name EXP_BT_CLIENT_CONNECT_004
 * @tc.desc startConnect rejects peer A while disconnecting without creating a client or changing device/state.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const manager = new GattClientManager();
    expect(manager.connectState).assertEqual(0);
    expect(manager.device).assertUndefined();
    expect(manager.gattClient).assertUndefined();

    manager.connectState = constant.ProfileConnectionState.STATE_DISCONNECTING;
    expect(manager.connectState).assertEqual(3);

    // Real precondition guard: no BLE device operation or ToastReport replacement is needed.
    manager.startConnect('A');

    expect(manager.connectState).assertEqual(3);
    // The catalog's null device expectation denotes the production undefined value.
    expect(manager.device).assertUndefined();
    expect(manager.gattClient).assertUndefined();
  };

export default runExpansionCase;
