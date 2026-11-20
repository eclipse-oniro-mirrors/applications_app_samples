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
 * @tc.number EXP_CC0015
 * @tc.name EXP_CC0015
 */
const runExpansionCase: () => void = () => {
    const expression: string = '-10-3';
    // Cover a leading unary minus followed by subtraction: the negative integer
    // result must be exact and formatted without fractional digits.
    const firstResult: string = calc(expression);
    expect(firstResult).assertEqual('-13');
    expect(Number(firstResult)).assertEqual(-13);

    // An intervening addition must not contaminate the next subtraction call.
    const interveningResult: string = calc('1+1');
    expect(interveningResult).assertEqual('2');

    const repeatedResult: string = calc(expression);
    expect(repeatedResult).assertEqual('-13');
    expect(Number(repeatedResult)).assertEqual(-13);
  };

export default runExpansionCase;
