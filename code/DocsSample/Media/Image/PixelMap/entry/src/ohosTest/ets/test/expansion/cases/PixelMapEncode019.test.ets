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
import { encodeCase } from '../fixtures/PixelMapFixtures';
/**
 * @tc.number EXP_PM_ENCODE_019
 * @tc.name EXP_PM_ENCODE_019
 * @tc.desc PM_ENCODE {"method":"encodeToStreamByImageSource","isHdr":true,"fixture":{"id":"png1","format":"image/png","width":1,"height":1,"pattern":"solid","rgba":[32,96,160,255]},"inputType":"ImageSource","outputFile":"pixel_map.jpg","state":"清空目标、保留输入至真正完成、共享packer串行","caseId":"PM_ENCODE_019"}
 * @tc.level Level 1
 * Device ohosTest only. Real Ability context and ImageKit required; never local mock.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    await encodeCase('PM_ENCODE_019', {
      id: 'png1',
      format: 'image/png',
      width: 1,
      height: 1,
      pattern: 'solid',
      rgba: [32,96,160,255]
    }, 'encodeToStreamByImageSource', true);
  };

export default runExpansionCase;
