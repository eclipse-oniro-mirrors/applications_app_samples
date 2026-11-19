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
import { calc as peerCalc } from '../../../../../main/ets/pages/Index';

/**
 * @tc.number V2_CALC_CARD_DYADIC_ADD_0468
 * @tc.name EXP_V2_CALC_CARD_DYADIC_ADD_0468
 * @tc.desc CARD dyadic -128.125 + (-8.0); scale 3; peer/literal/control/replay isolation
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => void = () => {
    const primaryResult: string = calc('-128.125+(-8.0)');
    expect(primaryResult).assertEqual('-136.125');
    expect(Number(primaryResult)).assertEqual(-136.125);
    const peerResult: string = peerCalc('-128.125+(-8.0)');
    expect(peerResult).assertEqual('-136.125');
    expect(Number(peerResult)).assertEqual(-136.125);

    const leftLiteral: string = calc('-128.125');
    expect(leftLiteral).assertEqual('-128.125');
    expect(Number(leftLiteral)).assertEqual(-128.125);
    const rightLiteral: string = peerCalc('-8.0');
    expect(rightLiteral).assertEqual('-8.0');
    expect(Number(rightLiteral)).assertEqual(-8);

    const primaryControl: string = calc('1+1');
    expect(primaryControl).assertEqual('2');
    expect(Number(primaryControl)).assertEqual(2);
    const peerControl: string = peerCalc('1+1');
    expect(peerControl).assertEqual('2');
    expect(Number(peerControl)).assertEqual(2);

    const peerReplay: string = peerCalc('-128.125+(-8.0)');
    expect(peerReplay).assertEqual('-136.125');
    expect(Number(peerReplay)).assertEqual(-136.125);
    const primaryReplay: string = calc('-128.125+(-8.0)');
    expect(primaryReplay).assertEqual('-136.125');
    expect(Number(primaryReplay)).assertEqual(-136.125);
  };

export default runExpansionCase;
