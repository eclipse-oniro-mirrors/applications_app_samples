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
 * @tc.number EXP_CALC_MAIN_ADD_018
 * @tc.name EXP_CALC_MAIN_ADD_018
 */
const runExpansionCase: () => void = () => {
    const matrix: AdditionMatrix = {
      input: '1e3+2',
      expected: '1002',
      numericExpected: 1002
    };
    // The explicit oracle is 1000 + 2, with zero fractional digits after normalization.
    const result: string = calc(matrix.input);
    expect(result).assertEqual(matrix.expected);
    expect(Number(result)).assertEqual(matrix.numericExpected);

    const independentResult: string = calc('1+1');
    expect(independentResult).assertEqual('2');
    expect(Number(independentResult)).assertEqual(2);

    const repeatedResult: string = calc(matrix.input);
    expect(repeatedResult).assertEqual(matrix.expected);
    expect(Number(repeatedResult)).assertEqual(matrix.numericExpected);
  };

export default runExpansionCase;
