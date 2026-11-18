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
 * @tc.number EXP_CI0002
 * @tc.name EXP_CI0002
 * @tc.desc Cover leading unary minus and integer addition with exact zero-decimal output,
 *          numeric correctness, and isolation across an intervening calculation.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    // Unary minus must bind to 7; integer addition must produce "5", not "5.0".
    const expression: string = '-7+12';
    const firstResult: string = calc(expression);
    expect(firstResult).assertEqual('5');
    expect(Number(firstResult)).assertEqual(5);

    // Exercise a separate real calculation before checking cross-call isolation.
    const interveningResult: string = calc('1+1');
    expect(interveningResult).assertEqual('2');

    const repeatedResult: string = calc(expression);
    expect(repeatedResult).assertEqual('5');
    expect(Number(repeatedResult)).assertEqual(5);
  };

export default runExpansionCase;
