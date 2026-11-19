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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { swiperTranslateOf } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for swiperTranslateOf (49 cases). */
export default function swiperTranslateOfTest(): void {
  describe('SwiperTranslateOfTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0001
     * @tc.name      ComponentCollection_SwiperTranslateOf_0001
     * @tc.desc      swiperTranslateOf(position=0, index=0, mainAxisLength=0, closeTogether=true, cancelDefault=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_SwiperTranslateOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0001 begin`);
      const actual: number = swiperTranslateOf(0, 0, 0, true, true);
      logInfo(`swiperTranslateOf(position=0, index=0, ma...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperTranslateOf_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0002
     * @tc.name      ComponentCollection_SwiperTranslateOf_0002
     * @tc.desc      swiperTranslateOf(position=0, index=-1, mainAxisLength=5, closeTogether=true, cancelDefault=true...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_SwiperTranslateOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0002 begin`);
      const actual: number = swiperTranslateOf(0, -1, 5, true, true);
      logInfo(`swiperTranslateOf(position=0, index=-1, m...: actual=${actual}`);
      expect(actual).assertClose(-5.3125, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0003
     * @tc.name      ComponentCollection_SwiperTranslateOf_0003
     * @tc.desc      swiperTranslateOf(position=1, index=10, mainAxisLength=-1, closeTogether=false, cancelDefault=tr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0003 begin`);
      const actual: number = swiperTranslateOf(1, 10, -1, false, true);
      logInfo(`swiperTranslateOf(position=1, index=10, m...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperTranslateOf_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0004
     * @tc.name      ComponentCollection_SwiperTranslateOf_0004
     * @tc.desc      swiperTranslateOf(position=1, index=10, mainAxisLength=3, closeTogether=true, cancelDefault=true...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0004 begin`);
      const actual: number = swiperTranslateOf(1, 10, 3, true, true);
      logInfo(`swiperTranslateOf(position=1, index=10, m...: actual=${actual}`);
      expect(actual).assertClose(-2.8125, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0005
     * @tc.name      ComponentCollection_SwiperTranslateOf_0005
     * @tc.desc      swiperTranslateOf(position=1, index=100, mainAxisLength=2, closeTogether=false, cancelDefault=tr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0005 begin`);
      const actual: number = swiperTranslateOf(1, 100, 2, false, true);
      logInfo(`swiperTranslateOf(position=1, index=100, ...: actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}SwiperTranslateOf_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0006
     * @tc.name      ComponentCollection_SwiperTranslateOf_0006
     * @tc.desc      swiperTranslateOf(position=1, index=10, mainAxisLength=-1, closeTogether=true, cancelDefault=tru...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0006 begin`);
      const actual: number = swiperTranslateOf(1, 10, -1, true, true);
      logInfo(`swiperTranslateOf(position=1, index=10, m...: actual=${actual}`);
      expect(actual).assertClose(0.9375, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0007
     * @tc.name      ComponentCollection_SwiperTranslateOf_0007
     * @tc.desc      swiperTranslateOf(position=1, index=100, mainAxisLength=3, closeTogether=true, cancelDefault=fal...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0007 begin`);
      const actual: number = swiperTranslateOf(1, 100, 3, true, false);
      logInfo(`swiperTranslateOf(position=1, index=100, ...: actual=${actual}`);
      expect(actual).assertClose(0.1875, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0008
     * @tc.name      ComponentCollection_SwiperTranslateOf_0008
     * @tc.desc      swiperTranslateOf(position=2, index=1, mainAxisLength=3, closeTogether=true, cancelDefault=false...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0008 begin`);
      const actual: number = swiperTranslateOf(2, 1, 3, true, false);
      logInfo(`swiperTranslateOf(position=2, index=1, ma...: actual=${actual}`);
      expect(actual).assertClose(-0.1875, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0009
     * @tc.name      ComponentCollection_SwiperTranslateOf_0009
     * @tc.desc      swiperTranslateOf(position=2, index=5, mainAxisLength=2, closeTogether=true, cancelDefault=false...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0009 begin`);
      const actual: number = swiperTranslateOf(2, 5, 2, true, false);
      logInfo(`swiperTranslateOf(position=2, index=5, ma...: actual=${actual}`);
      expect(actual).assertClose(-0.125, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0010
     * @tc.name      ComponentCollection_SwiperTranslateOf_0010
     * @tc.desc      swiperTranslateOf(position=2, index=3, mainAxisLength=-1, closeTogether=true, cancelDefault=fals...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0010 begin`);
      const actual: number = swiperTranslateOf(2, 3, -1, true, false);
      logInfo(`swiperTranslateOf(position=2, index=3, ma...: actual=${actual}`);
      expect(actual).assertClose(0.0625, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0011
     * @tc.name      ComponentCollection_SwiperTranslateOf_0011
     * @tc.desc      swiperTranslateOf(position=2, index=3, mainAxisLength=1, closeTogether=false, cancelDefault=true...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0011 begin`);
      const actual: number = swiperTranslateOf(2, 3, 1, false, true);
      logInfo(`swiperTranslateOf(position=2, index=3, ma...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}SwiperTranslateOf_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0012
     * @tc.name      ComponentCollection_SwiperTranslateOf_0012
     * @tc.desc      swiperTranslateOf(position=0, index=-1, mainAxisLength=5, closeTogether=false, cancelDefault=tru...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0012 begin`);
      const actual: number = swiperTranslateOf(0, -1, 5, false, true);
      logInfo(`swiperTranslateOf(position=0, index=-1, m...: actual=${actual}`);
      expect(actual).assertEqual(-5);
      logInfo(`${BUNDLE}SwiperTranslateOf_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0013
     * @tc.name      ComponentCollection_SwiperTranslateOf_0013
     * @tc.desc      swiperTranslateOf(position=1, index=2, mainAxisLength=5, closeTogether=true, cancelDefault=false...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0013 begin`);
      const actual: number = swiperTranslateOf(1, 2, 5, true, false);
      logInfo(`swiperTranslateOf(position=1, index=2, ma...: actual=${actual}`);
      expect(actual).assertClose(0.3125, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0014
     * @tc.name      ComponentCollection_SwiperTranslateOf_0014
     * @tc.desc      swiperTranslateOf(position=2, index=5, mainAxisLength=10, closeTogether=true, cancelDefault=true...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0014 begin`);
      const actual: number = swiperTranslateOf(2, 5, 10, true, true);
      logInfo(`swiperTranslateOf(position=2, index=5, ma...: actual=${actual}`);
      expect(actual).assertClose(-10.625, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0015
     * @tc.name      ComponentCollection_SwiperTranslateOf_0015
     * @tc.desc      swiperTranslateOf(position=0, index=-1, mainAxisLength=100, closeTogether=true, cancelDefault=fa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0015 begin`);
      const actual: number = swiperTranslateOf(0, -1, 100, true, false);
      logInfo(`swiperTranslateOf(position=0, index=-1, m...: actual=${actual}`);
      expect(actual).assertClose(-6.25, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0016
     * @tc.name      ComponentCollection_SwiperTranslateOf_0016
     * @tc.desc      swiperTranslateOf(position=0, index=-1, mainAxisLength=100, closeTogether=true, cancelDefault=tr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0016 begin`);
      const actual: number = swiperTranslateOf(0, -1, 100, true, true);
      logInfo(`swiperTranslateOf(position=0, index=-1, m...: actual=${actual}`);
      expect(actual).assertClose(-106.25, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0017
     * @tc.name      ComponentCollection_SwiperTranslateOf_0017
     * @tc.desc      swiperTranslateOf(position=1, index=100, mainAxisLength=2, closeTogether=true, cancelDefault=tru...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0017 begin`);
      const actual: number = swiperTranslateOf(1, 100, 2, true, true);
      logInfo(`swiperTranslateOf(position=1, index=100, ...: actual=${actual}`);
      expect(actual).assertClose(-1.875, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0018
     * @tc.name      ComponentCollection_SwiperTranslateOf_0018
     * @tc.desc      swiperTranslateOf(position=1, index=0, mainAxisLength=10, closeTogether=false, cancelDefault=tru...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperTranslateOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0018 begin`);
      const actual: number = swiperTranslateOf(1, 0, 10, false, true);
      logInfo(`swiperTranslateOf(position=1, index=0, ma...: actual=${actual}`);
      expect(actual).assertEqual(-10);
      logInfo(`${BUNDLE}SwiperTranslateOf_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0019
     * @tc.name      ComponentCollection_SwiperTranslateOf_0019
     * @tc.desc      swiperTranslateOf(position=2, index=1, mainAxisLength=-1, closeTogether=true, cancelDefault=true...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0019 begin`);
      const actual: number = swiperTranslateOf(2, 1, -1, true, true);
      logInfo(`swiperTranslateOf(position=2, index=1, ma...: actual=${actual}`);
      expect(actual).assertClose(1.0625, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0020
     * @tc.name      ComponentCollection_SwiperTranslateOf_0020
     * @tc.desc      swiperTranslateOf(position=1, index=0, mainAxisLength=1, closeTogether=true, cancelDefault=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperTranslateOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0020 begin`);
      const actual: number = swiperTranslateOf(1, 0, 1, true, true);
      logInfo(`swiperTranslateOf(position=1, index=0, ma...: actual=${actual}`);
      expect(actual).assertClose(-0.9375, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0021
     * @tc.name      ComponentCollection_SwiperTranslateOf_0021
     * @tc.desc      swiperTranslateOf(position=2, index=1, mainAxisLength=2, closeTogether=true, cancelDefault=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0021 begin`);
      const actual: number = swiperTranslateOf(2, 1, 2, true, true);
      logInfo(`swiperTranslateOf(position=2, index=1, ma...: actual=${actual}`);
      expect(actual).assertClose(-2.125, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0022
     * @tc.name      ComponentCollection_SwiperTranslateOf_0022
     * @tc.desc      swiperTranslateOf(position=2, index=3, mainAxisLength=5, closeTogether=true, cancelDefault=false...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0022 begin`);
      const actual: number = swiperTranslateOf(2, 3, 5, true, false);
      logInfo(`swiperTranslateOf(position=2, index=3, ma...: actual=${actual}`);
      expect(actual).assertClose(-0.3125, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0023
     * @tc.name      ComponentCollection_SwiperTranslateOf_0023
     * @tc.desc      swiperTranslateOf(position=2, index=1, mainAxisLength=100, closeTogether=false, cancelDefault=tr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0023 begin`);
      const actual: number = swiperTranslateOf(2, 1, 100, false, true);
      logInfo(`swiperTranslateOf(position=2, index=1, ma...: actual=${actual}`);
      expect(actual).assertEqual(-100);
      logInfo(`${BUNDLE}SwiperTranslateOf_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0024
     * @tc.name      ComponentCollection_SwiperTranslateOf_0024
     * @tc.desc      swiperTranslateOf(position=1, index=100, mainAxisLength=10, closeTogether=true, cancelDefault=fa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperTranslateOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0024 begin`);
      const actual: number = swiperTranslateOf(1, 100, 10, true, false);
      logInfo(`swiperTranslateOf(position=1, index=100, ...: actual=${actual}`);
      expect(actual).assertClose(0.625, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0025
     * @tc.name      ComponentCollection_SwiperTranslateOf_0025
     * @tc.desc      swiperTranslateOf(position=2, index=1, mainAxisLength=1, closeTogether=true, cancelDefault=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0025 begin`);
      const actual: number = swiperTranslateOf(2, 1, 1, true, true);
      logInfo(`swiperTranslateOf(position=2, index=1, ma...: actual=${actual}`);
      expect(actual).assertClose(-1.0625, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0026
     * @tc.name      ComponentCollection_SwiperTranslateOf_0026
     * @tc.desc      swiperTranslateOf(position=1, index=0, mainAxisLength=3, closeTogether=false, cancelDefault=true...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0026 begin`);
      const actual: number = swiperTranslateOf(1, 0, 3, false, true);
      logInfo(`swiperTranslateOf(position=1, index=0, ma...: actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}SwiperTranslateOf_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0027
     * @tc.name      ComponentCollection_SwiperTranslateOf_0027
     * @tc.desc      swiperTranslateOf(position=1, index=10, mainAxisLength=100, closeTogether=true, cancelDefault=tr...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperTranslateOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0027 begin`);
      const actual: number = swiperTranslateOf(1, 10, 100, true, true);
      logInfo(`swiperTranslateOf(position=1, index=10, m...: actual=${actual}`);
      expect(actual).assertClose(-93.75, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0028
     * @tc.name      ComponentCollection_SwiperTranslateOf_0028
     * @tc.desc      swiperTranslateOf(position=0, index=-1, mainAxisLength=1, closeTogether=true, cancelDefault=fals...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0028 begin`);
      const actual: number = swiperTranslateOf(0, -1, 1, true, false);
      logInfo(`swiperTranslateOf(position=0, index=-1, m...: actual=${actual}`);
      expect(actual).assertClose(-0.0625, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0029
     * @tc.name      ComponentCollection_SwiperTranslateOf_0029
     * @tc.desc      swiperTranslateOf(position=1, index=2, mainAxisLength=5, closeTogether=true, cancelDefault=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0029 begin`);
      const actual: number = swiperTranslateOf(1, 2, 5, true, true);
      logInfo(`swiperTranslateOf(position=1, index=2, ma...: actual=${actual}`);
      expect(actual).assertClose(-4.6875, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0030
     * @tc.name      ComponentCollection_SwiperTranslateOf_0030
     * @tc.desc      swiperTranslateOf(position=1, index=2, mainAxisLength=10, closeTogether=true, cancelDefault=true...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0030 begin`);
      const actual: number = swiperTranslateOf(1, 2, 10, true, true);
      logInfo(`swiperTranslateOf(position=1, index=2, ma...: actual=${actual}`);
      expect(actual).assertClose(-9.375, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0031
     * @tc.name      ComponentCollection_SwiperTranslateOf_0031
     * @tc.desc      swiperTranslateOf(position=1, index=0, mainAxisLength=100, closeTogether=true, cancelDefault=fal...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperTranslateOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0031 begin`);
      const actual: number = swiperTranslateOf(1, 0, 100, true, false);
      logInfo(`swiperTranslateOf(position=1, index=0, ma...: actual=${actual}`);
      expect(actual).assertClose(6.25, PRECISION);
      logInfo(`${BUNDLE}SwiperTranslateOf_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0032
     * @tc.name      ComponentCollection_SwiperTranslateOf_0032
     * @tc.desc      swiperTranslateOf(position=1, index=0, mainAxisLength=0, closeTogether=true, cancelDefault=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperTranslateOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0032 begin`);
      const actual: number = swiperTranslateOf(1, 0, 0, true, true);
      logInfo(`swiperTranslateOf(position=1, index=0, ma...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperTranslateOf_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0033
     * @tc.name      ComponentCollection_SwiperTranslateOf_0033
     * @tc.desc      swiperTranslateOf(position=-1, index=0, mainAxisLength=0, closeTogether=true, cancelDefault=true...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0033 begin`);
      const actual: number = swiperTranslateOf(-1, 0, 0, true, true);
      logInfo(`swiperTranslateOf(position=-1, index=0, m...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperTranslateOf_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0034
     * @tc.name      ComponentCollection_SwiperTranslateOf_0034
     * @tc.desc      swiperTranslateOf(position=2, index=0, mainAxisLength=0, closeTogether=true, cancelDefault=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0034 begin`);
      const actual: number = swiperTranslateOf(2, 0, 0, true, true);
      logInfo(`swiperTranslateOf(position=2, index=0, ma...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperTranslateOf_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0035
     * @tc.name      ComponentCollection_SwiperTranslateOf_0035
     * @tc.desc      swiperTranslateOf(position=3, index=0, mainAxisLength=0, closeTogether=true, cancelDefault=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0035 begin`);
      const actual: number = swiperTranslateOf(3, 0, 0, true, true);
      logInfo(`swiperTranslateOf(position=3, index=0, ma...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperTranslateOf_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0036
     * @tc.name      ComponentCollection_SwiperTranslateOf_0036
     * @tc.desc      swiperTranslateOf(position=5, index=0, mainAxisLength=0, closeTogether=true, cancelDefault=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperTranslateOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0036 begin`);
      const actual: number = swiperTranslateOf(5, 0, 0, true, true);
      logInfo(`swiperTranslateOf(position=5, index=0, ma...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperTranslateOf_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0037
     * @tc.name      ComponentCollection_SwiperTranslateOf_0037
     * @tc.desc      swiperTranslateOf(position=10, index=0, mainAxisLength=0, closeTogether=true, cancelDefault=true...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperTranslateOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0037 begin`);
      const actual: number = swiperTranslateOf(10, 0, 0, true, true);
      logInfo(`swiperTranslateOf(position=10, index=0, m...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperTranslateOf_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0038
     * @tc.name      ComponentCollection_SwiperTranslateOf_0038
     * @tc.desc      swiperTranslateOf(position=100, index=0, mainAxisLength=0, closeTogether=true, cancelDefault=tru...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperTranslateOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0038 begin`);
      const actual: number = swiperTranslateOf(100, 0, 0, true, true);
      logInfo(`swiperTranslateOf(position=100, index=0, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperTranslateOf_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0039
     * @tc.name      ComponentCollection_SwiperTranslateOf_0039
     * @tc.desc      swiperTranslateOf(position=0, index=1, mainAxisLength=0, closeTogether=true, cancelDefault=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperTranslateOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0039 begin`);
      const actual: number = swiperTranslateOf(0, 1, 0, true, true);
      logInfo(`swiperTranslateOf(position=0, index=1, ma...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperTranslateOf_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0040
     * @tc.name      ComponentCollection_SwiperTranslateOf_0040
     * @tc.desc      swiperTranslateOf(position=0, index=-1, mainAxisLength=0, closeTogether=true, cancelDefault=true...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0040 begin`);
      const actual: number = swiperTranslateOf(0, -1, 0, true, true);
      logInfo(`swiperTranslateOf(position=0, index=-1, m...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperTranslateOf_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0041
     * @tc.name      ComponentCollection_SwiperTranslateOf_0041
     * @tc.desc      swiperTranslateOf(position=0, index=2, mainAxisLength=0, closeTogether=true, cancelDefault=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0041 begin`);
      const actual: number = swiperTranslateOf(0, 2, 0, true, true);
      logInfo(`swiperTranslateOf(position=0, index=2, ma...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperTranslateOf_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0042
     * @tc.name      ComponentCollection_SwiperTranslateOf_0042
     * @tc.desc      swiperTranslateOf(position=0, index=3, mainAxisLength=0, closeTogether=true, cancelDefault=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0042 begin`);
      const actual: number = swiperTranslateOf(0, 3, 0, true, true);
      logInfo(`swiperTranslateOf(position=0, index=3, ma...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperTranslateOf_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0043
     * @tc.name      ComponentCollection_SwiperTranslateOf_0043
     * @tc.desc      swiperTranslateOf(position=0, index=5, mainAxisLength=0, closeTogether=true, cancelDefault=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperTranslateOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0043 begin`);
      const actual: number = swiperTranslateOf(0, 5, 0, true, true);
      logInfo(`swiperTranslateOf(position=0, index=5, ma...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperTranslateOf_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0044
     * @tc.name      ComponentCollection_SwiperTranslateOf_0044
     * @tc.desc      swiperTranslateOf(position=0, index=10, mainAxisLength=0, closeTogether=true, cancelDefault=true...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperTranslateOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0044 begin`);
      const actual: number = swiperTranslateOf(0, 10, 0, true, true);
      logInfo(`swiperTranslateOf(position=0, index=10, m...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperTranslateOf_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0045
     * @tc.name      ComponentCollection_SwiperTranslateOf_0045
     * @tc.desc      swiperTranslateOf(position=0, index=100, mainAxisLength=0, closeTogether=true, cancelDefault=tru...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperTranslateOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0045 begin`);
      const actual: number = swiperTranslateOf(0, 100, 0, true, true);
      logInfo(`swiperTranslateOf(position=0, index=100, ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperTranslateOf_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0046
     * @tc.name      ComponentCollection_SwiperTranslateOf_0046
     * @tc.desc      swiperTranslateOf(position=0, index=0, mainAxisLength=1, closeTogether=true, cancelDefault=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_SwiperTranslateOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0046 begin`);
      const actual: number = swiperTranslateOf(0, 0, 1, true, true);
      logInfo(`swiperTranslateOf(position=0, index=0, ma...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperTranslateOf_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0047
     * @tc.name      ComponentCollection_SwiperTranslateOf_0047
     * @tc.desc      swiperTranslateOf(position=0, index=0, mainAxisLength=-1, closeTogether=true, cancelDefault=true...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0047 begin`);
      const actual: number = swiperTranslateOf(0, 0, -1, true, true);
      logInfo(`swiperTranslateOf(position=0, index=0, ma...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperTranslateOf_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0048
     * @tc.name      ComponentCollection_SwiperTranslateOf_0048
     * @tc.desc      swiperTranslateOf(position=0, index=0, mainAxisLength=2, closeTogether=true, cancelDefault=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0048 begin`);
      const actual: number = swiperTranslateOf(0, 0, 2, true, true);
      logInfo(`swiperTranslateOf(position=0, index=0, ma...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperTranslateOf_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_SWIPER_TRANSLATE_OF_0049
     * @tc.name      ComponentCollection_SwiperTranslateOf_0049
     * @tc.desc      swiperTranslateOf(position=0, index=0, mainAxisLength=3, closeTogether=true, cancelDefault=true)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ComponentCollection_SwiperTranslateOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperTranslateOf_0049 begin`);
      const actual: number = swiperTranslateOf(0, 0, 3, true, true);
      logInfo(`swiperTranslateOf(position=0, index=0, ma...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperTranslateOf_0049 end`);
    });
  });
}
