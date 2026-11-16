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

export default function wlanVolumeResolve19Test() {
  describe('WlanVolumeResolve19Test', () => {

    /**
     * @tc.name   testWlanVolume190001
     * @tc.number SUB_WLAN_VOLUME_19_0001
     * @tc.desc   Verify model.resolveIP(1000360000) equals \'10:00:360:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190001 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000360000)).assertEqual(\'10:00:360:000\');');
      expect(model.resolveIP(1000360000)).assertEqual('10:00:360:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000360000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000360000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000360000).length).assertEqual(13);');
      expect(model.resolveIP(1000360000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190001 end');
    })

    /**
     * @tc.name   testWlanVolume190002
     * @tc.number SUB_WLAN_VOLUME_19_0002
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190002 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000361000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'361\');');
      expect(result.split(':')[2]).assertEqual('361');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190002 end');
    })

    /**
     * @tc.name   testWlanVolume190003
     * @tc.number SUB_WLAN_VOLUME_19_0003
     * @tc.desc   Verify model.resolveIP(1000362000) equals \'10:00:362:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190003 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000362000)).assertEqual(\'10:00:362:000\');');
      expect(model.resolveIP(1000362000)).assertEqual('10:00:362:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000362000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000362000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000362000).length).assertEqual(13);');
      expect(model.resolveIP(1000362000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190003 end');
    })

    /**
     * @tc.name   testWlanVolume190004
     * @tc.number SUB_WLAN_VOLUME_19_0004
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190004 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000363000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'363\');');
      expect(result.split(':')[2]).assertEqual('363');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190004 end');
    })

    /**
     * @tc.name   testWlanVolume190005
     * @tc.number SUB_WLAN_VOLUME_19_0005
     * @tc.desc   Verify model.resolveIP(1000364000) equals \'10:00:364:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190005 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000364000)).assertEqual(\'10:00:364:000\');');
      expect(model.resolveIP(1000364000)).assertEqual('10:00:364:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000364000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000364000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000364000).length).assertEqual(13);');
      expect(model.resolveIP(1000364000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190005 end');
    })

    /**
     * @tc.name   testWlanVolume190006
     * @tc.number SUB_WLAN_VOLUME_19_0006
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190006 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000365000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'365\');');
      expect(result.split(':')[2]).assertEqual('365');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190006 end');
    })

    /**
     * @tc.name   testWlanVolume190007
     * @tc.number SUB_WLAN_VOLUME_19_0007
     * @tc.desc   Verify model.resolveIP(1000366000) equals \'10:00:366:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190007 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000366000)).assertEqual(\'10:00:366:000\');');
      expect(model.resolveIP(1000366000)).assertEqual('10:00:366:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000366000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000366000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000366000).length).assertEqual(13);');
      expect(model.resolveIP(1000366000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190007 end');
    })

    /**
     * @tc.name   testWlanVolume190008
     * @tc.number SUB_WLAN_VOLUME_19_0008
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190008 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000367000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'367\');');
      expect(result.split(':')[2]).assertEqual('367');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190008 end');
    })

    /**
     * @tc.name   testWlanVolume190009
     * @tc.number SUB_WLAN_VOLUME_19_0009
     * @tc.desc   Verify model.resolveIP(1000368000) equals \'10:00:368:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190009 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000368000)).assertEqual(\'10:00:368:000\');');
      expect(model.resolveIP(1000368000)).assertEqual('10:00:368:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000368000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000368000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000368000).length).assertEqual(13);');
      expect(model.resolveIP(1000368000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190009 end');
    })

    /**
     * @tc.name   testWlanVolume190010
     * @tc.number SUB_WLAN_VOLUME_19_0010
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190010 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000369000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'369\');');
      expect(result.split(':')[2]).assertEqual('369');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190010 end');
    })

    /**
     * @tc.name   testWlanVolume190011
     * @tc.number SUB_WLAN_VOLUME_19_0011
     * @tc.desc   Verify model.resolveIP(1000370000) equals \'10:00:370:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190011 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000370000)).assertEqual(\'10:00:370:000\');');
      expect(model.resolveIP(1000370000)).assertEqual('10:00:370:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000370000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000370000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000370000).length).assertEqual(13);');
      expect(model.resolveIP(1000370000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190011 end');
    })

    /**
     * @tc.name   testWlanVolume190012
     * @tc.number SUB_WLAN_VOLUME_19_0012
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190012 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000371000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'371\');');
      expect(result.split(':')[2]).assertEqual('371');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190012 end');
    })

    /**
     * @tc.name   testWlanVolume190013
     * @tc.number SUB_WLAN_VOLUME_19_0013
     * @tc.desc   Verify model.resolveIP(1000372000) equals \'10:00:372:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190013 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000372000)).assertEqual(\'10:00:372:000\');');
      expect(model.resolveIP(1000372000)).assertEqual('10:00:372:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000372000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000372000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000372000).length).assertEqual(13);');
      expect(model.resolveIP(1000372000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190013 end');
    })

    /**
     * @tc.name   testWlanVolume190014
     * @tc.number SUB_WLAN_VOLUME_19_0014
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190014 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000373000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'373\');');
      expect(result.split(':')[2]).assertEqual('373');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190014 end');
    })

    /**
     * @tc.name   testWlanVolume190015
     * @tc.number SUB_WLAN_VOLUME_19_0015
     * @tc.desc   Verify model.resolveIP(1000374000) equals \'10:00:374:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190015 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000374000)).assertEqual(\'10:00:374:000\');');
      expect(model.resolveIP(1000374000)).assertEqual('10:00:374:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000374000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000374000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000374000).length).assertEqual(13);');
      expect(model.resolveIP(1000374000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190015 end');
    })

    /**
     * @tc.name   testWlanVolume190016
     * @tc.number SUB_WLAN_VOLUME_19_0016
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190016 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000375000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'375\');');
      expect(result.split(':')[2]).assertEqual('375');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190016 end');
    })

    /**
     * @tc.name   testWlanVolume190017
     * @tc.number SUB_WLAN_VOLUME_19_0017
     * @tc.desc   Verify model.resolveIP(1000376000) equals \'10:00:376:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190017 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000376000)).assertEqual(\'10:00:376:000\');');
      expect(model.resolveIP(1000376000)).assertEqual('10:00:376:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000376000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000376000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000376000).length).assertEqual(13);');
      expect(model.resolveIP(1000376000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190017 end');
    })

    /**
     * @tc.name   testWlanVolume190018
     * @tc.number SUB_WLAN_VOLUME_19_0018
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190018 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000377000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'377\');');
      expect(result.split(':')[2]).assertEqual('377');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190018 end');
    })

    /**
     * @tc.name   testWlanVolume190019
     * @tc.number SUB_WLAN_VOLUME_19_0019
     * @tc.desc   Verify model.resolveIP(1000378000) equals \'10:00:378:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190019 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000378000)).assertEqual(\'10:00:378:000\');');
      expect(model.resolveIP(1000378000)).assertEqual('10:00:378:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000378000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000378000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000378000).length).assertEqual(13);');
      expect(model.resolveIP(1000378000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190019 end');
    })

    /**
     * @tc.name   testWlanVolume190020
     * @tc.number SUB_WLAN_VOLUME_19_0020
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume190020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190020 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000379000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'379\');');
      expect(result.split(':')[2]).assertEqual('379');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume190020 end');
    })
  })
}
