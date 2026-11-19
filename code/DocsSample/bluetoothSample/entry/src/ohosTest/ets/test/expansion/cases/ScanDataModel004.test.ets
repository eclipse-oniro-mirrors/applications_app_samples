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
 * @tc.number EXP_BT_DATA_004
 * @tc.name EXP_BT_DATA_004
 * @tc.desc A fresh production ScanData returns AA:BB after setDeviceId('AA:BB').
 * @tc.level Level 0
 */
const runExpansionCase: () => void = () => {
    const scanData: ScanData = new ScanData();
    expect(scanData.getDeviceId()).assertEqual('');

    scanData.setDeviceId('AA:BB');

    expect(scanData.getDeviceId()).assertEqual('AA:BB');
  };

export default runExpansionCase;
