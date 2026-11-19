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
 * @tc.number: EXP_CI0007
 * @tc.name: EXP_CI0007
 * @tc.desc: Decimal multiplication preserves three fractional digits and numeric value across an intervening addition.
 * @tc.level: Level 1
 */
const runExpansionCase: () => void = () => {
    // Multiplying a three-decimal operand by an integer preserves trailing zeros in the integral product.
    const expression: string = '0.125*8';
    const firstResult: string = calc(expression);
    expect(firstResult).assertEqual('1.000');
    expect(Number(firstResult)).assertEqual(1);

    // A separate addition must not leave operands or operators that contaminate the repeated multiplication.
    expect(calc('1+1')).assertEqual('2');
    const repeatedResult: string = calc(expression);
    expect(repeatedResult).assertEqual('1.000');
    expect(Number(repeatedResult)).assertEqual(1);
  };

export default runExpansionCase;
