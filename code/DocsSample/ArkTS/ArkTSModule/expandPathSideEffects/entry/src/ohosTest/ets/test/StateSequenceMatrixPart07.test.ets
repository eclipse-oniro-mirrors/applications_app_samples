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

export default function StateSequenceMatrixPart07Test(): void {
  describe('StateSequenceMatrixPart07', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_0100
     * @tc.name      testStateSequencePart070001
     * @tc.desc      From inited=false apply p i i p p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070001 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_0200
     * @tc.name      testStateSequencePart070002
     * @tc.desc      From inited=false apply i i i p p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070002 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_0300
     * @tc.name      testStateSequencePart070003
     * @tc.desc      From inited=false apply p p p i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070003 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070003 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_0400
     * @tc.name      testStateSequencePart070004
     * @tc.desc      From inited=false apply i p p i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070004 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070004 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_0500
     * @tc.name      testStateSequencePart070005
     * @tc.desc      From inited=false apply p i p i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070005 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070005 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_0600
     * @tc.name      testStateSequencePart070006
     * @tc.desc      From inited=false apply i i p i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070006 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070006 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_0700
     * @tc.name      testStateSequencePart070007
     * @tc.desc      From inited=false apply p p i i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070007 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070007 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_0800
     * @tc.name      testStateSequencePart070008
     * @tc.desc      From inited=false apply i p i i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070008 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070008 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_0900
     * @tc.name      testStateSequencePart070009
     * @tc.desc      From inited=false apply p i i i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070009 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070009 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_1000
     * @tc.name      testStateSequencePart070010
     * @tc.desc      From inited=false apply i i i i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070010 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070010 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_1100
     * @tc.name      testStateSequencePart070011
     * @tc.desc      From inited=false apply p p p p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070011 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070011 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_1200
     * @tc.name      testStateSequencePart070012
     * @tc.desc      From inited=false apply i p p p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070012 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070012 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_1300
     * @tc.name      testStateSequencePart070013
     * @tc.desc      From inited=false apply p i p p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070013 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070013 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_1400
     * @tc.name      testStateSequencePart070014
     * @tc.desc      From inited=false apply i i p p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070014 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070014 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_1500
     * @tc.name      testStateSequencePart070015
     * @tc.desc      From inited=false apply p p i p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070015 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070015 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_1600
     * @tc.name      testStateSequencePart070016
     * @tc.desc      From inited=false apply i p i p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070016 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070016 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_1700
     * @tc.name      testStateSequencePart070017
     * @tc.desc      From inited=false apply p i i p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070017 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070017 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_1800
     * @tc.name      testStateSequencePart070018
     * @tc.desc      From inited=false apply i i i p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070018 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070018 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_1900
     * @tc.name      testStateSequencePart070019
     * @tc.desc      From inited=false apply p p p i i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070019 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070019 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_2000
     * @tc.name      testStateSequencePart070020
     * @tc.desc      From inited=false apply i p p i i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070020 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070020 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_2100
     * @tc.name      testStateSequencePart070021
     * @tc.desc      From inited=false apply p i p i i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070021 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070021 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_2200
     * @tc.name      testStateSequencePart070022
     * @tc.desc      From inited=false apply i i p i i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070022 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070022 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_2300
     * @tc.name      testStateSequencePart070023
     * @tc.desc      From inited=false apply p p i i i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070023 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070023 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_2400
     * @tc.name      testStateSequencePart070024
     * @tc.desc      From inited=false apply i p i i i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070024 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070024 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_2500
     * @tc.name      testStateSequencePart070025
     * @tc.desc      From inited=false apply p i i i i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070025 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070025 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_2600
     * @tc.name      testStateSequencePart070026
     * @tc.desc      From inited=false apply i i i i i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070026 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070026 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_2700
     * @tc.name      testStateSequencePart070027
     * @tc.desc      From inited=false apply p p p p p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070027 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070027 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_2800
     * @tc.name      testStateSequencePart070028
     * @tc.desc      From inited=false apply i p p p p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070028 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070028 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_2900
     * @tc.name      testStateSequencePart070029
     * @tc.desc      From inited=false apply p i p p p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070029 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070029 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_3000
     * @tc.name      testStateSequencePart070030
     * @tc.desc      From inited=false apply i i p p p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070030 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070030 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_3100
     * @tc.name      testStateSequencePart070031
     * @tc.desc      From inited=false apply p p i p p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070031 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070031 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_3200
     * @tc.name      testStateSequencePart070032
     * @tc.desc      From inited=false apply i p i p p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070032 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070032 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_3300
     * @tc.name      testStateSequencePart070033
     * @tc.desc      From inited=false apply p i i p p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070033 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070033 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_3400
     * @tc.name      testStateSequencePart070034
     * @tc.desc      From inited=false apply i i i p p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070034 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070034 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_3500
     * @tc.name      testStateSequencePart070035
     * @tc.desc      From inited=false apply p p p i p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070035 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070035 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_3600
     * @tc.name      testStateSequencePart070036
     * @tc.desc      From inited=false apply i p p i p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070036 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070036 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_3700
     * @tc.name      testStateSequencePart070037
     * @tc.desc      From inited=false apply p i p i p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070037 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070037 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_3800
     * @tc.name      testStateSequencePart070038
     * @tc.desc      From inited=false apply i i p i p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070038 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070038 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_3900
     * @tc.name      testStateSequencePart070039
     * @tc.desc      From inited=false apply p p i i p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070039 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070039 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_4000
     * @tc.name      testStateSequencePart070040
     * @tc.desc      From inited=false apply i p i i p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070040 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070040 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_4100
     * @tc.name      testStateSequencePart070041
     * @tc.desc      From inited=false apply p i i i p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070041 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070041 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_4200
     * @tc.name      testStateSequencePart070042
     * @tc.desc      From inited=false apply i i i i p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070042 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070042 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_4300
     * @tc.name      testStateSequencePart070043
     * @tc.desc      From inited=false apply p p p p i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070043 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070043 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_4400
     * @tc.name      testStateSequencePart070044
     * @tc.desc      From inited=false apply i p p p i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070044 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070044 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_4500
     * @tc.name      testStateSequencePart070045
     * @tc.desc      From inited=false apply p i p p i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070045 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070045 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_4600
     * @tc.name      testStateSequencePart070046
     * @tc.desc      From inited=false apply i i p p i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070046 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070046 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_4700
     * @tc.name      testStateSequencePart070047
     * @tc.desc      From inited=false apply p p i p i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070047 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070047 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_4800
     * @tc.name      testStateSequencePart070048
     * @tc.desc      From inited=false apply i p i p i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070048 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070048 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_4900
     * @tc.name      testStateSequencePart070049
     * @tc.desc      From inited=false apply p i i p i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070049 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070049 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_5000
     * @tc.name      testStateSequencePart070050
     * @tc.desc      From inited=false apply i i i p i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070050 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070050 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_5100
     * @tc.name      testStateSequencePart070051
     * @tc.desc      From inited=false apply p p p i i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070051 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070051 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_5200
     * @tc.name      testStateSequencePart070052
     * @tc.desc      From inited=false apply i p p i i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070052 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070052 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_5300
     * @tc.name      testStateSequencePart070053
     * @tc.desc      From inited=false apply p i p i i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070053 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070053 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_5400
     * @tc.name      testStateSequencePart070054
     * @tc.desc      From inited=false apply i i p i i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070054 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070054 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_5500
     * @tc.name      testStateSequencePart070055
     * @tc.desc      From inited=false apply p p i i i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070055 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070055 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_5600
     * @tc.name      testStateSequencePart070056
     * @tc.desc      From inited=false apply i p i i i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070056 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070056 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_5700
     * @tc.name      testStateSequencePart070057
     * @tc.desc      From inited=false apply p i i i i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070057 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070057 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_5800
     * @tc.name      testStateSequencePart070058
     * @tc.desc      From inited=false apply i i i i i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070058 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070058 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_5900
     * @tc.name      testStateSequencePart070059
     * @tc.desc      From inited=false apply p p p p p i i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070059 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070059 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_6000
     * @tc.name      testStateSequencePart070060
     * @tc.desc      From inited=false apply i p p p p i i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070060 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070060 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_6100
     * @tc.name      testStateSequencePart070061
     * @tc.desc      From inited=false apply p i p p p i i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070061 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070061 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_6200
     * @tc.name      testStateSequencePart070062
     * @tc.desc      From inited=false apply i i p p p i i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070062 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070062 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_6300
     * @tc.name      testStateSequencePart070063
     * @tc.desc      From inited=false apply p p i p p i i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070063 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070063 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_6400
     * @tc.name      testStateSequencePart070064
     * @tc.desc      From inited=false apply i p i p p i i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070064 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070064 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_6500
     * @tc.name      testStateSequencePart070065
     * @tc.desc      From inited=false apply p i i p p i i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070065 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070065 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_6600
     * @tc.name      testStateSequencePart070066
     * @tc.desc      From inited=false apply i i i p p i i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070066 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070066 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART07_6700
     * @tc.name      testStateSequencePart070067
     * @tc.desc      From inited=false apply p p p i p i i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart070067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070067 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart070067 end');
    })

  })
}
