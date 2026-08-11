/**
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function localUnitTest() {
  describe('localUnitTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
    /**
     * 校验module.json5静态配置的窗口尺寸限制参数
     */
    it('ModuleJson5_limit_param_001', 0, () => {
      // 与entry/src/main/module.json5中abilities标签下声明的窗口尺寸限制字段保持一致
      const minWindowWidth = 400;
      const maxWindowWidth = 2560;
      const minWindowHeight = 200;
      const maxWindowHeight = 1300;
      const minWindowRatio = 0.5;
      const maxWindowRatio = 3.5;
      // 窗口最小宽高、最小宽高比均不大于对应的最大值
      expect(minWindowWidth < maxWindowWidth).assertTrue();
      expect(minWindowHeight < maxWindowHeight).assertTrue();
      expect(minWindowRatio < maxWindowRatio).assertTrue();
    });
  });
}
