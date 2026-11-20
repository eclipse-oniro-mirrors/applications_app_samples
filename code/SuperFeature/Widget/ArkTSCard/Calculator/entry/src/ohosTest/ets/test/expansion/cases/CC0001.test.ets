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
 * @tc.number CC0001
 * @tc.name EXP_CC0001
 * @tc.desc Zero addition preserves exact integer formatting and numeric zero across independent calculations.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const expression: string = '0+0';
    // Cover zero addition with integer precision: no decimal suffix or rounding residue.
    const initialResult: string = calc(expression);
    expect(initialResult).assertEqual('0');
    expect(Number(initialResult)).assertEqual(0);

    // Interleave one different addition to expose any retained calculation state.
    const interveningResult: string = calc('1+1');
    expect(interveningResult).assertEqual('2');

    const repeatedResult: string = calc(expression);
    expect(repeatedResult).assertEqual('0');
    expect(Number(repeatedResult)).assertEqual(0);
  };

export default runExpansionCase;
