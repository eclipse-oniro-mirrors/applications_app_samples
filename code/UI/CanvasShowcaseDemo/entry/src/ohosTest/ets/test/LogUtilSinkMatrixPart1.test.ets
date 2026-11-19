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

export default function LogUtilSinkMatrixPart1Test(): void {
  describe('LogUtilSinkMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_LSKP1_0100
     * @tc.name      testFormatTime0001
     * @tc.desc      Verify formatTime 00:01:02.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatTime0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0001 begin');
      await delayTick();
      expect(LogUtil.formatTime(new Date(2026, 0, 1, 0, 1, 2))).assertEqual('00:01:02');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LSKP1_0200
     * @tc.name      testFormatTime0002
     * @tc.desc      Verify formatTime 05:06:07.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatTime0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0002 begin');
      await delayTick();
      expect(LogUtil.formatTime(new Date(2026, 0, 1, 5, 6, 7))).assertEqual('05:06:07');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LSKP1_0300
     * @tc.name      testFormatTime0003
     * @tc.desc      Verify formatTime 10:11:12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatTime0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0003 begin');
      await delayTick();
      expect(LogUtil.formatTime(new Date(2026, 0, 1, 10, 11, 12))).assertEqual('10:11:12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LSKP1_0400
     * @tc.name      testFormatTime0004
     * @tc.desc      Verify formatTime 13:14:15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatTime0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0004 begin');
      await delayTick();
      expect(LogUtil.formatTime(new Date(2026, 0, 1, 13, 14, 15))).assertEqual('13:14:15');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LSKP1_0500
     * @tc.name      testFormatTime0005
     * @tc.desc      Verify formatTime 20:21:22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatTime0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0005 begin');
      await delayTick();
      expect(LogUtil.formatTime(new Date(2026, 0, 1, 20, 21, 22))).assertEqual('20:21:22');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LSKP1_0600
     * @tc.name      testFormatTime0006
     * @tc.desc      Verify formatTime 23:00:59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFormatTime0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0006 begin');
      await delayTick();
      expect(LogUtil.formatTime(new Date(2026, 0, 1, 23, 0, 59))).assertEqual('23:00:59');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFormatTime0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LSKP1_0700
     * @tc.name      testSinkFilter0007
     * @tc.desc      Verify min level DEBUG yields DIWE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkFilter0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkFilter0007 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.DEBUG);
      LogUtil.debug('M', 'd1');
      LogUtil.info('M', 'i1');
      LogUtil.warn('M', 'w1');
      LogUtil.error('M', 'e1');
      expect(lines.length).assertEqual(4);
      expect(lines[0]).assertContain('][D][M]');
      expect(lines[1]).assertContain('][I][M]');
      expect(lines[2]).assertContain('][W][M]');
      expect(lines[3]).assertContain('][E][M]');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkFilter0007 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LSKP1_0800
     * @tc.name      testSinkFilter0008
     * @tc.desc      Verify min level INFO yields IWE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkFilter0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkFilter0008 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.INFO);
      LogUtil.debug('M', 'd1');
      LogUtil.info('M', 'i1');
      LogUtil.warn('M', 'w1');
      LogUtil.error('M', 'e1');
      expect(lines.length).assertEqual(3);
      expect(lines[0]).assertContain('][I][M]');
      expect(lines[1]).assertContain('][W][M]');
      expect(lines[2]).assertContain('][E][M]');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkFilter0008 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LSKP1_0900
     * @tc.name      testSinkFilter0009
     * @tc.desc      Verify min level WARN yields WE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkFilter0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkFilter0009 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.WARN);
      LogUtil.debug('M', 'd1');
      LogUtil.info('M', 'i1');
      LogUtil.warn('M', 'w1');
      LogUtil.error('M', 'e1');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertContain('][W][M]');
      expect(lines[1]).assertContain('][E][M]');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkFilter0009 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LSKP1_1000
     * @tc.name      testSinkFilter0010
     * @tc.desc      Verify min level ERROR yields E.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkFilter0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkFilter0010 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.ERROR);
      LogUtil.debug('M', 'd1');
      LogUtil.info('M', 'i1');
      LogUtil.warn('M', 'w1');
      LogUtil.error('M', 'e1');
      expect(lines.length).assertEqual(1);
      expect(lines[0]).assertContain('][E][M]');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkFilter0010 end');
    })

  })
}
