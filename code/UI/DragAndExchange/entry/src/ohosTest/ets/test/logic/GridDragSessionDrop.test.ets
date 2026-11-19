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

/** Logic checks for GridDragSession.drop (50 cases). */
export default function gridDragSessionDropTest(): void {
  describe('GridDragSessionDropTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0001
     * @tc.name      DragAndExchange_GridDragSessionDrop_0001
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=0, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_GridDragSessionDrop_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0001 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: boolean = subject.drop(0, 0, true);
      logInfo(`drop(itemIndex=0, insertIndex=0, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0002
     * @tc.name      DragAndExchange_GridDragSessionDrop_0002
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=1, isSuccess=true) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_GridDragSessionDrop_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0002 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: boolean = subject.drop(0, 1, true);
      logInfo(`drop(itemIndex=0, insertIndex=1, isSucces...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}GridDragSessionDrop_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0003
     * @tc.name      DragAndExchange_GridDragSessionDrop_0003
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=0, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0003 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: boolean = subject.drop(0, 0, false);
      logInfo(`drop(itemIndex=0, insertIndex=0, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0004
     * @tc.name      DragAndExchange_GridDragSessionDrop_0004
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=1, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0004 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: boolean = subject.drop(0, 1, false);
      logInfo(`drop(itemIndex=0, insertIndex=1, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0005
     * @tc.name      DragAndExchange_GridDragSessionDrop_0005
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=2, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0005 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: boolean = subject.drop(0, 2, true);
      logInfo(`drop(itemIndex=0, insertIndex=2, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0006
     * @tc.name      DragAndExchange_GridDragSessionDrop_0006
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=2, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0006 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: boolean = subject.drop(0, 2, false);
      logInfo(`drop(itemIndex=0, insertIndex=2, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0007
     * @tc.name      DragAndExchange_GridDragSessionDrop_0007
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=-1, isSuccess=true) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDragSessionDrop_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0007 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: boolean = subject.drop(0, -1, true);
      logInfo(`drop(itemIndex=0, insertIndex=-1, isSucce...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}GridDragSessionDrop_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0008
     * @tc.name      DragAndExchange_GridDragSessionDrop_0008
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=-1, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDragSessionDrop_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0008 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: boolean = subject.drop(0, -1, false);
      logInfo(`drop(itemIndex=0, insertIndex=-1, isSucce...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0009
     * @tc.name      DragAndExchange_GridDragSessionDrop_0009
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=5, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0009 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: boolean = subject.drop(0, 5, true);
      logInfo(`drop(itemIndex=0, insertIndex=5, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0010
     * @tc.name      DragAndExchange_GridDragSessionDrop_0010
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=5, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0010 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: boolean = subject.drop(0, 5, false);
      logInfo(`drop(itemIndex=0, insertIndex=5, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0011
     * @tc.name      DragAndExchange_GridDragSessionDrop_0011
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=10, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0011 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: boolean = subject.drop(0, 10, true);
      logInfo(`drop(itemIndex=0, insertIndex=10, isSucce...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0012
     * @tc.name      DragAndExchange_GridDragSessionDrop_0012
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=10, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0012 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: boolean = subject.drop(0, 10, false);
      logInfo(`drop(itemIndex=0, insertIndex=10, isSucce...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0013
     * @tc.name      DragAndExchange_GridDragSessionDrop_0013
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=3, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0013 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: boolean = subject.drop(0, 3, true);
      logInfo(`drop(itemIndex=0, insertIndex=3, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0014
     * @tc.name      DragAndExchange_GridDragSessionDrop_0014
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=3, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0014 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: boolean = subject.drop(0, 3, false);
      logInfo(`drop(itemIndex=0, insertIndex=3, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0015
     * @tc.name      DragAndExchange_GridDragSessionDrop_0015
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=100, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0015 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: boolean = subject.drop(0, 100, true);
      logInfo(`drop(itemIndex=0, insertIndex=100, isSucc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0016
     * @tc.name      DragAndExchange_GridDragSessionDrop_0016
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=100, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0016 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: boolean = subject.drop(0, 100, false);
      logInfo(`drop(itemIndex=0, insertIndex=100, isSucc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0017
     * @tc.name      DragAndExchange_GridDragSessionDrop_0017
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=15, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0017 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: boolean = subject.drop(0, 15, true);
      logInfo(`drop(itemIndex=0, insertIndex=15, isSucce...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0018
     * @tc.name      DragAndExchange_GridDragSessionDrop_0018
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=15, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0018 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: boolean = subject.drop(0, 15, false);
      logInfo(`drop(itemIndex=0, insertIndex=15, isSucce...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0019
     * @tc.name      DragAndExchange_GridDragSessionDrop_0019
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=20, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0019 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: boolean = subject.drop(0, 20, true);
      logInfo(`drop(itemIndex=0, insertIndex=20, isSucce...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0020
     * @tc.name      DragAndExchange_GridDragSessionDrop_0020
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=20, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0020 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: boolean = subject.drop(0, 20, false);
      logInfo(`drop(itemIndex=0, insertIndex=20, isSucce...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0021
     * @tc.name      DragAndExchange_GridDragSessionDrop_0021
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=6.86, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0021 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: boolean = subject.drop(0, 6.86, true);
      logInfo(`drop(itemIndex=0, insertIndex=6.86, isSuc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0022
     * @tc.name      DragAndExchange_GridDragSessionDrop_0022
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=6.86, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0022 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: boolean = subject.drop(0, 6.86, false);
      logInfo(`drop(itemIndex=0, insertIndex=6.86, isSuc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0023
     * @tc.name      DragAndExchange_GridDragSessionDrop_0023
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=188, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0023 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: boolean = subject.drop(0, 188, true);
      logInfo(`drop(itemIndex=0, insertIndex=188, isSucc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0024
     * @tc.name      DragAndExchange_GridDragSessionDrop_0024
     * @tc.desc      GridDragSession.drop(itemIndex=0, insertIndex=188, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0024 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: boolean = subject.drop(0, 188, false);
      logInfo(`drop(itemIndex=0, insertIndex=188, isSucc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0025
     * @tc.name      DragAndExchange_GridDragSessionDrop_0025
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=0, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0025 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: boolean = subject.drop(1, 0, true);
      logInfo(`drop(itemIndex=1, insertIndex=0, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0026
     * @tc.name      DragAndExchange_GridDragSessionDrop_0026
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=0, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0026 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: boolean = subject.drop(1, 0, false);
      logInfo(`drop(itemIndex=1, insertIndex=0, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0027
     * @tc.name      DragAndExchange_GridDragSessionDrop_0027
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=1, isSuccess=true) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0027 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: boolean = subject.drop(1, 1, true);
      logInfo(`drop(itemIndex=1, insertIndex=1, isSucces...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}GridDragSessionDrop_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0028
     * @tc.name      DragAndExchange_GridDragSessionDrop_0028
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=1, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0028 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: boolean = subject.drop(1, 1, false);
      logInfo(`drop(itemIndex=1, insertIndex=1, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0029
     * @tc.name      DragAndExchange_GridDragSessionDrop_0029
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=2, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0029 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: boolean = subject.drop(1, 2, true);
      logInfo(`drop(itemIndex=1, insertIndex=2, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0030
     * @tc.name      DragAndExchange_GridDragSessionDrop_0030
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=2, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0030 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: boolean = subject.drop(1, 2, false);
      logInfo(`drop(itemIndex=1, insertIndex=2, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0030 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0031
     * @tc.name      DragAndExchange_GridDragSessionDrop_0031
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=-1, isSuccess=true) yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDragSessionDrop_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0031 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: boolean = subject.drop(1, -1, true);
      logInfo(`drop(itemIndex=1, insertIndex=-1, isSucce...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}GridDragSessionDrop_0031 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0032
     * @tc.name      DragAndExchange_GridDragSessionDrop_0032
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=-1, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_GridDragSessionDrop_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0032 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: boolean = subject.drop(1, -1, false);
      logInfo(`drop(itemIndex=1, insertIndex=-1, isSucce...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0032 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0033
     * @tc.name      DragAndExchange_GridDragSessionDrop_0033
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=5, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0033 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: boolean = subject.drop(1, 5, true);
      logInfo(`drop(itemIndex=1, insertIndex=5, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0033 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0034
     * @tc.name      DragAndExchange_GridDragSessionDrop_0034
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=5, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0034 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: boolean = subject.drop(1, 5, false);
      logInfo(`drop(itemIndex=1, insertIndex=5, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0034 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0035
     * @tc.name      DragAndExchange_GridDragSessionDrop_0035
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=10, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0035 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: boolean = subject.drop(1, 10, true);
      logInfo(`drop(itemIndex=1, insertIndex=10, isSucce...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0035 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0036
     * @tc.name      DragAndExchange_GridDragSessionDrop_0036
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=10, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0036 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: boolean = subject.drop(1, 10, false);
      logInfo(`drop(itemIndex=1, insertIndex=10, isSucce...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0036 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0037
     * @tc.name      DragAndExchange_GridDragSessionDrop_0037
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=3, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0037 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: boolean = subject.drop(1, 3, true);
      logInfo(`drop(itemIndex=1, insertIndex=3, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0037 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0038
     * @tc.name      DragAndExchange_GridDragSessionDrop_0038
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=3, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0038 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: boolean = subject.drop(1, 3, false);
      logInfo(`drop(itemIndex=1, insertIndex=3, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0038 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0039
     * @tc.name      DragAndExchange_GridDragSessionDrop_0039
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=100, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0039 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: boolean = subject.drop(1, 100, true);
      logInfo(`drop(itemIndex=1, insertIndex=100, isSucc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0039 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0040
     * @tc.name      DragAndExchange_GridDragSessionDrop_0040
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=100, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0040 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: boolean = subject.drop(1, 100, false);
      logInfo(`drop(itemIndex=1, insertIndex=100, isSucc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0040 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0041
     * @tc.name      DragAndExchange_GridDragSessionDrop_0041
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=15, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0041 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: boolean = subject.drop(1, 15, true);
      logInfo(`drop(itemIndex=1, insertIndex=15, isSucce...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0041 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0042
     * @tc.name      DragAndExchange_GridDragSessionDrop_0042
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=15, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0042 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: boolean = subject.drop(1, 15, false);
      logInfo(`drop(itemIndex=1, insertIndex=15, isSucce...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0042 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0043
     * @tc.name      DragAndExchange_GridDragSessionDrop_0043
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=20, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0043 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: boolean = subject.drop(1, 20, true);
      logInfo(`drop(itemIndex=1, insertIndex=20, isSucce...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0043 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0044
     * @tc.name      DragAndExchange_GridDragSessionDrop_0044
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=20, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0044 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: boolean = subject.drop(1, 20, false);
      logInfo(`drop(itemIndex=1, insertIndex=20, isSucce...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0044 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0045
     * @tc.name      DragAndExchange_GridDragSessionDrop_0045
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=6.86, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0045 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: boolean = subject.drop(1, 6.86, true);
      logInfo(`drop(itemIndex=1, insertIndex=6.86, isSuc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0045 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0046
     * @tc.name      DragAndExchange_GridDragSessionDrop_0046
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=6.86, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0046 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: boolean = subject.drop(1, 6.86, false);
      logInfo(`drop(itemIndex=1, insertIndex=6.86, isSuc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0046 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0047
     * @tc.name      DragAndExchange_GridDragSessionDrop_0047
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=188, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0047 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: boolean = subject.drop(1, 188, true);
      logInfo(`drop(itemIndex=1, insertIndex=188, isSucc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0047 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0048
     * @tc.name      DragAndExchange_GridDragSessionDrop_0048
     * @tc.desc      GridDragSession.drop(itemIndex=1, insertIndex=188, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0048 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const actual: boolean = subject.drop(1, 188, false);
      logInfo(`drop(itemIndex=1, insertIndex=188, isSucc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0048 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0049
     * @tc.name      DragAndExchange_GridDragSessionDrop_0049
     * @tc.desc      GridDragSession.drop(itemIndex=2, insertIndex=0, isSuccess=true) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0049 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const actual: boolean = subject.drop(2, 0, true);
      logInfo(`drop(itemIndex=2, insertIndex=0, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0049 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_DROP_0050
     * @tc.name      DragAndExchange_GridDragSessionDrop_0050
     * @tc.desc      GridDragSession.drop(itemIndex=2, insertIndex=0, isSuccess=false) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionDrop_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionDrop_0050 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const actual: boolean = subject.drop(2, 0, false);
      logInfo(`drop(itemIndex=2, insertIndex=0, isSucces...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionDrop_0050 end`);
    });
  });
}
