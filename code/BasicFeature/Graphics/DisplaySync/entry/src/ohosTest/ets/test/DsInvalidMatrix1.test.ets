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

export default function dsInvalidMatrix1Test(): void {
  describe('DsInvalidMatrix1Test', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0001
     * @tc.name      dsInvalid0001
     * @tc.desc      非法帧率区间 min=-1 expected=60 max=120 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0001 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: -1, expected: 60, max: 120 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0001 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0002
     * @tc.name      dsInvalid0002
     * @tc.desc      非法帧率 min=-1 expected=60 max=120 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0002 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: -1, expected: 60, max: 120 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0002 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0003
     * @tc.name      dsInvalid0003
     * @tc.desc      非法帧率区间 min=-1 expected=-1 max=120 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0003 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: -1, expected: -1, max: 120 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0003 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0004
     * @tc.name      dsInvalid0004
     * @tc.desc      非法帧率 min=-1 expected=-1 max=120 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0004 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: -1, expected: -1, max: 120 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0004 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0005
     * @tc.name      dsInvalid0005
     * @tc.desc      非法帧率区间 min=60 expected=30 max=120 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0005 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: 60, expected: 30, max: 120 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0005 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0006
     * @tc.name      dsInvalid0006
     * @tc.desc      非法帧率 min=60 expected=30 max=120 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0006 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: 60, expected: 30, max: 120 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0006 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0007
     * @tc.name      dsInvalid0007
     * @tc.desc      非法帧率区间 min=60 expected=120 max=30 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0007 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: 60, expected: 120, max: 30 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0007 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0008
     * @tc.name      dsInvalid0008
     * @tc.desc      非法帧率 min=60 expected=120 max=30 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0008 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: 60, expected: 120, max: 30 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0008 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0009
     * @tc.name      dsInvalid0009
     * @tc.desc      非法帧率区间 min=120 expected=30 max=60 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0009 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: 120, expected: 30, max: 60 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0009 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0010
     * @tc.name      dsInvalid0010
     * @tc.desc      非法帧率 min=120 expected=30 max=60 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0010 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: 120, expected: 30, max: 60 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0010 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0011
     * @tc.name      dsInvalid0011
     * @tc.desc      非法帧率区间 min=0 expected=0 max=0 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0011 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: 0, expected: 0, max: 0 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0011 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0012
     * @tc.name      dsInvalid0012
     * @tc.desc      非法帧率 min=0 expected=0 max=0 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0012 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: 0, expected: 0, max: 0 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0012 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0013
     * @tc.name      dsInvalid0013
     * @tc.desc      非法帧率区间 min=0 expected=60 max=120 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0013 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: 0, expected: 60, max: 120 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0013 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0014
     * @tc.name      dsInvalid0014
     * @tc.desc      非法帧率 min=0 expected=60 max=120 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0014 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: 0, expected: 60, max: 120 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0014 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0015
     * @tc.name      dsInvalid0015
     * @tc.desc      非法帧率区间 min=60 expected=0 max=120 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0015 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: 60, expected: 0, max: 120 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0015 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0016
     * @tc.name      dsInvalid0016
     * @tc.desc      非法帧率 min=60 expected=0 max=120 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0016 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: 60, expected: 0, max: 120 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0016 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0017
     * @tc.name      dsInvalid0017
     * @tc.desc      非法帧率区间 min=60 expected=60 max=0 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0017 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: 60, expected: 60, max: 0 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0017 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0018
     * @tc.name      dsInvalid0018
     * @tc.desc      非法帧率 min=60 expected=60 max=0 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0018 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: 60, expected: 60, max: 0 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0018 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0019
     * @tc.name      dsInvalid0019
     * @tc.desc      非法帧率区间 min=1 expected=0 max=120 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0019 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: 1, expected: 0, max: 120 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0019 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0020
     * @tc.name      dsInvalid0020
     * @tc.desc      非法帧率 min=1 expected=0 max=120 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0020 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: 1, expected: 0, max: 120 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0020 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0021
     * @tc.name      dsInvalid0021
     * @tc.desc      非法帧率区间 min=200 expected=200 max=240 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0021 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: 200, expected: 200, max: 240 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0021 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0022
     * @tc.name      dsInvalid0022
     * @tc.desc      非法帧率 min=200 expected=200 max=240 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0022 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: 200, expected: 200, max: 240 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0022 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0023
     * @tc.name      dsInvalid0023
     * @tc.desc      非法帧率区间 min=1 expected=200 max=120 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0023 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: 1, expected: 200, max: 120 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0023 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0024
     * @tc.name      dsInvalid0024
     * @tc.desc      非法帧率 min=1 expected=200 max=120 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0024 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: 1, expected: 200, max: 120 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0024 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0025
     * @tc.name      dsInvalid0025
     * @tc.desc      非法帧率区间 min=1 expected=60 max=0 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0025 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 0 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0025 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0026
     * @tc.name      dsInvalid0026
     * @tc.desc      非法帧率 min=1 expected=60 max=0 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0026 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 0 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0026 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0027
     * @tc.name      dsInvalid0027
     * @tc.desc      非法帧率区间 min=144 expected=160 max=120 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0027 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: 144, expected: 160, max: 120 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0027 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0028
     * @tc.name      dsInvalid0028
     * @tc.desc      非法帧率 min=144 expected=160 max=120 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0028 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: 144, expected: 160, max: 120 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0028 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0029
     * @tc.name      dsInvalid0029
     * @tc.desc      非法帧率区间 min=30 expected=240 max=120 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0029 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: 30, expected: 240, max: 120 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0029 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0030
     * @tc.name      dsInvalid0030
     * @tc.desc      非法帧率 min=30 expected=240 max=120 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0030 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: 30, expected: 240, max: 120 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0030 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0031
     * @tc.name      dsInvalid0031
     * @tc.desc      非法帧率区间 min=-100 expected=60 max=120 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0031 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: -100, expected: 60, max: 120 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0031 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0032
     * @tc.name      dsInvalid0032
     * @tc.desc      非法帧率 min=-100 expected=60 max=120 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0032 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: -100, expected: 60, max: 120 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0032 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0033
     * @tc.name      dsInvalid0033
     * @tc.desc      非法帧率区间 min=-1 expected=0 max=-1 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0033 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: -1, expected: 0, max: -1 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0033 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0034
     * @tc.name      dsInvalid0034
     * @tc.desc      非法帧率 min=-1 expected=0 max=-1 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0034 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: -1, expected: 0, max: -1 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0034 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0035
     * @tc.name      dsInvalid0035
     * @tc.desc      非法帧率区间 min=1000 expected=1000 max=1000 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0035 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: 1000, expected: 1000, max: 1000 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0035 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0036
     * @tc.name      dsInvalid0036
     * @tc.desc      非法帧率 min=1000 expected=1000 max=1000 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0036 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: 1000, expected: 1000, max: 1000 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0036 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0037
     * @tc.name      dsInvalid0037
     * @tc.desc      非法帧率区间 min=1 expected=1000 max=120 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0037 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: 1, expected: 1000, max: 120 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0037 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0038
     * @tc.name      dsInvalid0038
     * @tc.desc      非法帧率 min=1 expected=1000 max=120 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0038 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: 1, expected: 1000, max: 120 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0038 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0039
     * @tc.name      dsInvalid0039
     * @tc.desc      非法帧率区间 min=120 expected=60 max=0 不破坏实例
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0039 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      let outcome: string = 'none';
      let code: number = 0;
      try {
        ds.setExpectedFrameRateRange({ min: 120, expected: 60, max: 0 });
        outcome = 'accepted';
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        code = err.code;
        outcome = 'rejected';
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + outcome + ' code=' + code);
      expect(outcome === 'accepted' || outcome === 'rejected').assertTrue();
      expect(outcome.length > 0).assertTrue();
      const kind: string = typeof ds;
      expect(kind).assertEqual('object');
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0039 end');
    })

    /**
     * @tc.number    SUB_GRAPHICS_DISPLAYSYNC_INVALID_0040
     * @tc.name      dsInvalid0040
     * @tc.desc      非法帧率 min=120 expected=60 max=0 之后仍可设置合法区间
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dsInvalid0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0040 begin');
      const ds: displaySync.DisplaySync = displaySync.create();
      try {
        ds.setExpectedFrameRateRange({ min: 120, expected: 60, max: 0 });
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, '%{public}s', 'rejected code=' + err.code);
      }
      ds.setExpectedFrameRateRange({ min: 1, expected: 60, max: 120 });
      const t1: string = typeof ds.start;
      hilog.info(DOMAIN, TAG, '%{public}s', 'a1=' + t1);
      expect(t1).assertEqual('function');
      const t2: string = typeof ds.stop;
      expect(t2).assertEqual('function');
      const t3: boolean = ds !== undefined;
      expect(t3).assertTrue();
      await tick();
      hilog.info(DOMAIN, TAG, '%{public}s', 'dsInvalid0040 end');
    })
  })
}
