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
import { calc } from '../../../../../main/ets/calc/pages/CardCalc';

/**
 * @tc.number EXP_CC0013
 * @tc.name EXP_CC0013
 * @tc.desc Verify a single integer operand retains its exact numeric value and integer formatting, with no cross-call contamination after addition.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    // Cover single-operand evaluation without rounding or added decimal places.
    const result: string = calc('42');
    expect(result).assertEqual('42');
    expect(Number(result)).assertEqual(42);

    // Interleave integer addition to exercise fresh stacks for each calculation.
    const interleavedResult: string = calc('1+1');
    expect(interleavedResult).assertEqual('2');

    const repeatedResult: string = calc('42');
    expect(repeatedResult).assertEqual('42');
    expect(Number(repeatedResult)).assertEqual(42);
  };

export default runExpansionCase;
