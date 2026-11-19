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

export default function wlanVolumeResolve14Test() {
  describe('WlanVolumeResolve14Test', () => {

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0001
     * @tc.number SUB_WLAN_VOLUME_14_0001
     * @tc.desc   Verify model.resolveIP(1000260000) equals \'10:00:260:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0001 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000260000)), String('10:00:260:000'));
      expect(model.resolveIP(1000260000)).assertEqual('10:00:260:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000260000).split(':').length), String(4));
      expect(model.resolveIP(1000260000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000260000).length), String(13));
      expect(model.resolveIP(1000260000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0002
     * @tc.number SUB_WLAN_VOLUME_14_0002
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0002 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000261000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('261'));
      expect(result.split(':')[2]).assertEqual('261');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0003
     * @tc.number SUB_WLAN_VOLUME_14_0003
     * @tc.desc   Verify model.resolveIP(1000262000) equals \'10:00:262:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0003 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000262000)), String('10:00:262:000'));
      expect(model.resolveIP(1000262000)).assertEqual('10:00:262:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000262000).split(':').length), String(4));
      expect(model.resolveIP(1000262000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000262000).length), String(13));
      expect(model.resolveIP(1000262000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0004
     * @tc.number SUB_WLAN_VOLUME_14_0004
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0004 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000263000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('263'));
      expect(result.split(':')[2]).assertEqual('263');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0005
     * @tc.number SUB_WLAN_VOLUME_14_0005
     * @tc.desc   Verify model.resolveIP(1000264000) equals \'10:00:264:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0005 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000264000)), String('10:00:264:000'));
      expect(model.resolveIP(1000264000)).assertEqual('10:00:264:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000264000).split(':').length), String(4));
      expect(model.resolveIP(1000264000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000264000).length), String(13));
      expect(model.resolveIP(1000264000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0006
     * @tc.number SUB_WLAN_VOLUME_14_0006
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0006 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000265000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('265'));
      expect(result.split(':')[2]).assertEqual('265');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0006 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0007
     * @tc.number SUB_WLAN_VOLUME_14_0007
     * @tc.desc   Verify model.resolveIP(1000266000) equals \'10:00:266:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0007 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000266000)), String('10:00:266:000'));
      expect(model.resolveIP(1000266000)).assertEqual('10:00:266:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000266000).split(':').length), String(4));
      expect(model.resolveIP(1000266000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000266000).length), String(13));
      expect(model.resolveIP(1000266000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0007 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0008
     * @tc.number SUB_WLAN_VOLUME_14_0008
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0008 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000267000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('267'));
      expect(result.split(':')[2]).assertEqual('267');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0008 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0009
     * @tc.number SUB_WLAN_VOLUME_14_0009
     * @tc.desc   Verify model.resolveIP(1000268000) equals \'10:00:268:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0009 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000268000)), String('10:00:268:000'));
      expect(model.resolveIP(1000268000)).assertEqual('10:00:268:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000268000).split(':').length), String(4));
      expect(model.resolveIP(1000268000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000268000).length), String(13));
      expect(model.resolveIP(1000268000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0009 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0010
     * @tc.number SUB_WLAN_VOLUME_14_0010
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0010 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000269000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('269'));
      expect(result.split(':')[2]).assertEqual('269');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0010 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0011
     * @tc.number SUB_WLAN_VOLUME_14_0011
     * @tc.desc   Verify model.resolveIP(1000270000) equals \'10:00:270:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0011 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000270000)), String('10:00:270:000'));
      expect(model.resolveIP(1000270000)).assertEqual('10:00:270:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000270000).split(':').length), String(4));
      expect(model.resolveIP(1000270000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000270000).length), String(13));
      expect(model.resolveIP(1000270000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0011 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0012
     * @tc.number SUB_WLAN_VOLUME_14_0012
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0012 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000271000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('271'));
      expect(result.split(':')[2]).assertEqual('271');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0012 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0013
     * @tc.number SUB_WLAN_VOLUME_14_0013
     * @tc.desc   Verify model.resolveIP(1000272000) equals \'10:00:272:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0013 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000272000)), String('10:00:272:000'));
      expect(model.resolveIP(1000272000)).assertEqual('10:00:272:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000272000).split(':').length), String(4));
      expect(model.resolveIP(1000272000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000272000).length), String(13));
      expect(model.resolveIP(1000272000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0013 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0014
     * @tc.number SUB_WLAN_VOLUME_14_0014
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0014 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000273000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('273'));
      expect(result.split(':')[2]).assertEqual('273');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0014 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0015
     * @tc.number SUB_WLAN_VOLUME_14_0015
     * @tc.desc   Verify model.resolveIP(1000274000) equals \'10:00:274:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0015 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000274000)), String('10:00:274:000'));
      expect(model.resolveIP(1000274000)).assertEqual('10:00:274:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000274000).split(':').length), String(4));
      expect(model.resolveIP(1000274000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000274000).length), String(13));
      expect(model.resolveIP(1000274000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0015 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0016
     * @tc.number SUB_WLAN_VOLUME_14_0016
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0016 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000275000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('275'));
      expect(result.split(':')[2]).assertEqual('275');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0016 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0017
     * @tc.number SUB_WLAN_VOLUME_14_0017
     * @tc.desc   Verify model.resolveIP(1000276000) equals \'10:00:276:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0017 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000276000)), String('10:00:276:000'));
      expect(model.resolveIP(1000276000)).assertEqual('10:00:276:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000276000).split(':').length), String(4));
      expect(model.resolveIP(1000276000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000276000).length), String(13));
      expect(model.resolveIP(1000276000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0017 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0018
     * @tc.number SUB_WLAN_VOLUME_14_0018
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0018 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000277000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('277'));
      expect(result.split(':')[2]).assertEqual('277');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0018 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0019
     * @tc.number SUB_WLAN_VOLUME_14_0019
     * @tc.desc   Verify model.resolveIP(1000278000) equals \'10:00:278:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0019 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000278000)), String('10:00:278:000'));
      expect(model.resolveIP(1000278000)).assertEqual('10:00:278:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000278000).split(':').length), String(4));
      expect(model.resolveIP(1000278000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000278000).length), String(13));
      expect(model.resolveIP(1000278000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0019 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve14_0020
     * @tc.number SUB_WLAN_VOLUME_14_0020
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve14_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0020 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000279000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('279'));
      expect(result.split(':')[2]).assertEqual('279');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve14_0020 end');
    })
  })
}
