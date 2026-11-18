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
 * @tc.number CI0013
 * @tc.name EXP_CI0013
 * @tc.desc Cover a standalone two-digit integer with exact string and numeric results,
 * preserving integer precision without decimal padding; interleave integer addition
 * and verify subsequent evaluation has no cross-call state contamination.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const expression: string = '42';
    const result: string = calc(expression);
    expect(result).assertEqual('42');
    expect(Number(result)).assertEqual(42);

    const additionResult: string = calc('1+1');
    expect(additionResult).assertEqual('2');

    const repeatedResult: string = calc(expression);
    expect(repeatedResult).assertEqual('42');
    expect(Number(repeatedResult)).assertEqual(42);
  };

export default runExpansionCase;
