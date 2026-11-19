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

/** Logic checks for ListDragSession flow (62 cases). */
export default function listDragSessionFlowTest(): void {
  describe('ListDragSessionFlowTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0001
     * @tc.name      DragAndExchange_ListDragSessionFlow_0001
     * @tc.desc      ListDragSession call flow events > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_ListDragSessionFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0001 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0002
     * @tc.name      DragAndExchange_ListDragSessionFlow_0002
     * @tc.desc      ListDragSession call flow visibleCount > order > dragEnd > dragEnd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_ListDragSessionFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0002 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["Item1"]');
      subject.dragEnd(-85);
      subject.dragEnd(26.82);
      logInfo(`${BUNDLE}ListDragSessionFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0003
     * @tc.name      DragAndExchange_ListDragSessionFlow_0003
     * @tc.desc      ListDragSession call flow drop > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0003 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: boolean = subject.drop('GRuEnkDiNvH');
      logInfo(`step1 drop("GRuEnkDiNvH"): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.drop('vR9s0j');
      logInfo(`step2 drop("vR9s0j"): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0004
     * @tc.name      DragAndExchange_ListDragSessionFlow_0004
     * @tc.desc      ListDragSession call flow dragStart > visibleCount > dragEnd > order > visibleCount keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0004 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.dragStart(90, '123123');
      logInfo(`step1 dragStart(90, "123123"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.visibleCount();
      logInfo(`step2 visibleCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.dragEnd(-89);
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: number = subject.visibleCount();
      logInfo(`step5 visibleCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0005
     * @tc.name      DragAndExchange_ListDragSessionFlow_0005
     * @tc.desc      ListDragSession call flow drop > dragStart > events > visibleCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0005 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: boolean = subject.drop('a_1');
      logInfo(`step1 drop("a_1"): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.dragStart(1, ' Hello World ');
      logInfo(`step2 dragStart(1, " Hello World "): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["list:add0","list:reload"]');
      const step4: number = subject.visibleCount();
      logInfo(`step4 visibleCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0006
     * @tc.name      DragAndExchange_ListDragSessionFlow_0006
     * @tc.desc      ListDragSession call flow dragEnd > events > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0006 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      subject.dragEnd(193);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["list:add0","list:add1"]');
      const step3: boolean = subject.drop('123');
      logInfo(`step3 drop("123"): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0007
     * @tc.name      DragAndExchange_ListDragSessionFlow_0007
     * @tc.desc      ListDragSession call flow dragEnd > currentDragIndex > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0007 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      subject.dragEnd(-14);
      const step2: number = subject.currentDragIndex();
      logInfo(`step2 currentDragIndex(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.dragStart(95, 'xabc');
      logInfo(`step3 dragStart(95, "xabc"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0008
     * @tc.name      DragAndExchange_ListDragSessionFlow_0008
     * @tc.desc      ListDragSession call flow order > currentDragIndex keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0008 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["Item1"]');
      const step2: number = subject.currentDragIndex();
      logInfo(`step2 currentDragIndex(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0009
     * @tc.name      DragAndExchange_ListDragSessionFlow_0009
     * @tc.desc      ListDragSession call flow events > dragEnd > dragEnd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0009 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["list:add0","list:add1"]');
      subject.dragEnd(29);
      subject.dragEnd(-89);
      logInfo(`${BUNDLE}ListDragSessionFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0010
     * @tc.name      DragAndExchange_ListDragSessionFlow_0010
     * @tc.desc      ListDragSession call flow visibleCount > currentDragIndex > events > visibleCount keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0010 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.currentDragIndex();
      logInfo(`step2 currentDragIndex(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: number = subject.visibleCount();
      logInfo(`step4 visibleCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0011
     * @tc.name      DragAndExchange_ListDragSessionFlow_0011
     * @tc.desc      ListDragSession call flow drop > dragStart > order > drop > visibleCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0011 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: boolean = subject.drop('');
      logInfo(`step1 drop(""): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.dragStart(10, 'Hello WorldHello World');
      logInfo(`step2 dragStart(10, "Hello WorldHello Wor...: step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 order(): step3[0]=${step3[0]}`);
      expect(step3[0]).assertUndefined();
      const step4: boolean = subject.drop('8PDl');
      logInfo(`step4 drop("8PDl"): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.visibleCount();
      logInfo(`step5 visibleCount(): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0012
     * @tc.name      DragAndExchange_ListDragSessionFlow_0012
     * @tc.desc      ListDragSession call flow drop > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0012 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: boolean = subject.drop('At');
      logInfo(`step1 drop("At"): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 order(): step2[0]=${step2[0]}`);
      expect(step2[0]).assertUndefined();
      logInfo(`${BUNDLE}ListDragSessionFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0013
     * @tc.name      DragAndExchange_ListDragSessionFlow_0013
     * @tc.desc      ListDragSession call flow events > events > currentDragIndex > dragStart > dragStart keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0013 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: number = subject.currentDragIndex();
      logInfo(`step3 currentDragIndex(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.dragStart(40, '123');
      logInfo(`step4 dragStart(40, "123"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.dragStart(8, ' ');
      logInfo(`step5 dragStart(8, " "): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0014
     * @tc.name      DragAndExchange_ListDragSessionFlow_0014
     * @tc.desc      ListDragSession call flow dragEnd > visibleCount > currentDragIndex > visibleCount keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0014 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      subject.dragEnd(1);
      const step2: number = subject.visibleCount();
      logInfo(`step2 visibleCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: number = subject.currentDragIndex();
      logInfo(`step3 currentDragIndex(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.visibleCount();
      logInfo(`step4 visibleCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0015
     * @tc.name      DragAndExchange_ListDragSessionFlow_0015
     * @tc.desc      ListDragSession call flow dragStart > dragStart > dragStart > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0015 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: number = subject.dragStart(75, 'abcabc');
      logInfo(`step1 dragStart(75, "abcabc"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.dragStart(90, '   ');
      logInfo(`step2 dragStart(90, "   "): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.dragStart(0, 'abc');
      logInfo(`step3 dragStart(0, "abc"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: boolean = subject.drop('abcabc');
      logInfo(`step4 drop("abcabc"): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0016
     * @tc.name      DragAndExchange_ListDragSessionFlow_0016
     * @tc.desc      ListDragSession call flow currentDragIndex > visibleCount > visibleCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0016 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.currentDragIndex();
      logInfo(`step1 currentDragIndex(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.visibleCount();
      logInfo(`step2 visibleCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.visibleCount();
      logInfo(`step3 visibleCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0017
     * @tc.name      DragAndExchange_ListDragSessionFlow_0017
     * @tc.desc      ListDragSession call flow visibleCount > dragEnd > visibleCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0017 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.dragEnd(155);
      const step3: number = subject.visibleCount();
      logInfo(`step3 visibleCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      logInfo(`${BUNDLE}ListDragSessionFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0018
     * @tc.name      DragAndExchange_ListDragSessionFlow_0018
     * @tc.desc      ListDragSession call flow drop > visibleCount > dragStart > dragStart > visibleCount keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0018 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: boolean = subject.drop('QF973pndln');
      logInfo(`step1 drop("QF973pndln"): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.visibleCount();
      logInfo(`step2 visibleCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.dragStart(110, 'xa');
      logInfo(`step3 dragStart(110, "xa"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.dragStart(100, 'abcabc');
      logInfo(`step4 dragStart(100, "abcabc"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.visibleCount();
      logInfo(`step5 visibleCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0019
     * @tc.name      DragAndExchange_ListDragSessionFlow_0019
     * @tc.desc      ListDragSession call flow order > dragStart > dragEnd > order > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0019 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["Item1"]');
      const step2: number = subject.dragStart(5, 'xHello World');
      logInfo(`step2 dragStart(5, "xHello World"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.dragEnd(58);
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(1);
      logInfo(`step4 order(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["Item1"]');
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(1);
      logInfo(`step5 events(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["list:add0"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0020
     * @tc.name      DragAndExchange_ListDragSessionFlow_0020
     * @tc.desc      ListDragSession call flow dragEnd > order > visibleCount > visibleCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0020 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      subject.dragEnd(58);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["Item1","Item2"]');
      const step3: number = subject.visibleCount();
      logInfo(`step3 visibleCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: number = subject.visibleCount();
      logInfo(`step4 visibleCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      logInfo(`${BUNDLE}ListDragSessionFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0021
     * @tc.name      DragAndExchange_ListDragSessionFlow_0021
     * @tc.desc      ListDragSession call flow visibleCount > order > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0021 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: boolean = subject.drop('M3wykyi');
      logInfo(`step3 drop("M3wykyi"): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0022
     * @tc.name      DragAndExchange_ListDragSessionFlow_0022
     * @tc.desc      ListDragSession call flow currentDragIndex > order > events > drop > dragStart keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0022 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: number = subject.currentDragIndex();
      logInfo(`step1 currentDragIndex(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["Item1"]');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["list:add0"]');
      const step4: boolean = subject.drop('RdJHm0N');
      logInfo(`step4 drop("RdJHm0N"): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.dragStart(80, 'abc');
      logInfo(`step5 dragStart(80, "abc"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0023
     * @tc.name      DragAndExchange_ListDragSessionFlow_0023
     * @tc.desc      ListDragSession call flow dragStart > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0023 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: number = subject.dragStart(20, 'Hello World');
      logInfo(`step1 dragStart(20, "Hello World"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.drop('gbtejxnZBMbf');
      logInfo(`step2 drop("gbtejxnZBMbf"): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0024
     * @tc.name      DragAndExchange_ListDragSessionFlow_0024
     * @tc.desc      ListDragSession call flow order > dragStart > visibleCount > dragEnd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0024 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.dragStart(40, '');
      logInfo(`step2 dragStart(40, ""): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.visibleCount();
      logInfo(`step3 visibleCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.dragEnd(-63);
      logInfo(`${BUNDLE}ListDragSessionFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0025
     * @tc.name      DragAndExchange_ListDragSessionFlow_0025
     * @tc.desc      ListDragSession call flow currentDragIndex > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0025 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: number = subject.currentDragIndex();
      logInfo(`step1 currentDragIndex(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["list:add0"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0026
     * @tc.name      DragAndExchange_ListDragSessionFlow_0026
     * @tc.desc      ListDragSession call flow events > dragStart > order > dragEnd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0026 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["list:add0","list:add1"]');
      const step2: number = subject.dragStart(105, '   ');
      logInfo(`step2 dragStart(105, "   "): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["Item1","Item2"]');
      subject.dragEnd(150);
      logInfo(`${BUNDLE}ListDragSessionFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0027
     * @tc.name      DragAndExchange_ListDragSessionFlow_0027
     * @tc.desc      ListDragSession call flow events > events > events > visibleCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0027 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: number = subject.visibleCount();
      logInfo(`step4 visibleCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0028
     * @tc.name      DragAndExchange_ListDragSessionFlow_0028
     * @tc.desc      ListDragSession call flow events > drop > currentDragIndex > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0028 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["list:add0"]');
      const step2: boolean = subject.drop('mElbO');
      logInfo(`step2 drop("mElbO"): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.currentDragIndex();
      logInfo(`step3 currentDragIndex(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(2);
      logInfo(`step4 events(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["list:add0","list:reload"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0029
     * @tc.name      DragAndExchange_ListDragSessionFlow_0029
     * @tc.desc      ListDragSession call flow drop > events > currentDragIndex > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0029 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: boolean = subject.drop('url');
      logInfo(`step1 drop("url"): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(3);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["list:add0","list:add1","list:reload"]');
      const step3: number = subject.currentDragIndex();
      logInfo(`step3 currentDragIndex(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.dragStart(10, '');
      logInfo(`step4 dragStart(10, ""): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0030
     * @tc.name      DragAndExchange_ListDragSessionFlow_0030
     * @tc.desc      ListDragSession call flow order > visibleCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0030 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.visibleCount();
      logInfo(`step2 visibleCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0031
     * @tc.name      DragAndExchange_ListDragSessionFlow_0031
     * @tc.desc      ListDragSession call flow order > dragEnd > visibleCount > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0031 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["Item1"]');
      subject.dragEnd(22.85);
      const step3: number = subject.visibleCount();
      logInfo(`step3 visibleCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: boolean = subject.drop('x123');
      logInfo(`step4 drop("x123"): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0032
     * @tc.name      DragAndExchange_ListDragSessionFlow_0032
     * @tc.desc      ListDragSession call flow visibleCount > drop > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0032 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: boolean = subject.drop('Penroo4myjp');
      logInfo(`step2 drop("Penroo4myjp"): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(3);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["list:add0","list:add1","list:reload"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0033
     * @tc.name      DragAndExchange_ListDragSessionFlow_0033
     * @tc.desc      ListDragSession call flow dragEnd > events > drop > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0033 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      subject.dragEnd(150);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: boolean = subject.drop('gbtejxnZBMbf');
      logInfo(`step3 drop("gbtejxnZBMbf"): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(1);
      logInfo(`step4 events(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["list:reload"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0034
     * @tc.name      DragAndExchange_ListDragSessionFlow_0034
     * @tc.desc      ListDragSession call flow currentDragIndex > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0034 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: number = subject.currentDragIndex();
      logInfo(`step1 currentDragIndex(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.dragStart(80, '');
      logInfo(`step2 dragStart(80, ""): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0035
     * @tc.name      DragAndExchange_ListDragSessionFlow_0035
     * @tc.desc      ListDragSession call flow visibleCount > dragEnd > events > events > dragEnd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0035 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      subject.dragEnd(36.49);
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
      subject.dragEnd(-86);
      logInfo(`${BUNDLE}ListDragSessionFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0036
     * @tc.name      DragAndExchange_ListDragSessionFlow_0036
     * @tc.desc      ListDragSession call flow dragStart > currentDragIndex > dragStart > events > dragStart keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0036 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.dragStart(40, ' Hello World ');
      logInfo(`step1 dragStart(40, " Hello World "): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.currentDragIndex();
      logInfo(`step2 currentDragIndex(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.dragStart(100, 'abcabc');
      logInfo(`step3 dragStart(100, "abcabc"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: number = subject.dragStart(90, '');
      logInfo(`step5 dragStart(90, ""): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0037
     * @tc.name      DragAndExchange_ListDragSessionFlow_0037
     * @tc.desc      ListDragSession call flow order > dragEnd > dragStart > currentDragIndex > dragStart keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0037 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["Item1"]');
      subject.dragEnd(170);
      const step3: number = subject.dragStart(105, '   ');
      logInfo(`step3 dragStart(105, "   "): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.currentDragIndex();
      logInfo(`step4 currentDragIndex(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.dragStart(65, 'a');
      logInfo(`step5 dragStart(65, "a"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0038
     * @tc.name      DragAndExchange_ListDragSessionFlow_0038
     * @tc.desc      ListDragSession call flow visibleCount > visibleCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0038 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.visibleCount();
      logInfo(`step2 visibleCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      logInfo(`${BUNDLE}ListDragSessionFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0039
     * @tc.name      DragAndExchange_ListDragSessionFlow_0039
     * @tc.desc      ListDragSession call flow order > dragEnd > visibleCount > dragEnd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0039 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.dragEnd(-7);
      const step3: number = subject.visibleCount();
      logInfo(`step3 visibleCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      subject.dragEnd(-20);
      logInfo(`${BUNDLE}ListDragSessionFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0040
     * @tc.name      DragAndExchange_ListDragSessionFlow_0040
     * @tc.desc      ListDragSession call flow dragEnd > events > dragStart > currentDragIndex > drop keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0040 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      subject.dragEnd(-92);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["list:add0"]');
      const step3: number = subject.dragStart(0, ' abc ');
      logInfo(`step3 dragStart(0, " abc "): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.currentDragIndex();
      logInfo(`step4 currentDragIndex(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: boolean = subject.drop('u7eVoHn');
      logInfo(`step5 drop("u7eVoHn"): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0041
     * @tc.name      DragAndExchange_ListDragSessionFlow_0041
     * @tc.desc      ListDragSession call flow order > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0041 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["Item1","Item2"]');
      const step2: boolean = subject.drop('8PDl');
      logInfo(`step2 drop("8PDl"): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0042
     * @tc.name      DragAndExchange_ListDragSessionFlow_0042
     * @tc.desc      ListDragSession call flow currentDragIndex > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0042 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.currentDragIndex();
      logInfo(`step1 currentDragIndex(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0043
     * @tc.name      DragAndExchange_ListDragSessionFlow_0043
     * @tc.desc      ListDragSession call flow visibleCount > dragEnd > visibleCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0043 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.dragEnd(-7);
      const step3: number = subject.visibleCount();
      logInfo(`step3 visibleCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0044
     * @tc.name      DragAndExchange_ListDragSessionFlow_0044
     * @tc.desc      ListDragSession call flow visibleCount > dragStart > dragEnd > visibleCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0044 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.dragStart(0, 'a');
      logInfo(`step2 dragStart(0, "a"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      subject.dragEnd(-94);
      const step4: number = subject.visibleCount();
      logInfo(`step4 visibleCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0045
     * @tc.name      DragAndExchange_ListDragSessionFlow_0045
     * @tc.desc      ListDragSession call flow drop > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0045 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: boolean = subject.drop('3');
      logInfo(`step1 drop("3"): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 order(): step2[0]=${step2[0]}`);
      expect(step2[0]).assertUndefined();
      logInfo(`${BUNDLE}ListDragSessionFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0046
     * @tc.name      DragAndExchange_ListDragSessionFlow_0046
     * @tc.desc      ListDragSession call flow visibleCount > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0046 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["Item1","Item2"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0047
     * @tc.name      DragAndExchange_ListDragSessionFlow_0047
     * @tc.desc      ListDragSession call flow dragStart > dragEnd > order > order > currentDragIndex keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0047 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.dragStart(85, '');
      logInfo(`step1 dragStart(85, ""): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.dragEnd(59.65);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: number = subject.currentDragIndex();
      logInfo(`step5 currentDragIndex(): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0048
     * @tc.name      DragAndExchange_ListDragSessionFlow_0048
     * @tc.desc      ListDragSession call flow visibleCount > visibleCount > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0048 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: number = subject.visibleCount();
      logInfo(`step2 visibleCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: boolean = subject.drop('Hello World');
      logInfo(`step3 drop("Hello World"): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0049
     * @tc.name      DragAndExchange_ListDragSessionFlow_0049
     * @tc.desc      ListDragSession call flow dragEnd > order > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0049 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      subject.dragEnd(80);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["Item1","Item2"]');
      const step3: number = subject.dragStart(23.34, ' _1');
      logInfo(`step3 dragStart(23.34, " _1"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0050
     * @tc.name      DragAndExchange_ListDragSessionFlow_0050
     * @tc.desc      ListDragSession call flow events > dragEnd > drop > visibleCount > visibleCount keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0050 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.dragEnd(68.63);
      const step3: boolean = subject.drop('FV78v3P');
      logInfo(`step3 drop("FV78v3P"): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.visibleCount();
      logInfo(`step4 visibleCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.visibleCount();
      logInfo(`step5 visibleCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0051
     * @tc.name      DragAndExchange_ListDragSessionFlow_0051
     * @tc.desc      ListDragSession call flow drop > drop > visibleCount > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0051 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: boolean = subject.drop('123123');
      logInfo(`step1 drop("123123"): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.drop('g');
      logInfo(`step2 drop("g"): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.visibleCount();
      logInfo(`step3 visibleCount(): step3=${step3}`);
      expect(step3).assertEqual(1);
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(1);
      logInfo(`step4 order(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["Item1"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0052
     * @tc.name      DragAndExchange_ListDragSessionFlow_0052
     * @tc.desc      ListDragSession call flow dragEnd > order > currentDragIndex > currentDragIndex keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0052 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      subject.dragEnd(-94);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["Item1","Item2"]');
      const step3: number = subject.currentDragIndex();
      logInfo(`step3 currentDragIndex(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.currentDragIndex();
      logInfo(`step4 currentDragIndex(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0053
     * @tc.name      DragAndExchange_ListDragSessionFlow_0053
     * @tc.desc      ListDragSession call flow dragEnd > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0053 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      subject.dragEnd(-5);
      const step2: number = subject.dragStart(105, '123');
      logInfo(`step2 dragStart(105, "123"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0054
     * @tc.name      DragAndExchange_ListDragSessionFlow_0054
     * @tc.desc      ListDragSession call flow dragEnd > events > dragEnd > dragEnd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0054 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      subject.dragEnd(22.85);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["list:add0"]');
      subject.dragEnd(193);
      subject.dragEnd(133);
      logInfo(`${BUNDLE}ListDragSessionFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0055
     * @tc.name      DragAndExchange_ListDragSessionFlow_0055
     * @tc.desc      ListDragSession call flow events > drop > dragEnd > dragStart > currentDragIndex keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0055 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["list:add0","list:add1"]');
      const step2: boolean = subject.drop('ZbILGQ');
      logInfo(`step2 drop("ZbILGQ"): step2=${step2}`);
      expect(step2).assertTrue();
      subject.dragEnd(59);
      const step4: number = subject.dragStart(0, '123');
      logInfo(`step4 dragStart(0, "123"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.currentDragIndex();
      logInfo(`step5 currentDragIndex(): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0056
     * @tc.name      DragAndExchange_ListDragSessionFlow_0056
     * @tc.desc      ListDragSession call flow drop > visibleCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0056 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: boolean = subject.drop('uQUHgEQe4');
      logInfo(`step1 drop("uQUHgEQe4"): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.visibleCount();
      logInfo(`step2 visibleCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0057
     * @tc.name      DragAndExchange_ListDragSessionFlow_0057
     * @tc.desc      ListDragSession call flow drop > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0057 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: boolean = subject.drop('aa');
      logInfo(`step1 drop("aa"): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.dragStart(2, ' 123 ');
      logInfo(`step2 dragStart(2, " 123 "): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0058
     * @tc.name      DragAndExchange_ListDragSessionFlow_0058
     * @tc.desc      ListDragSession call flow drop > visibleCount > dragEnd > drop > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0058 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: boolean = subject.drop('AK8zUXDG');
      logInfo(`step1 drop("AK8zUXDG"): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.visibleCount();
      logInfo(`step2 visibleCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      subject.dragEnd(50.5);
      const step4: boolean = subject.drop('y4');
      logInfo(`step4 drop("y4"): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string[] = subject.order();
      logInfo(`step5 order(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(2);
      logInfo(`step5 order(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["Item1","Item2"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0059
     * @tc.name      DragAndExchange_ListDragSessionFlow_0059
     * @tc.desc      ListDragSession call flow visibleCount > visibleCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0059 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.visibleCount();
      logInfo(`step2 visibleCount(): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0060
     * @tc.name      DragAndExchange_ListDragSessionFlow_0060
     * @tc.desc      ListDragSession call flow events > events > events > events > currentDragIndex keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0060 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["list:add0"]');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["list:add0"]');
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["list:add0"]');
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(1);
      logInfo(`step4 events(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["list:add0"]');
      const step5: number = subject.currentDragIndex();
      logInfo(`step5 currentDragIndex(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0061
     * @tc.name      DragAndExchange_ListDragSessionFlow_0061
     * @tc.desc      ListDragSession call flow events > dragEnd > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0061 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["list:add0","list:add1"]');
      subject.dragEnd(26.82);
      const step3: boolean = subject.drop('');
      logInfo(`step3 drop(""): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0062
     * @tc.name      DragAndExchange_ListDragSessionFlow_0062
     * @tc.desc      ListDragSession call flow order > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0062 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: number = subject.dragStart(55, 'Hello World_1');
      logInfo(`step2 dragStart(55, "Hello World_1"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0062 end`);
    });
  });
}
