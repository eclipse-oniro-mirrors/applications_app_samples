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
 * @tc.number BT_DATA_012
 * @tc.name EXP_BT_DATA_012
 * @tc.desc Verify setData retains caller reference and exposes caller mutation as exactly [9, 2].
 * @tc.level Level 0
 */
const runExpansionCase: () => void = () => {
    const scanData = new ScanData();
    const callerData = inputBytes([1, 2]);
    scanData.setData(callerData);
    expect(scanData.getData() === callerData).assertTrue();
    expect(scanData.getData().length).assertEqual(2);
    expect(scanData.getData()[0]).assertEqual(1);
    expect(scanData.getData()[1]).assertEqual(2);

    callerData[0] = 9;

    const storedData = scanData.getData();
    expect(storedData === callerData).assertTrue();
    expect(storedData.length).assertEqual(2);
    expect(storedData[0]).assertEqual(9);
    expect(storedData[1]).assertEqual(2);
  };

export default runExpansionCase;
