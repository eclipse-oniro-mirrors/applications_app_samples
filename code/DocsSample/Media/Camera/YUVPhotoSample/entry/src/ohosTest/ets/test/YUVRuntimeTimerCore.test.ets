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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import RefreshableTimer from '../../../main/ets/utils/RefreshableTimer';

const TAG: string = '[Sample_yuvRuntimeTimerCore]';
const DOMAIN: number = 0xF817;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function yuvRuntimeTimerCoreTest(): void {
  describe('yuvRuntimeTimerCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0001
     * @tc.name      testExtYuvTimer0001
     * @tc.desc      RefreshableTimer start timeout 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 10);
      timer.start();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 50);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0002
     * @tc.name      testExtYuvTimer0002
     * @tc.desc      RefreshableTimer refresh timeout 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 20);
      timer.start();
      timer.refresh();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 60);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0003
     * @tc.name      testExtYuvTimer0003
     * @tc.desc      RefreshableTimer clear timeout 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 30);
      timer.start();
      timer.clear();
      expect(timer.isRunning()).assertFalse();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 70);
      });
      expect(fired).assertEqual(0);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0004
     * @tc.name      testExtYuvTimer0004
     * @tc.desc      RefreshableTimer start timeout 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 40);
      timer.start();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 80);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0005
     * @tc.name      testExtYuvTimer0005
     * @tc.desc      RefreshableTimer refresh timeout 50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 50);
      timer.start();
      timer.refresh();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 90);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0006
     * @tc.name      testExtYuvTimer0006
     * @tc.desc      RefreshableTimer clear timeout 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 10);
      timer.start();
      timer.clear();
      expect(timer.isRunning()).assertFalse();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 50);
      });
      expect(fired).assertEqual(0);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0007
     * @tc.name      testExtYuvTimer0007
     * @tc.desc      RefreshableTimer start timeout 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 20);
      timer.start();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 60);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0008
     * @tc.name      testExtYuvTimer0008
     * @tc.desc      RefreshableTimer refresh timeout 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 30);
      timer.start();
      timer.refresh();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 70);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0009
     * @tc.name      testExtYuvTimer0009
     * @tc.desc      RefreshableTimer clear timeout 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 40);
      timer.start();
      timer.clear();
      expect(timer.isRunning()).assertFalse();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 80);
      });
      expect(fired).assertEqual(0);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0010
     * @tc.name      testExtYuvTimer0010
     * @tc.desc      RefreshableTimer start timeout 50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 50);
      timer.start();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 90);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0011
     * @tc.name      testExtYuvTimer0011
     * @tc.desc      RefreshableTimer refresh timeout 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 10);
      timer.start();
      timer.refresh();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 50);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0012
     * @tc.name      testExtYuvTimer0012
     * @tc.desc      RefreshableTimer clear timeout 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 20);
      timer.start();
      timer.clear();
      expect(timer.isRunning()).assertFalse();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 60);
      });
      expect(fired).assertEqual(0);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0013
     * @tc.name      testExtYuvTimer0013
     * @tc.desc      RefreshableTimer start timeout 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 30);
      timer.start();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 70);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0014
     * @tc.name      testExtYuvTimer0014
     * @tc.desc      RefreshableTimer refresh timeout 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 40);
      timer.start();
      timer.refresh();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 80);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0015
     * @tc.name      testExtYuvTimer0015
     * @tc.desc      RefreshableTimer clear timeout 50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 50);
      timer.start();
      timer.clear();
      expect(timer.isRunning()).assertFalse();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 90);
      });
      expect(fired).assertEqual(0);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0016
     * @tc.name      testExtYuvTimer0016
     * @tc.desc      RefreshableTimer start timeout 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 10);
      timer.start();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 50);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0017
     * @tc.name      testExtYuvTimer0017
     * @tc.desc      RefreshableTimer refresh timeout 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 20);
      timer.start();
      timer.refresh();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 60);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0018
     * @tc.name      testExtYuvTimer0018
     * @tc.desc      RefreshableTimer clear timeout 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 30);
      timer.start();
      timer.clear();
      expect(timer.isRunning()).assertFalse();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 70);
      });
      expect(fired).assertEqual(0);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0019
     * @tc.name      testExtYuvTimer0019
     * @tc.desc      RefreshableTimer start timeout 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 40);
      timer.start();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 80);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0020
     * @tc.name      testExtYuvTimer0020
     * @tc.desc      RefreshableTimer refresh timeout 50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 50);
      timer.start();
      timer.refresh();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 90);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0021
     * @tc.name      testExtYuvTimer0021
     * @tc.desc      RefreshableTimer clear timeout 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 10);
      timer.start();
      timer.clear();
      expect(timer.isRunning()).assertFalse();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 50);
      });
      expect(fired).assertEqual(0);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0022
     * @tc.name      testExtYuvTimer0022
     * @tc.desc      RefreshableTimer start timeout 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 20);
      timer.start();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 60);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0023
     * @tc.name      testExtYuvTimer0023
     * @tc.desc      RefreshableTimer refresh timeout 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 30);
      timer.start();
      timer.refresh();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 70);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0024
     * @tc.name      testExtYuvTimer0024
     * @tc.desc      RefreshableTimer clear timeout 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 40);
      timer.start();
      timer.clear();
      expect(timer.isRunning()).assertFalse();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 80);
      });
      expect(fired).assertEqual(0);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0025
     * @tc.name      testExtYuvTimer0025
     * @tc.desc      RefreshableTimer start timeout 50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 50);
      timer.start();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 90);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0026
     * @tc.name      testExtYuvTimer0026
     * @tc.desc      RefreshableTimer refresh timeout 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 10);
      timer.start();
      timer.refresh();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 50);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0027
     * @tc.name      testExtYuvTimer0027
     * @tc.desc      RefreshableTimer clear timeout 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 20);
      timer.start();
      timer.clear();
      expect(timer.isRunning()).assertFalse();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 60);
      });
      expect(fired).assertEqual(0);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0028
     * @tc.name      testExtYuvTimer0028
     * @tc.desc      RefreshableTimer start timeout 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 30);
      timer.start();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 70);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0029
     * @tc.name      testExtYuvTimer0029
     * @tc.desc      RefreshableTimer refresh timeout 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 40);
      timer.start();
      timer.refresh();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 80);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0030
     * @tc.name      testExtYuvTimer0030
     * @tc.desc      RefreshableTimer clear timeout 50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 50);
      timer.start();
      timer.clear();
      expect(timer.isRunning()).assertFalse();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 90);
      });
      expect(fired).assertEqual(0);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0031
     * @tc.name      testExtYuvTimer0031
     * @tc.desc      RefreshableTimer start timeout 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 10);
      timer.start();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 50);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0032
     * @tc.name      testExtYuvTimer0032
     * @tc.desc      RefreshableTimer refresh timeout 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 20);
      timer.start();
      timer.refresh();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 60);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0033
     * @tc.name      testExtYuvTimer0033
     * @tc.desc      RefreshableTimer clear timeout 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 30);
      timer.start();
      timer.clear();
      expect(timer.isRunning()).assertFalse();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 70);
      });
      expect(fired).assertEqual(0);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0034
     * @tc.name      testExtYuvTimer0034
     * @tc.desc      RefreshableTimer start timeout 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 40);
      timer.start();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 80);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0035
     * @tc.name      testExtYuvTimer0035
     * @tc.desc      RefreshableTimer refresh timeout 50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 50);
      timer.start();
      timer.refresh();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 90);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0036
     * @tc.name      testExtYuvTimer0036
     * @tc.desc      RefreshableTimer clear timeout 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 10);
      timer.start();
      timer.clear();
      expect(timer.isRunning()).assertFalse();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 50);
      });
      expect(fired).assertEqual(0);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0037
     * @tc.name      testExtYuvTimer0037
     * @tc.desc      RefreshableTimer start timeout 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 20);
      timer.start();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 60);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0038
     * @tc.name      testExtYuvTimer0038
     * @tc.desc      RefreshableTimer refresh timeout 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 30);
      timer.start();
      timer.refresh();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 70);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0039
     * @tc.name      testExtYuvTimer0039
     * @tc.desc      RefreshableTimer clear timeout 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 40);
      timer.start();
      timer.clear();
      expect(timer.isRunning()).assertFalse();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 80);
      });
      expect(fired).assertEqual(0);
      timer.clear();
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_TIMER_0040
     * @tc.name      testExtYuvTimer0040
     * @tc.desc      RefreshableTimer start timeout 50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvTimer0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let fired: number = 0;
      const timer: RefreshableTimer = new RefreshableTimer(() => { fired++; }, 50);
      timer.start();
      expect(timer.isRunning()).assertTrue();
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 90);
      });
      expect(fired).assertLargerOrEqual(1);
      timer.clear();
    })
  });
}
