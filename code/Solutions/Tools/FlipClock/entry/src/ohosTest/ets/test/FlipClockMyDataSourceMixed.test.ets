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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { MyDataSource } from '../../../main/ets/common/DataSource';
import { tabArray } from '../../../main/ets/mock/TabData';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function flipClockMyDataSourceMixedTest() {
  describe('FlipClockMyDataSourceMixedTest', () => {

    /**
     * @tc.name   testFlipClockMyMixed0001
     * @tc.number SUB_FLIP_CLOCK_MORE2_MYMIX_0001
     * @tc.desc   Verify MyDataSource mixed operation 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyMixed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyMixed0001 begin');
      const source: MyDataSource = new MyDataSource([]);
      source.replaceData(tabArray.slice());
        source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(3);');
      expect(source.totalCount()).assertEqual(3);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(1);');
        expect(source.getData(0).num).assertEqual(1);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyMixed0001 end');
    })

    /**
     * @tc.name   testFlipClockMyMixed0002
     * @tc.number SUB_FLIP_CLOCK_MORE2_MYMIX_0002
     * @tc.desc   Verify MyDataSource mixed operation 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyMixed0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyMixed0002 begin');
      const source: MyDataSource = new MyDataSource([]);
      source.pushData(tabArray[0]);
        source.replaceData([]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(0);');
      expect(source.totalCount()).assertEqual(0);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(-1);');
        expect(source.getData(0).num).assertEqual(-1);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyMixed0002 end');
    })

    /**
     * @tc.name   testFlipClockMyMixed0003
     * @tc.number SUB_FLIP_CLOCK_MORE2_MYMIX_0003
     * @tc.desc   Verify MyDataSource mixed operation 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyMixed0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyMixed0003 begin');
      const source: MyDataSource = new MyDataSource([]);
      source.pushData(tabArray[0]);
        source.deleteData(0);
        source.pushData(tabArray[2]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1);');
      expect(source.totalCount()).assertEqual(1);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(2);');
        expect(source.getData(0).num).assertEqual(2);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyMixed0003 end');
    })

    /**
     * @tc.name   testFlipClockMyMixed0004
     * @tc.number SUB_FLIP_CLOCK_MORE2_MYMIX_0004
     * @tc.desc   Verify MyDataSource mixed operation 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyMixed0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyMixed0004 begin');
      const source: MyDataSource = new MyDataSource([]);
      source.replaceData([tabArray[1]]);
        source.pushData(tabArray[2]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(2);');
      expect(source.totalCount()).assertEqual(2);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(1);');
        expect(source.getData(0).num).assertEqual(1);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyMixed0004 end');
    })

    /**
     * @tc.name   testFlipClockMyMixed0005
     * @tc.number SUB_FLIP_CLOCK_MORE2_MYMIX_0005
     * @tc.desc   Verify MyDataSource mixed operation 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyMixed0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyMixed0005 begin');
      const source: MyDataSource = new MyDataSource([]);
      source.pushData(tabArray[0]);
        source.pushData(tabArray[1]);
        source.deleteData(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1);');
      expect(source.totalCount()).assertEqual(1);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(0);');
        expect(source.getData(0).num).assertEqual(0);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyMixed0005 end');
    })

    /**
     * @tc.name   testFlipClockMyMixed0006
     * @tc.number SUB_FLIP_CLOCK_MORE2_MYMIX_0006
     * @tc.desc   Verify MyDataSource mixed operation 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyMixed0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyMixed0006 begin');
      const source: MyDataSource = new MyDataSource([]);
      source.replaceData(tabArray.slice());
        source.deleteData(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(3);');
      expect(source.totalCount()).assertEqual(3);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(0);');
        expect(source.getData(0).num).assertEqual(0);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyMixed0006 end');
    })

    /**
     * @tc.name   testFlipClockMyMixed0007
     * @tc.number SUB_FLIP_CLOCK_MORE2_MYMIX_0007
     * @tc.desc   Verify MyDataSource mixed operation 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyMixed0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyMixed0007 begin');
      const source: MyDataSource = new MyDataSource([]);
      source.pushData(tabArray[0]);
        source.replaceData([tabArray[3]]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1);');
      expect(source.totalCount()).assertEqual(1);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(3);');
        expect(source.getData(0).num).assertEqual(3);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyMixed0007 end');
    })

    /**
     * @tc.name   testFlipClockMyMixed0008
     * @tc.number SUB_FLIP_CLOCK_MORE2_MYMIX_0008
     * @tc.desc   Verify MyDataSource mixed operation 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockMyMixed0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyMixed0008 begin');
      const source: MyDataSource = new MyDataSource([]);
      source.replaceData(tabArray.slice());
        source.deleteData(0);
        source.pushData(tabArray[0]);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(4);');
      expect(source.totalCount()).assertEqual(4);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).num).assertEqual(1);');
        expect(source.getData(0).num).assertEqual(1);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(source.totalCount()) === undefined).assertTrue();');
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockMyMixed0008 end');
    })
  })
}
