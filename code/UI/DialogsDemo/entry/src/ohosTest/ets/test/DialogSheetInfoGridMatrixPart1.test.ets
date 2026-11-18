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

export default function DialogSheetInfoGridMatrixPart1Test(): void {
  describe('DialogSheetInfoGridMatrixPart1', () => {

    /**
     * @tc.number    SUB_DIALOGS_SHTP1_0100
     * @tc.name      testSheetEmpty0001
     * @tc.desc      Verify empty labels yield no sheet info.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetEmpty0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetEmpty0001 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos([], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(0);
      expect(picked).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetEmpty0001 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SHTP1_0200
     * @tc.name      testSheetPick0002
     * @tc.desc      Verify sheet pick 0 of 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetPick0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0002 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['item-0'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(1);
      expect(sheets[0].title).assertEqual('item-0');
      sheets[0].action!();
      expect(picked).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0002 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SHTP1_0300
     * @tc.name      testSheetPick0003
     * @tc.desc      Verify sheet pick 0 of 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetPick0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0003 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['item-0', 'item-1'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(2);
      expect(sheets[0].title).assertEqual('item-0');
      sheets[0].action!();
      expect(picked).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0003 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SHTP1_0400
     * @tc.name      testSheetPick0004
     * @tc.desc      Verify sheet pick 1 of 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetPick0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0004 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['item-0', 'item-1'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(2);
      expect(sheets[1].title).assertEqual('item-1');
      sheets[1].action!();
      expect(picked).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0004 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SHTP1_0500
     * @tc.name      testSheetPick0005
     * @tc.desc      Verify sheet pick 0 of 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetPick0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0005 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['item-0', 'item-1', 'item-2'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(3);
      expect(sheets[0].title).assertEqual('item-0');
      sheets[0].action!();
      expect(picked).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0005 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SHTP1_0600
     * @tc.name      testSheetPick0006
     * @tc.desc      Verify sheet pick 1 of 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetPick0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0006 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['item-0', 'item-1', 'item-2'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(3);
      expect(sheets[1].title).assertEqual('item-1');
      sheets[1].action!();
      expect(picked).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0006 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SHTP1_0700
     * @tc.name      testSheetPick0007
     * @tc.desc      Verify sheet pick 2 of 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetPick0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0007 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['item-0', 'item-1', 'item-2'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(3);
      expect(sheets[2].title).assertEqual('item-2');
      sheets[2].action!();
      expect(picked).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0007 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SHTP1_0800
     * @tc.name      testSheetPick0008
     * @tc.desc      Verify sheet pick 0 of 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetPick0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0008 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['item-0', 'item-1', 'item-2', 'item-3', 'item-4'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(5);
      expect(sheets[0].title).assertEqual('item-0');
      sheets[0].action!();
      expect(picked).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0008 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SHTP1_0900
     * @tc.name      testSheetPick0009
     * @tc.desc      Verify sheet pick 2 of 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetPick0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0009 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['item-0', 'item-1', 'item-2', 'item-3', 'item-4'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(5);
      expect(sheets[2].title).assertEqual('item-2');
      sheets[2].action!();
      expect(picked).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0009 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SHTP1_1000
     * @tc.name      testSheetPick0010
     * @tc.desc      Verify sheet pick 4 of 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetPick0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0010 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['item-0', 'item-1', 'item-2', 'item-3', 'item-4'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(5);
      expect(sheets[4].title).assertEqual('item-4');
      sheets[4].action!();
      expect(picked).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0010 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SHTP1_1100
     * @tc.name      testSheetPick0011
     * @tc.desc      Verify sheet pick 0 of 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetPick0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0011 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['item-0', 'item-1', 'item-2', 'item-3', 'item-4', 'item-5', 'item-6', 'item-7'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(8);
      expect(sheets[0].title).assertEqual('item-0');
      sheets[0].action!();
      expect(picked).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0011 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SHTP1_1200
     * @tc.name      testSheetPick0012
     * @tc.desc      Verify sheet pick 4 of 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetPick0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0012 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['item-0', 'item-1', 'item-2', 'item-3', 'item-4', 'item-5', 'item-6', 'item-7'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(8);
      expect(sheets[4].title).assertEqual('item-4');
      sheets[4].action!();
      expect(picked).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0012 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SHTP1_1300
     * @tc.name      testSheetPick0013
     * @tc.desc      Verify sheet pick 7 of 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetPick0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0013 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['item-0', 'item-1', 'item-2', 'item-3', 'item-4', 'item-5', 'item-6', 'item-7'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(8);
      expect(sheets[7].title).assertEqual('item-7');
      sheets[7].action!();
      expect(picked).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0013 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SHTP1_1400
     * @tc.name      testSheetPick0014
     * @tc.desc      Verify sheet pick 0 of 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetPick0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0014 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['item-0', 'item-1', 'item-2', 'item-3', 'item-4', 'item-5', 'item-6', 'item-7', 'item-8', 'item-9', 'item-10', 'item-11'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(12);
      expect(sheets[0].title).assertEqual('item-0');
      sheets[0].action!();
      expect(picked).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0014 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SHTP1_1500
     * @tc.name      testSheetPick0015
     * @tc.desc      Verify sheet pick 6 of 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetPick0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0015 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['item-0', 'item-1', 'item-2', 'item-3', 'item-4', 'item-5', 'item-6', 'item-7', 'item-8', 'item-9', 'item-10', 'item-11'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(12);
      expect(sheets[6].title).assertEqual('item-6');
      sheets[6].action!();
      expect(picked).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0015 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SHTP1_1600
     * @tc.name      testSheetPick0016
     * @tc.desc      Verify sheet pick 11 of 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetPick0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0016 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['item-0', 'item-1', 'item-2', 'item-3', 'item-4', 'item-5', 'item-6', 'item-7', 'item-8', 'item-9', 'item-10', 'item-11'], (index: number) => { picked = index; });
      expect(sheets.length).assertEqual(12);
      expect(sheets[11].title).assertEqual('item-11');
      sheets[11].action!();
      expect(picked).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetPick0016 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SHTP1_1700
     * @tc.name      testSheetTitles0017
     * @tc.desc      Verify sheet titles and repeated action for '确定|取消'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetTitles0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetTitles0017 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['确定', '取消'], (index: number) => { picked = index; });
      expect(sheets.map((item: SheetInfo) => item.title).join("|")).assertEqual('确定|取消');
      sheets[0].action!();
      sheets[0].action!();
      expect(picked).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetTitles0017 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SHTP1_1800
     * @tc.name      testSheetTitles0018
     * @tc.desc      Verify sheet titles and repeated action for 'Alpha|Beta|Gamma'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetTitles0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetTitles0018 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['Alpha', 'Beta', 'Gamma'], (index: number) => { picked = index; });
      expect(sheets.map((item: SheetInfo) => item.title).join("|")).assertEqual('Alpha|Beta|Gamma');
      sheets[0].action!();
      sheets[0].action!();
      expect(picked).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetTitles0018 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_SHTP1_1900
     * @tc.name      testSheetTitles0019
     * @tc.desc      Verify sheet titles and repeated action for 'a b|#tag|'.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSheetTitles0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetTitles0019 begin');
      await delayTick();
      let picked: number = -1;
      const sheets: SheetInfo[] = buildSheetInfos(['a b', '#tag', ''], (index: number) => { picked = index; });
      expect(sheets.map((item: SheetInfo) => item.title).join("|")).assertEqual('a b|#tag|');
      sheets[0].action!();
      sheets[0].action!();
      expect(picked).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSheetTitles0019 end');
    })

  })
}
