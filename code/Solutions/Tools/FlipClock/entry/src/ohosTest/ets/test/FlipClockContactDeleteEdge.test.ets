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
import { ContactSource, Contact } from '../../../main/ets/common/DataSource';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function flipClockContactDeleteEdgeTest() {
  describe('FlipClockContactDeleteEdgeTest', () => {

    /**
     * @tc.name   testFlipClockContactDeleteEdge0000
     * @tc.number SUB_FLIP_CLOCK_EDGE_CDEL_0000
     * @tc.desc   Delete first contact from 2 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteEdge0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteEdge0000 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 2; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      source.deleteData(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1);');
        expect(source.totalCount()).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key1\');');
        expect(source.getData(0).key).assertEqual('key1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteEdge0000 end');
    })

    /**
     * @tc.name   testFlipClockContactDeleteEdge0001
     * @tc.number SUB_FLIP_CLOCK_EDGE_CDEL_0001
     * @tc.desc   Delete first contact from 3 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteEdge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteEdge0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 3; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      source.deleteData(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(2);');
        expect(source.totalCount()).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key1\');');
        expect(source.getData(0).key).assertEqual('key1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteEdge0001 end');
    })

    /**
     * @tc.name   testFlipClockContactDeleteEdge0002
     * @tc.number SUB_FLIP_CLOCK_EDGE_CDEL_0002
     * @tc.desc   Delete first contact from 4 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteEdge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteEdge0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 4; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      source.deleteData(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(3);');
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key1\');');
        expect(source.getData(0).key).assertEqual('key1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteEdge0002 end');
    })

    /**
     * @tc.name   testFlipClockContactDeleteEdge0003
     * @tc.number SUB_FLIP_CLOCK_EDGE_CDEL_0003
     * @tc.desc   Delete first contact from 5 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteEdge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteEdge0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 5; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      source.deleteData(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(4);');
        expect(source.totalCount()).assertEqual(4);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key1\');');
        expect(source.getData(0).key).assertEqual('key1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteEdge0003 end');
    })

    /**
     * @tc.name   testFlipClockContactDeleteEdge0004
     * @tc.number SUB_FLIP_CLOCK_EDGE_CDEL_0004
     * @tc.desc   Delete first contact from 6 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteEdge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteEdge0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 6; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      source.deleteData(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(5);');
        expect(source.totalCount()).assertEqual(5);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key1\');');
        expect(source.getData(0).key).assertEqual('key1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteEdge0004 end');
    })

    /**
     * @tc.name   testFlipClockContactDeleteEdge0005
     * @tc.number SUB_FLIP_CLOCK_EDGE_CDEL_0005
     * @tc.desc   Delete first contact from 7 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteEdge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteEdge0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 7; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      source.deleteData(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(6);');
        expect(source.totalCount()).assertEqual(6);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key1\');');
        expect(source.getData(0).key).assertEqual('key1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteEdge0005 end');
    })

    /**
     * @tc.name   testFlipClockContactDeleteEdge0006
     * @tc.number SUB_FLIP_CLOCK_EDGE_CDEL_0006
     * @tc.desc   Delete first contact from 8 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteEdge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteEdge0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 8; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      source.deleteData(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(7);');
        expect(source.totalCount()).assertEqual(7);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key1\');');
        expect(source.getData(0).key).assertEqual('key1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteEdge0006 end');
    })

    /**
     * @tc.name   testFlipClockContactDeleteEdge0007
     * @tc.number SUB_FLIP_CLOCK_EDGE_CDEL_0007
     * @tc.desc   Delete first contact from 9 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteEdge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteEdge0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 9; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      source.deleteData(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(8);');
        expect(source.totalCount()).assertEqual(8);
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key1\');');
        expect(source.getData(0).key).assertEqual('key1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockContactDeleteEdge0007 end');
    })
  })
}
