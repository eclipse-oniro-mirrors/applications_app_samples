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
 * @tc.number: EXP_CI0004
 * @tc.name: EXP_CI0004
 * @tc.desc: Integer subtraction yields a negative result with zero decimal places and no cross-call state pollution.
 * @tc.level: Level 1
 */
const runExpansionCase: () => void = () => {
    // Cover subtraction across zero: preserve the minus sign and exact integer precision without a decimal suffix.
    const expression: string = '8-13';
    const result: string = calc(expression);
    expect(result).assertEqual('-5');
    expect(Number(result)).assertEqual(-5);

    // A separate addition must not contaminate the repeated subtraction result.
    const interleavedResult: string = calc('1+1');
    expect(interleavedResult).assertEqual('2');
    const repeatedResult: string = calc(expression);
    expect(repeatedResult).assertEqual('-5');
    expect(Number(repeatedResult)).assertEqual(-5);
    expect(repeatedResult).assertEqual(result);
  };

export default runExpansionCase;
