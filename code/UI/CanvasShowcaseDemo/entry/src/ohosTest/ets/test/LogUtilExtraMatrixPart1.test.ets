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
import { LogUtil, LogLevel } from '../../../main/ets/model/utils/LogUtil';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF817;
const TAG: string = '[Sample_Canvas]';

export default function LogUtilExtraMatrixPart1Test(): void {
  describe('LogUtilExtraMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_LEXP1_0100
     * @tc.name      testFormatTime0001
     * @tc.desc      Verify LogUtil.formatTime 00:00:00.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatTime0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0001 begin');
      await delayTick();
      const d: Date = new Date(2026, 0, 1, 0, 0, 0);
      expect(LogUtil.formatTime(d)).assertEqual('00:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LEXP1_0200
     * @tc.name      testFormatTime0002
     * @tc.desc      Verify LogUtil.formatTime 01:02:03.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatTime0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0002 begin');
      await delayTick();
      const d: Date = new Date(2026, 0, 1, 1, 2, 3);
      expect(LogUtil.formatTime(d)).assertEqual('01:02:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LEXP1_0300
     * @tc.name      testFormatTime0003
     * @tc.desc      Verify LogUtil.formatTime 09:05:03.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatTime0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0003 begin');
      await delayTick();
      const d: Date = new Date(2026, 0, 1, 9, 5, 3);
      expect(LogUtil.formatTime(d)).assertEqual('09:05:03');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LEXP1_0400
     * @tc.name      testFormatTime0004
     * @tc.desc      Verify LogUtil.formatTime 12:34:56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatTime0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0004 begin');
      await delayTick();
      const d: Date = new Date(2026, 0, 1, 12, 34, 56);
      expect(LogUtil.formatTime(d)).assertEqual('12:34:56');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LEXP1_0500
     * @tc.name      testFormatTime0005
     * @tc.desc      Verify LogUtil.formatTime 19:07:08.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatTime0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0005 begin');
      await delayTick();
      const d: Date = new Date(2026, 0, 1, 19, 7, 8);
      expect(LogUtil.formatTime(d)).assertEqual('19:07:08');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LEXP1_0600
     * @tc.name      testFormatTime0006
     * @tc.desc      Verify LogUtil.formatTime 23:59:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatTime0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0006 begin');
      await delayTick();
      const d: Date = new Date(2026, 0, 1, 23, 59, 59);
      expect(LogUtil.formatTime(d)).assertEqual('23:59:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LEXP1_0700
     * @tc.name      testLevelMark0007
     * @tc.desc      Verify levelMark DEBUG.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLevelMark0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLevelMark0007 begin');
      await delayTick();
      expect(LogUtil.levelMark(LogLevel.DEBUG)).assertEqual('D');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLevelMark0007 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LEXP1_0800
     * @tc.name      testLevelMark0008
     * @tc.desc      Verify levelMark INFO.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLevelMark0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLevelMark0008 begin');
      await delayTick();
      expect(LogUtil.levelMark(LogLevel.INFO)).assertEqual('I');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLevelMark0008 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LEXP1_0900
     * @tc.name      testLevelMark0009
     * @tc.desc      Verify levelMark WARN.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLevelMark0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLevelMark0009 begin');
      await delayTick();
      expect(LogUtil.levelMark(LogLevel.WARN)).assertEqual('W');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLevelMark0009 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LEXP1_1000
     * @tc.name      testLevelMark0010
     * @tc.desc      Verify levelMark ERROR.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLevelMark0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLevelMark0010 begin');
      await delayTick();
      expect(LogUtil.levelMark(LogLevel.ERROR)).assertEqual('E');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLevelMark0010 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LEXP1_1100
     * @tc.name      testFilterSequence0011
     * @tc.desc      Verify min level DEBUG delivers DIWE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterSequence0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterSequence0011 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.DEBUG);
      LogUtil.debug('T', 'd');
      LogUtil.info('T', 'i');
      LogUtil.warn('T', 'w');
      LogUtil.error('T', 'e');
      expect(lines.length).assertEqual(4);
      expect(lines[0]).assertContain('][D][T]');
      expect(lines[1]).assertContain('][I][T]');
      expect(lines[2]).assertContain('][W][T]');
      expect(lines[3]).assertContain('][E][T]');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterSequence0011 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LEXP1_1200
     * @tc.name      testFilterSequence0012
     * @tc.desc      Verify min level INFO delivers IWE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterSequence0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterSequence0012 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.INFO);
      LogUtil.debug('T', 'd');
      LogUtil.info('T', 'i');
      LogUtil.warn('T', 'w');
      LogUtil.error('T', 'e');
      expect(lines.length).assertEqual(3);
      expect(lines[0]).assertContain('][I][T]');
      expect(lines[1]).assertContain('][W][T]');
      expect(lines[2]).assertContain('][E][T]');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterSequence0012 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LEXP1_1300
     * @tc.name      testFilterSequence0013
     * @tc.desc      Verify min level WARN delivers WE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterSequence0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterSequence0013 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.WARN);
      LogUtil.debug('T', 'd');
      LogUtil.info('T', 'i');
      LogUtil.warn('T', 'w');
      LogUtil.error('T', 'e');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertContain('][W][T]');
      expect(lines[1]).assertContain('][E][T]');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterSequence0013 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LEXP1_1400
     * @tc.name      testFilterSequence0014
     * @tc.desc      Verify min level ERROR delivers E.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFilterSequence0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterSequence0014 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.ERROR);
      LogUtil.debug('T', 'd');
      LogUtil.info('T', 'i');
      LogUtil.warn('T', 'w');
      LogUtil.error('T', 'e');
      expect(lines.length).assertEqual(1);
      expect(lines[0]).assertContain('][E][T]');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFilterSequence0014 end');
    })

  })
}
