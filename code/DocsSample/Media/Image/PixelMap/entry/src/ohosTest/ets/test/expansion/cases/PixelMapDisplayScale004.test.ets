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
 * @tc.number PM_DISPLAY_004
 * @tc.name EXP_PM_DISPLAY_004
 * @tc.desc Verify zero dimensions use floor(value * min(display width, height) / 720).
 * @tc.level Level 1
 * Use a physical device with stable default display dimensions throughout this case.
 */
const runExpansionCase: () => void = () => {
    const before = display.getDefaultDisplaySync();
    const screenWidth: number = before.width;
    const screenHeight: number = before.height;
    expect(screenWidth > 0).assertTrue();
    expect(screenHeight > 0).assertTrue();

    const info = new DisplayInfo();
    const after = display.getDefaultDisplaySync();
    expect(after.width).assertEqual(screenWidth);
    expect(after.height).assertEqual(screenHeight);

    const value: number = 0;
    const expected: string = `${Math.floor(value * Math.min(screenWidth, screenHeight) / 720)}px`;
    expect(info.getWidth(value)).assertEqual(expected);
    expect(info.getHeight(value)).assertEqual(expected);
  };

export default runExpansionCase;
