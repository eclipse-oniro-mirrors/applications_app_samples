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
import { ScanData } from '../../../../../main/ets/common/ScanData';

import { promptAction } from '@kit.ArkUI';
import { settleServicePromises } from '../fixtures/ServiceInputs';

/**
 * @tc.number BT_DATA_001
 * @tc.name EXP_BT_DATA_001
 * @tc.desc Real ScanData constructor or accessor preserves the precise catalog value and reference semantics. Scenario BT_DATA_001: {"constructor":"defaults"}
 * @tc.level Level1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const manager = new ScanData();
    expect(manager.getDeviceId()).assertEqual('');
    expect(manager.getDeviceName()).assertEqual('null');
    expect(manager.getRssi()).assertEqual(0);
    expect(manager.getConnectable()).assertEqual(false);
    expect(manager.getData().join(',')).assertEqual('255,255,255,255');
  };

export default runExpansionCase;
