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

// [Start order1_sta_sample]
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
export default function exampleTest(): void {

  describe('order1_sample', (): void => {
    let testNumA: number = 1;
    let testNumB: number = 1;

    beforeAll(() => {
      testNumA++;
    })

    beforeEach(() => {
      testNumA++;
      testNumB++;
    })

    afterEach(() => {
      testNumA++;
    })

    afterAll(() => {
      let expectValue: number = 5;
      expect(testNumA).assertEqual(expectValue);
    })

    it('testExampleA', Level.LEVEL1, () => {
      let expectA: number = 3;
      let expectB: number = 2;
      expect(testNumA).assertEqual(expectA);
      expect(testNumB).assertEqual(expectB);
    })

    it('testExampleB', Level.LEVEL1, () => {
      let expectA: number = 5;
      let expectB: number = 3;
      expect(testNumA).assertEqual(expectA);
      expect(testNumB).assertEqual(expectB);
    })
  })
}

// [End order1_sta_sample]