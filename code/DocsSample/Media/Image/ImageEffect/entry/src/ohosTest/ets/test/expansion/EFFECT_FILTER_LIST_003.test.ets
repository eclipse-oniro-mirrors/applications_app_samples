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
import ImageEffect from 'libentry.so';
import { assertFilterList } from './fixtures/ImageEffectAssertions';

/**
 * @tc.number EXP_EFFECT_FILTER_LIST_003
 * @tc.name EXP_EFFECT_FILTER_LIST_003
 * @tc.desc UI三个真实Format查询键和列表一致性; {"key": "Format:nv12", "customExpected": [], "caseId": "EFFECT_FILTER_LIST_003"}
 * @tc.level Level 1
 * Use a physical test device. Call native APIs serially; do not create UI or render targets concurrently.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const list: string = ImageEffect.lookupFilters('Format:nv12');
    assertFilterList(list, false);
  };

export default runExpansionCase;
