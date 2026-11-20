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

/**
 * @tc.number EXP_BT_DATA_008
 * @tc.name EXP_BT_DATA_008
 * @tc.desc A fresh production ScanData stores RSSI -128 exactly without changing other fields.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const scanData = new ScanData();
    expect(scanData.getRssi()).assertEqual(0);

    scanData.setRssi(-128);

    expect(scanData.getRssi()).assertEqual(-128);
    expect(scanData.getDeviceId()).assertEqual('');
    expect(scanData.getDeviceName()).assertEqual('null');
    expect(scanData.getConnectable()).assertEqual(false);
    const data: Uint8Array = scanData.getData();
    expect(data.length).assertEqual(4);
    expect(data[0]).assertEqual(255);
    expect(data[1]).assertEqual(255);
    expect(data[2]).assertEqual(255);
    expect(data[3]).assertEqual(255);
  };

export default runExpansionCase;
