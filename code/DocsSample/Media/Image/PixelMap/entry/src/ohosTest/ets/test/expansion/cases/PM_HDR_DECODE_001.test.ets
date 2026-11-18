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
import { hdrDecode } from '../fixtures/PixelMapFixtures';
/**
 * @tc.number EXP_PM_HDR_DECODE_001
 * @tc.name EXP_PM_HDR_DECODE_001
 * @tc.desc PM_HDR_DECODE {"method":"decodeByFormatWithParameter","fixture":"existing app.media.CUVAHdr","sourceFactory":"真实生产Ability ResourceManager.getMediaContent创建source","reference":"同源公共SDK用相同解码选项","caseId":"PM_HDR_DECODE_001","expectedSize":[270,180]}
 * @tc.level Level 1
 * Device ohosTest only. Real Ability context and ImageKit required; never local mock.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    await hdrDecode(true);
  };

export default runExpansionCase;
