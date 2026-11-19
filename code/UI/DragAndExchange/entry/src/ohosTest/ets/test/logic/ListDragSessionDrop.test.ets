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

/** Logic checks for ListDragSession.drop (30 cases). */
export default function listDragSessionDropTest(): void {
  describe('ListDragSessionDropTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0001
     * @tc.name      DragAndExchange_ListDragSessionDrop_0001
     * @tc.desc      ListDragSession.drop(extraParams="") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_ListDragSessionDrop_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0001 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: boolean = subject.drop('');
      logInfo(`drop(extraParams=""): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0002
     * @tc.name      DragAndExchange_ListDragSessionDrop_0002
     * @tc.desc      ListDragSession.drop(extraParams="a") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_ListDragSessionDrop_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0002 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: boolean = subject.drop('a');
      logInfo(`drop(extraParams="a"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0003
     * @tc.name      DragAndExchange_ListDragSessionDrop_0003
     * @tc.desc      ListDragSession.drop(extraParams="abc") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDrop_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0003 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: boolean = subject.drop('abc');
      logInfo(`drop(extraParams="abc"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0004
     * @tc.name      DragAndExchange_ListDragSessionDrop_0004
     * @tc.desc      ListDragSession.drop(extraParams="Hello World") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDrop_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0004 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: boolean = subject.drop('Hello World');
      logInfo(`drop(extraParams="Hello World"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0005
     * @tc.name      DragAndExchange_ListDragSessionDrop_0005
     * @tc.desc      ListDragSession.drop(extraParams=" ") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDrop_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0005 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: boolean = subject.drop(' ');
      logInfo(`drop(extraParams=" "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0006
     * @tc.name      DragAndExchange_ListDragSessionDrop_0006
     * @tc.desc      ListDragSession.drop(extraParams="123") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDrop_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0006 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: boolean = subject.drop('123');
      logInfo(`drop(extraParams="123"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0007
     * @tc.name      DragAndExchange_ListDragSessionDrop_0007
     * @tc.desc      ListDragSession.drop(extraParams=" a ") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDrop_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0007 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: boolean = subject.drop(' a ');
      logInfo(`drop(extraParams=" a "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0008
     * @tc.name      DragAndExchange_ListDragSessionDrop_0008
     * @tc.desc      ListDragSession.drop(extraParams="aa") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDrop_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0008 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: boolean = subject.drop('aa');
      logInfo(`drop(extraParams="aa"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0009
     * @tc.name      DragAndExchange_ListDragSessionDrop_0009
     * @tc.desc      ListDragSession.drop(extraParams="a_1") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDrop_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0009 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: boolean = subject.drop('a_1');
      logInfo(`drop(extraParams="a_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0010
     * @tc.name      DragAndExchange_ListDragSessionDrop_0010
     * @tc.desc      ListDragSession.drop(extraParams="xa") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDrop_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0010 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: boolean = subject.drop('xa');
      logInfo(`drop(extraParams="xa"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0011
     * @tc.name      DragAndExchange_ListDragSessionDrop_0011
     * @tc.desc      ListDragSession.drop(extraParams=" abc ") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDrop_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0011 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: boolean = subject.drop(' abc ');
      logInfo(`drop(extraParams=" abc "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0012
     * @tc.name      DragAndExchange_ListDragSessionDrop_0012
     * @tc.desc      ListDragSession.drop(extraParams="abcabc") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDrop_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0012 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: boolean = subject.drop('abcabc');
      logInfo(`drop(extraParams="abcabc"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0013
     * @tc.name      DragAndExchange_ListDragSessionDrop_0013
     * @tc.desc      ListDragSession.drop(extraParams="abc_1") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDrop_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0013 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: boolean = subject.drop('abc_1');
      logInfo(`drop(extraParams="abc_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0014
     * @tc.name      DragAndExchange_ListDragSessionDrop_0014
     * @tc.desc      ListDragSession.drop(extraParams="xabc") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDrop_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0014 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: boolean = subject.drop('xabc');
      logInfo(`drop(extraParams="xabc"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0015
     * @tc.name      DragAndExchange_ListDragSessionDrop_0015
     * @tc.desc      ListDragSession.drop(extraParams=" Hello World ") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDrop_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0015 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: boolean = subject.drop(' Hello World ');
      logInfo(`drop(extraParams=" Hello World "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0016
     * @tc.name      DragAndExchange_ListDragSessionDrop_0016
     * @tc.desc      ListDragSession.drop(extraParams="Hello WorldHello World") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDrop_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0016 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: boolean = subject.drop('Hello WorldHello World');
      logInfo(`drop(extraParams="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0017
     * @tc.name      DragAndExchange_ListDragSessionDrop_0017
     * @tc.desc      ListDragSession.drop(extraParams="Hello World_1") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDrop_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0017 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: boolean = subject.drop('Hello World_1');
      logInfo(`drop(extraParams="Hello World_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0018
     * @tc.name      DragAndExchange_ListDragSessionDrop_0018
     * @tc.desc      ListDragSession.drop(extraParams="xHello World") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDrop_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0018 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: boolean = subject.drop('xHello World');
      logInfo(`drop(extraParams="xHello World"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0019
     * @tc.name      DragAndExchange_ListDragSessionDrop_0019
     * @tc.desc      ListDragSession.drop(extraParams="   ") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDrop_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0019 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: boolean = subject.drop('   ');
      logInfo(`drop(extraParams="   "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0020
     * @tc.name      DragAndExchange_ListDragSessionDrop_0020
     * @tc.desc      ListDragSession.drop(extraParams="  ") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDrop_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0020 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: boolean = subject.drop('  ');
      logInfo(`drop(extraParams="  "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0021
     * @tc.name      DragAndExchange_ListDragSessionDrop_0021
     * @tc.desc      ListDragSession.drop(extraParams=" _1") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDrop_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0021 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: boolean = subject.drop(' _1');
      logInfo(`drop(extraParams=" _1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0022
     * @tc.name      DragAndExchange_ListDragSessionDrop_0022
     * @tc.desc      ListDragSession.drop(extraParams="x ") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDrop_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0022 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: boolean = subject.drop('x ');
      logInfo(`drop(extraParams="x "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0023
     * @tc.name      DragAndExchange_ListDragSessionDrop_0023
     * @tc.desc      ListDragSession.drop(extraParams=" 123 ") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDrop_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0023 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: boolean = subject.drop(' 123 ');
      logInfo(`drop(extraParams=" 123 "): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0024
     * @tc.name      DragAndExchange_ListDragSessionDrop_0024
     * @tc.desc      ListDragSession.drop(extraParams="123123") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDrop_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0024 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: boolean = subject.drop('123123');
      logInfo(`drop(extraParams="123123"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0025
     * @tc.name      DragAndExchange_ListDragSessionDrop_0025
     * @tc.desc      ListDragSession.drop(extraParams="123_1") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDrop_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0025 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: boolean = subject.drop('123_1');
      logInfo(`drop(extraParams="123_1"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0026
     * @tc.name      DragAndExchange_ListDragSessionDrop_0026
     * @tc.desc      ListDragSession.drop(extraParams="x123") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_ListDragSessionDrop_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0026 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: boolean = subject.drop('x123');
      logInfo(`drop(extraParams="x123"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0027
     * @tc.name      DragAndExchange_ListDragSessionDrop_0027
     * @tc.desc      ListDragSession.drop(extraParams="eElXjYQny") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDrop_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0027 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: boolean = subject.drop('eElXjYQny');
      logInfo(`drop(extraParams="eElXjYQny"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0028
     * @tc.name      DragAndExchange_ListDragSessionDrop_0028
     * @tc.desc      ListDragSession.drop(extraParams="BARJ8FDM") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDrop_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0028 begin`);
      const subject: ListDragSession = new ListDragSession(0);
      const actual: boolean = subject.drop('BARJ8FDM');
      logInfo(`drop(extraParams="BARJ8FDM"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0029
     * @tc.name      DragAndExchange_ListDragSessionDrop_0029
     * @tc.desc      ListDragSession.drop(extraParams="8PDl") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDrop_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0029 begin`);
      const subject: ListDragSession = new ListDragSession(1);
      const actual: boolean = subject.drop('8PDl');
      logInfo(`drop(extraParams="8PDl"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_LIST_DRAG_SESSION_DROP_0030
     * @tc.name      DragAndExchange_ListDragSessionDrop_0030
     * @tc.desc      ListDragSession.drop(extraParams="lDiAja2vQwt") yields true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_ListDragSessionDrop_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}ListDragSessionDrop_0030 begin`);
      const subject: ListDragSession = new ListDragSession(2);
      const actual: boolean = subject.drop('lDiAja2vQwt');
      logInfo(`drop(extraParams="lDiAja2vQwt"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ListDragSessionDrop_0030 end`);
    });
  });
}
