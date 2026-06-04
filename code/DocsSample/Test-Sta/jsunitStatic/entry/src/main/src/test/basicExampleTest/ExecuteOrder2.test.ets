'use static';
/**
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

// [Start order2_sta_sample]
import { afterItSpecified, beforeItSpecified, describe, expect, it, Level } from '../../../../hypium/index';
export default function exampleTest(): void {

  describe('order2_sample', (): void => {
    let testNumA: number = 1;
    let testNumB: number = 1;

    beforeItSpecified(['testExampleB'], (): void => {
      testNumB++;
    })
    afterItSpecified(['testExampleA'], (): void => {
      testNumA++;
    })

    it('testExampleA', Level.LEVEL1, async (): Promise<void> => {
      expect(testNumA).assertEqual(1);
      expect(testNumB).assertEqual(1);
    })

    it('testExampleB', Level.LEVEL1, async (): Promise<void> => {
      expect(testNumA).assertEqual(2);
      expect(testNumB).assertEqual(2);
    })
  })
}

// [End order2_sta_sample]