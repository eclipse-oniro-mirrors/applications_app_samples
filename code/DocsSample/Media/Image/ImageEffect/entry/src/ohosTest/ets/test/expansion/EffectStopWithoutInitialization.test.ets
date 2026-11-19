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
 * @tc.number EXP_EFFECT_NO_RENDER_TARGET_002
 * @tc.name EXP_EFFECT_NO_RENDER_TARGET_002
 * @tc.desc 新测试进程中，原生滤镜实例未初始化；不传参数调用停止接口，应返回 false。
 * @tc.level Level 1
 * Use a physical test device. Call native APIs serially; do not create UI or render targets concurrently.
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    // Use a dedicated fresh test process. Do not initialize the render target or open the camera UI.
    const result: boolean = ImageEffect.SurfaceFilterStop();
    expect(result).assertFalse();
  };

export default runExpansionCase;
