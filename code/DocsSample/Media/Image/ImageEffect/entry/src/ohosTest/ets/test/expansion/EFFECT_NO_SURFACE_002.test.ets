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
 * @tc.number EXP_EFFECT_NO_SURFACE_002
 * @tc.name EXP_EFFECT_NO_SURFACE_002
 * @tc.desc 未创建surface时合法Start/Stop保护分支; {"method": "SurfaceFilterStop", "args": [], "state": "新测试进程、没有调用getSurfaceId", "caseId": "EFFECT_NO_SURFACE_002"}
 * @tc.level Level 1
 * Prerequisite: real HarmonyOS device; serial native calls, no concurrent UI/surface creation.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    // Prerequisite: dedicated fresh test process; never call getSurfaceId or open the camera UI.
    const result: boolean = ImageEffect.SurfaceFilterStop();
    expect(result).assertFalse();
  };

export default runExpansionCase;
