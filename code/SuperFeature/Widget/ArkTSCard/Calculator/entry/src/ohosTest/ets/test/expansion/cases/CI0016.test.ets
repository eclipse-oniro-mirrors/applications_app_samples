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
 * @tc.number CI0016
 * @tc.name EXP_CI0016
 * @tc.desc Verify multi-digit integer addition preserves exact zero-decimal output and call isolation.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    // 覆盖千位整数加两位整数：零小数精度应输出整数文本，且数值精确为 1025。
    const expression: string = '1000+25';
    const result: string = calc(expression);
    expect(result).assertEqual('1025');
    expect(Number(result)).assertEqual(1025);

    // 插入一次独立加法，再算原式，验证前一次运算不会污染后续计算。
    const interveningResult: string = calc('1+1');
    expect(interveningResult).assertEqual('2');
    const repeatedResult: string = calc(expression);
    expect(repeatedResult).assertEqual('1025');
    expect(Number(repeatedResult)).assertEqual(1025);
  };

export default runExpansionCase;
