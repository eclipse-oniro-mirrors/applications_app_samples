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
import { sourceSequence } from '../fixtures/PixelMapFixtures';
/**
 * @tc.number EXP_PM_SRC_SEQ_001
 * @tc.name EXP_PM_SRC_SEQ_001
 * @tc.desc PM_SRC_SEQ {"fixture":{"id":"pngOdd","format":"image/png","width":17,"height":13,"pattern":"opaque-color-quadrants"},"sequence":["getImageSourceByFilePath","decodeByFormatWithParameter","decodeByAutoWithParameter"],"state":"同一存活source，第二次后第一次PixelMap仍可读","caseId":"PM_SRC_SEQ_001"}
 * @tc.level Level 1
 * Device ohosTest only. Real Ability context and ImageKit required; never local mock.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    await sourceSequence('PM_SRC_SEQ_001', {
      id: 'pngOdd',
      format: 'image/png',
      width: 17,
      height: 13,
      pattern: 'opaque-color-quadrants'
    }, 1);
  };

export default runExpansionCase;
