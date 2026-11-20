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
import { display } from '@kit.ArkUI';
import { DisplayInfo } from '../../../../../main/ets/utils/DisPlayInfoUtil';
/**
 * @tc.number EXP_PM_DISPLAY_019
 * @tc.name EXP_PM_DISPLAY_019
 * @tc.desc PM_DISPLAY {"method":"getHeight","value":-1,"screenReference":"构造时真实默认屏幕min(width,height)，测试时屏幕稳定","caseId":"PM_DISPLAY_019"}
 * @tc.level Level 1
 * Device ohosTest only. Real Ability context and ImageKit required; never local mock.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const before = display.getDefaultDisplaySync();
    expect(before.width > 0).assertTrue();
    expect(before.height > 0).assertTrue();
    const sut = new DisplayInfo();
    expect(sut.getHeight(-1)).assertEqual(`${Math.floor(-1 * Math.min(before.width, before.height) / 720)}px`);
    const after = display.getDefaultDisplaySync();
    expect(after.id).assertEqual(before.id);
    expect(after.width).assertEqual(before.width);
    expect(after.height).assertEqual(before.height);
  };

export default runExpansionCase;
