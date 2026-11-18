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
import { rawCase } from '../fixtures/PixelMapFixtures';
/**
 * @tc.number EXP_PM_RAW_002
 * @tc.name EXP_PM_RAW_002
 * @tc.desc PM_RAW {"method":"getImageSourceByRawFileDescriptor","fileName":"test.jpg","fixture":"existing entry/src/main/resources/rawfile/test.jpg","reference":"真实生产Ability上下文ResourceManager读取同一资源后独立SDK解码","caseId":"PM_RAW_002","expectedSize":[700,700]}
 * @tc.level Level 1
 * Device ohosTest only. Real Ability context and ImageKit required; never local mock.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    await rawCase('getImageSourceByRawFileDescriptor');
  };

export default runExpansionCase;
