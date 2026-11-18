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
import { sourceCase } from '../fixtures/PixelMapFixtures';
/**
 * @tc.number EXP_PM_NAMES_007
 * @tc.name EXP_PM_NAMES_007
 * @tc.desc PM_NAMES {"method":"getImageSourceByFd","fileName":"/media-catalog/nested/leaf.png","fixture":{"id":"pngOdd","format":"image/png","width":17,"height":13,"pattern":"opaque-color-quadrants"},"state":"helper预建目录及完整合法图像","caseId":"PM_NAMES_007"}
 * @tc.level Level 1
 * Device ohosTest only. Real Ability context and ImageKit required; never local mock.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    await sourceCase('PM_NAMES_007', {
      id: 'pngOdd',
      format: 'image/png',
      width: 17,
      height: 13,
      pattern: 'opaque-color-quadrants'
    }, 'getImageSourceByFd', 'nested/leaf.png');
  };

export default runExpansionCase;
