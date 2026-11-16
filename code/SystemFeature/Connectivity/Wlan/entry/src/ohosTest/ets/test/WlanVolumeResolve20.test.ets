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

export default function wlanVolumeResolve20Test() {
  describe('WlanVolumeResolve20Test', () => {

    /**
     * @tc.name   testWlanVolume200001
     * @tc.number SUB_WLAN_VOLUME_20_0001
     * @tc.desc   Verify model.resolveIP(1000380000) equals \'10:00:380:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200001 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000380000)).assertEqual(\'10:00:380:000\');');
      expect(model.resolveIP(1000380000)).assertEqual('10:00:380:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000380000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000380000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000380000).length).assertEqual(13);');
      expect(model.resolveIP(1000380000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200001 end');
    })

    /**
     * @tc.name   testWlanVolume200002
     * @tc.number SUB_WLAN_VOLUME_20_0002
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200002 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000381000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'381\');');
      expect(result.split(':')[2]).assertEqual('381');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200002 end');
    })

    /**
     * @tc.name   testWlanVolume200003
     * @tc.number SUB_WLAN_VOLUME_20_0003
     * @tc.desc   Verify model.resolveIP(1000382000) equals \'10:00:382:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200003 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000382000)).assertEqual(\'10:00:382:000\');');
      expect(model.resolveIP(1000382000)).assertEqual('10:00:382:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000382000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000382000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000382000).length).assertEqual(13);');
      expect(model.resolveIP(1000382000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200003 end');
    })

    /**
     * @tc.name   testWlanVolume200004
     * @tc.number SUB_WLAN_VOLUME_20_0004
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200004 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000383000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'383\');');
      expect(result.split(':')[2]).assertEqual('383');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200004 end');
    })

    /**
     * @tc.name   testWlanVolume200005
     * @tc.number SUB_WLAN_VOLUME_20_0005
     * @tc.desc   Verify model.resolveIP(1000384000) equals \'10:00:384:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200005 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000384000)).assertEqual(\'10:00:384:000\');');
      expect(model.resolveIP(1000384000)).assertEqual('10:00:384:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000384000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000384000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000384000).length).assertEqual(13);');
      expect(model.resolveIP(1000384000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200005 end');
    })

    /**
     * @tc.name   testWlanVolume200006
     * @tc.number SUB_WLAN_VOLUME_20_0006
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200006 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000385000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'385\');');
      expect(result.split(':')[2]).assertEqual('385');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200006 end');
    })

    /**
     * @tc.name   testWlanVolume200007
     * @tc.number SUB_WLAN_VOLUME_20_0007
     * @tc.desc   Verify model.resolveIP(1000386000) equals \'10:00:386:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200007 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000386000)).assertEqual(\'10:00:386:000\');');
      expect(model.resolveIP(1000386000)).assertEqual('10:00:386:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000386000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000386000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000386000).length).assertEqual(13);');
      expect(model.resolveIP(1000386000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200007 end');
    })

    /**
     * @tc.name   testWlanVolume200008
     * @tc.number SUB_WLAN_VOLUME_20_0008
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200008 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000387000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'387\');');
      expect(result.split(':')[2]).assertEqual('387');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200008 end');
    })

    /**
     * @tc.name   testWlanVolume200009
     * @tc.number SUB_WLAN_VOLUME_20_0009
     * @tc.desc   Verify model.resolveIP(1000388000) equals \'10:00:388:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200009 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000388000)).assertEqual(\'10:00:388:000\');');
      expect(model.resolveIP(1000388000)).assertEqual('10:00:388:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000388000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000388000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000388000).length).assertEqual(13);');
      expect(model.resolveIP(1000388000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200009 end');
    })

    /**
     * @tc.name   testWlanVolume200010
     * @tc.number SUB_WLAN_VOLUME_20_0010
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200010 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000389000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'389\');');
      expect(result.split(':')[2]).assertEqual('389');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200010 end');
    })

    /**
     * @tc.name   testWlanVolume200011
     * @tc.number SUB_WLAN_VOLUME_20_0011
     * @tc.desc   Verify model.resolveIP(1000390000) equals \'10:00:390:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200011 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000390000)).assertEqual(\'10:00:390:000\');');
      expect(model.resolveIP(1000390000)).assertEqual('10:00:390:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000390000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000390000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000390000).length).assertEqual(13);');
      expect(model.resolveIP(1000390000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200011 end');
    })

    /**
     * @tc.name   testWlanVolume200012
     * @tc.number SUB_WLAN_VOLUME_20_0012
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200012 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000391000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'391\');');
      expect(result.split(':')[2]).assertEqual('391');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200012 end');
    })

    /**
     * @tc.name   testWlanVolume200013
     * @tc.number SUB_WLAN_VOLUME_20_0013
     * @tc.desc   Verify model.resolveIP(1000392000) equals \'10:00:392:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200013 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000392000)).assertEqual(\'10:00:392:000\');');
      expect(model.resolveIP(1000392000)).assertEqual('10:00:392:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000392000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000392000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000392000).length).assertEqual(13);');
      expect(model.resolveIP(1000392000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200013 end');
    })

    /**
     * @tc.name   testWlanVolume200014
     * @tc.number SUB_WLAN_VOLUME_20_0014
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200014 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000393000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'393\');');
      expect(result.split(':')[2]).assertEqual('393');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200014 end');
    })

    /**
     * @tc.name   testWlanVolume200015
     * @tc.number SUB_WLAN_VOLUME_20_0015
     * @tc.desc   Verify model.resolveIP(1000394000) equals \'10:00:394:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200015 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000394000)).assertEqual(\'10:00:394:000\');');
      expect(model.resolveIP(1000394000)).assertEqual('10:00:394:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000394000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000394000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000394000).length).assertEqual(13);');
      expect(model.resolveIP(1000394000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200015 end');
    })

    /**
     * @tc.name   testWlanVolume200016
     * @tc.number SUB_WLAN_VOLUME_20_0016
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200016 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000395000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'395\');');
      expect(result.split(':')[2]).assertEqual('395');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200016 end');
    })

    /**
     * @tc.name   testWlanVolume200017
     * @tc.number SUB_WLAN_VOLUME_20_0017
     * @tc.desc   Verify model.resolveIP(1000396000) equals \'10:00:396:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200017 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000396000)).assertEqual(\'10:00:396:000\');');
      expect(model.resolveIP(1000396000)).assertEqual('10:00:396:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000396000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000396000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000396000).length).assertEqual(13);');
      expect(model.resolveIP(1000396000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200017 end');
    })

    /**
     * @tc.name   testWlanVolume200018
     * @tc.number SUB_WLAN_VOLUME_20_0018
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200018 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000397000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'397\');');
      expect(result.split(':')[2]).assertEqual('397');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200018 end');
    })

    /**
     * @tc.name   testWlanVolume200019
     * @tc.number SUB_WLAN_VOLUME_20_0019
     * @tc.desc   Verify model.resolveIP(1000398000) equals \'10:00:398:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200019 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000398000)).assertEqual(\'10:00:398:000\');');
      expect(model.resolveIP(1000398000)).assertEqual('10:00:398:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000398000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000398000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000398000).length).assertEqual(13);');
      expect(model.resolveIP(1000398000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200019 end');
    })

    /**
     * @tc.name   testWlanVolume200020
     * @tc.number SUB_WLAN_VOLUME_20_0020
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume200020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200020 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000399000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'399\');');
      expect(result.split(':')[2]).assertEqual('399');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume200020 end');
    })
  })
}
