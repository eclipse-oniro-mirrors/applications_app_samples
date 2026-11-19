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
 * @tc.number BT_DATA_003
 * @tc.name EXP_BT_DATA_003
 * @tc.desc Explicit empty constructor inputs remain empty in every ScanData getter.
 * @tc.level Level 0
 */
const runExpansionCase: () => void = () => {
    const data: Uint8Array = inputBytes([]);
    const scanData: ScanData = new ScanData('', '', 0, false, data);

    expect(scanData.getDeviceId()).assertEqual('');
    expect(scanData.getDeviceName()).assertEqual('');
    expect(scanData.getRssi()).assertEqual(0);
    expect(scanData.getConnectable()).assertEqual(false);
    expect(scanData.getData().length).assertEqual(0);
  };

export default runExpansionCase;
