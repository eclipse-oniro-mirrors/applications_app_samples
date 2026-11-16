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

export default function wlanVolume3ResolveTest() {
  describe('WlanVolume3ResolveTest', () => {

    /**
     * @tc.name   testWlanVol30001
     * @tc.number SUB_WLAN_VOL3_0001
     * @tc.desc   Verify model.resolveIP(2100001000) equals \'21:00:001:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30001 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100001000)).assertEqual(\'21:00:001:000\');');
      expect(model.resolveIP(2100001000)).assertEqual('21:00:001:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100001000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100001000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100001000).length).assertEqual(13);');
      expect(model.resolveIP(2100001000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30001 end');
    })

    /**
     * @tc.name   testWlanVol30002
     * @tc.number SUB_WLAN_VOL3_0002
     * @tc.desc   Verify model.resolveIP(2100002000) equals \'21:00:002:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30002 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100002000)).assertEqual(\'21:00:002:000\');');
      expect(model.resolveIP(2100002000)).assertEqual('21:00:002:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100002000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100002000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100002000).length).assertEqual(13);');
      expect(model.resolveIP(2100002000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30002 end');
    })

    /**
     * @tc.name   testWlanVol30003
     * @tc.number SUB_WLAN_VOL3_0003
     * @tc.desc   Verify model.resolveIP(2100003000) equals \'21:00:003:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30003 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100003000)).assertEqual(\'21:00:003:000\');');
      expect(model.resolveIP(2100003000)).assertEqual('21:00:003:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100003000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100003000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100003000).length).assertEqual(13);');
      expect(model.resolveIP(2100003000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30003 end');
    })

    /**
     * @tc.name   testWlanVol30004
     * @tc.number SUB_WLAN_VOL3_0004
     * @tc.desc   Verify model.resolveIP(2100004000) equals \'21:00:004:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30004 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100004000)).assertEqual(\'21:00:004:000\');');
      expect(model.resolveIP(2100004000)).assertEqual('21:00:004:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100004000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100004000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100004000).length).assertEqual(13);');
      expect(model.resolveIP(2100004000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30004 end');
    })

    /**
     * @tc.name   testWlanVol30005
     * @tc.number SUB_WLAN_VOL3_0005
     * @tc.desc   Verify model.resolveIP(2100005000) equals \'21:00:005:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30005 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100005000)).assertEqual(\'21:00:005:000\');');
      expect(model.resolveIP(2100005000)).assertEqual('21:00:005:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100005000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100005000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100005000).length).assertEqual(13);');
      expect(model.resolveIP(2100005000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30005 end');
    })

    /**
     * @tc.name   testWlanVol30006
     * @tc.number SUB_WLAN_VOL3_0006
     * @tc.desc   Verify model.resolveIP(2100006000) equals \'21:00:006:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30006 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100006000)).assertEqual(\'21:00:006:000\');');
      expect(model.resolveIP(2100006000)).assertEqual('21:00:006:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100006000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100006000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100006000).length).assertEqual(13);');
      expect(model.resolveIP(2100006000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30006 end');
    })

    /**
     * @tc.name   testWlanVol30007
     * @tc.number SUB_WLAN_VOL3_0007
     * @tc.desc   Verify model.resolveIP(2100007000) equals \'21:00:007:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30007 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100007000)).assertEqual(\'21:00:007:000\');');
      expect(model.resolveIP(2100007000)).assertEqual('21:00:007:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100007000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100007000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100007000).length).assertEqual(13);');
      expect(model.resolveIP(2100007000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30007 end');
    })

    /**
     * @tc.name   testWlanVol30008
     * @tc.number SUB_WLAN_VOL3_0008
     * @tc.desc   Verify model.resolveIP(2100008000) equals \'21:00:008:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30008 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100008000)).assertEqual(\'21:00:008:000\');');
      expect(model.resolveIP(2100008000)).assertEqual('21:00:008:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100008000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100008000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100008000).length).assertEqual(13);');
      expect(model.resolveIP(2100008000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30008 end');
    })

    /**
     * @tc.name   testWlanVol30009
     * @tc.number SUB_WLAN_VOL3_0009
     * @tc.desc   Verify model.resolveIP(2100009000) equals \'21:00:009:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30009 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100009000)).assertEqual(\'21:00:009:000\');');
      expect(model.resolveIP(2100009000)).assertEqual('21:00:009:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100009000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100009000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100009000).length).assertEqual(13);');
      expect(model.resolveIP(2100009000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30009 end');
    })

    /**
     * @tc.name   testWlanVol30010
     * @tc.number SUB_WLAN_VOL3_0010
     * @tc.desc   Verify model.resolveIP(2100010000) equals \'21:00:010:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30010 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100010000)).assertEqual(\'21:00:010:000\');');
      expect(model.resolveIP(2100010000)).assertEqual('21:00:010:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100010000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100010000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100010000).length).assertEqual(13);');
      expect(model.resolveIP(2100010000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30010 end');
    })

    /**
     * @tc.name   testWlanVol30011
     * @tc.number SUB_WLAN_VOL3_0011
     * @tc.desc   Verify model.resolveIP(2100011000) equals \'21:00:011:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30011 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100011000)).assertEqual(\'21:00:011:000\');');
      expect(model.resolveIP(2100011000)).assertEqual('21:00:011:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100011000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100011000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100011000).length).assertEqual(13);');
      expect(model.resolveIP(2100011000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30011 end');
    })

    /**
     * @tc.name   testWlanVol30012
     * @tc.number SUB_WLAN_VOL3_0012
     * @tc.desc   Verify model.resolveIP(2100012000) equals \'21:00:012:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30012 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100012000)).assertEqual(\'21:00:012:000\');');
      expect(model.resolveIP(2100012000)).assertEqual('21:00:012:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100012000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100012000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100012000).length).assertEqual(13);');
      expect(model.resolveIP(2100012000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30012 end');
    })

    /**
     * @tc.name   testWlanVol30013
     * @tc.number SUB_WLAN_VOL3_0013
     * @tc.desc   Verify model.resolveIP(2100013000) equals \'21:00:013:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30013 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100013000)).assertEqual(\'21:00:013:000\');');
      expect(model.resolveIP(2100013000)).assertEqual('21:00:013:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100013000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100013000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100013000).length).assertEqual(13);');
      expect(model.resolveIP(2100013000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30013 end');
    })

    /**
     * @tc.name   testWlanVol30014
     * @tc.number SUB_WLAN_VOL3_0014
     * @tc.desc   Verify model.resolveIP(2100014000) equals \'21:00:014:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30014 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100014000)).assertEqual(\'21:00:014:000\');');
      expect(model.resolveIP(2100014000)).assertEqual('21:00:014:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100014000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100014000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100014000).length).assertEqual(13);');
      expect(model.resolveIP(2100014000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30014 end');
    })

    /**
     * @tc.name   testWlanVol30015
     * @tc.number SUB_WLAN_VOL3_0015
     * @tc.desc   Verify model.resolveIP(2100015000) equals \'21:00:015:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30015 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100015000)).assertEqual(\'21:00:015:000\');');
      expect(model.resolveIP(2100015000)).assertEqual('21:00:015:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100015000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100015000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100015000).length).assertEqual(13);');
      expect(model.resolveIP(2100015000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30015 end');
    })

    /**
     * @tc.name   testWlanVol30016
     * @tc.number SUB_WLAN_VOL3_0016
     * @tc.desc   Verify model.resolveIP(2100016000) equals \'21:00:016:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30016 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100016000)).assertEqual(\'21:00:016:000\');');
      expect(model.resolveIP(2100016000)).assertEqual('21:00:016:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100016000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100016000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100016000).length).assertEqual(13);');
      expect(model.resolveIP(2100016000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30016 end');
    })

    /**
     * @tc.name   testWlanVol30017
     * @tc.number SUB_WLAN_VOL3_0017
     * @tc.desc   Verify model.resolveIP(2100017000) equals \'21:00:017:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30017 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100017000)).assertEqual(\'21:00:017:000\');');
      expect(model.resolveIP(2100017000)).assertEqual('21:00:017:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100017000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100017000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100017000).length).assertEqual(13);');
      expect(model.resolveIP(2100017000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30017 end');
    })

    /**
     * @tc.name   testWlanVol30018
     * @tc.number SUB_WLAN_VOL3_0018
     * @tc.desc   Verify model.resolveIP(2100018000) equals \'21:00:018:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30018 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100018000)).assertEqual(\'21:00:018:000\');');
      expect(model.resolveIP(2100018000)).assertEqual('21:00:018:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100018000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100018000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100018000).length).assertEqual(13);');
      expect(model.resolveIP(2100018000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30018 end');
    })

    /**
     * @tc.name   testWlanVol30019
     * @tc.number SUB_WLAN_VOL3_0019
     * @tc.desc   Verify model.resolveIP(2100019000) equals \'21:00:019:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30019 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100019000)).assertEqual(\'21:00:019:000\');');
      expect(model.resolveIP(2100019000)).assertEqual('21:00:019:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100019000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100019000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100019000).length).assertEqual(13);');
      expect(model.resolveIP(2100019000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30019 end');
    })

    /**
     * @tc.name   testWlanVol30020
     * @tc.number SUB_WLAN_VOL3_0020
     * @tc.desc   Verify model.resolveIP(2100020000) equals \'21:00:020:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVol30020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30020 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100020000)).assertEqual(\'21:00:020:000\');');
      expect(model.resolveIP(2100020000)).assertEqual('21:00:020:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100020000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(2100020000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(2100020000).length).assertEqual(13);');
      expect(model.resolveIP(2100020000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVol30020 end');
    })
  })
}
