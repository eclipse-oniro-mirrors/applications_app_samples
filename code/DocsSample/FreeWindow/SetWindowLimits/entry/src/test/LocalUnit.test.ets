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
import { window } from '@kit.ArkUI';

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
     * 校验WindowLimits窗口尺寸限制参数构造
     */
    it('WindowLimits_param_001', 0, () => {
      const windowLimits: window.WindowLimits = {
        maxWidth: 1500,
        maxHeight: 1000,
        minWidth: 600,
        minHeight: 500
      };
      expect(windowLimits.maxWidth).assertEqual(1500);
      expect(windowLimits.maxHeight).assertEqual(1000);
      expect(windowLimits.minWidth).assertEqual(600);
      expect(windowLimits.minHeight).assertEqual(500);
    });
  });
}
