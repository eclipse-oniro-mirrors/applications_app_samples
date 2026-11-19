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

export default function wlanVolumeResolve07Test() {
  describe('WlanVolumeResolve07Test', () => {

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0001
     * @tc.number SUB_WLAN_VOLUME_07_0001
     * @tc.desc   Verify model.resolveIP(1000120000) equals \'10:00:120:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0001 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000120000)), String('10:00:120:000'));
      expect(model.resolveIP(1000120000)).assertEqual('10:00:120:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000120000).split(':').length), String(4));
      expect(model.resolveIP(1000120000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000120000).length), String(13));
      expect(model.resolveIP(1000120000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0001 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0002
     * @tc.number SUB_WLAN_VOLUME_07_0002
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0002 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000121000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('121'));
      expect(result.split(':')[2]).assertEqual('121');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0002 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0003
     * @tc.number SUB_WLAN_VOLUME_07_0003
     * @tc.desc   Verify model.resolveIP(1000122000) equals \'10:00:122:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0003 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000122000)), String('10:00:122:000'));
      expect(model.resolveIP(1000122000)).assertEqual('10:00:122:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000122000).split(':').length), String(4));
      expect(model.resolveIP(1000122000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000122000).length), String(13));
      expect(model.resolveIP(1000122000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0003 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0004
     * @tc.number SUB_WLAN_VOLUME_07_0004
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0004 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000123000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('123'));
      expect(result.split(':')[2]).assertEqual('123');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0004 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0005
     * @tc.number SUB_WLAN_VOLUME_07_0005
     * @tc.desc   Verify model.resolveIP(1000124000) equals \'10:00:124:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0005 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000124000)), String('10:00:124:000'));
      expect(model.resolveIP(1000124000)).assertEqual('10:00:124:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000124000).split(':').length), String(4));
      expect(model.resolveIP(1000124000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000124000).length), String(13));
      expect(model.resolveIP(1000124000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0005 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0006
     * @tc.number SUB_WLAN_VOLUME_07_0006
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0006 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000125000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('125'));
      expect(result.split(':')[2]).assertEqual('125');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0006 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0007
     * @tc.number SUB_WLAN_VOLUME_07_0007
     * @tc.desc   Verify model.resolveIP(1000126000) equals \'10:00:126:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0007 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000126000)), String('10:00:126:000'));
      expect(model.resolveIP(1000126000)).assertEqual('10:00:126:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000126000).split(':').length), String(4));
      expect(model.resolveIP(1000126000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000126000).length), String(13));
      expect(model.resolveIP(1000126000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0007 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0008
     * @tc.number SUB_WLAN_VOLUME_07_0008
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0008 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000127000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('127'));
      expect(result.split(':')[2]).assertEqual('127');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0008 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0009
     * @tc.number SUB_WLAN_VOLUME_07_0009
     * @tc.desc   Verify model.resolveIP(1000128000) equals \'10:00:128:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0009 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000128000)), String('10:00:128:000'));
      expect(model.resolveIP(1000128000)).assertEqual('10:00:128:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000128000).split(':').length), String(4));
      expect(model.resolveIP(1000128000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000128000).length), String(13));
      expect(model.resolveIP(1000128000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0009 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0010
     * @tc.number SUB_WLAN_VOLUME_07_0010
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0010 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000129000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('129'));
      expect(result.split(':')[2]).assertEqual('129');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0010 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0011
     * @tc.number SUB_WLAN_VOLUME_07_0011
     * @tc.desc   Verify model.resolveIP(1000130000) equals \'10:00:130:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0011 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000130000)), String('10:00:130:000'));
      expect(model.resolveIP(1000130000)).assertEqual('10:00:130:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000130000).split(':').length), String(4));
      expect(model.resolveIP(1000130000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000130000).length), String(13));
      expect(model.resolveIP(1000130000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0011 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0012
     * @tc.number SUB_WLAN_VOLUME_07_0012
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0012 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000131000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('131'));
      expect(result.split(':')[2]).assertEqual('131');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0012 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0013
     * @tc.number SUB_WLAN_VOLUME_07_0013
     * @tc.desc   Verify model.resolveIP(1000132000) equals \'10:00:132:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0013 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000132000)), String('10:00:132:000'));
      expect(model.resolveIP(1000132000)).assertEqual('10:00:132:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000132000).split(':').length), String(4));
      expect(model.resolveIP(1000132000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000132000).length), String(13));
      expect(model.resolveIP(1000132000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0013 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0014
     * @tc.number SUB_WLAN_VOLUME_07_0014
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0014 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000133000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('133'));
      expect(result.split(':')[2]).assertEqual('133');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0014 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0015
     * @tc.number SUB_WLAN_VOLUME_07_0015
     * @tc.desc   Verify model.resolveIP(1000134000) equals \'10:00:134:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0015 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000134000)), String('10:00:134:000'));
      expect(model.resolveIP(1000134000)).assertEqual('10:00:134:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000134000).split(':').length), String(4));
      expect(model.resolveIP(1000134000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000134000).length), String(13));
      expect(model.resolveIP(1000134000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0015 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0016
     * @tc.number SUB_WLAN_VOLUME_07_0016
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0016 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000135000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('135'));
      expect(result.split(':')[2]).assertEqual('135');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0016 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0017
     * @tc.number SUB_WLAN_VOLUME_07_0017
     * @tc.desc   Verify model.resolveIP(1000136000) equals \'10:00:136:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0017 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000136000)), String('10:00:136:000'));
      expect(model.resolveIP(1000136000)).assertEqual('10:00:136:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000136000).split(':').length), String(4));
      expect(model.resolveIP(1000136000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000136000).length), String(13));
      expect(model.resolveIP(1000136000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0017 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0018
     * @tc.number SUB_WLAN_VOLUME_07_0018
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0018 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000137000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('137'));
      expect(result.split(':')[2]).assertEqual('137');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0018 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0019
     * @tc.number SUB_WLAN_VOLUME_07_0019
     * @tc.desc   Verify model.resolveIP(1000138000) equals \'10:00:138:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0019 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000138000)), String('10:00:138:000'));
      expect(model.resolveIP(1000138000)).assertEqual('10:00:138:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000138000).split(':').length), String(4));
      expect(model.resolveIP(1000138000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(model.resolveIP(1000138000).length), String(13));
      expect(model.resolveIP(1000138000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0019 end');
    })

    /**
     * @tc.name   ohos.samples.wlan_VolumeResolve07_0020
     * @tc.number SUB_WLAN_VOLUME_07_0020
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.wlan_VolumeResolve07_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0020 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000139000);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.startsWith('10')));
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result.endsWith('000')));
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.split(':')[2]), String('139'));
      expect(result.split(':')[2]).assertEqual('139');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.wlan_VolumeResolve07_0020 end');
    })
  })
}
