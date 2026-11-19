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

/** Logic checks for GridDragSession flow (57 cases). */
export default function gridDragSessionFlowTest(): void {
  describe('GridDragSessionFlowTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0001
     * @tc.name      DragAndExchange_GridDragSessionFlow_0001
     * @tc.desc      GridDragSession call flow dragStart > movedName > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_GridDragSessionFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0001 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string = subject.dragStart(72);
      logInfo(`step1 dragStart(72): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.movedName();
      logInfo(`step3 movedName(): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0002
     * @tc.name      DragAndExchange_GridDragSessionFlow_0002
     * @tc.desc      GridDragSession call flow dragStart > order > events > drop > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_GridDragSessionFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0002 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.dragStart(105);
      logInfo(`step1 dragStart(105): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["App1"]');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["grid:add0"]');
      const step4: boolean = subject.drop(172, 188, true);
      logInfo(`step4 drop(172, 188, true): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.dragStart(185);
      logInfo(`step5 dragStart(185): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0003
     * @tc.name      DragAndExchange_GridDragSessionFlow_0003
     * @tc.desc      GridDragSession call flow drop > drop > order > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0003 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: boolean = subject.drop(0, 0, true);
      logInfo(`step1 drop(0, 0, true): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.drop(1, -1, false);
      logInfo(`step2 drop(1, -1, false): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["App1","App2"]');
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(2);
      logInfo(`step4 order(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["App1","App2"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0004
     * @tc.name      DragAndExchange_GridDragSessionFlow_0004
     * @tc.desc      GridDragSession call flow events > drop > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0004 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: boolean = subject.drop(4, 15, false);
      logInfo(`step2 drop(4, 15, false): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0005
     * @tc.name      DragAndExchange_GridDragSessionFlow_0005
     * @tc.desc      GridDragSession call flow movedName > drop > drop > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0005 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.drop(10, -1, true);
      logInfo(`step2 drop(10, -1, true): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.drop(20, 1, false);
      logInfo(`step3 drop(20, 1, false): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.drop(4, 10, false);
      logInfo(`step4 drop(4, 10, false): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0006
     * @tc.name      DragAndExchange_GridDragSessionFlow_0006
     * @tc.desc      GridDragSession call flow movedName > dragStart > drop > movedName > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0006 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.dragStart(-41);
      logInfo(`step2 dragStart(-41): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.drop(15, 3, true);
      logInfo(`step3 drop(15, 3, true): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.movedName();
      logInfo(`step4 movedName(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string[] = subject.order();
      logInfo(`step5 order(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(2);
      logInfo(`step5 order(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["App1","App2"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0007
     * @tc.name      DragAndExchange_GridDragSessionFlow_0007
     * @tc.desc      GridDragSession call flow movedName > order > drop > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0007 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["App1"]');
      const step3: boolean = subject.drop(1, -1, true);
      logInfo(`step3 drop(1, -1, true): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.dragStart(0.59);
      logInfo(`step4 dragStart(0.59): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0008
     * @tc.name      DragAndExchange_GridDragSessionFlow_0008
     * @tc.desc      GridDragSession call flow dragStart > order > movedName > events > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0008 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.dragStart(75);
      logInfo(`step1 dragStart(75): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["App1","App2"]');
      const step3: string = subject.movedName();
      logInfo(`step3 movedName(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(2);
      logInfo(`step4 events(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["grid:add0","grid:add1"]');
      const step5: string = subject.movedName();
      logInfo(`step5 movedName(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0009
     * @tc.name      DragAndExchange_GridDragSessionFlow_0009
     * @tc.desc      GridDragSession call flow dragStart > events > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0009 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string = subject.dragStart(-97);
      logInfo(`step1 dragStart(-97): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0010
     * @tc.name      DragAndExchange_GridDragSessionFlow_0010
     * @tc.desc      GridDragSession call flow order > events > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0010 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1"]');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["grid:add0"]');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["App1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0011
     * @tc.name      DragAndExchange_GridDragSessionFlow_0011
     * @tc.desc      GridDragSession call flow dragStart > dragStart > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0011 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.dragStart(64);
      logInfo(`step1 dragStart(64): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.dragStart(-97);
      logInfo(`step2 dragStart(-97): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["grid:add0","grid:add1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0012
     * @tc.name      DragAndExchange_GridDragSessionFlow_0012
     * @tc.desc      GridDragSession call flow movedName > dragStart > movedName > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0012 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.dragStart(140);
      logInfo(`step2 dragStart(140): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.movedName();
      logInfo(`step3 movedName(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.dragStart(55);
      logInfo(`step4 dragStart(55): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0013
     * @tc.name      DragAndExchange_GridDragSessionFlow_0013
     * @tc.desc      GridDragSession call flow order > drop > drop > dragStart > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0013 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1"]');
      const step2: boolean = subject.drop(1, -1, false);
      logInfo(`step2 drop(1, -1, false): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.drop(0, 6.86, true);
      logInfo(`step3 drop(0, 6.86, true): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.dragStart(-54);
      logInfo(`step4 dragStart(-54): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.movedName();
      logInfo(`step5 movedName(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0014
     * @tc.name      DragAndExchange_GridDragSessionFlow_0014
     * @tc.desc      GridDragSession call flow movedName > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0014 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.dragStart(23);
      logInfo(`step2 dragStart(23): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0015
     * @tc.name      DragAndExchange_GridDragSessionFlow_0015
     * @tc.desc      GridDragSession call flow events > dragStart > drop > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0015 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["grid:add0"]');
      const step2: string = subject.dragStart(40);
      logInfo(`step2 dragStart(40): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.drop(2, 188, true);
      logInfo(`step3 drop(2, 188, true): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.drop(0, 0, true);
      logInfo(`step4 drop(0, 0, true): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`${BUNDLE}GridDragSessionFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0016
     * @tc.name      DragAndExchange_GridDragSessionFlow_0016
     * @tc.desc      GridDragSession call flow dragStart > dragStart > order > drop > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0016 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.dragStart(150);
      logInfo(`step1 dragStart(150): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.dragStart(83.28);
      logInfo(`step2 dragStart(83.28): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["App1","App2"]');
      const step4: boolean = subject.drop(1, 2, true);
      logInfo(`step4 drop(1, 2, true): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.dragStart(0);
      logInfo(`step5 dragStart(0): step5=${step5}`);
      expect(step5).assertEqual('App1');
      logInfo(`${BUNDLE}GridDragSessionFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0017
     * @tc.name      DragAndExchange_GridDragSessionFlow_0017
     * @tc.desc      GridDragSession call flow events > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0017 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0018
     * @tc.name      DragAndExchange_GridDragSessionFlow_0018
     * @tc.desc      GridDragSession call flow order > movedName > events > dragStart > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0018 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1"]');
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["grid:add0"]');
      const step4: string = subject.dragStart(90);
      logInfo(`step4 dragStart(90): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.movedName();
      logInfo(`step5 movedName(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0019
     * @tc.name      DragAndExchange_GridDragSessionFlow_0019
     * @tc.desc      GridDragSession call flow order > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0019 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1","App2"]');
      const step2: string = subject.dragStart(56.23);
      logInfo(`step2 dragStart(56.23): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0020
     * @tc.name      DragAndExchange_GridDragSessionFlow_0020
     * @tc.desc      GridDragSession call flow dragStart > movedName > drop > dragStart > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0020 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string = subject.dragStart(110);
      logInfo(`step1 dragStart(110): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.drop(-1, -1, false);
      logInfo(`step3 drop(-1, -1, false): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.dragStart(30);
      logInfo(`step4 dragStart(30): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0021
     * @tc.name      DragAndExchange_GridDragSessionFlow_0021
     * @tc.desc      GridDragSession call flow events > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0021 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["grid:add0"]');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["grid:add0"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0022
     * @tc.name      DragAndExchange_GridDragSessionFlow_0022
     * @tc.desc      GridDragSession call flow dragStart > dragStart > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0022 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.dragStart(-1);
      logInfo(`step1 dragStart(-1): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.dragStart(25);
      logInfo(`step2 dragStart(25): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["App1","App2"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0023
     * @tc.name      DragAndExchange_GridDragSessionFlow_0023
     * @tc.desc      GridDragSession call flow dragStart > order > movedName > order > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0023 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.dragStart(86);
      logInfo(`step1 dragStart(86): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["App1"]');
      const step3: string = subject.movedName();
      logInfo(`step3 movedName(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(1);
      logInfo(`step4 order(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["App1"]');
      const step5: string[] = subject.order();
      logInfo(`step5 order(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(1);
      logInfo(`step5 order(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["App1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0024
     * @tc.name      DragAndExchange_GridDragSessionFlow_0024
     * @tc.desc      GridDragSession call flow drop > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0024 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: boolean = subject.drop(1, 1, false);
      logInfo(`step1 drop(1, 1, false): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.drop(2, 3, true);
      logInfo(`step2 drop(2, 3, true): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0025
     * @tc.name      DragAndExchange_GridDragSessionFlow_0025
     * @tc.desc      GridDragSession call flow order > drop > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0025 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: boolean = subject.drop(0, 100, true);
      logInfo(`step2 drop(0, 100, true): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.dragStart(153);
      logInfo(`step3 dragStart(153): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0026
     * @tc.name      DragAndExchange_GridDragSessionFlow_0026
     * @tc.desc      GridDragSession call flow drop > movedName > drop > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0026 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: boolean = subject.drop(172, 5, false);
      logInfo(`step1 drop(172, 5, false): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.drop(20, 0, true);
      logInfo(`step3 drop(20, 0, true): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.movedName();
      logInfo(`step4 movedName(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0027
     * @tc.name      DragAndExchange_GridDragSessionFlow_0027
     * @tc.desc      GridDragSession call flow dragStart > order > events > events > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0027 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.dragStart(174);
      logInfo(`step1 dragStart(174): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["App1","App2"]');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["grid:add0","grid:add1"]');
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(2);
      logInfo(`step4 events(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["grid:add0","grid:add1"]');
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(2);
      logInfo(`step5 events(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["grid:add0","grid:add1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0028
     * @tc.name      DragAndExchange_GridDragSessionFlow_0028
     * @tc.desc      GridDragSession call flow movedName > dragStart > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0028 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.dragStart(83.28);
      logInfo(`step2 dragStart(83.28): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0029
     * @tc.name      DragAndExchange_GridDragSessionFlow_0029
     * @tc.desc      GridDragSession call flow dragStart > events > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0029 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.dragStart(128);
      logInfo(`step1 dragStart(128): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["grid:add0"]');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["grid:add0"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0030
     * @tc.name      DragAndExchange_GridDragSessionFlow_0030
     * @tc.desc      GridDragSession call flow order > events > dragStart > dragStart > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0030 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1","App2"]');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["grid:add0","grid:add1"]');
      const step3: string = subject.dragStart(-68);
      logInfo(`step3 dragStart(-68): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.dragStart(54.38);
      logInfo(`step4 dragStart(54.38): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.movedName();
      logInfo(`step5 movedName(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0031
     * @tc.name      DragAndExchange_GridDragSessionFlow_0031
     * @tc.desc      GridDragSession call flow events > movedName > movedName > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0031 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.movedName();
      logInfo(`step3 movedName(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0032
     * @tc.name      DragAndExchange_GridDragSessionFlow_0032
     * @tc.desc      GridDragSession call flow order > events > drop > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0032 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1"]');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["grid:add0"]');
      const step3: boolean = subject.drop(3, 10, true);
      logInfo(`step3 drop(3, 10, true): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(1);
      logInfo(`step4 order(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["App1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0033
     * @tc.name      DragAndExchange_GridDragSessionFlow_0033
     * @tc.desc      GridDragSession call flow events > events > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0033 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0034
     * @tc.name      DragAndExchange_GridDragSessionFlow_0034
     * @tc.desc      GridDragSession call flow order > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0034 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1"]');
      const step2: boolean = subject.drop(10, 10, false);
      logInfo(`step2 drop(10, 10, false): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0035
     * @tc.name      DragAndExchange_GridDragSessionFlow_0035
     * @tc.desc      GridDragSession call flow movedName > events > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0035 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["grid:add0","grid:add1"]');
      const step3: string = subject.movedName();
      logInfo(`step3 movedName(): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0036
     * @tc.name      DragAndExchange_GridDragSessionFlow_0036
     * @tc.desc      GridDragSession call flow drop > events > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0036 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: boolean = subject.drop(3, 10, true);
      logInfo(`step1 drop(3, 10, true): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["grid:add0","grid:add1"]');
      const step3: boolean = subject.drop(0, 5, false);
      logInfo(`step3 drop(0, 5, false): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0037
     * @tc.name      DragAndExchange_GridDragSessionFlow_0037
     * @tc.desc      GridDragSession call flow drop > events > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0037 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: boolean = subject.drop(0, 1, true);
      logInfo(`step1 drop(0, 1, true): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["grid:add0"]');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["grid:add0"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0038
     * @tc.name      DragAndExchange_GridDragSessionFlow_0038
     * @tc.desc      GridDragSession call flow drop > drop > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0038 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: boolean = subject.drop(0, 0, false);
      logInfo(`step1 drop(0, 0, false): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.drop(0, 1, false);
      logInfo(`step2 drop(0, 1, false): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.drop(4, 15, true);
      logInfo(`step3 drop(4, 15, true): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0039
     * @tc.name      DragAndExchange_GridDragSessionFlow_0039
     * @tc.desc      GridDragSession call flow order > order > dragStart > movedName > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0039 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string = subject.dragStart(89);
      logInfo(`step3 dragStart(89): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.movedName();
      logInfo(`step4 movedName(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: boolean = subject.drop(172, 3, false);
      logInfo(`step5 drop(172, 3, false): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0040
     * @tc.name      DragAndExchange_GridDragSessionFlow_0040
     * @tc.desc      GridDragSession call flow events > order > events > dragStart > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0040 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["grid:add0","grid:add1"]');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["App1","App2"]');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["grid:add0","grid:add1"]');
      const step4: string = subject.dragStart(24);
      logInfo(`step4 dragStart(24): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.dragStart(66.91);
      logInfo(`step5 dragStart(66.91): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0041
     * @tc.name      DragAndExchange_GridDragSessionFlow_0041
     * @tc.desc      GridDragSession call flow events > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0041 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string = subject.dragStart(53.78);
      logInfo(`step2 dragStart(53.78): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0042
     * @tc.name      DragAndExchange_GridDragSessionFlow_0042
     * @tc.desc      GridDragSession call flow order > events > movedName > order > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0042 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1","App2"]');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["grid:add0","grid:add1"]');
      const step3: string = subject.movedName();
      logInfo(`step3 movedName(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(2);
      logInfo(`step4 order(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["App1","App2"]');
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(2);
      logInfo(`step5 events(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["grid:add0","grid:add1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0043
     * @tc.name      DragAndExchange_GridDragSessionFlow_0043
     * @tc.desc      GridDragSession call flow order > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0043 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1"]');
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0044
     * @tc.name      DragAndExchange_GridDragSessionFlow_0044
     * @tc.desc      GridDragSession call flow dragStart > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0044 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.dragStart(115);
      logInfo(`step1 dragStart(115): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["grid:add0","grid:add1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0045
     * @tc.name      DragAndExchange_GridDragSessionFlow_0045
     * @tc.desc      GridDragSession call flow drop > order > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0045 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: boolean = subject.drop(4, 1, false);
      logInfo(`step1 drop(4, 1, false): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0046
     * @tc.name      DragAndExchange_GridDragSessionFlow_0046
     * @tc.desc      GridDragSession call flow events > drop > events > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0046 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["grid:add0"]');
      const step2: boolean = subject.drop(2, 3, false);
      logInfo(`step2 drop(2, 3, false): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["grid:add0"]');
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(1);
      logInfo(`step4 events(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["grid:add0"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0047
     * @tc.name      DragAndExchange_GridDragSessionFlow_0047
     * @tc.desc      GridDragSession call flow dragStart > movedName > order > dragStart > dragStart keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0047 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.dragStart(150);
      logInfo(`step1 dragStart(150): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["App1","App2"]');
      const step4: string = subject.dragStart(77.94);
      logInfo(`step4 dragStart(77.94): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.dragStart(92.6);
      logInfo(`step5 dragStart(92.6): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0048
     * @tc.name      DragAndExchange_GridDragSessionFlow_0048
     * @tc.desc      GridDragSession call flow order > movedName > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0048 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0049
     * @tc.name      DragAndExchange_GridDragSessionFlow_0049
     * @tc.desc      GridDragSession call flow order > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0049 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1"]');
      const step2: string = subject.dragStart(0);
      logInfo(`step2 dragStart(0): step2=${step2}`);
      expect(step2).assertEqual('App1');
      logInfo(`${BUNDLE}GridDragSessionFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0050
     * @tc.name      DragAndExchange_GridDragSessionFlow_0050
     * @tc.desc      GridDragSession call flow movedName > movedName > drop > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0050 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.drop(4, 2, true);
      logInfo(`step3 drop(4, 2, true): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.dragStart(53.78);
      logInfo(`step4 dragStart(53.78): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0051
     * @tc.name      DragAndExchange_GridDragSessionFlow_0051
     * @tc.desc      GridDragSession call flow drop > movedName > dragStart > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0051 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: boolean = subject.drop(0, 10, true);
      logInfo(`step1 drop(0, 10, true): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.dragStart(15.03);
      logInfo(`step3 dragStart(15.03): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.movedName();
      logInfo(`step4 movedName(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0052
     * @tc.name      DragAndExchange_GridDragSessionFlow_0052
     * @tc.desc      GridDragSession call flow dragStart > order > order > drop > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0052 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string = subject.dragStart(95.85);
      logInfo(`step1 dragStart(95.85): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: boolean = subject.drop(4, 10, false);
      logInfo(`step4 drop(4, 10, false): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.movedName();
      logInfo(`step5 movedName(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0053
     * @tc.name      DragAndExchange_GridDragSessionFlow_0053
     * @tc.desc      GridDragSession call flow events > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0053 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["grid:add0"]');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["App1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0054
     * @tc.name      DragAndExchange_GridDragSessionFlow_0054
     * @tc.desc      GridDragSession call flow events > events > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0054 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["grid:add0","grid:add1"]');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["grid:add0","grid:add1"]');
      const step3: string = subject.movedName();
      logInfo(`step3 movedName(): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0055
     * @tc.name      DragAndExchange_GridDragSessionFlow_0055
     * @tc.desc      GridDragSession call flow drop > drop > drop > events > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0055 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: boolean = subject.drop(15, 15, true);
      logInfo(`step1 drop(15, 15, true): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.drop(1, 100, false);
      logInfo(`step2 drop(1, 100, false): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.drop(172, 188, true);
      logInfo(`step3 drop(172, 188, true): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0056
     * @tc.name      DragAndExchange_GridDragSessionFlow_0056
     * @tc.desc      GridDragSession call flow events > dragStart > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0056 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["grid:add0"]');
      const step2: string = subject.dragStart(101);
      logInfo(`step2 dragStart(101): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["grid:add0"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0057
     * @tc.name      DragAndExchange_GridDragSessionFlow_0057
     * @tc.desc      GridDragSession call flow events > order > events > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0057 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["grid:add0","grid:add1"]');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["App1","App2"]');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["grid:add0","grid:add1"]');
      const step4: string = subject.movedName();
      logInfo(`step4 movedName(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0057 end`);
    });
  });
}
