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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { displaySync } from '@kit.ArkGraphics2D';
import { bundleManager } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DisplaySync]';

export default function dsApiMatrix1Test(): void {
  describe('DsApiMatrix1Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0001
     * @tc.name      dsApi0001
     * @tc.desc      displaySync.create 第 1 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0001 begin');
      const type1: string = typeof displaySync.create;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + type1);
      expect(type1).assertEqual('function');
      const ds: displaySync.DisplaySync = displaySync.create();
      expect(typeof ds).assertEqual('object');
      expect(displaySync.create() !== undefined).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0001 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0002
     * @tc.name      dsApi0002
     * @tc.desc      displaySync.create 第 2 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0002 begin');
      const type1: string = typeof displaySync.create;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + type1);
      expect(type1).assertEqual('function');
      const ds: displaySync.DisplaySync = displaySync.create();
      expect(typeof ds).assertEqual('object');
      expect(displaySync.create() !== undefined).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0002 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0003
     * @tc.name      dsApi0003
     * @tc.desc      displaySync.create 第 3 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0003 begin');
      const type1: string = typeof displaySync.create;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + type1);
      expect(type1).assertEqual('function');
      const ds: displaySync.DisplaySync = displaySync.create();
      expect(typeof ds).assertEqual('object');
      expect(displaySync.create() !== undefined).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0003 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0004
     * @tc.name      dsApi0004
     * @tc.desc      displaySync.create 第 4 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0004 begin');
      const type1: string = typeof displaySync.create;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + type1);
      expect(type1).assertEqual('function');
      const ds: displaySync.DisplaySync = displaySync.create();
      expect(typeof ds).assertEqual('object');
      expect(displaySync.create() !== undefined).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0004 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0005
     * @tc.name      dsApi0005
     * @tc.desc      displaySync.create 第 5 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0005 begin');
      const type1: string = typeof displaySync.create;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + type1);
      expect(type1).assertEqual('function');
      const ds: displaySync.DisplaySync = displaySync.create();
      expect(typeof ds).assertEqual('object');
      expect(displaySync.create() !== undefined).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0005 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0006
     * @tc.name      dsApi0006
     * @tc.desc      displaySync.create 第 6 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0006 begin');
      const type1: string = typeof displaySync.create;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + type1);
      expect(type1).assertEqual('function');
      const ds: displaySync.DisplaySync = displaySync.create();
      expect(typeof ds).assertEqual('object');
      expect(displaySync.create() !== undefined).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0006 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0007
     * @tc.name      dsApi0007
     * @tc.desc      displaySync.create 第 7 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0007 begin');
      const type1: string = typeof displaySync.create;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + type1);
      expect(type1).assertEqual('function');
      const ds: displaySync.DisplaySync = displaySync.create();
      expect(typeof ds).assertEqual('object');
      expect(displaySync.create() !== undefined).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0007 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0008
     * @tc.name      dsApi0008
     * @tc.desc      displaySync.create 第 8 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0008 begin');
      const type1: string = typeof displaySync.create;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + type1);
      expect(type1).assertEqual('function');
      const ds: displaySync.DisplaySync = displaySync.create();
      expect(typeof ds).assertEqual('object');
      expect(displaySync.create() !== undefined).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0008 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0009
     * @tc.name      dsApi0009
     * @tc.desc      displaySync.setExpectedFrameRateRange 第 1 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0009 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.setExpectedFrameRateRange;
      expect(type1).assertEqual('function');
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      expect(typeof ds).assertEqual('object');
      expect(typeof ds.start).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0009 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0010
     * @tc.name      dsApi0010
     * @tc.desc      displaySync.setExpectedFrameRateRange 第 2 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0010 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.setExpectedFrameRateRange;
      expect(type1).assertEqual('function');
      ds.setExpectedFrameRateRange({ min: 2, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 2, expected: 60, max: 120 });
      expect(typeof ds).assertEqual('object');
      expect(typeof ds.start).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0010 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0011
     * @tc.name      dsApi0011
     * @tc.desc      displaySync.setExpectedFrameRateRange 第 3 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0011 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.setExpectedFrameRateRange;
      expect(type1).assertEqual('function');
      ds.setExpectedFrameRateRange({ min: 3, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 3, expected: 60, max: 120 });
      expect(typeof ds).assertEqual('object');
      expect(typeof ds.start).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0011 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0012
     * @tc.name      dsApi0012
     * @tc.desc      displaySync.setExpectedFrameRateRange 第 4 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0012 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.setExpectedFrameRateRange;
      expect(type1).assertEqual('function');
      ds.setExpectedFrameRateRange({ min: 4, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 4, expected: 60, max: 120 });
      expect(typeof ds).assertEqual('object');
      expect(typeof ds.start).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0012 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0013
     * @tc.name      dsApi0013
     * @tc.desc      displaySync.setExpectedFrameRateRange 第 5 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0013 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.setExpectedFrameRateRange;
      expect(type1).assertEqual('function');
      ds.setExpectedFrameRateRange({ min: 5, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 5, expected: 60, max: 120 });
      expect(typeof ds).assertEqual('object');
      expect(typeof ds.start).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0013 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0014
     * @tc.name      dsApi0014
     * @tc.desc      displaySync.setExpectedFrameRateRange 第 6 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0014 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.setExpectedFrameRateRange;
      expect(type1).assertEqual('function');
      ds.setExpectedFrameRateRange({ min: 6, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 6, expected: 60, max: 120 });
      expect(typeof ds).assertEqual('object');
      expect(typeof ds.start).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0014 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0015
     * @tc.name      dsApi0015
     * @tc.desc      displaySync.setExpectedFrameRateRange 第 7 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0015 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.setExpectedFrameRateRange;
      expect(type1).assertEqual('function');
      ds.setExpectedFrameRateRange({ min: 7, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 7, expected: 60, max: 120 });
      expect(typeof ds).assertEqual('object');
      expect(typeof ds.start).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0015 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0016
     * @tc.name      dsApi0016
     * @tc.desc      displaySync.setExpectedFrameRateRange 第 8 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0016 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.setExpectedFrameRateRange;
      expect(type1).assertEqual('function');
      ds.setExpectedFrameRateRange({ min: 8, expected: 60, max: 120 });
      ds.setExpectedFrameRateRange({ min: 8, expected: 60, max: 120 });
      expect(typeof ds).assertEqual('object');
      expect(typeof ds.start).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0016 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0017
     * @tc.name      dsApi0017
     * @tc.desc      displaySync.on 第 1 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0017 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.on;
      expect(type1).assertEqual('function');
      let frames: number = 0;
      ds.on('frame', (info: displaySync.IntervalInfo) => {
        frames = frames + 1;
      });
      expect(typeof frames).assertEqual('number');
      expect(ds !== undefined).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0017 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0018
     * @tc.name      dsApi0018
     * @tc.desc      displaySync.on 第 2 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0018 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.on;
      expect(type1).assertEqual('function');
      let frames: number = 0;
      ds.on('frame', (info: displaySync.IntervalInfo) => {
        frames = frames + 1;
      });
      expect(typeof frames).assertEqual('number');
      expect(ds !== undefined).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0018 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0019
     * @tc.name      dsApi0019
     * @tc.desc      displaySync.on 第 3 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0019 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.on;
      expect(type1).assertEqual('function');
      let frames: number = 0;
      ds.on('frame', (info: displaySync.IntervalInfo) => {
        frames = frames + 1;
      });
      expect(typeof frames).assertEqual('number');
      expect(ds !== undefined).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0019 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0020
     * @tc.name      dsApi0020
     * @tc.desc      displaySync.on 第 4 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0020 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.on;
      expect(type1).assertEqual('function');
      let frames: number = 0;
      ds.on('frame', (info: displaySync.IntervalInfo) => {
        frames = frames + 1;
      });
      expect(typeof frames).assertEqual('number');
      expect(ds !== undefined).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0020 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0021
     * @tc.name      dsApi0021
     * @tc.desc      displaySync.on 第 5 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0021 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.on;
      expect(type1).assertEqual('function');
      let frames: number = 0;
      ds.on('frame', (info: displaySync.IntervalInfo) => {
        frames = frames + 1;
      });
      expect(typeof frames).assertEqual('number');
      expect(ds !== undefined).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0021 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0022
     * @tc.name      dsApi0022
     * @tc.desc      displaySync.on 第 6 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0022 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.on;
      expect(type1).assertEqual('function');
      let frames: number = 0;
      ds.on('frame', (info: displaySync.IntervalInfo) => {
        frames = frames + 1;
      });
      expect(typeof frames).assertEqual('number');
      expect(ds !== undefined).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0022 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0023
     * @tc.name      dsApi0023
     * @tc.desc      displaySync.on 第 7 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0023 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.on;
      expect(type1).assertEqual('function');
      let frames: number = 0;
      ds.on('frame', (info: displaySync.IntervalInfo) => {
        frames = frames + 1;
      });
      expect(typeof frames).assertEqual('number');
      expect(ds !== undefined).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0023 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0024
     * @tc.name      dsApi0024
     * @tc.desc      displaySync.on 第 8 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0024 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.on;
      expect(type1).assertEqual('function');
      let frames: number = 0;
      ds.on('frame', (info: displaySync.IntervalInfo) => {
        frames = frames + 1;
      });
      expect(typeof frames).assertEqual('number');
      expect(ds !== undefined).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0024 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0025
     * @tc.name      dsApi0025
     * @tc.desc      displaySync.off 第 1 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0025 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.off;
      expect(type1).assertEqual('function');
      let frames: number = 0;
      const cb: (info: displaySync.IntervalInfo) => void = (info: displaySync.IntervalInfo) => {
        frames = frames + 1;
      };
      ds.on('frame', cb);
      ds.off('frame', cb);
      expect(frames).assertEqual(0);
      expect(typeof ds.on).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0025 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0026
     * @tc.name      dsApi0026
     * @tc.desc      displaySync.off 第 2 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0026 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.off;
      expect(type1).assertEqual('function');
      let frames: number = 0;
      const cb: (info: displaySync.IntervalInfo) => void = (info: displaySync.IntervalInfo) => {
        frames = frames + 1;
      };
      ds.on('frame', cb);
      ds.off('frame', cb);
      expect(frames).assertEqual(0);
      expect(typeof ds.on).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0026 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0027
     * @tc.name      dsApi0027
     * @tc.desc      displaySync.off 第 3 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0027 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.off;
      expect(type1).assertEqual('function');
      let frames: number = 0;
      const cb: (info: displaySync.IntervalInfo) => void = (info: displaySync.IntervalInfo) => {
        frames = frames + 1;
      };
      ds.on('frame', cb);
      ds.off('frame', cb);
      expect(frames).assertEqual(0);
      expect(typeof ds.on).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0027 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0028
     * @tc.name      dsApi0028
     * @tc.desc      displaySync.off 第 4 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0028 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.off;
      expect(type1).assertEqual('function');
      let frames: number = 0;
      const cb: (info: displaySync.IntervalInfo) => void = (info: displaySync.IntervalInfo) => {
        frames = frames + 1;
      };
      ds.on('frame', cb);
      ds.off('frame', cb);
      expect(frames).assertEqual(0);
      expect(typeof ds.on).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0028 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0029
     * @tc.name      dsApi0029
     * @tc.desc      displaySync.off 第 5 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0029 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.off;
      expect(type1).assertEqual('function');
      let frames: number = 0;
      const cb: (info: displaySync.IntervalInfo) => void = (info: displaySync.IntervalInfo) => {
        frames = frames + 1;
      };
      ds.on('frame', cb);
      ds.off('frame', cb);
      expect(frames).assertEqual(0);
      expect(typeof ds.on).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0029 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0030
     * @tc.name      dsApi0030
     * @tc.desc      displaySync.off 第 6 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0030 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.off;
      expect(type1).assertEqual('function');
      let frames: number = 0;
      const cb: (info: displaySync.IntervalInfo) => void = (info: displaySync.IntervalInfo) => {
        frames = frames + 1;
      };
      ds.on('frame', cb);
      ds.off('frame', cb);
      expect(frames).assertEqual(0);
      expect(typeof ds.on).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0030 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0031
     * @tc.name      dsApi0031
     * @tc.desc      displaySync.off 第 7 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0031 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.off;
      expect(type1).assertEqual('function');
      let frames: number = 0;
      const cb: (info: displaySync.IntervalInfo) => void = (info: displaySync.IntervalInfo) => {
        frames = frames + 1;
      };
      ds.on('frame', cb);
      ds.off('frame', cb);
      expect(frames).assertEqual(0);
      expect(typeof ds.on).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0031 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0032
     * @tc.name      dsApi0032
     * @tc.desc      displaySync.off 第 8 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0032 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.off;
      expect(type1).assertEqual('function');
      let frames: number = 0;
      const cb: (info: displaySync.IntervalInfo) => void = (info: displaySync.IntervalInfo) => {
        frames = frames + 1;
      };
      ds.on('frame', cb);
      ds.off('frame', cb);
      expect(frames).assertEqual(0);
      expect(typeof ds.on).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0032 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0033
     * @tc.name      dsApi0033
     * @tc.desc      displaySync.start 第 1 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0033 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.start;
      expect(type1).assertEqual('function');
      ds.start();
      ds.stop();
      expect(typeof ds).assertEqual('object');
      expect(typeof ds.start).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0033 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0034
     * @tc.name      dsApi0034
     * @tc.desc      displaySync.start 第 2 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0034 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.start;
      expect(type1).assertEqual('function');
      ds.start();
      ds.stop();
      expect(typeof ds).assertEqual('object');
      expect(typeof ds.start).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0034 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0035
     * @tc.name      dsApi0035
     * @tc.desc      displaySync.start 第 3 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0035 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.start;
      expect(type1).assertEqual('function');
      ds.start();
      ds.stop();
      expect(typeof ds).assertEqual('object');
      expect(typeof ds.start).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0035 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0036
     * @tc.name      dsApi0036
     * @tc.desc      displaySync.start 第 4 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0036 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.start;
      expect(type1).assertEqual('function');
      ds.start();
      ds.stop();
      expect(typeof ds).assertEqual('object');
      expect(typeof ds.start).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0036 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0037
     * @tc.name      dsApi0037
     * @tc.desc      displaySync.start 第 5 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0037 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.start;
      expect(type1).assertEqual('function');
      ds.start();
      ds.stop();
      expect(typeof ds).assertEqual('object');
      expect(typeof ds.start).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0037 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0038
     * @tc.name      dsApi0038
     * @tc.desc      displaySync.start 第 6 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0038 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.start;
      expect(type1).assertEqual('function');
      ds.start();
      ds.stop();
      expect(typeof ds).assertEqual('object');
      expect(typeof ds.start).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0038 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0039
     * @tc.name      dsApi0039
     * @tc.desc      displaySync.start 第 7 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0039 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.start;
      expect(type1).assertEqual('function');
      ds.start();
      ds.stop();
      expect(typeof ds).assertEqual('object');
      expect(typeof ds.start).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0039 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0040
     * @tc.name      dsApi0040
     * @tc.desc      displaySync.start 第 8 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0040 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.start;
      expect(type1).assertEqual('function');
      ds.start();
      ds.stop();
      expect(typeof ds).assertEqual('object');
      expect(typeof ds.start).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0040 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0041
     * @tc.name      dsApi0041
     * @tc.desc      displaySync.stop 第 1 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0041 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.stop;
      expect(type1).assertEqual('function');
      ds.start();
      ds.stop();
      expect(typeof ds.start).assertEqual('function');
      expect(typeof ds.stop).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0041 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0042
     * @tc.name      dsApi0042
     * @tc.desc      displaySync.stop 第 2 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0042 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.stop;
      expect(type1).assertEqual('function');
      ds.start();
      ds.stop();
      expect(typeof ds.start).assertEqual('function');
      expect(typeof ds.stop).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0042 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0043
     * @tc.name      dsApi0043
     * @tc.desc      displaySync.stop 第 3 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0043 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.stop;
      expect(type1).assertEqual('function');
      ds.start();
      ds.stop();
      expect(typeof ds.start).assertEqual('function');
      expect(typeof ds.stop).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0043 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0044
     * @tc.name      dsApi0044
     * @tc.desc      displaySync.stop 第 4 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0044 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.stop;
      expect(type1).assertEqual('function');
      ds.start();
      ds.stop();
      expect(typeof ds.start).assertEqual('function');
      expect(typeof ds.stop).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0044 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0045
     * @tc.name      dsApi0045
     * @tc.desc      displaySync.stop 第 5 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0045 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.stop;
      expect(type1).assertEqual('function');
      ds.start();
      ds.stop();
      expect(typeof ds.start).assertEqual('function');
      expect(typeof ds.stop).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0045 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0046
     * @tc.name      dsApi0046
     * @tc.desc      displaySync.stop 第 6 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0046 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.stop;
      expect(type1).assertEqual('function');
      ds.start();
      ds.stop();
      expect(typeof ds.start).assertEqual('function');
      expect(typeof ds.stop).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0046 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0047
     * @tc.name      dsApi0047
     * @tc.desc      displaySync.stop 第 7 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0047 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.stop;
      expect(type1).assertEqual('function');
      ds.start();
      ds.stop();
      expect(typeof ds.start).assertEqual('function');
      expect(typeof ds.stop).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0047 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_API_0048
     * @tc.name      dsApi0048
     * @tc.desc      displaySync.stop 第 8 轮契约检查
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsApi0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0048 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      const type1: string = typeof ds.stop;
      expect(type1).assertEqual('function');
      ds.start();
      ds.stop();
      expect(typeof ds.start).assertEqual('function');
      expect(typeof ds.stop).assertEqual('function');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsApi0048 end');
    })
  })
}
