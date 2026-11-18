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
 * @tc.number BT_DATA_013
 * @tc.name EXP_BT_DATA_013
 * @tc.desc Mutating index 1 of the array returned by getData updates the fresh production instance.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const scanData: ScanData = new ScanData();
    const returnedData: Uint8Array = scanData.getData();
    expect(returnedData.length).assertEqual(4);
    expect(returnedData[0]).assertEqual(255);
    expect(returnedData[1]).assertEqual(255);
    expect(returnedData[2]).assertEqual(255);
    expect(returnedData[3]).assertEqual(255);

    returnedData[1] = 0;

    const storedData: Uint8Array = scanData.getData();
    expect(storedData === returnedData).assertTrue();
    expect(storedData.length).assertEqual(4);
    expect(storedData[0]).assertEqual(255);
    expect(storedData[1]).assertEqual(0);
    expect(storedData[2]).assertEqual(255);
    expect(storedData[3]).assertEqual(255);
  };

export default runExpansionCase;
