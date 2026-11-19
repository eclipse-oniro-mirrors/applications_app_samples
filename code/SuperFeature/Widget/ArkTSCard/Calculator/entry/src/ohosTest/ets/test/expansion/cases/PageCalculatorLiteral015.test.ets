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
 * @tc.number CALC_MAIN_LITERAL_015
 * @tc.name EXP_CALC_MAIN_LITERAL_015
 * @tc.desc Verify CALC_MAIN_LITERAL_015 exact formatting, numeric meaning and independent recalculation.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    // Explicit matrix oracle; no production helper or duplicate calculator model.
    const firstResult: string = calc('-.5');
    expect(firstResult).assertEqual('-.5');
    expect(Number(firstResult)).assertEqual(-0.5);

    const interveningResult: string = calc('1+1');
    expect(interveningResult).assertEqual('2');
    expect(Number(interveningResult)).assertEqual(2);

    const repeatedResult: string = calc('-.5');
    expect(repeatedResult).assertEqual('-.5');
    expect(Number(repeatedResult)).assertEqual(-0.5);
  };

export default runExpansionCase;
