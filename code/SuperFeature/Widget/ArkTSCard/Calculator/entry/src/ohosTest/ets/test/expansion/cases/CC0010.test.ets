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
 * @tc.number EXP_CC0010
 * @tc.name EXP_CC0010
 * @tc.desc Verify integer division retains the exact three-decimal fraction 0.125 and remains independent of an intervening addition.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    // Cover division with an exactly representable fractional result at three-decimal precision.
    const expression: string = '1/8';
    const expected: string = '0.125';
    const firstResult: string = calc(expression);
    expect(firstResult).assertEqual(expected);
    expect(Number(firstResult)).assertEqual(0.125);

    // An intervening addition must not contaminate the next division calculation.
    expect(calc('1+1')).assertEqual('2');
    const repeatedResult: string = calc(expression);
    expect(repeatedResult).assertEqual(expected);
    expect(Number(repeatedResult)).assertEqual(0.125);
  };

export default runExpansionCase;
