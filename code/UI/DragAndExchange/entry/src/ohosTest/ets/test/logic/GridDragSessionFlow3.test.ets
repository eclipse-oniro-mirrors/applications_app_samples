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

/** Logic checks for GridDragSession flow (22 cases). */
export default function gridDragSessionFlow3Test(): void {
  describe('GridDragSessionFlow3Test', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0114
     * @tc.name      DragAndExchange_GridDragSessionFlow_0114
     * @tc.desc      GridDragSession call flow movedName > drop > drop > order > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0114 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.drop(0, 100, true);
      logInfo(`step2 drop(0, 100, true): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.drop(100, 20, false);
      logInfo(`step3 drop(100, 20, false): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0115
     * @tc.name      DragAndExchange_GridDragSessionFlow_0115
     * @tc.desc      GridDragSession call flow events > order > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0115 begin`);
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
      const step3: string = subject.movedName();
      logInfo(`step3 movedName(): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0116
     * @tc.name      DragAndExchange_GridDragSessionFlow_0116
     * @tc.desc      GridDragSession call flow dragStart > events > events > drop > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0116 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.dragStart(32.64);
      logInfo(`step1 dragStart(32.64): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["grid:add0","grid:add1"]');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["grid:add0","grid:add1"]');
      const step4: boolean = subject.drop(10, 1, false);
      logInfo(`step4 drop(10, 1, false): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.dragStart(85);
      logInfo(`step5 dragStart(85): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0117
     * @tc.name      DragAndExchange_GridDragSessionFlow_0117
     * @tc.desc      GridDragSession call flow movedName > events > dragStart > order > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0117 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string = subject.dragStart(92.6);
      logInfo(`step3 dragStart(92.6): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string = subject.dragStart(120);
      logInfo(`step5 dragStart(120): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0118
     * @tc.name      DragAndExchange_GridDragSessionFlow_0118
     * @tc.desc      GridDragSession call flow events > events > dragStart > movedName > movedName keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0118 begin`);
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
      const step3: string = subject.dragStart(101);
      logInfo(`step3 dragStart(101): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.movedName();
      logInfo(`step4 movedName(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.movedName();
      logInfo(`step5 movedName(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0119
     * @tc.name      DragAndExchange_GridDragSessionFlow_0119
     * @tc.desc      GridDragSession call flow dragStart > drop > drop > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0119 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string = subject.dragStart(0.59);
      logInfo(`step1 dragStart(0.59): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.drop(0, 5, true);
      logInfo(`step2 drop(0, 5, true): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.drop(20, 1, false);
      logInfo(`step3 drop(20, 1, false): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0120
     * @tc.name      DragAndExchange_GridDragSessionFlow_0120
     * @tc.desc      GridDragSession call flow drop > movedName > order > events > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0120 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: boolean = subject.drop(0, 188, true);
      logInfo(`step1 drop(0, 188, true): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["App1"]');
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(1);
      logInfo(`step4 events(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["grid:add0"]');
      const step5: string = subject.movedName();
      logInfo(`step5 movedName(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0121
     * @tc.name      DragAndExchange_GridDragSessionFlow_0121
     * @tc.desc      GridDragSession call flow movedName > drop > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0121 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.drop(5, 20, true);
      logInfo(`step2 drop(5, 20, true): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.drop(20, 10, true);
      logInfo(`step3 drop(20, 10, true): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0122
     * @tc.name      DragAndExchange_GridDragSessionFlow_0122
     * @tc.desc      GridDragSession call flow dragStart > order > events > order > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0122 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.dragStart(95);
      logInfo(`step1 dragStart(95): step1=${step1}`);
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
      logInfo(`${BUNDLE}GridDragSessionFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0123
     * @tc.name      DragAndExchange_GridDragSessionFlow_0123
     * @tc.desc      GridDragSession call flow order > dragStart > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0123 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1","App2"]');
      const step2: string = subject.dragStart(54.38);
      logInfo(`step2 dragStart(54.38): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["grid:add0","grid:add1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0124
     * @tc.name      DragAndExchange_GridDragSessionFlow_0124
     * @tc.desc      GridDragSession call flow order > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0124 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1"]');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["App1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0125
     * @tc.name      DragAndExchange_GridDragSessionFlow_0125
     * @tc.desc      GridDragSession call flow drop > drop > drop > movedName > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0125 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: boolean = subject.drop(4, -1, true);
      logInfo(`step1 drop(4, -1, true): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.drop(172, 10, true);
      logInfo(`step2 drop(172, 10, true): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.drop(4, 188, false);
      logInfo(`step3 drop(4, 188, false): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.movedName();
      logInfo(`step4 movedName(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.movedName();
      logInfo(`step5 movedName(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0126
     * @tc.name      DragAndExchange_GridDragSessionFlow_0126
     * @tc.desc      GridDragSession call flow movedName > order > movedName > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0126 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string = subject.movedName();
      logInfo(`step3 movedName(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.movedName();
      logInfo(`step4 movedName(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0127
     * @tc.name      DragAndExchange_GridDragSessionFlow_0127
     * @tc.desc      GridDragSession call flow events > events > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0127 begin`);
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
      const step3: string = subject.dragStart(15);
      logInfo(`step3 dragStart(15): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0128
     * @tc.name      DragAndExchange_GridDragSessionFlow_0128
     * @tc.desc      GridDragSession call flow order > movedName > drop > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0128 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1","App2"]');
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.drop(4, 0, true);
      logInfo(`step3 drop(4, 0, true): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(3);
      logInfo(`step4 events(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["grid:add0","grid:add1","grid:reload"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0129
     * @tc.name      DragAndExchange_GridDragSessionFlow_0129
     * @tc.desc      GridDragSession call flow movedName > drop > order > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0129 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.drop(0, 0, false);
      logInfo(`step2 drop(0, 0, false): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string = subject.dragStart(85);
      logInfo(`step4 dragStart(85): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0130
     * @tc.name      DragAndExchange_GridDragSessionFlow_0130
     * @tc.desc      GridDragSession call flow order > events > events > events > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0130 begin`);
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
      const step5: string[] = subject.order();
      logInfo(`step5 order(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(1);
      logInfo(`step5 order(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["App1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0131
     * @tc.name      DragAndExchange_GridDragSessionFlow_0131
     * @tc.desc      GridDragSession call flow movedName > order > movedName > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0131 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["App1","App2"]');
      const step3: string = subject.movedName();
      logInfo(`step3 movedName(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.drop(100, 0, true);
      logInfo(`step4 drop(100, 0, true): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`${BUNDLE}GridDragSessionFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0132
     * @tc.name      DragAndExchange_GridDragSessionFlow_0132
     * @tc.desc      GridDragSession call flow events > order > order > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0132 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: boolean = subject.drop(0, 0, false);
      logInfo(`step4 drop(0, 0, false): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0133
     * @tc.name      DragAndExchange_GridDragSessionFlow_0133
     * @tc.desc      GridDragSession call flow movedName > events > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0133 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["grid:add0","grid:add1"]');
      const step3: boolean = subject.drop(100, 15, true);
      logInfo(`step3 drop(100, 15, true): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0134
     * @tc.name      DragAndExchange_GridDragSessionFlow_0134
     * @tc.desc      GridDragSession call flow dragStart > movedName > order > drop > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0134 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.dragStart(-76);
      logInfo(`step1 dragStart(-76): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["App1"]');
      const step4: boolean = subject.drop(172, 10, true);
      logInfo(`step4 drop(172, 10, true): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.drop(4, 0, true);
      logInfo(`step5 drop(4, 0, true): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`${BUNDLE}GridDragSessionFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0135
     * @tc.name      DragAndExchange_GridDragSessionFlow_0135
     * @tc.desc      GridDragSession call flow dragStart > events > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0135 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.dragStart(135);
      logInfo(`step1 dragStart(135): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["grid:add0","grid:add1"]');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["grid:add0","grid:add1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0135 end`);
    });
  });
}
