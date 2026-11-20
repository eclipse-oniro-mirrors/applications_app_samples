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
import { delayTick } from './shared/AsyncYield';
import { SheetStyle, sheetModeName, toggleSheetStyle, canOpenSheet, heightBucket, heightBucketLabel, sheetStatusText } from '../../../main/ets/model/SheetFlow';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function SheetFlowStatusMatrixPart2Test(): void {
  describe('SheetFlowStatusMatrixPart2', () => {

    /**
     * @tc.number    SUB_ATOMIC_SFSP2_4100
     * @tc.name      testSheetStatus0041
     * @tc.desc      Verify sheetStatusText(false, CENTER, 599).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0041 begin');
      await delayTick();
      expect(sheetStatusText(false, SheetStyle.CENTER, 599)).assertEqual('Closed · CENTER centered style · Medium (300-600vp)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0041 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP2_4200
     * @tc.name      testSheetStatus0042
     * @tc.desc      Verify sheetStatusText(false, CENTER, 600).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0042 begin');
      await delayTick();
      expect(sheetStatusText(false, SheetStyle.CENTER, 600)).assertEqual('Closed · CENTER centered style · High (>= 600vp)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0042 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP2_4300
     * @tc.name      testSheetStatus0043
     * @tc.desc      Verify sheetStatusText(false, POPUP, 0).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0043 begin');
      await delayTick();
      expect(sheetStatusText(false, SheetStyle.POPUP, 0)).assertEqual('Closed · POPUP popup style · Not opened');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0043 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP2_4400
     * @tc.name      testSheetStatus0044
     * @tc.desc      Verify sheetStatusText(false, POPUP, 299).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0044 begin');
      await delayTick();
      expect(sheetStatusText(false, SheetStyle.POPUP, 299)).assertEqual('Closed · POPUP popup style · Low (< 300vp)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0044 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP2_4500
     * @tc.name      testSheetStatus0045
     * @tc.desc      Verify sheetStatusText(false, POPUP, 300).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0045 begin');
      await delayTick();
      expect(sheetStatusText(false, SheetStyle.POPUP, 300)).assertEqual('Closed · POPUP popup style · Medium (300-600vp)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0045 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP2_4600
     * @tc.name      testSheetStatus0046
     * @tc.desc      Verify sheetStatusText(false, POPUP, 599).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0046 begin');
      await delayTick();
      expect(sheetStatusText(false, SheetStyle.POPUP, 599)).assertEqual('Closed · POPUP popup style · Medium (300-600vp)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0046 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_SFSP2_4700
     * @tc.name      testSheetStatus0047
     * @tc.desc      Verify sheetStatusText(false, POPUP, 600).
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetStatus0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0047 begin');
      await delayTick();
      expect(sheetStatusText(false, SheetStyle.POPUP, 600)).assertEqual('Closed · POPUP popup style · High (>= 600vp)');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetStatus0047 end');
    })

  })
}
