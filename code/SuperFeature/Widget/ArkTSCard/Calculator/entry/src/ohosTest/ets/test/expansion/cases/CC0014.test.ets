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
 * @tc.number EXP_CC0014
 * @tc.name EXP_CC0014
 * @tc.desc Ignore a trailing addition operator, preserve exact integer output, and isolate successive calculations.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    // Incomplete addition drops the trailing '+' while retaining integer precision without decimal padding.
    const expression: string = '9+';
    const firstResult: string = calc(expression);
    expect(firstResult).assertEqual('9');
    expect(Number(firstResult)).assertEqual(9);

    // Exercise a real addition between repeats to detect cross-call calculation state pollution.
    const interveningResult: string = calc('1+1');
    expect(interveningResult).assertEqual('2');

    const repeatedResult: string = calc(expression);
    expect(repeatedResult).assertEqual('9');
    expect(Number(repeatedResult)).assertEqual(9);
  };

export default runExpansionCase;
