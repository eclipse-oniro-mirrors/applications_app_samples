/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DEFAULT_WINDOW_SIZE } from '../../../main/ets/constants/Constants';

const DOMAIN: number = 0xF814;
const TAG: string = 'WindowSizeConstantsCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function windowSizeConstantsCoreTest(): void {
  describe('WindowSizeConstantsCoreTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_WINDOWSIZE_0401
     * @tc.name      testWindowSize0401
     * @tc.desc      Checks DEFAULT_WINDOW_SIZE width equals the 1280 constant contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowSize0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowSize0401 begin');
      const actual: number = DEFAULT_WINDOW_SIZE.width;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=1280`);
      expect(actual).assertEqual(1280);
      log('testWindowSize0401 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_WINDOWSIZE_0402
     * @tc.name      testWindowSize0402
     * @tc.desc      Checks DEFAULT_WINDOW_SIZE height equals the 2580 constant contract.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowSize0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowSize0402 begin');
      const actual: number = DEFAULT_WINDOW_SIZE.height;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=2580`);
      expect(actual).assertEqual(2580);
      log('testWindowSize0402 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_WINDOWSIZE_0403
     * @tc.name      testWindowSize0403
     * @tc.desc      Checks DEFAULT_WINDOW_SIZE width stays a number value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowSize0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowSize0403 begin');
      const actual: number = DEFAULT_WINDOW_SIZE.width;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testWindowSize0403 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_WINDOWSIZE_0404
     * @tc.name      testWindowSize0404
     * @tc.desc      Checks DEFAULT_WINDOW_SIZE height stays a number value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowSize0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowSize0404 begin');
      const actual: number = DEFAULT_WINDOW_SIZE.height;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testWindowSize0404 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_WINDOWSIZE_0405
     * @tc.name      testWindowSize0405
     * @tc.desc      Checks DEFAULT_WINDOW_SIZE width is a positive px value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowSize0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowSize0405 begin');
      const actual: number = DEFAULT_WINDOW_SIZE.width;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      log('testWindowSize0405 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_WINDOWSIZE_0406
     * @tc.name      testWindowSize0406
     * @tc.desc      Checks DEFAULT_WINDOW_SIZE height is a positive px value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testWindowSize0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testWindowSize0406 begin');
      const actual: number = DEFAULT_WINDOW_SIZE.height;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${actual}, expected=0`);
      expect(actual).assertLarger(0);
      log('testWindowSize0406 end');
    })
  })
}
