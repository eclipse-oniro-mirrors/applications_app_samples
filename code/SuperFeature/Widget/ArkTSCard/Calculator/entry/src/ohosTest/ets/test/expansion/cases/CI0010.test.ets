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
 * @tc.number EXP_CI0010
 * @tc.name EXP_CI0010
 * @tc.desc Integer division retains three fractional digits for one eighth, preserves its numeric value,
 * and remains independent of an intervening addition calculation.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    // Cover division's three-place precision and exact terminating-decimal representation.
    const expression: string = '1/8';
    const result: string = calc(expression);
    expect(result).assertEqual('0.125');
    expect(Number(result)).assertEqual(0.125);

    // A different operation must not contaminate subsequent division state or precision.
    expect(calc('1+1')).assertEqual('2');
    const repeatedResult: string = calc(expression);
    expect(repeatedResult).assertEqual('0.125');
    expect(Number(repeatedResult)).assertEqual(0.125);
    expect(repeatedResult).assertEqual(result);
  };

export default runExpansionCase;
