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
 * @tc.number CI0005
 * @tc.name EXP_CI0005
 * @tc.desc Decimal subtraction with unequal fractional lengths preserves two-place precision and isolates repeated calls.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    // Cover decimal subtraction: two fractional digits minus one must produce exactly 4.75.
    const expression: string = '7.25-2.5';
    const result: string = calc(expression);
    expect(result).assertEqual('4.75');
    expect(Number(result)).assertEqual(4.75);

    // Interleave a simple addition to detect state leaking between independent evaluations.
    const interleavedResult: string = calc('1+1');
    expect(interleavedResult).assertEqual('2');

    const repeatedResult: string = calc(expression);
    expect(repeatedResult).assertEqual('4.75');
    expect(Number(repeatedResult)).assertEqual(4.75);
  };

export default runExpansionCase;
