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

/** Logic checks for ListDragSession flow (59 cases). */
export default function listDragSessionFlow2Test(): void {
  describe('ListDragSessionFlow2Test', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0063
     * @tc.name      DragAndExchange_ListDragSessionFlow_0063
     * @tc.desc      ListDragSession call flow visibleCount > order > drop > drop > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0063 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["Item1"]');
      const step3: boolean = subject.drop('gbtejxnZBMbf');
      logInfo(`step3 drop("gbtejxnZBMbf"): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.drop('');
      logInfo(`step4 drop(""): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.dragStart(15, 'Hello World_1');
      logInfo(`step5 dragStart(15, "Hello World_1"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0064
     * @tc.name      DragAndExchange_ListDragSessionFlow_0064
     * @tc.desc      ListDragSession call flow dragStart > order > currentDragIndex > events > events keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0064 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: number = subject.dragStart(75, 'abcabc');
      logInfo(`step1 dragStart(75, "abcabc"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["Item1","Item2"]');
      const step3: number = subject.currentDragIndex();
      logInfo(`step3 currentDragIndex(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(2);
      logInfo(`step4 events(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["list:add0","list:add1"]');
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(2);
      logInfo(`step5 events(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["list:add0","list:add1"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0065
     * @tc.name      DragAndExchange_ListDragSessionFlow_0065
     * @tc.desc      ListDragSession call flow order > drop > visibleCount > drop > visibleCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0065 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: boolean = subject.drop('TjNo');
      logInfo(`step2 drop("TjNo"): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.visibleCount();
      logInfo(`step3 visibleCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.drop('M3wykyi');
      logInfo(`step4 drop("M3wykyi"): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.visibleCount();
      logInfo(`step5 visibleCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0066
     * @tc.name      DragAndExchange_ListDragSessionFlow_0066
     * @tc.desc      ListDragSession call flow events > events > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0066 begin`);
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
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["Item1"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0067
     * @tc.name      DragAndExchange_ListDragSessionFlow_0067
     * @tc.desc      ListDragSession call flow dragEnd > events > drop > currentDragIndex > currentDragIndex keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0067 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      subject.dragEnd(140);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["list:add0","list:add1"]');
      const step3: boolean = subject.drop('wL');
      logInfo(`step3 drop("wL"): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.currentDragIndex();
      logInfo(`step4 currentDragIndex(): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.currentDragIndex();
      logInfo(`step5 currentDragIndex(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0068
     * @tc.name      DragAndExchange_ListDragSessionFlow_0068
     * @tc.desc      ListDragSession call flow dragStart > dragEnd > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0068 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.dragStart(75, ' Hello World ');
      logInfo(`step1 dragStart(75, " Hello World "): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.dragEnd(151);
      const step3: number = subject.dragStart(30, 'aa');
      logInfo(`step3 dragStart(30, "aa"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0069
     * @tc.name      DragAndExchange_ListDragSessionFlow_0069
     * @tc.desc      ListDragSession call flow drop > visibleCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0069 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: boolean = subject.drop('vR9s0j');
      logInfo(`step1 drop("vR9s0j"): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.visibleCount();
      logInfo(`step2 visibleCount(): step2=${step2}`);
      expect(step2).assertEqual(1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0070
     * @tc.name      DragAndExchange_ListDragSessionFlow_0070
     * @tc.desc      ListDragSession call flow dragStart > events > dragEnd > dragStart > visibleCount keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0070 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: number = subject.dragStart(145, ' abc ');
      logInfo(`step1 dragStart(145, " abc "): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["list:add0","list:add1"]');
      subject.dragEnd(194);
      const step4: number = subject.dragStart(110, 'xa');
      logInfo(`step4 dragStart(110, "xa"): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.visibleCount();
      logInfo(`step5 visibleCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}ListDragSessionFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0071
     * @tc.name      DragAndExchange_ListDragSessionFlow_0071
     * @tc.desc      ListDragSession call flow drop > drop > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0071 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: boolean = subject.drop('pxdell');
      logInfo(`step1 drop("pxdell"): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: boolean = subject.drop('VA');
      logInfo(`step2 drop("VA"): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.dragStart(85, 'Hello World_1');
      logInfo(`step3 dragStart(85, "Hello World_1"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0072
     * @tc.name      DragAndExchange_ListDragSessionFlow_0072
     * @tc.desc      ListDragSession call flow drop > currentDragIndex > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0072 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: boolean = subject.drop('abcabc');
      logInfo(`step1 drop("abcabc"): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.currentDragIndex();
      logInfo(`step2 currentDragIndex(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: boolean = subject.drop('VA');
      logInfo(`step3 drop("VA"): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0073
     * @tc.name      DragAndExchange_ListDragSessionFlow_0073
     * @tc.desc      ListDragSession call flow dragEnd > drop > events > dragStart > visibleCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0073 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      subject.dragEnd(-92);
      const step2: boolean = subject.drop('GRuEnkDiNvH');
      logInfo(`step2 drop("GRuEnkDiNvH"): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(3);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["list:add0","list:add1","list:reload"]');
      const step4: number = subject.dragStart(145, '');
      logInfo(`step4 dragStart(145, ""): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: number = subject.visibleCount();
      logInfo(`step5 visibleCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}ListDragSessionFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0074
     * @tc.name      DragAndExchange_ListDragSessionFlow_0074
     * @tc.desc      ListDragSession call flow order > dragEnd > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0074 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["Item1","Item2"]');
      subject.dragEnd(172);
      const step3: number = subject.dragStart(3, '  ');
      logInfo(`step3 dragStart(3, "  "): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0075
     * @tc.name      DragAndExchange_ListDragSessionFlow_0075
     * @tc.desc      ListDragSession call flow drop > currentDragIndex > dragStart > currentDragIndex > order keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0075 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: boolean = subject.drop('QF973pndln');
      logInfo(`step1 drop("QF973pndln"): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: number = subject.currentDragIndex();
      logInfo(`step2 currentDragIndex(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.dragStart(45, ' Hello World ');
      logInfo(`step3 dragStart(45, " Hello World "): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.currentDragIndex();
      logInfo(`step4 currentDragIndex(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      const step5: string[] = subject.order();
      logInfo(`step5 order(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(2);
      logInfo(`step5 order(): step5[0]=${step5[0]}`);
      expect(step5[0]).assertUndefined();
      logInfo(`${BUNDLE}ListDragSessionFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0076
     * @tc.name      DragAndExchange_ListDragSessionFlow_0076
     * @tc.desc      ListDragSession call flow currentDragIndex > dragStart > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0076 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.currentDragIndex();
      logInfo(`step1 currentDragIndex(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.dragStart(0, 'Hello World_1');
      logInfo(`step2 dragStart(0, "Hello World_1"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0077
     * @tc.name      DragAndExchange_ListDragSessionFlow_0077
     * @tc.desc      ListDragSession call flow visibleCount > dragEnd > currentDragIndex > currentDragIndex keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0077 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      subject.dragEnd(-10);
      const step3: number = subject.currentDragIndex();
      logInfo(`step3 currentDragIndex(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.currentDragIndex();
      logInfo(`step4 currentDragIndex(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0078
     * @tc.name      DragAndExchange_ListDragSessionFlow_0078
     * @tc.desc      ListDragSession call flow drop > order > visibleCount > events > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0078 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: boolean = subject.drop('Hello World_1');
      logInfo(`step1 drop("Hello World_1"): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 order(): step2[0]=${step2[0]}`);
      expect(step2[0]).assertUndefined();
      const step3: number = subject.visibleCount();
      logInfo(`step3 visibleCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(3);
      logInfo(`step4 events(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["list:add0","list:add1","list:reload"]');
      const step5: string[] = subject.order();
      logInfo(`step5 order(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(2);
      logInfo(`step5 order(): step5[0]=${step5[0]}`);
      expect(step5[0]).assertUndefined();
      logInfo(`${BUNDLE}ListDragSessionFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0079
     * @tc.name      DragAndExchange_ListDragSessionFlow_0079
     * @tc.desc      ListDragSession call flow dragStart > drop > order > visibleCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0079 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.dragStart(3, ' abc ');
      logInfo(`step1 dragStart(3, " abc "): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: boolean = subject.drop('jE');
      logInfo(`step2 drop("jE"): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: number = subject.visibleCount();
      logInfo(`step4 visibleCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0080
     * @tc.name      DragAndExchange_ListDragSessionFlow_0080
     * @tc.desc      ListDragSession call flow order > dragEnd > order > dragEnd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0080 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["Item1"]');
      subject.dragEnd(50.5);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["Item1"]');
      subject.dragEnd(-5);
      logInfo(`${BUNDLE}ListDragSessionFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0081
     * @tc.name      DragAndExchange_ListDragSessionFlow_0081
     * @tc.desc      ListDragSession call flow visibleCount > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0081 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(2);
      const step2: number = subject.dragStart(5, '');
      logInfo(`step2 dragStart(5, ""): step2=${step2}`);
      expect(step2).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0082
     * @tc.name      DragAndExchange_ListDragSessionFlow_0082
     * @tc.desc      ListDragSession call flow visibleCount > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0082 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.drop('1');
      logInfo(`step2 drop("1"): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0083
     * @tc.name      DragAndExchange_ListDragSessionFlow_0083
     * @tc.desc      ListDragSession call flow currentDragIndex > drop > drop > currentDragIndex keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0083 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: number = subject.currentDragIndex();
      logInfo(`step1 currentDragIndex(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.drop('Xvlz');
      logInfo(`step2 drop("Xvlz"): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: boolean = subject.drop('VO1');
      logInfo(`step3 drop("VO1"): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.currentDragIndex();
      logInfo(`step4 currentDragIndex(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0084
     * @tc.name      DragAndExchange_ListDragSessionFlow_0084
     * @tc.desc      ListDragSession call flow dragEnd > visibleCount > dragStart > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0084 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      subject.dragEnd(57);
      const step2: number = subject.visibleCount();
      logInfo(`step2 visibleCount(): step2=${step2}`);
      expect(step2).assertEqual(2);
      const step3: number = subject.dragStart(20, '');
      logInfo(`step3 dragStart(20, ""): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(2);
      logInfo(`step4 order(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["Item1","Item2"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0085
     * @tc.name      DragAndExchange_ListDragSessionFlow_0085
     * @tc.desc      ListDragSession call flow events > dragEnd > currentDragIndex > drop > currentDragIndex keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0085 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.dragEnd(21);
      const step3: number = subject.currentDragIndex();
      logInfo(`step3 currentDragIndex(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: boolean = subject.drop('Ux');
      logInfo(`step4 drop("Ux"): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.currentDragIndex();
      logInfo(`step5 currentDragIndex(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0086
     * @tc.name      DragAndExchange_ListDragSessionFlow_0086
     * @tc.desc      ListDragSession call flow events > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0086 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["list:add0"]');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["Item1"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0087
     * @tc.name      DragAndExchange_ListDragSessionFlow_0087
     * @tc.desc      ListDragSession call flow order > drop > events > events > currentDragIndex keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0087 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["Item1","Item2"]');
      const step2: boolean = subject.drop('aa');
      logInfo(`step2 drop("aa"): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(3);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["list:add0","list:add1","list:reload"]');
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(3);
      logInfo(`step4 events(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["list:add0","list:add1","list:reload"]');
      const step5: number = subject.currentDragIndex();
      logInfo(`step5 currentDragIndex(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0088
     * @tc.name      DragAndExchange_ListDragSessionFlow_0088
     * @tc.desc      ListDragSession call flow events > dragEnd > events > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0088 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.dragEnd(21);
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: boolean = subject.drop('Ko7t6Er');
      logInfo(`step4 drop("Ko7t6Er"): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0089
     * @tc.name      DragAndExchange_ListDragSessionFlow_0089
     * @tc.desc      ListDragSession call flow visibleCount > events > drop > order > dragEnd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0089 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["list:add0"]');
      const step3: boolean = subject.drop('AK8zUXDG');
      logInfo(`step3 drop("AK8zUXDG"): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(1);
      logInfo(`step4 order(): step4[0]=${step4[0]}`);
      expect(step4[0]).assertUndefined();
      subject.dragEnd(77.69);
      logInfo(`${BUNDLE}ListDragSessionFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0090
     * @tc.name      DragAndExchange_ListDragSessionFlow_0090
     * @tc.desc      ListDragSession call flow events > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0090 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["list:add0","list:add1"]');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["Item1","Item2"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0091
     * @tc.name      DragAndExchange_ListDragSessionFlow_0091
     * @tc.desc      ListDragSession call flow currentDragIndex > dragStart > currentDragIndex > drop > visibleCount ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0091 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.currentDragIndex();
      logInfo(`step1 currentDragIndex(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.dragStart(75, ' Hello World ');
      logInfo(`step2 dragStart(75, " Hello World "): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.currentDragIndex();
      logInfo(`step3 currentDragIndex(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: boolean = subject.drop(' Hello World ');
      logInfo(`step4 drop(" Hello World "): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: number = subject.visibleCount();
      logInfo(`step5 visibleCount(): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0092
     * @tc.name      DragAndExchange_ListDragSessionFlow_0092
     * @tc.desc      ListDragSession call flow currentDragIndex > dragStart > drop > visibleCount > dragStart keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0092 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: number = subject.currentDragIndex();
      logInfo(`step1 currentDragIndex(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.dragStart(1, 'x ');
      logInfo(`step2 dragStart(1, "x "): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: boolean = subject.drop('Hello World_1');
      logInfo(`step3 drop("Hello World_1"): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: number = subject.visibleCount();
      logInfo(`step4 visibleCount(): step4=${step4}`);
      expect(step4).assertEqual(1);
      const step5: number = subject.dragStart(75, 'xabc');
      logInfo(`step5 dragStart(75, "xabc"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0093
     * @tc.name      DragAndExchange_ListDragSessionFlow_0093
     * @tc.desc      ListDragSession call flow events > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0093 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: boolean = subject.drop('UjRJeVa');
      logInfo(`step2 drop("UjRJeVa"): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0094
     * @tc.name      DragAndExchange_ListDragSessionFlow_0094
     * @tc.desc      ListDragSession call flow dragEnd > currentDragIndex > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0094 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      subject.dragEnd(-20);
      const step2: number = subject.currentDragIndex();
      logInfo(`step2 currentDragIndex(): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 order(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["Item1"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0095
     * @tc.name      DragAndExchange_ListDragSessionFlow_0095
     * @tc.desc      ListDragSession call flow dragStart > dragEnd > dragEnd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0095 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: number = subject.dragStart(40, 'a');
      logInfo(`step1 dragStart(40, "a"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      subject.dragEnd(25);
      subject.dragEnd(-7);
      logInfo(`${BUNDLE}ListDragSessionFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0096
     * @tc.name      DragAndExchange_ListDragSessionFlow_0096
     * @tc.desc      ListDragSession call flow visibleCount > drop > currentDragIndex keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0096 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.drop('abc');
      logInfo(`step2 drop("abc"): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: number = subject.currentDragIndex();
      logInfo(`step3 currentDragIndex(): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0097
     * @tc.name      DragAndExchange_ListDragSessionFlow_0097
     * @tc.desc      ListDragSession call flow dragEnd > drop > dragEnd > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0097 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      subject.dragEnd(105);
      const step2: boolean = subject.drop('YwV6l3iEh');
      logInfo(`step2 drop("YwV6l3iEh"): step2=${step2}`);
      expect(step2).assertTrue();
      subject.dragEnd(133);
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(2);
      logInfo(`step4 events(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["list:add0","list:reload"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0098
     * @tc.name      DragAndExchange_ListDragSessionFlow_0098
     * @tc.desc      ListDragSession call flow dragStart > currentDragIndex > dragStart > order > visibleCount keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0098 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: number = subject.dragStart(50, '');
      logInfo(`step1 dragStart(50, ""): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.currentDragIndex();
      logInfo(`step2 currentDragIndex(): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.dragStart(5, 'xHello World');
      logInfo(`step3 dragStart(5, "xHello World"): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(2);
      logInfo(`step4 order(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["Item1","Item2"]');
      const step5: number = subject.visibleCount();
      logInfo(`step5 visibleCount(): step5=${step5}`);
      expect(step5).assertEqual(2);
      logInfo(`${BUNDLE}ListDragSessionFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0099
     * @tc.name      DragAndExchange_ListDragSessionFlow_0099
     * @tc.desc      ListDragSession call flow visibleCount > dragEnd > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0099 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      subject.dragEnd(3);
      const step3: boolean = subject.drop('1y');
      logInfo(`step3 drop("1y"): step3=${step3}`);
      expect(step3).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0100
     * @tc.name      DragAndExchange_ListDragSessionFlow_0100
     * @tc.desc      ListDragSession call flow visibleCount > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0100 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(1);
      const step2: boolean = subject.drop('123123');
      logInfo(`step2 drop("123123"): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0101
     * @tc.name      DragAndExchange_ListDragSessionFlow_0101
     * @tc.desc      ListDragSession call flow dragEnd > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0101 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      subject.dragEnd(72);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["Item1","Item2"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0102
     * @tc.name      DragAndExchange_ListDragSessionFlow_0102
     * @tc.desc      ListDragSession call flow drop > events > drop > drop > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0102 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: boolean = subject.drop('M3wykyi');
      logInfo(`step1 drop("M3wykyi"): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["list:add0","list:reload"]');
      const step3: boolean = subject.drop('abc_1');
      logInfo(`step3 drop("abc_1"): step3=${step3}`);
      expect(step3).assertTrue();
      const step4: boolean = subject.drop('wL');
      logInfo(`step4 drop("wL"): step4=${step4}`);
      expect(step4).assertTrue();
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(4);
      logInfo(`step5 events(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["list:add0","list:reload","list:reload","list:reload"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0103
     * @tc.name      DragAndExchange_ListDragSessionFlow_0103
     * @tc.desc      ListDragSession call flow dragEnd > dragEnd > visibleCount > order > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0103 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      subject.dragEnd(145);
      subject.dragEnd(-15);
      const step3: number = subject.visibleCount();
      logInfo(`step3 visibleCount(): step3=${step3}`);
      expect(step3).assertEqual(2);
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(2);
      logInfo(`step4 order(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["Item1","Item2"]');
      const step5: boolean = subject.drop('YwV6l3iEh');
      logInfo(`step5 drop("YwV6l3iEh"): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0104
     * @tc.name      DragAndExchange_ListDragSessionFlow_0104
     * @tc.desc      ListDragSession call flow visibleCount > order > visibleCount > visibleCount keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0104 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: number = subject.visibleCount();
      logInfo(`step3 visibleCount(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.visibleCount();
      logInfo(`step4 visibleCount(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0105
     * @tc.name      DragAndExchange_ListDragSessionFlow_0105
     * @tc.desc      ListDragSession call flow dragEnd > dragEnd > dragStart > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0105 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      subject.dragEnd(75);
      subject.dragEnd(160);
      const step3: number = subject.dragStart(1, '   ');
      logInfo(`step3 dragStart(1, "   "): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(1);
      logInfo(`step4 events(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["list:add0"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0106
     * @tc.name      DragAndExchange_ListDragSessionFlow_0106
     * @tc.desc      ListDragSession call flow dragEnd > dragEnd > dragEnd > currentDragIndex keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0106 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      subject.dragEnd(30.15);
      subject.dragEnd(-19);
      subject.dragEnd(45);
      const step4: number = subject.currentDragIndex();
      logInfo(`step4 currentDragIndex(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0107
     * @tc.name      DragAndExchange_ListDragSessionFlow_0107
     * @tc.desc      ListDragSession call flow visibleCount > drop > order > dragEnd > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0107 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: number = subject.visibleCount();
      logInfo(`step1 visibleCount(): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: boolean = subject.drop('eElXjYQny');
      logInfo(`step2 drop("eElXjYQny"): step2=${step2}`);
      expect(step2).assertTrue();
      const step3: string[] = subject.order();
      logInfo(`step3 order(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(1);
      logInfo(`step3 order(): step3[0]=${step3[0]}`);
      expect(step3[0]).assertUndefined();
      subject.dragEnd(35.84);
      const step5: number = subject.dragStart(75, 'abcabc');
      logInfo(`step5 dragStart(75, "abcabc"): step5=${step5}`);
      expect(step5).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0108
     * @tc.name      DragAndExchange_ListDragSessionFlow_0108
     * @tc.desc      ListDragSession call flow dragStart > events > currentDragIndex > currentDragIndex keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0108 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: number = subject.dragStart(65, '');
      logInfo(`step1 dragStart(65, ""): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["list:add0"]');
      const step3: number = subject.currentDragIndex();
      logInfo(`step3 currentDragIndex(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.currentDragIndex();
      logInfo(`step4 currentDragIndex(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0109
     * @tc.name      DragAndExchange_ListDragSessionFlow_0109
     * @tc.desc      ListDragSession call flow events > dragEnd > currentDragIndex > currentDragIndex keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0109 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["list:add0","list:add1"]');
      subject.dragEnd(5);
      const step3: number = subject.currentDragIndex();
      logInfo(`step3 currentDragIndex(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.currentDragIndex();
      logInfo(`step4 currentDragIndex(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0110
     * @tc.name      DragAndExchange_ListDragSessionFlow_0110
     * @tc.desc      ListDragSession call flow order > events > dragStart > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0110 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: number = subject.dragStart(40, '');
      logInfo(`step3 dragStart(40, ""): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: string[] = subject.events();
      logInfo(`step4 events(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0111
     * @tc.name      DragAndExchange_ListDragSessionFlow_0111
     * @tc.desc      ListDragSession call flow order > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0111 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["Item1"]');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["Item1"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0112
     * @tc.name      DragAndExchange_ListDragSessionFlow_0112
     * @tc.desc      ListDragSession call flow drop > order > dragStart keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0112 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: boolean = subject.drop('ZbILGQ');
      logInfo(`step1 drop("ZbILGQ"): step1=${step1}`);
      expect(step1).assertTrue();
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 order(): step2[0]=${step2[0]}`);
      expect(step2[0]).assertUndefined();
      const step3: number = subject.dragStart(0, '  ');
      logInfo(`step3 dragStart(0, "  "): step3=${step3}`);
      expect(step3).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0113
     * @tc.name      DragAndExchange_ListDragSessionFlow_0113
     * @tc.desc      ListDragSession call flow dragEnd > order > currentDragIndex > order keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0113 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      subject.dragEnd(-86);
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: number = subject.currentDragIndex();
      logInfo(`step3 currentDragIndex(): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0114
     * @tc.name      DragAndExchange_ListDragSessionFlow_0114
     * @tc.desc      ListDragSession call flow events > events keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0114 begin`);
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
      logInfo(`${BUNDLE}ListDragSessionFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0115
     * @tc.name      DragAndExchange_ListDragSessionFlow_0115
     * @tc.desc      ListDragSession call flow events > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0115 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["list:add0","list:add1"]');
      const step2: boolean = subject.drop('a');
      logInfo(`step2 drop("a"): step2=${step2}`);
      expect(step2).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0116
     * @tc.name      DragAndExchange_ListDragSessionFlow_0116
     * @tc.desc      ListDragSession call flow dragStart > dragStart > currentDragIndex > currentDragIndex keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0116 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: number = subject.dragStart(80, 'a_1');
      logInfo(`step1 dragStart(80, "a_1"): step1=${step1}`);
      expect(step1).assertEqual(-1);
      const step2: number = subject.dragStart(0, 'xabc');
      logInfo(`step2 dragStart(0, "xabc"): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: number = subject.currentDragIndex();
      logInfo(`step3 currentDragIndex(): step3=${step3}`);
      expect(step3).assertEqual(-1);
      const step4: number = subject.currentDragIndex();
      logInfo(`step4 currentDragIndex(): step4=${step4}`);
      expect(step4).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0117
     * @tc.name      DragAndExchange_ListDragSessionFlow_0117
     * @tc.desc      ListDragSession call flow events > events > dragEnd > order > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0117 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["list:add0","list:add1"]');
      const step2: string[] = subject.events();
      logInfo(`step2 events(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(2);
      logInfo(`step2 events(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["list:add0","list:add1"]');
      subject.dragEnd(25);
      const step4: string[] = subject.order();
      logInfo(`step4 order(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(2);
      logInfo(`step4 order(): JSON.stringify(step4)=${JSON.stringify(step4)}`);
      expect(JSON.stringify(step4)).assertEqual('["Item1","Item2"]');
      const step5: boolean = subject.drop('AK8zUXDG');
      logInfo(`step5 drop("AK8zUXDG"): step5=${step5}`);
      expect(step5).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0118
     * @tc.name      DragAndExchange_ListDragSessionFlow_0118
     * @tc.desc      ListDragSession call flow dragEnd > currentDragIndex > dragEnd keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0118 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      subject.dragEnd(-48);
      const step2: number = subject.currentDragIndex();
      logInfo(`step2 currentDragIndex(): step2=${step2}`);
      expect(step2).assertEqual(0);
      subject.dragEnd(170);
      logInfo(`${BUNDLE}ListDragSessionFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0119
     * @tc.name      DragAndExchange_ListDragSessionFlow_0119
     * @tc.desc      ListDragSession call flow events > dragStart > events > visibleCount > events keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0119 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["list:add0","list:add1"]');
      const step2: number = subject.dragStart(145, '');
      logInfo(`step2 dragStart(145, ""): step2=${step2}`);
      expect(step2).assertEqual(-1);
      const step3: string[] = subject.events();
      logInfo(`step3 events(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(2);
      logInfo(`step3 events(): JSON.stringify(step3)=${JSON.stringify(step3)}`);
      expect(JSON.stringify(step3)).assertEqual('["list:add0","list:add1"]');
      const step4: number = subject.visibleCount();
      logInfo(`step4 visibleCount(): step4=${step4}`);
      expect(step4).assertEqual(2);
      const step5: string[] = subject.events();
      logInfo(`step5 events(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(2);
      logInfo(`step5 events(): JSON.stringify(step5)=${JSON.stringify(step5)}`);
      expect(JSON.stringify(step5)).assertEqual('["list:add0","list:add1"]');
      logInfo(`${BUNDLE}ListDragSessionFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0120
     * @tc.name      DragAndExchange_ListDragSessionFlow_0120
     * @tc.desc      ListDragSession call flow events > drop > dragEnd > drop keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0120 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const step1: string[] = subject.events();
      logInfo(`step1 events(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(2);
      logInfo(`step1 events(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["list:add0","list:add1"]');
      const step2: boolean = subject.drop('xabc');
      logInfo(`step2 drop("xabc"): step2=${step2}`);
      expect(step2).assertTrue();
      subject.dragEnd(151);
      const step4: boolean = subject.drop('wB6bx7');
      logInfo(`step4 drop("wB6bx7"): step4=${step4}`);
      expect(step4).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_FLOW_0121
     * @tc.name      DragAndExchange_ListDragSessionFlow_0121
     * @tc.desc      ListDragSession call flow order > order > dragEnd > currentDragIndex keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionFlow_0121 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const step1: string[] = subject.order();
      logInfo(`step1 order(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(1);
      logInfo(`step1 order(): JSON.stringify(step1)=${JSON.stringify(step1)}`);
      expect(JSON.stringify(step1)).assertEqual('["Item1"]');
      const step2: string[] = subject.order();
      logInfo(`step2 order(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(1);
      logInfo(`step2 order(): JSON.stringify(step2)=${JSON.stringify(step2)}`);
      expect(JSON.stringify(step2)).assertEqual('["Item1"]');
      subject.dragEnd(88);
      const step4: number = subject.currentDragIndex();
      logInfo(`step4 currentDragIndex(): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`${BUNDLE}ListDragSessionFlow_0121 end`);
    });
  });
}
