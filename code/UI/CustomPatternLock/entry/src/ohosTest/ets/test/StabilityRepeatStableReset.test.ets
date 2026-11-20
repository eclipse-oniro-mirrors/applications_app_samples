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

export default function StabilityRepeatStableResetTest() {
  describe('StabilityRepeatStableReset', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    it('testStableReset0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0001 begin');
      const index: number = 0;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0001 end');
    });

    it('testStableReset0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0002 begin');
      const index: number = 1;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0002 end');
    });

    it('testStableReset0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0003 begin');
      const index: number = 2;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0003 end');
    });

    it('testStableReset0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0004 begin');
      const index: number = 3;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0004 end');
    });

    it('testStableReset0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0005 begin');
      const index: number = 4;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0005 end');
    });

    it('testStableReset0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0006 begin');
      const index: number = 5;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0006 end');
    });

    it('testStableReset0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0007 begin');
      const index: number = 6;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0007 end');
    });

    it('testStableReset0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0008 begin');
      const index: number = 7;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0008 end');
    });

    it('testStableReset0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0009 begin');
      const index: number = 8;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0009 end');
    });

    it('testStableReset0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0010 begin');
      const index: number = 9;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0010 end');
    });

    it('testStableReset0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0011 begin');
      const index: number = 10;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0011 end');
    });

    it('testStableReset0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0012 begin');
      const index: number = 11;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0012 end');
    });

    it('testStableReset0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0013 begin');
      const index: number = 12;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0013 end');
    });

    it('testStableReset0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0014 begin');
      const index: number = 13;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0014 end');
    });

    it('testStableReset0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0015 begin');
      const index: number = 14;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0015 end');
    });

    it('testStableReset0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0016 begin');
      const index: number = 15;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0016 end');
    });

    it('testStableReset0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0017 begin');
      const index: number = 16;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0017 end');
    });

    it('testStableReset0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0018 begin');
      const index: number = 17;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0018 end');
    });

    it('testStableReset0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0019 begin');
      const index: number = 18;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0019 end');
    });

    it('testStableReset0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0020 begin');
      const index: number = 19;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0020 end');
    });

    it('testStableReset0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0021 begin');
      const index: number = 20;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0021 end');
    });

    it('testStableReset0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0022 begin');
      const index: number = 21;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0022 end');
    });

    it('testStableReset0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0023 begin');
      const index: number = 22;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0023 end');
    });

    it('testStableReset0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0024 begin');
      const index: number = 23;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0024 end');
    });

    it('testStableReset0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0025 begin');
      const index: number = 24;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0025 end');
    });

    it('testStableReset0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0026 begin');
      const index: number = 25;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0026 end');
    });

    it('testStableReset0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0027 begin');
      const index: number = 26;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0027 end');
    });

    it('testStableReset0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0028 begin');
      const index: number = 27;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0028 end');
    });

    it('testStableReset0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0029 begin');
      const index: number = 28;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0029 end');
    });

    it('testStableReset0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0030 begin');
      const index: number = 29;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0030 end');
    });

    it('testStableReset0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0031 begin');
      const index: number = 30;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0031 end');
    });

    it('testStableReset0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0032 begin');
      const index: number = 31;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0032 end');
    });

    it('testStableReset0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0033 begin');
      const index: number = 32;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0033 end');
    });

    it('testStableReset0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0034 begin');
      const index: number = 33;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0034 end');
    });

    it('testStableReset0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0035 begin');
      const index: number = 34;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0035 end');
    });

    it('testStableReset0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0036 begin');
      const index: number = 35;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0036 end');
    });

    it('testStableReset0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0037 begin');
      const index: number = 36;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0037 end');
    });

    it('testStableReset0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0038 begin');
      const index: number = 37;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0038 end');
    });

    it('testStableReset0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0039 begin');
      const index: number = 38;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0039 end');
    });

    it('testStableReset0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0040 begin');
      const index: number = 39;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0040 end');
    });

    it('testStableReset0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0041 begin');
      const index: number = 40;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0041 end');
    });

    it('testStableReset0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0042 begin');
      const index: number = 41;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0042 end');
    });

    it('testStableReset0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0043 begin');
      const index: number = 42;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0043 end');
    });

    it('testStableReset0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0044 begin');
      const index: number = 43;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0044 end');
    });

    it('testStableReset0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0045 begin');
      const index: number = 44;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0045 end');
    });

    it('testStableReset0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0046 begin');
      const index: number = 45;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0046 end');
    });

    it('testStableReset0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0047 begin');
      const index: number = 46;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0047 end');
    });

    it('testStableReset0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0048 begin');
      const index: number = 47;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0048 end');
    });

    it('testStableReset0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0049 begin');
      const index: number = 48;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0049 end');
    });

    it('testStableReset0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0050 begin');
      const index: number = 49;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0050 end');
    });

    it('testStableReset0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0051 begin');
      const index: number = 50;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0051 end');
    });

    it('testStableReset0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0052 begin');
      const index: number = 51;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0052 end');
    });

    it('testStableReset0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0053 begin');
      const index: number = 52;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0053 end');
    });

    it('testStableReset0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0054 begin');
      const index: number = 53;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0054 end');
    });

    it('testStableReset0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0055 begin');
      const index: number = 54;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0055 end');
    });

    it('testStableReset0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0056 begin');
      const index: number = 55;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0056 end');
    });

    it('testStableReset0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0057 begin');
      const index: number = 56;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0057 end');
    });

    it('testStableReset0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0058 begin');
      const index: number = 57;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0058 end');
    });

    it('testStableReset0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0059 begin');
      const index: number = 58;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0059 end');
    });

    it('testStableReset0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0060 begin');
      const index: number = 59;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0060 end');
    });

    it('testStableReset0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0061 begin');
      const index: number = 60;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0061 end');
    });

    it('testStableReset0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0062 begin');
      const index: number = 61;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0062 end');
    });

    it('testStableReset0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0063 begin');
      const index: number = 62;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0063 end');
    });

    it('testStableReset0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0064 begin');
      const index: number = 63;
      const repeat: number = (index % 20) + 1;
      const controller: CustomPatternLockController = new CustomPatternLockController();
      let count: number = 0;
      controller.registerResetCallback(() => {
        count++;
      });
      for (let n: number = 0; n < repeat; n++) {
        controller.reset();
      }
      expect(count).assertEqual(repeat);
      controller.reset();
      expect(count).assertEqual(repeat + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableReset0064 end');
    });

  });
}