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
 * @tc.number EXP_PM_DISPLAY_010
 * @tc.name EXP_PM_DISPLAY_010
 */
const runExpansionCase: () => void = () => {
    // Prerequisite: the default display dimensions remain stable throughout this case.
    const before = display.getDefaultDisplaySync();
    const width: number = before.width;
    const height: number = before.height;
    expect(width > 0).assertTrue();
    expect(height > 0).assertTrue();

    const displayInfo = new DisplayInfo();
    const actual: string = displayInfo.getWidth(100.125);
    const actualHeight: string = displayInfo.getHeight(100.125);
    const after = display.getDefaultDisplaySync();
    expect(after.width).assertEqual(width);
    expect(after.height).assertEqual(height);

    const expected: string = `${Math.floor(100.125 * Math.min(width, height) / 720)}px`;
    expect(actual).assertEqual(expected);
    expect(actualHeight).assertEqual(expected);
  };

export default runExpansionCase;
