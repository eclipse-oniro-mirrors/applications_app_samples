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
import { calc as peerCalc } from '../../../../../main/ets/calc/pages/CardCalc';

/**
 * @tc.number V2_CALC_MAIN_INTEGER_DIV_0136
 * @tc.name EXP_V2_CALC_MAIN_INTEGER_DIV_0136
 * @tc.desc MAIN integer -65536 / (-2); scale 3; peer/literal/control/replay isolation
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const primaryResult: string = calc('-65536/(-2)');
    expect(primaryResult).assertEqual('32768.000');
    expect(Number(primaryResult)).assertEqual(32768);
    const peerResult: string = peerCalc('-65536/(-2)');
    expect(peerResult).assertEqual('32768.000');
    expect(Number(peerResult)).assertEqual(32768);

    const leftLiteral: string = calc('-65536');
    expect(leftLiteral).assertEqual('-65536');
    expect(Number(leftLiteral)).assertEqual(-65536);
    const rightLiteral: string = peerCalc('-2');
    expect(rightLiteral).assertEqual('-2');
    expect(Number(rightLiteral)).assertEqual(-2);

    const primaryControl: string = calc('1+1');
    expect(primaryControl).assertEqual('2');
    expect(Number(primaryControl)).assertEqual(2);
    const peerControl: string = peerCalc('1+1');
    expect(peerControl).assertEqual('2');
    expect(Number(peerControl)).assertEqual(2);

    const peerReplay: string = peerCalc('-65536/(-2)');
    expect(peerReplay).assertEqual('32768.000');
    expect(Number(peerReplay)).assertEqual(32768);
    const primaryReplay: string = calc('-65536/(-2)');
    expect(primaryReplay).assertEqual('32768.000');
    expect(Number(primaryReplay)).assertEqual(32768);
  };

export default runExpansionCase;
