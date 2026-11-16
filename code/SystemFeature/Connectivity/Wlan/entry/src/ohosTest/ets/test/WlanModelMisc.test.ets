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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { WifiModel } from '../../../../src/main/ets/model/WifiModel';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function wlanModelMiscTest() {
  describe('WlanModelMiscTest', () => {

    /**
     * @tc.name   testWlanMiscStable0001
     * @tc.number SUB_WLAN_MISC_0001
     * @tc.desc   Verify first equals second.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMiscStable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscStable0001 begin');
      const model: WifiModel = new WifiModel();
      const first: string = model.resolveIP(3232235777);
      const second: string = model.resolveIP(3232235777);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(first).assertEqual(second);');
      expect(first).assertEqual(second);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(first).assertEqual(\'32:32:235:777\');');
      expect(first).assertEqual('32:32:235:777');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(second.split(\':\').length).assertEqual(4);');
      expect(second.split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscStable0001 end');
    })

    /**
     * @tc.name   testWlanMiscMethodSet0002
     * @tc.number SUB_WLAN_MISC_0002
     * @tc.desc   Verify WifiModel method types remain callable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMiscMethodSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscMethodSet0002 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof model.getScanInfos === \'function\').assertTrue();');
      expect(typeof model.getScanInfos === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof model.getIpInfo === \'function\').assertTrue();');
      expect(typeof model.getIpInfo === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof model.getFeatureSupport === \'function\').assertTrue();');
      expect(typeof model.getFeatureSupport === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscMethodSet0002 end');
    })

    /**
     * @tc.name   testWlanMiscZeroRepeat0003
     * @tc.number SUB_WLAN_MISC_0003
     * @tc.desc   Resolve zero repeatedly and keep placeholder format.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanMiscZeroRepeat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscZeroRepeat0003 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(0)).assertEqual(\'00:00:000:000\');');
      expect(model.resolveIP(0)).assertEqual('00:00:000:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(0)).assertEqual(model.resolveIP(0));');
      expect(model.resolveIP(0)).assertEqual(model.resolveIP(0));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(0).length).assertEqual(13);');
      expect(model.resolveIP(0).length).assertEqual(13);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanMiscZeroRepeat0003 end');
    })
  })
}
