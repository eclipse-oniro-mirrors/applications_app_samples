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
import { CommonConstants } from 'listexchange/src/main/ets/common/commonConstants';

const DOMAIN: number = 0xF814;
const TAG: string = 'ConstantsModelTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function constantsModelTest(): void {
  describe('ConstantsModelTest', () => {
    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CONSTANTS_0301
     * @tc.name      testConstants0301
     * @tc.desc      Verify the list item height constant equals fifty points.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstants0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstants0301 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.LIST_ITEM_HEIGHT}, expected=50`);
      expect(CommonConstants.LIST_ITEM_HEIGHT).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.LIST_ITEM_HEIGHT}`);
      expect(typeof CommonConstants.LIST_ITEM_HEIGHT).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${CommonConstants.LIST_ITEM_HEIGHT}, expected=0`);
      expect(CommonConstants.LIST_ITEM_HEIGHT).assertLarger(0);
      log('testConstants0301 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CONSTANTS_0302
     * @tc.name      testConstants0302
     * @tc.desc      Verify the animation duration constant equals three hundred milliseconds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstants0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstants0302 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.ANIMATE_DURATION}, expected=300`);
      expect(CommonConstants.ANIMATE_DURATION).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.ANIMATE_DURATION}`);
      expect(typeof CommonConstants.ANIMATE_DURATION).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger actual=${CommonConstants.ANIMATE_DURATION}, expected=0`);
      expect(CommonConstants.ANIMATE_DURATION).assertLarger(0);
      log('testConstants0302 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CONSTANTS_0303
     * @tc.name      testConstants0303
     * @tc.desc      Verify the default list item name constant matches the sample title.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstants0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstants0303 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonConstants.LIST_NAME=${CommonConstants.LIST_NAME}`);
      expect(CommonConstants.LIST_NAME).assertEqual('标题1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.LIST_NAME}`);
      expect(typeof CommonConstants.LIST_NAME).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonConstants.LIST_NAME.length}, expected=3`);
      expect(CommonConstants.LIST_NAME.length).assertEqual(3);
      log('testConstants0303 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CONSTANTS_0304
     * @tc.name      testConstants0304
     * @tc.desc      Verify the constants stay usable in derived arithmetic expressions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstants0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstants0304 begin');
      const halfHeight: number = CommonConstants.LIST_ITEM_HEIGHT / 2;
      const twiceDuration: number = CommonConstants.ANIMATE_DURATION + 100;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual halfHeight=${halfHeight}, expected=25`);
      expect(halfHeight).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual twiceDuration=${twiceDuration}, expected=400`);
      expect(twiceDuration).assertEqual(400);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess halfHeight=${halfHeight}`);
      expect(halfHeight).assertLess(CommonConstants.LIST_ITEM_HEIGHT);
      log('testConstants0304 end');
    })

    /**
     * @tc.number    SUB_LISTBEEXCHANGE_CONSTANTS_0305
     * @tc.name      testConstants0305
     * @tc.desc      Verify all three constants keep their declared types at once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConstants0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testConstants0305 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.LIST_ITEM_HEIGHT}`);
      expect(typeof CommonConstants.LIST_ITEM_HEIGHT).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.ANIMATE_DURATION}`);
      expect(typeof CommonConstants.ANIMATE_DURATION).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof CommonConstants.LIST_NAME}`);
      expect(typeof CommonConstants.LIST_NAME).assertEqual('string');
      log('testConstants0305 end');
    })
  })
}
