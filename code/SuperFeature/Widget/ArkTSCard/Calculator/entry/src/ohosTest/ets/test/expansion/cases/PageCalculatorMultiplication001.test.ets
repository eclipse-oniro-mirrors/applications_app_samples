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
 * @tc.number EXP_CALC_MAIN_MUL_001
 * @tc.name EXP_CALC_MAIN_MUL_001
 */
const runExpansionCase: () => void = () => {
    const result: string = calc('0*7');
    expect(result).assertEqual('0');
    expect(Number(result)).assertEqual(0);

    const intermediate: string = calc('1+1');
    expect(intermediate).assertEqual('2');

    const repeatedResult: string = calc('0*7');
    expect(repeatedResult).assertEqual('0');
    expect(Number(repeatedResult)).assertEqual(0);
  };

export default runExpansionCase;
