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
 * @tc.number CALC_MAIN_SUB_006
 * @tc.name EXP_CALC_MAIN_SUB_006
 * @tc.desc Verify unary-positive integer subtraction and independence across calc calls.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const result: string = calc('+7-5');
    expect(result).assertEqual('2');
    expect(Number(result)).assertEqual(2);

    const controlResult: string = calc('1+1');
    expect(controlResult).assertEqual('2');
    expect(Number(controlResult)).assertEqual(2);

    const repeatedResult: string = calc('+7-5');
    expect(repeatedResult).assertEqual('2');
    expect(Number(repeatedResult)).assertEqual(2);
    expect(repeatedResult).assertEqual(result);
  };

export default runExpansionCase;
