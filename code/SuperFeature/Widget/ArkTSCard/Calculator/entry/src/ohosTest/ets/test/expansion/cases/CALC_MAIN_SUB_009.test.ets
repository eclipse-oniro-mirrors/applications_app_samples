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
 * @tc.number CALC_MAIN_SUB_009
 * @tc.name EXP_CALC_MAIN_SUB_009
 * @tc.desc Subtract leading-dot decimals with exact precision and verify call isolation.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const result: string = calc('.5-.25');
    expect(result).assertEqual('0.25');
    expect(Number(result)).assertEqual(0.25);

    const control: string = calc('1+1');
    expect(control).assertEqual('2');
    expect(Number(control)).assertEqual(2);

    const repeated: string = calc('.5-.25');
    expect(repeated).assertEqual('0.25');
    expect(Number(repeated)).assertEqual(0.25);
    expect(repeated).assertEqual(result);
  };

export default runExpansionCase;
