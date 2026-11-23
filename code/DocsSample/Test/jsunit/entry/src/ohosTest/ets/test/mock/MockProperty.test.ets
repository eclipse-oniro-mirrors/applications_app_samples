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
// [Start mockProperty_sample]
import { beforeEach, describe, expect, it, MockKit } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from '../TestPace';

class ClassName {
  data: number = 1;
  private priData: number = 2;

  method(): number {
    return this.priData;
  }
}

export default function staticTest(): void {
  describe('propertyTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitMockProperty0001
     * @tc.name testJsunitMockProperty0001
     * @tc.desc Mock public and private fields and restore each independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitMockProperty0001', 0, (): void => {
      const mocker: MockKit = new MockKit();
      const claser: ClassName = new ClassName();
      const originalValues: number[] = [claser.data, claser.method()];
      hilog.info(0x0000, 'MockProperty', 'original public/private results=%{public}s expected=[1,2]',
        JSON.stringify(originalValues));
      expect(originalValues).assertDeepEquals([1, 2]);
      try {
        mocker.mockProperty(claser, 'data', 3);
        mocker.mockProperty(claser, 'priData', 4);
        hilog.info(0x0000, 'MockProperty', 'mocked data=%{public}d expected=3', claser.data);
        expect(claser.data).assertEqual(3);
        const privateResult: number = claser.method();
        hilog.info(0x0000, 'MockProperty', 'mocked private result=%{public}d expected=4', privateResult);
        expect(privateResult).assertEqual(4);
        mocker.ignoreMock(claser, 'data');
        const publicRestoredValues: number[] = [claser.data, claser.method()];
        hilog.info(0x0000, 'MockProperty', 'public restored/private mocked results=%{public}s expected=[1,4]',
          JSON.stringify(publicRestoredValues));
        expect(publicRestoredValues).assertDeepEquals([1, 4]);
        mocker.ignoreMock(claser, 'priData');
        const restoredValues: number[] = [claser.data, claser.method()];
        hilog.info(0x0000, 'MockProperty', 'restored public/private results=%{public}s expected=[1,2]',
          JSON.stringify(restoredValues));
        expect(restoredValues).assertDeepEquals([1, 2]);
      } finally {
        mocker.clear(claser);
      }
    });
  });
}
// [End mockProperty_sample]
