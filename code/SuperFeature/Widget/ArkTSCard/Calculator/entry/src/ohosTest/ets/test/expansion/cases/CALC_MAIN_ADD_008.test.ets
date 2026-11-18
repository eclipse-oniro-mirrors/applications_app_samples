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
  expectedNumber: number;
}

/**
 * @tc.number EXP_CALC_MAIN_ADD_008
 * @tc.name EXP_CALC_MAIN_ADD_008
 */
const runExpansionCase: () => void = () => {
    const matrix: AdditionMatrix = {
      input: '-7+0',
      expected: '-7',
      expectedNumber: -7
    };
    // Both Number-normalized operands have zero decimal places; the explicit oracle is -7.
    const actual: string = calc(matrix.input);
    expect(actual).assertEqual(matrix.expected);
    expect(Number(actual)).assertEqual(matrix.expectedNumber);

    const intervening: string = calc('1+1');
    expect(intervening).assertEqual('2');
    expect(Number(intervening)).assertEqual(2);

    const repeated: string = calc(matrix.input);
    expect(repeated).assertEqual(matrix.expected);
    expect(Number(repeated)).assertEqual(matrix.expectedNumber);
  };

export default runExpansionCase;
