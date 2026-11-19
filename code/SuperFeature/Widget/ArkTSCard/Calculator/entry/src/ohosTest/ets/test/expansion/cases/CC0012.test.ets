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
 * @tc.number EXP_CC0012
 * @tc.name EXP_CC0012
 * @tc.desc Decimal division retains three fractional digits and its numeric value across an intervening addition.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    // Cover decimal-by-integer division and the three-digit precision floor, including a trailing zero.
    const expression: string = '1.5/2';
    const result: string = calc(expression);
    expect(result).assertEqual('0.750');
    expect(Number(result)).assertEqual(0.75);

    // An independent integer addition must not contaminate the next division's operands or precision.
    expect(calc('1+1')).assertEqual('2');
    const repeatedResult: string = calc(expression);
    expect(repeatedResult).assertEqual('0.750');
    expect(Number(repeatedResult)).assertEqual(0.75);
  };

export default runExpansionCase;
