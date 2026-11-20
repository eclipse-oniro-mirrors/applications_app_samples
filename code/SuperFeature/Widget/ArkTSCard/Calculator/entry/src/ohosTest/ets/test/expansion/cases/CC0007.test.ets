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
 * @tc.number: EXP_CC0007
 * @tc.name: EXP_CC0007
 * @tc.desc: Decimal multiplication preserves three fractional digits for 0.125*8,
 *           yields numeric one, and remains isolated across an intervening addition.
 * @tc.level: Level 0
 */
const runExpansionCase: () => void = () => {
    // Cover decimal-by-integer multiplication and its retained three-digit precision.
    const result: string = calc('0.125*8');
    expect(result).assertEqual('1.000');
    expect(Number(result)).assertEqual(1);

    // An unrelated addition must not leave parser or evaluation state behind.
    expect(calc('1+1')).assertEqual('2');
    const repeatedResult: string = calc('0.125*8');
    expect(repeatedResult).assertEqual('1.000');
    expect(Number(repeatedResult)).assertEqual(1);
  };

export default runExpansionCase;
