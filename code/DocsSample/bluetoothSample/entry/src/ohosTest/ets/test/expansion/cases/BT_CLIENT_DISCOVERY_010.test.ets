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
 * @tc.number BT_CLIENT_DISCOVERY_010
 * @tc.name EXP_BT_CLIENT_DISCOVERY_010
 * @tc.desc A fresh real manager returns from discovery without a client and preserves its exact initial state.
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const manager = new GattClientManager();
    // The catalog's null client denotes the production undefined default, not an injected client.
    expect(manager.gattClient).assertUndefined();
    expect(manager.device).assertUndefined();
    expect(manager.connectState).assertEqual(constant.ProfileConnectionState.STATE_DISCONNECTED);
    expect(manager.found).assertFalse();
    expect(manager.serviceResult).assertEqual('');
    expect(manager.getResult()).assertEqual('');

    await manager.discoverServices();

    // No client can issue getServices; the real public guard must preserve the fresh state.
    expect(manager.gattClient).assertUndefined();
    expect(manager.device).assertUndefined();
    expect(manager.connectState).assertEqual(constant.ProfileConnectionState.STATE_DISCONNECTED);
    expect(manager.found).assertFalse();
    expect(manager.serviceResult).assertEqual('');
    expect(manager.getResult()).assertEqual('');
  };

export default runExpansionCase;
