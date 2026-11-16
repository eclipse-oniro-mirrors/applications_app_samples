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

export default function wlanVolumeResolve22Test() {
  describe('WlanVolumeResolve22Test', () => {

    /**
     * @tc.name   testWlanVolume220001
     * @tc.number SUB_WLAN_VOLUME_22_0001
     * @tc.desc   Verify model.resolveIP(1000420000) equals \'10:00:420:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220001 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000420000)).assertEqual(\'10:00:420:000\');');
      expect(model.resolveIP(1000420000)).assertEqual('10:00:420:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000420000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000420000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000420000).length).assertEqual(13);');
      expect(model.resolveIP(1000420000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220001 end');
    })

    /**
     * @tc.name   testWlanVolume220002
     * @tc.number SUB_WLAN_VOLUME_22_0002
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220002 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000421000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'421\');');
      expect(result.split(':')[2]).assertEqual('421');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220002 end');
    })

    /**
     * @tc.name   testWlanVolume220003
     * @tc.number SUB_WLAN_VOLUME_22_0003
     * @tc.desc   Verify model.resolveIP(1000422000) equals \'10:00:422:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220003 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000422000)).assertEqual(\'10:00:422:000\');');
      expect(model.resolveIP(1000422000)).assertEqual('10:00:422:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000422000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000422000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000422000).length).assertEqual(13);');
      expect(model.resolveIP(1000422000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220003 end');
    })

    /**
     * @tc.name   testWlanVolume220004
     * @tc.number SUB_WLAN_VOLUME_22_0004
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220004 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000423000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'423\');');
      expect(result.split(':')[2]).assertEqual('423');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220004 end');
    })

    /**
     * @tc.name   testWlanVolume220005
     * @tc.number SUB_WLAN_VOLUME_22_0005
     * @tc.desc   Verify model.resolveIP(1000424000) equals \'10:00:424:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220005 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000424000)).assertEqual(\'10:00:424:000\');');
      expect(model.resolveIP(1000424000)).assertEqual('10:00:424:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000424000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000424000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000424000).length).assertEqual(13);');
      expect(model.resolveIP(1000424000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220005 end');
    })

    /**
     * @tc.name   testWlanVolume220006
     * @tc.number SUB_WLAN_VOLUME_22_0006
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220006 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000425000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'425\');');
      expect(result.split(':')[2]).assertEqual('425');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220006 end');
    })

    /**
     * @tc.name   testWlanVolume220007
     * @tc.number SUB_WLAN_VOLUME_22_0007
     * @tc.desc   Verify model.resolveIP(1000426000) equals \'10:00:426:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220007 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000426000)).assertEqual(\'10:00:426:000\');');
      expect(model.resolveIP(1000426000)).assertEqual('10:00:426:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000426000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000426000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000426000).length).assertEqual(13);');
      expect(model.resolveIP(1000426000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220007 end');
    })

    /**
     * @tc.name   testWlanVolume220008
     * @tc.number SUB_WLAN_VOLUME_22_0008
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220008 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000427000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'427\');');
      expect(result.split(':')[2]).assertEqual('427');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220008 end');
    })

    /**
     * @tc.name   testWlanVolume220009
     * @tc.number SUB_WLAN_VOLUME_22_0009
     * @tc.desc   Verify model.resolveIP(1000428000) equals \'10:00:428:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220009 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000428000)).assertEqual(\'10:00:428:000\');');
      expect(model.resolveIP(1000428000)).assertEqual('10:00:428:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000428000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000428000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000428000).length).assertEqual(13);');
      expect(model.resolveIP(1000428000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220009 end');
    })

    /**
     * @tc.name   testWlanVolume220010
     * @tc.number SUB_WLAN_VOLUME_22_0010
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220010 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000429000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'429\');');
      expect(result.split(':')[2]).assertEqual('429');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220010 end');
    })

    /**
     * @tc.name   testWlanVolume220011
     * @tc.number SUB_WLAN_VOLUME_22_0011
     * @tc.desc   Verify model.resolveIP(1000430000) equals \'10:00:430:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220011 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000430000)).assertEqual(\'10:00:430:000\');');
      expect(model.resolveIP(1000430000)).assertEqual('10:00:430:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000430000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000430000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000430000).length).assertEqual(13);');
      expect(model.resolveIP(1000430000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220011 end');
    })

    /**
     * @tc.name   testWlanVolume220012
     * @tc.number SUB_WLAN_VOLUME_22_0012
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220012 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000431000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'431\');');
      expect(result.split(':')[2]).assertEqual('431');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220012 end');
    })

    /**
     * @tc.name   testWlanVolume220013
     * @tc.number SUB_WLAN_VOLUME_22_0013
     * @tc.desc   Verify model.resolveIP(1000432000) equals \'10:00:432:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220013 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000432000)).assertEqual(\'10:00:432:000\');');
      expect(model.resolveIP(1000432000)).assertEqual('10:00:432:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000432000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000432000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000432000).length).assertEqual(13);');
      expect(model.resolveIP(1000432000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220013 end');
    })

    /**
     * @tc.name   testWlanVolume220014
     * @tc.number SUB_WLAN_VOLUME_22_0014
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220014 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000433000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'433\');');
      expect(result.split(':')[2]).assertEqual('433');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220014 end');
    })

    /**
     * @tc.name   testWlanVolume220015
     * @tc.number SUB_WLAN_VOLUME_22_0015
     * @tc.desc   Verify model.resolveIP(1000434000) equals \'10:00:434:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220015 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000434000)).assertEqual(\'10:00:434:000\');');
      expect(model.resolveIP(1000434000)).assertEqual('10:00:434:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000434000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000434000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000434000).length).assertEqual(13);');
      expect(model.resolveIP(1000434000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220015 end');
    })

    /**
     * @tc.name   testWlanVolume220016
     * @tc.number SUB_WLAN_VOLUME_22_0016
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220016 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000435000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'435\');');
      expect(result.split(':')[2]).assertEqual('435');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220016 end');
    })

    /**
     * @tc.name   testWlanVolume220017
     * @tc.number SUB_WLAN_VOLUME_22_0017
     * @tc.desc   Verify model.resolveIP(1000436000) equals \'10:00:436:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220017 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000436000)).assertEqual(\'10:00:436:000\');');
      expect(model.resolveIP(1000436000)).assertEqual('10:00:436:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000436000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000436000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000436000).length).assertEqual(13);');
      expect(model.resolveIP(1000436000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220017 end');
    })

    /**
     * @tc.name   testWlanVolume220018
     * @tc.number SUB_WLAN_VOLUME_22_0018
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220018 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000437000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'437\');');
      expect(result.split(':')[2]).assertEqual('437');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220018 end');
    })

    /**
     * @tc.name   testWlanVolume220019
     * @tc.number SUB_WLAN_VOLUME_22_0019
     * @tc.desc   Verify model.resolveIP(1000438000) equals \'10:00:438:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220019 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000438000)).assertEqual(\'10:00:438:000\');');
      expect(model.resolveIP(1000438000)).assertEqual('10:00:438:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000438000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000438000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000438000).length).assertEqual(13);');
      expect(model.resolveIP(1000438000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220019 end');
    })

    /**
     * @tc.name   testWlanVolume220020
     * @tc.number SUB_WLAN_VOLUME_22_0020
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume220020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220020 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000439000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'439\');');
      expect(result.split(':')[2]).assertEqual('439');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume220020 end');
    })
  })
}
