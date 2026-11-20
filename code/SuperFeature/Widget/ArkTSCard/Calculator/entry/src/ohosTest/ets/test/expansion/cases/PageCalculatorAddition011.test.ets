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

interface AdditionMatrix {
  input: string;
  expected: string;
  numericExpected: number;
}

/**
 * @tc.number EXP_CALC_MAIN_ADD_011
 * @tc.name EXP_CALC_MAIN_ADD_011
 */
const runExpansionCase: () => void = () => {
    const matrix: AdditionMatrix = {
      input: '.5+.25',
      expected: '0.75',
      numericExpected: 0.75
    };
    // Explicit oracle: 0.5 + 0.25 = 0.75; normalized decimal precision is two.
    const result: string = calc(matrix.input);
    expect(result).assertEqual(matrix.expected);
    expect(Number(result)).assertEqual(matrix.numericExpected);

    const controlResult: string = calc('1+1');
    expect(controlResult).assertEqual('2');
    expect(Number(controlResult)).assertEqual(2);

    const repeatedResult: string = calc(matrix.input);
    expect(repeatedResult).assertEqual(matrix.expected);
    expect(Number(repeatedResult)).assertEqual(matrix.numericExpected);
  };

export default runExpansionCase;
