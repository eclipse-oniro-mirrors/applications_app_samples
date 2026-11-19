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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { GlobalContext } from '../../../main/ets/common/utils/GlobalContext';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF812;
const TAG: string = '[Sample_PhotoSameSource]';



export default function GlobalContextExtendPart1Test(): void {
  describe('GlobalContextExtendPart1', () => {

    /**
     * @tc.number    SUB_PHOTO_GCEP1_0100
     * @tc.name      testApplyLatestAction0001
     * @tc.desc      Verify apply runs the most recently stored action.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testApplyLatestAction0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApplyLatestAction0001 begin');
      let first: number = 0;
      let second: number = 0;
      const actionA: Object = (() => { first += 1; }) as Object;
      const actionB: Object = (() => { second += 2; }) as Object;
      GlobalContext.get().setObject('photoTest.latest', actionA);
      GlobalContext.get().setObject('photoTest.latest', actionB);
      GlobalContext.get().apply('photoTest.latest');
      expect(first).assertEqual(0);
      expect(second).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApplyLatestAction0001 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCEP1_0200
     * @tc.name      testApplyAfterOverwrite0002
     * @tc.desc      Verify apply uses the replacement action after overwrite.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testApplyAfterOverwrite0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApplyAfterOverwrite0002 begin');
      let total: number = 0;
      const addOne: Object = (() => { total += 1; }) as Object;
      GlobalContext.get().setObject('photoTest.overwriteAction', addOne);
      GlobalContext.get().apply('photoTest.overwriteAction');
      expect(total).assertEqual(1);
      const addTen: Object = (() => { total += 10; }) as Object;
      GlobalContext.get().setObject('photoTest.overwriteAction', addTen);
      GlobalContext.get().apply('photoTest.overwriteAction');
      expect(total).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testApplyAfterOverwrite0002 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCEP1_0300
     * @tc.name      testKeyTypeReuse0003
     * @tc.desc      Verify a key can be reused with a different primitive type.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testKeyTypeReuse0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTypeReuse0003 begin');
      GlobalContext.get().setObject('photoTest.reuse', 'text');
      GlobalContext.get().setObject('photoTest.reuse', 5);
      expect(GlobalContext.get().getT<number>('photoTest.reuse')).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyTypeReuse0003 end');
    })

    /**
     * @tc.number    SUB_PHOTO_GCEP1_0400
     * @tc.name      testContextInitiallyUndefined0004
     * @tc.desc      Verify no camera setting context is set before launch.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextInitiallyUndefined0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextInitiallyUndefined0004 begin');
      expect(GlobalContext.get().getCameraSettingContext() === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testContextInitiallyUndefined0004 end');
    })

  })
}
