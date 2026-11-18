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
 * @tc.number PM_DISPLAY_015
 * @tc.name EXP_PM_DISPLAY_015
 * @tc.desc Verify getWidth(721) and getHeight(721) both use floor(721 * min(default width, height) / 720) px.
 * @tc.level Level 1
 * Prerequisite: the real default display must remain stable throughout this case.
 */
const runExpansionCase: () => void = () => {
    const before: display.Display = display.getDefaultDisplaySync();
    const width: number = before.width;
    const height: number = before.height;
    expect(width > 0).assertTrue();
    expect(height > 0).assertTrue();

    const info: DisplayInfo = new DisplayInfo();
    const actual: string = info.getWidth(721);
    const actualHeight: string = info.getHeight(721);
    const after: display.Display = display.getDefaultDisplaySync();
    expect(after.id).assertEqual(before.id);
    expect(after.width).assertEqual(width);
    expect(after.height).assertEqual(height);

    const expected: string = `${Math.floor(721 * Math.min(width, height) / 720)}px`;
    expect(actual).assertEqual(expected);
    expect(actualHeight).assertEqual(expected);
  };

export default runExpansionCase;
