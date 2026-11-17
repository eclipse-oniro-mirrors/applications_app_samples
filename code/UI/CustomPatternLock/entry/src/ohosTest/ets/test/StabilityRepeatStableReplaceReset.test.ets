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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  CustomCircleStyleOptions,
  CustomPatternLockChallengeResult,
  CustomPatternLockController
} from '../../../main/ets/pages/CustomPatternLock';

import { paceTurn } from './shared/TestPace';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PatternLock_StabilityRepeat]';

export default function StabilityRepeatStableReplaceResetTest() {
  describe('StabilityRepeatStableReplaceReset', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testStableReplaceReset0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0001 begin');
      const index: number = 0;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0001 end');
    });

    it('testStableReplaceReset0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0002 begin');
      const index: number = 1;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0002 end');
    });

    it('testStableReplaceReset0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0003 begin');
      const index: number = 2;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0003 end');
    });

    it('testStableReplaceReset0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0004 begin');
      const index: number = 3;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0004 end');
    });

    it('testStableReplaceReset0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0005 begin');
      const index: number = 4;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0005 end');
    });

    it('testStableReplaceReset0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0006 begin');
      const index: number = 5;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0006 end');
    });

    it('testStableReplaceReset0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0007 begin');
      const index: number = 6;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0007 end');
    });

    it('testStableReplaceReset0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0008 begin');
      const index: number = 7;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0008 end');
    });

    it('testStableReplaceReset0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0009 begin');
      const index: number = 8;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0009 end');
    });

    it('testStableReplaceReset0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0010 begin');
      const index: number = 9;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0010 end');
    });

    it('testStableReplaceReset0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0011 begin');
      const index: number = 10;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0011 end');
    });

    it('testStableReplaceReset0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0012 begin');
      const index: number = 11;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0012 end');
    });

    it('testStableReplaceReset0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0013 begin');
      const index: number = 12;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0013 end');
    });

    it('testStableReplaceReset0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0014 begin');
      const index: number = 13;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0014 end');
    });

    it('testStableReplaceReset0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0015 begin');
      const index: number = 14;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0015 end');
    });

    it('testStableReplaceReset0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0016 begin');
      const index: number = 15;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0016 end');
    });

    it('testStableReplaceReset0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0017 begin');
      const index: number = 16;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0017 end');
    });

    it('testStableReplaceReset0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0018 begin');
      const index: number = 17;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0018 end');
    });

    it('testStableReplaceReset0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0019 begin');
      const index: number = 18;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0019 end');
    });

    it('testStableReplaceReset0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0020 begin');
      const index: number = 19;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0020 end');
    });

    it('testStableReplaceReset0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0021 begin');
      const index: number = 20;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0021 end');
    });

    it('testStableReplaceReset0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0022 begin');
      const index: number = 21;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0022 end');
    });

    it('testStableReplaceReset0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0023 begin');
      const index: number = 22;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0023 end');
    });

    it('testStableReplaceReset0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0024 begin');
      const index: number = 23;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0024 end');
    });

    it('testStableReplaceReset0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0025 begin');
      const index: number = 24;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0025 end');
    });

    it('testStableReplaceReset0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0026 begin');
      const index: number = 25;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0026 end');
    });

    it('testStableReplaceReset0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0027 begin');
      const index: number = 26;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0027 end');
    });

    it('testStableReplaceReset0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0028 begin');
      const index: number = 27;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0028 end');
    });

    it('testStableReplaceReset0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0029 begin');
      const index: number = 28;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0029 end');
    });

    it('testStableReplaceReset0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0030 begin');
      const index: number = 29;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0030 end');
    });

    it('testStableReplaceReset0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0031 begin');
      const index: number = 30;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0031 end');
    });

    it('testStableReplaceReset0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0032 begin');
      const index: number = 31;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0032 end');
    });

    it('testStableReplaceReset0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0033 begin');
      const index: number = 32;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0033 end');
    });

    it('testStableReplaceReset0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0034 begin');
      const index: number = 33;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0034 end');
    });

    it('testStableReplaceReset0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0035 begin');
      const index: number = 34;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0035 end');
    });

    it('testStableReplaceReset0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0036 begin');
      const index: number = 35;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0036 end');
    });

    it('testStableReplaceReset0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0037 begin');
      const index: number = 36;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0037 end');
    });

    it('testStableReplaceReset0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0038 begin');
      const index: number = 37;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0038 end');
    });

    it('testStableReplaceReset0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0039 begin');
      const index: number = 38;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0039 end');
    });

    it('testStableReplaceReset0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0040 begin');
      const index: number = 39;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0040 end');
    });

    it('testStableReplaceReset0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0041 begin');
      const index: number = 40;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0041 end');
    });

    it('testStableReplaceReset0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0042 begin');
      const index: number = 41;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0042 end');
    });

    it('testStableReplaceReset0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0043 begin');
      const index: number = 42;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0043 end');
    });

    it('testStableReplaceReset0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0044 begin');
      const index: number = 43;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0044 end');
    });

    it('testStableReplaceReset0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0045 begin');
      const index: number = 44;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0045 end');
    });

    it('testStableReplaceReset0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0046 begin');
      const index: number = 45;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0046 end');
    });

    it('testStableReplaceReset0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0047 begin');
      const index: number = 46;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0047 end');
    });

    it('testStableReplaceReset0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0048 begin');
      const index: number = 47;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0048 end');
    });

    it('testStableReplaceReset0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0049 begin');
      const index: number = 48;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0049 end');
    });

    it('testStableReplaceReset0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0050 begin');
      const index: number = 49;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0050 end');
    });

    it('testStableReplaceReset0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0051 begin');
      const index: number = 50;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0051 end');
    });

    it('testStableReplaceReset0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0052 begin');
      const index: number = 51;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0052 end');
    });

    it('testStableReplaceReset0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0053 begin');
      const index: number = 52;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0053 end');
    });

    it('testStableReplaceReset0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0054 begin');
      const index: number = 53;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0054 end');
    });

    it('testStableReplaceReset0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0055 begin');
      const index: number = 54;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0055 end');
    });

    it('testStableReplaceReset0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0056 begin');
      const index: number = 55;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0056 end');
    });

    it('testStableReplaceReset0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0057 begin');
      const index: number = 56;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0057 end');
    });

    it('testStableReplaceReset0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0058 begin');
      const index: number = 57;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0058 end');
    });

    it('testStableReplaceReset0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0059 begin');
      const index: number = 58;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0059 end');
    });

    it('testStableReplaceReset0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0060 begin');
      const index: number = 59;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0060 end');
    });

    it('testStableReplaceReset0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0061 begin');
      const index: number = 60;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0061 end');
    });

    it('testStableReplaceReset0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0062 begin');
      const index: number = 61;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0062 end');
    });

    it('testStableReplaceReset0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0063 begin');
      const index: number = 62;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0063 end');
    });

    it('testStableReplaceReset0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0064 begin');
      const index: number = 63;
      const repeat: number = (index % 10) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let replacedCount: number = 0;
      for (let n: number = 0; n < repeat; n++) {
        controller.registerResetCallback(() => {
          replacedCount++;
        });
      }
      controller.reset();
      expect(replacedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReplaceReset0064 end');
    });

  });
}