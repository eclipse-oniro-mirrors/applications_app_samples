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
import { encodeSequence } from '../fixtures/PixelMapFixtures';
/**
 * @tc.number EXP_PM_ENCODE_SEQ_003
 * @tc.name EXP_PM_ENCODE_SEQ_003
 * @tc.desc PM_ENCODE_SEQ {"sequence":[{"method":"encodeToStreamByPixelMap","isHdr":true,"fixture":{"id":"pngOdd","format":"image/png","width":17,"height":13,"pattern":"opaque-color-quadrants"}},{"method":"encodeToFileByImageSource","isHdr":false,"fixture":{"id":"pngGradient","format":"image/png","width":33,"height":19,"pattern":"rgba-gradient"}}],"state":"第一张17x13，等待完整后第二张33x19；记录各入口输出路径","caseId":"PM_ENCODE_SEQ_003"}
 * @tc.level Level 1
 * Device ohosTest only. Real Ability context and ImageKit required; never local mock.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    await encodeSequence('PM_ENCODE_SEQ_003', {
      id: 'pngOdd',
      format: 'image/png',
      width: 17,
      height: 13,
      pattern: 'opaque-color-quadrants'
    }, 'encodeToStreamByPixelMap', true, {
      id: 'pngGradient',
      format: 'image/png',
      width: 33,
      height: 19,
      pattern: 'rgba-gradient'
    }, 'encodeToFileByImageSource', false);
  };

export default runExpansionCase;
