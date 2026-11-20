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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { readMessageOf } from '../model/SppSerialLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SerialCommunication]';
const BUNDLE: string = 'SerialCommunication_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for readMessageOf (16 cases). */
export default function readMessageOfTest(): void {
  describe('ReadMessageOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_READ_MESSAGE_OF_0001
     * @tc.name      SerialCommunication_ReadMessageOf_0001
     * @tc.desc      readMessageOf(bytes=[], isOff=true) returns "offSppRead success, data = {}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_ReadMessageOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ReadMessageOf_0001 begin`);
      const actual: string = readMessageOf([], true);
      logInfo(`readMessageOf(bytes=[], isOff=true): actual=${actual}`);
      expect(actual).assertEqual('offSppRead success, data = {}');
      logInfo(`${BUNDLE}ReadMessageOf_0001 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_READ_MESSAGE_OF_0002
     * @tc.name      SerialCommunication_ReadMessageOf_0002
     * @tc.desc      readMessageOf(bytes=[], isOff=false) returns "sppRead success, data = {}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SerialCommunication_ReadMessageOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ReadMessageOf_0002 begin`);
      const actual: string = readMessageOf([], false);
      logInfo(`readMessageOf(bytes=[], isOff=false): actual=${actual}`);
      expect(actual).assertEqual('sppRead success, data = {}');
      logInfo(`${BUNDLE}ReadMessageOf_0002 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_READ_MESSAGE_OF_0003
     * @tc.name      SerialCommunication_ReadMessageOf_0003
     * @tc.desc      readMessageOf(bytes=[0], isOff=true) returns "offSppRead success, data = {?"0?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ReadMessageOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadMessageOf_0003 begin`);
      const actual: string = readMessageOf([0], true);
      logInfo(`readMessageOf(bytes=[0], isOff=true): actual=${actual}`);
      expect(actual).assertEqual('offSppRead success, data = {"0":0}');
      logInfo(`${BUNDLE}ReadMessageOf_0003 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_READ_MESSAGE_OF_0004
     * @tc.name      SerialCommunication_ReadMessageOf_0004
     * @tc.desc      readMessageOf(bytes=[0], isOff=false) returns "sppRead success, data = {?"0?":0}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ReadMessageOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadMessageOf_0004 begin`);
      const actual: string = readMessageOf([0], false);
      logInfo(`readMessageOf(bytes=[0], isOff=false): actual=${actual}`);
      expect(actual).assertEqual('sppRead success, data = {"0":0}');
      logInfo(`${BUNDLE}ReadMessageOf_0004 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_READ_MESSAGE_OF_0005
     * @tc.name      SerialCommunication_ReadMessageOf_0005
     * @tc.desc      readMessageOf(bytes=[0, 1], isOff=true) returns "offSppRead success, data = {?"0?":0,?"1?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ReadMessageOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadMessageOf_0005 begin`);
      const actual: string = readMessageOf([0, 1], true);
      logInfo(`readMessageOf(bytes=[0, 1], isOff=true): actual=${actual}`);
      expect(actual).assertEqual('offSppRead success, data = {"0":0,"1":1}');
      logInfo(`${BUNDLE}ReadMessageOf_0005 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_READ_MESSAGE_OF_0006
     * @tc.name      SerialCommunication_ReadMessageOf_0006
     * @tc.desc      readMessageOf(bytes=[0, 1], isOff=false) returns "sppRead success, data = {?"0?":0,?"1?":1}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ReadMessageOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadMessageOf_0006 begin`);
      const actual: string = readMessageOf([0, 1], false);
      logInfo(`readMessageOf(bytes=[0, 1], isOff=false): actual=${actual}`);
      expect(actual).assertEqual('sppRead success, data = {"0":0,"1":1}');
      logInfo(`${BUNDLE}ReadMessageOf_0006 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_READ_MESSAGE_OF_0007
     * @tc.name      SerialCommunication_ReadMessageOf_0007
     * @tc.desc      readMessageOf(bytes=[1, 0, -1], isOff=true) returns "offSppRead success, data = {?"0?":1,?"1?":0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ReadMessageOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadMessageOf_0007 begin`);
      const actual: string = readMessageOf([1, 0, -1], true);
      logInfo(`readMessageOf(bytes=[1, 0, -1], isOff=true): actual=${actual}`);
      expect(actual).assertEqual('offSppRead success, data = {"0":1,"1":0,"2":255}');
      logInfo(`${BUNDLE}ReadMessageOf_0007 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_READ_MESSAGE_OF_0008
     * @tc.name      SerialCommunication_ReadMessageOf_0008
     * @tc.desc      readMessageOf(bytes=[1, 0, -1], isOff=false) returns "sppRead success, data = {?"0?":1,?"1?":0,?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ReadMessageOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadMessageOf_0008 begin`);
      const actual: string = readMessageOf([1, 0, -1], false);
      logInfo(`readMessageOf(bytes=[1, 0, -1], isOff=false): actual=${actual}`);
      expect(actual).assertEqual('sppRead success, data = {"0":1,"1":0,"2":255}');
      logInfo(`${BUNDLE}ReadMessageOf_0008 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_READ_MESSAGE_OF_0009
     * @tc.name      SerialCommunication_ReadMessageOf_0009
     * @tc.desc      readMessageOf(bytes=[-1, -1], isOff=true) returns "offSppRead success, data = {?"0?":255,?"1?":2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ReadMessageOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadMessageOf_0009 begin`);
      const actual: string = readMessageOf([-1, -1], true);
      logInfo(`readMessageOf(bytes=[-1, -1], isOff=true): actual=${actual}`);
      expect(actual).assertEqual('offSppRead success, data = {"0":255,"1":255}');
      logInfo(`${BUNDLE}ReadMessageOf_0009 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_READ_MESSAGE_OF_0010
     * @tc.name      SerialCommunication_ReadMessageOf_0010
     * @tc.desc      readMessageOf(bytes=[-1, -1], isOff=false) returns "sppRead success, data = {?"0?":255,?"1?":255}"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ReadMessageOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadMessageOf_0010 begin`);
      const actual: string = readMessageOf([-1, -1], false);
      logInfo(`readMessageOf(bytes=[-1, -1], isOff=false): actual=${actual}`);
      expect(actual).assertEqual('sppRead success, data = {"0":255,"1":255}');
      logInfo(`${BUNDLE}ReadMessageOf_0010 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_READ_MESSAGE_OF_0011
     * @tc.name      SerialCommunication_ReadMessageOf_0011
     * @tc.desc      readMessageOf(bytes=[0, 1, -1, 2, 3], isOff=true) returns "offSppRead success, data = {?"0?":0,?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ReadMessageOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadMessageOf_0011 begin`);
      const actual: string = readMessageOf([0, 1, -1, 2, 3], true);
      logInfo(`readMessageOf(bytes=[0, 1, -1, 2, 3], isO...: actual=${actual}`);
      expect(actual).assertEqual('offSppRead success, data = {"0":0,"1":1,"2":255,"3":2,"4":3}');
      logInfo(`${BUNDLE}ReadMessageOf_0011 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_READ_MESSAGE_OF_0012
     * @tc.name      SerialCommunication_ReadMessageOf_0012
     * @tc.desc      readMessageOf(bytes=[0, 1, -1, 2, 3], isOff=false) returns "sppRead success, data = {?"0?":0,?"1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ReadMessageOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadMessageOf_0012 begin`);
      const actual: string = readMessageOf([0, 1, -1, 2, 3], false);
      logInfo(`readMessageOf(bytes=[0, 1, -1, 2, 3], isO...: actual=${actual}`);
      expect(actual).assertEqual('sppRead success, data = {"0":0,"1":1,"2":255,"3":2,"4":3}');
      logInfo(`${BUNDLE}ReadMessageOf_0012 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_READ_MESSAGE_OF_0013
     * @tc.name      SerialCommunication_ReadMessageOf_0013
     * @tc.desc      readMessageOf(bytes=[2, 1, 3, 1, 10], isOff=true) returns "offSppRead success, data = {?"0?":2,?...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ReadMessageOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadMessageOf_0013 begin`);
      const actual: string = readMessageOf([2, 1, 3, 1, 10], true);
      logInfo(`readMessageOf(bytes=[2, 1, 3, 1, 10], isO...: actual=${actual}`);
      expect(actual).assertEqual('offSppRead success, data = {"0":2,"1":1,"2":3,"3":1,"4":10}');
      logInfo(`${BUNDLE}ReadMessageOf_0013 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_READ_MESSAGE_OF_0014
     * @tc.name      SerialCommunication_ReadMessageOf_0014
     * @tc.desc      readMessageOf(bytes=[2, 1, 3, 1, 10], isOff=false) returns "sppRead success, data = {?"0?":2,?"1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ReadMessageOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadMessageOf_0014 begin`);
      const actual: string = readMessageOf([2, 1, 3, 1, 10], false);
      logInfo(`readMessageOf(bytes=[2, 1, 3, 1, 10], isO...: actual=${actual}`);
      expect(actual).assertEqual('sppRead success, data = {"0":2,"1":1,"2":3,"3":1,"4":10}');
      logInfo(`${BUNDLE}ReadMessageOf_0014 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_READ_MESSAGE_OF_0015
     * @tc.name      SerialCommunication_ReadMessageOf_0015
     * @tc.desc      readMessageOf(bytes=[10, 3, 2, -1, 1, 0], isOff=true) returns "?"1?":3,?"2?":2,?"3?":255,?"4?":1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ReadMessageOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadMessageOf_0015 begin`);
      const actual: string = readMessageOf([10, 3, 2, -1, 1, 0], true);
      logInfo(`readMessageOf(bytes=[10, 3, 2, -1, 1, 0],...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`readMessageOf(bytes=[10, 3, 2, -1, 1, 0],...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('offSppRead success, data = {"0":');
      logInfo(`readMessageOf(bytes=[10, 3, 2, -1, 1, 0],...: actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual('"1":3,"2":2,"3":255,"4":1,"5":0}');
      logInfo(`${BUNDLE}ReadMessageOf_0015 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_READ_MESSAGE_OF_0016
     * @tc.name      SerialCommunication_ReadMessageOf_0016
     * @tc.desc      readMessageOf(bytes=[10, 3, 2, -1, 1, 0], isOff=false) returns "sppRead success, data = {?"0?":1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_ReadMessageOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ReadMessageOf_0016 begin`);
      const actual: string = readMessageOf([10, 3, 2, -1, 1, 0], false);
      logInfo(`readMessageOf(bytes=[10, 3, 2, -1, 1, 0],...: actual=${actual}`);
      expect(actual).assertEqual('sppRead success, data = {"0":10,"1":3,"2":2,"3":255,"4":1,"5":0}');
      logInfo(`${BUNDLE}ReadMessageOf_0016 end`);
    });
  });
}
