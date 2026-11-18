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
import { DialogEventLog } from '../../../main/ets/model/DialogModels';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_DialogsDemo]';

export default function DialogEventSequenceGridMatrixPart2Test(): void {
  describe('DialogEventSequenceGridMatrixPart2', () => {

    /**
     * @tc.number    SUB_DIALOGS_DESP2_4100
     * @tc.name      testClearGrid0041
     * @tc.desc      Verify clear after 5 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClearGrid0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearGrid0041 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 5; i++) {
        log.record('open#' + i);
      }
      log.clear();
      expect(log.count()).assertEqual(0);
      expect(log.last()).assertEqual("");
      expect(log.hasPrefix("open#")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearGrid0041 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP2_4200
     * @tc.name      testClearGrid0042
     * @tc.desc      Verify clear after 30 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClearGrid0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearGrid0042 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 30; i++) {
        log.record('open#' + i);
      }
      log.clear();
      expect(log.count()).assertEqual(0);
      expect(log.last()).assertEqual("");
      expect(log.hasPrefix("open#")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearGrid0042 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP2_4300
     * @tc.name      testClearGrid0043
     * @tc.desc      Verify clear after 60 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClearGrid0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearGrid0043 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 60; i++) {
        log.record('open#' + i);
      }
      log.clear();
      expect(log.count()).assertEqual(0);
      expect(log.last()).assertEqual("");
      expect(log.hasPrefix("open#")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearGrid0043 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP2_4400
     * @tc.name      testClearGrid0044
     * @tc.desc      Verify clear after 61 records.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testClearGrid0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearGrid0044 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 61; i++) {
        log.record('open#' + i);
      }
      log.clear();
      expect(log.count()).assertEqual(0);
      expect(log.last()).assertEqual("");
      expect(log.hasPrefix("open#")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testClearGrid0044 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP2_4500
     * @tc.name      testCopyGrid0045
     * @tc.desc      Verify toLines returns an independent copy for 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCopyGrid0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCopyGrid0045 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 3; i++) { log.record("e-" + i); }
      const copy: string[] = log.toLines();
      copy.push("mutated");
      copy[0] = "changed";
      expect(log.count()).assertEqual(3);
      expect(log.toLines()[0]).assertEqual("e-0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCopyGrid0045 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP2_4600
     * @tc.name      testCopyGrid0046
     * @tc.desc      Verify toLines returns an independent copy for 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCopyGrid0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCopyGrid0046 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 10; i++) { log.record("e-" + i); }
      const copy: string[] = log.toLines();
      copy.push("mutated");
      copy[0] = "changed";
      expect(log.count()).assertEqual(10);
      expect(log.toLines()[0]).assertEqual("e-0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCopyGrid0046 end');
    })

    /**
     * @tc.number    SUB_DIALOGS_DESP2_4700
     * @tc.name      testCopyGrid0047
     * @tc.desc      Verify toLines returns an independent copy for 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCopyGrid0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCopyGrid0047 begin');
      await delayTick();
      const log: DialogEventLog = new DialogEventLog();
      for (let i: number = 0; i < 60; i++) { log.record("e-" + i); }
      const copy: string[] = log.toLines();
      copy.push("mutated");
      copy[0] = "changed";
      expect(log.count()).assertEqual(60);
      expect(log.toLines()[0]).assertEqual("e-0");
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCopyGrid0047 end');
    })

  })
}
