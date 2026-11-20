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
 * @tc.number EXP_PM_DISPLAY_014
 * @tc.name EXP_PM_DISPLAY_014
 */
const runExpansionCase: () => void = () => {
    const before: display.Display = display.getDefaultDisplaySync();
    const screenWidth: number = before.width;
    const screenHeight: number = before.height;
    expect(screenWidth > 0).assertTrue();
    expect(screenHeight > 0).assertTrue();

    const displayInfo: DisplayInfo = new DisplayInfo();
    const actual: string = displayInfo.getWidth(720);
    const after: display.Display = display.getDefaultDisplaySync();
    expect(after.id).assertEqual(before.id);
    expect(after.width).assertEqual(screenWidth);
    expect(after.height).assertEqual(screenHeight);

    const expected: string = `${Math.floor(720 * Math.min(screenWidth, screenHeight) / 720)}px`;
    expect(actual).assertEqual(expected);
  };

export default runExpansionCase;
