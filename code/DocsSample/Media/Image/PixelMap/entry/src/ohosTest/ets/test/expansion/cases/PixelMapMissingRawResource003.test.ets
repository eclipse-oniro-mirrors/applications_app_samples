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
import { rawMissing } from '../fixtures/PixelMapFixtures';
/**
 * @tc.number EXP_PM_RAW_MISSING_003
 * @tc.name EXP_PM_RAW_MISSING_003
 * @tc.desc PM_RAW_MISSING {"method":"getImageSourceByRawFileDescriptor","fileName":"media_catalog_missing.jpg","state":"确认资源不存在","caseId":"PM_RAW_MISSING_003"}
 * @tc.level Level 1
 * Device ohosTest only. Real Ability context and ImageKit required; never local mock.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    await rawMissing('getImageSourceByRawFileDescriptor', 'media_catalog_missing.jpg');
  };

export default runExpansionCase;
