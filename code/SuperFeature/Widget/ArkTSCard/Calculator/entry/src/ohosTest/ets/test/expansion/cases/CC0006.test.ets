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
 * @tc.number EXP_CC0006
 * @tc.name EXP_CC0006
 * @tc.desc Verify two-digit integer multiplication preserves exact zero-decimal output and remains isolated across calls.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    // Integer multiplication has zero fractional precision: no decimal padding or rounding is expected.
    const expression: string = '11*12';
    const result: string = calc(expression);
    expect(result).assertEqual('132');
    expect(Number(result)).assertEqual(132);

    // An intervening addition must not contaminate a later multiplication evaluation.
    const interveningResult: string = calc('1+1');
    expect(interveningResult).assertEqual('2');

    const repeatedResult: string = calc(expression);
    expect(repeatedResult).assertEqual('132');
    expect(Number(repeatedResult)).assertEqual(132);
    expect(repeatedResult).assertEqual(result);
  };

export default runExpansionCase;
