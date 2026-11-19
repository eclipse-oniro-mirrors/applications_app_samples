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
 * @tc.number EXP_CI0014
 * @tc.name EXP_CI0014
 * @tc.desc Trailing addition operator is ignored, preserving exact integer text and numeric value across calls.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    // Cover incomplete addition: the trailing '+' is omitted and integer precision remains exact.
    const expression: string = '9+';
    const firstResult: string = calc(expression);
    expect(firstResult).assertEqual('9');
    expect(Number(firstResult)).assertEqual(9);

    // Exercise a complete integer addition between repetitions to detect cross-call state pollution.
    const interveningResult: string = calc('1+1');
    expect(interveningResult).assertEqual('2');

    const repeatedResult: string = calc(expression);
    expect(repeatedResult).assertEqual('9');
    expect(Number(repeatedResult)).assertEqual(9);
    expect(repeatedResult).assertEqual(firstResult);
  };

export default runExpansionCase;
