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

export default function flipClockContactReplaceEdgeTest() {
  describe('FlipClockContactReplaceEdgeTest', () => {

    /**
     * @tc.name   ohos.samples.flipclock_ContactReplaceEdge_0001
     * @tc.number SUB_FLIP_CLOCK_EDGE_CREP_0000
     * @tc.desc   Replace contacts with 0 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactReplaceEdge_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactReplaceEdge_0001 begin');
      const source: ContactSource = new ContactSource([]);
        const next: Contact[] = [];
      for (let index: number = 0; index < 0; index++) {
        next.push(new Contact('key' + index, 'value', index));
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(0));
        expect(source.totalCount()).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactReplaceEdge_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactReplaceEdge_0002
     * @tc.number SUB_FLIP_CLOCK_EDGE_CREP_0001
     * @tc.desc   Replace contacts with 1 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactReplaceEdge_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactReplaceEdge_0002 begin');
      const source: ContactSource = new ContactSource([]);
        const next: Contact[] = [];
      for (let index: number = 0; index < 1; index++) {
        next.push(new Contact('key' + index, 'value', index));
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1));
        expect(source.totalCount()).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactReplaceEdge_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactReplaceEdge_0003
     * @tc.number SUB_FLIP_CLOCK_EDGE_CREP_0002
     * @tc.desc   Replace contacts with 2 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactReplaceEdge_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactReplaceEdge_0003 begin');
      const source: ContactSource = new ContactSource([]);
        const next: Contact[] = [];
      for (let index: number = 0; index < 2; index++) {
        next.push(new Contact('key' + index, 'value', index));
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(2));
        expect(source.totalCount()).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactReplaceEdge_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactReplaceEdge_0004
     * @tc.number SUB_FLIP_CLOCK_EDGE_CREP_0003
     * @tc.desc   Replace contacts with 3 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactReplaceEdge_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactReplaceEdge_0004 begin');
      const source: ContactSource = new ContactSource([]);
        const next: Contact[] = [];
      for (let index: number = 0; index < 3; index++) {
        next.push(new Contact('key' + index, 'value', index));
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(3));
        expect(source.totalCount()).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactReplaceEdge_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactReplaceEdge_0005
     * @tc.number SUB_FLIP_CLOCK_EDGE_CREP_0004
     * @tc.desc   Replace contacts with 4 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactReplaceEdge_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactReplaceEdge_0005 begin');
      const source: ContactSource = new ContactSource([]);
        const next: Contact[] = [];
      for (let index: number = 0; index < 4; index++) {
        next.push(new Contact('key' + index, 'value', index));
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(4));
        expect(source.totalCount()).assertEqual(4);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactReplaceEdge_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactReplaceEdge_0006
     * @tc.number SUB_FLIP_CLOCK_EDGE_CREP_0005
     * @tc.desc   Replace contacts with 5 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactReplaceEdge_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactReplaceEdge_0006 begin');
      const source: ContactSource = new ContactSource([]);
        const next: Contact[] = [];
      for (let index: number = 0; index < 5; index++) {
        next.push(new Contact('key' + index, 'value', index));
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(5));
        expect(source.totalCount()).assertEqual(5);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactReplaceEdge_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactReplaceEdge_0007
     * @tc.number SUB_FLIP_CLOCK_EDGE_CREP_0006
     * @tc.desc   Replace contacts with 6 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactReplaceEdge_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactReplaceEdge_0007 begin');
      const source: ContactSource = new ContactSource([]);
        const next: Contact[] = [];
      for (let index: number = 0; index < 6; index++) {
        next.push(new Contact('key' + index, 'value', index));
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(6));
        expect(source.totalCount()).assertEqual(6);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactReplaceEdge_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactReplaceEdge_0008
     * @tc.number SUB_FLIP_CLOCK_EDGE_CREP_0007
     * @tc.desc   Replace contacts with 7 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactReplaceEdge_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactReplaceEdge_0008 begin');
      const source: ContactSource = new ContactSource([]);
        const next: Contact[] = [];
      for (let index: number = 0; index < 7; index++) {
        next.push(new Contact('key' + index, 'value', index));
        }
      source.replaceData(next);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(7));
        expect(source.totalCount()).assertEqual(7);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
        expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactReplaceEdge_0008 end');
    })
  })
}
