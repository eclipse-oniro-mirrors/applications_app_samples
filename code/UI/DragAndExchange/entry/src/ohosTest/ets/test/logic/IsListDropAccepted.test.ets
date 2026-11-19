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
import { isListDropAccepted } from '../model/DragExchangeLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DragAndExchange]';
const BUNDLE: string = 'DragAndExchange_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isListDropAccepted (50 cases). */
export default function isListDropAcceptedTest(): void {
  describe('IsListDropAcceptedTest', (): void => {
    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0001
     * @tc.name      DragAndExchange_IsListDropAccepted_0001
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_IsListDropAccepted_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0001 begin`);
      const actual: boolean = isListDropAccepted(0, 0);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListDropAccepted_0001 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0002
     * @tc.name      DragAndExchange_IsListDropAccepted_0002
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('DragAndExchange_IsListDropAccepted_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0002 begin`);
      const actual: boolean = isListDropAccepted(0, 1);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0002 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0003
     * @tc.name      DragAndExchange_IsListDropAccepted_0003
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0003 begin`);
      const actual: boolean = isListDropAccepted(0, 2);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0003 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0004
     * @tc.name      DragAndExchange_IsListDropAccepted_0004
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=5) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0004 begin`);
      const actual: boolean = isListDropAccepted(0, 5);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0004 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0005
     * @tc.name      DragAndExchange_IsListDropAccepted_0005
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=10) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0005 begin`);
      const actual: boolean = isListDropAccepted(0, 10);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0005 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0006
     * @tc.name      DragAndExchange_IsListDropAccepted_0006
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0006 begin`);
      const actual: boolean = isListDropAccepted(0, 100);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0006 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0007
     * @tc.name      DragAndExchange_IsListDropAccepted_0007
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_IsListDropAccepted_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0007 begin`);
      const actual: boolean = isListDropAccepted(0, -1);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListDropAccepted_0007 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0008
     * @tc.name      DragAndExchange_IsListDropAccepted_0008
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0008 begin`);
      const actual: boolean = isListDropAccepted(0, 3);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0008 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0009
     * @tc.name      DragAndExchange_IsListDropAccepted_0009
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=15) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0009 begin`);
      const actual: boolean = isListDropAccepted(0, 15);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0009 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0010
     * @tc.name      DragAndExchange_IsListDropAccepted_0010
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=20) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0010 begin`);
      const actual: boolean = isListDropAccepted(0, 20);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0010 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0011
     * @tc.name      DragAndExchange_IsListDropAccepted_0011
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=25) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0011 begin`);
      const actual: boolean = isListDropAccepted(0, 25);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0011 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0012
     * @tc.name      DragAndExchange_IsListDropAccepted_0012
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=30) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0012 begin`);
      const actual: boolean = isListDropAccepted(0, 30);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0012 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0013
     * @tc.name      DragAndExchange_IsListDropAccepted_0013
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=35) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0013 begin`);
      const actual: boolean = isListDropAccepted(0, 35);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0013 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0014
     * @tc.name      DragAndExchange_IsListDropAccepted_0014
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=40) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0014 begin`);
      const actual: boolean = isListDropAccepted(0, 40);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0014 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0015
     * @tc.name      DragAndExchange_IsListDropAccepted_0015
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=45) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0015 begin`);
      const actual: boolean = isListDropAccepted(0, 45);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0015 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0016
     * @tc.name      DragAndExchange_IsListDropAccepted_0016
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=50) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0016 begin`);
      const actual: boolean = isListDropAccepted(0, 50);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0016 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0017
     * @tc.name      DragAndExchange_IsListDropAccepted_0017
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=55) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0017 begin`);
      const actual: boolean = isListDropAccepted(0, 55);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0017 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0018
     * @tc.name      DragAndExchange_IsListDropAccepted_0018
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=60) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0018 begin`);
      const actual: boolean = isListDropAccepted(0, 60);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0018 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0019
     * @tc.name      DragAndExchange_IsListDropAccepted_0019
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=65) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0019 begin`);
      const actual: boolean = isListDropAccepted(0, 65);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0019 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0020
     * @tc.name      DragAndExchange_IsListDropAccepted_0020
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=70) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0020 begin`);
      const actual: boolean = isListDropAccepted(0, 70);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0020 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0021
     * @tc.name      DragAndExchange_IsListDropAccepted_0021
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=75) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0021 begin`);
      const actual: boolean = isListDropAccepted(0, 75);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0021 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0022
     * @tc.name      DragAndExchange_IsListDropAccepted_0022
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=80) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0022 begin`);
      const actual: boolean = isListDropAccepted(0, 80);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0022 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0023
     * @tc.name      DragAndExchange_IsListDropAccepted_0023
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=85) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0023 begin`);
      const actual: boolean = isListDropAccepted(0, 85);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0023 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0024
     * @tc.name      DragAndExchange_IsListDropAccepted_0024
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=90) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0024 begin`);
      const actual: boolean = isListDropAccepted(0, 90);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0024 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0025
     * @tc.name      DragAndExchange_IsListDropAccepted_0025
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=95) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0025 begin`);
      const actual: boolean = isListDropAccepted(0, 95);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0025 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0026
     * @tc.name      DragAndExchange_IsListDropAccepted_0026
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=105) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0026 begin`);
      const actual: boolean = isListDropAccepted(0, 105);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0026 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0027
     * @tc.name      DragAndExchange_IsListDropAccepted_0027
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=110) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0027 begin`);
      const actual: boolean = isListDropAccepted(0, 110);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0027 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0028
     * @tc.name      DragAndExchange_IsListDropAccepted_0028
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=116) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0028 begin`);
      const actual: boolean = isListDropAccepted(0, 116);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0028 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0029
     * @tc.name      DragAndExchange_IsListDropAccepted_0029
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=39) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0029 begin`);
      const actual: boolean = isListDropAccepted(0, 39);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0029 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0030
     * @tc.name      DragAndExchange_IsListDropAccepted_0030
     * @tc.desc      isListDropAccepted(insertIndex=0, totalCount=-23) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_IsListDropAccepted_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0030 begin`);
      const actual: boolean = isListDropAccepted(0, -23);
      logInfo(`isListDropAccepted(insertIndex=0, totalCo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListDropAccepted_0030 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0031
     * @tc.name      DragAndExchange_IsListDropAccepted_0031
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0031 begin`);
      const actual: boolean = isListDropAccepted(1, 0);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListDropAccepted_0031 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0032
     * @tc.name      DragAndExchange_IsListDropAccepted_0032
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0032 begin`);
      const actual: boolean = isListDropAccepted(1, 1);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListDropAccepted_0032 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0033
     * @tc.name      DragAndExchange_IsListDropAccepted_0033
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0033 begin`);
      const actual: boolean = isListDropAccepted(1, 2);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0033 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0034
     * @tc.name      DragAndExchange_IsListDropAccepted_0034
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=5) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0034 begin`);
      const actual: boolean = isListDropAccepted(1, 5);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0034 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0035
     * @tc.name      DragAndExchange_IsListDropAccepted_0035
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=10) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0035 begin`);
      const actual: boolean = isListDropAccepted(1, 10);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0035 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0036
     * @tc.name      DragAndExchange_IsListDropAccepted_0036
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0036 begin`);
      const actual: boolean = isListDropAccepted(1, 100);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0036 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0037
     * @tc.name      DragAndExchange_IsListDropAccepted_0037
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('DragAndExchange_IsListDropAccepted_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0037 begin`);
      const actual: boolean = isListDropAccepted(1, -1);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsListDropAccepted_0037 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0038
     * @tc.name      DragAndExchange_IsListDropAccepted_0038
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0038 begin`);
      const actual: boolean = isListDropAccepted(1, 3);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0038 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0039
     * @tc.name      DragAndExchange_IsListDropAccepted_0039
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=15) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0039 begin`);
      const actual: boolean = isListDropAccepted(1, 15);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0039 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0040
     * @tc.name      DragAndExchange_IsListDropAccepted_0040
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=20) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0040 begin`);
      const actual: boolean = isListDropAccepted(1, 20);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0040 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0041
     * @tc.name      DragAndExchange_IsListDropAccepted_0041
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=25) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0041 begin`);
      const actual: boolean = isListDropAccepted(1, 25);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0041 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0042
     * @tc.name      DragAndExchange_IsListDropAccepted_0042
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=30) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0042 begin`);
      const actual: boolean = isListDropAccepted(1, 30);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0042 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0043
     * @tc.name      DragAndExchange_IsListDropAccepted_0043
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=35) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0043 begin`);
      const actual: boolean = isListDropAccepted(1, 35);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0043 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0044
     * @tc.name      DragAndExchange_IsListDropAccepted_0044
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=40) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0044 begin`);
      const actual: boolean = isListDropAccepted(1, 40);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0044 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0045
     * @tc.name      DragAndExchange_IsListDropAccepted_0045
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=45) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0045 begin`);
      const actual: boolean = isListDropAccepted(1, 45);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0045 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0046
     * @tc.name      DragAndExchange_IsListDropAccepted_0046
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=50) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0046 begin`);
      const actual: boolean = isListDropAccepted(1, 50);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0046 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0047
     * @tc.name      DragAndExchange_IsListDropAccepted_0047
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=55) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0047 begin`);
      const actual: boolean = isListDropAccepted(1, 55);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0047 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0048
     * @tc.name      DragAndExchange_IsListDropAccepted_0048
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=60) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0048 begin`);
      const actual: boolean = isListDropAccepted(1, 60);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0048 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0049
     * @tc.name      DragAndExchange_IsListDropAccepted_0049
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=65) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0049 begin`);
      const actual: boolean = isListDropAccepted(1, 65);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0049 end`);
    });

    /**
     * @tc.number    SUB_DRAGANDEXCHANGE_IS_LIST_DROP_ACCEPTED_0050
     * @tc.name      DragAndExchange_IsListDropAccepted_0050
     * @tc.desc      isListDropAccepted(insertIndex=1, totalCount=70) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('DragAndExchange_IsListDropAccepted_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}IsListDropAccepted_0050 begin`);
      const actual: boolean = isListDropAccepted(1, 70);
      logInfo(`isListDropAccepted(insertIndex=1, totalCo...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}IsListDropAccepted_0050 end`);
    });
  });
}
