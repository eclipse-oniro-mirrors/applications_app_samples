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

export default function StateSequenceMatrixPart14Test(): void {
  describe('StateSequenceMatrixPart14', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_0100
     * @tc.name      testStateSequencePart140001
     * @tc.desc      From inited=true apply p p p p i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140001 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_0200
     * @tc.name      testStateSequencePart140002
     * @tc.desc      From inited=true apply i p p p i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140002 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_0300
     * @tc.name      testStateSequencePart140003
     * @tc.desc      From inited=true apply p i p p i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140003 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140003 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_0400
     * @tc.name      testStateSequencePart140004
     * @tc.desc      From inited=true apply i i p p i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140004 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140004 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_0500
     * @tc.name      testStateSequencePart140005
     * @tc.desc      From inited=true apply p p i p i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140005 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140005 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_0600
     * @tc.name      testStateSequencePart140006
     * @tc.desc      From inited=true apply i p i p i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140006 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140006 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_0700
     * @tc.name      testStateSequencePart140007
     * @tc.desc      From inited=true apply p i i p i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140007 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140007 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_0800
     * @tc.name      testStateSequencePart140008
     * @tc.desc      From inited=true apply i i i p i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140008 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140008 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_0900
     * @tc.name      testStateSequencePart140009
     * @tc.desc      From inited=true apply p p p i i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140009 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140009 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_1000
     * @tc.name      testStateSequencePart140010
     * @tc.desc      From inited=true apply i p p i i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140010 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140010 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_1100
     * @tc.name      testStateSequencePart140011
     * @tc.desc      From inited=true apply p i p i i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140011 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140011 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_1200
     * @tc.name      testStateSequencePart140012
     * @tc.desc      From inited=true apply i i p i i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140012 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140012 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_1300
     * @tc.name      testStateSequencePart140013
     * @tc.desc      From inited=true apply p p i i i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140013 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140013 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_1400
     * @tc.name      testStateSequencePart140014
     * @tc.desc      From inited=true apply i p i i i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140014 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140014 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_1500
     * @tc.name      testStateSequencePart140015
     * @tc.desc      From inited=true apply p i i i i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140015 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140015 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_1600
     * @tc.name      testStateSequencePart140016
     * @tc.desc      From inited=true apply i i i i i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140016 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140016 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_1700
     * @tc.name      testStateSequencePart140017
     * @tc.desc      From inited=true apply p p p p p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140017 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140017 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_1800
     * @tc.name      testStateSequencePart140018
     * @tc.desc      From inited=true apply i p p p p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140018 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140018 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_1900
     * @tc.name      testStateSequencePart140019
     * @tc.desc      From inited=true apply p i p p p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140019 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140019 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_2000
     * @tc.name      testStateSequencePart140020
     * @tc.desc      From inited=true apply i i p p p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140020 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140020 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_2100
     * @tc.name      testStateSequencePart140021
     * @tc.desc      From inited=true apply p p i p p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140021 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140021 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_2200
     * @tc.name      testStateSequencePart140022
     * @tc.desc      From inited=true apply i p i p p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140022 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140022 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_2300
     * @tc.name      testStateSequencePart140023
     * @tc.desc      From inited=true apply p i i p p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140023 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140023 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_2400
     * @tc.name      testStateSequencePart140024
     * @tc.desc      From inited=true apply i i i p p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140024 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140024 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_2500
     * @tc.name      testStateSequencePart140025
     * @tc.desc      From inited=true apply p p p i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140025 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140025 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_2600
     * @tc.name      testStateSequencePart140026
     * @tc.desc      From inited=true apply i p p i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140026 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140026 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_2700
     * @tc.name      testStateSequencePart140027
     * @tc.desc      From inited=true apply p i p i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140027 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140027 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_2800
     * @tc.name      testStateSequencePart140028
     * @tc.desc      From inited=true apply i i p i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140028 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140028 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_2900
     * @tc.name      testStateSequencePart140029
     * @tc.desc      From inited=true apply p p i i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140029 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140029 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_3000
     * @tc.name      testStateSequencePart140030
     * @tc.desc      From inited=true apply i p i i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140030 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140030 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_3100
     * @tc.name      testStateSequencePart140031
     * @tc.desc      From inited=true apply p i i i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140031 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140031 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_3200
     * @tc.name      testStateSequencePart140032
     * @tc.desc      From inited=true apply i i i i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140032 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140032 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_3300
     * @tc.name      testStateSequencePart140033
     * @tc.desc      From inited=true apply p p p p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140033 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140033 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_3400
     * @tc.name      testStateSequencePart140034
     * @tc.desc      From inited=true apply i p p p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140034 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140034 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_3500
     * @tc.name      testStateSequencePart140035
     * @tc.desc      From inited=true apply p i p p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140035 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140035 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_3600
     * @tc.name      testStateSequencePart140036
     * @tc.desc      From inited=true apply i i p p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140036 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140036 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_3700
     * @tc.name      testStateSequencePart140037
     * @tc.desc      From inited=true apply p p i p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140037 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140037 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_3800
     * @tc.name      testStateSequencePart140038
     * @tc.desc      From inited=true apply i p i p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140038 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140038 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_3900
     * @tc.name      testStateSequencePart140039
     * @tc.desc      From inited=true apply p i i p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140039 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140039 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_4000
     * @tc.name      testStateSequencePart140040
     * @tc.desc      From inited=true apply i i i p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140040 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140040 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_4100
     * @tc.name      testStateSequencePart140041
     * @tc.desc      From inited=true apply p p p i i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140041 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140041 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_4200
     * @tc.name      testStateSequencePart140042
     * @tc.desc      From inited=true apply i p p i i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140042 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140042 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_4300
     * @tc.name      testStateSequencePart140043
     * @tc.desc      From inited=true apply p i p i i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140043 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140043 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_4400
     * @tc.name      testStateSequencePart140044
     * @tc.desc      From inited=true apply i i p i i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140044 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140044 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_4500
     * @tc.name      testStateSequencePart140045
     * @tc.desc      From inited=true apply p p i i i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140045 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140045 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_4600
     * @tc.name      testStateSequencePart140046
     * @tc.desc      From inited=true apply i p i i i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140046 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140046 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_4700
     * @tc.name      testStateSequencePart140047
     * @tc.desc      From inited=true apply p i i i i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140047 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140047 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_4800
     * @tc.name      testStateSequencePart140048
     * @tc.desc      From inited=true apply i i i i i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140048 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140048 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_4900
     * @tc.name      testStateSequencePart140049
     * @tc.desc      From inited=true apply p p p p p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140049 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140049 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_5000
     * @tc.name      testStateSequencePart140050
     * @tc.desc      From inited=true apply i p p p p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140050 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140050 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_5100
     * @tc.name      testStateSequencePart140051
     * @tc.desc      From inited=true apply p i p p p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140051 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140051 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_5200
     * @tc.name      testStateSequencePart140052
     * @tc.desc      From inited=true apply i i p p p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140052 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140052 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_5300
     * @tc.name      testStateSequencePart140053
     * @tc.desc      From inited=true apply p p i p p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140053 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140053 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_5400
     * @tc.name      testStateSequencePart140054
     * @tc.desc      From inited=true apply i p i p p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140054 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140054 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_5500
     * @tc.name      testStateSequencePart140055
     * @tc.desc      From inited=true apply p i i p p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140055 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140055 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_5600
     * @tc.name      testStateSequencePart140056
     * @tc.desc      From inited=true apply i i i p p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140056 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140056 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_5700
     * @tc.name      testStateSequencePart140057
     * @tc.desc      From inited=true apply p p p i p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140057 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140057 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_5800
     * @tc.name      testStateSequencePart140058
     * @tc.desc      From inited=true apply i p p i p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140058 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140058 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_5900
     * @tc.name      testStateSequencePart140059
     * @tc.desc      From inited=true apply p i p i p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140059 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140059 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_6000
     * @tc.name      testStateSequencePart140060
     * @tc.desc      From inited=true apply i i p i p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140060 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140060 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_6100
     * @tc.name      testStateSequencePart140061
     * @tc.desc      From inited=true apply p p i i p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140061 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140061 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_6200
     * @tc.name      testStateSequencePart140062
     * @tc.desc      From inited=true apply i p i i p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140062 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140062 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_6300
     * @tc.name      testStateSequencePart140063
     * @tc.desc      From inited=true apply p i i i p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140063 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140063 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_6400
     * @tc.name      testStateSequencePart140064
     * @tc.desc      From inited=true apply i i i i p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140064 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140064 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_6500
     * @tc.name      testStateSequencePart140065
     * @tc.desc      From inited=true apply p p p p i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140065 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140065 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_6600
     * @tc.name      testStateSequencePart140066
     * @tc.desc      From inited=true apply i p p p i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140066 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140066 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART14_6700
     * @tc.name      testStateSequencePart140067
     * @tc.desc      From inited=true apply p i p p i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart140067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140067 begin');
      serviceManager.inited = true;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart140067 end');
    })

  })
}
