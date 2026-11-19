/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { serviceManager } from 'servicemanagerhar/src/main/ets/ServiceManager';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandPathSideEffects]';

export default function stateTransitionTest(): void {
  describe('StateTransitionTest', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_STATE_0100
     * @tc.name      testFromFalseInitBecomesTrue0001
     * @tc.desc      Starting from inited=false, one init() moves the state to true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFromFalseInitBecomesTrue0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFromFalseInitBecomesTrue0001 begin');
      serviceManager.inited = false;
      try {
        expect(serviceManager.inited).assertFalse();
        serviceManager.init();
        expect(serviceManager.inited).assertTrue();
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFromFalseInitBecomesTrue0001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_STATE_0200
     * @tc.name      testFromFalsePrintStaysFalse0002
     * @tc.desc      print() from inited=false does not initialize and does not throw
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFromFalsePrintStaysFalse0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFromFalsePrintStaysFalse0002 begin');
      serviceManager.inited = false;
      try {
        let threw: boolean = false;
        try {
          serviceManager.print();
        } catch (err) {
          threw = true;
        }
        expect(threw).assertFalse();
        expect(serviceManager.inited).assertFalse();
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFromFalsePrintStaysFalse0002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_STATE_0300
     * @tc.name      testFromFalsePrintTwiceStaysFalse0003
     * @tc.desc      Two print() calls from inited=false still leave the state false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testFromFalsePrintTwiceStaysFalse0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFromFalsePrintTwiceStaysFalse0003 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertFalse();
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFromFalsePrintTwiceStaysFalse0003 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_STATE_0400
     * @tc.name      testFromFalseInitThenPrint0004
     * @tc.desc      init() followed by print() ends in the initialized state
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testFromFalseInitThenPrint0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFromFalseInitThenPrint0004 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertTrue();
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFromFalseInitThenPrint0004 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_STATE_0500
     * @tc.name      testFromFalsePrintThenInit0005
     * @tc.desc      print() before init() does not block a later init() from setting true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testFromFalsePrintThenInit0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFromFalsePrintThenInit0005 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        expect(serviceManager.inited).assertFalse();
        serviceManager.init();
        expect(serviceManager.inited).assertTrue();
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFromFalsePrintThenInit0005 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_STATE_0600
     * @tc.name      testFromFalseDoubleInit0006
     * @tc.desc      Two init() calls from false end in true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testFromFalseDoubleInit0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFromFalseDoubleInit0006 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertTrue();
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFromFalseDoubleInit0006 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_STATE_0700
     * @tc.name      testFromTruePrintStaysTrue0007
     * @tc.desc      print() from inited=true keeps the state true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testFromTruePrintStaysTrue0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFromTruePrintStaysTrue0007 begin');
      serviceManager.inited = true;
      serviceManager.print();
      expect(serviceManager.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFromTruePrintStaysTrue0007 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_STATE_0800
     * @tc.name      testFromTrueInitStaysTrue0008
     * @tc.desc      init() from inited=true is idempotent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testFromTrueInitStaysTrue0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFromTrueInitStaysTrue0008 begin');
      serviceManager.inited = true;
      serviceManager.init();
      expect(serviceManager.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFromTrueInitStaysTrue0008 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_STATE_0900
     * @tc.name      testFromTrueMixedSequence0009
     * @tc.desc      print/init/print from inited=true ends in true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testFromTrueMixedSequence0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFromTrueMixedSequence0009 begin');
      serviceManager.inited = true;
      serviceManager.print();
      serviceManager.init();
      serviceManager.print();
      expect(serviceManager.inited).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFromTrueMixedSequence0009 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_STATE_1000
     * @tc.name      testManualResetThenInitRecovers0010
     * @tc.desc      After the public flag is reset to false, init() recovers the initialized state
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testManualResetThenInitRecovers0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testManualResetThenInitRecovers0010 begin');
      serviceManager.inited = true;
      serviceManager.inited = false;
      try {
        expect(serviceManager.inited).assertFalse();
        serviceManager.init();
        expect(serviceManager.inited).assertTrue();
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testManualResetThenInitRecovers0010 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_STATE_1100
     * @tc.name      testRepeatedResetInitCycles0011
     * @tc.desc      Repeating reset-to-false then init() always returns to true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testRepeatedResetInitCycles0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatedResetInitCycles0011 begin');
      try {
        for (let i: number = 0; i < 5; i++) {
          serviceManager.inited = false;
          serviceManager.init();
          expect(serviceManager.inited).assertTrue();
        }
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatedResetInitCycles0011 end');
    })

  })
}
