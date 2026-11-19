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
import { ListExchangeModel } from '../model/ListExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ListBeExchange]';
const BUNDLE: string = 'ListBeExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ListExchangeModel.move (30 cases). */
export default function listExchangeModelMoveTest(): void {
  describe('ListExchangeModelMoveTest', (): void => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0001
     * @tc.name      ListBeExchange_ListExchangeModelMove_0001
     * @tc.desc      ListExchangeModel.move(item="", offsetY=-100, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeModelMove_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0001 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', -100, 0);
      logInfo(`move(item="", offsetY=-100, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0001 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0002
     * @tc.name      ListBeExchange_ListExchangeModelMove_0002
     * @tc.desc      ListExchangeModel.move(item="a", offsetY=-100, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ListBeExchange_ListExchangeModelMove_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0002 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('a', -100, 0);
      logInfo(`move(item="a", offsetY=-100, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0002 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0003
     * @tc.name      ListBeExchange_ListExchangeModelMove_0003
     * @tc.desc      ListExchangeModel.move(item="abc", offsetY=-100, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0003 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('abc', -100, 0);
      logInfo(`move(item="abc", offsetY=-100, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0003 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0004
     * @tc.name      ListBeExchange_ListExchangeModelMove_0004
     * @tc.desc      ListExchangeModel.move(item="Hello World", offsetY=-100, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0004 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('Hello World', -100, 0);
      logInfo(`move(item="Hello World", offsetY=-100, cu...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0004 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0005
     * @tc.name      ListBeExchange_ListExchangeModelMove_0005
     * @tc.desc      ListExchangeModel.move(item=" ", offsetY=-100, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0005 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move(' ', -100, 0);
      logInfo(`move(item=" ", offsetY=-100, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0005 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0006
     * @tc.name      ListBeExchange_ListExchangeModelMove_0006
     * @tc.desc      ListExchangeModel.move(item="123", offsetY=-100, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0006 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('123', -100, 0);
      logInfo(`move(item="123", offsetY=-100, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0006 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0007
     * @tc.name      ListBeExchange_ListExchangeModelMove_0007
     * @tc.desc      ListExchangeModel.move(item=" a ", offsetY=-100, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0007 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move(' a ', -100, 0);
      logInfo(`move(item=" a ", offsetY=-100, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0007 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0008
     * @tc.name      ListBeExchange_ListExchangeModelMove_0008
     * @tc.desc      ListExchangeModel.move(item="aa", offsetY=-100, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0008 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('aa', -100, 0);
      logInfo(`move(item="aa", offsetY=-100, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0008 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0009
     * @tc.name      ListBeExchange_ListExchangeModelMove_0009
     * @tc.desc      ListExchangeModel.move(item="a_1", offsetY=-100, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0009 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('a_1', -100, 0);
      logInfo(`move(item="a_1", offsetY=-100, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0009 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0010
     * @tc.name      ListBeExchange_ListExchangeModelMove_0010
     * @tc.desc      ListExchangeModel.move(item="xa", offsetY=-100, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0010 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('xa', -100, 0);
      logInfo(`move(item="xa", offsetY=-100, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0010 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0011
     * @tc.name      ListBeExchange_ListExchangeModelMove_0011
     * @tc.desc      ListExchangeModel.move(item="", offsetY=-1, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0011 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', -1, 0);
      logInfo(`move(item="", offsetY=-1, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0011 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0012
     * @tc.name      ListBeExchange_ListExchangeModelMove_0012
     * @tc.desc      ListExchangeModel.move(item="", offsetY=0, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0012 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', 0, 0);
      logInfo(`move(item="", offsetY=0, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0012 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0013
     * @tc.name      ListBeExchange_ListExchangeModelMove_0013
     * @tc.desc      ListExchangeModel.move(item="", offsetY=1, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0013 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', 1, 0);
      logInfo(`move(item="", offsetY=1, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0013 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0014
     * @tc.name      ListBeExchange_ListExchangeModelMove_0014
     * @tc.desc      ListExchangeModel.move(item="", offsetY=-2, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0014 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', -2, 0);
      logInfo(`move(item="", offsetY=-2, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0014 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0015
     * @tc.name      ListBeExchange_ListExchangeModelMove_0015
     * @tc.desc      ListExchangeModel.move(item="", offsetY=2, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0015 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', 2, 0);
      logInfo(`move(item="", offsetY=2, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0015 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0016
     * @tc.name      ListBeExchange_ListExchangeModelMove_0016
     * @tc.desc      ListExchangeModel.move(item="", offsetY=50, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0016 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', 50, 0);
      logInfo(`move(item="", offsetY=50, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0016 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0017
     * @tc.name      ListBeExchange_ListExchangeModelMove_0017
     * @tc.desc      ListExchangeModel.move(item="", offsetY=100, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0017 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', 100, 0);
      logInfo(`move(item="", offsetY=100, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0017 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0018
     * @tc.name      ListBeExchange_ListExchangeModelMove_0018
     * @tc.desc      ListExchangeModel.move(item="", offsetY=3, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0018 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', 3, 0);
      logInfo(`move(item="", offsetY=3, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0018 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0019
     * @tc.name      ListBeExchange_ListExchangeModelMove_0019
     * @tc.desc      ListExchangeModel.move(item="", offsetY=10, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0019 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', 10, 0);
      logInfo(`move(item="", offsetY=10, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0019 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0020
     * @tc.name      ListBeExchange_ListExchangeModelMove_0020
     * @tc.desc      ListExchangeModel.move(item="", offsetY=5, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0020 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', 5, 0);
      logInfo(`move(item="", offsetY=5, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0020 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0021
     * @tc.name      ListBeExchange_ListExchangeModelMove_0021
     * @tc.desc      ListExchangeModel.move(item="", offsetY=99, curveValue=0) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0021 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', 99, 0);
      logInfo(`move(item="", offsetY=99, curveValue=0): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0021 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0022
     * @tc.name      ListBeExchange_ListExchangeModelMove_0022
     * @tc.desc      ListExchangeModel.move(item="", offsetY=-100, curveValue=-1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0022 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', -100, -1);
      logInfo(`move(item="", offsetY=-100, curveValue=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0022 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0023
     * @tc.name      ListBeExchange_ListExchangeModelMove_0023
     * @tc.desc      ListExchangeModel.move(item="", offsetY=-100, curveValue=1) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0023 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', -100, 1);
      logInfo(`move(item="", offsetY=-100, curveValue=1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0023 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0024
     * @tc.name      ListBeExchange_ListExchangeModelMove_0024
     * @tc.desc      ListExchangeModel.move(item="", offsetY=-100, curveValue=-2) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0024 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', -100, -2);
      logInfo(`move(item="", offsetY=-100, curveValue=-2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0024 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0025
     * @tc.name      ListBeExchange_ListExchangeModelMove_0025
     * @tc.desc      ListExchangeModel.move(item="", offsetY=-100, curveValue=2) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0025 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', -100, 2);
      logInfo(`move(item="", offsetY=-100, curveValue=2): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0025 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0026
     * @tc.name      ListBeExchange_ListExchangeModelMove_0026
     * @tc.desc      ListExchangeModel.move(item="", offsetY=-100, curveValue=3) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0026 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', -100, 3);
      logInfo(`move(item="", offsetY=-100, curveValue=3): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0026 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0027
     * @tc.name      ListBeExchange_ListExchangeModelMove_0027
     * @tc.desc      ListExchangeModel.move(item="", offsetY=-100, curveValue=10) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0027 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', -100, 10);
      logInfo(`move(item="", offsetY=-100, curveValue=10): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0027 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0028
     * @tc.name      ListBeExchange_ListExchangeModelMove_0028
     * @tc.desc      ListExchangeModel.move(item="", offsetY=-100, curveValue=100) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0028 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', -100, 100);
      logInfo(`move(item="", offsetY=-100, curveValue=100): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0028 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0029
     * @tc.name      ListBeExchange_ListExchangeModelMove_0029
     * @tc.desc      ListExchangeModel.move(item="", offsetY=-100, curveValue=5) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0029 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', -100, 5);
      logInfo(`move(item="", offsetY=-100, curveValue=5): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0029 end`);
    });

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_LIST_EXCHANGE_MODEL_MOVE_0030
     * @tc.name      ListBeExchange_ListExchangeModelMove_0030
     * @tc.desc      ListExchangeModel.move(item="", offsetY=-100, curveValue=15) yields -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ListBeExchange_ListExchangeModelMove_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}ListExchangeModelMove_0030 begin`);
      const subject: ListExchangeModel = new ListExchangeModel();
      const actual: number = subject.move('', -100, 15);
      logInfo(`move(item="", offsetY=-100, curveValue=15): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}ListExchangeModelMove_0030 end`);
    });
  });
}
