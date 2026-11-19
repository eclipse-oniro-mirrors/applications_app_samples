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
 * @tc.number EXP_CI0015
 * @tc.name EXP_CI0015
 * @tc.desc Cover leading unary minus and integer subtraction with exact zero-decimal
 * output, preserving the negative numeric value and isolation across successive calls.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    // Leading negative integer minus a positive integer must keep exact integer precision.
    const expression: string = '-10-3';
    const firstResult: string = calc(expression);
    expect(firstResult).assertEqual('-13');
    expect(Number(firstResult)).assertEqual(-13);

    // Interleave one unrelated addition, then verify no state leaks into the original case.
    const interleavedResult: string = calc('1+1');
    expect(interleavedResult).assertEqual('2');

    const repeatedResult: string = calc(expression);
    expect(repeatedResult).assertEqual('-13');
    expect(Number(repeatedResult)).assertEqual(-13);
  };

export default runExpansionCase;
