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

/** Logic checks for ListDragSession.dragStart (30 cases). */
export default function listDragSessionDragStartTest(): void {
  describe('ListDragSessionDragStartTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0001
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0001
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams="") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_ListDragSessionDragStart_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0001 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: number = subject.dragStart(0, '');
      logInfo(`dragStart(index=0, extraParams=""): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0002
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0002
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams="a") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_ListDragSessionDragStart_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0002 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: number = subject.dragStart(0, 'a');
      logInfo(`dragStart(index=0, extraParams="a"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0003
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0003
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams="abc") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDragStart_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0003 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: number = subject.dragStart(0, 'abc');
      logInfo(`dragStart(index=0, extraParams="abc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0004
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0004
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams="Hello World") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDragStart_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0004 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: number = subject.dragStart(0, 'Hello World');
      logInfo(`dragStart(index=0, extraParams="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0005
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0005
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams=" ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDragStart_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0005 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: number = subject.dragStart(0, ' ');
      logInfo(`dragStart(index=0, extraParams=" "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0006
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0006
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams="123") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDragStart_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0006 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: number = subject.dragStart(0, '123');
      logInfo(`dragStart(index=0, extraParams="123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0007
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0007
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams=" a ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDragStart_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0007 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: number = subject.dragStart(0, ' a ');
      logInfo(`dragStart(index=0, extraParams=" a "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0008
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0008
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams="aa") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDragStart_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0008 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: number = subject.dragStart(0, 'aa');
      logInfo(`dragStart(index=0, extraParams="aa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0009
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0009
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams="a_1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDragStart_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0009 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: number = subject.dragStart(0, 'a_1');
      logInfo(`dragStart(index=0, extraParams="a_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0010
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0010
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams="xa") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDragStart_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0010 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: number = subject.dragStart(0, 'xa');
      logInfo(`dragStart(index=0, extraParams="xa"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0011
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0011
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams=" abc ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDragStart_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0011 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: number = subject.dragStart(0, ' abc ');
      logInfo(`dragStart(index=0, extraParams=" abc "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0012
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0012
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams="abcabc") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDragStart_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0012 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: number = subject.dragStart(0, 'abcabc');
      logInfo(`dragStart(index=0, extraParams="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0013
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0013
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams="abc_1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDragStart_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0013 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: number = subject.dragStart(0, 'abc_1');
      logInfo(`dragStart(index=0, extraParams="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0014
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0014
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams="xabc") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDragStart_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0014 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: number = subject.dragStart(0, 'xabc');
      logInfo(`dragStart(index=0, extraParams="xabc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0015
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0015
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams=" Hello World ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDragStart_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0015 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: number = subject.dragStart(0, ' Hello World ');
      logInfo(`dragStart(index=0, extraParams=" Hello Wo...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0016
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0016
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams="Hello WorldHello World") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDragStart_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0016 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: number = subject.dragStart(0, 'Hello WorldHello World');
      logInfo(`dragStart(index=0, extraParams="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0017
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0017
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams="Hello World_1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDragStart_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0017 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: number = subject.dragStart(0, 'Hello World_1');
      logInfo(`dragStart(index=0, extraParams="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0018
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0018
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams="xHello World") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDragStart_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0018 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: number = subject.dragStart(0, 'xHello World');
      logInfo(`dragStart(index=0, extraParams="xHello Wo...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0019
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0019
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams="   ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDragStart_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0019 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: number = subject.dragStart(0, '   ');
      logInfo(`dragStart(index=0, extraParams="   "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0020
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0020
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams="  ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDragStart_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0020 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: number = subject.dragStart(0, '  ');
      logInfo(`dragStart(index=0, extraParams="  "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0021
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0021
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams=" _1") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDragStart_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0021 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: number = subject.dragStart(0, ' _1');
      logInfo(`dragStart(index=0, extraParams=" _1"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0022
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0022
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams="x ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDragStart_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0022 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: number = subject.dragStart(0, 'x ');
      logInfo(`dragStart(index=0, extraParams="x "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0023
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0023
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams=" 123 ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDragStart_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0023 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: number = subject.dragStart(0, ' 123 ');
      logInfo(`dragStart(index=0, extraParams=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0024
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0024
     * @tc.desc      ListDragSession.dragStart(index=0, extraParams="123123") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDragStart_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0024 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: number = subject.dragStart(0, '123123');
      logInfo(`dragStart(index=0, extraParams="123123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0025
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0025
     * @tc.desc      ListDragSession.dragStart(index=1, extraParams="") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDragStart_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0025 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: number = subject.dragStart(1, '');
      logInfo(`dragStart(index=1, extraParams=""): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0026
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0026
     * @tc.desc      ListDragSession.dragStart(index=1, extraParams="a") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDragStart_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0026 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: number = subject.dragStart(1, 'a');
      logInfo(`dragStart(index=1, extraParams="a"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0027
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0027
     * @tc.desc      ListDragSession.dragStart(index=1, extraParams="abc") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDragStart_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0027 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: number = subject.dragStart(1, 'abc');
      logInfo(`dragStart(index=1, extraParams="abc"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0028
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0028
     * @tc.desc      ListDragSession.dragStart(index=1, extraParams="Hello World") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDragStart_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0028 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: number = subject.dragStart(1, 'Hello World');
      logInfo(`dragStart(index=1, extraParams="Hello Wor...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0029
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0029
     * @tc.desc      ListDragSession.dragStart(index=1, extraParams=" ") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDragStart_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0029 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: number = subject.dragStart(1, ' ');
      logInfo(`dragStart(index=1, extraParams=" "): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DRAG_START_0030
     * @tc.name      DragAndExchange_ListDragSessionDragStart_0030
     * @tc.desc      ListDragSession.dragStart(index=1, extraParams="123") yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDragStart_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDragStart_0030 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: number = subject.dragStart(1, '123');
      logInfo(`dragStart(index=1, extraParams="123"): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListDragSessionDragStart_0030 end`);
    });
  });
}
