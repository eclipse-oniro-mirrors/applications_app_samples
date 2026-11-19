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
import { calc } from '../../../../../main/ets/pages/Index';

/**
 * @tc.number CI0012
 * @tc.name EXP_CI0012
 * @tc.desc Decimal division retains three fractional digits and numeric value across independent calls.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    // Decimal-by-integer division preserves the minimum three-digit precision, including a trailing zero.
    const firstResult: string = calc('1.5/2');
    expect(firstResult).assertEqual('0.750');
    expect(Number.parseFloat(firstResult)).assertEqual(0.75);

    // Interleave integer addition to verify that operand/operator state does not leak between calculations.
    expect(calc('1+1')).assertEqual('2');

    const repeatedResult: string = calc('1.5/2');
    expect(repeatedResult).assertEqual('0.750');
    expect(Number.parseFloat(repeatedResult)).assertEqual(0.75);
  };

export default runExpansionCase;
