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
import { ImageUtils } from '../../../../main/ets/utils/ImageUtils';

/**
 * @tc.number EXP_EFFECT_IMAGEUTILS_001
 * @tc.name EXP_EFFECT_IMAGEUTILS_001
 * @tc.desc ImageUtils真实单例/路径/资源解码接缝; {"method": "getInstance", "state": "同进程取两次", "expected": "引用全等", "caseId": "EFFECT_IMAGEUTILS_001"}
 * @tc.level Level 1
 * Prerequisite: real HarmonyOS device; serial native calls, no concurrent UI/surface creation.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const first = ImageUtils.getInstance();
    const second = ImageUtils.getInstance();
    expect(first).assertEqual(second);
  };

export default runExpansionCase;
