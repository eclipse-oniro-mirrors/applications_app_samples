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

export default function wlanVolumeResolve25Test() {
  describe('WlanVolumeResolve25Test', () => {

    /**
     * @tc.name   testWlanVolume250001
     * @tc.number SUB_WLAN_VOLUME_25_0001
     * @tc.desc   Verify model.resolveIP(1000480000) equals \'10:00:480:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250001 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000480000)).assertEqual(\'10:00:480:000\');');
      expect(model.resolveIP(1000480000)).assertEqual('10:00:480:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000480000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000480000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000480000).length).assertEqual(13);');
      expect(model.resolveIP(1000480000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250001 end');
    })

    /**
     * @tc.name   testWlanVolume250002
     * @tc.number SUB_WLAN_VOLUME_25_0002
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250002 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000481000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'481\');');
      expect(result.split(':')[2]).assertEqual('481');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250002 end');
    })

    /**
     * @tc.name   testWlanVolume250003
     * @tc.number SUB_WLAN_VOLUME_25_0003
     * @tc.desc   Verify model.resolveIP(1000482000) equals \'10:00:482:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250003 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000482000)).assertEqual(\'10:00:482:000\');');
      expect(model.resolveIP(1000482000)).assertEqual('10:00:482:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000482000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000482000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000482000).length).assertEqual(13);');
      expect(model.resolveIP(1000482000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250003 end');
    })

    /**
     * @tc.name   testWlanVolume250004
     * @tc.number SUB_WLAN_VOLUME_25_0004
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250004 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000483000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'483\');');
      expect(result.split(':')[2]).assertEqual('483');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250004 end');
    })

    /**
     * @tc.name   testWlanVolume250005
     * @tc.number SUB_WLAN_VOLUME_25_0005
     * @tc.desc   Verify model.resolveIP(1000484000) equals \'10:00:484:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250005 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000484000)).assertEqual(\'10:00:484:000\');');
      expect(model.resolveIP(1000484000)).assertEqual('10:00:484:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000484000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000484000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000484000).length).assertEqual(13);');
      expect(model.resolveIP(1000484000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250005 end');
    })

    /**
     * @tc.name   testWlanVolume250006
     * @tc.number SUB_WLAN_VOLUME_25_0006
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250006 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000485000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'485\');');
      expect(result.split(':')[2]).assertEqual('485');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250006 end');
    })

    /**
     * @tc.name   testWlanVolume250007
     * @tc.number SUB_WLAN_VOLUME_25_0007
     * @tc.desc   Verify model.resolveIP(1000486000) equals \'10:00:486:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250007 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000486000)).assertEqual(\'10:00:486:000\');');
      expect(model.resolveIP(1000486000)).assertEqual('10:00:486:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000486000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000486000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000486000).length).assertEqual(13);');
      expect(model.resolveIP(1000486000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250007 end');
    })

    /**
     * @tc.name   testWlanVolume250008
     * @tc.number SUB_WLAN_VOLUME_25_0008
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250008 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000487000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'487\');');
      expect(result.split(':')[2]).assertEqual('487');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250008 end');
    })

    /**
     * @tc.name   testWlanVolume250009
     * @tc.number SUB_WLAN_VOLUME_25_0009
     * @tc.desc   Verify model.resolveIP(1000488000) equals \'10:00:488:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250009 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000488000)).assertEqual(\'10:00:488:000\');');
      expect(model.resolveIP(1000488000)).assertEqual('10:00:488:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000488000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000488000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000488000).length).assertEqual(13);');
      expect(model.resolveIP(1000488000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250009 end');
    })

    /**
     * @tc.name   testWlanVolume250010
     * @tc.number SUB_WLAN_VOLUME_25_0010
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250010 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000489000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'489\');');
      expect(result.split(':')[2]).assertEqual('489');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250010 end');
    })

    /**
     * @tc.name   testWlanVolume250011
     * @tc.number SUB_WLAN_VOLUME_25_0011
     * @tc.desc   Verify model.resolveIP(1000490000) equals \'10:00:490:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250011 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000490000)).assertEqual(\'10:00:490:000\');');
      expect(model.resolveIP(1000490000)).assertEqual('10:00:490:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000490000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000490000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000490000).length).assertEqual(13);');
      expect(model.resolveIP(1000490000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250011 end');
    })

    /**
     * @tc.name   testWlanVolume250012
     * @tc.number SUB_WLAN_VOLUME_25_0012
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250012 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000491000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'491\');');
      expect(result.split(':')[2]).assertEqual('491');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250012 end');
    })

    /**
     * @tc.name   testWlanVolume250013
     * @tc.number SUB_WLAN_VOLUME_25_0013
     * @tc.desc   Verify model.resolveIP(1000492000) equals \'10:00:492:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250013 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000492000)).assertEqual(\'10:00:492:000\');');
      expect(model.resolveIP(1000492000)).assertEqual('10:00:492:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000492000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000492000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000492000).length).assertEqual(13);');
      expect(model.resolveIP(1000492000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250013 end');
    })

    /**
     * @tc.name   testWlanVolume250014
     * @tc.number SUB_WLAN_VOLUME_25_0014
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250014 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000493000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'493\');');
      expect(result.split(':')[2]).assertEqual('493');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250014 end');
    })

    /**
     * @tc.name   testWlanVolume250015
     * @tc.number SUB_WLAN_VOLUME_25_0015
     * @tc.desc   Verify model.resolveIP(1000494000) equals \'10:00:494:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250015 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000494000)).assertEqual(\'10:00:494:000\');');
      expect(model.resolveIP(1000494000)).assertEqual('10:00:494:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000494000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000494000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000494000).length).assertEqual(13);');
      expect(model.resolveIP(1000494000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250015 end');
    })

    /**
     * @tc.name   testWlanVolume250016
     * @tc.number SUB_WLAN_VOLUME_25_0016
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250016 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000495000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'495\');');
      expect(result.split(':')[2]).assertEqual('495');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250016 end');
    })

    /**
     * @tc.name   testWlanVolume250017
     * @tc.number SUB_WLAN_VOLUME_25_0017
     * @tc.desc   Verify model.resolveIP(1000496000) equals \'10:00:496:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250017 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000496000)).assertEqual(\'10:00:496:000\');');
      expect(model.resolveIP(1000496000)).assertEqual('10:00:496:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000496000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000496000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000496000).length).assertEqual(13);');
      expect(model.resolveIP(1000496000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250017 end');
    })

    /**
     * @tc.name   testWlanVolume250018
     * @tc.number SUB_WLAN_VOLUME_25_0018
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250018 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000497000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'497\');');
      expect(result.split(':')[2]).assertEqual('497');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250018 end');
    })

    /**
     * @tc.name   testWlanVolume250019
     * @tc.number SUB_WLAN_VOLUME_25_0019
     * @tc.desc   Verify model.resolveIP(1000498000) equals \'10:00:498:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250019 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000498000)).assertEqual(\'10:00:498:000\');');
      expect(model.resolveIP(1000498000)).assertEqual('10:00:498:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000498000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000498000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000498000).length).assertEqual(13);');
      expect(model.resolveIP(1000498000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250019 end');
    })

    /**
     * @tc.name   testWlanVolume250020
     * @tc.number SUB_WLAN_VOLUME_25_0020
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume250020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250020 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000499000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'499\');');
      expect(result.split(':')[2]).assertEqual('499');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume250020 end');
    })
  })
}
