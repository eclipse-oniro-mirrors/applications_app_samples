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
 * @tc.number EXP_CI0006
 * @tc.name EXP_CI0006
 * @tc.desc Verify two-digit integer multiplication preserves exact integer precision and remains isolated across calls.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    // Integer multiplication must produce an exact integer string, without fractional padding or rounding.
    const initialResult: string = calc('11*12');
    expect(initialResult).assertEqual('132');
    expect(Number(initialResult)).assertEqual(132);

    // Interleave one addition to exercise independence of successive calculator invocations.
    const interleavedResult: string = calc('1+1');
    expect(interleavedResult).assertEqual('2');

    const repeatedResult: string = calc('11*12');
    expect(repeatedResult).assertEqual('132');
    expect(Number(repeatedResult)).assertEqual(132);
    expect(repeatedResult).assertEqual(initialResult);
  };

export default runExpansionCase;
