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
import { decodeCase } from '../fixtures/PixelMapFixtures';
/**
 * @tc.number EXP_PM_DECODE_011
 * @tc.name EXP_PM_DECODE_011
 * @tc.desc PM_DECODE {"method":"decodeByAutoWithParameter","fixture":{"id":"png1","format":"image/png","width":1,"height":1,"pattern":"solid","rgba":[32,96,160,255]},"sourceFactory":"测试ImageKit从完整合法buffer创建存活ImageSource","inputDynamicRange":"SDR","caseId":"PM_DECODE_011"}
 * @tc.level Level 1
 * Device ohosTest only. Real Ability context and ImageKit required; never local mock.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    await decodeCase({
      id: 'png1',
      format: 'image/png',
      width: 1,
      height: 1,
      pattern: 'solid',
      rgba: [32,96,160,255]
    }, false);
  };

export default runExpansionCase;
