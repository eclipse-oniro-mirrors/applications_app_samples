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
}

/**
 * @tc.number CALC_MAIN_ADD_016
 * @tc.name EXP_CALC_MAIN_ADD_016
 * @tc.desc Main-page calc adds small decimals with four-place formatting and no cross-call state pollution.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const matrix: AdditionMatrix = { input: '0.0001+0.0002', expected: '0.0003' };
    const result: string = calc(matrix.input);
    expect(result).assertEqual(matrix.expected);
    expect(Number(result)).assertEqual(0.0003);

    const independentResult: string = calc('1+1');
    expect(independentResult).assertEqual('2');
    expect(Number(independentResult)).assertEqual(2);

    const repeatedResult: string = calc(matrix.input);
    expect(repeatedResult).assertEqual(matrix.expected);
    expect(Number(repeatedResult)).assertEqual(0.0003);
  };

export default runExpansionCase;
