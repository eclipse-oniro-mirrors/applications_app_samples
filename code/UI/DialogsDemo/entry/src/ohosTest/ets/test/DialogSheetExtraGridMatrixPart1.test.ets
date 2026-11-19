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
import { buildSheetInfos } from '../../../main/ets/model/DialogModels';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_DialogsDemo]';

export default function DialogSheetExtraGridMatrixPart1Test(): void {
  describe('DialogSheetExtraGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_DIALOGS_DSXP1_0100
     * @tc.name      testSheetExtra0001
     * @tc.desc      Verify sheet 4 labels pick 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetExtra0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0001 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['option-0', 'option-1', 'option-2', 'option-3'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(4);
      expect(sheets[0].title).assertEqual('option-0');
      sheets[0].action!();
      expect(picked).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0001 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DSXP1_0200
     * @tc.name      testSheetExtra0002
     * @tc.desc      Verify sheet 4 labels pick 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetExtra0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0002 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['option-0', 'option-1', 'option-2', 'option-3'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(4);
      expect(sheets[2].title).assertEqual('option-2');
      sheets[2].action!();
      expect(picked).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0002 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DSXP1_0300
     * @tc.name      testSheetExtra0003
     * @tc.desc      Verify sheet 4 labels pick 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetExtra0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0003 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['option-0', 'option-1', 'option-2', 'option-3'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(4);
      expect(sheets[3].title).assertEqual('option-3');
      sheets[3].action!();
      expect(picked).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0003 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DSXP1_0400
     * @tc.name      testSheetExtra0004
     * @tc.desc      Verify sheet 6 labels pick 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetExtra0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0004 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['option-0', 'option-1', 'option-2', 'option-3', 'option-4', 'option-5'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(6);
      expect(sheets[0].title).assertEqual('option-0');
      sheets[0].action!();
      expect(picked).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0004 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DSXP1_0500
     * @tc.name      testSheetExtra0005
     * @tc.desc      Verify sheet 6 labels pick 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetExtra0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0005 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['option-0', 'option-1', 'option-2', 'option-3', 'option-4', 'option-5'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(6);
      expect(sheets[3].title).assertEqual('option-3');
      sheets[3].action!();
      expect(picked).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0005 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DSXP1_0600
     * @tc.name      testSheetExtra0006
     * @tc.desc      Verify sheet 6 labels pick 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetExtra0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0006 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['option-0', 'option-1', 'option-2', 'option-3', 'option-4', 'option-5'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(6);
      expect(sheets[5].title).assertEqual('option-5');
      sheets[5].action!();
      expect(picked).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0006 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DSXP1_0700
     * @tc.name      testSheetExtra0007
     * @tc.desc      Verify sheet 10 labels pick 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetExtra0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0007 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['option-0', 'option-1', 'option-2', 'option-3', 'option-4', 'option-5', 'option-6', 'option-7', 'option-8', 'option-9'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(10);
      expect(sheets[0].title).assertEqual('option-0');
      sheets[0].action!();
      expect(picked).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0007 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DSXP1_0800
     * @tc.name      testSheetExtra0008
     * @tc.desc      Verify sheet 10 labels pick 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetExtra0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0008 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['option-0', 'option-1', 'option-2', 'option-3', 'option-4', 'option-5', 'option-6', 'option-7', 'option-8', 'option-9'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(10);
      expect(sheets[5].title).assertEqual('option-5');
      sheets[5].action!();
      expect(picked).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0008 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DSXP1_0900
     * @tc.name      testSheetExtra0009
     * @tc.desc      Verify sheet 10 labels pick 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetExtra0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0009 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['option-0', 'option-1', 'option-2', 'option-3', 'option-4', 'option-5', 'option-6', 'option-7', 'option-8', 'option-9'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(10);
      expect(sheets[9].title).assertEqual('option-9');
      sheets[9].action!();
      expect(picked).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0009 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DSXP1_1000
     * @tc.name      testSheetExtra0010
     * @tc.desc      Verify sheet 15 labels pick 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetExtra0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0010 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['option-0', 'option-1', 'option-2', 'option-3', 'option-4', 'option-5', 'option-6', 'option-7', 'option-8', 'option-9', 'option-10', 'option-11', 'option-12', 'option-13', 'option-14'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(15);
      expect(sheets[0].title).assertEqual('option-0');
      sheets[0].action!();
      expect(picked).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0010 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DSXP1_1100
     * @tc.name      testSheetExtra0011
     * @tc.desc      Verify sheet 15 labels pick 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetExtra0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0011 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['option-0', 'option-1', 'option-2', 'option-3', 'option-4', 'option-5', 'option-6', 'option-7', 'option-8', 'option-9', 'option-10', 'option-11', 'option-12', 'option-13', 'option-14'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(15);
      expect(sheets[7].title).assertEqual('option-7');
      sheets[7].action!();
      expect(picked).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0011 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DSXP1_1200
     * @tc.name      testSheetExtra0012
     * @tc.desc      Verify sheet 15 labels pick 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetExtra0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0012 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['option-0', 'option-1', 'option-2', 'option-3', 'option-4', 'option-5', 'option-6', 'option-7', 'option-8', 'option-9', 'option-10', 'option-11', 'option-12', 'option-13', 'option-14'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(15);
      expect(sheets[14].title).assertEqual('option-14');
      sheets[14].action!();
      expect(picked).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0012 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DSXP1_1300
     * @tc.name      testSheetExtra0013
     * @tc.desc      Verify sheet 20 labels pick 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetExtra0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0013 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['option-0', 'option-1', 'option-2', 'option-3', 'option-4', 'option-5', 'option-6', 'option-7', 'option-8', 'option-9', 'option-10', 'option-11', 'option-12', 'option-13', 'option-14', 'option-15', 'option-16', 'option-17', 'option-18', 'option-19'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(20);
      expect(sheets[0].title).assertEqual('option-0');
      sheets[0].action!();
      expect(picked).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0013 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DSXP1_1400
     * @tc.name      testSheetExtra0014
     * @tc.desc      Verify sheet 20 labels pick 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetExtra0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0014 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['option-0', 'option-1', 'option-2', 'option-3', 'option-4', 'option-5', 'option-6', 'option-7', 'option-8', 'option-9', 'option-10', 'option-11', 'option-12', 'option-13', 'option-14', 'option-15', 'option-16', 'option-17', 'option-18', 'option-19'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(20);
      expect(sheets[10].title).assertEqual('option-10');
      sheets[10].action!();
      expect(picked).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0014 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DSXP1_1500
     * @tc.name      testSheetExtra0015
     * @tc.desc      Verify sheet 20 labels pick 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetExtra0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0015 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['option-0', 'option-1', 'option-2', 'option-3', 'option-4', 'option-5', 'option-6', 'option-7', 'option-8', 'option-9', 'option-10', 'option-11', 'option-12', 'option-13', 'option-14', 'option-15', 'option-16', 'option-17', 'option-18', 'option-19'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(20);
      expect(sheets[19].title).assertEqual('option-19');
      sheets[19].action!();
      expect(picked).assertEqual(19);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetExtra0015 end');
    })

  })
}
