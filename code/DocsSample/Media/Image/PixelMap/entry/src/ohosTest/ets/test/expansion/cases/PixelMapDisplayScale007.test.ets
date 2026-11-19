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
 * @tc.number EXP_PM_DISPLAY_007
 * @tc.name EXP_PM_DISPLAY_007
 * @tc.desc Verify fractional 1.25 scaling against the real default display's shorter edge.
 * @tc.level Level 1
 * Prerequisite: a real default display with positive, stable dimensions during this case.
 */
const runExpansionCase: () => void = () => {
    const screen = display.getDefaultDisplaySync();
    const screenWidth: number = screen.width;
    const screenHeight: number = screen.height;
    expect(screenWidth > 0).assertTrue();
    expect(screenHeight > 0).assertTrue();

    const info: DisplayInfo = new DisplayInfo();
    const currentScreen = display.getDefaultDisplaySync();
    expect(currentScreen.width).assertEqual(screenWidth);
    expect(currentScreen.height).assertEqual(screenHeight);

    const expected: string = `${Math.floor(1.25 * Math.min(screenWidth, screenHeight) / 720)}px`;
    expect(info.getWidth(1.25)).assertEqual(expected);
    expect(info.getHeight(1.25)).assertEqual(expected);
  };

export default runExpansionCase;
