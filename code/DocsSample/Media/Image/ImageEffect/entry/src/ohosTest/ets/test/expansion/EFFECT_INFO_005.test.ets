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
import { assertFilterInfo } from './fixtures/ImageEffectAssertions';

/**
 * @tc.number EXP_EFFECT_INFO_005
 * @tc.name EXP_EFFECT_INFO_005
 * @tc.desc 五种已注册滤镜信息的真实字符串契约; {"name": "CustomCrop", "expectedPrefix": "name:CustomCrop, ", "customExact": "name:CustomCrop, supportedBufferType: {Pixel }supportedFormat: {RGBA8888 }", "caseId": "EFFECT_INFO_005"}
 * @tc.level Level 1
 * Prerequisite: real HarmonyOS device; serial native calls, no concurrent UI/surface creation.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const info: string = ImageEffect.lookupFilterInfo('CustomCrop');
    assertFilterInfo(info, 'CustomCrop');
    expect(info).assertEqual('name:CustomCrop, supportedBufferType: {Pixel }supportedFormat: {RGBA8888 }');
  };

export default runExpansionCase;
