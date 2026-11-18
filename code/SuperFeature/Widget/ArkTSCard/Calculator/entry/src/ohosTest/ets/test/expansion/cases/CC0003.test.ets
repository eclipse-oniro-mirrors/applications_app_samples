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
 * @tc.number: EXP_CC0003
 * @tc.name: EXP_CC0003
 * @tc.desc: Decimal addition returns the exact one-decimal string and numeric value without cross-call state pollution.
 * @tc.level: Level 1
 */
const runExpansionCase: () => void = () => {
    // Cover decimal addition precision: 0.1 + 0.2 must not expose a floating-point tail.
    const expression: string = '0.1+0.2';
    const firstResult: string = calc(expression);
    expect(firstResult).assertEqual('0.3');
    expect(Number(firstResult)).assertEqual(0.3);

    // Interleave one integer addition to detect state leaking between real calc calls.
    const interveningResult: string = calc('1+1');
    expect(interveningResult).assertEqual('2');

    const repeatedResult: string = calc(expression);
    expect(repeatedResult).assertEqual('0.3');
    expect(Number(repeatedResult)).assertEqual(0.3);
  };

export default runExpansionCase;
