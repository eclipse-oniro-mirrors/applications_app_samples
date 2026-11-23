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
// [Start isMocked_sample]
import { beforeEach, describe, expect, it, MockKit, when } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from '../TestPace';

class ClassName {
  count: number = 0;

  method_1(arg: string): string {
    return '888888';
  }
}

export default function isMockedTest(): void {
  describe('isMockedTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await paceTurn();
    });

    /**
     * @tc.number testJsunitMethodMockState0001
     * @tc.name testJsunitMethodMockState0001
     * @tc.desc Check method mock state against actual stub output and clear restoration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitMethodMockState0001', 0, (): void => {
      const mocker: MockKit = new MockKit();
      const claser: ClassName = new ClassName();
      try {
        const mocked: Function = mocker.mockFunc(claser, claser.method_1);
        when(mocked)('test').afterReturn('1');
        const mockedState: boolean = mocker.isMocked(claser, 'method_1');
        hilog.info(0x0000, 'MockState', 'method=method_1 isMocked=%{public}s expected=true', String(mockedState));
        expect(mockedState).assertTrue();
        const mockedResult: string = claser.method_1('test');
        hilog.info(0x0000, 'MockState', 'mocked method_1 input=test result=%{public}s expected=1', mockedResult);
        expect(mockedResult).assertEqual('1');
        mocker.clear(claser);
        const clearedState: boolean = mocker.isMocked(claser, 'method_1');
        hilog.info(0x0000, 'MockState', 'method=method_1 isMocked=%{public}s expected=false', String(clearedState));
        expect(clearedState).assertFalse();
        const restoredResult: string = claser.method_1('test');
        hilog.info(0x0000, 'MockState', 'cleared method_1 input=test result=%{public}s expected=888888',
          restoredResult);
        expect(restoredResult).assertEqual('888888');
      } finally {
        mocker.clear(claser);
      }
    });

    /**
     * @tc.number testJsunitPropertyMockState0002
     * @tc.name testJsunitPropertyMockState0002
     * @tc.desc Check property mock state against its value and selective restoration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitPropertyMockState0002', 0, (): void => {
      const mocker: MockKit = new MockKit();
      const claser: ClassName = new ClassName();
      try {
        mocker.mockProperty(claser, 'count', 999);
        const mockedState: boolean = mocker.isMocked(claser, 'count');
        hilog.info(0x0000, 'MockState', 'property=count isMocked=%{public}s expected=true', String(mockedState));
        expect(mockedState).assertTrue();
        hilog.info(0x0000, 'MockState', 'mocked count=%{public}d expected=999', claser.count);
        expect(claser.count).assertEqual(999);
        mocker.ignoreMock(claser, 'count');
        const restoredState: boolean = mocker.isMocked(claser, 'count');
        hilog.info(0x0000, 'MockState', 'property=count isMocked=%{public}s expected=false', String(restoredState));
        expect(restoredState).assertFalse();
        hilog.info(0x0000, 'MockState', 'restored count=%{public}d expected=0', claser.count);
        expect(claser.count).assertEqual(0);
      } finally {
        mocker.clear(claser);
      }
    });
  });
}
// [End isMocked_sample]
