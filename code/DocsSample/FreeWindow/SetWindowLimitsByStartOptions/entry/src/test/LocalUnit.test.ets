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
import { StartOptions } from '@kit.AbilityKit';

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
     * 校验StartOptions窗口尺寸限制参数构造
     */
    it('StartOptions_limit_param_001', 0, () => {
      const options: StartOptions = {
        displayId: 0,
        minWindowWidth: 600,
        minWindowHeight: 500,
        maxWindowWidth: 1500,
        maxWindowHeight: 1000
      };
      expect(options.minWindowWidth).assertEqual(600);
      expect(options.minWindowHeight).assertEqual(500);
      expect(options.maxWindowWidth).assertEqual(1500);
      expect(options.maxWindowHeight).assertEqual(1000);
    });
  });
}
