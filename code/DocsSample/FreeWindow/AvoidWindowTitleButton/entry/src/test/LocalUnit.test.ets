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
     * 校验标题栏三键控制按钮矩形区域参数构造
     */
    it('TitleButtonRect_param_001', 0, () => {
      const titleButtonRect: window.TitleButtonRect = {
        right: 20,
        top: 0,
        width: 50,
        height: 24
      };
      expect(titleButtonRect.right).assertEqual(20);
      expect(titleButtonRect.top).assertEqual(0);
      expect(titleButtonRect.width).assertEqual(50);
      expect(titleButtonRect.height).assertEqual(24);
    });
  });
}
