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
import { inputBytes } from '../fixtures/ServiceInputs';

/**
 * @tc.number BT_DATA_002
 * @tc.name EXP_BT_DATA_002
 * @tc.desc A fresh production ScanData preserves explicit id, Unicode name, RSSI, connectability and bytes.
 * @tc.level Level0
 */
const runExpansionCase: () => void = () => {
    const data: Uint8Array = inputBytes([0, 255]);
    const scanData: ScanData = new ScanData('idA', '名称', -127, true, data);

    expect(scanData.getDeviceId()).assertEqual('idA');
    expect(scanData.getDeviceName()).assertEqual('名称');
    expect(scanData.getRssi()).assertEqual(-127);
    expect(scanData.getConnectable()).assertEqual(true);
    const actualData: Uint8Array = scanData.getData();
    expect(actualData.length).assertEqual(2);
    expect(actualData[0]).assertEqual(0);
    expect(actualData[1]).assertEqual(255);
  };

export default runExpansionCase;
