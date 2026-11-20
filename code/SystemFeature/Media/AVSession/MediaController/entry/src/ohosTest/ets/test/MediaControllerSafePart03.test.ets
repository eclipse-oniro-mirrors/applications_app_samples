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
import { avSession as AVSessionManager } from '@kit.AVSessionKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function mediaControllerSafeTestPart03() {
  describe('MediaControllerSafePart03', () => {
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0187
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0187
     * @tc.desc   Verify Map entry 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0187 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-027', 'safe-value-027');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-027')), String('safe-value-027'));
      expect(map.get('safe-key-027') === 'safe-value-027').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-027')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0187 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0188
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0188
     * @tc.desc   Verify Map entry 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0188 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-028', 'safe-value-028');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-028')), String('safe-value-028'));
      expect(map.get('safe-key-028') === 'safe-value-028').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-028')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0188 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0189
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0189
     * @tc.desc   Verify Map entry 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0189 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-029', 'safe-value-029');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-029')), String('safe-value-029'));
      expect(map.get('safe-key-029') === 'safe-value-029').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-029')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0189 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0190
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0190
     * @tc.desc   Verify Map entry 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0190 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-030', 'safe-value-030');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-030')), String('safe-value-030'));
      expect(map.get('safe-key-030') === 'safe-value-030').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-030')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0190 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0191
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0191
     * @tc.desc   Verify Map entry 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0191 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-031', 'safe-value-031');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-031')), String('safe-value-031'));
      expect(map.get('safe-key-031') === 'safe-value-031').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-031')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0191 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0192
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0192
     * @tc.desc   Verify Map entry 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0192 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-032', 'safe-value-032');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-032')), String('safe-value-032'));
      expect(map.get('safe-key-032') === 'safe-value-032').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-032')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0192 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0193
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0193
     * @tc.desc   Verify Map entry 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0193 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-033', 'safe-value-033');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-033')), String('safe-value-033'));
      expect(map.get('safe-key-033') === 'safe-value-033').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-033')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0193 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0194
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0194
     * @tc.desc   Verify Map entry 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0194 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-034', 'safe-value-034');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-034')), String('safe-value-034'));
      expect(map.get('safe-key-034') === 'safe-value-034').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-034')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0194 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0195
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0195
     * @tc.desc   Verify Map entry 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0195 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-035', 'safe-value-035');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-035')), String('safe-value-035'));
      expect(map.get('safe-key-035') === 'safe-value-035').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-035')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0195 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0196
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0196
     * @tc.desc   Verify Map entry 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0196 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-036', 'safe-value-036');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-036')), String('safe-value-036'));
      expect(map.get('safe-key-036') === 'safe-value-036').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-036')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0196 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0197
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0197
     * @tc.desc   Verify Map entry 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0197 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-037', 'safe-value-037');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-037')), String('safe-value-037'));
      expect(map.get('safe-key-037') === 'safe-value-037').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-037')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0197 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0198
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0198
     * @tc.desc   Verify Map entry 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0198 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-038', 'safe-value-038');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-038')), String('safe-value-038'));
      expect(map.get('safe-key-038') === 'safe-value-038').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-038')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0198 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0199
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0199
     * @tc.desc   Verify Map entry 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0199 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-039', 'safe-value-039');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-039')), String('safe-value-039'));
      expect(map.get('safe-key-039') === 'safe-value-039').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-039')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0199 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0200
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0200
     * @tc.desc   Verify Map entry 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0200 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-040', 'safe-value-040');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-040')), String('safe-value-040'));
      expect(map.get('safe-key-040') === 'safe-value-040').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-040')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0200 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0201
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0201
     * @tc.desc   Verify Map entry 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0201 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-041', 'safe-value-041');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-041')), String('safe-value-041'));
      expect(map.get('safe-key-041') === 'safe-value-041').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-041')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0201 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0202
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0202
     * @tc.desc   Verify Map entry 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0202 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-042', 'safe-value-042');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-042')), String('safe-value-042'));
      expect(map.get('safe-key-042') === 'safe-value-042').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-042')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0202 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0203
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0203
     * @tc.desc   Verify Map entry 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0203 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-043', 'safe-value-043');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-043')), String('safe-value-043'));
      expect(map.get('safe-key-043') === 'safe-value-043').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-043')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0203 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0204
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0204
     * @tc.desc   Verify Map entry 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0204 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-044', 'safe-value-044');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-044')), String('safe-value-044'));
      expect(map.get('safe-key-044') === 'safe-value-044').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-044')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0204 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0205
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0205
     * @tc.desc   Verify Map entry 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0205 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-045', 'safe-value-045');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-045')), String('safe-value-045'));
      expect(map.get('safe-key-045') === 'safe-value-045').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-045')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0205 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0206
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0206
     * @tc.desc   Verify Map entry 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0206 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-046', 'safe-value-046');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-046')), String('safe-value-046'));
      expect(map.get('safe-key-046') === 'safe-value-046').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-046')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0206 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0207
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0207
     * @tc.desc   Verify Map entry 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0207 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-047', 'safe-value-047');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-047')), String('safe-value-047'));
      expect(map.get('safe-key-047') === 'safe-value-047').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-047')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0207 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0208
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0208
     * @tc.desc   Verify Map entry 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0208 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-048', 'safe-value-048');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-048')), String('safe-value-048'));
      expect(map.get('safe-key-048') === 'safe-value-048').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-048')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0208 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0209
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0209
     * @tc.desc   Verify Map entry 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0209 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-049', 'safe-value-049');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-049')), String('safe-value-049'));
      expect(map.get('safe-key-049') === 'safe-value-049').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-049')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0209 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0210
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0210
     * @tc.desc   Verify Map entry 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0210 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-050', 'safe-value-050');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-050')), String('safe-value-050'));
      expect(map.get('safe-key-050') === 'safe-value-050').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-050')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0210 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0211
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0211
     * @tc.desc   Verify Map entry 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0211 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-051', 'safe-value-051');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-051')), String('safe-value-051'));
      expect(map.get('safe-key-051') === 'safe-value-051').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-051')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0211 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0212
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0212
     * @tc.desc   Verify Map entry 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0212 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-052', 'safe-value-052');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-052')), String('safe-value-052'));
      expect(map.get('safe-key-052') === 'safe-value-052').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-052')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0212 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0213
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0213
     * @tc.desc   Verify Map entry 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0213 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-053', 'safe-value-053');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-053')), String('safe-value-053'));
      expect(map.get('safe-key-053') === 'safe-value-053').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-053')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0213 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0214
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0214
     * @tc.desc   Verify Map entry 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0214 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-054', 'safe-value-054');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-054')), String('safe-value-054'));
      expect(map.get('safe-key-054') === 'safe-value-054').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-054')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0214 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0215
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0215
     * @tc.desc   Verify Map entry 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0215 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-055', 'safe-value-055');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-055')), String('safe-value-055'));
      expect(map.get('safe-key-055') === 'safe-value-055').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-055')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0215 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0216
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0216
     * @tc.desc   Verify Map entry 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0216 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-056', 'safe-value-056');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-056')), String('safe-value-056'));
      expect(map.get('safe-key-056') === 'safe-value-056').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-056')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0216 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0217
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0217
     * @tc.desc   Verify Map entry 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0217 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-057', 'safe-value-057');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-057')), String('safe-value-057'));
      expect(map.get('safe-key-057') === 'safe-value-057').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-057')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0217 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0218
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0218
     * @tc.desc   Verify Map entry 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0218 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-058', 'safe-value-058');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-058')), String('safe-value-058'));
      expect(map.get('safe-key-058') === 'safe-value-058').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-058')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0218 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0219
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0219
     * @tc.desc   Verify Map entry 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0219 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-059', 'safe-value-059');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-059')), String('safe-value-059'));
      expect(map.get('safe-key-059') === 'safe-value-059').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-059')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0219 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0220
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0220
     * @tc.desc   Verify Map entry 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0220 begin');
      const map: Map<string, string> = new Map();
      map.set('safe-key-060', 'safe-value-060');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%s', String(map.get('safe-key-060')), String('safe-value-060'));
      expect(map.get('safe-key-060') === 'safe-value-060').assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.delete('safe-key-060')).assertTrue();
      expect(map.size).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0220 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0221
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0221
     * @tc.desc   Verify playback state PREPARE (1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0221 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_PREPARE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 1);
      expect(state).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0221 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0222
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0222
     * @tc.desc   Verify playback state PLAY (2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0222 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 2);
      expect(state).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0222 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0223
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0223
     * @tc.desc   Verify playback state PAUSE (3).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0223 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 3);
      expect(state).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0223 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0224
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0224
     * @tc.desc   Verify playback state FAST_FORWARD (4).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0224 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_FAST_FORWARD;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 4);
      expect(state).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0224 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0225
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0225
     * @tc.desc   Verify playback state REWIND (5).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0225 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_REWIND;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 5);
      expect(state).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0225 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0226
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0226
     * @tc.desc   Verify playback state STOP (6).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0226 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_STOP;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 6);
      expect(state).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0226 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0227
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0227
     * @tc.desc   Verify playback state COMPLETED (7).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0227 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_COMPLETED;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 7);
      expect(state).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0227 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0228
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0228
     * @tc.desc   Verify playback state RELEASED (8).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0228 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_RELEASED;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 8);
      expect(state).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0228 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0229
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0229
     * @tc.desc   Verify playback state ERROR (9).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0229 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_ERROR;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 9);
      expect(state).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0229 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0230
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0230
     * @tc.desc   Verify playback state IDLE (10).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0230 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_IDLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 10);
      expect(state).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0230 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0231
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0231
     * @tc.desc   Verify playback state BUFFERING (11).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0231 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_BUFFERING;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 11);
      expect(state).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0231 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0232
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0232
     * @tc.desc   Verify playback state INITIAL (12).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0232 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_INITIAL;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 0);
      expect(state).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0232 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0233
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0233
     * @tc.desc   Verify playback state PREPARE (13).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0233 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_PREPARE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 1);
      expect(state).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0233 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0234
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0234
     * @tc.desc   Verify playback state PLAY (14).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0234 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 2);
      expect(state).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0234 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0235
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0235
     * @tc.desc   Verify playback state PAUSE (15).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0235 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 3);
      expect(state).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0235 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0236
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0236
     * @tc.desc   Verify playback state FAST_FORWARD (16).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0236 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_FAST_FORWARD;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 4);
      expect(state).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0236 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0237
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0237
     * @tc.desc   Verify playback state REWIND (17).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0237 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_REWIND;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 5);
      expect(state).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0237 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0238
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0238
     * @tc.desc   Verify playback state STOP (18).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0238 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_STOP;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 6);
      expect(state).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0238 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0239
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0239
     * @tc.desc   Verify playback state COMPLETED (19).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0239 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_COMPLETED;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 7);
      expect(state).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0239 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0240
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0240
     * @tc.desc   Verify playback state RELEASED (20).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0240 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_RELEASED;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 8);
      expect(state).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0240 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0241
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0241
     * @tc.desc   Verify playback state ERROR (21).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0241 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_ERROR;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 9);
      expect(state).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0241 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0242
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0242
     * @tc.desc   Verify playback state IDLE (22).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0242 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_IDLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 10);
      expect(state).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0242 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0243
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0243
     * @tc.desc   Verify playback state BUFFERING (23).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0243 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_BUFFERING;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 11);
      expect(state).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0243 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0244
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0244
     * @tc.desc   Verify playback state INITIAL (24).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0244 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_INITIAL;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 0);
      expect(state).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0244 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0245
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0245
     * @tc.desc   Verify playback state PREPARE (25).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0245 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_PREPARE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 1);
      expect(state).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0245 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0246
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0246
     * @tc.desc   Verify playback state PLAY (26).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0246 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 2);
      expect(state).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0246 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0247
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0247
     * @tc.desc   Verify playback state PAUSE (27).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0247 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 3);
      expect(state).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0247 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0248
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0248
     * @tc.desc   Verify playback state FAST_FORWARD (28).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0248 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_FAST_FORWARD;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 4);
      expect(state).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0248 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0249
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0249
     * @tc.desc   Verify playback state REWIND (29).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0249 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_REWIND;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 5);
      expect(state).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0249 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0250
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0250
     * @tc.desc   Verify playback state STOP (30).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0250 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_STOP;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 6);
      expect(state).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0250 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0251
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0251
     * @tc.desc   Verify playback state COMPLETED (31).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0251 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_COMPLETED;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 7);
      expect(state).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0251 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0252
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0252
     * @tc.desc   Verify playback state RELEASED (32).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0252 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_RELEASED;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 8);
      expect(state).assertEqual(8);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0252 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0253
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0253
     * @tc.desc   Verify playback state ERROR (33).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0253 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_ERROR;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 9);
      expect(state).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0253 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0254
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0254
     * @tc.desc   Verify playback state IDLE (34).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0254 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_IDLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 10);
      expect(state).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0254 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0255
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0255
     * @tc.desc   Verify playback state BUFFERING (35).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0255 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_BUFFERING;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 11);
      expect(state).assertEqual(11);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0255 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0256
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0256
     * @tc.desc   Verify playback state INITIAL (36).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0256 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_INITIAL;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 0);
      expect(state).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0256 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0257
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0257
     * @tc.desc   Verify playback state PREPARE (37).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0257 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_PREPARE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 1);
      expect(state).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0257 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0258
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0258
     * @tc.desc   Verify playback state PLAY (38).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0258 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 2);
      expect(state).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0258 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0259
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0259
     * @tc.desc   Verify playback state PAUSE (39).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0259 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 3);
      expect(state).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0259 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0260
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0260
     * @tc.desc   Verify playback state FAST_FORWARD (40).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0260 begin');
      const state: AVSessionManager.PlaybackState = AVSessionManager.PlaybackState.PLAYBACK_STATE_FAST_FORWARD;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', state, 4);
      expect(state).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0260 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0261
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0261
     * @tc.desc   Verify loop mode SINGLE (1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0261 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SINGLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 1);
      expect(mode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0261 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0262
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0262
     * @tc.desc   Verify loop mode LIST (2).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0262 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 2);
      expect(mode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0262 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0263
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0263
     * @tc.desc   Verify loop mode SHUFFLE (3).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0263 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 3);
      expect(mode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0263 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0264
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0264
     * @tc.desc   Verify loop mode CUSTOM (4).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0264 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_CUSTOM;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 4);
      expect(mode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0264 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0265
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0265
     * @tc.desc   Verify loop mode SEQUENCE (5).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0265 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 0);
      expect(mode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0265 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0266
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0266
     * @tc.desc   Verify loop mode SINGLE (6).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0266 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SINGLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 1);
      expect(mode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0266 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0267
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0267
     * @tc.desc   Verify loop mode LIST (7).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0267 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 2);
      expect(mode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0267 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0268
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0268
     * @tc.desc   Verify loop mode SHUFFLE (8).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0268 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 3);
      expect(mode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0268 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0269
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0269
     * @tc.desc   Verify loop mode CUSTOM (9).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0269 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_CUSTOM;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 4);
      expect(mode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0269 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0270
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0270
     * @tc.desc   Verify loop mode SEQUENCE (10).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0270 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 0);
      expect(mode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0270 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0271
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0271
     * @tc.desc   Verify loop mode SINGLE (11).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0271 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SINGLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 1);
      expect(mode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0271 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0272
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0272
     * @tc.desc   Verify loop mode LIST (12).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0272 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 2);
      expect(mode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0272 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0273
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0273
     * @tc.desc   Verify loop mode SHUFFLE (13).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0273 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 3);
      expect(mode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0273 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0274
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0274
     * @tc.desc   Verify loop mode CUSTOM (14).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0274 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_CUSTOM;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 4);
      expect(mode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0274 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0275
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0275
     * @tc.desc   Verify loop mode SEQUENCE (15).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0275 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 0);
      expect(mode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0275 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0276
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0276
     * @tc.desc   Verify loop mode SINGLE (16).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0276 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SINGLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 1);
      expect(mode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0276 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0277
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0277
     * @tc.desc   Verify loop mode LIST (17).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0277 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 2);
      expect(mode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0277 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0278
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0278
     * @tc.desc   Verify loop mode SHUFFLE (18).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0278 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 3);
      expect(mode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0278 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0279
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0279
     * @tc.desc   Verify loop mode CUSTOM (19).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0279 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_CUSTOM;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 4);
      expect(mode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0279 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0280
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0280
     * @tc.desc   Verify loop mode SEQUENCE (20).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0280 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 0);
      expect(mode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0280 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0281
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0281
     * @tc.desc   Verify loop mode SINGLE (21).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0281 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SINGLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 1);
      expect(mode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0281 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0282
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0282
     * @tc.desc   Verify loop mode LIST (22).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0282 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 2);
      expect(mode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0282 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0283
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0283
     * @tc.desc   Verify loop mode SHUFFLE (23).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0283 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 3);
      expect(mode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0283 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0284
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0284
     * @tc.desc   Verify loop mode CUSTOM (24).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0284 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_CUSTOM;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 4);
      expect(mode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0284 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0285
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0285
     * @tc.desc   Verify loop mode SEQUENCE (25).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0285 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 0);
      expect(mode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0285 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0286
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0286
     * @tc.desc   Verify loop mode SINGLE (26).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0286 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SINGLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 1);
      expect(mode).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0286 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0287
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0287
     * @tc.desc   Verify loop mode LIST (27).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0287 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 2);
      expect(mode).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0287 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0288
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0288
     * @tc.desc   Verify loop mode SHUFFLE (28).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0288 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SHUFFLE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 3);
      expect(mode).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0288 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0289
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0289
     * @tc.desc   Verify loop mode CUSTOM (29).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0289 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_CUSTOM;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 4);
      expect(mode).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0289 end');
    })
    /**
     * @tc.name   com.samples.mediacontroller_Safe_0290
     * @tc.number SUB_MEDIA_CONTROLLER_SAFE_0290
     * @tc.desc   Verify loop mode SEQUENCE (30).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('com.samples.mediacontroller_Safe_0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0290 begin');
      const mode: AVSessionManager.LoopMode = AVSessionManager.LoopMode.LOOP_MODE_SEQUENCE;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', mode, 0);
      expect(mode).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.samples.mediacontroller_Safe_0290 end');
    })
  })
}
