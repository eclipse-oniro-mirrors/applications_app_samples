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
 * @tc.number: EXP_CI0001
 * @tc.name: EXP_CI0001
 * @tc.desc: 零值整数加法应精确返回无小数位的字符串，并在交错调用后保持结果独立。
 * @tc.level: Level 1
 */
const runExpansionCase: () => void = () => {
    // 覆盖 0+0 的加法、零小数位格式和数值意义，不复制生产计算算法。
    const expression: string = '0+0';
    const firstResult: string = calc(expression);
    expect(firstResult).assertEqual('0');
    expect(Number(firstResult)).assertEqual(0);

    // 插入一次独立加法，再重复原式，确认没有跨次调用污染。
    const interveningResult: string = calc('1+1');
    expect(interveningResult).assertEqual('2');
    const repeatedResult: string = calc(expression);
    expect(repeatedResult).assertEqual('0');
    expect(Number(repeatedResult)).assertEqual(0);
  };

export default runExpansionCase;
