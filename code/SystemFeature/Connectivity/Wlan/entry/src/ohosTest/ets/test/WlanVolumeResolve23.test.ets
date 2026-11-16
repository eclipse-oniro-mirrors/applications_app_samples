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

export default function wlanVolumeResolve23Test() {
  describe('WlanVolumeResolve23Test', () => {

    /**
     * @tc.name   testWlanVolume230001
     * @tc.number SUB_WLAN_VOLUME_23_0001
     * @tc.desc   Verify model.resolveIP(1000440000) equals \'10:00:440:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230001 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000440000)).assertEqual(\'10:00:440:000\');');
      expect(model.resolveIP(1000440000)).assertEqual('10:00:440:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000440000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000440000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000440000).length).assertEqual(13);');
      expect(model.resolveIP(1000440000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230001 end');
    })

    /**
     * @tc.name   testWlanVolume230002
     * @tc.number SUB_WLAN_VOLUME_23_0002
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230002 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000441000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'441\');');
      expect(result.split(':')[2]).assertEqual('441');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230002 end');
    })

    /**
     * @tc.name   testWlanVolume230003
     * @tc.number SUB_WLAN_VOLUME_23_0003
     * @tc.desc   Verify model.resolveIP(1000442000) equals \'10:00:442:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230003 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000442000)).assertEqual(\'10:00:442:000\');');
      expect(model.resolveIP(1000442000)).assertEqual('10:00:442:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000442000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000442000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000442000).length).assertEqual(13);');
      expect(model.resolveIP(1000442000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230003 end');
    })

    /**
     * @tc.name   testWlanVolume230004
     * @tc.number SUB_WLAN_VOLUME_23_0004
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230004 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000443000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'443\');');
      expect(result.split(':')[2]).assertEqual('443');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230004 end');
    })

    /**
     * @tc.name   testWlanVolume230005
     * @tc.number SUB_WLAN_VOLUME_23_0005
     * @tc.desc   Verify model.resolveIP(1000444000) equals \'10:00:444:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230005 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000444000)).assertEqual(\'10:00:444:000\');');
      expect(model.resolveIP(1000444000)).assertEqual('10:00:444:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000444000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000444000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000444000).length).assertEqual(13);');
      expect(model.resolveIP(1000444000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230005 end');
    })

    /**
     * @tc.name   testWlanVolume230006
     * @tc.number SUB_WLAN_VOLUME_23_0006
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230006 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000445000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'445\');');
      expect(result.split(':')[2]).assertEqual('445');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230006 end');
    })

    /**
     * @tc.name   testWlanVolume230007
     * @tc.number SUB_WLAN_VOLUME_23_0007
     * @tc.desc   Verify model.resolveIP(1000446000) equals \'10:00:446:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230007 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000446000)).assertEqual(\'10:00:446:000\');');
      expect(model.resolveIP(1000446000)).assertEqual('10:00:446:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000446000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000446000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000446000).length).assertEqual(13);');
      expect(model.resolveIP(1000446000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230007 end');
    })

    /**
     * @tc.name   testWlanVolume230008
     * @tc.number SUB_WLAN_VOLUME_23_0008
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230008 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000447000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'447\');');
      expect(result.split(':')[2]).assertEqual('447');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230008 end');
    })

    /**
     * @tc.name   testWlanVolume230009
     * @tc.number SUB_WLAN_VOLUME_23_0009
     * @tc.desc   Verify model.resolveIP(1000448000) equals \'10:00:448:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230009 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000448000)).assertEqual(\'10:00:448:000\');');
      expect(model.resolveIP(1000448000)).assertEqual('10:00:448:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000448000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000448000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000448000).length).assertEqual(13);');
      expect(model.resolveIP(1000448000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230009 end');
    })

    /**
     * @tc.name   testWlanVolume230010
     * @tc.number SUB_WLAN_VOLUME_23_0010
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230010 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000449000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'449\');');
      expect(result.split(':')[2]).assertEqual('449');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230010 end');
    })

    /**
     * @tc.name   testWlanVolume230011
     * @tc.number SUB_WLAN_VOLUME_23_0011
     * @tc.desc   Verify model.resolveIP(1000450000) equals \'10:00:450:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230011 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000450000)).assertEqual(\'10:00:450:000\');');
      expect(model.resolveIP(1000450000)).assertEqual('10:00:450:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000450000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000450000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000450000).length).assertEqual(13);');
      expect(model.resolveIP(1000450000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230011 end');
    })

    /**
     * @tc.name   testWlanVolume230012
     * @tc.number SUB_WLAN_VOLUME_23_0012
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230012 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000451000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'451\');');
      expect(result.split(':')[2]).assertEqual('451');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230012 end');
    })

    /**
     * @tc.name   testWlanVolume230013
     * @tc.number SUB_WLAN_VOLUME_23_0013
     * @tc.desc   Verify model.resolveIP(1000452000) equals \'10:00:452:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230013 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000452000)).assertEqual(\'10:00:452:000\');');
      expect(model.resolveIP(1000452000)).assertEqual('10:00:452:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000452000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000452000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000452000).length).assertEqual(13);');
      expect(model.resolveIP(1000452000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230013 end');
    })

    /**
     * @tc.name   testWlanVolume230014
     * @tc.number SUB_WLAN_VOLUME_23_0014
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230014 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000453000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'453\');');
      expect(result.split(':')[2]).assertEqual('453');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230014 end');
    })

    /**
     * @tc.name   testWlanVolume230015
     * @tc.number SUB_WLAN_VOLUME_23_0015
     * @tc.desc   Verify model.resolveIP(1000454000) equals \'10:00:454:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230015 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000454000)).assertEqual(\'10:00:454:000\');');
      expect(model.resolveIP(1000454000)).assertEqual('10:00:454:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000454000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000454000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000454000).length).assertEqual(13);');
      expect(model.resolveIP(1000454000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230015 end');
    })

    /**
     * @tc.name   testWlanVolume230016
     * @tc.number SUB_WLAN_VOLUME_23_0016
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230016 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000455000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'455\');');
      expect(result.split(':')[2]).assertEqual('455');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230016 end');
    })

    /**
     * @tc.name   testWlanVolume230017
     * @tc.number SUB_WLAN_VOLUME_23_0017
     * @tc.desc   Verify model.resolveIP(1000456000) equals \'10:00:456:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230017 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000456000)).assertEqual(\'10:00:456:000\');');
      expect(model.resolveIP(1000456000)).assertEqual('10:00:456:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000456000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000456000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000456000).length).assertEqual(13);');
      expect(model.resolveIP(1000456000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230017 end');
    })

    /**
     * @tc.name   testWlanVolume230018
     * @tc.number SUB_WLAN_VOLUME_23_0018
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230018 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000457000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'457\');');
      expect(result.split(':')[2]).assertEqual('457');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230018 end');
    })

    /**
     * @tc.name   testWlanVolume230019
     * @tc.number SUB_WLAN_VOLUME_23_0019
     * @tc.desc   Verify model.resolveIP(1000458000) equals \'10:00:458:000\'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230019 begin');
      const model: WifiModel = new WifiModel();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000458000)).assertEqual(\'10:00:458:000\');');
      expect(model.resolveIP(1000458000)).assertEqual('10:00:458:000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000458000).split(\':\').length).assertEqual(4);');
      expect(model.resolveIP(1000458000).split(':').length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(model.resolveIP(1000458000).length).assertEqual(13);');
      expect(model.resolveIP(1000458000).length).assertEqual(13);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230019 end');
    })

    /**
     * @tc.name   testWlanVolume230020
     * @tc.number SUB_WLAN_VOLUME_23_0020
     * @tc.desc   Verify result.startsWith(\'10\').
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWlanVolume230020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230020 begin');
      const model: WifiModel = new WifiModel();
      const result: string = model.resolveIP(1000459000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.startsWith(\'10\')).assertTrue();');
      expect(result.startsWith('10')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.endsWith(\'000\')).assertTrue();');
      expect(result.endsWith('000')).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(result.split(\':\')[2]).assertEqual(\'459\');');
      expect(result.split(':')[2]).assertEqual('459');
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testWlanVolume230020 end');
    })
  })
}
