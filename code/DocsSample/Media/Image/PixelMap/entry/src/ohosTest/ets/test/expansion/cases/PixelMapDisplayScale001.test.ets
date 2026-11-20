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
 * @tc.number EXP_PM_DISPLAY_001
 * @tc.name EXP_PM_DISPLAY_001
 * @tc.desc Verify negative standard-width scaling using a real, stable default display for both methods.
 * @tc.level Level 1
 * Use a physical device with a stable default display throughout this case.
 */
const runExpansionCase: () => void = () => {
    const before = display.getDefaultDisplaySync();
    const screenWidth: number = before.width;
    const screenHeight: number = before.height;
    expect(screenWidth > 0).assertTrue();
    expect(screenHeight > 0).assertTrue();

    const displayInfo = new DisplayInfo();
    const value: number = -720;
    const expectedWidth: string = `${Math.floor(value * Math.min(screenWidth, screenHeight) / 720)}px`;
    const expectedHeight: string = `${Math.floor(value * Math.min(screenWidth, screenHeight) / 720)}px`;
    expect(displayInfo.getWidth(value)).assertEqual(expectedWidth);
    expect(displayInfo.getHeight(value)).assertEqual(expectedHeight);

    const after = display.getDefaultDisplaySync();
    expect(after.width).assertEqual(screenWidth);
    expect(after.height).assertEqual(screenHeight);
  };

export default runExpansionCase;
