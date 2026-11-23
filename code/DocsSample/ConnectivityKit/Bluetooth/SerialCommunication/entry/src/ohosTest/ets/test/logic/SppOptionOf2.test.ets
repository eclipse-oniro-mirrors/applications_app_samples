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
import { SppOptionValue, sppOptionOf } from '../model/SppSerialLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SerialCommunication]';
const BUNDLE: string = 'SerialCommunication_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for sppOptionOf (13 cases). */
export default function sppOptionOf2Test(): void {
  describe('SppOptionOf2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0078
     * @tc.name      SerialCommunication_SppOptionOf_0078
     * @tc.desc      sppOptionOf(uuid="ofhiFjqhueZj") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0078 begin`);
      const actual: SppOptionValue = sppOptionOf('ofhiFjqhueZj');
      logInfo(`sppOptionOf(uuid="ofhiFjqhueZj"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('ofhiFjqhueZj');
      logInfo(`sppOptionOf(uuid="ofhiFjqhueZj"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="ofhiFjqhueZj"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0078 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0079
     * @tc.name      SerialCommunication_SppOptionOf_0079
     * @tc.desc      sppOptionOf(uuid="Fq3iuPC3h") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0079 begin`);
      const actual: SppOptionValue = sppOptionOf('Fq3iuPC3h');
      logInfo(`sppOptionOf(uuid="Fq3iuPC3h"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('Fq3iuPC3h');
      logInfo(`sppOptionOf(uuid="Fq3iuPC3h"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="Fq3iuPC3h"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0079 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0080
     * @tc.name      SerialCommunication_SppOptionOf_0080
     * @tc.desc      sppOptionOf(uuid="YnHvfnK") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0080 begin`);
      const actual: SppOptionValue = sppOptionOf('YnHvfnK');
      logInfo(`sppOptionOf(uuid="YnHvfnK"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('YnHvfnK');
      logInfo(`sppOptionOf(uuid="YnHvfnK"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="YnHvfnK"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0080 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0081
     * @tc.name      SerialCommunication_SppOptionOf_0081
     * @tc.desc      sppOptionOf(uuid="fa") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0081 begin`);
      const actual: SppOptionValue = sppOptionOf('fa');
      logInfo(`sppOptionOf(uuid="fa"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('fa');
      logInfo(`sppOptionOf(uuid="fa"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="fa"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0081 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0082
     * @tc.name      SerialCommunication_SppOptionOf_0082
     * @tc.desc      sppOptionOf(uuid="WfeyPI6vo") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0082 begin`);
      const actual: SppOptionValue = sppOptionOf('WfeyPI6vo');
      logInfo(`sppOptionOf(uuid="WfeyPI6vo"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('WfeyPI6vo');
      logInfo(`sppOptionOf(uuid="WfeyPI6vo"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="WfeyPI6vo"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0082 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0083
     * @tc.name      SerialCommunication_SppOptionOf_0083
     * @tc.desc      sppOptionOf(uuid="N") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0083 begin`);
      const actual: SppOptionValue = sppOptionOf('N');
      logInfo(`sppOptionOf(uuid="N"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('N');
      logInfo(`sppOptionOf(uuid="N"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="N"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0083 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0084
     * @tc.name      SerialCommunication_SppOptionOf_0084
     * @tc.desc      sppOptionOf(uuid="ijqOLGQd") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0084 begin`);
      const actual: SppOptionValue = sppOptionOf('ijqOLGQd');
      logInfo(`sppOptionOf(uuid="ijqOLGQd"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('ijqOLGQd');
      logInfo(`sppOptionOf(uuid="ijqOLGQd"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="ijqOLGQd"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0084 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0085
     * @tc.name      SerialCommunication_SppOptionOf_0085
     * @tc.desc      sppOptionOf(uuid="lMx4VDb13abJ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0085 begin`);
      const actual: SppOptionValue = sppOptionOf('lMx4VDb13abJ');
      logInfo(`sppOptionOf(uuid="lMx4VDb13abJ"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('lMx4VDb13abJ');
      logInfo(`sppOptionOf(uuid="lMx4VDb13abJ"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="lMx4VDb13abJ"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0085 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0086
     * @tc.name      SerialCommunication_SppOptionOf_0086
     * @tc.desc      sppOptionOf(uuid="1ZIAszN") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0086 begin`);
      const actual: SppOptionValue = sppOptionOf('1ZIAszN');
      logInfo(`sppOptionOf(uuid="1ZIAszN"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('1ZIAszN');
      logInfo(`sppOptionOf(uuid="1ZIAszN"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="1ZIAszN"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0086 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0087
     * @tc.name      SerialCommunication_SppOptionOf_0087
     * @tc.desc      sppOptionOf(uuid="GYx3z") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0087 begin`);
      const actual: SppOptionValue = sppOptionOf('GYx3z');
      logInfo(`sppOptionOf(uuid="GYx3z"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('GYx3z');
      logInfo(`sppOptionOf(uuid="GYx3z"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="GYx3z"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0087 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0088
     * @tc.name      SerialCommunication_SppOptionOf_0088
     * @tc.desc      sppOptionOf(uuid="GrUn") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0088 begin`);
      const actual: SppOptionValue = sppOptionOf('GrUn');
      logInfo(`sppOptionOf(uuid="GrUn"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('GrUn');
      logInfo(`sppOptionOf(uuid="GrUn"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="GrUn"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0088 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0089
     * @tc.name      SerialCommunication_SppOptionOf_0089
     * @tc.desc      sppOptionOf(uuid="LEpbO30RwK") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0089 begin`);
      const actual: SppOptionValue = sppOptionOf('LEpbO30RwK');
      logInfo(`sppOptionOf(uuid="LEpbO30RwK"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('LEpbO30RwK');
      logInfo(`sppOptionOf(uuid="LEpbO30RwK"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="LEpbO30RwK"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0089 end`);
    });

    /**
     * @tc.number    SUB_SERIALCOMMUNICATION_SPP_OPTION_OF_0090
     * @tc.name      SerialCommunication_SppOptionOf_0090
     * @tc.desc      sppOptionOf(uuid="nTXMawc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SerialCommunication_SppOptionOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SppOptionOf_0090 begin`);
      const actual: SppOptionValue = sppOptionOf('nTXMawc');
      logInfo(`sppOptionOf(uuid="nTXMawc"): actual.uuid=${actual.uuid}`);
      expect(actual.uuid).assertEqual('nTXMawc');
      logInfo(`sppOptionOf(uuid="nTXMawc"): actual.secure=${actual.secure}`);
      expect(actual.secure).assertTrue();
      logInfo(`sppOptionOf(uuid="nTXMawc"): actual.type=${actual.type}`);
      expect(actual.type).assertEqual(0);
      logInfo(`${BUNDLE}SppOptionOf_0090 end`);
    });
  });
}
