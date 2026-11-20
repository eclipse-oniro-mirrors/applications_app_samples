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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../TestEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { RectBox } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new RectBox (70 cases). */
export default function rectBoxCtorTest(): void {
  describe('RectBoxCtorTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0001
     * @tc.name      TsDrawingSample_RectBoxCtor_0001
     * @tc.desc      new RectBox(-100, -100, -100, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_RectBoxCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0001 begin`);
      const subject: RectBox = new RectBox(-100, -100, -100, -100);
      logInfo(`new RectBox(-100, -100, -100, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0002
     * @tc.name      TsDrawingSample_RectBoxCtor_0002
     * @tc.desc      new RectBox(-1, -100, -100, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TsDrawingSample_RectBoxCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0002 begin`);
      const subject: RectBox = new RectBox(-1, -100, -100, -100);
      logInfo(`new RectBox(-1, -100, -100, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-1);
      logInfo(`new RectBox(-1, -100, -100, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(-1, -100, -100, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(-1, -100, -100, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0002 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0003
     * @tc.name      TsDrawingSample_RectBoxCtor_0003
     * @tc.desc      new RectBox(0, -100, -100, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0003 begin`);
      const subject: RectBox = new RectBox(0, -100, -100, -100);
      logInfo(`new RectBox(0, -100, -100, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(0);
      logInfo(`new RectBox(0, -100, -100, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(0, -100, -100, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(0, -100, -100, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0003 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0004
     * @tc.name      TsDrawingSample_RectBoxCtor_0004
     * @tc.desc      new RectBox(1, -100, -100, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0004 begin`);
      const subject: RectBox = new RectBox(1, -100, -100, -100);
      logInfo(`new RectBox(1, -100, -100, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(1);
      logInfo(`new RectBox(1, -100, -100, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(1, -100, -100, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(1, -100, -100, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0004 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0005
     * @tc.name      TsDrawingSample_RectBoxCtor_0005
     * @tc.desc      new RectBox(50, -100, -100, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0005 begin`);
      const subject: RectBox = new RectBox(50, -100, -100, -100);
      logInfo(`new RectBox(50, -100, -100, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(50);
      logInfo(`new RectBox(50, -100, -100, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(50, -100, -100, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(50, -100, -100, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0005 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0006
     * @tc.name      TsDrawingSample_RectBoxCtor_0006
     * @tc.desc      new RectBox(100, -100, -100, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0006 begin`);
      const subject: RectBox = new RectBox(100, -100, -100, -100);
      logInfo(`new RectBox(100, -100, -100, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(100);
      logInfo(`new RectBox(100, -100, -100, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(100, -100, -100, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(100, -100, -100, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0006 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0007
     * @tc.name      TsDrawingSample_RectBoxCtor_0007
     * @tc.desc      new RectBox(2, -100, -100, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0007 begin`);
      const subject: RectBox = new RectBox(2, -100, -100, -100);
      logInfo(`new RectBox(2, -100, -100, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(2);
      logInfo(`new RectBox(2, -100, -100, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(2, -100, -100, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(2, -100, -100, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0007 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0008
     * @tc.name      TsDrawingSample_RectBoxCtor_0008
     * @tc.desc      new RectBox(3, -100, -100, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0008 begin`);
      const subject: RectBox = new RectBox(3, -100, -100, -100);
      logInfo(`new RectBox(3, -100, -100, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(3);
      logInfo(`new RectBox(3, -100, -100, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(3, -100, -100, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(3, -100, -100, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0008 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0009
     * @tc.name      TsDrawingSample_RectBoxCtor_0009
     * @tc.desc      new RectBox(-100, -1, -100, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0009 begin`);
      const subject: RectBox = new RectBox(-100, -1, -100, -100);
      logInfo(`new RectBox(-100, -1, -100, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, -1, -100, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-1);
      logInfo(`new RectBox(-100, -1, -100, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(-100, -1, -100, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0009 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0010
     * @tc.name      TsDrawingSample_RectBoxCtor_0010
     * @tc.desc      new RectBox(-100, 0, -100, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0010 begin`);
      const subject: RectBox = new RectBox(-100, 0, -100, -100);
      logInfo(`new RectBox(-100, 0, -100, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, 0, -100, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(0);
      logInfo(`new RectBox(-100, 0, -100, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(-100, 0, -100, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0010 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0011
     * @tc.name      TsDrawingSample_RectBoxCtor_0011
     * @tc.desc      new RectBox(-100, 1, -100, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0011 begin`);
      const subject: RectBox = new RectBox(-100, 1, -100, -100);
      logInfo(`new RectBox(-100, 1, -100, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, 1, -100, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(1);
      logInfo(`new RectBox(-100, 1, -100, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(-100, 1, -100, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0011 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0012
     * @tc.name      TsDrawingSample_RectBoxCtor_0012
     * @tc.desc      new RectBox(-100, 50, -100, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0012 begin`);
      const subject: RectBox = new RectBox(-100, 50, -100, -100);
      logInfo(`new RectBox(-100, 50, -100, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, 50, -100, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(50);
      logInfo(`new RectBox(-100, 50, -100, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(-100, 50, -100, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0012 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0013
     * @tc.name      TsDrawingSample_RectBoxCtor_0013
     * @tc.desc      new RectBox(-100, 100, -100, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0013 begin`);
      const subject: RectBox = new RectBox(-100, 100, -100, -100);
      logInfo(`new RectBox(-100, 100, -100, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, 100, -100, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(100);
      logInfo(`new RectBox(-100, 100, -100, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(-100, 100, -100, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0013 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0014
     * @tc.name      TsDrawingSample_RectBoxCtor_0014
     * @tc.desc      new RectBox(-100, 2, -100, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0014 begin`);
      const subject: RectBox = new RectBox(-100, 2, -100, -100);
      logInfo(`new RectBox(-100, 2, -100, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, 2, -100, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(2);
      logInfo(`new RectBox(-100, 2, -100, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(-100, 2, -100, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0014 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0015
     * @tc.name      TsDrawingSample_RectBoxCtor_0015
     * @tc.desc      new RectBox(-100, 3, -100, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0015 begin`);
      const subject: RectBox = new RectBox(-100, 3, -100, -100);
      logInfo(`new RectBox(-100, 3, -100, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, 3, -100, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(3);
      logInfo(`new RectBox(-100, 3, -100, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(-100, 3, -100, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0015 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0016
     * @tc.name      TsDrawingSample_RectBoxCtor_0016
     * @tc.desc      new RectBox(-100, -100, -1, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0016 begin`);
      const subject: RectBox = new RectBox(-100, -100, -1, -100);
      logInfo(`new RectBox(-100, -100, -1, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -1, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -1, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-1);
      logInfo(`new RectBox(-100, -100, -1, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0016 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0017
     * @tc.name      TsDrawingSample_RectBoxCtor_0017
     * @tc.desc      new RectBox(-100, -100, 0, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0017 begin`);
      const subject: RectBox = new RectBox(-100, -100, 0, -100);
      logInfo(`new RectBox(-100, -100, 0, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, 0, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, 0, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(0);
      logInfo(`new RectBox(-100, -100, 0, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0017 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0018
     * @tc.name      TsDrawingSample_RectBoxCtor_0018
     * @tc.desc      new RectBox(-100, -100, 1, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0018 begin`);
      const subject: RectBox = new RectBox(-100, -100, 1, -100);
      logInfo(`new RectBox(-100, -100, 1, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, 1, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, 1, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(1);
      logInfo(`new RectBox(-100, -100, 1, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0018 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0019
     * @tc.name      TsDrawingSample_RectBoxCtor_0019
     * @tc.desc      new RectBox(-100, -100, 50, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0019 begin`);
      const subject: RectBox = new RectBox(-100, -100, 50, -100);
      logInfo(`new RectBox(-100, -100, 50, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, 50, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, 50, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(50);
      logInfo(`new RectBox(-100, -100, 50, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0019 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0020
     * @tc.name      TsDrawingSample_RectBoxCtor_0020
     * @tc.desc      new RectBox(-100, -100, 100, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0020 begin`);
      const subject: RectBox = new RectBox(-100, -100, 100, -100);
      logInfo(`new RectBox(-100, -100, 100, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, 100, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, 100, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(100);
      logInfo(`new RectBox(-100, -100, 100, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0020 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0021
     * @tc.name      TsDrawingSample_RectBoxCtor_0021
     * @tc.desc      new RectBox(-100, -100, 2, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0021 begin`);
      const subject: RectBox = new RectBox(-100, -100, 2, -100);
      logInfo(`new RectBox(-100, -100, 2, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, 2, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, 2, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(2);
      logInfo(`new RectBox(-100, -100, 2, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0021 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0022
     * @tc.name      TsDrawingSample_RectBoxCtor_0022
     * @tc.desc      new RectBox(-100, -100, 3, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0022 begin`);
      const subject: RectBox = new RectBox(-100, -100, 3, -100);
      logInfo(`new RectBox(-100, -100, 3, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, 3, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, 3, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(3);
      logInfo(`new RectBox(-100, -100, 3, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0022 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0023
     * @tc.name      TsDrawingSample_RectBoxCtor_0023
     * @tc.desc      new RectBox(-100, -100, -100, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0023 begin`);
      const subject: RectBox = new RectBox(-100, -100, -100, -1);
      logInfo(`new RectBox(-100, -100, -100, -1): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, -1): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, -1): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, -1): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-1);
      logInfo(`${BUNDLE}RectBoxCtor_0023 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0024
     * @tc.name      TsDrawingSample_RectBoxCtor_0024
     * @tc.desc      new RectBox(-100, -100, -100, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0024 begin`);
      const subject: RectBox = new RectBox(-100, -100, -100, 0);
      logInfo(`new RectBox(-100, -100, -100, 0): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, 0): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, 0): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, 0): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(0);
      logInfo(`${BUNDLE}RectBoxCtor_0024 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0025
     * @tc.name      TsDrawingSample_RectBoxCtor_0025
     * @tc.desc      new RectBox(-100, -100, -100, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0025 begin`);
      const subject: RectBox = new RectBox(-100, -100, -100, 1);
      logInfo(`new RectBox(-100, -100, -100, 1): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, 1): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, 1): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, 1): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(1);
      logInfo(`${BUNDLE}RectBoxCtor_0025 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0026
     * @tc.name      TsDrawingSample_RectBoxCtor_0026
     * @tc.desc      new RectBox(-100, -100, -100, 50) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0026 begin`);
      const subject: RectBox = new RectBox(-100, -100, -100, 50);
      logInfo(`new RectBox(-100, -100, -100, 50): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, 50): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, 50): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, 50): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(50);
      logInfo(`${BUNDLE}RectBoxCtor_0026 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0027
     * @tc.name      TsDrawingSample_RectBoxCtor_0027
     * @tc.desc      new RectBox(-100, -100, -100, 100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0027 begin`);
      const subject: RectBox = new RectBox(-100, -100, -100, 100);
      logInfo(`new RectBox(-100, -100, -100, 100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, 100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, 100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, 100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(100);
      logInfo(`${BUNDLE}RectBoxCtor_0027 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0028
     * @tc.name      TsDrawingSample_RectBoxCtor_0028
     * @tc.desc      new RectBox(-100, -100, -100, 2) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0028 begin`);
      const subject: RectBox = new RectBox(-100, -100, -100, 2);
      logInfo(`new RectBox(-100, -100, -100, 2): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, 2): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, 2): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, 2): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(2);
      logInfo(`${BUNDLE}RectBoxCtor_0028 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0029
     * @tc.name      TsDrawingSample_RectBoxCtor_0029
     * @tc.desc      new RectBox(-100, -100, -100, 3) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0029 begin`);
      const subject: RectBox = new RectBox(-100, -100, -100, 3);
      logInfo(`new RectBox(-100, -100, -100, 3): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, 3): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, 3): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, -100, 3): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(3);
      logInfo(`${BUNDLE}RectBoxCtor_0029 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0030
     * @tc.name      TsDrawingSample_RectBoxCtor_0030
     * @tc.desc      new RectBox(3, 100, -100, 100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0030 begin`);
      const subject: RectBox = new RectBox(3, 100, -100, 100);
      logInfo(`new RectBox(3, 100, -100, 100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(3);
      logInfo(`new RectBox(3, 100, -100, 100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(100);
      logInfo(`new RectBox(3, 100, -100, 100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(3, 100, -100, 100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(100);
      logInfo(`${BUNDLE}RectBoxCtor_0030 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0031
     * @tc.name      TsDrawingSample_RectBoxCtor_0031
     * @tc.desc      new RectBox(-1, -1, 100, 3) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0031 begin`);
      const subject: RectBox = new RectBox(-1, -1, 100, 3);
      logInfo(`new RectBox(-1, -1, 100, 3): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-1);
      logInfo(`new RectBox(-1, -1, 100, 3): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-1);
      logInfo(`new RectBox(-1, -1, 100, 3): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(100);
      logInfo(`new RectBox(-1, -1, 100, 3): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(3);
      logInfo(`${BUNDLE}RectBoxCtor_0031 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0032
     * @tc.name      TsDrawingSample_RectBoxCtor_0032
     * @tc.desc      new RectBox(100, 100, -100, 100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0032 begin`);
      const subject: RectBox = new RectBox(100, 100, -100, 100);
      logInfo(`new RectBox(100, 100, -100, 100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(100);
      logInfo(`new RectBox(100, 100, -100, 100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(100);
      logInfo(`new RectBox(100, 100, -100, 100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(100, 100, -100, 100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(100);
      logInfo(`${BUNDLE}RectBoxCtor_0032 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0033
     * @tc.name      TsDrawingSample_RectBoxCtor_0033
     * @tc.desc      new RectBox(-1, -1, 0, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0033 begin`);
      const subject: RectBox = new RectBox(-1, -1, 0, 1);
      logInfo(`new RectBox(-1, -1, 0, 1): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-1);
      logInfo(`new RectBox(-1, -1, 0, 1): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-1);
      logInfo(`new RectBox(-1, -1, 0, 1): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(0);
      logInfo(`new RectBox(-1, -1, 0, 1): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(1);
      logInfo(`${BUNDLE}RectBoxCtor_0033 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0034
     * @tc.name      TsDrawingSample_RectBoxCtor_0034
     * @tc.desc      new RectBox(0, 2, 0, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0034 begin`);
      const subject: RectBox = new RectBox(0, 2, 0, 0);
      logInfo(`new RectBox(0, 2, 0, 0): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(0);
      logInfo(`new RectBox(0, 2, 0, 0): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(2);
      logInfo(`new RectBox(0, 2, 0, 0): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(0);
      logInfo(`new RectBox(0, 2, 0, 0): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(0);
      logInfo(`${BUNDLE}RectBoxCtor_0034 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0035
     * @tc.name      TsDrawingSample_RectBoxCtor_0035
     * @tc.desc      new RectBox(100, 50, 50, 50) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0035 begin`);
      const subject: RectBox = new RectBox(100, 50, 50, 50);
      logInfo(`new RectBox(100, 50, 50, 50): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(100);
      logInfo(`new RectBox(100, 50, 50, 50): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(50);
      logInfo(`new RectBox(100, 50, 50, 50): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(50);
      logInfo(`new RectBox(100, 50, 50, 50): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(50);
      logInfo(`${BUNDLE}RectBoxCtor_0035 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0036
     * @tc.name      TsDrawingSample_RectBoxCtor_0036
     * @tc.desc      new RectBox(50, 3, 1, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0036 begin`);
      const subject: RectBox = new RectBox(50, 3, 1, -100);
      logInfo(`new RectBox(50, 3, 1, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(50);
      logInfo(`new RectBox(50, 3, 1, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(3);
      logInfo(`new RectBox(50, 3, 1, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(1);
      logInfo(`new RectBox(50, 3, 1, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0036 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0037
     * @tc.name      TsDrawingSample_RectBoxCtor_0037
     * @tc.desc      new RectBox(-100, 0, 3, 100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0037 begin`);
      const subject: RectBox = new RectBox(-100, 0, 3, 100);
      logInfo(`new RectBox(-100, 0, 3, 100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, 0, 3, 100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(0);
      logInfo(`new RectBox(-100, 0, 3, 100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(3);
      logInfo(`new RectBox(-100, 0, 3, 100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(100);
      logInfo(`${BUNDLE}RectBoxCtor_0037 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0038
     * @tc.name      TsDrawingSample_RectBoxCtor_0038
     * @tc.desc      new RectBox(-100, -100, 1, 50) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0038 begin`);
      const subject: RectBox = new RectBox(-100, -100, 1, 50);
      logInfo(`new RectBox(-100, -100, 1, 50): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, 1, 50): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(-100, -100, 1, 50): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(1);
      logInfo(`new RectBox(-100, -100, 1, 50): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(50);
      logInfo(`${BUNDLE}RectBoxCtor_0038 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0039
     * @tc.name      TsDrawingSample_RectBoxCtor_0039
     * @tc.desc      new RectBox(3, 50, -100, 3) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0039 begin`);
      const subject: RectBox = new RectBox(3, 50, -100, 3);
      logInfo(`new RectBox(3, 50, -100, 3): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(3);
      logInfo(`new RectBox(3, 50, -100, 3): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(50);
      logInfo(`new RectBox(3, 50, -100, 3): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(3, 50, -100, 3): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(3);
      logInfo(`${BUNDLE}RectBoxCtor_0039 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0040
     * @tc.name      TsDrawingSample_RectBoxCtor_0040
     * @tc.desc      new RectBox(3, 1, -1, -100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0040 begin`);
      const subject: RectBox = new RectBox(3, 1, -1, -100);
      logInfo(`new RectBox(3, 1, -1, -100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(3);
      logInfo(`new RectBox(3, 1, -1, -100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(1);
      logInfo(`new RectBox(3, 1, -1, -100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-1);
      logInfo(`new RectBox(3, 1, -1, -100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-100);
      logInfo(`${BUNDLE}RectBoxCtor_0040 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0041
     * @tc.name      TsDrawingSample_RectBoxCtor_0041
     * @tc.desc      new RectBox(3, 2, 3, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0041 begin`);
      const subject: RectBox = new RectBox(3, 2, 3, -1);
      logInfo(`new RectBox(3, 2, 3, -1): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(3);
      logInfo(`new RectBox(3, 2, 3, -1): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(2);
      logInfo(`new RectBox(3, 2, 3, -1): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(3);
      logInfo(`new RectBox(3, 2, 3, -1): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-1);
      logInfo(`${BUNDLE}RectBoxCtor_0041 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0042
     * @tc.name      TsDrawingSample_RectBoxCtor_0042
     * @tc.desc      new RectBox(0, 3, -100, 3) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0042 begin`);
      const subject: RectBox = new RectBox(0, 3, -100, 3);
      logInfo(`new RectBox(0, 3, -100, 3): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(0);
      logInfo(`new RectBox(0, 3, -100, 3): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(3);
      logInfo(`new RectBox(0, 3, -100, 3): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(0, 3, -100, 3): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(3);
      logInfo(`${BUNDLE}RectBoxCtor_0042 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0043
     * @tc.name      TsDrawingSample_RectBoxCtor_0043
     * @tc.desc      new RectBox(0, 3, 100, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0043 begin`);
      const subject: RectBox = new RectBox(0, 3, 100, 1);
      logInfo(`new RectBox(0, 3, 100, 1): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(0);
      logInfo(`new RectBox(0, 3, 100, 1): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(3);
      logInfo(`new RectBox(0, 3, 100, 1): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(100);
      logInfo(`new RectBox(0, 3, 100, 1): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(1);
      logInfo(`${BUNDLE}RectBoxCtor_0043 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0044
     * @tc.name      TsDrawingSample_RectBoxCtor_0044
     * @tc.desc      new RectBox(-1, 0, -1, 2) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0044 begin`);
      const subject: RectBox = new RectBox(-1, 0, -1, 2);
      logInfo(`new RectBox(-1, 0, -1, 2): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-1);
      logInfo(`new RectBox(-1, 0, -1, 2): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(0);
      logInfo(`new RectBox(-1, 0, -1, 2): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-1);
      logInfo(`new RectBox(-1, 0, -1, 2): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(2);
      logInfo(`${BUNDLE}RectBoxCtor_0044 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0045
     * @tc.name      TsDrawingSample_RectBoxCtor_0045
     * @tc.desc      new RectBox(100, 1, -1, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0045 begin`);
      const subject: RectBox = new RectBox(100, 1, -1, 1);
      logInfo(`new RectBox(100, 1, -1, 1): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(100);
      logInfo(`new RectBox(100, 1, -1, 1): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(1);
      logInfo(`new RectBox(100, 1, -1, 1): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-1);
      logInfo(`new RectBox(100, 1, -1, 1): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(1);
      logInfo(`${BUNDLE}RectBoxCtor_0045 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0046
     * @tc.name      TsDrawingSample_RectBoxCtor_0046
     * @tc.desc      new RectBox(-100, 50, 3, 50) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0046 begin`);
      const subject: RectBox = new RectBox(-100, 50, 3, 50);
      logInfo(`new RectBox(-100, 50, 3, 50): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, 50, 3, 50): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(50);
      logInfo(`new RectBox(-100, 50, 3, 50): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(3);
      logInfo(`new RectBox(-100, 50, 3, 50): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(50);
      logInfo(`${BUNDLE}RectBoxCtor_0046 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0047
     * @tc.name      TsDrawingSample_RectBoxCtor_0047
     * @tc.desc      new RectBox(50, 0, -100, 2) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0047 begin`);
      const subject: RectBox = new RectBox(50, 0, -100, 2);
      logInfo(`new RectBox(50, 0, -100, 2): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(50);
      logInfo(`new RectBox(50, 0, -100, 2): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(0);
      logInfo(`new RectBox(50, 0, -100, 2): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(50, 0, -100, 2): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(2);
      logInfo(`${BUNDLE}RectBoxCtor_0047 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0048
     * @tc.name      TsDrawingSample_RectBoxCtor_0048
     * @tc.desc      new RectBox(50, 1, 0, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0048 begin`);
      const subject: RectBox = new RectBox(50, 1, 0, 0);
      logInfo(`new RectBox(50, 1, 0, 0): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(50);
      logInfo(`new RectBox(50, 1, 0, 0): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(1);
      logInfo(`new RectBox(50, 1, 0, 0): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(0);
      logInfo(`new RectBox(50, 1, 0, 0): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(0);
      logInfo(`${BUNDLE}RectBoxCtor_0048 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0049
     * @tc.name      TsDrawingSample_RectBoxCtor_0049
     * @tc.desc      new RectBox(-100, -1, 2, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0049 begin`);
      const subject: RectBox = new RectBox(-100, -1, 2, 0);
      logInfo(`new RectBox(-100, -1, 2, 0): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, -1, 2, 0): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-1);
      logInfo(`new RectBox(-100, -1, 2, 0): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(2);
      logInfo(`new RectBox(-100, -1, 2, 0): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(0);
      logInfo(`${BUNDLE}RectBoxCtor_0049 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0050
     * @tc.name      TsDrawingSample_RectBoxCtor_0050
     * @tc.desc      new RectBox(-100, 100, 3, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0050 begin`);
      const subject: RectBox = new RectBox(-100, 100, 3, 1);
      logInfo(`new RectBox(-100, 100, 3, 1): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, 100, 3, 1): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(100);
      logInfo(`new RectBox(-100, 100, 3, 1): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(3);
      logInfo(`new RectBox(-100, 100, 3, 1): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(1);
      logInfo(`${BUNDLE}RectBoxCtor_0050 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0051
     * @tc.name      TsDrawingSample_RectBoxCtor_0051
     * @tc.desc      new RectBox(50, 0, 3, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0051 begin`);
      const subject: RectBox = new RectBox(50, 0, 3, 1);
      logInfo(`new RectBox(50, 0, 3, 1): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(50);
      logInfo(`new RectBox(50, 0, 3, 1): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(0);
      logInfo(`new RectBox(50, 0, 3, 1): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(3);
      logInfo(`new RectBox(50, 0, 3, 1): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(1);
      logInfo(`${BUNDLE}RectBoxCtor_0051 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0052
     * @tc.name      TsDrawingSample_RectBoxCtor_0052
     * @tc.desc      new RectBox(-100, 1, 1, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0052 begin`);
      const subject: RectBox = new RectBox(-100, 1, 1, -1);
      logInfo(`new RectBox(-100, 1, 1, -1): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, 1, 1, -1): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(1);
      logInfo(`new RectBox(-100, 1, 1, -1): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(1);
      logInfo(`new RectBox(-100, 1, 1, -1): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-1);
      logInfo(`${BUNDLE}RectBoxCtor_0052 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0053
     * @tc.name      TsDrawingSample_RectBoxCtor_0053
     * @tc.desc      new RectBox(50, 50, -100, 2) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0053 begin`);
      const subject: RectBox = new RectBox(50, 50, -100, 2);
      logInfo(`new RectBox(50, 50, -100, 2): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(50);
      logInfo(`new RectBox(50, 50, -100, 2): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(50);
      logInfo(`new RectBox(50, 50, -100, 2): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(50, 50, -100, 2): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(2);
      logInfo(`${BUNDLE}RectBoxCtor_0053 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0054
     * @tc.name      TsDrawingSample_RectBoxCtor_0054
     * @tc.desc      new RectBox(0, 2, 1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0054 begin`);
      const subject: RectBox = new RectBox(0, 2, 1, 0);
      logInfo(`new RectBox(0, 2, 1, 0): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(0);
      logInfo(`new RectBox(0, 2, 1, 0): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(2);
      logInfo(`new RectBox(0, 2, 1, 0): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(1);
      logInfo(`new RectBox(0, 2, 1, 0): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(0);
      logInfo(`${BUNDLE}RectBoxCtor_0054 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0055
     * @tc.name      TsDrawingSample_RectBoxCtor_0055
     * @tc.desc      new RectBox(3, -1, 50, 50) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0055 begin`);
      const subject: RectBox = new RectBox(3, -1, 50, 50);
      logInfo(`new RectBox(3, -1, 50, 50): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(3);
      logInfo(`new RectBox(3, -1, 50, 50): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-1);
      logInfo(`new RectBox(3, -1, 50, 50): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(50);
      logInfo(`new RectBox(3, -1, 50, 50): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(50);
      logInfo(`${BUNDLE}RectBoxCtor_0055 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0056
     * @tc.name      TsDrawingSample_RectBoxCtor_0056
     * @tc.desc      new RectBox(3, 50, 0, 50) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0056 begin`);
      const subject: RectBox = new RectBox(3, 50, 0, 50);
      logInfo(`new RectBox(3, 50, 0, 50): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(3);
      logInfo(`new RectBox(3, 50, 0, 50): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(50);
      logInfo(`new RectBox(3, 50, 0, 50): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(0);
      logInfo(`new RectBox(3, 50, 0, 50): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(50);
      logInfo(`${BUNDLE}RectBoxCtor_0056 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0057
     * @tc.name      TsDrawingSample_RectBoxCtor_0057
     * @tc.desc      new RectBox(100, 2, 2, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0057 begin`);
      const subject: RectBox = new RectBox(100, 2, 2, 1);
      logInfo(`new RectBox(100, 2, 2, 1): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(100);
      logInfo(`new RectBox(100, 2, 2, 1): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(2);
      logInfo(`new RectBox(100, 2, 2, 1): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(2);
      logInfo(`new RectBox(100, 2, 2, 1): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(1);
      logInfo(`${BUNDLE}RectBoxCtor_0057 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0058
     * @tc.name      TsDrawingSample_RectBoxCtor_0058
     * @tc.desc      new RectBox(3, -100, 2, 100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0058 begin`);
      const subject: RectBox = new RectBox(3, -100, 2, 100);
      logInfo(`new RectBox(3, -100, 2, 100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(3);
      logInfo(`new RectBox(3, -100, 2, 100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(3, -100, 2, 100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(2);
      logInfo(`new RectBox(3, -100, 2, 100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(100);
      logInfo(`${BUNDLE}RectBoxCtor_0058 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0059
     * @tc.name      TsDrawingSample_RectBoxCtor_0059
     * @tc.desc      new RectBox(-1, 3, -1, 3) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0059 begin`);
      const subject: RectBox = new RectBox(-1, 3, -1, 3);
      logInfo(`new RectBox(-1, 3, -1, 3): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-1);
      logInfo(`new RectBox(-1, 3, -1, 3): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(3);
      logInfo(`new RectBox(-1, 3, -1, 3): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-1);
      logInfo(`new RectBox(-1, 3, -1, 3): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(3);
      logInfo(`${BUNDLE}RectBoxCtor_0059 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0060
     * @tc.name      TsDrawingSample_RectBoxCtor_0060
     * @tc.desc      new RectBox(2, 100, 2, 50) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0060 begin`);
      const subject: RectBox = new RectBox(2, 100, 2, 50);
      logInfo(`new RectBox(2, 100, 2, 50): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(2);
      logInfo(`new RectBox(2, 100, 2, 50): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(100);
      logInfo(`new RectBox(2, 100, 2, 50): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(2);
      logInfo(`new RectBox(2, 100, 2, 50): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(50);
      logInfo(`${BUNDLE}RectBoxCtor_0060 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0061
     * @tc.name      TsDrawingSample_RectBoxCtor_0061
     * @tc.desc      new RectBox(1, 0, 1, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0061 begin`);
      const subject: RectBox = new RectBox(1, 0, 1, -1);
      logInfo(`new RectBox(1, 0, 1, -1): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(1);
      logInfo(`new RectBox(1, 0, 1, -1): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(0);
      logInfo(`new RectBox(1, 0, 1, -1): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(1);
      logInfo(`new RectBox(1, 0, 1, -1): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-1);
      logInfo(`${BUNDLE}RectBoxCtor_0061 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0062
     * @tc.name      TsDrawingSample_RectBoxCtor_0062
     * @tc.desc      new RectBox(2, -1, -1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0062 begin`);
      const subject: RectBox = new RectBox(2, -1, -1, 0);
      logInfo(`new RectBox(2, -1, -1, 0): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(2);
      logInfo(`new RectBox(2, -1, -1, 0): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-1);
      logInfo(`new RectBox(2, -1, -1, 0): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-1);
      logInfo(`new RectBox(2, -1, -1, 0): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(0);
      logInfo(`${BUNDLE}RectBoxCtor_0062 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0063
     * @tc.name      TsDrawingSample_RectBoxCtor_0063
     * @tc.desc      new RectBox(-100, 50, -100, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0063 begin`);
      const subject: RectBox = new RectBox(-100, 50, -100, 0);
      logInfo(`new RectBox(-100, 50, -100, 0): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, 50, -100, 0): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(50);
      logInfo(`new RectBox(-100, 50, -100, 0): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(-100, 50, -100, 0): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(0);
      logInfo(`${BUNDLE}RectBoxCtor_0063 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0064
     * @tc.name      TsDrawingSample_RectBoxCtor_0064
     * @tc.desc      new RectBox(0, 100, 0, 100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0064 begin`);
      const subject: RectBox = new RectBox(0, 100, 0, 100);
      logInfo(`new RectBox(0, 100, 0, 100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(0);
      logInfo(`new RectBox(0, 100, 0, 100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(100);
      logInfo(`new RectBox(0, 100, 0, 100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(0);
      logInfo(`new RectBox(0, 100, 0, 100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(100);
      logInfo(`${BUNDLE}RectBoxCtor_0064 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0065
     * @tc.name      TsDrawingSample_RectBoxCtor_0065
     * @tc.desc      new RectBox(0, -100, 0, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0065 begin`);
      const subject: RectBox = new RectBox(0, -100, 0, 1);
      logInfo(`new RectBox(0, -100, 0, 1): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(0);
      logInfo(`new RectBox(0, -100, 0, 1): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(0, -100, 0, 1): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(0);
      logInfo(`new RectBox(0, -100, 0, 1): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(1);
      logInfo(`${BUNDLE}RectBoxCtor_0065 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0066
     * @tc.name      TsDrawingSample_RectBoxCtor_0066
     * @tc.desc      new RectBox(2, 3, 50, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0066 begin`);
      const subject: RectBox = new RectBox(2, 3, 50, -1);
      logInfo(`new RectBox(2, 3, 50, -1): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(2);
      logInfo(`new RectBox(2, 3, 50, -1): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(3);
      logInfo(`new RectBox(2, 3, 50, -1): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(50);
      logInfo(`new RectBox(2, 3, 50, -1): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(-1);
      logInfo(`${BUNDLE}RectBoxCtor_0066 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0067
     * @tc.name      TsDrawingSample_RectBoxCtor_0067
     * @tc.desc      new RectBox(50, 2, -1, 2) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0067 begin`);
      const subject: RectBox = new RectBox(50, 2, -1, 2);
      logInfo(`new RectBox(50, 2, -1, 2): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(50);
      logInfo(`new RectBox(50, 2, -1, 2): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(2);
      logInfo(`new RectBox(50, 2, -1, 2): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-1);
      logInfo(`new RectBox(50, 2, -1, 2): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(2);
      logInfo(`${BUNDLE}RectBoxCtor_0067 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0068
     * @tc.name      TsDrawingSample_RectBoxCtor_0068
     * @tc.desc      new RectBox(-100, 1, 3, 3) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0068 begin`);
      const subject: RectBox = new RectBox(-100, 1, 3, 3);
      logInfo(`new RectBox(-100, 1, 3, 3): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, 1, 3, 3): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(1);
      logInfo(`new RectBox(-100, 1, 3, 3): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(3);
      logInfo(`new RectBox(-100, 1, 3, 3): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(3);
      logInfo(`${BUNDLE}RectBoxCtor_0068 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0069
     * @tc.name      TsDrawingSample_RectBoxCtor_0069
     * @tc.desc      new RectBox(-100, 2, 2, 100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0069 begin`);
      const subject: RectBox = new RectBox(-100, 2, 2, 100);
      logInfo(`new RectBox(-100, 2, 2, 100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(-100);
      logInfo(`new RectBox(-100, 2, 2, 100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(2);
      logInfo(`new RectBox(-100, 2, 2, 100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(2);
      logInfo(`new RectBox(-100, 2, 2, 100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(100);
      logInfo(`${BUNDLE}RectBoxCtor_0069 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0070
     * @tc.name      TsDrawingSample_RectBoxCtor_0070
     * @tc.desc      new RectBox(1, 50, 1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0070 begin`);
      const subject: RectBox = new RectBox(1, 50, 1, 0);
      logInfo(`new RectBox(1, 50, 1, 0): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(1);
      logInfo(`new RectBox(1, 50, 1, 0): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(50);
      logInfo(`new RectBox(1, 50, 1, 0): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(1);
      logInfo(`new RectBox(1, 50, 1, 0): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(0);
      logInfo(`${BUNDLE}RectBoxCtor_0070 end`);
    });
  });
}
