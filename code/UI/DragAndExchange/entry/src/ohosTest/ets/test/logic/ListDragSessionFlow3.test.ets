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
import { ListDragSession } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ListDragSession flow (14 cases). */
export default function listDragSessionFlow3Test(): void {
  describe('ListDragSessionFlow3Test', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0122
     * @tc.name      DragAndExchange_ListDragSessionFlow_0122
     * @tc.desc      ListDragSession call flow currentDragIndex > dragEnd > events > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0122 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: number = subject.currentDragIndex();
      logInfo(`step1 currentDragIndex(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.dragEnd(59.65);
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["list:add0","list:add1"]');
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(2);
      logInfo(`step4 events(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["list:add0","list:add1"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0123
     * @tc.name      DragAndExchange_ListDragSessionFlow_0123
     * @tc.desc      ListDragSession call flow drop > dragEnd > order > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0123 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: boolean = subject.drop('u7eVoHn');
      logInfo(`step1 drop("u7eVoHn"): step1=${step1}`);
      expect(step1).assertTrue();
      subject.dragEnd(66.67);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 order(): step3[0]=${step3[0]}`);
      expect(step3[0]).assertUndefined();
      const step4: boolean = subject.drop('  ');
      logInfo(`step4 drop("  "): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0124
     * @tc.name      DragAndExchange_ListDragSessionFlow_0124
     * @tc.desc      ListDragSession call flow dragStart > currentDragIndex > drop > visibleCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0124 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: number = subject.dragStart(0, ' Hello World ');
      logInfo(`step1 dragStart(0, " Hello World "): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.currentDragIndex();
      logInfo(`step2 currentDragIndex(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: boolean = subject.drop('   ');
      logInfo(`step3 drop("   "): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.visibleCount();
      logInfo(`step4 visibleCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0125
     * @tc.name      DragAndExchange_ListDragSessionFlow_0125
     * @tc.desc      ListDragSession call flow currentDragIndex > order > dragEnd > dragStart > visibleCount keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0125 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.currentDragIndex();
      logInfo(`step1 currentDragIndex(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.dragEnd(175);
      const step4: number = subject.dragStart(0, ' Hello World ');
      logInfo(`step4 dragStart(0, " Hello World "): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.visibleCount();
      logInfo(`step5 visibleCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0126
     * @tc.name      DragAndExchange_ListDragSessionFlow_0126
     * @tc.desc      ListDragSession call flow dragStart > drop > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0126 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: number = subject.dragStart(70, '');
      logInfo(`step1 dragStart(70, ""): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.drop('eElXjYQny');
      logInfo(`step2 drop("eElXjYQny"): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["Item1"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0127
     * @tc.name      DragAndExchange_ListDragSessionFlow_0127
     * @tc.desc      ListDragSession call flow events > visibleCount > currentDragIndex > visibleCount > dragEnd keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0127 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["list:add0","list:add1"]');
      const step2: number = subject.visibleCount();
      logInfo(`step2 visibleCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.currentDragIndex();
      logInfo(`step3 currentDragIndex(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.visibleCount();
      logInfo(`step4 visibleCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      subject.dragEnd(142);
      logInfo(`${BUNDLE}ListDragSessionFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0128
     * @tc.name      DragAndExchange_ListDragSessionFlow_0128
     * @tc.desc      ListDragSession call flow drop > events > currentDragIndex > currentDragIndex > visibleCount kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0128 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: boolean = subject.drop('g');
      logInfo(`step1 drop("g"): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["list:reload"]');
      const step3: number = subject.currentDragIndex();
      logInfo(`step3 currentDragIndex(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.currentDragIndex();
      logInfo(`step4 currentDragIndex(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.visibleCount();
      logInfo(`step5 visibleCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0129
     * @tc.name      DragAndExchange_ListDragSessionFlow_0129
     * @tc.desc      ListDragSession call flow order > visibleCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0129 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["Item1"]');
      const step2: number = subject.visibleCount();
      logInfo(`step2 visibleCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0130
     * @tc.name      DragAndExchange_ListDragSessionFlow_0130
     * @tc.desc      ListDragSession call flow visibleCount > dragEnd > visibleCount > order > dragEnd keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0130 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.dragEnd(45);
      const step3: number = subject.visibleCount();
      logInfo(`step3 visibleCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(2);
      logInfo(`step4 order(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["Item1","Item2"]');
      subject.dragEnd(170);
      logInfo(`${BUNDLE}ListDragSessionFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0131
     * @tc.name      DragAndExchange_ListDragSessionFlow_0131
     * @tc.desc      ListDragSession call flow dragStart > currentDragIndex > currentDragIndex keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0131 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: number = subject.dragStart(65, 'a');
      logInfo(`step1 dragStart(65, "a"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.currentDragIndex();
      logInfo(`step2 currentDragIndex(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.currentDragIndex();
      logInfo(`step3 currentDragIndex(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0132
     * @tc.name      DragAndExchange_ListDragSessionFlow_0132
     * @tc.desc      ListDragSession call flow dragStart > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0132 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: number = subject.dragStart(15, 'xabc');
      logInfo(`step1 dragStart(15, "xabc"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["Item1","Item2"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0133
     * @tc.name      DragAndExchange_ListDragSessionFlow_0133
     * @tc.desc      ListDragSession call flow visibleCount > currentDragIndex > drop > visibleCount keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0133 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.currentDragIndex();
      logInfo(`step2 currentDragIndex(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.drop('Hello World');
      logInfo(`step3 drop("Hello World"): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.visibleCount();
      logInfo(`step4 visibleCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0134
     * @tc.name      DragAndExchange_ListDragSessionFlow_0134
     * @tc.desc      ListDragSession call flow drop > events > events > dragStart > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0134 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: boolean = subject.drop('Ux');
      logInfo(`step1 drop("Ux"): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["list:add0","list:reload"]');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["list:add0","list:reload"]');
      const step4: number = subject.dragStart(0, 'Hello World');
      logInfo(`step4 dragStart(0, "Hello World"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: boolean = subject.drop('lDiAja2vQwt');
      logInfo(`step5 drop("lDiAja2vQwt"): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0135
     * @tc.name      DragAndExchange_ListDragSessionFlow_0135
     * @tc.desc      ListDragSession call flow visibleCount > dragStart > dragStart > drop > events keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0135 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.dragStart(65, 'abc');
      logInfo(`step2 dragStart(65, "abc"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.dragStart(40, 'xa');
      logInfo(`step3 dragStart(40, "xa"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: boolean = subject.drop('wB6bx7');
      logInfo(`step4 drop("wB6bx7"): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(1);
      logInfo(`step5 events(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["list:reload"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0135 end`);
    });
  });
}
