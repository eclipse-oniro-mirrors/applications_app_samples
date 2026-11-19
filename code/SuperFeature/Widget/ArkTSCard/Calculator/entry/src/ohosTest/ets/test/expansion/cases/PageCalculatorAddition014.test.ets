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
 * @tc.number CALC_MAIN_ADD_014
 * @tc.name EXP_CALC_MAIN_ADD_014
 * @tc.desc Verify integer carry addition has exact formatting and independent repeated results.
 * @tc.level Level 0
 */
const runExpansionCase: () => void = () => {
    const input: string = '999+1';
    const expected: string = '1000';
    const result: string = calc(input);
    expect(result).assertEqual(expected);
    expect(Number(result)).assertEqual(1000);

    const independentResult: string = calc('1+1');
    expect(independentResult).assertEqual('2');
    expect(Number(independentResult)).assertEqual(2);

    const repeatedResult: string = calc(input);
    expect(repeatedResult).assertEqual(expected);
    expect(Number(repeatedResult)).assertEqual(1000);
  };

export default runExpansionCase;
