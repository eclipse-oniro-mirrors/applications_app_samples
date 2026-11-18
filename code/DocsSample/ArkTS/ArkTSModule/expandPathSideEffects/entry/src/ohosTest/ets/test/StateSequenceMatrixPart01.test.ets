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

export default function StateSequenceMatrixPart01Test(): void {
  describe('StateSequenceMatrixPart01', () => {

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_0100
     * @tc.name      testStateSequencePart010001
     * @tc.desc      From inited=false apply p, expect inited=false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010001 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(false);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010001 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_0200
     * @tc.name      testStateSequencePart010002
     * @tc.desc      From inited=false apply i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010002 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010002 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_0300
     * @tc.name      testStateSequencePart010003
     * @tc.desc      From inited=false apply p p, expect inited=false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010003 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(false);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010003 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_0400
     * @tc.name      testStateSequencePart010004
     * @tc.desc      From inited=false apply i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010004 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010004 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_0500
     * @tc.name      testStateSequencePart010005
     * @tc.desc      From inited=false apply p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010005 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010005 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_0600
     * @tc.name      testStateSequencePart010006
     * @tc.desc      From inited=false apply i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010006 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010006 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_0700
     * @tc.name      testStateSequencePart010007
     * @tc.desc      From inited=false apply p p p, expect inited=false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010007 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(false);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010007 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_0800
     * @tc.name      testStateSequencePart010008
     * @tc.desc      From inited=false apply i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010008 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010008 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_0900
     * @tc.name      testStateSequencePart010009
     * @tc.desc      From inited=false apply p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010009 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010009 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_1000
     * @tc.name      testStateSequencePart010010
     * @tc.desc      From inited=false apply i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010010 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010010 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_1100
     * @tc.name      testStateSequencePart010011
     * @tc.desc      From inited=false apply p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010011 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010011 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_1200
     * @tc.name      testStateSequencePart010012
     * @tc.desc      From inited=false apply i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010012 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010012 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_1300
     * @tc.name      testStateSequencePart010013
     * @tc.desc      From inited=false apply p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010013 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010013 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_1400
     * @tc.name      testStateSequencePart010014
     * @tc.desc      From inited=false apply i i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010014 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010014 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_1500
     * @tc.name      testStateSequencePart010015
     * @tc.desc      From inited=false apply p p p p, expect inited=false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010015 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(false);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010015 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_1600
     * @tc.name      testStateSequencePart010016
     * @tc.desc      From inited=false apply i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010016 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010016 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_1700
     * @tc.name      testStateSequencePart010017
     * @tc.desc      From inited=false apply p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010017 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010017 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_1800
     * @tc.name      testStateSequencePart010018
     * @tc.desc      From inited=false apply i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010018 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010018 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_1900
     * @tc.name      testStateSequencePart010019
     * @tc.desc      From inited=false apply p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010019 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010019 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_2000
     * @tc.name      testStateSequencePart010020
     * @tc.desc      From inited=false apply i p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010020 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010020 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_2100
     * @tc.name      testStateSequencePart010021
     * @tc.desc      From inited=false apply p i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010021 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010021 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_2200
     * @tc.name      testStateSequencePart010022
     * @tc.desc      From inited=false apply i i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010022 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010022 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_2300
     * @tc.name      testStateSequencePart010023
     * @tc.desc      From inited=false apply p p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010023 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010023 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_2400
     * @tc.name      testStateSequencePart010024
     * @tc.desc      From inited=false apply i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010024 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010024 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_2500
     * @tc.name      testStateSequencePart010025
     * @tc.desc      From inited=false apply p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010025 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010025 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_2600
     * @tc.name      testStateSequencePart010026
     * @tc.desc      From inited=false apply i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010026 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010026 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_2700
     * @tc.name      testStateSequencePart010027
     * @tc.desc      From inited=false apply p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010027 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010027 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_2800
     * @tc.name      testStateSequencePart010028
     * @tc.desc      From inited=false apply i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010028 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010028 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_2900
     * @tc.name      testStateSequencePart010029
     * @tc.desc      From inited=false apply p i i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010029 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010029 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_3000
     * @tc.name      testStateSequencePart010030
     * @tc.desc      From inited=false apply i i i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010030 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010030 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_3100
     * @tc.name      testStateSequencePart010031
     * @tc.desc      From inited=false apply p p p p p, expect inited=false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010031 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(false);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010031 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_3200
     * @tc.name      testStateSequencePart010032
     * @tc.desc      From inited=false apply i p p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010032 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010032 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_3300
     * @tc.name      testStateSequencePart010033
     * @tc.desc      From inited=false apply p i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010033 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010033 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_3400
     * @tc.name      testStateSequencePart010034
     * @tc.desc      From inited=false apply i i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010034 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010034 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_3500
     * @tc.name      testStateSequencePart010035
     * @tc.desc      From inited=false apply p p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010035 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010035 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_3600
     * @tc.name      testStateSequencePart010036
     * @tc.desc      From inited=false apply i p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010036 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010036 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_3700
     * @tc.name      testStateSequencePart010037
     * @tc.desc      From inited=false apply p i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010037 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010037 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_3800
     * @tc.name      testStateSequencePart010038
     * @tc.desc      From inited=false apply i i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010038 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010038 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_3900
     * @tc.name      testStateSequencePart010039
     * @tc.desc      From inited=false apply p p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010039 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010039 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_4000
     * @tc.name      testStateSequencePart010040
     * @tc.desc      From inited=false apply i p p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010040 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010040 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_4100
     * @tc.name      testStateSequencePart010041
     * @tc.desc      From inited=false apply p i p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010041 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010041 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_4200
     * @tc.name      testStateSequencePart010042
     * @tc.desc      From inited=false apply i i p i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010042 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010042 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_4300
     * @tc.name      testStateSequencePart010043
     * @tc.desc      From inited=false apply p p i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010043 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010043 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_4400
     * @tc.name      testStateSequencePart010044
     * @tc.desc      From inited=false apply i p i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010044 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010044 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_4500
     * @tc.name      testStateSequencePart010045
     * @tc.desc      From inited=false apply p i i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010045 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010045 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_4600
     * @tc.name      testStateSequencePart010046
     * @tc.desc      From inited=false apply i i i i p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010046 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010046 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_4700
     * @tc.name      testStateSequencePart010047
     * @tc.desc      From inited=false apply p p p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010047 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010047 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_4800
     * @tc.name      testStateSequencePart010048
     * @tc.desc      From inited=false apply i p p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010048 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010048 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_4900
     * @tc.name      testStateSequencePart010049
     * @tc.desc      From inited=false apply p i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010049 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010049 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_5000
     * @tc.name      testStateSequencePart010050
     * @tc.desc      From inited=false apply i i p p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010050 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010050 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_5100
     * @tc.name      testStateSequencePart010051
     * @tc.desc      From inited=false apply p p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010051 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010051 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_5200
     * @tc.name      testStateSequencePart010052
     * @tc.desc      From inited=false apply i p i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010052 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010052 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_5300
     * @tc.name      testStateSequencePart010053
     * @tc.desc      From inited=false apply p i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010053 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010053 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_5400
     * @tc.name      testStateSequencePart010054
     * @tc.desc      From inited=false apply i i i p i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010054 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010054 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_5500
     * @tc.name      testStateSequencePart010055
     * @tc.desc      From inited=false apply p p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010055 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010055 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_5600
     * @tc.name      testStateSequencePart010056
     * @tc.desc      From inited=false apply i p p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010056 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010056 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_5700
     * @tc.name      testStateSequencePart010057
     * @tc.desc      From inited=false apply p i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010057 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010057 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_5800
     * @tc.name      testStateSequencePart010058
     * @tc.desc      From inited=false apply i i p i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010058 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010058 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_5900
     * @tc.name      testStateSequencePart010059
     * @tc.desc      From inited=false apply p p i i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010059 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010059 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_6000
     * @tc.name      testStateSequencePart010060
     * @tc.desc      From inited=false apply i p i i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010060 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010060 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_6100
     * @tc.name      testStateSequencePart010061
     * @tc.desc      From inited=false apply p i i i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010061 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010061 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_6200
     * @tc.name      testStateSequencePart010062
     * @tc.desc      From inited=false apply i i i i i, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010062 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        serviceManager.init();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010062 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_6300
     * @tc.name      testStateSequencePart010063
     * @tc.desc      From inited=false apply p p p p p p, expect inited=false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010063 begin');
      serviceManager.inited = false;
      try {
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(false);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010063 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_6400
     * @tc.name      testStateSequencePart010064
     * @tc.desc      From inited=false apply i p p p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010064 begin');
      serviceManager.inited = false;
      try {
        serviceManager.init();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        serviceManager.print();
        expect(serviceManager.inited).assertEqual(true);
      } finally {
        serviceManager.inited = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010064 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_6500
     * @tc.name      testStateSequencePart010065
     * @tc.desc      From inited=false apply p i p p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010065 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010065 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_6600
     * @tc.name      testStateSequencePart010066
     * @tc.desc      From inited=false apply i i p p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010066 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010066 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_6700
     * @tc.name      testStateSequencePart010067
     * @tc.desc      From inited=false apply p p i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010067 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010067 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_6800
     * @tc.name      testStateSequencePart010068
     * @tc.desc      From inited=false apply i p i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010068 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010068 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_6900
     * @tc.name      testStateSequencePart010069
     * @tc.desc      From inited=false apply p i i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010069 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010069 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_7000
     * @tc.name      testStateSequencePart010070
     * @tc.desc      From inited=false apply i i i p p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010070 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010070 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_7100
     * @tc.name      testStateSequencePart010071
     * @tc.desc      From inited=false apply p p p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010071 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010071 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_7200
     * @tc.name      testStateSequencePart010072
     * @tc.desc      From inited=false apply i p p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010072 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010072 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_7300
     * @tc.name      testStateSequencePart010073
     * @tc.desc      From inited=false apply p i p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010073 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010073 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_7400
     * @tc.name      testStateSequencePart010074
     * @tc.desc      From inited=false apply i i p i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010074 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010074 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_7500
     * @tc.name      testStateSequencePart010075
     * @tc.desc      From inited=false apply p p i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010075 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010075 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_7600
     * @tc.name      testStateSequencePart010076
     * @tc.desc      From inited=false apply i p i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010076 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010076 end');
    })

    /**
     * @tc.number    SUB_EXPAND_PATH_SEQ_PART01_7700
     * @tc.name      testStateSequencePart010077
     * @tc.desc      From inited=false apply p i i i p p, expect inited=true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStateSequencePart010077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010077 begin');
      serviceManager.inited = false;
      try {
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStateSequencePart010077 end');
    })

  })
}
