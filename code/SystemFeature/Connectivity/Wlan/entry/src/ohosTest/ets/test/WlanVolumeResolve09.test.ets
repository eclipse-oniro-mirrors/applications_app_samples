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

export default function wlanVolumeResolve09Test() {
  describe('WlanVolumeResolve09Test', () => {

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0001
     * @tc.number SUB_WLAN_VOLUME_09_0001
     * @tc.desc   Verify model.resolveIP(1000160000) equals \'10:00:160:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0001 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000160000)), String('10:00:160:000'));
      expect(model.resolveIP(1000160000)).assertEqual('10:00:160:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000160000).split(':').length), String(4));
      expect(model.resolveIP(1000160000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000160000).length), String(13));
      expect(model.resolveIP(1000160000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0002
     * @tc.number SUB_WLAN_VOLUME_09_0002
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0002 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000161000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('161'));
      expect(result.split(':')[2]).assertEqual('161');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0003
     * @tc.number SUB_WLAN_VOLUME_09_0003
     * @tc.desc   Verify model.resolveIP(1000162000) equals \'10:00:162:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0003 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000162000)), String('10:00:162:000'));
      expect(model.resolveIP(1000162000)).assertEqual('10:00:162:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000162000).split(':').length), String(4));
      expect(model.resolveIP(1000162000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000162000).length), String(13));
      expect(model.resolveIP(1000162000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0004
     * @tc.number SUB_WLAN_VOLUME_09_0004
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0004 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000163000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('163'));
      expect(result.split(':')[2]).assertEqual('163');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0005
     * @tc.number SUB_WLAN_VOLUME_09_0005
     * @tc.desc   Verify model.resolveIP(1000164000) equals \'10:00:164:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0005 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000164000)), String('10:00:164:000'));
      expect(model.resolveIP(1000164000)).assertEqual('10:00:164:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000164000).split(':').length), String(4));
      expect(model.resolveIP(1000164000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000164000).length), String(13));
      expect(model.resolveIP(1000164000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0006
     * @tc.number SUB_WLAN_VOLUME_09_0006
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0006 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000165000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('165'));
      expect(result.split(':')[2]).assertEqual('165');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0006 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0007
     * @tc.number SUB_WLAN_VOLUME_09_0007
     * @tc.desc   Verify model.resolveIP(1000166000) equals \'10:00:166:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0007 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000166000)), String('10:00:166:000'));
      expect(model.resolveIP(1000166000)).assertEqual('10:00:166:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000166000).split(':').length), String(4));
      expect(model.resolveIP(1000166000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000166000).length), String(13));
      expect(model.resolveIP(1000166000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0007 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0008
     * @tc.number SUB_WLAN_VOLUME_09_0008
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0008 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000167000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('167'));
      expect(result.split(':')[2]).assertEqual('167');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0008 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0009
     * @tc.number SUB_WLAN_VOLUME_09_0009
     * @tc.desc   Verify model.resolveIP(1000168000) equals \'10:00:168:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0009 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000168000)), String('10:00:168:000'));
      expect(model.resolveIP(1000168000)).assertEqual('10:00:168:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000168000).split(':').length), String(4));
      expect(model.resolveIP(1000168000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000168000).length), String(13));
      expect(model.resolveIP(1000168000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0009 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0010
     * @tc.number SUB_WLAN_VOLUME_09_0010
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0010 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000169000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('169'));
      expect(result.split(':')[2]).assertEqual('169');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0010 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0011
     * @tc.number SUB_WLAN_VOLUME_09_0011
     * @tc.desc   Verify model.resolveIP(1000170000) equals \'10:00:170:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0011 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000170000)), String('10:00:170:000'));
      expect(model.resolveIP(1000170000)).assertEqual('10:00:170:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000170000).split(':').length), String(4));
      expect(model.resolveIP(1000170000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000170000).length), String(13));
      expect(model.resolveIP(1000170000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0011 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0012
     * @tc.number SUB_WLAN_VOLUME_09_0012
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0012 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000171000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('171'));
      expect(result.split(':')[2]).assertEqual('171');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0012 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0013
     * @tc.number SUB_WLAN_VOLUME_09_0013
     * @tc.desc   Verify model.resolveIP(1000172000) equals \'10:00:172:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0013 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000172000)), String('10:00:172:000'));
      expect(model.resolveIP(1000172000)).assertEqual('10:00:172:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000172000).split(':').length), String(4));
      expect(model.resolveIP(1000172000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000172000).length), String(13));
      expect(model.resolveIP(1000172000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0013 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0014
     * @tc.number SUB_WLAN_VOLUME_09_0014
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0014 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000173000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('173'));
      expect(result.split(':')[2]).assertEqual('173');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0014 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0015
     * @tc.number SUB_WLAN_VOLUME_09_0015
     * @tc.desc   Verify model.resolveIP(1000174000) equals \'10:00:174:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0015 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000174000)), String('10:00:174:000'));
      expect(model.resolveIP(1000174000)).assertEqual('10:00:174:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000174000).split(':').length), String(4));
      expect(model.resolveIP(1000174000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000174000).length), String(13));
      expect(model.resolveIP(1000174000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0015 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0016
     * @tc.number SUB_WLAN_VOLUME_09_0016
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0016 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000175000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('175'));
      expect(result.split(':')[2]).assertEqual('175');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0016 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0017
     * @tc.number SUB_WLAN_VOLUME_09_0017
     * @tc.desc   Verify model.resolveIP(1000176000) equals \'10:00:176:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0017 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000176000)), String('10:00:176:000'));
      expect(model.resolveIP(1000176000)).assertEqual('10:00:176:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000176000).split(':').length), String(4));
      expect(model.resolveIP(1000176000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000176000).length), String(13));
      expect(model.resolveIP(1000176000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0017 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0018
     * @tc.number SUB_WLAN_VOLUME_09_0018
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0018 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000177000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('177'));
      expect(result.split(':')[2]).assertEqual('177');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0018 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0019
     * @tc.number SUB_WLAN_VOLUME_09_0019
     * @tc.desc   Verify model.resolveIP(1000178000) equals \'10:00:178:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0019 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000178000)), String('10:00:178:000'));
      expect(model.resolveIP(1000178000)).assertEqual('10:00:178:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000178000).split(':').length), String(4));
      expect(model.resolveIP(1000178000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000178000).length), String(13));
      expect(model.resolveIP(1000178000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0019 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve09_0020
     * @tc.number SUB_WLAN_VOLUME_09_0020
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve09_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0020 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000179000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('179'));
      expect(result.split(':')[2]).assertEqual('179');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve09_0020 end');
    })
  })
}
