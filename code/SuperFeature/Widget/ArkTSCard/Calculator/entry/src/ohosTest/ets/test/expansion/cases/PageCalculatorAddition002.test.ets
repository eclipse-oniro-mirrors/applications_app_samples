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
 * @tc.number CALC_MAIN_ADD_002
 * @tc.name EXP_CALC_MAIN_ADD_002
 * @tc.desc Verify zero addition has exact integer formatting and remains isolated across calls.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const input: string = '0+7';
    const expected: string = '7';
    // Explicit mathematical and formatting constants: 0 + 7 = 7, with zero fractional digits.
    const result: string = calc(input);
    expect(result).assertEqual(expected);
    expect(Number(result)).assertEqual(7);

    const interveningResult: string = calc('1+1');
    expect(interveningResult).assertEqual('2');
    expect(Number(interveningResult)).assertEqual(2);

    const repeatedResult: string = calc(input);
    expect(repeatedResult).assertEqual(expected);
    expect(Number(repeatedResult)).assertEqual(7);
  };

export default runExpansionCase;
