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

/** Logic checks for GridDragSession flow (56 cases). */
export default function gridDragSessionFlow2Test(): void {
  describe('GridDragSessionFlow2Test', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0058
     * @tc.name      DragAndExchange_GridDragSessionFlow_0058
     * @tc.desc      GridDragSession call flow drop > dragStart > dragStart > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0058 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: boolean = subject.drop(100, 15, true);
      logInfo(`step1 drop(100, 15, true): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.dragStart(-84);
      logInfo(`step2 dragStart(-84): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.dragStart(-87);
      logInfo(`step3 dragStart(-87): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0059
     * @tc.name      DragAndExchange_GridDragSessionFlow_0059
     * @tc.desc      GridDragSession call flow drop > dragStart > drop > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0059 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: boolean = subject.drop(15, -1, true);
      logInfo(`step1 drop(15, -1, true): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string = subject.dragStart(115);
      logInfo(`step2 dragStart(115): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.drop(2, 15, true);
      logInfo(`step3 drop(2, 15, true): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(16);
      logInfo(`step4 order(): step4[0]=${step4[0]}`);
      expect(step4[0]).assertEqual('App1');
      logInfo(`${BUNDLE}GridDragSessionFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0060
     * @tc.name      DragAndExchange_GridDragSessionFlow_0060
     * @tc.desc      GridDragSession call flow drop > movedName > movedName > events > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0060 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: boolean = subject.drop(1, 15, true);
      logInfo(`step1 drop(1, 15, true): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.movedName();
      logInfo(`step3 movedName(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(2);
      logInfo(`step4 events(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["grid:add0","grid:add1"]');
      const step5: boolean = subject.drop(4, 188, false);
      logInfo(`step5 drop(4, 188, false): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0061
     * @tc.name      DragAndExchange_GridDragSessionFlow_0061
     * @tc.desc      GridDragSession call flow drop > order > drop > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0061 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: boolean = subject.drop(0, 3, false);
      logInfo(`step1 drop(0, 3, false): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: boolean = subject.drop(-1, 10, false);
      logInfo(`step3 drop(-1, 10, false): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0062
     * @tc.name      DragAndExchange_GridDragSessionFlow_0062
     * @tc.desc      GridDragSession call flow order > drop > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0062 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1","App2"]');
      const step2: boolean = subject.drop(3, 0, true);
      logInfo(`step2 drop(3, 0, true): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string = subject.dragStart(92.6);
      logInfo(`step3 dragStart(92.6): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0063
     * @tc.name      DragAndExchange_GridDragSessionFlow_0063
     * @tc.desc      GridDragSession call flow drop > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0063 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: boolean = subject.drop(1, 15, true);
      logInfo(`step1 drop(1, 15, true): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0064
     * @tc.name      DragAndExchange_GridDragSessionFlow_0064
     * @tc.desc      GridDragSession call flow dragStart > movedName > events > events > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0064 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.dragStart(48.32);
      logInfo(`step1 dragStart(48.32): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
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
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(1);
      logInfo(`step5 events(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["grid:add0"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0065
     * @tc.name      DragAndExchange_GridDragSessionFlow_0065
     * @tc.desc      GridDragSession call flow order > order > events > drop > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0065 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1","App2"]');
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
      const step4: boolean = subject.drop(1, 2, true);
      logInfo(`step4 drop(1, 2, true): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string[] = subject.order();
      logInfo(`step5 order(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(2);
      logInfo(`step5 order(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["App1","App2"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0066
     * @tc.name      DragAndExchange_GridDragSessionFlow_0066
     * @tc.desc      GridDragSession call flow order > order > dragStart > dragStart > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0066 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string = subject.dragStart(-68);
      logInfo(`step3 dragStart(-68): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.dragStart(145);
      logInfo(`step4 dragStart(145): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.dragStart(86);
      logInfo(`step5 dragStart(86): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0067
     * @tc.name      DragAndExchange_GridDragSessionFlow_0067
     * @tc.desc      GridDragSession call flow events > order > dragStart > dragStart > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0067 begin`);
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
      const step3: string = subject.dragStart(75);
      logInfo(`step3 dragStart(75): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.dragStart(169);
      logInfo(`step4 dragStart(169): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(1);
      logInfo(`step5 events(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["grid:add0"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0068
     * @tc.name      DragAndExchange_GridDragSessionFlow_0068
     * @tc.desc      GridDragSession call flow order > order > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0068 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1","App2"]');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["App1","App2"]');
      const step3: string = subject.movedName();
      logInfo(`step3 movedName(): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0069
     * @tc.name      DragAndExchange_GridDragSessionFlow_0069
     * @tc.desc      GridDragSession call flow dragStart > order > dragStart > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0069 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string = subject.dragStart(140);
      logInfo(`step1 dragStart(140): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string = subject.dragStart(175);
      logInfo(`step3 dragStart(175): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0070
     * @tc.name      DragAndExchange_GridDragSessionFlow_0070
     * @tc.desc      GridDragSession call flow movedName > events > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0070 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["grid:add0"]');
      const step3: string = subject.dragStart(136);
      logInfo(`step3 dragStart(136): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0071
     * @tc.name      DragAndExchange_GridDragSessionFlow_0071
     * @tc.desc      GridDragSession call flow events > order > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0071 begin`);
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
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["App1","App2"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0072
     * @tc.name      DragAndExchange_GridDragSessionFlow_0072
     * @tc.desc      GridDragSession call flow order > dragStart > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0072 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string = subject.dragStart(80);
      logInfo(`step2 dragStart(80): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.movedName();
      logInfo(`step3 movedName(): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0073
     * @tc.name      DragAndExchange_GridDragSessionFlow_0073
     * @tc.desc      GridDragSession call flow movedName > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0073 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.drop(10, 0, true);
      logInfo(`step2 drop(10, 0, true): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`${BUNDLE}GridDragSessionFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0074
     * @tc.name      DragAndExchange_GridDragSessionFlow_0074
     * @tc.desc      GridDragSession call flow order > movedName > movedName > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0074 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1","App2"]');
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.movedName();
      logInfo(`step3 movedName(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(2);
      logInfo(`step4 events(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["grid:add0","grid:add1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0075
     * @tc.name      DragAndExchange_GridDragSessionFlow_0075
     * @tc.desc      GridDragSession call flow order > events > movedName > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0075 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string = subject.movedName();
      logInfo(`step3 movedName(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: boolean = subject.drop(2, 20, false);
      logInfo(`step4 drop(2, 20, false): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0076
     * @tc.name      DragAndExchange_GridDragSessionFlow_0076
     * @tc.desc      GridDragSession call flow order > drop > order > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0076 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1","App2"]');
      const step2: boolean = subject.drop(10, 100, false);
      logInfo(`step2 drop(10, 100, false): step2=${step2}`);
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
      logInfo(`${BUNDLE}GridDragSessionFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0077
     * @tc.name      DragAndExchange_GridDragSessionFlow_0077
     * @tc.desc      GridDragSession call flow events > events > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0077 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string = subject.movedName();
      logInfo(`step3 movedName(): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0078
     * @tc.name      DragAndExchange_GridDragSessionFlow_0078
     * @tc.desc      GridDragSession call flow dragStart > events > order > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0078 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.dragStart(108);
      logInfo(`step1 dragStart(108): step1=${step1}`);
      expect(step1).assertEqual('');
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
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(1);
      logInfo(`step4 order(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["App1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0079
     * @tc.name      DragAndExchange_GridDragSessionFlow_0079
     * @tc.desc      GridDragSession call flow movedName > drop > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0079 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.drop(20, 5, true);
      logInfo(`step2 drop(20, 5, true): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.dragStart(135);
      logInfo(`step3 dragStart(135): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0080
     * @tc.name      DragAndExchange_GridDragSessionFlow_0080
     * @tc.desc      GridDragSession call flow movedName > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0080 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0081
     * @tc.name      DragAndExchange_GridDragSessionFlow_0081
     * @tc.desc      GridDragSession call flow dragStart > order > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0081 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.dragStart(20);
      logInfo(`step1 dragStart(20): step1=${step1}`);
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
      logInfo(`${BUNDLE}GridDragSessionFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0082
     * @tc.name      DragAndExchange_GridDragSessionFlow_0082
     * @tc.desc      GridDragSession call flow movedName > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0082 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["App1","App2"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0083
     * @tc.name      DragAndExchange_GridDragSessionFlow_0083
     * @tc.desc      GridDragSession call flow order > dragStart > dragStart > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0083 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string = subject.dragStart(32.64);
      logInfo(`step2 dragStart(32.64): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.dragStart(54.38);
      logInfo(`step3 dragStart(54.38): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.dragStart(11);
      logInfo(`step4 dragStart(11): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0084
     * @tc.name      DragAndExchange_GridDragSessionFlow_0084
     * @tc.desc      GridDragSession call flow dragStart > movedName > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0084 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.dragStart(29.95);
      logInfo(`step1 dragStart(29.95): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["App1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0085
     * @tc.name      DragAndExchange_GridDragSessionFlow_0085
     * @tc.desc      GridDragSession call flow movedName > events > order > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0085 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["grid:add0","grid:add1"]');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["App1","App2"]');
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(2);
      logInfo(`step4 events(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["grid:add0","grid:add1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0086
     * @tc.name      DragAndExchange_GridDragSessionFlow_0086
     * @tc.desc      GridDragSession call flow events > dragStart > drop > drop > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0086 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string = subject.dragStart(92.6);
      logInfo(`step2 dragStart(92.6): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.drop(1, 3, false);
      logInfo(`step3 drop(1, 3, false): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.drop(20, 3, false);
      logInfo(`step4 drop(20, 3, false): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: boolean = subject.drop(0, 5, true);
      logInfo(`step5 drop(0, 5, true): step5=${step5}`);
      expect(step5).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0087
     * @tc.name      DragAndExchange_GridDragSessionFlow_0087
     * @tc.desc      GridDragSession call flow movedName > events > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0087 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["grid:add0"]');
      const step3: boolean = subject.drop(1, 10, true);
      logInfo(`step3 drop(1, 10, true): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0088
     * @tc.name      DragAndExchange_GridDragSessionFlow_0088
     * @tc.desc      GridDragSession call flow dragStart > drop > drop > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0088 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.dragStart(190);
      logInfo(`step1 dragStart(190): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.drop(-1, 10, false);
      logInfo(`step2 drop(-1, 10, false): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.drop(1, -1, false);
      logInfo(`step3 drop(1, -1, false): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.drop(0, 10, true);
      logInfo(`step4 drop(0, 10, true): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0089
     * @tc.name      DragAndExchange_GridDragSessionFlow_0089
     * @tc.desc      GridDragSession call flow drop > drop > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0089 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: boolean = subject.drop(0, 5, false);
      logInfo(`step1 drop(0, 5, false): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.drop(1, 15, false);
      logInfo(`step2 drop(1, 15, false): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0090
     * @tc.name      DragAndExchange_GridDragSessionFlow_0090
     * @tc.desc      GridDragSession call flow movedName > order > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0090 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["App1"]');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["App1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0091
     * @tc.name      DragAndExchange_GridDragSessionFlow_0091
     * @tc.desc      GridDragSession call flow order > events > order > events > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0091 begin`);
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
      logInfo(`${BUNDLE}GridDragSessionFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0092
     * @tc.name      DragAndExchange_GridDragSessionFlow_0092
     * @tc.desc      GridDragSession call flow events > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0092 begin`);
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
      logInfo(`${BUNDLE}GridDragSessionFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0093
     * @tc.name      DragAndExchange_GridDragSessionFlow_0093
     * @tc.desc      GridDragSession call flow order > movedName > events > events > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0093 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string = subject.movedName();
      logInfo(`step5 movedName(): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0094
     * @tc.name      DragAndExchange_GridDragSessionFlow_0094
     * @tc.desc      GridDragSession call flow movedName > dragStart > events > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0094 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.dragStart(118);
      logInfo(`step2 dragStart(118): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["grid:add0","grid:add1"]');
      const step4: string = subject.movedName();
      logInfo(`step4 movedName(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0095
     * @tc.name      DragAndExchange_GridDragSessionFlow_0095
     * @tc.desc      GridDragSession call flow dragStart > events > drop > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0095 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.dragStart(100);
      logInfo(`step1 dragStart(100): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["grid:add0"]');
      const step3: boolean = subject.drop(0, 0, true);
      logInfo(`step3 drop(0, 0, true): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.dragStart(87);
      logInfo(`step4 dragStart(87): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0096
     * @tc.name      DragAndExchange_GridDragSessionFlow_0096
     * @tc.desc      GridDragSession call flow order > dragStart > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0096 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1","App2"]');
      const step2: string = subject.dragStart(38.18);
      logInfo(`step2 dragStart(38.18): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["App1","App2"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0097
     * @tc.name      DragAndExchange_GridDragSessionFlow_0097
     * @tc.desc      GridDragSession call flow order > dragStart > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0097 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1","App2"]');
      const step2: string = subject.dragStart(88.28);
      logInfo(`step2 dragStart(88.28): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.drop(0, 188, true);
      logInfo(`step3 drop(0, 188, true): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0098
     * @tc.name      DragAndExchange_GridDragSessionFlow_0098
     * @tc.desc      GridDragSession call flow order > drop > movedName > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0098 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: boolean = subject.drop(100, 100, false);
      logInfo(`step2 drop(100, 100, false): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.movedName();
      logInfo(`step3 movedName(): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0099
     * @tc.name      DragAndExchange_GridDragSessionFlow_0099
     * @tc.desc      GridDragSession call flow movedName > events > events > drop > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0099 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
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
      const step4: boolean = subject.drop(172, 20, true);
      logInfo(`step4 drop(172, 20, true): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string[] = subject.order();
      logInfo(`step5 order(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(1);
      logInfo(`step5 order(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["App1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0100
     * @tc.name      DragAndExchange_GridDragSessionFlow_0100
     * @tc.desc      GridDragSession call flow events > movedName > drop > drop > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0100 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.drop(2, 20, false);
      logInfo(`step3 drop(2, 20, false): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: boolean = subject.drop(2, 100, true);
      logInfo(`step4 drop(2, 100, true): step4=${step4}`);
      expect(step4).assertFalse();
      const step5: string = subject.dragStart(105);
      logInfo(`step5 dragStart(105): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0101
     * @tc.name      DragAndExchange_GridDragSessionFlow_0101
     * @tc.desc      GridDragSession call flow drop > movedName > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0101 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: boolean = subject.drop(3, 100, false);
      logInfo(`step1 drop(3, 100, false): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["App1","App2"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0102
     * @tc.name      DragAndExchange_GridDragSessionFlow_0102
     * @tc.desc      GridDragSession call flow order > drop > drop > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0102 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1"]');
      const step2: boolean = subject.drop(15, -1, true);
      logInfo(`step2 drop(15, -1, true): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.drop(4, -1, true);
      logInfo(`step3 drop(4, -1, true): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string = subject.dragStart(16.35);
      logInfo(`step4 dragStart(16.35): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0103
     * @tc.name      DragAndExchange_GridDragSessionFlow_0103
     * @tc.desc      GridDragSession call flow drop > movedName > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0103 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: boolean = subject.drop(0, 6.86, true);
      logInfo(`step1 drop(0, 6.86, true): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.dragStart(37.25);
      logInfo(`step3 dragStart(37.25): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0104
     * @tc.name      DragAndExchange_GridDragSessionFlow_0104
     * @tc.desc      GridDragSession call flow events > events > drop > events > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0104 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: boolean = subject.drop(172, 5, false);
      logInfo(`step3 drop(172, 5, false): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.order();
      logInfo(`step5 order(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0105
     * @tc.name      DragAndExchange_GridDragSessionFlow_0105
     * @tc.desc      GridDragSession call flow dragStart > dragStart > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0105 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.dragStart(160);
      logInfo(`step1 dragStart(160): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.dragStart(24);
      logInfo(`step2 dragStart(24): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.drop(172, 3, false);
      logInfo(`step3 drop(172, 3, false): step3=${step3}`);
      expect(step3).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0106
     * @tc.name      DragAndExchange_GridDragSessionFlow_0106
     * @tc.desc      GridDragSession call flow events > order > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0106 begin`);
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
      logInfo(`${BUNDLE}GridDragSessionFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0107
     * @tc.name      DragAndExchange_GridDragSessionFlow_0107
     * @tc.desc      GridDragSession call flow drop > drop > drop > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0107 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: boolean = subject.drop(1, 2, true);
      logInfo(`step1 drop(1, 2, true): step1=${step1}`);
      expect(step1).assertFalse();
      const step2: boolean = subject.drop(-1, 10, false);
      logInfo(`step2 drop(-1, 10, false): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: boolean = subject.drop(0, 10, true);
      logInfo(`step3 drop(0, 10, true): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}GridDragSessionFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0108
     * @tc.name      DragAndExchange_GridDragSessionFlow_0108
     * @tc.desc      GridDragSession call flow movedName > dragStart > drop > dragStart > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0108 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.dragStart(58.04);
      logInfo(`step2 dragStart(58.04): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: boolean = subject.drop(0, 100, true);
      logInfo(`step3 drop(0, 100, true): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string = subject.dragStart(3);
      logInfo(`step4 dragStart(3): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string[] = subject.order();
      logInfo(`step5 order(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(1);
      logInfo(`step5 order(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["App1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0109
     * @tc.name      DragAndExchange_GridDragSessionFlow_0109
     * @tc.desc      GridDragSession call flow movedName > movedName > events > movedName keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0109 begin`);
      const subject: GridDragSession = new GridDragSession(0);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.movedName();
      logInfo(`step2 movedName(): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string = subject.movedName();
      logInfo(`step4 movedName(): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}GridDragSessionFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0110
     * @tc.name      DragAndExchange_GridDragSessionFlow_0110
     * @tc.desc      GridDragSession call flow movedName > drop > dragStart > movedName > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0110 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.drop(-1, -1, false);
      logInfo(`step2 drop(-1, -1, false): step2=${step2}`);
      expect(step2).assertFalse();
      const step3: string = subject.dragStart(20);
      logInfo(`step3 dragStart(20): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.movedName();
      logInfo(`step4 movedName(): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(2);
      logInfo(`step5 events(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["grid:add0","grid:add1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0111
     * @tc.name      DragAndExchange_GridDragSessionFlow_0111
     * @tc.desc      GridDragSession call flow movedName > events > order > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0111 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
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
      const step4: boolean = subject.drop(0, 20, true);
      logInfo(`step4 drop(0, 20, true): step4=${step4}`);
      expect(step4).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0112
     * @tc.name      DragAndExchange_GridDragSessionFlow_0112
     * @tc.desc      GridDragSession call flow order > order > drop > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0112 begin`);
      const subject: GridDragSession = new GridDragSession(2);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["App1","App2"]');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["App1","App2"]');
      const step3: boolean = subject.drop(172, 1, false);
      logInfo(`step3 drop(172, 1, false): step3=${step3}`);
      expect(step3).assertFalse();
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(2);
      logInfo(`step4 events(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["grid:add0","grid:add1"]');
      logInfo(`${BUNDLE}GridDragSessionFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_GRID_DRAG_SESSION_FLOW_0113
     * @tc.name      DragAndExchange_GridDragSessionFlow_0113
     * @tc.desc      GridDragSession call flow movedName > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_GridDragSessionFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}GridDragSessionFlow_0113 begin`);
      const subject: GridDragSession = new GridDragSession(1);
      const step1: string = subject.movedName();
      logInfo(`step1 movedName(): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: boolean = subject.drop(2, 20, true);
      logInfo(`step2 drop(2, 20, true): step2=${step2}`);
      expect(step2).assertFalse();
      logInfo(`${BUNDLE}GridDragSessionFlow_0113 end`);
    });
  });
}
