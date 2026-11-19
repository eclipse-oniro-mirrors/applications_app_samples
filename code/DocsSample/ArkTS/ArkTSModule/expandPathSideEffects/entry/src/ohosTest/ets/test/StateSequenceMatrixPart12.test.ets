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

export default function StateSequenceMatrixPart12Test(): void {
  describe('StateSequenceMatrixPart12', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_0100
     * @tc.name      testStateSequencePart120001
     * @tc.desc      From inited=true apply p i p i p p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120001 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_0200
     * @tc.name      testStateSequencePart120002
     * @tc.desc      From inited=true apply i i p i p p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120002 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_0300
     * @tc.name      testStateSequencePart120003
     * @tc.desc      From inited=true apply p p i i p p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120003 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120003 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_0400
     * @tc.name      testStateSequencePart120004
     * @tc.desc      From inited=true apply i p i i p p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120004 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120004 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_0500
     * @tc.name      testStateSequencePart120005
     * @tc.desc      From inited=true apply p i i i p p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120005 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120005 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_0600
     * @tc.name      testStateSequencePart120006
     * @tc.desc      From inited=true apply i i i i p p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120006 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120006 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_0700
     * @tc.name      testStateSequencePart120007
     * @tc.desc      From inited=true apply p p p p i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120007 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120007 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_0800
     * @tc.name      testStateSequencePart120008
     * @tc.desc      From inited=true apply i p p p i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120008 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120008 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_0900
     * @tc.name      testStateSequencePart120009
     * @tc.desc      From inited=true apply p i p p i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120009 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120009 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_1000
     * @tc.name      testStateSequencePart120010
     * @tc.desc      From inited=true apply i i p p i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120010 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120010 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_1100
     * @tc.name      testStateSequencePart120011
     * @tc.desc      From inited=true apply p p i p i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120011 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120011 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_1200
     * @tc.name      testStateSequencePart120012
     * @tc.desc      From inited=true apply i p i p i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120012 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120012 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_1300
     * @tc.name      testStateSequencePart120013
     * @tc.desc      From inited=true apply p i i p i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120013 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120013 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_1400
     * @tc.name      testStateSequencePart120014
     * @tc.desc      From inited=true apply i i i p i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120014 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120014 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_1500
     * @tc.name      testStateSequencePart120015
     * @tc.desc      From inited=true apply p p p i i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120015 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120015 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_1600
     * @tc.name      testStateSequencePart120016
     * @tc.desc      From inited=true apply i p p i i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120016 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120016 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_1700
     * @tc.name      testStateSequencePart120017
     * @tc.desc      From inited=true apply p i p i i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120017 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120017 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_1800
     * @tc.name      testStateSequencePart120018
     * @tc.desc      From inited=true apply i i p i i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120018 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120018 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_1900
     * @tc.name      testStateSequencePart120019
     * @tc.desc      From inited=true apply p p i i i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120019 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120019 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_2000
     * @tc.name      testStateSequencePart120020
     * @tc.desc      From inited=true apply i p i i i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120020 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120020 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_2100
     * @tc.name      testStateSequencePart120021
     * @tc.desc      From inited=true apply p i i i i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120021 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120021 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_2200
     * @tc.name      testStateSequencePart120022
     * @tc.desc      From inited=true apply i i i i i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120022 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120022 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_2300
     * @tc.name      testStateSequencePart120023
     * @tc.desc      From inited=true apply p p p p p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120023 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120023 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_2400
     * @tc.name      testStateSequencePart120024
     * @tc.desc      From inited=true apply i p p p p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120024 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120024 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_2500
     * @tc.name      testStateSequencePart120025
     * @tc.desc      From inited=true apply p i p p p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120025 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120025 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_2600
     * @tc.name      testStateSequencePart120026
     * @tc.desc      From inited=true apply i i p p p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120026 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120026 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_2700
     * @tc.name      testStateSequencePart120027
     * @tc.desc      From inited=true apply p p i p p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120027 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120027 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_2800
     * @tc.name      testStateSequencePart120028
     * @tc.desc      From inited=true apply i p i p p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120028 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120028 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_2900
     * @tc.name      testStateSequencePart120029
     * @tc.desc      From inited=true apply p i i p p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120029 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120029 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_3000
     * @tc.name      testStateSequencePart120030
     * @tc.desc      From inited=true apply i i i p p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120030 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120030 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_3100
     * @tc.name      testStateSequencePart120031
     * @tc.desc      From inited=true apply p p p i p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120031 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120031 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_3200
     * @tc.name      testStateSequencePart120032
     * @tc.desc      From inited=true apply i p p i p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120032 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120032 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_3300
     * @tc.name      testStateSequencePart120033
     * @tc.desc      From inited=true apply p i p i p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120033 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120033 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_3400
     * @tc.name      testStateSequencePart120034
     * @tc.desc      From inited=true apply i i p i p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120034 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120034 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_3500
     * @tc.name      testStateSequencePart120035
     * @tc.desc      From inited=true apply p p i i p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120035 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120035 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_3600
     * @tc.name      testStateSequencePart120036
     * @tc.desc      From inited=true apply i p i i p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120036 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120036 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_3700
     * @tc.name      testStateSequencePart120037
     * @tc.desc      From inited=true apply p i i i p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120037 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120037 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_3800
     * @tc.name      testStateSequencePart120038
     * @tc.desc      From inited=true apply i i i i p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120038 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120038 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_3900
     * @tc.name      testStateSequencePart120039
     * @tc.desc      From inited=true apply p p p p i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120039 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120039 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_4000
     * @tc.name      testStateSequencePart120040
     * @tc.desc      From inited=true apply i p p p i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120040 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120040 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_4100
     * @tc.name      testStateSequencePart120041
     * @tc.desc      From inited=true apply p i p p i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120041 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120041 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_4200
     * @tc.name      testStateSequencePart120042
     * @tc.desc      From inited=true apply i i p p i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120042 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120042 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_4300
     * @tc.name      testStateSequencePart120043
     * @tc.desc      From inited=true apply p p i p i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120043 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120043 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_4400
     * @tc.name      testStateSequencePart120044
     * @tc.desc      From inited=true apply i p i p i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120044 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120044 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_4500
     * @tc.name      testStateSequencePart120045
     * @tc.desc      From inited=true apply p i i p i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120045 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120045 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_4600
     * @tc.name      testStateSequencePart120046
     * @tc.desc      From inited=true apply i i i p i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120046 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120046 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_4700
     * @tc.name      testStateSequencePart120047
     * @tc.desc      From inited=true apply p p p i i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120047 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120047 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_4800
     * @tc.name      testStateSequencePart120048
     * @tc.desc      From inited=true apply i p p i i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120048 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120048 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_4900
     * @tc.name      testStateSequencePart120049
     * @tc.desc      From inited=true apply p i p i i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120049 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120049 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_5000
     * @tc.name      testStateSequencePart120050
     * @tc.desc      From inited=true apply i i p i i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120050 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120050 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_5100
     * @tc.name      testStateSequencePart120051
     * @tc.desc      From inited=true apply p p i i i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120051 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120051 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_5200
     * @tc.name      testStateSequencePart120052
     * @tc.desc      From inited=true apply i p i i i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120052 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120052 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_5300
     * @tc.name      testStateSequencePart120053
     * @tc.desc      From inited=true apply p i i i i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120053 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120053 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_5400
     * @tc.name      testStateSequencePart120054
     * @tc.desc      From inited=true apply i i i i i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120054 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120054 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_5500
     * @tc.name      testStateSequencePart120055
     * @tc.desc      From inited=true apply p p p p p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120055 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120055 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_5600
     * @tc.name      testStateSequencePart120056
     * @tc.desc      From inited=true apply i p p p p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120056 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120056 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_5700
     * @tc.name      testStateSequencePart120057
     * @tc.desc      From inited=true apply p i p p p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120057 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120057 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_5800
     * @tc.name      testStateSequencePart120058
     * @tc.desc      From inited=true apply i i p p p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120058 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120058 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_5900
     * @tc.name      testStateSequencePart120059
     * @tc.desc      From inited=true apply p p i p p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120059 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120059 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_6000
     * @tc.name      testStateSequencePart120060
     * @tc.desc      From inited=true apply i p i p p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120060 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120060 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_6100
     * @tc.name      testStateSequencePart120061
     * @tc.desc      From inited=true apply p i i p p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120061 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120061 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_6200
     * @tc.name      testStateSequencePart120062
     * @tc.desc      From inited=true apply i i i p p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120062 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120062 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_6300
     * @tc.name      testStateSequencePart120063
     * @tc.desc      From inited=true apply p p p i p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120063 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120063 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_6400
     * @tc.name      testStateSequencePart120064
     * @tc.desc      From inited=true apply i p p i p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120064 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120064 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_6500
     * @tc.name      testStateSequencePart120065
     * @tc.desc      From inited=true apply p i p i p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120065 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120065 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_6600
     * @tc.name      testStateSequencePart120066
     * @tc.desc      From inited=true apply i i p i p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120066 begin');
      serviceManager.inited = true;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120066 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART12_6700
     * @tc.name      testStateSequencePart120067
     * @tc.desc      From inited=true apply p p i i p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart120067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120067 begin');
      serviceManager.inited = true;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart120067 end');
    })

  })
}
