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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { GridDragSession } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for GridDragSession.dragStart (30 cases). */
export default function gridDragSessionDragStartTest(): void {
  describe('GridDragSessionDragStartTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0001
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0001
     * @tc.desc      GridDragSession.dragStart(itemIndex=0) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_GridDragSessionDragStart_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0001 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: string = subject.dragStart(0);
      logInfo(`dragStart(itemIndex=0): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0002
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0002
     * @tc.desc      GridDragSession.dragStart(itemIndex=1) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_GridDragSessionDragStart_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0002 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: string = subject.dragStart(1);
      logInfo(`dragStart(itemIndex=1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0003
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0003
     * @tc.desc      GridDragSession.dragStart(itemIndex=2) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0003 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: string = subject.dragStart(2);
      logInfo(`dragStart(itemIndex=2): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0004
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0004
     * @tc.desc      GridDragSession.dragStart(itemIndex=-1) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDragSessionDragStart_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0004 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: string = subject.dragStart(-1);
      logInfo(`dragStart(itemIndex=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0005
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0005
     * @tc.desc      GridDragSession.dragStart(itemIndex=5) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0005 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: string = subject.dragStart(5);
      logInfo(`dragStart(itemIndex=5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0006
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0006
     * @tc.desc      GridDragSession.dragStart(itemIndex=10) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0006 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: string = subject.dragStart(10);
      logInfo(`dragStart(itemIndex=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0007
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0007
     * @tc.desc      GridDragSession.dragStart(itemIndex=3) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0007 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: string = subject.dragStart(3);
      logInfo(`dragStart(itemIndex=3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0008
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0008
     * @tc.desc      GridDragSession.dragStart(itemIndex=100) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0008 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: string = subject.dragStart(100);
      logInfo(`dragStart(itemIndex=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0009
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0009
     * @tc.desc      GridDragSession.dragStart(itemIndex=15) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0009 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: string = subject.dragStart(15);
      logInfo(`dragStart(itemIndex=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0010
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0010
     * @tc.desc      GridDragSession.dragStart(itemIndex=20) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0010 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: string = subject.dragStart(20);
      logInfo(`dragStart(itemIndex=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0011
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0011
     * @tc.desc      GridDragSession.dragStart(itemIndex=25) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0011 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: string = subject.dragStart(25);
      logInfo(`dragStart(itemIndex=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0012
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0012
     * @tc.desc      GridDragSession.dragStart(itemIndex=30) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0012 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: string = subject.dragStart(30);
      logInfo(`dragStart(itemIndex=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0013
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0013
     * @tc.desc      GridDragSession.dragStart(itemIndex=35) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0013 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: string = subject.dragStart(35);
      logInfo(`dragStart(itemIndex=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0014
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0014
     * @tc.desc      GridDragSession.dragStart(itemIndex=40) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0014 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: string = subject.dragStart(40);
      logInfo(`dragStart(itemIndex=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0015
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0015
     * @tc.desc      GridDragSession.dragStart(itemIndex=45) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0015 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: string = subject.dragStart(45);
      logInfo(`dragStart(itemIndex=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0016
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0016
     * @tc.desc      GridDragSession.dragStart(itemIndex=50) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0016 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: string = subject.dragStart(50);
      logInfo(`dragStart(itemIndex=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0017
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0017
     * @tc.desc      GridDragSession.dragStart(itemIndex=55) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0017 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: string = subject.dragStart(55);
      logInfo(`dragStart(itemIndex=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0018
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0018
     * @tc.desc      GridDragSession.dragStart(itemIndex=60) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0018 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: string = subject.dragStart(60);
      logInfo(`dragStart(itemIndex=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0019
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0019
     * @tc.desc      GridDragSession.dragStart(itemIndex=65) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0019 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: string = subject.dragStart(65);
      logInfo(`dragStart(itemIndex=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0020
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0020
     * @tc.desc      GridDragSession.dragStart(itemIndex=70) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0020 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: string = subject.dragStart(70);
      logInfo(`dragStart(itemIndex=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0021
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0021
     * @tc.desc      GridDragSession.dragStart(itemIndex=75) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0021 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: string = subject.dragStart(75);
      logInfo(`dragStart(itemIndex=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0022
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0022
     * @tc.desc      GridDragSession.dragStart(itemIndex=80) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0022 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: string = subject.dragStart(80);
      logInfo(`dragStart(itemIndex=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0023
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0023
     * @tc.desc      GridDragSession.dragStart(itemIndex=85) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0023 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: string = subject.dragStart(85);
      logInfo(`dragStart(itemIndex=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0024
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0024
     * @tc.desc      GridDragSession.dragStart(itemIndex=90) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0024 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: string = subject.dragStart(90);
      logInfo(`dragStart(itemIndex=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0025
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0025
     * @tc.desc      GridDragSession.dragStart(itemIndex=95) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0025 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: string = subject.dragStart(95);
      logInfo(`dragStart(itemIndex=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0026
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0026
     * @tc.desc      GridDragSession.dragStart(itemIndex=105) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0026 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: string = subject.dragStart(105);
      logInfo(`dragStart(itemIndex=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0027
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0027
     * @tc.desc      GridDragSession.dragStart(itemIndex=110) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0027 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: string = subject.dragStart(110);
      logInfo(`dragStart(itemIndex=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0028
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0028
     * @tc.desc      GridDragSession.dragStart(itemIndex=115) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0028 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: string = subject.dragStart(115);
      logInfo(`dragStart(itemIndex=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0029
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0029
     * @tc.desc      GridDragSession.dragStart(itemIndex=120) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0029 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: string = subject.dragStart(120);
      logInfo(`dragStart(itemIndex=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DRAG_START_0030
     * @tc.name      DragAndExchange_GridDragSessionDragStart_0030
     * @tc.desc      GridDragSession.dragStart(itemIndex=125) yields ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDragStart_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDragStart_0030 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: string = subject.dragStart(125);
      logInfo(`dragStart(itemIndex=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionDragStart_0030 end`);
    });
  });
}
