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
 * @tc.number EXP_CI0011
 * @tc.name EXP_CI0011
 * @tc.desc Integer division preserves three fractional digits and numeric value across an intervening addition.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    // Integer division retains the minimum three-digit precision even for an integral quotient.
    const firstResult: string = calc('100/4');
    expect(firstResult).assertEqual('25.000');
    expect(Number(firstResult)).assertEqual(25);

    // A separate addition must not contaminate the subsequent division or its precision.
    const interveningResult: string = calc('1+1');
    expect(interveningResult).assertEqual('2');
    const repeatedResult: string = calc('100/4');
    expect(repeatedResult).assertEqual('25.000');
    expect(Number(repeatedResult)).assertEqual(25);
  };

export default runExpansionCase;
