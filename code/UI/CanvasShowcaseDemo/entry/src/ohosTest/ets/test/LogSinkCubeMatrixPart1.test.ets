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

export default function LogSinkCubeMatrixPart1Test(): void {
  describe('LogSinkCubeMatrixPart1', () => {

    /**
     * @tc.number    SUB_CANVAS_LGCP1_0100
     * @tc.name      testSinkCube0001
     * @tc.desc      Verify min DEBUG tag A message variant 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0001 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.DEBUG);
      LogUtil.debug('A', '');
      LogUtil.info('A', '');
      LogUtil.warn('A', '');
      LogUtil.error('A', '');
      expect(lines.length).assertEqual(4);
      expect(lines[0]).assertContain('][D][A] ' + '');
      expect(lines[1]).assertContain('][I][A] ' + '');
      expect(lines[2]).assertContain('][W][A] ' + '');
      expect(lines[3]).assertContain('][E][A] ' + '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0001 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_0200
     * @tc.name      testSinkCube0002
     * @tc.desc      Verify min DEBUG tag A message variant 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0002 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.DEBUG);
      LogUtil.debug('A', '中文');
      LogUtil.info('A', '中文');
      LogUtil.warn('A', '中文');
      LogUtil.error('A', '中文');
      expect(lines.length).assertEqual(4);
      expect(lines[0]).assertContain('][D][A] ' + '中文');
      expect(lines[1]).assertContain('][I][A] ' + '中文');
      expect(lines[2]).assertContain('][W][A] ' + '中文');
      expect(lines[3]).assertContain('][E][A] ' + '中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0002 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_0300
     * @tc.name      testSinkCube0003
     * @tc.desc      Verify min DEBUG tag A message variant 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0003 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.DEBUG);
      LogUtil.debug('A', '%{public}s');
      LogUtil.info('A', '%{public}s');
      LogUtil.warn('A', '%{public}s');
      LogUtil.error('A', '%{public}s');
      expect(lines.length).assertEqual(4);
      expect(lines[0]).assertContain('][D][A] ' + '%{public}s');
      expect(lines[1]).assertContain('][I][A] ' + '%{public}s');
      expect(lines[2]).assertContain('][W][A] ' + '%{public}s');
      expect(lines[3]).assertContain('][E][A] ' + '%{public}s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0003 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_0400
     * @tc.name      testSinkCube0004
     * @tc.desc      Verify min DEBUG tag B message variant 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0004 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.DEBUG);
      LogUtil.debug('B', '');
      LogUtil.info('B', '');
      LogUtil.warn('B', '');
      LogUtil.error('B', '');
      expect(lines.length).assertEqual(4);
      expect(lines[0]).assertContain('][D][B] ' + '');
      expect(lines[1]).assertContain('][I][B] ' + '');
      expect(lines[2]).assertContain('][W][B] ' + '');
      expect(lines[3]).assertContain('][E][B] ' + '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0004 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_0500
     * @tc.name      testSinkCube0005
     * @tc.desc      Verify min DEBUG tag B message variant 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0005 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.DEBUG);
      LogUtil.debug('B', '中文');
      LogUtil.info('B', '中文');
      LogUtil.warn('B', '中文');
      LogUtil.error('B', '中文');
      expect(lines.length).assertEqual(4);
      expect(lines[0]).assertContain('][D][B] ' + '中文');
      expect(lines[1]).assertContain('][I][B] ' + '中文');
      expect(lines[2]).assertContain('][W][B] ' + '中文');
      expect(lines[3]).assertContain('][E][B] ' + '中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0005 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_0600
     * @tc.name      testSinkCube0006
     * @tc.desc      Verify min DEBUG tag B message variant 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0006 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.DEBUG);
      LogUtil.debug('B', '%{public}s');
      LogUtil.info('B', '%{public}s');
      LogUtil.warn('B', '%{public}s');
      LogUtil.error('B', '%{public}s');
      expect(lines.length).assertEqual(4);
      expect(lines[0]).assertContain('][D][B] ' + '%{public}s');
      expect(lines[1]).assertContain('][I][B] ' + '%{public}s');
      expect(lines[2]).assertContain('][W][B] ' + '%{public}s');
      expect(lines[3]).assertContain('][E][B] ' + '%{public}s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0006 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_0700
     * @tc.name      testSinkCube0007
     * @tc.desc      Verify min INFO tag A message variant 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0007 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.INFO);
      LogUtil.debug('A', '');
      LogUtil.info('A', '');
      LogUtil.warn('A', '');
      LogUtil.error('A', '');
      expect(lines.length).assertEqual(3);
      expect(lines[0]).assertContain('][I][A] ' + '');
      expect(lines[1]).assertContain('][W][A] ' + '');
      expect(lines[2]).assertContain('][E][A] ' + '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0007 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_0800
     * @tc.name      testSinkCube0008
     * @tc.desc      Verify min INFO tag A message variant 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0008 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.INFO);
      LogUtil.debug('A', '中文');
      LogUtil.info('A', '中文');
      LogUtil.warn('A', '中文');
      LogUtil.error('A', '中文');
      expect(lines.length).assertEqual(3);
      expect(lines[0]).assertContain('][I][A] ' + '中文');
      expect(lines[1]).assertContain('][W][A] ' + '中文');
      expect(lines[2]).assertContain('][E][A] ' + '中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0008 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_0900
     * @tc.name      testSinkCube0009
     * @tc.desc      Verify min INFO tag A message variant 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0009 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.INFO);
      LogUtil.debug('A', '%{public}s');
      LogUtil.info('A', '%{public}s');
      LogUtil.warn('A', '%{public}s');
      LogUtil.error('A', '%{public}s');
      expect(lines.length).assertEqual(3);
      expect(lines[0]).assertContain('][I][A] ' + '%{public}s');
      expect(lines[1]).assertContain('][W][A] ' + '%{public}s');
      expect(lines[2]).assertContain('][E][A] ' + '%{public}s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0009 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_1000
     * @tc.name      testSinkCube0010
     * @tc.desc      Verify min INFO tag B message variant 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0010 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.INFO);
      LogUtil.debug('B', '');
      LogUtil.info('B', '');
      LogUtil.warn('B', '');
      LogUtil.error('B', '');
      expect(lines.length).assertEqual(3);
      expect(lines[0]).assertContain('][I][B] ' + '');
      expect(lines[1]).assertContain('][W][B] ' + '');
      expect(lines[2]).assertContain('][E][B] ' + '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0010 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_1100
     * @tc.name      testSinkCube0011
     * @tc.desc      Verify min INFO tag B message variant 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0011 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.INFO);
      LogUtil.debug('B', '中文');
      LogUtil.info('B', '中文');
      LogUtil.warn('B', '中文');
      LogUtil.error('B', '中文');
      expect(lines.length).assertEqual(3);
      expect(lines[0]).assertContain('][I][B] ' + '中文');
      expect(lines[1]).assertContain('][W][B] ' + '中文');
      expect(lines[2]).assertContain('][E][B] ' + '中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0011 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_1200
     * @tc.name      testSinkCube0012
     * @tc.desc      Verify min INFO tag B message variant 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0012 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.INFO);
      LogUtil.debug('B', '%{public}s');
      LogUtil.info('B', '%{public}s');
      LogUtil.warn('B', '%{public}s');
      LogUtil.error('B', '%{public}s');
      expect(lines.length).assertEqual(3);
      expect(lines[0]).assertContain('][I][B] ' + '%{public}s');
      expect(lines[1]).assertContain('][W][B] ' + '%{public}s');
      expect(lines[2]).assertContain('][E][B] ' + '%{public}s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0012 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_1300
     * @tc.name      testSinkCube0013
     * @tc.desc      Verify min WARN tag A message variant 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0013 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.WARN);
      LogUtil.debug('A', '');
      LogUtil.info('A', '');
      LogUtil.warn('A', '');
      LogUtil.error('A', '');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertContain('][W][A] ' + '');
      expect(lines[1]).assertContain('][E][A] ' + '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0013 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_1400
     * @tc.name      testSinkCube0014
     * @tc.desc      Verify min WARN tag A message variant 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0014 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.WARN);
      LogUtil.debug('A', '中文');
      LogUtil.info('A', '中文');
      LogUtil.warn('A', '中文');
      LogUtil.error('A', '中文');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertContain('][W][A] ' + '中文');
      expect(lines[1]).assertContain('][E][A] ' + '中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0014 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_1500
     * @tc.name      testSinkCube0015
     * @tc.desc      Verify min WARN tag A message variant 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0015 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.WARN);
      LogUtil.debug('A', '%{public}s');
      LogUtil.info('A', '%{public}s');
      LogUtil.warn('A', '%{public}s');
      LogUtil.error('A', '%{public}s');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertContain('][W][A] ' + '%{public}s');
      expect(lines[1]).assertContain('][E][A] ' + '%{public}s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0015 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_1600
     * @tc.name      testSinkCube0016
     * @tc.desc      Verify min WARN tag B message variant 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0016 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.WARN);
      LogUtil.debug('B', '');
      LogUtil.info('B', '');
      LogUtil.warn('B', '');
      LogUtil.error('B', '');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertContain('][W][B] ' + '');
      expect(lines[1]).assertContain('][E][B] ' + '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0016 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_1700
     * @tc.name      testSinkCube0017
     * @tc.desc      Verify min WARN tag B message variant 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0017 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.WARN);
      LogUtil.debug('B', '中文');
      LogUtil.info('B', '中文');
      LogUtil.warn('B', '中文');
      LogUtil.error('B', '中文');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertContain('][W][B] ' + '中文');
      expect(lines[1]).assertContain('][E][B] ' + '中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0017 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_1800
     * @tc.name      testSinkCube0018
     * @tc.desc      Verify min WARN tag B message variant 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0018 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.WARN);
      LogUtil.debug('B', '%{public}s');
      LogUtil.info('B', '%{public}s');
      LogUtil.warn('B', '%{public}s');
      LogUtil.error('B', '%{public}s');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertContain('][W][B] ' + '%{public}s');
      expect(lines[1]).assertContain('][E][B] ' + '%{public}s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0018 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_1900
     * @tc.name      testSinkCube0019
     * @tc.desc      Verify min ERROR tag A message variant 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0019 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.ERROR);
      LogUtil.debug('A', '');
      LogUtil.info('A', '');
      LogUtil.warn('A', '');
      LogUtil.error('A', '');
      expect(lines.length).assertEqual(1);
      expect(lines[0]).assertContain('][E][A] ' + '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0019 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_2000
     * @tc.name      testSinkCube0020
     * @tc.desc      Verify min ERROR tag A message variant 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0020 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.ERROR);
      LogUtil.debug('A', '中文');
      LogUtil.info('A', '中文');
      LogUtil.warn('A', '中文');
      LogUtil.error('A', '中文');
      expect(lines.length).assertEqual(1);
      expect(lines[0]).assertContain('][E][A] ' + '中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0020 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_2100
     * @tc.name      testSinkCube0021
     * @tc.desc      Verify min ERROR tag A message variant 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0021 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.ERROR);
      LogUtil.debug('A', '%{public}s');
      LogUtil.info('A', '%{public}s');
      LogUtil.warn('A', '%{public}s');
      LogUtil.error('A', '%{public}s');
      expect(lines.length).assertEqual(1);
      expect(lines[0]).assertContain('][E][A] ' + '%{public}s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0021 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_2200
     * @tc.name      testSinkCube0022
     * @tc.desc      Verify min ERROR tag B message variant 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0022 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.ERROR);
      LogUtil.debug('B', '');
      LogUtil.info('B', '');
      LogUtil.warn('B', '');
      LogUtil.error('B', '');
      expect(lines.length).assertEqual(1);
      expect(lines[0]).assertContain('][E][B] ' + '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0022 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_2300
     * @tc.name      testSinkCube0023
     * @tc.desc      Verify min ERROR tag B message variant 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0023 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.ERROR);
      LogUtil.debug('B', '中文');
      LogUtil.info('B', '中文');
      LogUtil.warn('B', '中文');
      LogUtil.error('B', '中文');
      expect(lines.length).assertEqual(1);
      expect(lines[0]).assertContain('][E][B] ' + '中文');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0023 end');
    })

    /**
     * @tc.number    SUB_CANVAS_LGCP1_2400
     * @tc.name      testSinkCube0024
     * @tc.desc      Verify min ERROR tag B message variant 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSinkCube0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0024 begin');
      await delayTick();
      let lines: string[] = [];
      LogUtil.init((line: string) => { lines.push(line); }, LogLevel.DEBUG);
      LogUtil.setMinLevel(LogLevel.ERROR);
      LogUtil.debug('B', '%{public}s');
      LogUtil.info('B', '%{public}s');
      LogUtil.warn('B', '%{public}s');
      LogUtil.error('B', '%{public}s');
      expect(lines.length).assertEqual(1);
      expect(lines[0]).assertContain('][E][B] ' + '%{public}s');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSinkCube0024 end');
    })

  })
}
