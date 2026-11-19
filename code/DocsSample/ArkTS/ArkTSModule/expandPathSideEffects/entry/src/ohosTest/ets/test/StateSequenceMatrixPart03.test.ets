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

export default function StateSequenceMatrixPart03Test(): void {
  describe('StateSequenceMatrixPart03', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_0100
     * @tc.name      testStateSequencePart030001
     * @tc.desc      From inited=false apply p i i p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030001 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_0200
     * @tc.name      testStateSequencePart030002
     * @tc.desc      From inited=false apply i i i p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030002 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_0300
     * @tc.name      testStateSequencePart030003
     * @tc.desc      From inited=false apply p p p i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030003 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030003 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_0400
     * @tc.name      testStateSequencePart030004
     * @tc.desc      From inited=false apply i p p i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030004 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030004 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_0500
     * @tc.name      testStateSequencePart030005
     * @tc.desc      From inited=false apply p i p i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030005 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030005 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_0600
     * @tc.name      testStateSequencePart030006
     * @tc.desc      From inited=false apply i i p i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030006 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030006 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_0700
     * @tc.name      testStateSequencePart030007
     * @tc.desc      From inited=false apply p p i i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030007 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030007 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_0800
     * @tc.name      testStateSequencePart030008
     * @tc.desc      From inited=false apply i p i i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030008 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030008 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_0900
     * @tc.name      testStateSequencePart030009
     * @tc.desc      From inited=false apply p i i i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030009 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030009 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_1000
     * @tc.name      testStateSequencePart030010
     * @tc.desc      From inited=false apply i i i i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030010 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030010 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_1100
     * @tc.name      testStateSequencePart030011
     * @tc.desc      From inited=false apply p p p p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030011 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030011 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_1200
     * @tc.name      testStateSequencePart030012
     * @tc.desc      From inited=false apply i p p p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030012 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030012 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_1300
     * @tc.name      testStateSequencePart030013
     * @tc.desc      From inited=false apply p i p p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030013 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030013 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_1400
     * @tc.name      testStateSequencePart030014
     * @tc.desc      From inited=false apply i i p p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030014 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030014 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_1500
     * @tc.name      testStateSequencePart030015
     * @tc.desc      From inited=false apply p p i p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030015 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030015 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_1600
     * @tc.name      testStateSequencePart030016
     * @tc.desc      From inited=false apply i p i p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030016 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030016 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_1700
     * @tc.name      testStateSequencePart030017
     * @tc.desc      From inited=false apply p i i p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030017 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030017 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_1800
     * @tc.name      testStateSequencePart030018
     * @tc.desc      From inited=false apply i i i p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030018 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030018 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_1900
     * @tc.name      testStateSequencePart030019
     * @tc.desc      From inited=false apply p p p i p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030019 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030019 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_2000
     * @tc.name      testStateSequencePart030020
     * @tc.desc      From inited=false apply i p p i p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030020 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030020 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_2100
     * @tc.name      testStateSequencePart030021
     * @tc.desc      From inited=false apply p i p i p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030021 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030021 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_2200
     * @tc.name      testStateSequencePart030022
     * @tc.desc      From inited=false apply i i p i p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030022 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030022 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_2300
     * @tc.name      testStateSequencePart030023
     * @tc.desc      From inited=false apply p p i i p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030023 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030023 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_2400
     * @tc.name      testStateSequencePart030024
     * @tc.desc      From inited=false apply i p i i p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030024 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030024 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_2500
     * @tc.name      testStateSequencePart030025
     * @tc.desc      From inited=false apply p i i i p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030025 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030025 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_2600
     * @tc.name      testStateSequencePart030026
     * @tc.desc      From inited=false apply i i i i p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030026 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030026 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_2700
     * @tc.name      testStateSequencePart030027
     * @tc.desc      From inited=false apply p p p p i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030027 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030027 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_2800
     * @tc.name      testStateSequencePart030028
     * @tc.desc      From inited=false apply i p p p i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030028 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030028 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_2900
     * @tc.name      testStateSequencePart030029
     * @tc.desc      From inited=false apply p i p p i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030029 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030029 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_3000
     * @tc.name      testStateSequencePart030030
     * @tc.desc      From inited=false apply i i p p i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030030 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030030 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_3100
     * @tc.name      testStateSequencePart030031
     * @tc.desc      From inited=false apply p p i p i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030031 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030031 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_3200
     * @tc.name      testStateSequencePart030032
     * @tc.desc      From inited=false apply i p i p i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030032 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030032 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_3300
     * @tc.name      testStateSequencePart030033
     * @tc.desc      From inited=false apply p i i p i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030033 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030033 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_3400
     * @tc.name      testStateSequencePart030034
     * @tc.desc      From inited=false apply i i i p i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030034 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030034 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_3500
     * @tc.name      testStateSequencePart030035
     * @tc.desc      From inited=false apply p p p i i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030035 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030035 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_3600
     * @tc.name      testStateSequencePart030036
     * @tc.desc      From inited=false apply i p p i i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030036 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030036 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_3700
     * @tc.name      testStateSequencePart030037
     * @tc.desc      From inited=false apply p i p i i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030037 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030037 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_3800
     * @tc.name      testStateSequencePart030038
     * @tc.desc      From inited=false apply i i p i i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030038 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030038 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_3900
     * @tc.name      testStateSequencePart030039
     * @tc.desc      From inited=false apply p p i i i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030039 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030039 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_4000
     * @tc.name      testStateSequencePart030040
     * @tc.desc      From inited=false apply i p i i i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030040 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030040 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_4100
     * @tc.name      testStateSequencePart030041
     * @tc.desc      From inited=false apply p i i i i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030041 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030041 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_4200
     * @tc.name      testStateSequencePart030042
     * @tc.desc      From inited=false apply i i i i i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030042 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030042 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_4300
     * @tc.name      testStateSequencePart030043
     * @tc.desc      From inited=false apply p p p p p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030043 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030043 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_4400
     * @tc.name      testStateSequencePart030044
     * @tc.desc      From inited=false apply i p p p p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030044 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030044 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_4500
     * @tc.name      testStateSequencePart030045
     * @tc.desc      From inited=false apply p i p p p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030045 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030045 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_4600
     * @tc.name      testStateSequencePart030046
     * @tc.desc      From inited=false apply i i p p p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030046 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030046 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_4700
     * @tc.name      testStateSequencePart030047
     * @tc.desc      From inited=false apply p p i p p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030047 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030047 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_4800
     * @tc.name      testStateSequencePart030048
     * @tc.desc      From inited=false apply i p i p p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030048 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030048 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_4900
     * @tc.name      testStateSequencePart030049
     * @tc.desc      From inited=false apply p i i p p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030049 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030049 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_5000
     * @tc.name      testStateSequencePart030050
     * @tc.desc      From inited=false apply i i i p p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030050 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030050 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_5100
     * @tc.name      testStateSequencePart030051
     * @tc.desc      From inited=false apply p p p i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030051 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030051 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_5200
     * @tc.name      testStateSequencePart030052
     * @tc.desc      From inited=false apply i p p i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030052 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030052 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_5300
     * @tc.name      testStateSequencePart030053
     * @tc.desc      From inited=false apply p i p i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030053 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030053 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_5400
     * @tc.name      testStateSequencePart030054
     * @tc.desc      From inited=false apply i i p i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030054 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030054 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_5500
     * @tc.name      testStateSequencePart030055
     * @tc.desc      From inited=false apply p p i i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030055 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030055 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_5600
     * @tc.name      testStateSequencePart030056
     * @tc.desc      From inited=false apply i p i i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030056 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030056 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_5700
     * @tc.name      testStateSequencePart030057
     * @tc.desc      From inited=false apply p i i i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030057 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030057 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_5800
     * @tc.name      testStateSequencePart030058
     * @tc.desc      From inited=false apply i i i i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030058 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030058 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_5900
     * @tc.name      testStateSequencePart030059
     * @tc.desc      From inited=false apply p p p p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030059 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030059 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_6000
     * @tc.name      testStateSequencePart030060
     * @tc.desc      From inited=false apply i p p p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030060 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030060 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_6100
     * @tc.name      testStateSequencePart030061
     * @tc.desc      From inited=false apply p i p p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030061 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030061 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_6200
     * @tc.name      testStateSequencePart030062
     * @tc.desc      From inited=false apply i i p p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030062 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030062 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_6300
     * @tc.name      testStateSequencePart030063
     * @tc.desc      From inited=false apply p p i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030063 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030063 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_6400
     * @tc.name      testStateSequencePart030064
     * @tc.desc      From inited=false apply i p i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030064 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030064 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_6500
     * @tc.name      testStateSequencePart030065
     * @tc.desc      From inited=false apply p i i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030065 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030065 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_6600
     * @tc.name      testStateSequencePart030066
     * @tc.desc      From inited=false apply i i i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030066 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030066 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_6700
     * @tc.name      testStateSequencePart030067
     * @tc.desc      From inited=false apply p p p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030067 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030067 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_6800
     * @tc.name      testStateSequencePart030068
     * @tc.desc      From inited=false apply i p p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030068 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030068 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_6900
     * @tc.name      testStateSequencePart030069
     * @tc.desc      From inited=false apply p i p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030069 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030069 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART03_7000
     * @tc.name      testStateSequencePart030070
     * @tc.desc      From inited=false apply i i p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart030070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030070 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart030070 end');
    })

  })
}
