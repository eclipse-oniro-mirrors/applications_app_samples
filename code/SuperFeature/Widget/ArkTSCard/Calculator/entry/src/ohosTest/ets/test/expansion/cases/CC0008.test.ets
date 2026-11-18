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
import { calc } from '../../../../../main/ets/calc/pages/CardCalc';

/**
 * @tc.number CC0008
 * @tc.name EXP_CC0008
 * @tc.desc Verify unary-negative decimal multiplication, one-decimal precision and isolated repeated calls.
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    // 覆盖首项一元负号与小数乘法：整数数值结果仍须保留一位小数精度。
    const expression: string = '-2.5*4';
    const firstResult: string = calc(expression);
    expect(firstResult).assertEqual('-10.0');
    expect(Number(firstResult)).assertEqual(-10);

    // 插入一次独立加法，再计算原式，确认运算栈和精度不会跨次污染。
    expect(calc('1+1')).assertEqual('2');
    const repeatedResult: string = calc(expression);
    expect(repeatedResult).assertEqual('-10.0');
    expect(Number(repeatedResult)).assertEqual(-10);
  };

export default runExpansionCase;
