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

/**
 * @tc.number EXP_EFFECT_BUFFER_003
 * @tc.name EXP_EFFECT_BUFFER_003
 * @tc.desc NativeBuffer路径合法滤镜和有序链有限返回; {"filterOptions": [["Brightness", 100]], "nativeBufferConfig": {"width": 256, "height": 256, "format": "RGBA_8888", "usage": "ALIGNMENT_512"}, "caseId": "EFFECT_BUFFER_003"}
 * @tc.level Level 1
 * Prerequisite: real HarmonyOS device; serial native calls, no concurrent UI/surface creation.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const options: (string | number)[][] = [['Brightness', 100]];
    const result: boolean = ImageEffect.NativeBufferFilterStart(options);
    expect(result).assertTrue();
  };

export default runExpansionCase;
