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
 * @tc.number EXP_CC0004
 * @tc.name EXP_CC0004
 * @tc.desc Integer subtraction produces an exact negative integer without fractional padding;
 *          an intervening addition must not contaminate a repeated calculation.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const expression: string = '8-13';
    // Cover subtraction operand order, negative sign and zero-decimal integer precision.
    const result: string = calc(expression);
    expect(result).assertEqual('-5');
    expect(Number(result)).assertEqual(-5);

    const interveningResult: string = calc('1+1');
    expect(interveningResult).assertEqual('2');

    // Re-evaluate the original expression after another call to detect cross-call state leakage.
    const repeatedResult: string = calc(expression);
    expect(repeatedResult).assertEqual('-5');
    expect(Number(repeatedResult)).assertEqual(-5);
  };

export default runExpansionCase;
