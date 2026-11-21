/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { logInfo, BUNDLE } from '../common/ResolutionTestSupport';
import {
  xComponentSizeText,
} from '../model/ResolutionLogic';

/** XComponentSizeTest logic checks (46 cases). */
export default function xComponentSizeTest(): void {
  describe('XComponentSizeTest', (): void => {
    /**
     * @tc.number    SUB_MORE_RESOLUTION_XCOMPONENT_SIZE_0001
     * @tc.name      Resolution_XComponentSize_0001
     * @tc.desc      xComponentSize(true,50000012,720,1280,0,0,0,1) resolves to 720x1280.00016.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Resolution_XComponentSize_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
