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
 * @tc.number EXP_PM_SRC_SEQ_002
 * @tc.name EXP_PM_SRC_SEQ_002
 * @tc.desc PM_SRC_SEQ {"fixture":{"id":"pngAlpha","format":"image/png","width":13,"height":17,"pattern":"alpha-checker","alphaValues":[0,64,128,255]},"sequence":["getImageSourceByFd","decodeByAutoWithParameter","decodeByFormatWithParameter"],"state":"同一存活source，文件保留","caseId":"PM_SRC_SEQ_002"}
 * @tc.level Level 1
 * Device ohosTest only. Real Ability context and ImageKit required; never local mock.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    await sourceSequence('PM_SRC_SEQ_002', {
      id: 'pngAlpha',
      format: 'image/png',
      width: 13,
      height: 17,
      pattern: 'alpha-checker',
      alphaValues: [0,64,128,255]
    }, 2);
  };

export default runExpansionCase;
